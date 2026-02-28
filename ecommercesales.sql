CREATE DATABASE  EcommerceProject;
USE EcommerceProject;
CREATE TABLE Esales (
    order_date VARCHAR(20),
    product_name VARCHAR(255),
    category VARCHAR(100),
    region VARCHAR(50),
    quantity INT,
    sales INT,
    profit DECIMAL(10, 2)
);
ALTER TABLE sales ADD COLUMN format_date DATE;
set SQL_SAFE_UPDATES = 0;
UPDATE sales 
SET format_date = STR_TO_DATE(TRIM(order_date), '%d-%m-%Y');
SET SQL_SAFE_UPDATES = 1;
SELECT 
    SUM(sales) AS total_revenue, 
    SUM(profit) AS total_profit,
    ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin_pct
FROM sales;
SELECT 
    product_name, 
    SUM(sales) AS total_sales
FROM sales
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 5;
SELECT 
    category, 
    SUM(sales) AS total_sales, 
    SUM(profit) AS total_profit
FROM sales
GROUP BY category
ORDER BY total_profit DESC;
SELECT 
    DATE_FORMAT(format_date, '%Y-%m') AS sale_month, 
    SUM(sales) AS monthly_revenue
FROM sales
GROUP BY sale_month
ORDER BY sale_month;
SELECT 
    region, 
    SUM(sales) AS total_sales
FROM sales
GROUP BY region
ORDER BY total_sales DESC;
SELECT 
    DATE_FORMAT(format_date, '%Y-%m') AS sale_month, 
    SUM(sales) AS total_monthly_revenue,
    COUNT(order_date) AS number_of_orders
FROM sales
GROUP BY sale_month
ORDER BY sale_month;