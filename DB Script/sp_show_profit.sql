alter procedure show_profit
as
select 
	datepart(year,order_date) as year , datepart(month,order_date)as month, datename(month,order_date) as name_of_month,
	(sum(total_price) - sum(total_discounted_price)) as profit
from CustomerOrder
group by 
	datepart(year,order_date),datepart(month,order_date), datename(month, order_date)
order by
	year desc, month asc

exec show_profit