-- DAY 16: SQL FOR DATA SCIENCE
-- TOPIC: SQL for Data Science

-- Example 1: View customer data
SELECT *
FROM customers;

-- Example 2: Select useful columns
SELECT customer_name, city, income
FROM customers;

-- Example 3: Filter high-income customer
SELECT customer_name, income
FROM customers
WHERE income > 50000;

-- Example 4: Calculate average income
SELECT AVG(income) AS average_income
FROM customers;

-- Example 5: Count customers by city
SELECT city, COUNT(*) AS customer_count
FROM customers
GROUP BY city;