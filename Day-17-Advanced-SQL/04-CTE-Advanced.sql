-- ============================================================
-- DAY 17 - ADVANCED SQL
-- FILE 04 - ADVANCED CTE
-- PostgreSQL
-- ============================================================


-- ============================================================
-- QUERY 1: BASIC CTE
-- Calculate average customer income.
-- ============================================================

WITH income_summary AS (
    SELECT
        AVG(income) AS average_income
    FROM customers
)
SELECT
    average_income
FROM income_summary;


-- ============================================================
-- QUERY 2: CTE + FILTER
-- Find customers earning above the overall average income.
-- ============================================================

WITH income_summary AS (
    SELECT
        AVG(income) AS average_income
    FROM customers
)
SELECT
    c.customer_id,
    c.customer_name,
    c.income
FROM customers c
CROSS JOIN income_summary i
WHERE c.income > i.average_income;


-- ============================================================
-- QUERY 3: CTE FOR ORDER REVENUE
-- Calculate revenue before performing further analysis.
-- ============================================================

WITH order_revenue AS (
    SELECT
        o.order_id,
        o.customer_id,
        o.product_id,
        o.quantity,
        p.price,
        p.price * o.quantity AS revenue
    FROM orders o
    JOIN products p
        ON o.product_id = p.product_id
)
SELECT
    *
FROM order_revenue
ORDER BY revenue DESC;


-- ============================================================
-- QUERY 4: CTE + AGGREGATION
-- Calculate total revenue for each customer.
-- ============================================================

WITH order_revenue AS (
    SELECT
        o.customer_id,
        p.price * o.quantity AS revenue
    FROM orders o
    JOIN products p
        ON o.product_id = p.product_id
)
SELECT
    c.customer_id,
    c.customer_name,
    SUM(orv.revenue) AS total_revenue
FROM customers c
JOIN order_revenue orv
    ON c.customer_id = orv.customer_id
GROUP BY
    c.customer_id,
    c.customer_name
ORDER BY total_revenue DESC;


-- ============================================================
-- QUERY 5: MULTIPLE CTEs
-- Calculate customer revenue and compare with average revenue.
-- ============================================================

WITH customer_revenue AS (
    SELECT
        customer_id,
        SUM(p.price * o.quantity) AS total_revenue
    FROM orders o
    JOIN products p
        ON o.product_id = p.product_id
    GROUP BY customer_id
),
average_revenue AS (
    SELECT
        AVG(total_revenue) AS avg_revenue
    FROM customer_revenue
)
SELECT
    cr.customer_id,
    cr.total_revenue,
    ar.avg_revenue
FROM customer_revenue cr
CROSS JOIN average_revenue ar
WHERE cr.total_revenue > ar.avg_revenue
ORDER BY cr.total_revenue DESC;


-- ============================================================
-- QUERY 6: CTE FOR CITY ANALYSIS
-- Calculate average income by city.
-- ============================================================

WITH city_income AS (
    SELECT
        city,
        AVG(income) AS average_income,
        COUNT(*) AS customer_count
    FROM customers
    GROUP BY city
)
SELECT
    city,
    customer_count,
    ROUND(average_income, 2) AS average_income
FROM city_income
ORDER BY average_income DESC;


-- ============================================================
-- QUERY 7: CTE FOR PRODUCT PERFORMANCE
-- Calculate total quantity and revenue for each product.
-- ============================================================

WITH product_sales AS (
    SELECT
        p.product_id,
        p.product_name,
        p.category,
        SUM(o.quantity) AS total_quantity,
        SUM(p.price * o.quantity) AS total_revenue
    FROM products p
    JOIN orders o
        ON p.product_id = o.product_id
    GROUP BY
        p.product_id,
        p.product_name,
        p.category
)
SELECT
    *
FROM product_sales
ORDER BY total_revenue DESC;


-- ============================================================
-- QUERY 8: CTE + CASE
-- Classify customers according to their total spending.
-- ============================================================

WITH customer_spending AS (
    SELECT
        o.customer_id,
        SUM(p.price * o.quantity) AS total_spending
    FROM orders o
    JOIN products p
        ON o.product_id = p.product_id
    GROUP BY o.customer_id
)
SELECT
    customer_id,
    total_spending,
    CASE
        WHEN total_spending >= 100000 THEN 'Premium'
        WHEN total_spending >= 50000 THEN 'Regular'
        ELSE 'Low Value'
    END AS customer_segment
FROM customer_spending
ORDER BY total_spending DESC;


-- ============================================================
-- QUERY 9: CTE FOR ML FEATURE DATASET
-- Generate customer-level features.
-- ============================================================

WITH customer_features AS (
    SELECT
        c.customer_id,
        c.age,
        c.income,
        COUNT(o.order_id) AS total_orders,
        COALESCE(SUM(o.quantity), 0) AS total_quantity,
        COALESCE(SUM(p.price * o.quantity), 0) AS total_spending
    FROM customers c
    LEFT JOIN orders o
        ON c.customer_id = o.customer_id
    LEFT JOIN products p
        ON o.product_id = p.product_id
    GROUP BY
        c.customer_id,
        c.age,
        c.income
)
SELECT
    customer_id,
    age,
    income,
    total_orders,
    total_quantity,
    total_spending,
    CASE
        WHEN total_orders = 0 THEN 0
        ELSE total_spending / total_orders
    END AS average_order_value
FROM customer_features
ORDER BY customer_id;


-- ============================================================
-- QUERY 10: MULTI-STEP CTE PIPELINE
-- Build an analysis-ready customer dataset.
-- ============================================================

WITH customer_orders AS (
    SELECT
        c.customer_id,
        c.customer_name,
        c.city,
        c.age,
        c.income,
        o.order_id,
        o.order_date,
        o.quantity,
        p.price,
        p.price * o.quantity AS order_value
    FROM customers c
    LEFT JOIN orders o
        ON c.customer_id = o.customer_id
    LEFT JOIN products p
        ON o.product_id = p.product_id
),
customer_summary AS (
    SELECT
        customer_id,
        customer_name,
        city,
        age,
        income,
        COUNT(order_id) AS total_orders,
        COALESCE(SUM(order_value), 0) AS total_spending
    FROM customer_orders
    GROUP BY
        customer_id,
        customer_name,
        city,
        age,
        income
)
SELECT
    *,
    CASE
        WHEN total_orders = 0 THEN 'Inactive'
        WHEN total_spending >= 100000 THEN 'Premium'
        WHEN total_spending >= 50000 THEN 'Active'
        ELSE 'Regular'
    END AS customer_segment
FROM customer_summary
ORDER BY total_spending DESC;