# 🛒 Retail Sales SQL Analysis Project

**Status:** Completed · **Portfolio Project**  
**Tools:** MySQL · SQL Workbench/J · CSV

---

## 📌 Project Overview

This project is designed to demonstrate my SQL skills and techniques in data analysis. It involves exploring, cleaning, and analyzing retail sales data to answer real business questions. The project covers database setup, data cleaning, and advanced SQL querying to extract meaningful insights.

---

## 🗃️ 1. Database Setup

**Database Creation**
```sql
CREATE DATABASE Project2;
```

**Table Creation**
```sql
CREATE TABLE retail_sales (
    transactions_id    INT PRIMARY KEY,
    sale_date          DATE,
    sale_time          TIME,
    customer_id        INT,
    gender             VARCHAR(15),
    age                INT,
    category           VARCHAR(15),
    quantiy            INT,
    price_per_unit     FLOAT,
    cogs               FLOAT,
    total_sale         FLOAT
);
```

**Check for NULLs in Transactions**
```sql
SELECT *
FROM retail_sales
WHERE transactions_id IS NULL;
```

---

## 🔍 2. Data Exploration & Cleaning

**Total Number of Records**
```sql
SELECT COUNT(*) AS total_sale 
FROM retail_sales;
```

**Unique Customers**
```sql
SELECT COUNT(DISTINCT customer_id) AS total_customers 
FROM retail_sales;
```

**Unique Categories**
```sql
SELECT COUNT(DISTINCT category) AS category_count 
FROM retail_sales;

SELECT DISTINCT category 
FROM retail_sales;
```

---

## 📊 3. Data Analysis & Findings

1. **Retrieve all columns for sales made on '2022-11-05'**
```sql
SELECT *
FROM retail_sales
WHERE sale_date = '2022-11-05';
```

2. **Retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 3 in the month of Nov-2022**
```sql
SELECT *
FROM retail_sales
WHERE category = 'Clothing'
  AND quantiy > 3
  AND sale_date >= '2022-11-01'
  AND sale_date < '2022-12-01';
```

3. **Calculate the total sales (Total_sales) for each category and total orders**
```sql
SELECT 
    category,
    SUM(total_sale) AS Net_sale,
    COUNT(*) AS Total_orders
FROM retail_sales
GROUP BY category;
```

4. **Find the average age of customers who purchased items from the 'Beauty' category**
```sql
SELECT AVG(age) AS avg_age
FROM retail_sales
WHERE category = 'Beauty';
```

5. **Find all transactions where the total_sales is greater than 1000**
```sql
SELECT *
FROM retail_sales
WHERE total_sale > 1000;
```

6. **Find total number of transactions (Transaction_id) made by each gender in each category**
```sql
SELECT
    gender,
    category,
    COUNT(DISTINCT transactions_id) AS Total_No
FROM retail_sales
GROUP BY gender, category;
```

7. **Calculate the average sale for each month**
```sql
SELECT
    YEAR(sale_date) AS year,
    MONTH(sale_date) AS month,
    AVG(total_sale) AS avg_monthly_sales
FROM retail_sales
GROUP BY year, month
ORDER BY year, month, avg_monthly_sales DESC;
```

8. **Find the top 5 customers based on the highest total sales**
```sql
SELECT
    customer_id,
    SUM(total_sale) AS Total_sales
FROM retail_sales
GROUP BY customer_id
ORDER BY Total_sales DESC
LIMIT 5;
```

9. **Find out the number of customers who purchased items from each category**
```sql
SELECT
    category,
    COUNT(DISTINCT customer_id) AS Customer_No
FROM retail_sales
GROUP BY category;
```

10. **Create each shift and gender of orders (Example morning shift <=12, Afternoon 12–17, Evening >17)**
```sql
WITH Hourly_sales AS (
    SELECT *,
        CASE
            WHEN EXTRACT(HOUR FROM sale_time) < 12 THEN 'Morning'
            WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
            ELSE 'Evening'
        END AS Shift
    FROM retail_sales
)
SELECT
    shift,
    COUNT(*) AS total_orders
FROM Hourly_sales
GROUP BY shift;
```

---

## 📈 Key Findings

• Customer Demographics: Sales span various age groups and product categories like Clothing and Beauty.  
• High-Value Transactions: Several purchases exceeded 1000 in value, signaling a high-spend segment.  
• Sales Trends: Monthly sales analysis shows spikes around peak seasons.  
• Top Customers: Identified high-spending customers who contribute significantly to total revenue.  
• Popular Categories: Clothing leads in volume, while Electronics often dominates in revenue.

---

## ✅ Conclusion

The insights derived from this project demonstrate the power of SQL in analyzing complex retail sales data. By exploring, cleaning, and querying the dataset, I uncovered trends in sales performance, customer purchasing behavior, and product demand. The findings from this project can help drive business decisions by understanding sales patterns, customer behavior, and product performance—supporting strategies aimed at improving revenue, inventory planning, and targeted marketing.

---

## 🙋‍♂️ Contact

**Moses O. · Data Analyst**  
📫 LinkedIn: [www.linkedin.com/in/moses-ogilo](https://www.linkedin.com/in/moses-ogilo)  
✉️ Email: mosesogilo@gmail.com

*Feel free to reach out for questions, feedback, or collaboration!*
