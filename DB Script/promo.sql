
# SELECT ################################################################################



CREATE PROCEDURE select_promo
	@option varchar(100)
as
	if(@option='active')
	begin
		SELECT
			*
		FROM
			Promo
		WHERE 
			promo_status=1
		ORDER BY
			ID DESC
	end
	else if(@option='inactive')
	begin
		SELECT
			*
		FROM
			Promo
		WHERE
			promo_status=0
		ORDER BY
			ID DESC
	end
	else
	begin
		SELECT
			*
		FROM
			Promo
		ORDER BY
			ID DESC
	end

# INSERT ################################################################################

CREATE PROCEDURE insert_promo
	@name varchar(100),
	@discount float
as
	INSERT INTO Promo (name,promo_status,discount) 
	VALUES (@name,1,@discount)
	
	SELECT SCOPE_IDENTITY() AS ID
	
# SELECT BY ID ################################################################################

CREATE PROCEDURE select_promo_by_id
	@id int
as
	SELECT
		*
	FROM
		Promo
	WHERE 
		ID = @id

# UPDATE PROMO BY ID ################################################################################

CREATE PROCEDURE update_promo_by_id
	@ID int,
	@name varchar(100),
	@discount float,
	@promo_status int
as
	UPDATE
		Promo
	SET 
		name=@name,
		discount=@discount,
		promo_status=@promo_status
	WHERE
		ID = @ID