--SP untuk mencari pesangan dengan toping yang diinginkan.
--Parameter masukan adalah varchar id toping dipisahkan dengan koma

alter procedure rekomendasi 
	@param_order_id varchar(200)
as

--tabel idTop menyimpan topping yang dipesan
declare @tbl_toping_dipilih table
(
	topping_id int
)
--tabel temp untuk menyimpan hasil join tabel orderTopping dengan id topping yang dipilih
declare @tbl_temp table
(
	ordTop_id int,
	order_id int,
	topping_id int
)
-- tabel ini digunakan untuk mencatat setiap id order yang mengandung semua toping yang dipilih
declare @tbl_order_mengandung_topping table
(
	order_id int
)
declare @tbl_topping_rekomend table
(
	topping_id int
)
declare @tbl_topping_rekomend_2 table
(
	topping_id int
)
--mencatat jumlah topping yang dipilih
declare @jumlahTop int

--menyimpan semua id toping yang dipilih ke @tbl_topping_dipilih
insert into @tbl_toping_dipilih
select 
	id
from
	dbo.splitId(@param_order_id) --memanggil fungsi split untuk mengubah string input ke tabel

--select * from @tbl_toping_dipilih

--cari id order yang mengandung toping yang dipilih
insert into @tbl_temp
select 
	OrderTopping.ID , OrderTopping.order_id, OrderTopping.topping_id
from
	OrderTopping inner join  @tbl_toping_dipilih as idTop
	on OrderTopping.topping_id = idTop.topping_id

--count jumlah topping yang dipilih
select 
	@jumlahTop = count(topping_id)
from	
	@tbl_toping_dipilih

-- masukkan semua order yang sesuai dengan topping yang dipilih
insert into @tbl_order_mengandung_topping
select 
	temp.order_id
from
	@tbl_temp as temp
group by
	temp.order_id	
having 
	count(temp.ordTop_id) >= @jumlahTop

-- tampilkan semua topping yang dipilih sesuai dengan id order yang didapat di @tbl_order_mengandung_topping
insert into @tbl_topping_rekomend
select OrderTopping.topping_id
from
	OrderTopping inner join @tbl_order_mengandung_topping as temp
	on
		OrderTopping.order_id = temp.order_id

--select * from @tbl_topping_rekomend

--dapatkan topping lain untuk direkomendasikan
insert into @tbl_topping_rekomend_2
select * 
from 
	@tbl_topping_rekomend as temp
where
	temp.topping_id NOT in (select temp2.topping_id from @tbl_temp as temp2)

select top 1
	topping_id as rekomendasi_topping,
	count (topping_id) as jumlah
from 
	@tbl_topping_rekomend_2 as temp
group by 
	topping_id
order by jumlah

--select * from OrderTopping
--select * from CustomerOrder
exec rekomendasi '1,2'