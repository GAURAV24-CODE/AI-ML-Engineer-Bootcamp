-- DAY 16: SQL FOR DATA SCIENCE
-- TOPIC: Window Functions

-- ROW_NUMBER()

-- Example 1: Number customers by income
SELECT
    customer_name,
    income,
    ROW_NUMBER() OVER (ORDER BY income DESC) AS row_num
FROM customers;

-- RANK()

-- Example 2: Rank customers by income
SELECT
    customer_name,
    income,
    RANK() OVER (ORDER BY income DESC) AS income_rank
FROM customers;

-- DENSE_RANK()

-- Example 3: Dense rank customers by incom
SELECT
    customer_name,
    income,
    DENSE_RANK() OVER (ORDER BY income DESC) AS income_rank
FROM customers;

-- PARTITION BY

-- Example 4: Rank customers within each city
SELECT
    customer_name,
    city,
    income,
    RANK() OVER (
        PARTITION BY city
        ORDER BY income DESC
    ) AS city_income_rank
FROM customers;

-- SUM() WINDOW FUNCTION

-- Example 5: Running total of order quantities
SELECT
    order_id,
    order_date,
    quantity,
    SUM(quantity) OVER (
        ORDER BY order_date
    ) AS running_quantity
FROM orders;

-- AVG() WINDOW FUNCTION

-- Example 6: Average income across all customers
SELECT
    customer_name,
    income,
    AVG(income) OVER () AS average_income
FROM customers;

-- LAG()

-- Example 7: Previous order quantity
SELECT
    order_id,
    order_date,
    quantity,
    LAG(quantity) OVER (
        ORDER BY order_date
    ) AS previous_quantity
FROM orders;

-- LEAD()

-- Example 8: Next order quantity
SELECT
    order_id,
    order_date,
    quantity,
    LEAD(quantity) OVER (
        ORDER BY order_date
    ) AS next_quantity
FROM orders;

-- WINDOW FUNCTION WITH PARTITION

-- Example 9: Rank products by price within category
SELECT
    product_name,
    category,
    price,
    RANK() OVER (
        PARTITION BY category
        ORDER BY price DESC
    ) AS category_price_rank
FROM products;