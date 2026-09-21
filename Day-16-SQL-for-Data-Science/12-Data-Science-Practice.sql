-- DAY 16: SQL FOR DATA SCIENCE
-- TOPIC: Data Science Practice

-- Example 1: Find customers with income above average
SELECT
    customer_name,
    income
FROM customers
WHERE income > (
    SELECT AVG(income)
    FROM customers
);

-- Example 2: Find total spending by custome
SELECT
    c.customer_name,
    SUM(o.quantity * p.price) AS total_spending
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
INNER JOIN products p
    ON o.product_id = p.product_id
GROUP BY c.customer_name
ORDER BY total_spending DESC;

-- Example 3: Find top 3 products by sales
SELECT
    p.product_name,
    SUM(o.quantity * p.price) AS total_sales
FROM products p
INNER JOIN orders o
    ON p.product_id = o.product_id
GROUP BY p.product_name
ORDER BY total_sales DESC
LIMIT 3;

-- Example 4: Rank customers by total spending
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
SELECT
    customer_name,
    total_spending,
    RANK() OVER (
        ORDER BY total_spending DESC
    ) AS spending_rank
FROM customer_spending;

-- Example 5: Find monthly sales
SELECT
    DATE_TRUNC('month', o.order_date) AS order_month,
    SUM(o.quantity * p.price) AS monthly_sales
FROM orders o
INNER JOIN products p
    ON o.product_id = p.product_id
GROUP BY DATE_TRUNC('month', o.order_date)
ORDER BY order_month;

-- Example 6: Find customers with more than one order
SELECT
    c.customer_name,
    COUNT(o.order_id) AS order_count
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_name
HAVING COUNT(o.order_id) > 1;

-- Example 7: Find the most expensive product
SELECT
    product_name,
    price
FROM products
WHERE price = (
    SELECT MAX(price)
    FROM products
);

-- Example 8: Create customer segments
SELECT
    customer_name,
    income,
    CASE
        WHEN income >= 60000 THEN 'High Value'
        WHEN income >= 40000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_segment
FROM customers;

-- Example 9: Create an ML-ready customer feature dataset
SELECT
    c.customer_id,
    c.age,
    c.income,
    COUNT(o.order_id) AS order_frequency,
    COALESCE(SUM(o.quantity * p.price), 0) AS total_spending,
    COALESCE(AVG(o.quantity * p.price), 0) AS average_order_value
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
LEFT JOIN products p
    ON o.product_id = p.product_id
GROUP BY
    c.customer_id,
    c.age,
    c.income
ORDER BY total_spending DESC;