#---SQL Retail Sales Analysis

##-------Creating a database called Project 2

create database Project2;

#--Create table
create table Retail_Sales
			(
			transactions_id	 int primary Key ,
			sale_date	date,
			sale_time time,	
			customer_id int,
			gender varchar(15),
			age int,	
			category varchar (15),	
			quantiy	Int,
            price_per_unit  float,
			cogs float,	
			total_sale float
			);
            
  Select *
  from retail_sales;
  
  
select count(*)
from  retail_sales;
   
   #--Data Cleaning
select *
from retail_sales
where transactions_id is Null;  

  select *
from retail_sales
where sale_date is Null;   

      select *
from retail_sales
where sale_time is Null; 

select *
from retail_sales
where customer_id is null
or
gender is null
or
category is null
or
quantiy is null
or
price_per_unit is null
or
cogs is null
or
total_sale is null;

#--Rows with null not imported

#--DATA Exploration

#-- How many records we have

select count(*) as total_sale 
from retail_sales;						#--1987

#--How many Customers we have?
select count(customer_id) as total_sale 
from retail_sales;										

 select count(distinct customer_id) as total_sale 
from retail_sales;         										# --155

#--Total number of category available 
Select count(distinct category) 
from retail_sales;											#--3

Select distinct category
from retail_sales;										#---Beauty, Clothing and Electronics

#--DARTA ANALYSIS

#--1. Write an sql query to retrive all columns for sales made on '2022-11-05'

select *
from retail_sales
where sale_date = '2022-11-05';

#--2. Write an 	SQL query to retrive all transactions where the category is 'Clothing' and the quantity sold is more than 3 in the month of Nov-2022

Select 
	category,
    sum(quantiy)
    from retail_sales
    where category ='Clothing';
    
SELECT *
FROM retail_sales
WHERE category = 'Clothing'
AND quantiy >3
  AND sale_date >= '2022-10-01'
  AND sale_date < '2022-11-01';
  
  #--3. Write an SQL query to calculate the total sales (Total_sales) for each category and total orders
  
  select 
	category,
    sum(total_sale) as Net_sale
  from retail_sales
  group by category;
    
  select 
	category,
    sum(total_sale) as Net_sale,
    count(*) as Total_orders
  from retail_sales
  group by category;
  
  #--4. Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category
  
  select *
from retail_sales
where category= 'Beauty';
  
    select 
    avg(age) as avg_age
from retail_sales
where category= 'Beauty';


#--5.  Write a SQL query to find all transactions where the total_sales is greater tha 1000

select*
from retail_sales
where total_sale>1000;

#--6. Write a SQL query to find total number of  transactions (Transaction_id) made by each gender in each category

select
	gender,
    category,
	count(distinct transactions_id) as Total_No
    from retail_sales
    group by gender,
    category;
    
    #--7. Write a SQL query to calculate the average sale for each month. 
    
select
    YEAR(sale_date) as  year,
    MONTH(sale_date) as  month,
    AVG(total_sale) as avg_monthly_sales
from retail_sales
group by
    YEAR(sale_date),
    MONTH(sale_date)
order by
    year, month, avg_monthly_sales desc;
  
  #-- Write an SQL query to find the top 5 customers based on the highest total sales
  
select
    customer_id,
    Sum(total_sale) AS Total_sales
from retail_sales
group by customer_id
order by total_sales desc
limit 5; 

#--9. Write a SQL  query to find out the number of customers who purchased items from each category

select
category,
count(distinct customer_id) as Customer_No
from retail_sales
group by category;


#--10. Write a sql quey to create each shift and gender of orders (Example morning shift <=2, Afternoon 12 & 17, Evening >17)
 
 With Hourly_sales
 as
 (
  select *,
	case
		When extract(Hour From Sale_time) <12  Then 'Morning'
        when  extract(Hour From Sale_time) between 12 and 17 then 'Afternoon'
        Else 'Evening'
	End as  Shift
From retail_sales
)
select
shift,
	 count(*) as total_orders
from Hourly_Sales
Group by shift;
  
  
#--End of Project
  
  
  
    
    
    
    















            
            