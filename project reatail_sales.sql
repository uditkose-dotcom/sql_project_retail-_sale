# Data Exploration
-- how many sales we have ?
select count(*) as total_sale from retail_sales;

-- how many unique customer we have 
select count(distinct customer_id) as no_customer from retail_sales;

--
select distinct category from retail_sales;

-- Data Analytics & Business Key problems & Answers

-- My Analysis & Findings
-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022
-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)

-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
select * from retail_sales
where sale_date  = '2022-11-05' ;

-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022
SELECT
    *
FROM retail_sales
WHERE category = 'Clothing' 
and
date_format(sale_date, '%Y-%M') = '2022-11'
and
quantiy >= 4;

-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
select
	category,
 SUM(total_sale) as net_sale,
 count(*) as total_orders 
from retail_sales
group by 1 ;

-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
select 
	round(AVG(age),2)
From retail_sales 
where category = 'beauty'

-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
select * from retail_sales
where total_sale > 1000

-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
select 
    category,
     gender,
     count(*) as Total_trans
from retail_sales
group by 
category,
     gender
     order by 1
     
-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
SELECT year,
       month, 
       avg_sale 
       from (
    YEAR(sale_date) AS year,
    MONTH(sale_date) AS month,
    AVG(total_sale) AS avg_sale,
    RANK() OVER(
        PARTITION BY YEAR(sale_date)
        ORDER BY AVG(total_sale) DESC
    ) AS rank
FROM retail_sales
GROUP BY 1,2
) as t1
where rank = 1 
   
-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
select 
customer_id as customer_number,
sum(total_sale) as total_sale
from retail_sales
group by 1
order by 2 desc
 limit 5
 
 -- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
 select
 category,
 count(distinct customer_id) as total_customer
 from retail_sales
 group by 1;
 
 -- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)
with hourly_sale
as
 (select *,
 case 
     when hour(sale_time) < 12 then 'morning'
     when hour(sale_time) between 12 and 17 then 'afternoon'
     else 'evening'
end as shift
 from retail_sales) 
 select shift,
 count(*) as total_orders
from hourly_sale
 group by shift;