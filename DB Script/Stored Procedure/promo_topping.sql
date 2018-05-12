
# INSERT ################################################################################

CREATE PROCEDURE insert_promo_topping
	@promo_id int,
	@topping_id int
as
	INSERT INTO ToppingPromo (promo_id,topping_id) 
	VALUES (@promo_id, @topping_id)


# DELETE ################################################################################

CREATE PROCEDURE delete_promo_topping
	@promo_id int,
	@topping_id int
as
	DELETE FROM 
		ToppingPromo 
	WHERE
		promo_id = @promo_id 
	AND
		topping_id = @topping_id 


# DELETE ################################################################################

CREATE PROCEDURE select_topping_by_promo_id
	@promo_id int
as
	SELECT
		T.ID,
		T.name
	FROM
		Topping as T
	INNER JOIN
		(
		SELECT 
			*
		FROM 
			ToppingPromo
		WHERE
			promo_id = @promo_id
		) as TP
	ON 
		T.ID = TP.topping_id
	ORDER BY 
		T.name ASC
	
	