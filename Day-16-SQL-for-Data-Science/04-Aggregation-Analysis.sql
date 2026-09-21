-- DAY 16: SQL FOR DATA SCIENCE
-- TOPIC: Aggregation & Analysis

-- COUNT

-- Example 1: Count total customers
SELECT COUNT(*) AS total_customers
FROM customers;

-- SUM

-- Example 2: Calculate total income
SELECT SUM(income) AS total_income
FROM customers;

-- AVG

-- Example 3: Calculate average income
SELECT AVG(income) AS average_income
FROM customers;
-- MIN AND MAX

-- Example 4: Find minimum and maximum incom
SELECT
    MIN(income) AS minimum_income,
    MAX(income) AS maximum_income
FROM customers;

-- GROUP BY

-- Example 5: Count customers by city
SELECT
    city,
    COUNT(*) AS customer_count
FROM customers
GROUP BY city;

-- GROUP BY WITH AVG

-- Example 6: Average income by city
SELECT
    city,
    AVG(income) AS average_income
FROM customers
GROUP BY city;

-- GROUP BY WITH SUM

-- Example 7: Total quantity sold by product
SELECT
    product_id,
    SUM(quantity) AS total_quantity
FROM orders
GROUP BY product_id;

-- HAVING

-- Example 8: Cities with more than 1 customer
SELECT
    city,
    COUNT(*) AS customer_count
FROM customers
GROUP BY city
HAVING COUNT(*) > 1;

-- MULTIPLE AGGREGATIONS

-- Example 9: Complete income analysis
SELECT
    COUNT(*) AS total_customers,
    SUM(income) AS total_income,
    AVG(income) AS average_income,
    MIN(income) AS minimum_income,
    MAX(income) AS maximum_income
FROM customers;