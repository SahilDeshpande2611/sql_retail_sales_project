-- Data Exploration --

-- how many sales we have --
select count(*) "Total Sales" from retail_sales;

-- how many customer we have --
select count(distinct(customer_id)) "Total unique customers" from retail_sales;

-- uniques category of products and respective sales --
select distinct(category) "Total unique category" , concat("Total Sales are :", count(category)) "Sales per category" 
from retail_sales
group by category;

select * from retail_sales;

-- Total customers in each categories --
select category, count(distinct(customer_id)) As  total_customers
from retail_sales
group by category
having count(distinct(customer_id))>=2 ;
