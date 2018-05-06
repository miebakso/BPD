-----------------------------------------------------------------------------------
--SP mencari semua order yang telah dilakukan oleh customer
create procedure findAllOrder
as

	select 
		id, customer_name, order_date, total_price, total_discounted_price
	from
		CustomerOrder
