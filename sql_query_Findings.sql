-- Data Analysis & Business Key problems & Answers--

-- Q1] Write a SQL query to retrieve all columns for sales made on '2022-11-05':

SELECT *
FROM RETAIL_SALES
WHERE SALE_DATE='2022-11-05';

-- Q2] Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 3 in the month of Nov-2022:

SELECT *
FROM RETAIL_SALES 
WHERE CATEGORY='Clothing' AND SALE_DATE LIKE '2022-11-%' AND QUANTIY>=4;

-- Q3] Write a SQL query to calculate the total sales (total_sale) for each category.:

SELECT CATEGORY , SUM(Total_sale) as "Total_sales"
from RETAIL_SALES
group by category; 

-- Q4] Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.:

SELECT ROUND(AVG(AGE),2) , CATEGORY
FROM RETAIL_SALES
WHERE CATEGORY='BEAUTY'
GROUP BY CATEGORY;


-- Q5] Write a SQL query to find all the count transactions where the total_sale is greater than 1000.:

SELECT count(*)
FROM RETAIL_SALES
WHERE TOTAL_SALE>1000;


-- Q6] Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.:

select gender,category , count(*) as COUNT_PER_GENDER
from Retail_sales
group by gender,category 
ORDER BY 2;

-- Q7] Write a SQL query to calculate the average sale for each month :

SELECT AVG(TOTAL_SALE) AS 'TOTAL_SALES' , date_format(SALE_DATE,'%M') AS 'Month'
FROM RETAIL_SALES
GROUP BY date_format(SALE_DATE,'%M') 
ORDER BY AVG(TOTAL_SALE) DESC
LIMIT 1;

-- Q8] Write a SQL query to find the top 5 customers based on the highest total sales **:

select customer_id, SUM(total_sale) AS 'TOTAL_SALE_OF_CUSTOMER'
from RETAIL_SALES
GROUP BY CUSTOMER_ID
ORDER BY 2 DESC
LIMIT 5 ;


-- Q9] Write a SQL query to find the number of unique customers who purchased items from each category.:

SELECT  count(distinct(Customer_id)) 'Unique customers' , Retail_sales.category
from Retail_sales
group by 2 ;

-- Q10] Write a SQL query to calculate the average sale for each month. Find out best selling month in each year:

SELECT YEAR, MONTH, ROUND(AVEGARE_SALES,2) AS 'TOP SELLING MONTH AVEAGRE SALE'
FROM(select date_format(sale_date,'%M') AS MONTH , date_format(sale_date,'%Y') AS YEAR , AVG(TOTAL_SALE) AS AVEGARE_SALES , rank() over ( partition by date_format(sale_date,'%Y') order by AVG(total_sale) desc) AS R1
from retail_sales 
GROUP BY 1 ,2 
)AS T
WHERE R1=1;

-- Q11] Develop a unique code for each customer 

select Customer_id ,
case 
when length(customer_id)<=2 then concat (substr(category,1,1 ) ,concat(substr(gender,2,1), concat(customer_id,date_format(sale_date,'%d')))) 
when length(customer_id)>2 then concat (substr(category,1,1 ), concat(customer_id,substr(age,2,1)))
end AS UNIQUE_CODE
from retail_sales;


-- Q12] Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17):

WITH hourly_sale

AS
(
SELECT *,
    CASE
        WHEN EXTRACT(HOUR FROM sale_time) < 12 THEN 'Morning'
        WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END as shift
FROM retail_sales
)
SELECT 
    shift,
    COUNT(*) as total_orders    
FROM hourly_sale
GROUP BY shift

