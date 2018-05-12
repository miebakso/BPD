create procedure insert_customerOrder
	@name varchar (200)
as
	INSERT INTO CustomerOrder (order_date, customer_name, total_price, total_discounted_price)
	VALUES (CURRENT_TIMESTAMP, @name , 0 , 0);