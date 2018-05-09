alter procedure findPromoRec(
	@startID int,
	@guid varchar(255),
	@bigestID int
)
as
	--DEBUG COMBINASI
	--select * from tempRec
	if(@startID <= @bigestID)begin 
		
		--Menyimpan id yang tidak akan dicek di cursor recursive berikutnya
		declare @startIdRec int

		--cursor inisialisasi
		declare recPromo cursor
		LOCAL
		for
			select distinct 
				idPromo 
			from
				PromoValid
			where 
				guid = @guid AND idPromo > @startID

	
		declare @curPromo int
		open recPromo
		
			fetch next fromrecPromo
			into@curPromo

			declare @tempTotal int,
					@tempSisa int,
					@total int,
					@isEmpty int

			--menyimpan apakah ada topping yang saling bertabrakan sehingga tidak dapat dimasukkan ke tempRec
			declare @localTemp table(
				idTopping int
			)

			--DEBUGG!!----------------------------------------------------------------------------
			--select @curPromo as curPromo
			while(@@FETCH_STATUS = 0)begin 
				delete from @localTemp

				--mencari total saat ini
				select
					@total = total
				from
					totalHargaRec
				where
					guid = @guid

				insert into @localTemp
				select 
					idTopping
				from
					PromoValid
				where
					PromoValid.guid = @guid AND
					PromoValid.idPromo = @curPromo

				select 
					@isEmpty = COUNT(*)
				from 
					tempRec join @localTemp as localTemp
				on
					tempRec.idTopping = localTemp.idTopping
				where
					tempRec.guid = @guid 

				--DEBUGG!!----------------------------------------------------------------------------
				--select * from tempRec
				--select @curPromo
				--select * from @localTemp
				--select @isEmpty as isEmpty
			
				if(@isEmpty = 0)begin 
					--masukkan data ke tempRec
					Insert into tempRec
					select
						guid, idPromo, idTopping, hargaAkhir
					from
						PromoValid
					where
						idPromo = @curPromo AND guid = @guid
			
					--Mencari harga akhir setelah diskon yang didapatkan saat ini
					select
						@tempTotal = sum (hargaAkhir)
					from
						tempRec
					where 
						guid = @guid
			
					--Harga topping lainnya yang tidak terkena diskon
					select 
						@tempSisa = sum (harga)
					from
						pesananRec
					where
						idTopping not in(select idTopping from tempRec) AND guid = @guid
			
					if(@tempSisa is null)set @tempSisa = 0
					if(@total > @tempTotal + @tempSisa)begin
						delete from hasilRec where guid = @guid

						update totalHargaRec
						set total = @tempTotal + @tempSisa
						where guid = @guid

						insert into hasilRec
						select 
							guid, idPromo, idTopping, hargaAkhir					
						from 
							tempRec
					end
				end

				--Set id terkecil yang tidak digunakan di recursive berikutnya
				set @startIdRec = @curPromo
				exec findPromoRec @startIdRec,@guid,@bigestID

				delete from tempRec
				where idPromo = @curPromo AND guid = @guid

				fetch next fromrecPromo
				into@curPromo
			end
			
		close recPromo
		deallocate recPromo

	end

exec findPromoMax '7,8,9'