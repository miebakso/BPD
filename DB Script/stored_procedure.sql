--SP untuk mencari pesangan dengan toping yang diinginkan.
--Parameter masukan adalah varchar id toping dipisahkan dengan koma
alter procedure findOrderByToppings
	@ids varchar(200)
as

declare 
	@total int


declare @temp table(
	id int
)

insert into @temp
	SELECT
		id
	from
		dbo.splitId(@ids)

SELECT
	@total = count(id)
FROM
	@temp

declare @topping table(
	order_id int,
	topping_id int
)

insert into @topping
	select
		temp2.order_id,
		temp2.topping_id
	from
		@temp as temp
	JOIN
		OrderTopping as temp2
	ON 
		temp.id = temp2.topping_id
		

declare @final table(
	id int,
	total int
)

insert into @final
	SELECT
		order_id,
		count(topping_id)
	FROM
		@topping
	GROUP BY
		order_id
	
SELECT 
	order_date, customer_name, total_price, total_discounted_price
FROM 
	@final as final join CustomerOrder
on
	final.id = CustomerOrder.ID
WHERE
	final.total = @total


exec findOrderByToppings '1,2,3'
