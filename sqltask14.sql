create database index_db;
use index_db;
CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    account_no VARCHAR(20),
    transaction_date DATE,
    transaction_type VARCHAR(20),
    amount DECIMAL(10,2),
    status VARCHAR(20)
);
INSERT INTO transactions VALUES
(101, 'ACC001', '2026-01-05', 'Deposit', 50000, 'Success'),
(102, 'ACC002', '2026-01-06', 'Withdrawal', 15000, 'Success'),
(103, 'ACC001', '2026-01-10', 'Payment', 8000, 'Success'),
(104, 'ACC003', '2026-01-12', 'Deposit', 75000, 'Success'),
(105, 'ACC002', '2026-01-15', 'Payment', 12000, 'Success'),
(106, 'ACC004', '2026-01-18', 'Withdrawal', 90000, 'Success'),
(107, 'ACC001', '2026-01-20', 'Payment', 8000, 'Success'),
(108, 'ACC005', '2026-01-22', 'Deposit', 100000, 'Success'),
(109, 'ACC006', '2026-01-25', 'Withdrawal', 250000, 'Success'),
(110, 'ACC007', '2026-01-28', 'Payment', 5000, 'Failed'),
(111, 'ACC007', '2026-01-29', 'Payment', 5000, 'Failed');

EXPLAIN
SELECT *
FROM transactions
WHERE account_no = 'ACC001';

CREATE INDEX idx_account_no
ON transactions(account_no);

EXPLAIN
SELECT *
FROM transactions
WHERE account_no = 'ACC001';
CREATE INDEX idx_transaction_date
ON transactions(transaction_date);
SELECT *
FROM transactions
WHERE transaction_date BETWEEN '2026-01-01' AND '2026-01-31';

SHOW INDEX FROM transactions;

SELECT 
    account_no,
    transaction_date,
    transaction_type,
    amount,
    COUNT(*) AS duplicate_count
FROM transactions
GROUP BY account_no, transaction_date, transaction_type, amount
HAVING COUNT(*) > 1;

SELECT *
FROM transactions
WHERE (account_no, transaction_date, transaction_type, amount)
IN (
    SELECT 
        account_no,
        transaction_date,
        transaction_type,
        amount
    FROM transactions
    GROUP BY account_no, transaction_date, transaction_type, amount
    HAVING COUNT(*) > 1
);

SELECT *
FROM transactions
WHERE transaction_type = 'Withdrawal'
AND amount > 100000;

SELECT *
FROM transactions
WHERE status = 'Failed';

SELECT 
    account_no,
    COUNT(*) AS failed_transactions
FROM transactions
WHERE status = 'Failed'
GROUP BY account_no
HAVING COUNT(*) > 1;

SELECT t1.transaction_id + 1 AS missing_id
FROM transactions t1
LEFT JOIN transactions t2
ON t1.transaction_id + 1 = t2.transaction_id
WHERE t2.transaction_id IS NULL
AND t1.transaction_id < (
    SELECT MAX(transaction_id)
    FROM transactions
);

SELECT 
    transaction_id,
    account_no,
    transaction_date,
    transaction_type,
    amount,
    status,
    CASE
        WHEN amount > 100000 THEN 'High Amount'
        WHEN status = 'Failed' THEN 'Failed Transaction'
        ELSE 'Normal'
    END AS activity_status
FROM transactions;
