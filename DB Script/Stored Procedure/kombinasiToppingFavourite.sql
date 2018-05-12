--sp ini digunakan untuk mencari kombinasi topping tambahan yang paling sering dibeli

create procedure kombinasiToppingFavourite
as

--tabel ini digunakan untuk menyimpan id topping setiap order
declare @tblSimpan table
(
	order_id int,
	topping_id varchar (200)
)

--tabel ini digunakan untuk menyimpan setiap kombinasi topping
declare @tblRes table
(
	topping_id varchar (200),
	total int
)
declare @orderIdCursor int
declare @toppingIdCursor int

--cursor ini digunakan untuk menelusuri tabel orderTopping
declare myCursor cursor for
select 
	order_id, topping_id
from 
	OrderTopping
order by
	order_id asc , topping_id asc
open myCursor

-- masukkan order_id ke tabel simpan (tabel sementara)
insert into @tblSimpan
select id, ''
from CustomerOrder

--telusuri setiap idOrder 
fetch next from myCursor 
into @orderIdCursor, @toppingIdCursor

while (@@FETCH_STATUS = 0 )
begin
	declare @top_id varchar (100)
	select @top_id = topping_id
	from @tblSimpan
	where order_id = @orderIdCursor

	if(@top_id = '')
	begin 
		update @tblSimpan 
		set topping_id = topping_id + CONVERT(varchar, @toppingIdCursor) +''
		where order_id = @orderIdCursor
	end
	else
	begin
		update @tblSimpan 
		set topping_id = topping_id + ',' + CONVERT(varchar, @toppingIdCursor) +''
		where order_id = @orderIdCursor
	end

	fetch next from myCursor 
	into @orderIdCursor, @toppingIdCursor
end

close myCursor
deallocate myCursor

--count kombinasi topping
declare @res varchar (200)
insert into @tblRes
select
	topping_id,count(topping_id) as total
from
	@tblSimpan
group by 
	topping_id
order by 
	total desc

--dapatkan kombinasi topping dengan jumlah order terbanyak
select top 1 
	@res = topping_id 
from @tblRes
where topping_id != ''

-- kembalikan kombinasi topping dengan memanggil fungsi splitId()
select
	Topping.ID, Topping.name, Topping.price
from
	dbo.splitId(@res)as temp inner join Topping
	on temp.id = Topping.ID

--exec kombinasiToppingFavourite