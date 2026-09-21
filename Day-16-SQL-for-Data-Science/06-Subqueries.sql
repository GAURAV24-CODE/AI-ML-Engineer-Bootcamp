-- DAY 16: SQL FOR DATA SCIENCE
-- TOPIC: Subqueries

-- SINGLE-ROW SUBQUERY

-- Example 1: Customers earning above average income
SELECT
    customer_name,
    income
FROM customers
WHERE income > (
    SELECT AVG(income)
    FROM customers
);

-- Example 2: Customer with highest income
SELECT
    customer_name,
    income
FROM customers
WHERE income = (
    SELECT MAX(income)
    FROM customers
);

-- Example 3: Products more expensive than average pric
SELECT
    product_name,
    price
FROM products
WHERE price > (
    SELECT AVG(price)
    FROM products
);

-- MULTI-ROW SUBQUERY

-- Example 4: Customers who placed an order
SELECT
    customer_name
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
);

-- Example 5: Products that were ordered
SELECT
    product_name
FROM products
WHERE product_id IN (
    SELECT product_id
    FROM orders
);

-- SUBQUERY WITH ORDERS

-- Example 6: Orders with quantity above average
SELECT
    order_id,
    quantity
FROM orders
WHERE quantity > (
    SELECT AVG(quantity)
    FROM orders
);

-- Example 7: Customer with minimum income
SELECT
    customer_name,
    income
FROM customers
WHERE income = (
    SELECT MIN(income)
    FROM customers
);

-- NOT IN SUBQUERY

-- Example 8: Products never ordered
SELECT
    product_name
FROM products
WHERE product_id NOT IN (
    SELECT product_id
    FROM orders
);

-- NESTED SUBQUERY

-- Example 9: Customers with above-average order count
SELECT
    customer_id,
    COUNT(*) AS order_count
FROM orders
GROUP BY customer_id
HAVING COUNT(*) > (
    SELECT AVG(order_count)
    FROM (
        SELECT
            COUNT(*) AS order_count
        FROM orders
        GROUP BY customer_id
    ) AS order_summary
);