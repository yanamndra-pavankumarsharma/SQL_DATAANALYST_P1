--YANAMANDRA PAVAN KUMAR 
CREATE DATABASE sql_projectp2
--creating a table
CREATE TABLE RETAIL_SALES (
    transactions_id INT PRIMARY KEY,
    sale_date DATE,
    sale_time TIME,
    customer_id INT,
    gender VARCHAR(7),
    age INT,
    category VARCHAR(20),
    quantity INT,
    price_per_unit FLOAT,
    cogs FLOAT,
    total_sale FLOAT
);

SELECT*FROM retail_sales

SELECT COUNT(*) FROM retail_sales

--cleaning the data

SELECT*FROM retail_sales
WHERE
	transactions_id IS NULL
	OR	
	sale_date IS NULL
	OR
	sale_time IS NULL
	OR
	customer_id IS NULL
	OR
	gender IS NULL
	OR
	age IS NULL
	OR
	category IS NULL
	OR
	quantity IS NULL
	OR
	price_per_unit IS NULL
	OR
	cogs IS NULL
	OR
	total_sale IS NULL

DELETE FROM retail_sales
WHERE
	transactions_id IS NULL
	OR	
	sale_date IS NULL
	OR
	sale_time IS NULL
	OR
	customer_id IS NULL
	OR
	gender IS NULL
	OR
	age IS NULL
	OR
	category IS NULL
	OR
	quantity IS NULL
	OR
	price_per_unit IS NULL
	OR
	cogs IS NULL
	OR
	total_sale IS NULL

--DATA EXPLORATION

--1.HOW MANY SALES WE HAVE?
SELECT 
	COUNT(transactions_id)
FROM retail_sales	

--2.HOW MANY UNIQUE CUSTOMERS WE HAVE?
SELECT
	COUNT(DISTINCT customer_id)
FROM  retail_sales	

--3.HOW MANY UNIQUE CATEGORY WE HAVE?
SELECT
	DISTINCT category
FROM  retail_sales	

--4.AVG OF TOTAL SALES
SELECT 
	AVG(total_sale)
FROM retail_sales

--5.WHICH GENDER HAS MORE SALES
SELECT 
	gender,
	COUNT(*) AS total_sales
FROM 
	retail_sales
GROUP BY
	gender
--6.WHICH CUSTOMER HAD BOUGHT HIGHEST QUANTITY
SELECT
	customer_id ,MAX(QUANTITY) AS highest_quantity 
FROM 
	retail_sales
GROUP BY 
	customer_id
ORDER BY 
	customer_id ASC

--7.WHICH CATEGORY HAS HIGHEST PRICE_PER_UNIT?
SELECT
	  gender ,category, MAX(DISTINCT price_per_unit) as max_price_perunit
FROM 
	retail_sales
GROUP BY 
	category,gender

--DATA ANALYSIS OR BUSINESS ANALYSIS

--Write a SQL query to retrieve all columns for sales made on '2022-11-05:

SELECT*FROM
	retail_sales
WHERE
	sale_date = '2022-11-05'


--Write a SQL query to retrieve all transactions where the category 
--is 'Clothing' and the quantity sold is morethan 4 in the month of Nov-2022:
SELECT 
  *
FROM retail_sales
WHERE 
    category = 'Clothing'
    AND 
    TO_CHAR(sale_date, 'YYYY-MM') = '2022-11'
    AND
    quantity >= 4

--Write a SQL query to calculate the total sales (total_sale) for each category.:
SELECT 
	category,COUNT(*) AS total_numberOfOrders,
	sum
	(total_sale) as total_sales_foreachCATEGORY
FROM 
	retail_sales
GROUP BY 1
	
--Write a SQL query to find the average age of 
--customers who purchased items from the 'Beauty' category.:
SELECT 
	  category, avg(age) as average_age
FROM 
	retail_sales
WHERE
	category = 'Beauty'
GROUP BY 
	category

--Write a SQL query to find all transactions where the total_sale is greater than 1000.:

SELECT*FROM 
	retail_sales
WHERE
	total_sale > 1000

--Write a SQL query to find the total number of transactions
--(transaction_id) made by each gender in each category.:

SELECT 
	  gender,category,COUNT(*) FROM retail_sales AS COUNTS

GROUP BY gender,category


--Write a SQL query to calculate the average sale for each month. 
--Find out best selling month in each year:
SELECT*FROM
(
     SELECT 
	  EXTRACT(YEAR FROM sale_date)AS year,
	  EXTRACT(MONTH FROM sale_date)AS month,
	  AVG(total_sale) AS avg_sale,
	  RANK() OVER(PARTITION BY EXTRACT(YEAR FROM sale_date) ORDER BY AVG(total_sale) DESC)AS rank
     FROM 
	 retail_sales
     GROUP BY 1,2)
          as t1
WHERE RANK =1

--Write a SQL query to find the top 5 customers based on the highest total sales **:

SELECT 
	  customer_id, SUM(total_sale) as highest_TotalSales
FROM 
	retail_sales
GROUP BY 1
ORDER BY 2 asc
limit 5;

--Write a SQL query to find the number of unique 
--customers who purchased items from each category.:

SELECT 
	 category, COUNT(DISTINCT customer_id) as NOOF_customer
FROM 
	retail_sales
GROUP BY 1

--Write a SQL query to create each shift and number of orders
--(Example Morning <12, Afternoon Between 12 & 17, Evening >17):

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










	
	





	

	


	



