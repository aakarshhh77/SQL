create database task9;
use task9;

create table transactionsss (
    transaction_id INT PRIMARY KEY,
    transaction_date DATE,
    department varchar(50),
    transaction_type varchar(40),
    amount decimal(10,2)
);

INSERT INTO transactionsss
(transaction_id, transaction_date, department, transaction_type, amount)
VALUES
(21,'2023-01-12',"Admin","income",42000),
(22,'2023-04-25',"Sales","expenses",31500),
(23,'2024-02-08',"Finance","income",68000),
(24,'2024-06-17',"HR","expenses",27500),
(25,'2024-09-29',"IT","income",54000),
(26,'2025-01-14',"Marketing","expenses",62000),
(27,'2025-05-21',"Admin","income",38000),
(28,'2025-08-03',"Sales","expenses",47000),
(29,'2026-03-16',"Finance","income",91000),
(30,'2026-05-27',"HR","expenses",33000),
(31,'2026-07-09',"IT","income",59000),
(32,'2026-09-01',"Marketing","expenses",74000);

SELECT * FROM transactionsss;

select year(transaction_date) as year,month(transaction_date) as month,sum(amount) as total_amount
from transactionsss
group by year(transaction_date),month(transaction_date);

select year(transaction_date)as year,month(transaction_date)as month,sum(amount) as total_amount
from transactionsss
group by year(transaction_date),month(transaction_date);

with monthly_summary as(
select year(transaction_date)as year,month(transaction_date)as month,sum(amount) as total_amount
from transactionsss
group by year(transaction_date),month(transaction_date)
)
select*from monthly_summary; 

select year(transaction_date)as year,month(transaction_date)as month,sum(amount) as total_amount
from transactionsss
where transaction_type="income"
group by year(transaction_date),month(transaction_date);
select*from transactionsss;


select year(transaction_date)as year,sum(amount) as total_income
from transactionsss
where transaction_type="income"
group by year(transaction_date);  

select department,sum(amount) as total_expenses
from transactionsss
where transaction_type="expenses"
group by department;

select year(transaction_date)as year,department,sum(amount) as total_expenses
from transactionsss
where transaction_type="expenses"
group by year(transaction_date),department;