-- DAY 16: SQL FOR DATA SCIENCE
-- TOPIC: SQL Feature Engineering

-- CALCULATED FEATURE

-- Example 1: Create total spending feature
SELECT
    o.order_id,
    o.quantity,
    p.price,
    o.quantity * p.price AS total_spending
FROM orders o
INNER JOIN products p
    ON o.product_id = p.product_id;

-- RATIO FEATURE

-- Example 2: Create quantity-price rati
SELECT
    o.order_id,
    o.quantity,
    p.price,
    o.quantity::NUMERIC / NULLIF(p.price, 0) AS quantity_price_ratio
FROM orders o
INNER JOIN products p
    ON o.product_id = p.product_id;

-- AGE GROUP FEATURE

-- Example 3: Create age group
SELECT
    customer_name,
    age,
    CASE
        WHEN age < 25 THEN 'Young'
        WHEN age BETWEEN 25 AND 30 THEN 'Adult'
        ELSE 'Senior'
    END AS age_group
FROM customers;

-- INCOME CATEGORY FEATURE

-- Example 4: Create income category
SELECT
    customer_name,
    income,
    CASE
        WHEN income >= 60000 THEN 'High'
        WHEN income >= 40000 THEN 'Medium'
        ELSE 'Low'
    END AS income_category
FROM customers;

-- ORDER VALUE FEATURE

-- Example 5: Create order value
SELECT
    o.order_id,
    o.quantity,
    p.price,
    o.quantity * p.price AS order_value
FROM orders o
INNER JOIN products p
    ON o.product_id = p.product_id;

-- CUSTOMER SPENDING FEATURE

-- Example 6: Create total customer spending
SELECT
    c.customer_id,
    c.customer_name,
    SUM(o.quantity * p.price) AS total_spending
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
INNER JOIN products p
    ON o.product_id = p.product_id
GROUP BY
    c.customer_id,
    c.customer_name;

-- ORDER FREQUENCY FEATURE

-- Example 7: Create customer order frequency
SELECT
    c.customer_id,
    c.customer_name,
    COUNT(o.order_id) AS order_frequency
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.customer_name;

-- AVERAGE ORDER VALUE FEATURE

-- Example 8: Calculate average order value per customer
SELECT
    c.customer_name,
    AVG(o.quantity * p.price) AS average_order_value
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
INNER JOIN products p
    ON o.product_id = p.product_id
GROUP BY c.customer_name;

-- COMBINED FEATURES

-- Example 9: Create multiple ML features
SELECT
    c.customer_id,
    c.customer_name,
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
    c.customer_name,
    c.age,
    c.income;