create database permission;
use permission;
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    Email VARCHAR(100)
);

CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    CustomerID INT,
    Amount DECIMAL(10,2),
    TransactionDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Salaries (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    Salary DECIMAL(10,2)
);


CREATE USER 'manager'@'localhost' IDENTIFIED BY 'Manager@123';

CREATE USER 'accountant'@'localhost' IDENTIFIED BY 'Account@123';

CREATE USER 'clerk'@'localhost' IDENTIFIED BY 'Clerk@123';

GRANT SELECT ON permission.* 
TO 'manager'@'localhost';

GRANT SELECT, INSERT, UPDATE 
ON permission.transactions
TO 'accountant'@'localhost';

GRANT SELECT 
ON permission.Customers
TO 'accountant'@'localhost';

GRANT SELECT 
ON permission.Customers
TO 'clerk'@'localhost';

GRANT DELETE 
ON permission.Transactions
TO 'accountant'@'localhost';

REVOKE DELETE 
ON FinanceDB.Transactions
FROM 'accountant'@'localhost';

SHOW GRANTS FOR 'manager'@'localhost';
SHOW GRANTS FOR 'clerk'@'localhost';