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
CREATE procedure findOrderDetail
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

------------------------------------------------------------------------------------
--SP untuk mencari semua topping yang aktif
create procedure findActiveTopping
as

	select
		idTopping,nama
	from
		dbo.getActiveTopping()
