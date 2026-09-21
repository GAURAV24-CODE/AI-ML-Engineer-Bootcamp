-- DAY 16: SQL FOR DATA SCIENCE
-- TOPIC: Common Table Expressions (CTEs)

-- BASIC CTE

-- Example 1: Create a temporary customer dataset
WITH customer_data AS (
    SELECT
        customer_name,
        city,
        income
    FROM customers
)
SELECT *
FROM customer_data;

-- CTE WITH WHERE

-- Example 2: High-income customer
WITH high_income AS (
    SELECT
        customer_name,
        income
    FROM customers
    WHERE income > 50000
)
SELECT *
FROM high_income;

-- CTE WITH AGGREGATION

-- Example 3: Average income by city
WITH city_income AS (
    SELECT
        city,
        AVG(income) AS average_income
    FROM customers
    GROUP BY city
)
SELECT *
FROM city_income;

-- CTE WITH JOIN

-- Example 4: Customer order details
WITH order_details AS (
    SELECT
        c.customer_name,
        o.order_id,
        o.quantity
    FROM customers c
    INNER JOIN orders o
        ON c.customer_id = o.customer_id
)
SELECT *
FROM order_details;

-- CTE WITH CALCULATION

-- Example 5: Calculate order amount
WITH order_amounts AS (
    SELECT
        o.order_id,
        o.product_id,
        o.quantity,
        p.price,
        o.quantity * p.price AS order_amount
    FROM orders o
    INNER JOIN products p
        ON o.product_id = p.product_id
)
SELECT *
FROM order_amounts;

-- CTE WITH GROUP BY

-- Example 6: Total spending by customer
WITH customer_spending AS (
    SELECT
        c.customer_name,
        SUM(o.quantity * p.price) AS total_spending
    FROM customers c
    INNER JOIN orders o
        ON c.customer_id = o.customer_id
    INNER JOIN products p
        ON o.product_id = p.product_id
    GROUP BY c.customer_name
)
SELECT *
FROM customer_spending;

-- MULTIPLE CTEs

-- Example 7: Compare customer spending with average spending
WITH customer_spending AS (
    SELECT
        c.customer_name,
        SUM(o.quantity * p.price) AS total_spending
    FROM customers c
    INNER JOIN orders o
        ON c.customer_id = o.customer_id
    INNER JOIN products p
        ON o.product_id = p.product_id
    GROUP BY c.customer_name
),
average_spending AS (
    SELECT
        AVG(total_spending) AS avg_spending
    FROM customer_spending
)
SELECT
    cs.customer_name,
    cs.total_spending,
    a.avg_spending
FROM customer_spending cs
CROSS JOIN average_spending a;

-- CTE WITH FILTERING

-- Example 8: Customers spending more than 5000
WITH customer_spending AS (
    SELECT
        c.customer_name,
        SUM(o.quantity * p.price) AS total_spending
    FROM customers c
    INNER JOIN orders o
        ON c.customer_id = o.customer_id
    INNER JOIN products p
        ON o.product_id = p.product_id
    GROUP BY c.customer_name
)
SELECT *
FROM customer_spending
WHERE total_spending > 5000;

-- MULTI-STEP CTE

-- Example 9: Product sales analysis
WITH product_sales AS (
    SELECT
        p.product_name,
        p.category,
        SUM(o.quantity) AS total_quantity,
        SUM(o.quantity * p.price) AS total_sales
    FROM products p
    INNER JOIN orders o
        ON p.product_id = o.product_id
    GROUP BY p.product_name, p.category
),
sales_analysis AS (
    SELECT
        product_name,
        category,
        total_quantity,
        total_sales
    FROM product_sales
    WHERE total_sales > 3000
)
SELECT *
FROM sales_analysis;