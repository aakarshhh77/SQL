-- 1. Create Database
CREATE DATABASE finance_database;

USE finance_database;


-- 2. Create Table
CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    customer_id INT,
    transaction_date DATE,
    amount DECIMAL(10,2),
    payment_method VARCHAR(20)
);


-- 3. Insert Data
INSERT INTO transactions
VALUES
(1, 101, '2026-01-01', 5000, 'UPI'),
(2, 102, '2026-01-02', 3000, 'Card'),
(3, 101, '2026-01-03', 7000, 'UPI'),
(4, 103, '2026-01-04', 60000, 'Bank'),
(5, 104, '2026-01-05', 2500, 'UPI'),
(6, 101, '2026-01-06', 5000, 'UPI'),
(7, 101, '2026-01-06', 5000, 'UPI'),
(8, NULL, '2026-01-07', 4000, 'Card'),
(9, 105, '2026-01-08', NULL, 'UPI'),
(10, 106, NULL, 3500, 'Card'),
(11, 107, '2026-01-09', -500, 'UPI'),
(12, 108, '2026-01-10', 80000, 'Bank');


-- 4. Display the Data
SELECT *
FROM transactions;


-- 5. Create an Index
CREATE INDEX idx_customer
ON transactions(customer_id);


-- 6. Check the Index
SHOW INDEX FROM transactions;

  
-- 7. Check Query Performance
EXPLAIN
SELECT *
FROM transactions
WHERE customer_id = 101;


-- 8. Find Duplicate Transactions
SELECT
    customer_id,
    transaction_date,
    amount,
    COUNT(*) AS count
FROM transactions
GROUP BY customer_id, transaction_date, amount
HAVING COUNT(*) > 1;


-- 9. Find Missing Records
SELECT *
FROM transactions
WHERE customer_id IS NULL
   OR transaction_date IS NULL
   OR amount IS NULL;


-- 10. Find High-Value Transactions
SELECT *
FROM transactions
WHERE amount > 50000;


-- 11. Find Negative Transactions
SELECT *
FROM transactions
WHERE amount < 0;


-- 12. Find Multiple Transactions
-- by the Same Customer on the Same Date
SELECT
    customer_id,
    transaction_date,
    COUNT(*) AS transaction_count
FROM transactions
GROUP BY customer_id, transaction_date
HAVING COUNT(*) > 1;


-- 13. Final Suspicious Transaction Report
SELECT *
FROM transactions
WHERE amount > 50000
   OR amount < 0
   OR customer_id IS NULL
   OR transaction_date IS NULL
   OR amount IS NULL;