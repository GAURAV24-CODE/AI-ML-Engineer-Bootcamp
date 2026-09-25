-- ============================================================
-- DAY 17 - ADVANCED SQL
-- FILE 07 - RANKING ANALYTICS
-- PostgreSQL
-- ============================================================


-- ============================================================
-- QUERY 1: TOP 3 HIGHEST-PAID EMPLOYEES
-- ============================================================

SELECT
    employee_id,
    employee_name,
    salary,
    DENSE_RANK() OVER (
        ORDER BY salary DESC
    ) AS salary_rank
FROM employees
ORDER BY salary DESC
LIMIT 3;


-- ============================================================
-- QUERY 2: TOP EMPLOYEE FROM EACH DEPARTMENT
-- ============================================================

WITH ranked_employees AS (
    SELECT
        employee_id,
        employee_name,
        department_id,
        salary,
        RANK() OVER (
            PARTITION BY department_id
            ORDER BY salary DESC
        ) AS department_rank
    FROM employees
)
SELECT
    employee_id,
    employee_name,
    department_id,
    salary
FROM ranked_employees
WHERE department_rank = 1
ORDER BY department_id;


-- ============================================================
-- QUERY 3: TOP 2 EMPLOYEES FROM EACH DEPARTMENT
-- ============================================================

WITH ranked_employees AS (
    SELECT
        employee_id,
        employee_name,
        department_id,
        salary,
        ROW_NUMBER() OVER (
            PARTITION BY department_id
            ORDER BY salary DESC
        ) AS department_rank
    FROM employees
)
SELECT
    employee_id,
    employee_name,
    department_id,
    salary,
    department_rank
FROM ranked_employees
WHERE department_rank <= 2
ORDER BY department_id, department_rank;


-- ============================================================
-- QUERY 4: CUSTOMER RANK BY INCOME
-- ============================================================

SELECT
    customer_id,
    customer_name,
    city,
    income,
    RANK() OVER (
        ORDER BY income DESC
    ) AS income_rank
FROM customers
ORDER BY income_rank;


-- ============================================================
-- QUERY 5: CUSTOMER RANK WITHIN CITY
-- ============================================================

SELECT
    customer_id,
    customer_name,
    city,
    income,
    RANK() OVER (
        PARTITION BY city
        ORDER BY income DESC
    ) AS city_income_rank
FROM customers
ORDER BY city, city_income_rank;


-- ============================================================
-- QUERY 6: PRODUCT RANK BY PRICE WITHIN CATEGORY
-- ============================================================

SELECT
    product_id,
    product_name,
    category,
    price,
    DENSE_RANK() OVER (
        PARTITION BY category
        ORDER BY price DESC
    ) AS category_price_rank
FROM products
ORDER BY category, category_price_rank;


-- ============================================================
-- QUERY 7: CUSTOMER RANK BY TOTAL SPENDING
-- ============================================================

WITH customer_spending AS (
    SELECT
        c.customer_id,
        c.customer_name,
        COALESCE(
            SUM(p.price * o.quantity),
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
)
SELECT
    customer_id,
    customer_name,
    total_spending,
    DENSE_RANK() OVER (
        ORDER BY total_spending DESC
    ) AS spending_rank
FROM customer_spending
ORDER BY spending_rank;


-- ============================================================
-- QUERY 8: TOP 3 CUSTOMERS IN EACH CITY BY SPENDING
-- ============================================================

WITH customer_spending AS (
    SELECT
        c.customer_id,
        c.customer_name,
        c.city,
        COALESCE(
            SUM(p.price * o.quantity),
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
        c.city
),
ranked_customers AS (
    SELECT
        *,
        ROW_NUMBER() OVER (
            PARTITION BY city
            ORDER BY total_spending DESC
        ) AS city_rank
    FROM customer_spending
)
SELECT
    customer_id,
    customer_name,
    city,
    total_spending,
    city_rank
FROM ranked_customers
WHERE city_rank <= 3
ORDER BY city, city_rank;


-- ============================================================
-- QUERY 9: RANK PRODUCTS BY TOTAL REVENUE
-- ============================================================

WITH product_revenue AS (
    SELECT
        p.product_id,
        p.product_name,
        p.category,
        COALESCE(
            SUM(p.price * o.quantity),
            0
        ) AS total_revenue
    FROM products p
    LEFT JOIN orders o
        ON p.product_id = o.product_id
    GROUP BY
        p.product_id,
        p.product_name,
        p.category
)
SELECT
    product_id,
    product_name,
    category,
    total_revenue,
    RANK() OVER (
        ORDER BY total_revenue DESC
    ) AS revenue_rank
FROM product_revenue
ORDER BY revenue_rank;


-- ============================================================
-- QUERY 10: PERCENTILE-STYLE CUSTOMER SEGMENTATION
-- Divide customers into four approximately equal groups
-- according to income.
-- ============================================================

SELECT
    customer_id,
    customer_name,
    income,
    NTILE(4) OVER (
        ORDER BY income DESC
    ) AS income_quartile
FROM customers
ORDER BY income DESC;