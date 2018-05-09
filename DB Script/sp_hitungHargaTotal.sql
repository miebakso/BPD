alter procedure hitungHargaTotal
(
	@toppings varchar(255)
)as
	select dbo.hitung_harga_total(@toppings) as total

exec hitungHargaTotal '1,2,3'