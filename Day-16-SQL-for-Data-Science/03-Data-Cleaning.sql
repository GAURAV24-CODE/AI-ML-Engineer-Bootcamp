-- DAY 16: SQL FOR DATA SCIENCE
-- TOPIC: Data Cleaning

-- NULL VALUES

-- Example 1: Find customers with missing city
SELECT *
FROM customers
WHERE city IS NULL;

-- COALESCE

-- Example 2: Replace NULL city with Unknown
SELECT customer_name,
       COALESCE(city, 'Unknown') AS city
FROM customers;

-- CASE

-- Example 3: Create income categor
SELECT customer_name,
       income,
       CASE
           WHEN income >= 60000 THEN 'High'
           WHEN income >= 40000 THEN 'Medium'
           ELSE 'Low'
       END AS income_category
FROM customers;

-- DUPLICATES

-- Example 4: Check duplicate customer names
SELECT customer_name, COUNT(*) AS name_count
FROM customers
GROUP BY customer_name
HAVING COUNT(*) > 1;

-- DATA TYPE CASTING

-- Example 5: Convert income to integer
SELECT customer_name,
       income,
       income::INTEGER AS income_integer
FROM customers;

-- Example 6: Convert quantity to numeric
SELECT order_id,
       quantity,
       quantity::NUMERIC AS quantity_numeric
FROM orders;

-- CLEANING WITH TRIM

-- Example 7: Remove extra spaces from customer names
SELECT TRIM(customer_name) AS cleaned_name
FROM customers;

-- HANDLE NULL WITH COALESCE

-- Example 8: Replace missing income with 0
SELECT customer_name,
       COALESCE(income, 0) AS cleaned_income
FROM customers;

-- CLEANED DATASET

-- Example 9: Create a clean customer view
SELECT
    customer_id,
    TRIM(customer_name) AS customer_name,
    age,
    COALESCE(city, 'Unknown') AS city,
    COALESCE(income, 0) AS income
FROM customers;