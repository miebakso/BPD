create procedure insert_orderTopping
	@orderId int,
	@topping_id int,
	@topping_price int,
	@discount int
as
	INSERT INTO OrderTopping(order_id, topping_id, topping_price, discount)
	VALUES (@orderId, @topping_id, @topping_price, @discount);
  