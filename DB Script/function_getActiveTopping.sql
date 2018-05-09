create function [dbo].[getActiveTopping]()
returns @result table(
	idTopping int,
	nama varchar(100)
)
begin
	
	insert into @result
	select
		id, name
	from
		Topping
	where
		status = 1;

	return
end