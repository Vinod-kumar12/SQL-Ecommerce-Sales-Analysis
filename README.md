E-commerce Sales Performance & Trend Analysis (SQL)

📌 Project Overview
This project involves a comprehensive analysis of over 3,500 sales records to identify key revenue drivers and growth patterns. As a B.Tech graduate in Computer Science and AI, I managed the entire data lifecycle—from designing the database schema in MySQL to cleaning "dirty" data and performing analytical querying to support business decision-making.

🛠️ Tech Stack & Skills
-> Database Tool: MySQL Workbench
-> Language: SQL
-> Data Cleaning: Handling "Safe Update Mode" (Error 1175) and using STR_TO_DATE with TRIM to fix inconsistent string-based dates.
-> Analysis Techniques: Aggregations (SUM, COUNT), Grouping, and Date Formatting for time-series trends.

🧹 Data Cleaning Process
1. A critical part of this project was transforming the raw order_date (imported as a VARCHAR) into a functional DATE type to enable accurate time-series analysis.
2. Schema Adjustment: Added a new formatted_date column to the sales table.
3.Bypassing Safe Updates: Temporarily disabled safe mode to allow for bulk data transformation.
4.Transformation: Used the STR_TO_DATE function to convert DD-MM-YYYY strings into SQL-standard dates.

SQL
SET SQL_SAFE_UPDATES = 0;
UPDATE sales 
SET formatted_date = STR_TO_DATE(TRIM(order_date), '%d-%m-%Y');
SET SQL_SAFE_UPDATES = 1;

📊 Business Insights Generated
->Financial Health: The business generated $10,667,881 in total revenue with a consistent 17.29% profit margin.
->Top Performer: Electronics is the dominant category, contributing $5,326,074 (nearly 50% of total revenue).
->Best-Selling Products: Cameras ($1.17M) and Monitors ($1.16M) are the highest individual revenue drivers.
->Regional Strength: The West Region leads all territories with $2,844,450 in total sales.
->Growth Opportunity: The North Region currently trails in sales ($2.48M), representing a key area for targeted marketing.
->Sales Volatility: Monthly trends show high variance, such as a peak in January ($341,544) followed by a significant dip in February ($208,775).
->Regional Strength: The West Region ($2.8M) currently leads in sales volume.

📂 Repository Structure
-> ecommerce_sales_data.csv: The raw dataset used for the analysis.
-> analysis_queries.sql: The full SQL script including table setup, cleaning, and business logic.
-> README.md: Project documentation and summarized insights.

🚀 How to Run
1.Open MySQL Workbench and execute the setup script in analysis_queries.sql to create the EcommerceProject database and sales table.
2.Import the provided CSV file using the Table Data Import Wizard.
3.Run the Data Cleaning and Business Analysis sections of the script to generate the results.
