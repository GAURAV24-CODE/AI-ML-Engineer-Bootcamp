-- ============================================================
-- DAY 17 - ADVANCED SQL
-- FILE 11 - SQL FEATURE ENGINEERING ADVANCED
-- PostgreSQL
-- ============================================================


-- ============================================================
-- QUERY 1: CUSTOMER ORDER COUNT FEATURE
-- ============================================================

SELECT
    c.customer_id,
    c.customer_name,
    COUNT(o.order_id) AS order_count
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.customer_name
ORDER BY order_count DESC;


-- ============================================================
-- QUERY 2: TOTAL CUSTOMER SPENDING FEATURE
-- ============================================================

SELECT
    c.customer_id,
    c.customer_name,
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
    c.customer_name
ORDER BY total_spending DESC;


-- ============================================================
-- QUERY 3: AVERAGE ORDER VALUE FEATURE
-- ============================================================

SELECT
    c.customer_id,
    c.customer_name,
    ROUND(
        COALESCE(
            AVG(
                p.price * o.quantity *
                (1 - o.discount / 100)
            ),
            0
        ),
        2
    ) AS average_order_value
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
LEFT JOIN products p
    ON o.product_id = p.product_id
GROUP BY
    c.customer_id,
    c.customer_name
ORDER BY average_order_value DESC;


-- ============================================================
-- QUERY 4: CUSTOMER SPENDING TO INCOME RATIO
-- ============================================================

WITH customer_spending AS (
    SELECT
        customer_id,
        SUM(
            p.price * o.quantity *
            (1 - o.discount / 100)
        ) AS total_spending
    FROM orders o
    JOIN products p
        ON o.product_id = p.product_id
    GROUP BY customer_id
)
SELECT
    c.customer_id,
    c.customer_name,
    c.income,
    ROUND(
        COALESCE(cs.total_spending, 0),
        2
    ) AS total_spending,
    ROUND(
        COALESCE(cs.total_spending, 0) / NULLIF(c.income, 0),
        4
    ) AS spending_income_ratio
FROM customers c
LEFT JOIN customer_spending cs
    ON c.customer_id = cs.customer_id
ORDER BY spending_income_ratio DESC;


-- ============================================================
-- QUERY 5: CUSTOMER BEHAVIOR FLAGS
-- ============================================================

WITH customer_stats AS (
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
        WHEN order_count >= 2 THEN 1
        ELSE 0
    END AS repeat_customer_flag,

    CASE
        WHEN total_spending >= 50000 THEN 1
        ELSE 0
    END AS high_value_flag,

    CASE
        WHEN income >= 80000 THEN 1
        ELSE 0
    END AS high_income_flag

FROM customer_stats
ORDER BY customer_id;


-- ============================================================
-- QUERY 6: PRODUCT POPULARITY FEATURE
-- ============================================================

SELECT
    p.product_id,
    p.product_name,
    p.category,
    COUNT(o.order_id) AS order_count,
    COALESCE(SUM(o.quantity), 0) AS units_sold
FROM products p
LEFT JOIN orders o
    ON p.product_id = o.product_id
GROUP BY
    p.product_id,
    p.product_name,
    p.category
ORDER BY units_sold DESC;


-- ============================================================
-- QUERY 7: CUSTOMER PRODUCT DIVERSITY
-- Number of unique products purchased by each customer.
-- ============================================================

SELECT
    c.customer_id,
    c.customer_name,
    COUNT(DISTINCT o.product_id) AS unique_products_purchased
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.customer_name
ORDER BY unique_products_purchased DESC;


-- ============================================================
-- QUERY 8: DISCOUNT BEHAVIOR FEATURE
-- ============================================================

SELECT
    customer_id,
    COUNT(*) AS order_count,
    ROUND(AVG(discount), 2) AS average_discount,
    MAX(discount) AS maximum_discount,
    SUM(
        CASE
            WHEN discount > 0 THEN 1
            ELSE 0
        END
    ) AS discounted_order_count
FROM orders
GROUP BY customer_id
ORDER BY average_discount DESC;


-- ============================================================
-- QUERY 9: CUSTOMER RECENCY FEATURE
-- Days since the customer's latest order.
-- ============================================================

WITH last_orders AS (
    SELECT
        customer_id,
        MAX(order_date) AS last_order_date
    FROM orders
    GROUP BY customer_id
)
SELECT
    c.customer_id,
    c.customer_name,
    lo.last_order_date,
    CURRENT_DATE - lo.last_order_date AS days_since_last_order
FROM customers c
LEFT JOIN last_orders lo
    ON c.customer_id = lo.customer_id
ORDER BY days_since_last_order DESC NULLS LAST;


-- ============================================================
-- QUERY 10: COMPLETE ML FEATURE TABLE
-- ============================================================

WITH customer_features AS (

    SELECT
        c.customer_id,
        c.customer_name,
        c.age,
        c.income,
        c.city,

        COUNT(o.order_id) AS order_count,

        COALESCE(
            SUM(
                p.price * o.quantity *
                (1 - o.discount / 100)
            ),
            0
        ) AS total_spending,

        COALESCE(
            AVG(
                p.price * o.quantity *
                (1 - o.discount / 100)
            ),
            0
        ) AS average_order_value,

        COUNT(DISTINCT o.product_id) AS unique_products,

        COALESCE(
            AVG(o.discount),
            0
        ) AS average_discount,

        MAX(o.order_date) AS last_order_date

    FROM customers c

    LEFT JOIN orders o
        ON c.customer_id = o.customer_id

    LEFT JOIN products p
        ON o.product_id = p.product_id

    GROUP BY
        c.customer_id,
        c.customer_name,
        c.age,
        c.income,
        c.city
)

SELECT
    customer_id,
    customer_name,
    age,
    income,
    city,

    order_count,

    ROUND(total_spending, 2)
        AS total_spending,

    ROUND(average_order_value, 2)
        AS average_order_value,

    unique_products,

    ROUND(average_discount, 2)
        AS average_discount,

    CURRENT_DATE - last_order_date
        AS days_since_last_order,

    ROUND(
        total_spending / NULLIF(income, 0),
        4
    ) AS spending_income_ratio,

    CASE
        WHEN order_count >= 2 THEN 1
        ELSE 0
    END AS repeat_customer_flag,

    CASE
        WHEN total_spending >= 50000 THEN 1
        ELSE 0
    END AS high_value_customer_flag,

    CASE
        WHEN age < 25 THEN 0
        WHEN age <= 35 THEN 1
        ELSE 2
    END AS age_group_encoded

FROM customer_features
ORDER BY customer_id;