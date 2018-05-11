create procedure insert_customerOrder
	@name varchar (200),
	@total_price int,
	@total_discounted int
as
	INSERT INTO CustomerOrder (order_date, customer_name, total_price, total_discounted_price)
	VALUES (CURRENT_TIMESTAMP, @name , @total_price , @total_discounted);
  
 SELECT SCOPE_IDENTITY() AS ID
