-- Fungsi untuk menghitung profit dari faktur yang ada pada rentang saat ini
-- parameter dua buah tanggal yang merupakan rentang tanggal untuk dilakukan perhitungan profit
alter procedure hitungPendapatan
(
	@from_date date,
	@end_date date
)as
	declare @total_p int
	declare @total_dis int
	declare @tblTemp table (
		total_price int,
		total_discounted_price int
	)
	-- cari rekord yang berada pada rentang tanggal yang diberikan pada input
	insert into @tblTemp
	select 
		total_price, total_discounted_price
	from	
		CustomerOrder
	where 
		order_date > @from_date AND order_date < @end_date
	
	-- hitung total_price setiap rekord
	select 
		@total_p = sum(total_price)
	from @tblTemp
	-- hitung total discount setiap rekord
	select 
		@total_dis = sum(total_discounted_price)
	from @tblTemp

	--kembalikan nilai dari total seluruh penjualan dikurangi dengan total diskon setiap penjualan
	select @total_p as total, @total_dis as discount , (@total_p - @total_dis) as total_profit

exec hitungPendapatan '2018-01-01', '2019-01-01'
--select * from CustomerOrder