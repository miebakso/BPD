-- sp untuk insert data ke tabel CustomerOrder
create procedure insert_customerOrder
	@name varchar (200),
	@total_price float,
	@total_discounted float
as
	INSERT INTO CustomerOrder (order_date, customer_name, total_price, total_discounted_price)
	VALUES (CURRENT_TIMESTAMP, @name , @total_price , @total_discounted);
	select SCOPE_IDENTITY() as ID

