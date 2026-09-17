use monthly;
CREATE TABLE monthly_finance (
    id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    month_name VARCHAR(20),
    sales DECIMAL(10,2),
    expenses DECIMAL(10,2),
    tax_rate DECIMAL(5,2)
    );
    
INSERT INTO monthly_finance
VALUES
(1, 'Rahul', 'January', 50000, 30000, 10),
(2, 'Priya', 'January', 60000, 35000, 10),
(3, 'Anu', 'January', 45000, 25000, 10),

(4, 'Rahul', 'February', 55000, 32000, 10),
(5, 'Priya', 'February', 65000, 38000, 10),
(6, 'Anu', 'February', 50000, 27000, 10),

(7, 'Rahul', 'March', 60000, 34000, 10),
(8, 'Priya', 'March', 70000, 40000, 10),
(9, 'Anu', 'March', 55000, 30000, 10);


select * from monthly_finance;

DELIMITER //
CREATE PROCEDURE CalculateTAX(
	IN p_sales DECIMAL(10,2),
    IN p_tax_rate DECIMAL(10,2)
    )
    
BEGIN 
	SELECT p_sales AS Sales,
	p_tax_rate AS tax_rate,
    p_sales*p_tax_rate/100 AS tax_amount;
END //
DELIMITER ;






call CalculateTAX(5000,10);
call CalculateTAX(50000,14);





CREATE TABLE month_end_closing(
month varchar(20),
total_sales decimal(10,2),
total_expense decimal(10,2),
profit_lose decimal(10,2)
);


DELIMITER // 
CREATE PROCEDURE month_end_closing_pro(
IN p_month varchar(20))
BEGIN
insert into month_end_closing (month,total_sales,total_expense,profit_lose)
SELECT month_name,sum(sales),sum(expenses),sum(sales)-sum(expenses)
from monthly_finance
where month_name=p_month
group by month_name;

END //
DELIMITER ;

CALL month_end_closing_pro('March');

select * from month_end_closing;
	
DELIMITER //

CREATE PROCEDURE CustomerSummary(
    IN p_customer VARCHAR(50)
)
BEGIN
    SELECT
        customer_name,
        SUM(sales) AS Total_Sales,
        SUM(expenses) AS Total_Expenses,
        SUM(sales) - SUM(expenses) AS Total_Profit
    FROM monthly_finance
    WHERE customer_name = p_customer
    GROUP BY customer_name;
END //

DELIMITER ;

CALL CustomerSummary('Rahul');


CREATE TABLE year_end_profit (
    id INT AUTO_INCREMENT PRIMARY KEY,
    total_sales DECIMAL(10,2),
    total_expenses DECIMAL(10,2),
    total_profit DECIMAL(10,2)
);


DELIMITER //

CREATE PROCEDURE YearEndProfit()
BEGIN

    INSERT INTO year_end_profit
    (total_sales, total_expenses, total_profit)

    SELECT
        SUM(sales),
        SUM(expenses),
        SUM(sales) - SUM(expenses)
    FROM monthly_finance;

END //

DELIMITER ;

CALL YearEndProfit();

SELECT * FROM year_end_profit;