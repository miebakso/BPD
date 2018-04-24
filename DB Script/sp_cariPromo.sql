--SP untuk mencari promo dari beberapa id topping yang dipilih oleh suatu order
--Parameter masukan adalah varchar id toping dipisahkan dengan koma

alter procedure cariPromo 
	@param_topping_id varchar(200)
as

--tabel idTop menyimpan topping yang dipesan
declare @tbl_toping_dipilih table
(
	topping_id int
)
--tabel @tbl_temp untuk menyimpan id Promo yang masih aktif 
declare @tbl_temp table
(
	promo_id int,
	topping_id int
)
--tabel @tbl_temp2 untuk menyimpan promo yang mengandung id topping lain selain yang dipesan
declare @tbl_temp2 table
(
	promo_id int,
	topping_id int
)
--tabel @tbl_hasil untuk menyimpan promo yang hanya mengandung id topping yang dipesan
declare @tbl_hasil table
(
	promo_id int,
	topping_id int
)
--menyimpan semua id toping yang dipilih ke @tbl_topping_dipilih
insert into @tbl_toping_dipilih
select 
	id
from
	dbo.splitId(@param_topping_id) --memanggil fungsi split untuk mengubah string input ke tabel

insert into @tbl_temp
select 
	promo_id, topping_id
from 
	ToppingPromo inner join Promo
	on
		ToppingPromo.promo_id = Promo.ID
where 
	Promo.promo_status = 1
order by promo_id,topping_id

insert into @tbl_temp2
select *
from @tbl_temp
where
	topping_id not in (select topping_id from @tbl_toping_dipilih)

insert into @tbl_hasil
select * from @tbl_temp
where promo_id not in (select promo_id from @tbl_temp2)
order by promo_id, topping_id

-- lakukan perhitungan promo yang terbaik
select top 1
	promo_id,
	count(promo_id)as total_topping_dalam_promo
from 
	@tbl_hasil as temp
group by
	promo_id
order by 
	total_topping_dalam_promo

exec cariPromo '1,2,3'

select * from ToppingPromo
