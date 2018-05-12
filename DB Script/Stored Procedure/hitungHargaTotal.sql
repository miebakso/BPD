--SP ini dibuat untuk menghitung total harga dari topping yang dipilih
--dilakukan dengan memanggil fungsi hitung_harga_total
create procedure hitungHargaTotal
(
	@toppings varchar(255)
)as
	select dbo.hitung_harga_total(@toppings) as total

--exec hitungHargaTotal '1,2,3'