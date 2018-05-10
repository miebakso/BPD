create procedure get_last_customer_id
as
	select 
		COUNT(*)
	from 
		CustomerOrder

exec get_last_customer_id