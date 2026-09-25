-- ============================================================
-- DAY 17 - ADVANCED SQL
-- FILE 01 - ADVANCED SELECT
-- PostgreSQL
-- ============================================================


-- ============================================================
-- QUERY 1: DISTINCT VALUES
-- Find all unique customer cities.
-- ============================================================

SELECT DISTINCT city
FROM customers;


-- ============================================================
-- QUERY 2: CALCULATED COLUMNS
-- Calculate annual income from monthly income.
-- ============================================================

SELECT
    customer_id,
    customer_name,
    income,
    income * 12 AS annual_income
FROM customers;


-- ============================================================
-- QUERY 3: MULTIPLE CALCULATED COLUMNS
-- Calculate income per year and income per month.
-- ============================================================

SELECT
    customer_id,
    customer_name,
    income,
    income * 12 AS annual_income,
    income / 12 AS monthly_income
FROM customers;


-- ============================================================
-- QUERY 4: CASE EXPRESSION
-- Categorize customers according to their income.
-- ============================================================

SELECT
    customer_id,
    customer_name,
    income,
    CASE
        WHEN income < 50000 THEN 'Low Income'
        WHEN income < 80000 THEN 'Middle Income'
        ELSE 'High Income'
    END AS income_category
FROM customers;


-- ============================================================
-- QUERY 5: CONDITIONAL CALCULATION
-- Calculate a customer risk/priority score.
-- ============================================================

SELECT
    customer_id,
    customer_name,
    age,
    income,
    CASE
        WHEN age < 25 AND income < 50000 THEN 'High Priority'
        WHEN income >= 80000 THEN 'Premium'
        ELSE 'Standard'
    END AS customer_segment
FROM customers;


-- ============================================================
-- QUERY 6: DISCOUNTED ORDER VALUE
-- Calculate the final value of each order after discount.
-- ============================================================

SELECT
    o.order_id,
    o.customer_id,
    o.product_id,
    p.product_name,
    p.price,
    o.quantity,
    o.discount,
    p.price * o.quantity AS gross_amount,
    p.price * o.quantity * (1 - o.discount / 100) AS final_amount
FROM orders o
JOIN products p
    ON o.product_id = p.product_id;


-- ============================================================
-- QUERY 7: ORDER BY CALCULATED VALUE
-- Find the highest-value orders first.
-- ============================================================

SELECT
    o.order_id,
    p.product_name,
    o.quantity,
    p.price,
    p.price * o.quantity AS order_value
FROM orders o
JOIN products p
    ON o.product_id = p.product_id
ORDER BY order_value DESC;


-- ============================================================
-- QUERY 8: TOP CUSTOMERS USING LIMIT
-- Find the five customers with the highest income.
-- ============================================================

SELECT
    customer_id,
    customer_name,
    city,
    income
FROM customers
ORDER BY income DESC
LIMIT 5;


-- ============================================================
-- QUERY 9: OFFSET FOR PAGINATION
-- Skip the first five customers and return the next five.
-- ============================================================

SELECT
    customer_id,
    customer_name,
    city,
    income
FROM customers
ORDER BY customer_id
LIMIT 5 OFFSET 5;


-- ============================================================
-- QUERY 10: FEATURE-READY SELECT
-- Create useful features for a future ML dataset.
-- ============================================================

SELECT
    customer_id,
    customer_name,
    age,
    income,
    income / NULLIF(age, 0) AS income_age_ratio,
    CASE
        WHEN age < 25 THEN 'Young'
        WHEN age < 35 THEN 'Adult'
        ELSE 'Senior'
    END AS age_group,
    CASE
        WHEN income >= 80000 THEN 1
        ELSE 0
    END AS high_income_flag
FROM customers
ORDER BY income DESC;