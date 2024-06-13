DROP DATABASE db_organisation;
CREATE DATABASE db_organisation;

USE db_Organisation;

CREATE TABLE db_organisation.Worker(
	Worker_ID varchar(7) primary key not null,
    First_Name varchar(15),
    Last_Name varchar(15),
    Salary int,
    JoiningDate date,
    Department varchar(15)
    );
    
INSERT INTO db_organisation.Worker VALUES
	('W0001', 'Rebecca', 'Das', 40000, '2014-12-01', 'HR'),
    ('W0002', 'Javier', 'Boka', 60000, '2014-03-01', 'Admin'),
    ('W0003', 'Djenga', 'Toggle', 50000, '2014-12-23', 'HR'),
    ('W0004', 'Jon', 'Torpde', 35000, '2014-07-01', 'HR'),
    ('W0005', 'Gerda', 'Husa', 100000, '2015-12-01', 'Account'),
    ('W0006', 'Sue', 'Elois', 50000, '2013-12-01', 'HR');
    
SELECT * FROM db_organisation.Worker;

SELECT Worker_ID, JoiningDate FROM db_organisation.Worker
WHERE Department = 'Admin';

SELECT * FROM db_organisation.Worker
Order by Salary desc;

SELECT * FROM db_organisation.Worker
WHERE Salary BETWEEN 50000 and 90000
Order by Salary desc;

SELECT * FROM db_organisation.Worker
WHERE First_Name like '%r'
Order by Salary desc;

SELECT * FROM db_organisation.Worker
WHERE Department in ('HR', 'Account')
Order by Salary desc;

SELECT SUM(Salary), MAX(Salary), Min(Salary), avg(Salary) FROM db_organisation.Worker
Order by Salary desc;

SELECT COUNT(*) FROM db_organisation.Worker
WHERE DEPARTMENT = 'HR'
Order by Salary desc;