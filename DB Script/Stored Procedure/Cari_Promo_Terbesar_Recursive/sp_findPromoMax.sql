ALTER procedure findPromoMax(
	@paramToppingPesanan varchar(200)
)
as
	--Menyiapkan guid untuk pemanggilan SP ini.
	declare @guidFindPromoMax varchar(255)
	set @guidFindPromoMax = NEWID()


	--menyimpan semua id toping yang dipilih ke @tbl_topping_dipilih
	insert into pesananRec
	select 
		@guidFindPromoMax,pesanan.id,price
	from
		dbo.splitId(@paramToppingPesanan) as pesanan --memanggil fungsi split untuk mengubah string input ke tabel 
		join 
		Topping
	on
		pesanan.id = Topping.ID

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
			idTopping not in(select idTopping from pesananRec)

	--mencari promo yang dapat digunakan berdasar promo yang tidak dapat digunakan
	insert into PromoValid
		select 
			@guidFindPromoMax ,promoAktif.idTopping, idPromo, harga - (harga* promoAktif.discount)/100
		from
			@topingPromoAktif as promoAktif join pesananRec as pesanan
		on
			promoAktif.idTopping = pesanan.idTopping
		where
			idPromo not in(select idPromo from @promoInvalid)

	--Menyimpan id yang tidak akan dicek di cursor recursive berikutnya
	declare @startId int
	
	--tabel yang menyimpan toping" yang tidak terkena promo apa- apa
	declare @tabelSisaTopping table(
		idTopping int
	)

	insert into @tabelSisaTopping
	select
		idTopping
	from
		pesananRec
	where
		guid = @guidFindPromoMax

	insert into hasilRec
	select
		pesananRec.guid, NULL ,pesananRec.idTopping, pesananRec.harga
	from
		@tabelSisaTopping as sisa join pesananRec
	on
		sisa.idTopping = pesananRec.idTopping

	--inisialisasi harga total awal harga semua topping tanpa diskon
	insert into totalHargaRec
	select 
		@guidFindPromoMax,sum(pesananRec.harga)
	from
		@tabelSisaTopping as sisa join pesananRec
	on
		sisa.idTopping = pesananRec.idTopping

	--cursor inisialisasi
	declare recPromo cursor
	LOCAL
	for
		select distinct 
			idPromo 
		from
			PromoValid
		where 
			guid = @guidFindPromoMax 
	
	declare @curPromo int
	open recPromo
		
		fetch next fromrecPromo
		into@curPromo

		declare @tempTotal int,
				@tempSisa int,
				@total int,
				@bigestID int --ID terakhir yang akan masuk recursive

		select 
			@bigestID = MAX(idPromo)
		from
			PromoValid
		where
			guid = @guidFindPromoMax

		while(@@FETCH_STATUS = 0)begin 
			delete from @tabelSisaTopping
			--mencari total saat ini
			select
				@total = total
			from
				totalHargaRec
			where
				guid = @guidFindPromoMax

			--masukkan data ke tempRec
			Insert into tempRec
			select
				guid, idPromo, idTopping, hargaAkhir
			from
				PromoValid
			where
				idPromo = @curPromo AND guid = @guidFindPromoMax
			
			--Mencari harga akhir setelah diskon yang didapatkan saat ini
			select
				@tempTotal = sum (hargaAkhir)
			from
				tempRec
			where 
				guid = @guidFindPromoMax

			--masukkan topping yang belum mendapat diskon ke tempSisaTopping
			insert into @tabelSisaTopping
			select distinct 
				idTopping
			from
				pesananRec
			where
				pesananRec.guid = @guidFindPromoMax
				AND
				idTopping not in (select idTopping from tempRec)

			--Harga topping lainnya yang tidak terkena diskon
			select 
				@tempSisa = sum (harga)
			from
				@tabelSisaTopping as sisa join pesananRec
			on
				sisa.idTopping = pesananRec.idTopping
			
			if(@tempSisa is null)set @tempSisa = 0
			if(@total > @tempTotal + @tempSisa)begin
				delete from hasilRec where guid = @guidFindPromoMax

				update totalHargaRec
				set total = @tempTotal + @tempSisa
				where guid = @guidFindPromoMax


				if(@tempSisa != 0)begin
					insert into hasilRec
					select
						guid, NULL,pesananRec.idTopping, harga
					from
						@tabelSisaTopping as sisa join pesananRec
					on
						sisa.idTopping = pesananRec.idTopping
				end

				insert into hasilRec
				select 
					guid, idPromo, idTopping, hargaAkhir					
				from 
					tempRec
			end

			set @startId = @curPromo
			exec findPromoRec @startID,@guidFindPromoMax,@bigestID

			delete from tempRec
			where idPromo = @curPromo AND guid = @guidFindPromoMax

			fetch next fromrecPromo
			into@curPromo
		end
			
	close recPromo
	deallocate recPromo

	declare @hasilAkhir table(
		idPromo int,
		idTopping int,
		discount int,
		hargaAkhir int
	)

	insert into @hasilAkhir
	select 
		idPromo,idTopping,discount,hargaAkhir 
	from 
		hasilRec left outer join Promo
	on
		hasilRec.idPromo = Promo.ID

	select
		idTopping,name,price,idPromo,discount,hargaAkhir 
	from
		@hasilAkhir as hasil join Topping
	on
		hasil.idTopping = Topping.ID

	select total from totalHargaRec
	--DEBUG!!
	--select * from PromoValid
	--select * from pesananRec

	delete from PromoValid where guid = @guidFindPromoMax
	delete from pesananRec where guid = @guidFindPromoMax
	delete from tempRec where guid = @guidFindPromoMax
	delete from hasilRec where  guid = @guidFindPromoMax
	delete from totalHargaRec where guid = @guidFindPromoMax

exec findPromoMax '8,9'