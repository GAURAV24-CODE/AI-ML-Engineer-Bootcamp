# Day 16 — SQL for Data Science 🐘📊

## 📌 Overview

Day 16 focuses on using **SQL for Data Science and Data Analysis**.

The goal is to move beyond basic SQL queries and learn how SQL can be used for:

- Data Extraction
- Data Cleaning
- Data Analysis
- Joining Multiple Tables
- Advanced Querying
- Feature Engineering
- Creating ML-ready datasets

All practical work was performed using **PostgreSQL**.

---

## 🎯 Learning Objectives

By the end of Day 16, I practiced how to:

- Extract useful data using SQL
- Filter and sort datasets
- Handle NULL values
- Clean and transform data
- Perform aggregations
- Join multiple tables
- Use subqueries
- Build queries using CTEs
- Apply window functions
- Perform date and time analysis
- Use CASE for conditional logic
- Create data science features using SQL
- Prepare datasets for Machine Learning

---

## 🗂️ Topics Covered

### 1. SQL for Data Science
- SELECT
- WHERE
- Column selection
- Basic analysis
- COUNT()
- AVG()
- GROUP BY

### 2. Data Extraction
- SELECT
- WHERE
- DISTINCT
- ORDER BY
- LIMIT

### 3. Data Cleaning
- NULL values
- IS NULL
- COALESCE()
- CASE
- Duplicate detection
- Type casting
- TRIM()

### 4. Aggregation & Analysis
- COUNT()
- SUM()
- AVG()
- MIN()
- MAX()
- GROUP BY
- HAVING
- Multiple aggregations

### 5. JOINs
- INNER JOIN
- LEFT JOIN
- RIGHT JOIN
- FULL OUTER JOIN
- Multiple-table JOINs
- JOIN with calculations
- JOIN with GROUP BY

### 6. Subqueries
- Single-row subqueries
- Multi-row subqueries
- IN
- NOT IN
- Nested subqueries
- Aggregate subqueries

### 7. Common Table Expressions (CTEs)
- WITH
- Basic CTEs
- CTE with filtering
- CTE with aggregation
- CTE with JOINs
- Multiple CTEs
- Multi-step analysis

### 8. Window Functions
- ROW_NUMBER()
- RANK()
- DENSE_RANK()
- PARTITION BY
- Running totals
- LAG()
- LEAD()

### 9. Date & Time Analysis
- EXTRACT()
- Year extraction
- Month extraction
- Day extraction
- Day of week
- DATE_TRUNC()
- Date filtering
- Date difference

### 10. CASE & Conditional Logic
- Basic CASE
- Conditional categories
- CASE with calculations
- CASE with aggregation
- CASE with GROUP BY
- CASE with ORDER BY

### 11. SQL Feature Engineering
- Calculated features
- Ratio features
- Age groups
- Income categories
- Order value
- Customer spending
- Order frequency
- Average order value
- Combined customer features

### 12. Data Science Practice
- Above-average customers
- Customer spending analysis
- Top products
- Customer ranking
- Monthly sales
- Customer segmentation
- ML-ready feature dataset

---

## 🗄️ Database Structure

### Database

`sql_day16_datascience`

### Tables

#### customers

| Column | Description |
|---|---|
| customer_id | Unique customer ID |
| customer_name | Customer name |
| age | Customer age |
| city | Customer city |
| income | Customer income |

#### products

| Column | Description |
|---|---|
| product_id | Unique product ID |
| product_name | Product name |
| category | Product category |
| price | Product price |

#### orders

| Column | Description |
|---|---|
| order_id | Unique order ID |
| customer_id | Customer reference |
| product_id | Product reference |
| order_date | Date of order |
| quantity | Quantity ordered |

---

## 🔗 Database Relationships

```text
customers
    │
    │ customer_id
    ▼
 orders
    │
    │ product_id
    ▼
products
