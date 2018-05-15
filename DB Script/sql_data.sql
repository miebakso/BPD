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
	discount float NOT NULL
)

CREATE TABLE OrderTopping(
	ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	order_id INT NOT NULL,
	topping_id INT NOT NULL,
	topping_price float NOT NULL,
	discount INT,
	FOREIGN KEY (order_id) REFERENCES CustomerOrder(ID),
	FOREIGN KEY (topping_id) REFERENCES Topping(ID)
)

CREATE TABLE ToppingPromo(
	ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	topping_id INT NOT NULL,
	promo_id INT NOT NULL,
	FOREIGN KEY (topping_id) REFERENCES Topping(ID),
	FOREIGN KEY (promo_id) REFERENCES Promo(ID)
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
--data dummy untuk tabel Topping
INSERT INTO Topping (name,price,status) values ( 'kornet' , 9200, 1 )
INSERT INTO Topping (name,price,status) values ( 'keju' , 6500 , 1)
INSERT INTO Topping (name,price,status) values ( 'pisang' , 5000 , 1)
INSERT INTO Topping (name,price,status) values ( 'sambal' , 1700 , 1)
INSERT INTO Topping (name,price,status) values ( 'coklat' , 8800 , 1)
INSERT INTO Topping (name,price,status) values ( 'tohai' , 2500 , 1)
INSERT INTO Topping (name,price,status) values ( 'sawi' , 1200 , 1)
INSERT INTO Topping (name,price,status) values ( 'telor' , 2200 , 1)
INSERT INTO Topping (name,price,status) values ( 'kremesan' , 10300, 1 )
INSERT INTO Topping (name,price,status) values ( 'nanas' , 7000, 1 )
INSERT INTO Topping (name,price,status) values ( 'teriyaki' , 11000, 1 )
INSERT INTO Topping (name,price,status) values ( 'pepperoni' , 11000, 1 )
INSERT INTO Topping (name,price,status) values ( 'sosis' , 11000, 1 )
INSERT INTO Topping (name,price,status) values ( 'jamur' , 9000, 1 )
INSERT INTO Topping (name,price,status) values ( 'salada' , 1200, 1 )
INSERT INTO Topping (name,price,status) values ( 'rebung' , 7000, 0 )
INSERT INTO Topping (name,price,status) values ( 'nasi' , 4000, 1 )
INSERT INTO Topping (name,price,status) values ( 'matcha' , 7000, 0 )
INSERT INTO Topping (name,price,status) values ( 'oreo' , 5000, 0 )
INSERT INTO Topping (name,price,status) values ( 'daging cincang' , 10900, 1 )

--data dummy untuk tabel Promo
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

--data dummy untuk tabel ToppingPromo
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

--data dummy untuk tabel OrderTopping
Insert into OrderTopping (order_id, topping_id, topping_price, discount) 
values (1 , 1, 9200, 10);
Insert into OrderTopping (order_id, topping_id, topping_price, discount) 
values (1 , 2, 6500, 10);
Insert into OrderTopping (order_id, topping_id, topping_price, discount) 
values (1 , 3, 5000, 30);

Insert into OrderTopping (order_id, topping_id, topping_price, discount) 
values (2 , 2, 6500, 5);
Insert into OrderTopping (order_id, topping_id, topping_price, discount) 
values (2 , 3, 5000, 15);
Insert into OrderTopping (order_id, topping_id, topping_price, discount) 
values (3 , 2, 6500, 20);
Insert into OrderTopping (order_id, topping_id, topping_price, discount) 
values (4 , 4, 1700, 10);
Insert into OrderTopping (order_id, topping_id, topping_price, discount) 
values (4 , 5, 8800, 7);
Insert into OrderTopping (order_id, topping_id, topping_price, discount) 
values (5 , 1, 9200, 23);
Insert into OrderTopping (order_id, topping_id, topping_price, discount) 
values (5 , 2, 6500, 19);
Insert into OrderTopping (order_id, topping_id, topping_price, discount) 
values (5 , 3, 5000, 12);

--data dummy untuk tabel CustomerOrder


insert into CustomerOrder 
select '2018-05-01','Yoseph',24000,6000
insert into CustomerOrder 
select '2018-05-12','Yosua',17000,3500
insert into CustomerOrder 
select '2018-05-10','Yakobus',33000,8000
insert into CustomerOrder 
select '2018-05-01','Matthew',7000,1000
insert into CustomerOrder 
select '2018-04-02','Hananta',15000,1000
insert into CustomerOrder 
select '2018-04-03','Budi',8000,1000
insert into CustomerOrder 
select '2018-04-11','Fitra',24000,6000
insert into CustomerOrder 
select '2018-04-17','Uut',11000,3500
insert into CustomerOrder 
select '2018-04-10','Yohanes',15000,8000
insert into CustomerOrder 
select '2018-03-01','Martin',14000,3000
insert into CustomerOrder 
select '2018-03-20','Beti',17000,3500
insert into CustomerOrder 
select '2018-02-10','Idong',30000,6500
insert into CustomerOrder 
select '2018-02-01','Ogah',24000,4000
insert into CustomerOrder 
select '2018-02-20','Woro',29000,3500
insert into CustomerOrder 
select '2018-02-01','Irvan',10000,1000
insert into CustomerOrder 
select '2018-01-02','Ida',25000,1000
insert into CustomerOrder 
select '2018-01-03','Suro',8000,1000
insert into CustomerOrder 
select '2018-01-10','Sisil',27000,6000

insert into CustomerOrder 
select '2017-12-03','Dinda', 15000,6000
insert into CustomerOrder 
select '2017-12-14','Agung',22000,5500
insert into CustomerOrder 
select '2017-11-12','Udi',12000,6000
insert into CustomerOrder 
select '2017-11-11','Bagas',9000,8000
insert into CustomerOrder 
select '2017-10-05','Bimo',17000,3500
insert into CustomerOrder 
select '2017-9-04','Iraffdi',19000,7000
insert into CustomerOrder 
select '2017-9-02','Oman',23000,7000
insert into CustomerOrder 
select '2017-08-03','Uus', 14000,5000
insert into CustomerOrder 
select '2017-08-14','Maman',17000,5500
insert into CustomerOrder 
select '2017-08-12','Anto',11000,4000
insert into CustomerOrder 
select '2017-07-11','Oman',9000,9000
insert into CustomerOrder 
select '2017-07-05','Subroto',11000,8000
insert into CustomerOrder 
select '2017-06-04','Bagus',14000,7000
insert into CustomerOrder 
select '2017-06-01','Selvi',30000,6000

------------------------------------------------------------------------------------------
CONTOH KASUS 
--kremesan dan telor = 15% : harga akhir = 10625, kalo masing masing = 242 + 2060
-- sawi dan coklat = 33% : 6700, sawi saja=276
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
SELECT
------------------------------------------------------------------------------------------
select * from Topping
select * from Promo
select * from ToppingPromo
select * from CustomerOrder
select * from OrderTopping


--------------------------------------------------------------------------------------------
--TABEL-TABEL GLOBAL UNTUK RECURSIVE PENCARIAN PROMO TERBAIK
create table pesananRec(
	guid varchar(255),
	idTopping int,
	harga int
)

create table tempRec(
	guid varchar(255),
	idPromo int,
	idTopping int,
	hargaAkhir int
)

create table PromoValid(
	guid varchar(255),
	idPromo int,
	idTopping int,
	hargaAkhir int
)

create table hasilRec(
	guid varchar(255),
	idPromo int,
	idTopping int,
	hargaAkhir int
)

create table totalHargaRec(
	guid varchar(255),
	total int
)
