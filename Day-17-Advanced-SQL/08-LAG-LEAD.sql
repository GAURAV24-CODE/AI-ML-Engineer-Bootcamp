-- ============================================================
-- DAY 17 - ADVANCED SQL
-- FILE 08 - LAG / LEAD
-- PostgreSQL
-- ============================================================


-- ============================================================
-- QUERY 1: LAG
-- Get the previous order date for each customer.
-- ============================================================

SELECT
    customer_id,
    order_id,
    order_date,
    LAG(order_date) OVER (
        PARTITION BY customer_id
        ORDER BY order_date
    ) AS previous_order_date
FROM orders
ORDER BY customer_id, order_date;


-- ============================================================
-- QUERY 2: LEAD
-- Get the next order date for each customer.
-- ============================================================

SELECT
    customer_id,
    order_id,
    order_date,
    LEAD(order_date) OVER (
        PARTITION BY customer_id
        ORDER BY order_date
    ) AS next_order_date
FROM orders
ORDER BY customer_id, order_date;


-- ============================================================
-- QUERY 3: DAYS BETWEEN ORDERS
-- Calculate the number of days since the customer's
-- previous order.
-- ============================================================

SELECT
    customer_id,
    order_id,
    order_date,
    order_date
        - LAG(order_date) OVER (
            PARTITION BY customer_id
            ORDER BY order_date
        ) AS days_since_previous_order
FROM orders
ORDER BY customer_id, order_date;


-- ============================================================
-- QUERY 4: PREVIOUS ORDER QUANTITY
-- Compare current quantity with previous quantity.
-- ============================================================

SELECT
    customer_id,
    order_id,
    order_date,
    quantity,
    LAG(quantity) OVER (
        PARTITION BY customer_id
        ORDER BY order_date
    ) AS previous_quantity
FROM orders
ORDER BY customer_id, order_date;


-- ============================================================
-- QUERY 5: CHANGE IN QUANTITY
-- Calculate change from previous order quantity.
-- ============================================================

SELECT
    customer_id,
    order_id,
    order_date,
    quantity,
    quantity
        - LAG(quantity) OVER (
            PARTITION BY customer_id
            ORDER BY order_date
        ) AS quantity_change
FROM orders
ORDER BY customer_id, order_date;


-- ============================================================
-- QUERY 6: CURRENT VS PREVIOUS REVENUE
-- Compare each order's revenue with the previous order.
-- ============================================================

WITH order_revenue AS (
    SELECT
        o.customer_id,
        o.order_id,
        o.order_date,
        p.price * o.quantity AS revenue
    FROM orders o
    JOIN products p
        ON o.product_id = p.product_id
)
SELECT
    customer_id,
    order_id,
    order_date,
    revenue,
    LAG(revenue) OVER (
        PARTITION BY customer_id
        ORDER BY order_date
    ) AS previous_revenue,
    revenue
        - LAG(revenue) OVER (
            PARTITION BY customer_id
            ORDER BY order_date
        ) AS revenue_change
FROM order_revenue
ORDER BY customer_id, order_date;


-- ============================================================
-- QUERY 7: NEXT ORDER VALUE
-- Look ahead to the customer's next order value.
-- ============================================================

WITH order_revenue AS (
    SELECT
        o.customer_id,
        o.order_id,
        o.order_date,
        p.price * o.quantity AS revenue
    FROM orders o
    JOIN products p
        ON o.product_id = p.product_id
)
SELECT
    customer_id,
    order_id,
    order_date,
    revenue,
    LEAD(revenue) OVER (
        PARTITION BY customer_id
        ORDER BY order_date
    ) AS next_revenue
FROM order_revenue
ORDER BY customer_id, order_date;


-- ============================================================
-- QUERY 8: FIRST ORDER VS CURRENT ORDER
-- Compare every order with the customer's first order.
-- ============================================================

WITH order_revenue AS (
    SELECT
        o.customer_id,
        o.order_id,
        o.order_date,
        p.price * o.quantity AS revenue
    FROM orders o
    JOIN products p
        ON o.product_id = p.product_id
)
SELECT
    customer_id,
    order_id,
    order_date,
    revenue,
    FIRST_VALUE(revenue) OVER (
        PARTITION BY customer_id
        ORDER BY order_date
    ) AS first_order_revenue
FROM order_revenue
ORDER BY customer_id, order_date;


-- ============================================================
-- QUERY 9: CUSTOMER PURCHASE GAP
-- Create a feature representing the customer's
-- time gap between consecutive purchases.
-- ============================================================

WITH purchase_gaps AS (
    SELECT
        customer_id,
        order_id,
        order_date,
        order_date
            - LAG(order_date) OVER (
                PARTITION BY customer_id
                ORDER BY order_date
            ) AS purchase_gap_days
    FROM orders
)
SELECT
    customer_id,
    order_id,
    order_date,
    purchase_gap_days,
    CASE
        WHEN purchase_gap_days IS NULL THEN 'First Order'
        WHEN purchase_gap_days <= 30 THEN 'Frequent'
        WHEN purchase_gap_days <= 90 THEN 'Regular'
        ELSE 'Occasional'
    END AS customer_frequency
FROM purchase_gaps
ORDER BY customer_id, order_date;


-- ============================================================
-- QUERY 10: ADVANCED TIME-SERIES FEATURE
-- Compare current revenue with previous revenue
-- and calculate percentage change.
-- ============================================================

WITH order_revenue AS (
    SELECT
        o.customer_id,
        o.order_id,
        o.order_date,
        p.price * o.quantity AS revenue
    FROM orders o
    JOIN products p
        ON o.product_id = p.product_id
),
revenue_changes AS (
    SELECT
        customer_id,
        order_id,
        order_date,
        revenue,
        LAG(revenue) OVER (
            PARTITION BY customer_id
            ORDER BY order_date
        ) AS previous_revenue
    FROM order_revenue
)
SELECT
    customer_id,
    order_id,
    order_date,
    revenue,
    previous_revenue,
    revenue - previous_revenue AS revenue_change,
    ROUND(
        100.0 * (revenue - previous_revenue)
        / NULLIF(previous_revenue, 0),
        2
    ) AS revenue_change_percent
FROM revenue_changes
ORDER BY customer_id, order_date;