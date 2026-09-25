-- ============================================================
-- DAY 17 - ADVANCED SQL
-- FILE 10 - ADVANCED CASE
-- PostgreSQL
-- ============================================================


-- ============================================================
-- QUERY 1: CUSTOMER INCOME SEGMENT
-- ============================================================

SELECT
    customer_id,
    customer_name,
    income,
    CASE
        WHEN income < 50000 THEN 'Low Income'
        WHEN income < 80000 THEN 'Middle Income'
        WHEN income < 100000 THEN 'High Income'
        ELSE 'Very High Income'
    END AS income_segment
FROM customers
ORDER BY income DESC;


-- ============================================================
-- QUERY 2: CUSTOMER AGE GROUP
-- ============================================================

SELECT
    customer_id,
    customer_name,
    age,
    CASE
        WHEN age < 25 THEN 'Young'
        WHEN age BETWEEN 25 AND 35 THEN 'Adult'
        WHEN age BETWEEN 36 AND 50 THEN 'Experienced'
        ELSE 'Senior'
    END AS age_group
FROM customers
ORDER BY age;


-- ============================================================
-- QUERY 3: PRODUCT PRICE CATEGORY
-- ============================================================

SELECT
    product_id,
    product_name,
    price,
    CASE
        WHEN price < 3000 THEN 'Budget'
        WHEN price < 10000 THEN 'Mid Range'
        WHEN price < 30000 THEN 'Premium'
        ELSE 'High End'
    END AS price_category
FROM products
ORDER BY price DESC;


-- ============================================================
-- QUERY 4: ORDER DISCOUNT CATEGORY
-- ============================================================

SELECT
    order_id,
    quantity,
    discount,
    CASE
        WHEN discount = 0 THEN 'No Discount'
        WHEN discount <= 5 THEN 'Low Discount'
        WHEN discount <= 10 THEN 'Medium Discount'
        ELSE 'High Discount'
    END AS discount_category
FROM orders
ORDER BY discount DESC;


-- ============================================================
-- QUERY 5: CUSTOMER VALUE SEGMENT
-- Based on total spending
-- ============================================================

WITH customer_spending AS (
    SELECT
        o.customer_id,
        SUM(p.price * o.quantity * (1 - o.discount / 100)) AS total_spending
    FROM orders o
    JOIN products p
        ON o.product_id = p.product_id
    GROUP BY o.customer_id
)
SELECT
    customer_id,
    ROUND(total_spending, 2) AS total_spending,
    CASE
        WHEN total_spending < 10000 THEN 'Low Value'
        WHEN total_spending < 50000 THEN 'Medium Value'
        WHEN total_spending < 100000 THEN 'High Value'
        ELSE 'VIP'
    END AS customer_segment
FROM customer_spending
ORDER BY total_spending DESC;


-- ============================================================
-- QUERY 6: ORDER REVENUE CLASSIFICATION
-- ============================================================

SELECT
    o.order_id,
    o.order_date,
    p.product_name,
    p.price * o.quantity AS gross_revenue,
    ROUND(
        p.price * o.quantity * (1 - o.discount / 100),
        2
    ) AS net_revenue,
    CASE
        WHEN p.price * o.quantity * (1 - o.discount / 100) < 5000
            THEN 'Small Order'
        WHEN p.price * o.quantity * (1 - o.discount / 100) < 20000
            THEN 'Medium Order'
        ELSE 'Large Order'
    END AS order_category
FROM orders o
JOIN products p
    ON o.product_id = p.product_id
ORDER BY net_revenue DESC;


-- ============================================================
-- QUERY 7: MULTI-CONDITION CUSTOMER CLASSIFICATION
-- Income + Age
-- ============================================================

SELECT
    customer_id,
    customer_name,
    age,
    income,
    CASE
        WHEN income >= 80000 AND age >= 30
            THEN 'High Income Experienced'
        WHEN income >= 80000 AND age < 30
            THEN 'High Income Young'
        WHEN income < 50000 AND age < 25
            THEN 'Young Low Income'
        WHEN income < 50000
            THEN 'Low Income'
        ELSE 'Standard Customer'
    END AS customer_profile
FROM customers
ORDER BY income DESC;


-- ============================================================
-- QUERY 8: EMPLOYEE SALARY BAND
-- ============================================================

SELECT
    employee_id,
    employee_name,
    salary,
    CASE
        WHEN salary < 80000 THEN 'Junior'
        WHEN salary < 90000 THEN 'Mid Level'
        WHEN salary < 110000 THEN 'Senior'
        ELSE 'Leadership'
    END AS salary_band
FROM employees
ORDER BY salary DESC;


-- ============================================================
-- QUERY 9: ML-READY CUSTOMER FEATURES
-- Create categorical features from numerical values.
-- ============================================================

SELECT
    customer_id,
    customer_name,
    age,
    income,

    CASE
        WHEN age < 25 THEN 0
        WHEN age <= 35 THEN 1
        ELSE 2
    END AS age_group_encoded,

    CASE
        WHEN income < 50000 THEN 0
        WHEN income < 80000 THEN 1
        WHEN income < 100000 THEN 2
        ELSE 3
    END AS income_group_encoded,

    CASE
        WHEN age < 30 AND income >= 70000 THEN 1
        ELSE 0
    END AS young_high_income_flag

FROM customers
ORDER BY customer_id;


-- ============================================================
-- QUERY 10: ADVANCED BUSINESS RULE CLASSIFICATION
-- ============================================================

WITH customer_orders AS (
    SELECT
        c.customer_id,
        c.customer_name,
        c.income,
        COUNT(o.order_id) AS order_count,
        COALESCE(
            SUM(
                p.price * o.quantity *
                (1 - o.discount / 100)
            ),
            0
        ) AS total_spending
    FROM customers c
    LEFT JOIN orders o
        ON c.customer_id = o.customer_id
    LEFT JOIN products p
        ON o.product_id = p.product_id
    GROUP BY
        c.customer_id,
        c.customer_name,
        c.income
)
SELECT
    customer_id,
    customer_name,
    income,
    order_count,
    ROUND(total_spending, 2) AS total_spending,
    CASE
        WHEN order_count >= 3
             AND total_spending >= 50000
            THEN 'Highly Engaged VIP'

        WHEN order_count >= 2
             AND total_spending >= 30000
            THEN 'High Value Customer'

        WHEN order_count >= 1
             AND total_spending >= 10000
            THEN 'Active Customer'

        WHEN order_count >= 1
            THEN 'Low Value Customer'

        ELSE 'No Purchase'
    END AS customer_status
FROM customer_orders
ORDER BY total_spending DESC;