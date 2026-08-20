create database FinancialDB;
USE FinancialDB;
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    Email VARCHAR(100),
    Phone VARCHAR(15)
);

CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    AccountType VARCHAR(50),
    Balance DECIMAL(12,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Ledgers (
    LedgerID INT PRIMARY KEY,
    AccountID INT NOT NULL,
    LedgerName VARCHAR(100),
    Balance DECIMAL(12,2),
    FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID)
);

CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    AccountID INT NOT NULL,
    TransactionDate DATE,
    TransactionType VARCHAR(50),
    Amount DECIMAL(12,2),
    Description VARCHAR(255),
    FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID)
);

CREATE TABLE Invoices (
    InvoiceID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    InvoiceDate DATE,
    DueDate DATE,
    Amount DECIMAL(12,2),
    Status VARCHAR(30),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    InvoiceID INT NOT NULL,
    PaymentDate DATE,
    Amount DECIMAL(12,2),
    PaymentMethod VARCHAR(50),
    FOREIGN KEY (InvoiceID) REFERENCES Invoices(InvoiceID)
);

insert into Customers (CustomerID, CustomerName, Email, Phone) Values 
(1,"thushar","thushar@gmail.com",9353897612),
(2,"rahul","rahual@gmail.com",555669932),
(3,"anu","anu@mgail.com",8956238956);
select * from Customers;

insert into Accounts (AccountID,CustomerID,AccountType,Balance) values 
(101,1,"savings",25000),
(102,2,"current",35000),
(103,3,"sevings",80000);
select * from Accounts;
INSERT INTO Ledgers
(LedgerID, AccountID, LedgerName, Balance)
VALUES
(201, 101, 'Savings Ledger', 25000.00),
(202, 102, 'Current Ledger', 40000.00),
(203, 103, 'Savings Ledger', 15000.00);
INSERT INTO Transactions
(TransactionID, AccountID, TransactionDate, TransactionType, Amount, Description)
VALUES
(301, 101, '2026-08-09', 'Deposit', 5000.00, 'Cash Deposit'),
(302, 102, '2026-08-09', 'Withdrawal', 2000.00, 'Cash Withdrawal'),
(303, 103, '2026-08-09', 'Deposit', 3000.00, 'Bank Deposit');
INSERT INTO Invoices
(InvoiceID, CustomerID, InvoiceDate, DueDate, Amount, Status)
VALUES
(401, 1, '2026-08-09', '2026-08-20', 5000.00, 'Pending'),
(402, 2, '2026-08-09', '2026-08-25', 7500.00, 'Paid'),
(403, 3, '2026-08-09', '2026-08-30', 3000.00, 'Pending');
INSERT INTO Payments
(PaymentID, InvoiceID, PaymentDate, Amount, PaymentMethod)
VALUES
(501, 402, '2026-08-10', 7500.00, 'UPI'),
(502, 401, '2026-08-11', 2000.00, 'Cash'),
(503, 403, '2026-08-12', 3000.00, 'Bank Transfer');
SELECT * FROM Customers;
SELECT * FROM Accounts;
SELECT * FROM Ledgers;
SELECT * FROM Transactions;
SELECT * FROM Invoices;
SELECT * FROM Payments;