----Create the Database
CREATE DATABASE  EcommerceProject;
USE EcommerceProject;
-- Create the Esales Table
CREATE TABLE Esales (
    order_date VARCHAR(20),
    product_name VARCHAR(255),
    category VARCHAR(100),
    region VARCHAR(50),
    quantity INT,
    sales INT,
    profit DECIMAL(10, 2)
);
-- 1. Add a new column for the proper date format
ALTER TABLE sales ADD COLUMN format_date DATE;
set SQL_SAFE_UPDATES = 0;
-- 2. Convert the text dates to real Date objects
-- This uses TRIM to remove any hidden spaces from the CSV import
UPDATE sales 
SET format_date = STR_TO_DATE(TRIM(order_date), '%d-%m-%Y');
SET SQL_SAFE_UPDATES = 1;
---finding Total Revenue, Profit, and Margin
SELECT 
    SUM(sales) AS total_revenue, 
    SUM(profit) AS total_profit,
    ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin_pct
FROM sales;
---finding Top 5 Best-Selling Products
SELECT 
    product_name, 
    SUM(sales) AS total_sales
FROM sales
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 5;
----. finding Profitability by Category
SELECT 
    category, 
    SUM(sales) AS total_sales, 
    SUM(profit) AS total_profit
FROM sales
GROUP BY category
ORDER BY total_profit DESC;
---finding monthly trend
SELECT 
    DATE_FORMAT(format_date, '%Y-%m') AS sale_month, 
    SUM(sales) AS monthly_revenue
FROM sales
GROUP BY sale_month
ORDER BY sale_month;
--- finding Regional Performance
SELECT 
    region, 
    SUM(sales) AS total_sales
FROM sales
GROUP BY region
ORDER BY total_sales DESC;
---dinding monthly sales trend
SELECT 
    DATE_FORMAT(format_date, '%Y-%m') AS sale_month, 
    SUM(sales) AS total_monthly_revenue,
    COUNT(order_date) AS number_of_orders
FROM sales
GROUP BY sale_month
ORDER BY sale_month;
