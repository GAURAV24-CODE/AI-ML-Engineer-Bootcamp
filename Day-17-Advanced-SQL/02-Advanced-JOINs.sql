-- ============================================================
-- DAY 17 - ADVANCED SQL
-- FILE 02 - ADVANCED JOINs
-- PostgreSQL
-- ============================================================


-- ============================================================
-- QUERY 1: INNER JOIN
-- Show customers and their orders.
-- ============================================================

SELECT
    c.customer_id,
    c.customer_name,
    o.order_id,
    o.order_date,
    o.quantity
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id;


-- ============================================================
-- QUERY 2: THREE-TABLE JOIN
-- Show customer, product, and order information.
-- ============================================================

SELECT
    c.customer_name,
    p.product_name,
    p.category,
    o.order_date,
    o.quantity
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN products p
    ON o.product_id = p.product_id;


-- ============================================================
-- QUERY 3: LEFT JOIN
-- Show every customer, including customers without orders.
-- ============================================================

SELECT
    c.customer_id,
    c.customer_name,
    o.order_id,
    o.order_date
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id;


-- ============================================================
-- QUERY 4: FIND CUSTOMERS WITHOUT ORDERS
-- LEFT JOIN + NULL filtering.
-- ============================================================

SELECT
    c.customer_id,
    c.customer_name,
    c.city
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;


-- ============================================================
-- QUERY 5: SELF JOIN
-- Show employees with their managers.
-- ============================================================

SELECT
    e.employee_id,
    e.employee_name,
    m.employee_name AS manager_name
FROM employees e
LEFT JOIN employees m
    ON e.manager_id = m.employee_id;


-- ============================================================
-- QUERY 6: SELF JOIN WITH SALARY COMPARISON
-- Compare employee salary with manager salary.
-- ============================================================

SELECT
    e.employee_name,
    e.salary AS employee_salary,
    m.employee_name AS manager_name,
    m.salary AS manager_salary,
    e.salary - m.salary AS salary_difference
FROM employees e
JOIN employees m
    ON e.manager_id = m.employee_id;


-- ============================================================
-- QUERY 7: JOIN WITH CALCULATED VALUE
-- Calculate order revenue using product price and quantity.
-- ============================================================

SELECT
    o.order_id,
    c.customer_name,
    p.product_name,
    o.quantity,
    p.price,
    p.price * o.quantity AS gross_revenue
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
JOIN products p
    ON o.product_id = p.product_id;


-- ============================================================
-- QUERY 8: JOIN WITH DISCOUNT
-- Calculate final revenue after discount.
-- ============================================================

SELECT
    o.order_id,
    c.customer_name,
    p.product_name,
    p.category,
    o.quantity,
    p.price,
    o.discount,
    p.price * o.quantity AS gross_amount,
    p.price * o.quantity * (1 - o.discount / 100) AS final_amount
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
JOIN products p
    ON o.product_id = p.product_id;


-- ============================================================
-- QUERY 9: JOIN WITH DEPARTMENT
-- Show employees and their departments.
-- ============================================================

SELECT
    e.employee_id,
    e.employee_name,
    d.department_name,
    e.salary
FROM employees e
JOIN departments d
    ON e.department_id = d.department_id;


-- ============================================================
-- QUERY 10: MULTI-TABLE ANALYTICAL JOIN
-- Create an analysis-ready order dataset.
-- ============================================================

SELECT
    o.order_id,
    c.customer_name,
    c.city,
    c.age,
    c.income,
    p.product_name,
    p.category,
    p.price,
    o.quantity,
    o.discount,
    p.price * o.quantity AS gross_amount,
    p.price * o.quantity * (1 - o.discount / 100) AS final_amount
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
JOIN products p
    ON o.product_id = p.product_id
ORDER BY o.order_date;