---- sp untuk insert data ke tabel OrderTopping
create procedure insert_orderTopping
(
	@order_id int,
	@topping_id int,
	@topping_price float,
	@discount int
)
as
	insert into OrderTopping
	select 
		@order_id, @topping_id, @topping_price, @discount
