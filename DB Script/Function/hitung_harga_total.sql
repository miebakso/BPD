-- Fungsi untuk melakukan total harga  dari topping yang dipilih
create function hitung_harga_total
(
	@kalimat varchar(100)
)
returns int
begin
	declare @tbl_id table
	(
		id int,
		harga int
	)
	insert into @tbl_id
	select 
		temp.id, Topping.price as harga
	from
		dbo.splitId(@kalimat) as temp inner join Topping
		on  temp.id = Topping.ID

	declare @totalHarga int
	select @totalHarga = sum (harga) from @tbl_id
	return @totalHarga
end
