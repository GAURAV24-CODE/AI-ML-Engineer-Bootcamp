-- ============================================================
-- DAY 17 - ADVANCED SQL
-- FILE 09 - RUNNING & MOVING AGGREGATES
-- PostgreSQL
-- ============================================================


-- ============================================================
-- QUERY 1: RUNNING ORDER QUANTITY
-- ============================================================

SELECT
    order_id,
    order_date,
    quantity,
    SUM(quantity) OVER (
        ORDER BY order_date
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND CURRENT ROW
    ) AS running_quantity
FROM orders
ORDER BY order_date;


-- ============================================================
-- QUERY 2: RUNNING REVENUE
-- ============================================================

SELECT
    o.order_id,
    o.order_date,
    p.price * o.quantity AS revenue,
    SUM(p.price * o.quantity) OVER (
        ORDER BY o.order_date
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND CURRENT ROW
    ) AS running_revenue
FROM orders o
JOIN products p
    ON o.product_id = p.product_id
ORDER BY o.order_date;


-- ============================================================
-- QUERY 3: RUNNING AVERAGE ORDER QUANTITY
-- ============================================================

SELECT
    order_id,
    order_date,
    quantity,
    ROUND(
        AVG(quantity) OVER (
            ORDER BY order_date
            ROWS BETWEEN UNBOUNDED PRECEDING
            AND CURRENT ROW
        ),
        2
    ) AS running_average_quantity
FROM orders
ORDER BY order_date;


-- ============================================================
-- QUERY 4: THREE-ORDER MOVING AVERAGE
-- Average the current order and previous two orders.
-- ============================================================

SELECT
    order_id,
    order_date,
    quantity,
    ROUND(
        AVG(quantity) OVER (
            ORDER BY order_date
            ROWS BETWEEN 2 PRECEDING
            AND CURRENT ROW
        ),
        2
    ) AS moving_average_quantity
FROM orders
ORDER BY order_date;


-- ============================================================
-- QUERY 5: THREE-ORDER MOVING REVENUE
-- ============================================================

SELECT
    o.order_id,
    o.order_date,
    p.price * o.quantity AS revenue,
    ROUND(
        AVG(p.price * o.quantity) OVER (
            ORDER BY o.order_date
            ROWS BETWEEN 2 PRECEDING
            AND CURRENT ROW
        ),
        2
    ) AS moving_average_revenue
FROM orders o
JOIN products p
    ON o.product_id = p.product_id
ORDER BY o.order_date;


-- ============================================================
-- QUERY 6: CUSTOMER RUNNING SPENDING
-- Calculate cumulative spending for each customer.
-- ============================================================

SELECT
    o.customer_id,
    o.order_id,
    o.order_date,
    p.price * o.quantity AS order_value,
    SUM(p.price * o.quantity) OVER (
        PARTITION BY o.customer_id
        ORDER BY o.order_date
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND CURRENT ROW
    ) AS running_customer_spending
FROM orders o
JOIN products p
    ON o.product_id = p.product_id
ORDER BY
    o.customer_id,
    o.order_date;


-- ============================================================
-- QUERY 7: CUSTOMER MOVING AVERAGE
-- Calculate a customer's average order value
-- over the current and previous two orders.
-- ============================================================

SELECT
    o.customer_id,
    o.order_id,
    o.order_date,
    p.price * o.quantity AS order_value,
    ROUND(
        AVG(p.price * o.quantity) OVER (
            PARTITION BY o.customer_id
            ORDER BY o.order_date
            ROWS BETWEEN 2 PRECEDING
            AND CURRENT ROW
        ),
        2
    ) AS customer_moving_average
FROM orders o
JOIN products p
    ON o.product_id = p.product_id
ORDER BY
    o.customer_id,
    o.order_date;


-- ============================================================
-- QUERY 8: RUNNING MAXIMUM REVENUE
-- Track the highest revenue seen so far.
-- ============================================================

SELECT
    o.order_id,
    o.order_date,
    p.price * o.quantity AS revenue,
    MAX(p.price * o.quantity) OVER (
        ORDER BY o.order_date
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND CURRENT ROW
    ) AS running_max_revenue
FROM orders o
JOIN products p
    ON o.product_id = p.product_id
ORDER BY o.order_date;


-- ============================================================
-- QUERY 9: REVENUE ABOVE RUNNING AVERAGE
-- ============================================================

WITH revenue_data AS (
    SELECT
        o.order_id,
        o.order_date,
        p.price * o.quantity AS revenue
    FROM orders o
    JOIN products p
        ON o.product_id = p.product_id
),
running_data AS (
    SELECT
        *,
        AVG(revenue) OVER (
            ORDER BY order_date
            ROWS BETWEEN UNBOUNDED PRECEDING
            AND CURRENT ROW
        ) AS running_average
    FROM revenue_data
)
SELECT
    order_id,
    order_date,
    revenue,
    ROUND(running_average, 2) AS running_average,
    CASE
        WHEN revenue > running_average THEN 'Above Average'
        ELSE 'At or Below Average'
    END AS performance
FROM running_data
ORDER BY order_date;


-- ============================================================
-- QUERY 10: ML TIME-SERIES FEATURES
-- Create rolling features for each customer's orders.
-- ============================================================

SELECT
    o.customer_id,
    o.order_id,
    o.order_date,
    p.price * o.quantity AS order_value,

    SUM(p.price * o.quantity) OVER (
        PARTITION BY o.customer_id
        ORDER BY o.order_date
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND CURRENT ROW
    ) AS cumulative_spending,

    ROUND(
        AVG(p.price * o.quantity) OVER (
            PARTITION BY o.customer_id
            ORDER BY o.order_date
            ROWS BETWEEN 2 PRECEDING
            AND CURRENT ROW
        ),
        2
    ) AS rolling_3_order_average,

    MAX(p.price * o.quantity) OVER (
        PARTITION BY o.customer_id
        ORDER BY o.order_date
        ROWS BETWEEN 2 PRECEDING
        AND CURRENT ROW
    ) AS rolling_3_order_max

FROM orders o
JOIN products p
    ON o.product_id = p.product_id

ORDER BY
    o.customer_id,
    o.order_date;