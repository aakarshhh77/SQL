use financialdb;
CREATE TABLE financial_transactions (
    transaction_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    invoice_amount DECIMAL(10,2),
     VARCHAR(20),
    payment_date DATE,
    region VARCHAR(30)
);
INSERT INTO financial_transactionspayment_status
(transaction_id, customer_name, invoice_amount, payment_status, payment_date, region)
VALUES
(1, 'Anil Kumar', 12500, 'Paid', '2026-01-05', 'South'),
(2, 'Priya Nair', 18500, 'Pending', '2026-01-08', 'South'),
(3, 'Rahul Sharma', 22000, 'Paid', '2026-01-10', 'North'),
(4, 'Sneha Thomas', 9500, 'Paid', '2026-01-12', 'South'),
(5, 'Arjun Mehta', 32000, 'Pending', '2026-01-15', 'West'),
(6, 'Kavya Menon', 15000, 'Overdue', '2026-01-18', 'South'),
(7, 'Rohit Verma', 27500, 'Paid', '2026-01-20', 'North'),
(8, 'Neha Kapoor', 11000, 'Pending', '2026-01-22', 'North'),
(9, 'Amit Patel', 45000, 'Paid', '2026-01-25', 'West'),
(10, 'Divya Rao', 17500, 'Paid', '2026-01-28', 'South'),
(11, 'Sanjay Gupta', 25000, 'Overdue', '2026-02-02', 'North'),
(12, 'Meera Iyer', 13500, 'Paid', '2026-02-05', 'South'),
(13, 'Vikram Singh', 38000, 'Pending', '2026-02-08', 'North'),
(14, 'Pooja Shah', 21000, 'Paid', '2026-02-10', 'West');


select * from financial_transactions;

select * from financial_transactions where invoice_amount>20000;
select * from financial_transactions where payment_date;
select * from financial_transactions where region="South";
select * from financial_transactions where payment_status="Paid";
select * from financial_transactions where payment_status="Pending";

select * from financial_transactions where region between"South"and"West";
select * from financial_transactions where invoice_amount between "12500"and"32000";
select * from financial_transactions where payment_status between "Pending"and"Paid";
select * from financial_transactions where invoice_amount between "1200"and"32000";

select * from financial_transactions where region in("south");
select * from financial_transactions where region in("West");
SELECT * FROM financial_transactions WHERE region IN ("West", "South");
SELECT * FROM financial_transactions where payment_status in ("Paid","Pending");
select * from financial_transactions where invoice_amount in(12000);

SELECT * FROM financial_transactions WHERE customer_name LIKE "a%";
select * from financial_transactions where customer_name like "%A%";
select * from financial_transactions where customer_name like "_a%";
select * from financial_transactions where customer_name like"_n%";
select * from financial_transactions where customer_name like "s%";

select * from financial_transactions;
select distinct region from financial_transactions;
select distinct region,payment_status from financial_transactions;
select count(distinct region) as total_region from financial_transactions;
select count(distinct region,payment_status) as total_payment_status from financial_transactions;
select distinct invoice_amount from financial_transactions;











