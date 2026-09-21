-- DAY 16: SQL FOR DATA SCIENCE
-- TOPIC: CASE / Conditional Logic

-- BASIC CASE

-- Example 1: Categorize customers by income
SELECT
    customer_name,
    income,
    CASE
        WHEN income >= 60000 THEN 'High'
        WHEN income >= 40000 THEN 'Medium'
        ELSE 'Low'
    END AS income_category
FROM customers;

-- CASE WITH AGE

-- Example 2: Categorize customers by ag
SELECT
    customer_name,
    age,
    CASE
        WHEN age < 25 THEN 'Young'
        WHEN age BETWEEN 25 AND 30 THEN 'Adult'
        ELSE 'Senior'
    END AS age_group
FROM customers;

-- CASE WITH CITY

-- Example 3: Classify customers by city
SELECT
    customer_name,
    city,
    CASE
        WHEN city IN ('Mumbai', 'Pune') THEN 'Metro'
        ELSE 'Non-Metro'
    END AS city_type
FROM customers;

-- CASE WITH PRODUCT PRICE

-- Example 4: Categorize products by price
SELECT
    product_name,
    price,
    CASE
        WHEN price >= 50000 THEN 'Expensive'
        WHEN price >= 5000 THEN 'Medium'
        ELSE 'Affordable'
    END AS price_category
FROM products;

-- CASE WITH ORDER QUANTITY

-- Example 5: Categorize orders by quantity
SELECT
    order_id,
    quantity,
    CASE
        WHEN quantity >= 3 THEN 'Large Order'
        WHEN quantity = 2 THEN 'Medium Order'
        ELSE 'Small Order'
    END AS order_category
FROM orders;

-- CASE WITH CALCULATION

-- Example 6: Calculate discount category
SELECT
    product_name,
    price,
    CASE
        WHEN price >= 50000 THEN price * 0.10
        WHEN price >= 5000 THEN price * 0.05
        ELSE 0
    END AS discount
FROM products;

-- CASE WITH AGGREGATION

-- Example 7: Count high-income customers
SELECT
    COUNT(
        CASE
            WHEN income >= 50000 THEN 1
        END
    ) AS high_income_customers
FROM customers;

-- CASE WITH GROUP BY

-- Example 8: Count customers by income category
SELECT
    CASE
        WHEN income >= 60000 THEN 'High'
        WHEN income >= 40000 THEN 'Medium'
        ELSE 'Low'
    END AS income_category,
    COUNT(*) AS customer_count
FROM customers
GROUP BY
    CASE
        WHEN income >= 60000 THEN 'High'
        WHEN income >= 40000 THEN 'Medium'
        ELSE 'Low'
    END;

-- CASE WITH ORDER BY

-- Example 9: Sort customers by income category
SELECT
    customer_name,
    income,
    CASE
        WHEN income >= 60000 THEN 'High'
        WHEN income >= 40000 THEN 'Medium'
        ELSE 'Low'
    END AS income_category
FROM customers
ORDER BY
    CASE
        WHEN income >= 60000 THEN 1
        WHEN income >= 40000 THEN 2
        ELSE 3
    END;