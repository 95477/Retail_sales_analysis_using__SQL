--Creating Table
create table retail_sales
	(
		transactions_id	int primary key,
		sale_date date,
		sale_time time,
		customer_id int,
		gender varchar(15),
		age int,
		category varchar(20),
		quantiy	int,
		price_per_unit float,
		cogs float,
		total_sale int

)



--DATA EXPLORATION
	
--Table is imported successfully now take a look on the dataset
select * from retail_sales limit 10;

--Viewing count of total record
select count(*) from retail_sales;

--Viewing Null Values wrt individual columns
select * from retail_sales
where transactions_id is NULL

select * from retail_sales
where sale_date is NULL

select * from retail_sales
where sale_time is NULL

select * from retail_sales
where customer_id is NULL

select * from retail_sales
where customer_id is NULL;

select * from retail_sales
where gender is NULL;

--in one code
select * from retail_sales
where 
	transactions_id is NULL
	OR
	sale_date is NULL
	OR 
	sale_time is NULL
	OR
	customer_id is NULL
	OR
	gender is NULL
	OR
	age is NULL
	OR
	category is NULL
	OR
	quantiy is NULL
	OR
	price_per_unit is NULL
	OR 
	cogs is NULL
	OR
	total_sale is NULL

--Lets delete the rows which contains null values
Delete from retail_sales
where
transactions_id is NULL
	OR
	sale_date is NULL
	OR 
	sale_time is NULL
	OR
	customer_id is NULL
	OR
	gender is NULL
	OR
	age is NULL
	OR
	category is NULL
	OR
	quantiy is NULL
	OR
	price_per_unit is NULL
	OR 
	cogs is NULL
	OR
	total_sale is NULL

--Data Exploration

--How many sales we have?
select count(*) as total_sales from retail_sales

--How many unique customers we have
select count(Distinct customer_id) as total_sales from retail_sales;

--How many unique categories we have?
select count(Distinct category) as total_category from retail_sales;

--What are the category names?
select distinct category from retail_sales;


--Data analysis and Business key problems and answers
--Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05'

--lets see the data
select * from retail_sales;

select * from retail_sales
	where sale_date = '2022-11-05';

--.2 Write a SQL query to retrieve all transactions where the category 
--is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022
select *
from retail_sales
	where category = 'Clothing'
	and 
	TO_CHAR(sale_date,'YYYY-MM')='2022-11'
	AND 
	quantity >= 4

--Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
--Lets see the data
select * from retail_sales;

--query
select category,sum(total_sale) as net_sales,count(*) as total_orders
	from retail_sales
	group by 1;
	
--Q.4 Write a SQL query to find the average age of customers who purchased 
--items from the 'Beauty' category.
--lets see the table
select * from retail_sales;

--query
select category,round(avg(age),2)
from retail_sales
group by category
	having category = 'Beauty';

--Q.5.write a SQL query to find all transactions where the total_ sale is greater than 1000.
--Lets see the table
select * from retail_sales;

--query
select * from retail_sales
	where total_sale >1000;

-- Q.6 Write a SQL query to find the total number of transactions (transaction_id)
--made by each gender in each category.

--lets see the data first
select * from retail_sales;

--query
select 
	category,
	gender,
	count(*) as total_transactions
from retail_sales
group by 1,2
	order by 1;

--Q.8 Write a SQL query to calculate the average sale for each month.
--Find out best selling month in each year.

--lets see the data
select * from retail_sales;

--Query
select 
	Extract(YEAR from sale_date) as year,
	Extract(MONTH from sale_date) as month,
	round(avg (total_sale),2) as avg_sale
	from retail_sales
Group by 1,2
order by year,avg_sale desc;
	




query
to find the top 5 customers based on the highest total sales
Q.9 Write a SQL query to find the number of unique custoners who purchased items from each category.
Q.10 Write a SQL query to create each shift and number of orders (Example Morning ‹=12, Afternoon Between 12 & 17, Evening >17)






	



