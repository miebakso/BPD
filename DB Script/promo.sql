
# SELECT ################################################################################


# CREATE TABLE Promo(
# 	ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
# 	name varchar(100) NOT NULL,
# 	promo_status INT NOT NULL,
# 	discount FLOAT NOT NULL
# )

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
	end
	else if(@option='inactive')
	begin
		SELECT
			*
		FROM
			Promo
		WHERE
			promo_status=0
	end
	else
	begin
		SELECT
			*
		FROM
			Promo
	end

# INSERT ################################################################################
CREATE PROCEDURE insert_promo
	@name varchar(100),
	@discount float,
	@topping_ids varchar(100),
as
	