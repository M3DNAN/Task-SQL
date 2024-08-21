CREATE DATABASE TASK_1
--Create a table named "Employees" with columns for ID (integer), Name (varchar), and Salary (decimal).
CREATE TABLE Employees (
ID INT NOT NULL,
name VARCHAR(50) NOT NULL,
Salary decimal NOT NULL
)

--Add a new column named "Department" to the "Employees" table with data type varchar(50).
ALTER TABLE Employees 
ADD Department varchar(50) NOT NULL 

--Remove the "Salary" column from the "Employees" table.
ALTER TABLE Employees 
DROP COLUMN Salary 

--Rename the "Department" column in the "Employees" table to "DeptName".
EXEC sp_rename 'Employees.Department', 'DeptName', 'COLUMN';

--Create a new table called "Projects" with columns for ProjectID (integer) and ProjectName (varchar).
CREATE TABLE Projects (
ProjectID INT NOT NULL ,
ProjectName VARCHAR(50) NOT NULL,
)

--Add a primary key constraint to the "Employees" table for the "ID" column.

ALTER TABLE Employees
ADD CONSTRAINT PK_Employees PRIMARY key (ID) 

--Create a foreign key relationship between the "Employees" table (referencing "ID") 
--and the "Projects" table (referencing "ProjectID").

ALTER TABLE Projects
ADD CONSTRAINT PK_Projects PRIMARY key (ProjectID) 

ALTER TABLE Projects
ADD ID INT CONSTRAINT FK_EMP FOREIGN KEY (ID)REFERENCES Employees(ID) 
ON DELETE SET NULL

ALTER TABLE Employees
ADD ProjectID INT CONSTRAINT FK_PJT FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID)
ON DELETE SET NULL
--Remove the foreign key relationship between "Employees" and "Projects."

ALTER TABLE Employees
DROP CONSTRAINT FK_PJT

ALTER TABLE Projects
DROP CONSTRAINT FK_EMP

--Add a unique constraint to the "Name" column in the "Employees" table.
ALTER TABLE Employees 
ADD CONSTRAINT unique_NAME unique (name)


--•Create a table named "Customers" with columns for CustomerID (integer), FirstName (varchar), LastName (varchar)
-- and Email (varchar), and Status (varchar).

CREATE TABLE Customers (
CustomerID inT NOT NULL ,
FirstName varchar (50) NOT NULL ,
LastName VARCHAR(50) NOT NULL,
Email VARCHAR(50) NOT NULL ,
Status VARCHAR(50) NOT NULL 
)
--Add a unique constraint to the combination of "FirstName" and "LastName" columns in the "Customers" table.
ALTER TABLE CUSTOMERS 
ADD CONSTRAINT PK_CUSTOMERS PRIMARY KEY (FIRSTNAME , LASTNAME)

--Add a default value of 'Active' for the "Status" column in the "Customers" table,
--where the default value should be applied when a new record is inserted.
ALTER TABLE CUSTOMERS 
ADD CONSTRAINT DE_VAL  DEFAULT 'Active' FOR Status

-- Create a table named "Orders" with columns for OrderID (integer), CustomerID (integer), OrderDate (datetime), and TotalAmount (decimal).

CREATE TABLE Orders (
OrderID int NOT NULL ,
CustomerID int NOT NULL ,
OrderDate datetime NOT NULL,
TotalAmount decimal NOT NULL ,
)

-- Add a check constraint to the "TotalAmount" column in the "Orders" table to ensure that it is greater than zero.
ALTER TABLE Orders
ADD CONSTRAINT CH_VAL CHECK (TotalAmount>0)   

--Create a schema named "Sales" and move the "Orders" table into this schema.

CREATE SCHEMA Sales
ALTER SCHEMA sales TRANSFER OBJECT::dbo.Orders; 


--Rename the "Orders" table to "SalesOrders."
EXEC sp_rename 'Sales.Orders', 'SalesOrders.'
