-- Fungsi untuk melakukan split pada ID string 
create function splitId
(
	@kalimat varchar(100)
)
returns @result table
(
	id int
)
begin
	declare 
		@cekKoma int,
		@indexAwal int
	
	set @indexAwal = 1
	set @cekKoma = CHARINDEX(',', @kalimat, @indexAwal)
	while(@cekKoma != 0)
	begin 
		insert into @result
			select
				CONVERT(INT, SUBSTRING(@kalimat, @indexAwal, @cekKoma-@indexAwal))
		
		set @indexAwal = @cekKoma + 1 
		set @cekKoma = CHARINDEX(',', @kalimat, @indexAwal)
	end
	insert into @result
			select
				SUBSTRING(@kalimat, @indexAwal,100)
	return
end
