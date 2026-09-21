-- DAY 16: SQL FOR DATA SCIENCE
-- TOPIC: JOINs

-- INNER JOIN

-- Example 1: Customers with their orders
SELECT
    c.customer_name,
    o.order_id,
    o.order_date
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id;

-- Example 2: Orders with product details
SELECT
    o.order_id,
    p.product_name,
    p.category,
    o.quantity
FROM orders o
INNER JOIN products p
    ON o.product_id = p.product_id;

-- Example 3: Customer + product + order analysi
SELECT
    c.customer_name,
    p.product_name,
    p.price,
    o.quantity,
    o.order_date
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
INNER JOIN products p
    ON o.product_id = p.product_id;

-- LEFT JOIN

-- Example 4: All customers and their orders
SELECT
    c.customer_name,
    o.order_id,
    o.order_date
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id;

-- RIGHT JOIN

-- Example 5: All products and their orders
SELECT
    p.product_name,
    o.order_id,
    o.quantity
FROM orders o
RIGHT JOIN products p
    ON o.product_id = p.product_id;

-- JOIN WITH CALCULATION

-- Example 6: Calculate order amount
SELECT
    o.order_id,
    p.product_name,
    o.quantity,
    p.price,
    o.quantity * p.price AS order_amount
FROM orders o
INNER JOIN products p
    ON o.product_id = p.product_id;

-- JOIN WITH GROUP BY

-- Example 7: Total spending by customer
SELECT
    c.customer_name,
    SUM(o.quantity * p.price) AS total_spending
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
INNER JOIN products p
    ON o.product_id = p.product_id
GROUP BY c.customer_name;

-- JOIN WITH WHERE

-- Example 8: Electronics orders
SELECT
    c.customer_name,
    p.product_name,
    p.category,
    o.quantity
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
INNER JOIN products p
    ON o.product_id = p.product_id
WHERE p.category = 'Electronics';

-- FULL OUTER JOIN

-- Example 9: All customers and orders
SELECT
    c.customer_name,
    o.order_id,
    o.order_date
FROM customers c
FULL OUTER JOIN orders o
    ON c.customer_id = o.customer_id;