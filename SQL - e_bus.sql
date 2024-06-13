DROP DATABASE e_bus;
CREATE DATABASE e_bus;

CREATE TABLE e_bus.Customer(
	Customer_ID varchar(6) primary key not null,
    First_Name varchar(15),
    Last_Name varchar(15),
    Birth_Date date,
    City varchar(15),
    Phone_Num varchar(15)
    );

CREATE INDEX Customer_index on e_bus.Customer(Customer_ID);
    
CREATE TABLE e_bus.Package(
	Pack_ID varchar(5) not null,
    Speed varchar(10),
    Start_Date date,
    Monthly_Payment decimal(7,2),
    Customer_ID varchar(6) not null,
    FOREIGN KEY(Customer_ID) REFERENCES Customer(Customer_ID)
    );

CREATE INDEX Package_index on e_bus.Package(Pack_ID);
SHOW INDEXES FROM e_bus.Package;
DROP INDEX Package_index on e_bus.Package;
SHOW INDEXES FROM e_bus.Package;
    
INSERT INTO e_bus.Customer VALUES
	('C0001', 'Andy', 'Ozkän', '2000-12-01', 'Bristol', '06542123456'),
    ('C0002', 'Helga', 'Eaves', '1999-07-02', 'Liverpool', '06542456123'),
    ('C0003', 'Robert', 'Withman', '1995-08-13', 'Newcastle', '06542126345'),
    ('C0004', 'Friske', 'Canterburry', '1993-05-27', 'Birmingham', '06345654212'),
    ('C0005', 'Lenka', 'Dungeon', '1997-01-11', 'Peterborough', '06542162345');

SELECT * FROM e_bus.Customer;

INSERT INTO e_bus.Package VALUES
	('P0001', 'Fast', '2022-12-01', 350, 'C0003'),
    ('P0002', 'Slow', '2022-10-31', 245, 'C0005'),
    ('P0003', 'Normal', '2022-08-15', 430, 'C0001'),
    ('P0004', 'Normal', '2022-09-13', 199, 'C0002'),
    ('P0005', 'Slow', '2022-5-09', 310, 'C0004');
    
SELECT * FROM e_bus.Package;

SELECT * FROM e_bus.Customer;
UPDATE e_bus.Customer
	SET First_Name = 'Kurt', Phone_Num = '02162345654'
    WHERE Customer_ID = 'C0005';
SELECT * FROM e_bus.Customer;
SELECT * FROM e_bus.Customer
WHERE Customer_ID = 'C0005';

SELECT * FROM e_bus.Package;
ALTER TABLE e_bus.Package
	ADD COLUMN Min_Price decimal(10,2) AFTER Start_Date;
DESCRIBE e_bus.PACKAGE;
SELECT * FROM e_bus.Package;

SELECT * FROM e_bus.Customer;
SELECT * FROM e_bus.Customer
WHERE Birth_date <= '2000-01-01';

SHOW DATABASES;
/*
ALTER DATABASE e_bus MODIFY NAME = testDB ; 
SHOW DATABASES;
ALTER DATABASE testDB MODIFY NAME = e_bus ; 
*/

/*
$ mysqldump -u "root" -p password -R e_bus > e_bus.sql;
$ mysqladmin -u root -p password create tutorialsDB;
*/

/*
RENAME DATABASE e_bus TO e_bus1;
*/
SHOW DATABASES;
SHOW SCHEMAS;


CREATE TABLE e_bus.package_copy AS
SELECT *
FROM e_bus.package;
SELECT *
FROM e_bus.package_copy;

USE e_bus;
SHOW TABLES;

RENAME TABLE e_bus.package_copy TO e_bus.package_001;
SHOW TABLES;

ALTER TABLE e_bus.package_001 RENAME AS e_bus.package_copy;
SHOW TABLES;

TRUNCATE TABLE e_bus.package_copy;
SHOW TABLES;
SELECT * FROM e_bus.package_copy;

CREATE TABLE e_bus.package_002 LIKE e_bus.package;
SHOW TABLES;
SELECT * FROM e_bus.package_002;

CREATE TEMPORARY TABLE e_bus.clients_001(
   ID   INT              NOT NULL,
   NAME VARCHAR (20)     NOT NULL,
   AGE  INT              NOT NULL,
   ADDRESS  CHAR (25) ,
   SALARY   DECIMAL (18, 2),
   PRIMARY KEY (ID)
);
SHOW TABLES;
INSERT INTO e_bus.clients_001 VALUES
(1, 'Ramesh', 32, 'Ahmedabad', 2000.00 ),
(2, 'Khilan', 25, 'Delhi', 1500.00 ),
(3, 'Kaushik', 23, 'Kota', 2000.00 );

SELECT *
FROM e_bus.clients_001;

/*
DROP TEMPORARY TABLE e_bus.clients_001;
SELECT *
FROM e_bus.clients_001;
*/

ALTER TABLE e_bus.clients_001 ADD Sex char(1) AFTER NAME;
SELECT *
FROM e_bus.clients_001;

ALTER TABLE e_bus.clients_001 DROP COLUMN Sex;
SELECT *
FROM e_bus.clients_001;

ALTER TABLE e_bus.clients_001 ADD INDEX clients_index (AGE);

ALTER TABLE e_bus.clients_001 DROP INDEX clients_index;

DESC e_bus.clients_001;
ALTER TABLE e_bus.clients_001 
ADD CONSTRAINT MyPrimaryKey 
PRIMARY KEY(SALARY);

ALTER TABLE e_bus.clients_001 DROP PRIMARY KEY;
ALTER TABLE e_bus.clients_001 
ADD CONSTRAINT MyPrimaryKey 
PRIMARY KEY(SALARY);
DESC e_bus.clients_001;

ALTER TABLE e_bus.clients_001 MODIFY COLUMN ID DECIMAL(18, 4);
DESC e_bus.clients_001;

SELECT * FROM e_bus.customer;
SELECT * FROM e_bus.clients_001;
SELECT * FROM e_bus.clients;

ALTER TABLE e_bus.clients 
ADD CONSTRAINT FK_ID 
FOREIGN KEY(ID) 
REFERENCES e_bus.clients_001(ID);

DESC e_bus.clients;
ALTER TABLE e_bus.clients DROP FOREIGN KEY FK_ID;

CREATE VIEW view_customer AS
SELECT *
FROM e_bus.customer
WHERE City like '%e';

SELECT * FROM e_bus.view_customer;

SELECT TABLE_SCHEMA, TABLE_NAME 
FROM INFORMATION_SCHEMA.VIEWS
WHERE TABLE_SCHEMA='e_bus';
RENAME TABLE view_customer TO view_customers;
SELECT TABLE_SCHEMA, TABLE_NAME 
FROM INFORMATION_SCHEMA.VIEWS
WHERE TABLE_SCHEMA='e_bus';
DROP VIEW IF EXISTS view_customers;
SELECT TABLE_SCHEMA, TABLE_NAME 
FROM INFORMATION_SCHEMA.VIEWS
WHERE TABLE_SCHEMA='e_bus';

SELECT * FROM e_bus.Customer
Limit 30;


CREATE TABLE e_bus.People(
   id INT NOT NULL,
   name VARCHAR (20) NOT NULL,
   age INT NOT NULL,
   address CHAR (25),
   salary DECIMAL (18, 2),       
   CONSTRAINT ck_People 
   PRIMARY KEY (id, name)
);

DESC e_bus.People;

INSERT INTO e_bus.People VALUES 
(1, 'Ramesh', 32, 'Ahmedabad', 2000.00 ),
(1, 'Ramesh', 25, 'Delhi', 1500.00 );
SELECT * FROM e_bus.People;

INSERT INTO e_bus.People VALUES 
(1, 'Ramesh', 32, 'Ahmedabad', 2000.00 ),
(1, 'Ramesha', 25, 'Delhi', 1500.00 );
SELECT * FROM e_bus.People;

CREATE INDEX People_index on e_bus.People(id);
CREATE UNIQUE INDEX People_index_age on e_bus.People(age);
SHOW INDEX FROM e_bus.People;
DROP INDEX People_index on e_bus.People;
DROP INDEX People_index_age on e_bus.People;
SHOW INDEX FROM e_bus.People;
SELECT * FROM e_bus.people;
CREATE UNIQUE INDEX People_index_age on e_bus.People(age, address);
SHOW INDEX FROM e_bus.People;

ALTER TABLE e_bus.People
DROP CONSTRAINT primary;

SELECT table_name, constraint_type, constraint_name
FROM information_schema.table_constraints
WHERE table_name='e_bus.Customer';

SELECT table_name, constraint_type, constraint_name
FROM information_schema.table_constraints
WHERE table_name='e_bus.Package';

DROP TABLE PRODUCTS;
CREATE TABLE PRODUCTS(
   PID INT NOT NULL,
   PNAME VARCHAR(30),
   DELIVERY_CITY VARCHAR(20),
   DATE_OF_ORDER Date NOT NULL,
   PRICE INT,
   PRIMARY KEY(PID),
   CONSTRAINT Constraint_DOO CHECK(DATE_OF_ORDER <= '2024-02-18')
);

SELECT table_name, constraint_type, constraint_name
FROM information_schema.table_constraints
WHERE table_name='PRODUCTS';

INSERT INTO PRODUCTS VALUES
(001, 'Nike Shoe', 'Ranchi', '2024-01-11', 2000);

INSERT INTO PRODUCTS VALUES
(001, 'Nike Shoe', 'Ranchi', '2024-03-11', 2000);

ALTER TABLE PRODUCTS
DROP CONSTRAINT Constraint_DOO;

ALTER TABLE PRODUCTS 
ADD CONSTRAINT Constraint_DOO CHECK (DATE_OF_ORDER > '2024-02-18');

SELECT table_name, constraint_type, constraint_name
FROM information_schema.table_constraints
WHERE table_name='PRODUCTS';

INSERT INTO PRODUCTS VALUES
(001, 'Nike Shoe', 'Ranchi', '2024-01-11', 2000);

INSERT INTO PRODUCTS VALUES
(001, 'Nike Shoe', 'Ranchi', '2024-03-11', 2000);


CREATE TABLE THINGS (
   ID INT NOT NULL,
   NAME VARCHAR (20) NOT NULL DEFAULT 'Ramesh',
   AGE INT NOT NULL DEFAULT '32',
   ADDRESS CHAR (25) DEFAULT 'Ahmedabad',
   SALARY DECIMAL (18, 2) DEFAULT '2000',
   PRIMARY KEY (ID)
);

INSERT INTO THINGS (ID) VALUES (1);
INSERT INTO THINGS VALUES (2, 'Khilan', 25, 'Delhi', 1500.00 );

SELECT * FROM THINGS;
INSERT INTO THINGS (ID) VALUES (3);
SELECT * FROM THINGS;

INSERT INTO THINGS VALUES
(5, 'Kaushik', DEFAULT, DEFAULT, 2000.00),
(4, 'Chaitali', DEFAULT, DEFAULT, DEFAULT);
SELECT * FROM THINGS;

ALTER TABLE THINGS ALTER ADDRESS SET DEFAULT 'Delhi';

INSERT INTO THINGS VALUES
(6, 'Kaushik', DEFAULT, DEFAULT, 2000.00),
(7, 'Chaitali', DEFAULT, DEFAULT, DEFAULT);
SELECT * FROM THINGS;

ALTER TABLE THINGS ALTER ADDRESS DROP DEFAULT;
DESC THINGS;


DELIMITER //
CREATE PROCEDURE GetThingsInfo(IN CustomerAge INT)
   BEGIN
      SELECT * FROM THINGS WHERE AGE = CustomerAge;
   END //
DELIMITER ;
CALL GetThingsInfo(25);

DELIMITER //
CREATE PROCEDURE GetCustomerSalary(IN ID Int)
   BEGIN
      SELECT SALARY FROM THINGS WHERE ID = ID;
   END //
DELIMITER ;
CALL GetCustomerSalary(4);
SELECT * FROM THINGS;

DELIMITER //
CREATE PROCEDURE GetDetail(OUT total INT)
   BEGIN
      SELECT COUNT(AGE) INTO total FROM THINGS
      WHERE AGE = 25;
   END //
DELIMITER ;
CALL GetDetail(@total);
SELECT @total;

SHOW CREATE PROCEDURE GetDetail;

DELIMITER //
CREATE PROCEDURE increaseSalary(INOUT Cust_Id Int,  INOUT curr_Salary Int)
   BEGIN
      SELECT SALARY INTO curr_Salary From THINGS Where ID = Cust_Id;
      SET curr_Salary = curr_Salary * 1.1;
      Update THINGS SET SALARY = curr_Salary Where ID = Cust_Id;
   END //
DELIMITER ;
SELECT * FROM THINGS;

SET @customerID = 2;
SET @salary = 0.0;
CALL increaseSalary(@customerID, @salary);

SELECT @salary AS updated_salary;


CREATE TABLE STAFF (
   FIRST_NAME CHAR(20),
   LAST_NAME CHAR(20),
   SEX CHAR(10)
);

ALTER TABLE STAFF 
ADD PRIMARY KEY (LAST_NAME, FIRST_NAME);

DESC STAFF;

INSERT IGNORE INTO STAFF(LAST_NAME, FIRST_NAME) VALUES
( 'Jay', 'Thomas'),
( 'Jay', 'Thomas');

SELECT * FROM STAFF;

REPLACE INTO STAFF (LAST_NAME, FIRST_NAME) VALUES
( 'Ajay', 'Kumar'),
( 'Ajay', 'Kumar');

SELECT * FROM STAFF;

SELECT COUNT(*) as repetitions, LAST_NAME, FIRST_NAME
FROM STAFF
GROUP BY LAST_NAME, FIRST_NAME
HAVING repetitions > 1;

