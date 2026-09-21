-- DAY 16: SQL FOR DATA SCIENCE
-- TOPIC: Date & Time Analysis

-- EXTRACT YEAR

-- Example 1: Extract year from order date
SELECT
    order_id,
    order_date,
    EXTRACT(YEAR FROM order_date) AS order_year
FROM orders;

-- EXTRACT MONTH

-- Example 2: Extract month from order date
SELECT
    order_id,
    order_date,
    EXTRACT(MONTH FROM order_date) AS order_month
FROM orders;

-- EXTRACT DAY

-- Example 3: Extract day from order dat
SELECT
    order_id,
    order_date,
    EXTRACT(DAY FROM order_date) AS order_day
FROM orders;

-- DAY OF WEEK

-- Example 4: Find weekday number
SELECT
    order_id,
    order_date,
    EXTRACT(DOW FROM order_date) AS weekday_number
FROM orders;

-- DATE TRUNC

-- Example 5: Group orders by month
SELECT
    DATE_TRUNC('month', order_date) AS order_month,
    COUNT(*) AS total_orders
FROM orders
GROUP BY DATE_TRUNC('month', order_date)
ORDER BY order_month;

-- ORDERS BY YEAR

-- Example 6: Count orders by year
SELECT
    EXTRACT(YEAR FROM order_date) AS order_year,
    COUNT(*) AS total_orders
FROM orders
GROUP BY EXTRACT(YEAR FROM order_date)
ORDER BY order_year;

-- ORDERS BY MONTH

-- Example 7: Total quantity sold by month
SELECT
    EXTRACT(MONTH FROM order_date) AS order_month,
    SUM(quantity) AS total_quantity
FROM orders
GROUP BY EXTRACT(MONTH FROM order_date)
ORDER BY order_month;

-- DATE FILTERING

-- Example 8: Orders after March 1, 2026
SELECT
    order_id,
    order_date,
    quantity
FROM orders
WHERE order_date > '2026-03-01';

-- DATE DIFFERENCE

-- Example 9: Days since each order
SELECT
    order_id,
    order_date,
    CURRENT_DATE - order_date AS days_since_order
FROM orders;