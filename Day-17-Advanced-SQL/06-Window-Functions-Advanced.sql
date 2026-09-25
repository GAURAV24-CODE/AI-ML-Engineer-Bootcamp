-- ============================================================
-- DAY 17 - ADVANCED SQL
-- FILE 06 - ADVANCED WINDOW FUNCTIONS
-- PostgreSQL
-- ============================================================


-- ============================================================
-- QUERY 1: ROW_NUMBER
-- Assign a unique sequence number to employees by salary.
-- ============================================================

SELECT
    employee_id,
    employee_name,
    salary,
    ROW_NUMBER() OVER (
        ORDER BY salary DESC
    ) AS row_number
FROM employees;


-- ============================================================
-- QUERY 2: RANK
-- Rank employees according to salary.
-- Equal salaries receive the same rank.
-- ============================================================

SELECT
    employee_id,
    employee_name,
    salary,
    RANK() OVER (
        ORDER BY salary DESC
    ) AS salary_rank
FROM employees;


-- ============================================================
-- QUERY 3: DENSE_RANK
-- Rank employees without gaps after ties.
-- ============================================================

SELECT
    employee_id,
    employee_name,
    salary,
    DENSE_RANK() OVER (
        ORDER BY salary DESC
    ) AS salary_rank
FROM employees;


-- ============================================================
-- QUERY 4: PARTITION BY
-- Rank employees within their own department.
-- ============================================================

SELECT
    employee_id,
    employee_name,
    department_id,
    salary,
    RANK() OVER (
        PARTITION BY department_id
        ORDER BY salary DESC
    ) AS department_rank
FROM employees;


-- ============================================================
-- QUERY 5: RUNNING TOTAL
-- Calculate cumulative order quantity over time.
-- ============================================================

SELECT
    order_id,
    order_date,
    quantity,
    SUM(quantity) OVER (
        ORDER BY order_date
    ) AS running_quantity
FROM orders
ORDER BY order_date;


-- ============================================================
-- QUERY 6: RUNNING REVENUE
-- Calculate cumulative revenue over time.
-- ============================================================

SELECT
    o.order_id,
    o.order_date,
    p.price * o.quantity AS order_revenue,
    SUM(p.price * o.quantity) OVER (
        ORDER BY o.order_date
    ) AS running_revenue
FROM orders o
JOIN products p
    ON o.product_id = p.product_id
ORDER BY o.order_date;


-- ============================================================
-- QUERY 7: DEPARTMENT AVERAGE
-- Calculate department average salary while
-- keeping every employee row.
-- ============================================================

SELECT
    employee_id,
    employee_name,
    department_id,
    salary,
    ROUND(
        AVG(salary) OVER (
            PARTITION BY department_id
        ),
        2
    ) AS department_average_salary
FROM employees;


-- ============================================================
-- QUERY 8: DIFFERENCE FROM DEPARTMENT AVERAGE
-- Calculate how far each employee's salary is
-- from their department average.
-- ============================================================

SELECT
    employee_id,
    employee_name,
    department_id,
    salary,
    ROUND(
        salary - AVG(salary) OVER (
            PARTITION BY department_id
        ),
        2
    ) AS difference_from_department_average
FROM employees;


-- ============================================================
-- QUERY 9: PERCENTAGE OF DEPARTMENT SALARY
-- Calculate each employee's salary contribution
-- to their department's total salary.
-- ============================================================

SELECT
    employee_id,
    employee_name,
    department_id,
    salary,
    ROUND(
        100.0 * salary /
        SUM(salary) OVER (
            PARTITION BY department_id
        ),
        2
    ) AS salary_percentage
FROM employees;


-- ============================================================
-- QUERY 10: CUSTOMER ORDER ANALYTICS
-- Calculate order sequence and cumulative spending
-- for every customer.
-- ============================================================

SELECT
    o.customer_id,
    o.order_id,
    o.order_date,
    p.price * o.quantity AS order_value,

    ROW_NUMBER() OVER (
        PARTITION BY o.customer_id
        ORDER BY o.order_date
    ) AS order_number,

    SUM(p.price * o.quantity) OVER (
        PARTITION BY o.customer_id
        ORDER BY o.order_date
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND CURRENT ROW
    ) AS cumulative_spending

FROM orders o
JOIN products p
    ON o.product_id = p.product_id

ORDER BY
    o.customer_id,
    o.order_date;