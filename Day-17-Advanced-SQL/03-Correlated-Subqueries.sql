-- ============================================================
-- DAY 17 - ADVANCED SQL
-- FILE 03 - CORRELATED SUBQUERIES
-- PostgreSQL
-- ============================================================


-- ============================================================
-- QUERY 1: EMPLOYEES ABOVE DEPARTMENT AVERAGE
-- Compare each employee with the average salary
-- of their own department.
-- ============================================================

SELECT
    e.employee_id,
    e.employee_name,
    e.department_id,
    e.salary
FROM employees e
WHERE e.salary > (
    SELECT AVG(e2.salary)
    FROM employees e2
    WHERE e2.department_id = e.department_id
);


-- ============================================================
-- QUERY 2: CUSTOMERS ABOVE CITY AVERAGE INCOME
-- Compare each customer with the average income
-- of their own city.
-- ============================================================

SELECT
    c.customer_id,
    c.customer_name,
    c.city,
    c.income
FROM customers c
WHERE c.income > (
    SELECT AVG(c2.income)
    FROM customers c2
    WHERE c2.city = c.city
);


-- ============================================================
-- QUERY 3: EMPLOYEE WITH HIGHEST SALARY IN DEPARTMENT
-- Find employees whose salary is equal to the maximum
-- salary of their department.
-- ============================================================

SELECT
    e.employee_id,
    e.employee_name,
    e.department_id,
    e.salary
FROM employees e
WHERE e.salary = (
    SELECT MAX(e2.salary)
    FROM employees e2
    WHERE e2.department_id = e.department_id
);


-- ============================================================
-- QUERY 4: CUSTOMERS WITH ABOVE-AVERAGE ORDER QUANTITY
-- Compare each order quantity with the average quantity
-- of orders placed by that customer.
-- ============================================================

SELECT
    o.order_id,
    o.customer_id,
    o.quantity,
    o.order_date
FROM orders o
WHERE o.quantity > (
    SELECT AVG(o2.quantity)
    FROM orders o2
    WHERE o2.customer_id = o.customer_id
);


-- ============================================================
-- QUERY 5: PRODUCTS MORE EXPENSIVE THAN CATEGORY AVERAGE
-- Compare each product price with its category average.
-- ============================================================

SELECT
    p.product_id,
    p.product_name,
    p.category,
    p.price
FROM products p
WHERE p.price > (
    SELECT AVG(p2.price)
    FROM products p2
    WHERE p2.category = p.category
);


-- ============================================================
-- QUERY 6: CUSTOMERS WHO HAVE PLACED MULTIPLE ORDERS
-- Count orders separately for each customer.
-- ============================================================

SELECT
    c.customer_id,
    c.customer_name
FROM customers c
WHERE (
    SELECT COUNT(*)
    FROM orders o
    WHERE o.customer_id = c.customer_id
) > 1;


-- ============================================================
-- QUERY 7: CUSTOMERS WITH NO ORDERS
-- Correlated NOT EXISTS.
-- ============================================================

SELECT
    c.customer_id,
    c.customer_name,
    c.city
FROM customers c
WHERE NOT EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.customer_id
);


-- ============================================================
-- QUERY 8: CUSTOMERS WHO HAVE AT LEAST ONE LARGE ORDER
-- Find customers having an order with quantity >= 2.
-- ============================================================

SELECT
    c.customer_id,
    c.customer_name
FROM customers c
WHERE EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.customer_id
      AND o.quantity >= 2
);


-- ============================================================
-- QUERY 9: EMPLOYEES EARNING MORE THAN THEIR MANAGER
-- Correlated subquery using manager_id.
-- ============================================================

SELECT
    e.employee_id,
    e.employee_name,
    e.salary,
    e.manager_id
FROM employees e
WHERE e.manager_id IS NOT NULL
  AND e.salary > (
      SELECT m.salary
      FROM employees m
      WHERE m.employee_id = e.manager_id
  );


-- ============================================================
-- QUERY 10: MOST RECENT ORDER FOR EACH CUSTOMER
-- Find the latest order date belonging to each customer.
-- ============================================================

SELECT
    o.order_id,
    o.customer_id,
    o.order_date,
    o.quantity
FROM orders o
WHERE o.order_date = (
    SELECT MAX(o2.order_date)
    FROM orders o2
    WHERE o2.customer_id = o.customer_id
)
ORDER BY o.customer_id;