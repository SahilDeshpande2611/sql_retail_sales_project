-- checking null values (Data cleaning) --

use sql_project_p1


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

--OR--

SELECT * FROM retail_sales
WHERE 
    sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL OR 
    gender IS NULL OR age IS NULL OR category IS NULL OR 
    quantity IS NULL OR price_per_unit IS NULL OR cogs IS NULL;

-- Deleting NULL values -- 

DELETE FROM retail_sales
WHERE 
    sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL OR 
    gender IS NULL OR age IS NULL OR category IS NULL OR 
    quantity IS NULL OR price_per_unit IS NULL OR cogs IS NULL;


