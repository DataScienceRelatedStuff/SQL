DROP database customerdb;
CREATE database Customerdb;

USE customerdb;

CREATE TABLE customerdb.Customer(
	CustomerID INT primary key not null,
    Name varchar(100),
    Address varchar(250),
    City varchar(50),
    PostalCode varchar(20),
    Country varchar(50)
    );

CREATE UNIQUE INDEX Customer_index
ON customerdb.Customer (CustomerID);

INSERT INTO Customer VALUES(
	1, 'Eda Keyes', 'Learning Grove 125', 'New York', 10000, 'USA');
SELECT * FROM Customer;

INSERT INTO Customer VALUES
	(2, 'Marc Bruno', 'Learning Street 25', 'San Francisco', 20000, 'USA'),
    (3, 'Esther Rodeo', 'School Street 25', 'Dublin', 1000, 'Ireland'),
    (4, 'Mariette Hemburg', 'Create Street 25', 'Barcelona', 3000, 'Spain'),
    (5, 'Sonje Raphael', 'Smart Street 13', 'Berlin', 15600, 'Germany'),
    (6, 'Isaac Newton', 'Mangrove 2', 'Tokyo', 32500, 'Japan');

SELECT * FROM Customer
LIMIT 3;

SELECT COUNT(Country) FROM Customer;

SELECT COUNT(DISTINCT(Country)) FROM Customer;

SELECT * FROM Customer
WHERE Country IN ('Spain', 'Japan');

SELECT * FROM Customer;

ALTER TABLE Customer
MODIFY City varchar(50)
AFTER PostalCode;

    
    
    ;

    
    
    
    
    
    
    
    
    
    