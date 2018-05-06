-----------------------------------------------------------------------------------
--SP mencari semua order yang telah dilakukan oleh customer
create procedure findAllOrder
as

	select 
		id, customer_name, order_date, total_price, total_discounted_price
	from
		CustomerOrder

------------------------------------------------------------------------------------
--SP untuk mencari semua topping yang dipesan pada suatu order
alter procedure findOrderDetail
	@orderId int
as
	select 
		Topping.name, topping_price, discount
	from
		OrderTopping join Topping
	on
		OrderTopping.topping_id = Topping.ID
	where
		order_id = @orderId

