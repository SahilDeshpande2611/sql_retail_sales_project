-- checking null values (Data cleaning) --

SELECT * FROM retail_sales
where transactions_id is null;

SELECT * FROM retail_sales
where sale_date is null;

SELECT * FROM retail_sales
where sale_time is null;

SELECT * FROM retail_sales
where customer_id is null;

SELECT * FROM retail_sales
where gender is null;

SELECT * FROM retail_sales
where age is null;

SELECT * FROM retail_sales
where category is null;

SELECT * FROM retail_sales
where quantiy is null;

SELECT * FROM retail_sales
where price_per_unit is null;

SELECT * FROM retail_sales
where cogs is null;

SELECT * FROM retail_sales;

use sql_project_p1

