-- DAY 16: SQL FOR DATA SCIENCE
-- TOPIC: Data Extraction

-- SELECT

-- Example 1: Select all columns
SELECT *
FROM customers;

-- Example 2: Select specific columns
SELECT customer_name, city, income
FROM customers;

-- WHERE

-- Example 3: Customers from Nashik
SELECT *
FROM customers
WHERE city = 'Nashik';

-- Example 4: Customers with income above 5000
SELECT customer_name, income
FROM customers
WHERE income > 50000;

-- DISTINCT

-- Example 5: Unique cities
SELECT DISTINCT city
FROM customers;

-- ORDER BY

-- Example 6: Highest income first
SELECT customer_name, income
FROM customers
ORDER BY income DESC;

-- Example 7: Lowest income first
SELECT customer_name, income
FROM customers
ORDER BY income ASC;

-- LIMIT

-- Example 8: Top 3 highest-income customers
SELECT customer_name, income
FROM customers
ORDER BY income DESC
LIMIT 3;

-- Example 9: First 5 customers
SELECT *
FROM customers
LIMIT 5;