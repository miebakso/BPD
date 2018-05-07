
create procedure show_customer_order
(
	@start_date date,
	@end_date date
)as
select * from CustomerOrder
where 
	order_date >= @start_date AND order_date <= @end_date

exec show_customer_order '2018-05-01' , '2018-07-31'