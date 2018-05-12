ALTER procedure cariPromoTerbesar
	@paramToppingPesanan varchar(200)
as
	declare @pesanan table(
		idTopping int
	)

	--menyimpan semua id toping yang dipilih ke @tbl_topping_dipilih
	insert into @pesanan
	select 
		id
	from
		dbo.splitId(@paramToppingPesanan) --memanggil fungsi split untuk mengubah string input ke tabel

	--Menyimpan harga topping pesanan
	declare @hargaToppingPesanan table(
		idTopping int,
		harga int
	)
	insert into @hargaToppingPesanan
	select
		id, price
	from
		@pesanan as pesanan join topping
	on
		pesanan.idTopping = Topping.id

	--tabel yang menyimpan toping dan promo yang aktif
	declare @topingPromoAktif table(
		idTopping int,
		idPromo int,
		discount int
	)
	insert into @topingPromoAktif
		select 
			topping_id,promo_id,discount
		from 
			promo join ToppingPromo
		on
			Promo.ID = promo_id
		where 
			promo_status = 1

	--tabel yang menyimpan promo aktif yang tidak dapat digunakan di pemesanan ini
	declare @promoInvalid table(
		idPromo int
	)
	--mencari promo yang tidak dapat digunakan
	insert into @promoInvalid
		select distinct 
			idPromo 
		from 
			@topingPromoAktif
		where 
			idTopping not in(select idTopping from @pesanan)

	--tabel yang menyimpan promo yang dapat digunakan dalam pemesanan ini
	declare @promoValid table(
		idTopping int,
		idPromo int,
		hargaAkhir int
	)
	--mencari promo yang dapat digunakan berdasar promo yang tidak dapat digunakan
	insert into @promoValid
		select 
			promoAktif.idTopping, idPromo, harga - (harga* promoAktif.discount)/100
		from
			@topingPromoAktif as promoAktif join @hargaToppingPesanan as pesanan
		on
			promoAktif.idTopping = pesanan.idTopping
		where
			idPromo not in(select idPromo from @promoInvalid)


	--tabel yang menyimpan nilai diskon akhir tiap-tiap item
	declare @diskonAkhir table(
		idTopping int,
		idPromo int,
		hargaAkhir int
	)

	declare @tempDiskonAkhir table(
		idTopping int,
		idPromo int,
		hargaAkhir int
	)

	declare	cursorPromoValid cursor
	for
		select	
			idTopping,idPromo,hargaAkhir
		from
			@promoValid
		order by
			idPromo asc,
			idTopping asc

	declare @curTopping int,
			@curPromo int,
			@curHarga int,
			@total int,
			@tempTotal int,
			@tempSisa int

	set @total = 2147483647

	open cursorPromoValid
		fetch next fromcursorPromoValid
		into@curTopping,@curPromo,@curHarga

		while (@@FETCH_STATUS=0)
		begin
			delete from @tempDiskonAkhir
			--memasukkan kombinasi topping yang tidak boleh hilang pada cursor berikutnya
			Insert into @tempDiskonAkhir
			select
				idTopping, idPromo, hargaAkhir
			from
				@promoValid
			where
				idPromo in (@curPromo)
			
			--Mencari harga akhir setelah diskon yang didapatkan saat ini
			select
				@tempTotal = sum (hargaAkhir)
			from
				@tempDiskonAkhir
			
			--Harga topping lainnya yang tidak terkena diskon
			select 
				@tempSisa = sum (harga)
			from
				@hargaToppingPesanan
			where
				idTopping not in(select idTopping from @tempDiskonAkhir)
			
			if(@tempSisa is null)set @tempSisa = 0
			if(@total > @tempTotal + @tempSisa)begin
				delete from @diskonAkhir

				set @total = @tempTotal + @tempSisa
				insert into @diskonAkhir
				select * from @tempDiskonAkhir
			end

			declare	cursorPromoValidCheck cursor
			for
				select	
					idTopping,idPromo,hargaAkhir
				from
					@promoValid
				order by
					idPromo asc,
					idTopping asc

			declare @curTopping2 int,
					@curPromo2 int,
					@curHarga2 int

			open cursorPromoValidCheck
				fetch next fromcursorPromoValidCheck
				into@curTopping2,@curPromo2,@curHarga2

				declare @tableCurToppingPromo table(
					idTopping int
				)
				declare @tableConnectedTopping table(
					idPromo int
				)
				declare @isEmpty int
				--select * from @tempDiskonAkhir
				while (@@FETCH_STATUS=0)begin
					set @tempSisa = 0
					set @tempTotal = 0
					if(@curPromo != @curPromo2)begin
						delete from @tableCurToppingPromo
						delete from @tableConnectedTopping

						--menyimpan promo topping- topping yang tidak boleh dipilih kembali
						insert into @tableConnectedTopping
						select 
							idPromo
						from
							@promoValid
						where
							idTopping in (select idTopping from @tempDiskonAkhir)

						--memasukkan semua topping pada promo yang sama
						insert into @tableCurToppingPromo
						select
							idTopping
						from
							@promoValid
						where
							idPromo = @curPromo2
							AND
							idPromo not in (select idPromo from @tableConnectedTopping)

						SELECT @isEmpty = COUNT(*) FROM @tableCurToppingPromo
						if(@isEmpty > 0)begin
							
							Insert into @tempDiskonAkhir
							select
								idTopping, idPromo, hargaAkhir
							from
								@promoValid
							where
								idPromo in (@curPromo2)

							--Mencari harga akhir setelah diskon yang didapatkan saat ini
							select
								@tempTotal = sum (hargaAkhir)
							from
								@tempDiskonAkhir
			
							--Harga topping lainnya yang tidak terkena diskon
							select 
								@tempSisa = sum (harga)
							from
								@hargaToppingPesanan
							where
								idTopping not in(select idTopping from @tempDiskonAkhir)
							
							select * from @tempDiskonAkhir
							select @total as 'total min', @tempTotal as 'total sekarang', @tempSisa as 'sisanya'
							if(@tempSisa is null)set @tempSisa = 0
							if(@total > @tempTotal + @tempSisa)begin
								delete from @diskonAkhir

								set @total = @tempTotal + @tempSisa
								insert into @diskonAkhir
								select * from @tempDiskonAkhir
							end

						end
						--select * from @tableCurToppingPromo
					end

					fetch next fromcursorPromoValidCheck
					into@curTopping2,@curPromo2,@curHarga2
				end
			close cursorPromoValidCheck
			deallocate cursorPromoValidCheck

			--Topping lainnya yang tidak terkena diskon
			insert into @diskonAkhir
			select 
				idTopping, null, harga
			from
				@hargaToppingPesanan
			where
				idTopping not in(select idTopping from @diskonAkhir)

			select
				@tempTotal = sum(hargaAkhir)
			from
				@diskonAkhir

			if(@total > @tempTotal)begin
				set @total = @tempTotal
			end

			fetch next from cursorPromoValid
			into@curTopping,@curPromo,@curHarga
		end
	close cursorPromoValid
	deallocate cursorPromoValid

	select * from @promoValid
	select * from @hargaToppingPesanan
	select * from @tempDiskonAkhir
	select * from @DiskonAkhir

exec cariPromoTerbesar '1,3,5,7,8,9'
