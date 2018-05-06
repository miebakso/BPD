--jika membuat database baru , tambahkan 
USE [DB_Mie] --contoh nama database adalah DB_Mie
--------------------------------------------------------------------------------------------
DROP
drop table OrderTopping;
drop table ToppingPromo;
drop table CustomerOrder;
drop table Topping;
drop table promo;

--------------------------------------------------------------------------------------------
CREATE 
--------------------------------------------------------------------------------------------
CREATE TABLE CustomerOrder (
	ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	order_date DATE NOT NULL,
	customer_name varchar(100) NOT NULL,
	total_price float NOT NULL,
	total_discounted_price float NOT NULL
)

CREATE TABLE Topping (
	ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	name varchar(100) NOT NULL UNIQUE,
	status int NOT NULL,
	price float NOT NULL
)

CREATE TABLE Promo(
	ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	name varchar(100) NOT NULL,
	promo_status INT NOT NULL,
	discount FLOAT NOT NULL
)

CREATE TABLE OrderTopping(
	ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	order_id INT NOT NULL,
	topping_id INT NOT NULL,
	topping_price float NOT NULL,
	discount INT
)

CREATE TABLE ToppingPromo(
	ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	topping_id INT NOT NULL,
	promo_id INT NOT NULL
)

------------------------------------------------------------------------------------------
DROP
------------------------------------------------------------------------------------------
DROP TABLE CustomerOrder
DROP TABLE Topping
DROP TABLE Promo
DROP TABLE OrderTopping
DROP TABLE ToppingPromo
------------------------------------------------------------------------------------------
DELETE 
------------------------------------------------------------------------------------------
DELETE FROM CustomerOrder
DELETE FROM Topping
DELETE FROM Promo
DELETE FROM OrderTopping
DELETE FROM ToppingPromo
------------------------------------------------------------------------------------------
INSERT
------------------------------------------------------------------------------------------
INSERT INTO Topping (name,price,status) values ( 'kornet' , 9200, 1 )
INSERT INTO Topping (name,price,status) values ( 'keju' , 6500 , 1)
INSERT INTO Topping (name,price,status) values ( 'pisang' , 5000 , 1)
INSERT INTO Topping (name,price,status) values ( 'sambal' , 1700 , 1)
INSERT INTO Topping (name,price,status) values ( 'coklat' , 8800 , 1)
INSERT INTO Topping (name,price,status) values ( 'tohai' , 2500 , 1)
INSERT INTO Topping (name,price,status) values ( 'sawi' , 1200 , 1)
INSERT INTO Topping (name,price,status) values ( 'telor' , 2200 , 1)
INSERT INTO Topping (name,price,status) values ( 'kremesan' , 10300, 1 )
INSERT INTO Topping (name,price,status) values ( 'daging cincang' , 10900, 1 )

INSERT INTO Promo (name,promo_status,discount) values ( 'pisang' , 1, 13 )
INSERT INTO Promo (name,promo_status,discount) values ( 'sawi', 1, 23 )
INSERT INTO Promo (name,promo_status,discount) values ( 'coklat' , 0 ,34 )
INSERT INTO Promo (name,promo_status,discount) values ( 'kornet' , 1 ,7 )
INSERT INTO Promo (name,promo_status,discount) values ( 'telor' , 1 ,11 )
INSERT INTO Promo (name,promo_status,discount) values ( 'kremesan' , 1 ,20 )
INSERT INTO Promo (name,promo_status,discount) values ( 'telor kremesan' , 1 ,15 )
INSERT INTO Promo (name,promo_status,discount) values ( 'pisang telor' , 1 ,12 )
INSERT INTO Promo (name,promo_status,discount) values ( 'sambal kremesan' , 1 ,30 )
INSERT INTO Promo (name,promo_status,discount) values ( 'kornet kremesan' , 1 ,11 )
INSERT INTO Promo (name,promo_status,discount) values ( 'tohai kremesan' , 0 ,43 )
INSERT INTO Promo (name,promo_status,discount) values ( 'kremesan daging cincang' , 1 ,9 )
INSERT INTO Promo (name,promo_status,discount) values ( 'tohai telor' , 1 ,33 )
INSERT INTO Promo (name,promo_status,discount) values ( 'sawi coklat' , 1 ,33 )

INSERT INTO ToppingPromo (topping_id, promo_id) values (3,1)
INSERT INTO ToppingPromo (topping_id, promo_id) values (7,2)
INSERT INTO ToppingPromo (topping_id, promo_id) values (5,3)
INSERT INTO ToppingPromo (topping_id, promo_id) values (1,4)
INSERT INTO ToppingPromo (topping_id, promo_id) values (8,5)
INSERT INTO ToppingPromo (topping_id, promo_id) values (9,6)
INSERT INTO ToppingPromo (topping_id, promo_id) values (8,7)
INSERT INTO ToppingPromo (topping_id, promo_id) values (9,7)
INSERT INTO ToppingPromo (topping_id, promo_id) values (3,8)
INSERT INTO ToppingPromo (topping_id, promo_id) values (8,8)
INSERT INTO ToppingPromo (topping_id, promo_id) values (4,9)
INSERT INTO ToppingPromo (topping_id, promo_id) values (9,9)
INSERT INTO ToppingPromo (topping_id, promo_id) values (1,10)
INSERT INTO ToppingPromo (topping_id, promo_id) values (9,10)
INSERT INTO ToppingPromo (topping_id, promo_id) values (6,11)
INSERT INTO ToppingPromo (topping_id, promo_id) values (9,11)
INSERT INTO ToppingPromo (topping_id, promo_id) values (9,12)
INSERT INTO ToppingPromo (topping_id, promo_id) values (10,12)
INSERT INTO ToppingPromo (topping_id, promo_id) values (6,13)
INSERT INTO ToppingPromo (topping_id, promo_id) values (8,13)
INSERT INTO ToppingPromo (topping_id, promo_id) values (5,14)
INSERT INTO ToppingPromo (topping_id, promo_id) values (7,14)

Insert into OrderTopping (order_id, topping_id, topping_price, discount) 
values (1 , 1, 9200, 10);
Insert into OrderTopping (order_id, topping_id, topping_price, discount) 
values (1 , 2, 6500, 10);
Insert into OrderTopping (order_id, topping_id, topping_price, discounts) 
values (1 , 3, 5000, 30);
Insert into OrderTopping (order_id, topping_id, topping_price) 
values (2 , 2, 6500);
Insert into OrderTopping (order_id, topping_id, topping_price) 
values (2 , 3, 5000);
Insert into OrderTopping (order_id, topping_id, topping_price) 
values (3 , 2, 6500);
Insert into OrderTopping (order_id, topping_id, topping_price) 
values (4 , 4, 1700);
Insert into OrderTopping (order_id, topping_id, topping_price) 
values (4 , 5, 8800);
Insert into OrderTopping (order_id, topping_id, topping_price) 
values (5 , 1, 9200);
Insert into OrderTopping (order_id, topping_id, topping_price) 
values (5 , 2, 6500);
Insert into OrderTopping (order_id, topping_id, topping_price) 
values (5 , 3, 5000);

INSERT INTO CustomerOrder (order_date, customer_name, total_price, total_discounted_price)
VALUES (CURRENT_TIMESTAMP,'Matthew Kampret' , 0 , 0);
INSERT INTO CustomerOrder (order_date, customer_name, total_price, total_discounted_price)
VALUES (CURRENT_TIMESTAMP,'Matthew Bangsat' , 0 , 0);
INSERT INTO CustomerOrder (order_date, customer_name, total_price, total_discounted_price)
VALUES (CURRENT_TIMESTAMP,'Kampret Ariel' , 0 , 0);
INSERT INTO CustomerOrder (order_date, customer_name, total_price, total_discounted_price)
VALUES (CURRENT_TIMESTAMP,'Bangsat Ariel' , 0 , 0);
INSERT INTO CustomerOrder (order_date, customer_name, total_price, total_discounted_price)
VALUES (CURRENT_TIMESTAMP,'Matthew Taiks' , 0 , 0);

INSERT INTO

------------------------------------------------------------------------------------------
CONTOH KASUS 
--kremesan dan telor = 11% : 1875, kalo masing masing = 242 + 2060
-- sawi dan coklat = 33" : 3300, kalo masing masing = 2992 + 276
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
SELECT
------------------------------------------------------------------------------------------
select * from Topping
select * from Promo
SELECT * from ToppingPromo having count(promo_id)  > 1
select sum(Topping.price) from ToppingPromo inner join Topping where ToppingPromo.topping_id = Topping.id group by ToppingPromo.promo_id
dll