
USE finance;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50)
);

CREATE TABLE invoices (
    invoice_id INT PRIMARY KEY,
    customer_id INT,
    invoice_amount DECIMAL(10,2),
    due_date DATE
);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    invoice_id INT,
    payment_amount DECIMAL(10,2)
);

INSERT INTO customers VALUES
(1, 'Arun'),
(2, 'Anu'),
(3, 'Rahul');

INSERT INTO invoices VALUES
(101, 1, 50000, '2026-09-01'),
(102, 2, 30000, '2026-09-05'),
(103, 3, 40000, '2026-09-10');

INSERT INTO payments VALUES
(201, 101, 30000),
(202, 102, 10000),
(203, 103, 40000);

CREATE VIEW customer_balance AS
SELECT
    c.customer_name,
    i.invoice_amount,
    p.payment_amount,
    i.invoice_amount - p.payment_amount AS balance
FROM customers c
JOIN invoices i
ON c.customer_id = i.customer_id
JOIN payments p
ON i.invoice_id = p.invoice_id;
SELECT * FROM customer_balance;



CREATE VIEW outstanding_payments AS
SELECT
    c.customer_name,
    i.invoice_amount - p.payment_amount AS outstanding_amount
FROM customers c
JOIN invoices i
ON c.customer_id = i.customer_id
JOIN payments p
ON i.invoice_id = p.invoice_id
WHERE i.invoice_amount > p.payment_amount;
SELECT * FROM outstanding_payments;

CREATE VIEW aging_receivable AS
SELECT
    c.customer_name,
    i.invoice_amount - p.payment_amount AS balance,
    DATEDIFF(CURDATE(), i.due_date) AS days_overdue
FROM customers c
JOIN invoices i
ON c.customer_id = i.customer_id
JOIN payments p
ON i.invoice_id = p.invoice_id
WHERE i.invoice_amount > p.payment_amount;
SELECT * FROM aging_receivable;


CREATE VIEW audit_report AS
SELECT
    c.customer_name,
    i.invoice_id,
    i.invoice_amount,
    i.due_date
FROM customers c
JOIN invoices i
ON c.customer_id = i.customer_id;
SELECT * FROM audit_report;
