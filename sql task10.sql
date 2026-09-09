use fin_db;

CREATE TABLE monthly_sales (
    sale_month DATE,
    customer_name VARCHAR(50),
    sales DECIMAL(12,2)
);

INSERT INTO monthly_sales (sale_month, customer_name, sales)
VALUES
('2023-01-01', 'Arun', 100000),
('2023-02-01', 'Bala', 120000),
('2023-03-01', 'Arun', 110000),
('2023-04-01', 'Divya', 150000),
('2023-05-01', 'Bala', 130000),
('2023-06-01', 'Arun', 140000),
('2023-07-01', 'Divya', 150000),
('2023-08-01', 'Bala', 160000),
('2023-09-01', 'Arun', 140000),
('2023-10-01', 'Divya', 180000),
('2023-11-01', 'Bala', 170000),
('2023-12-01', 'Arun', 160000),

('2024-01-01', 'Arun', 130000),
('2024-02-01', 'Bala', 150000),
('2024-03-01', 'Arun', 140000),
('2024-04-01', 'Divya', 170000),
('2024-05-01', 'Bala', 160000),
('2024-06-01', 'Arun', 155000),
('2024-07-01', 'Divya', 180000),
('2024-08-01', 'Bala', 175000),
('2024-09-01', 'Arun', 165000),
('2024-10-01', 'Divya', 190000),
('2024-11-01', 'Bala', 185000),
('2024-12-01', 'Arun', 175000);

SELECT * FROM monthly_sales;

SELECT
    sale_month,
    customer_name,
    sales,
    RANK() OVER (ORDER BY sales DESC) AS sales_rank
FROM monthly_sales;

SELECT
    sale_month,
    customer_name,
    sales,
    DENSE_RANK() OVER (ORDER BY sales DESC) AS sales_rank
FROM monthly_sales;

SELECT
    sale_month,
    customer_name,
    sales,
    ROW_NUMBER() OVER (ORDER BY sales DESC) AS row_num
FROM monthly_sales;

SELECT
    sale_month,
    sales,
    LAG(sales) OVER (ORDER BY sale_month) AS previous_month_sales
FROM monthly_sales;

SELECT
    sale_month,
    sales,
    LEAD(sales) OVER (ORDER BY sale_month) AS next_month_sales
FROM monthly_sales;


SELECT
    sale_month,
    sales,
    SUM(sales) OVER (
        ORDER BY sale_month
    ) AS running_total
FROM monthly_sales;

SELECT
    sale_month,
    sales,
    LAG(sales, 12) OVER (
        ORDER BY sale_month
    ) AS previous_year_sales
FROM monthly_sales;

SELECT
    sale_month,
    sales,
    LAG(sales, 12) OVER (
        ORDER BY sale_month
    ) AS previous_year_sales,

    ((sales - LAG(sales, 12) OVER (ORDER BY sale_month))
    / LAG(sales, 12) OVER (ORDER BY sale_month)) * 100
    AS yoy_growth
FROM monthly_sales;

SELECT
    sale_month,
    customer_name,
    sales,

    RANK() OVER (
        ORDER BY sales DESC
    ) AS rank_position,

    DENSE_RANK() OVER (
        ORDER BY sales DESC
    ) AS dense_rank_position,

    ROW_NUMBER() OVER (
        ORDER BY sales DESC
    ) AS row_num,

    LAG(sales) OVER (
        ORDER BY sale_month
    ) AS previous_month_sales,

    LEAD(sales) OVER (
        ORDER BY sale_month
    ) AS next_month_sales,

    SUM(sales) OVER (
        ORDER BY sale_month
    ) AS running_total

FROM monthly_sales;