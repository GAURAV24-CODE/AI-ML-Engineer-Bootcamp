-- ============================================================
-- DAY 17 - ADVANCED SQL
-- FILE 05 - RECURSIVE CTE
-- PostgreSQL
-- ============================================================


-- ============================================================
-- QUERY 1: BASIC RECURSION
-- Generate numbers from 1 to 10.
-- ============================================================

WITH RECURSIVE numbers AS (
    SELECT 1 AS number

    UNION ALL

    SELECT number + 1
    FROM numbers
    WHERE number < 10
)
SELECT
    number
FROM numbers;


-- ============================================================
-- QUERY 2: GENERATE A DATE SERIES
-- Generate dates for one week.
-- ============================================================

WITH RECURSIVE dates AS (
    SELECT DATE '2026-01-01' AS date_value

    UNION ALL

    SELECT date_value + INTERVAL '1 day'
    FROM dates
    WHERE date_value < DATE '2026-01-07'
)
SELECT
    date_value::DATE AS date_value
FROM dates;


-- ============================================================
-- QUERY 3: EMPLOYEE HIERARCHY
-- Start from top-level employees and move downward.
-- ============================================================

WITH RECURSIVE employee_hierarchy AS (
    SELECT
        employee_id,
        employee_name,
        manager_id,
        department_id,
        0 AS hierarchy_level
    FROM employees
    WHERE manager_id IS NULL

    UNION ALL

    SELECT
        e.employee_id,
        e.employee_name,
        e.manager_id,
        e.department_id,
        eh.hierarchy_level + 1
    FROM employees e
    JOIN employee_hierarchy eh
        ON e.manager_id = eh.employee_id
)
SELECT
    employee_id,
    employee_name,
    manager_id,
    hierarchy_level
FROM employee_hierarchy
ORDER BY hierarchy_level, employee_id;


-- ============================================================
-- QUERY 4: DISPLAY HIERARCHY WITH INDENTATION
-- Make organizational levels easier to read.
-- ============================================================

WITH RECURSIVE employee_hierarchy AS (
    SELECT
        employee_id,
        employee_name,
        manager_id,
        0 AS hierarchy_level
    FROM employees
    WHERE manager_id IS NULL

    UNION ALL

    SELECT
        e.employee_id,
        e.employee_name,
        e.manager_id,
        eh.hierarchy_level + 1
    FROM employees e
    JOIN employee_hierarchy eh
        ON e.manager_id = eh.employee_id
)
SELECT
    REPEAT('  ', hierarchy_level) || employee_name AS employee_tree,
    hierarchy_level
FROM employee_hierarchy
ORDER BY hierarchy_level, employee_id;


-- ============================================================
-- QUERY 5: BUILD AN EMPLOYEE PATH
-- Show the management path for every employee.
-- ============================================================

WITH RECURSIVE employee_paths AS (
    SELECT
        employee_id,
        employee_name,
        manager_id,
        employee_name::TEXT AS path
    FROM employees
    WHERE manager_id IS NULL

    UNION ALL

    SELECT
        e.employee_id,
        e.employee_name,
        e.manager_id,
        ep.path || ' -> ' || e.employee_name
    FROM employees e
    JOIN employee_paths ep
        ON e.manager_id = ep.employee_id
)
SELECT
    employee_id,
    employee_name,
    path
FROM employee_paths
ORDER BY employee_id;


-- ============================================================
-- QUERY 6: FIND ALL SUBORDINATES OF A MANAGER
-- Starting from employee Amit.
-- ============================================================

WITH RECURSIVE subordinates AS (
    SELECT
        employee_id,
        employee_name,
        manager_id
    FROM employees
    WHERE employee_name = 'Amit'

    UNION ALL

    SELECT
        e.employee_id,
        e.employee_name,
        e.manager_id
    FROM employees e
    JOIN subordinates s
        ON e.manager_id = s.employee_id
)
SELECT
    employee_id,
    employee_name,
    manager_id
FROM subordinates;


-- ============================================================
-- QUERY 7: COUNT HIERARCHY LEVEL
-- Count employees at each hierarchy level.
-- ============================================================

WITH RECURSIVE employee_hierarchy AS (
    SELECT
        employee_id,
        employee_name,
        manager_id,
        0 AS hierarchy_level
    FROM employees
    WHERE manager_id IS NULL

    UNION ALL

    SELECT
        e.employee_id,
        e.employee_name,
        e.manager_id,
        eh.hierarchy_level + 1
    FROM employees e
    JOIN employee_hierarchy eh
        ON e.manager_id = eh.employee_id
)
SELECT
    hierarchy_level,
    COUNT(*) AS employee_count
FROM employee_hierarchy
GROUP BY hierarchy_level
ORDER BY hierarchy_level;


-- ============================================================
-- QUERY 8: RECURSIVE RUNNING TOTAL
-- Generate a cumulative sequence from 1 to 10.
-- ============================================================

WITH RECURSIVE sequence AS (
    SELECT
        1 AS number,
        1 AS running_total

    UNION ALL

    SELECT
        number + 1,
        running_total + (number + 1)
    FROM sequence
    WHERE number < 10
)
SELECT
    number,
    running_total
FROM sequence;


-- ============================================================
-- QUERY 9: EMPLOYEE HIERARCHY WITH DEPARTMENT
-- Combine recursion with department information.
-- ============================================================

WITH RECURSIVE employee_hierarchy AS (
    SELECT
        e.employee_id,
        e.employee_name,
        e.manager_id,
        e.department_id,
        0 AS hierarchy_level
    FROM employees e
    WHERE e.manager_id IS NULL

    UNION ALL

    SELECT
        e.employee_id,
        e.employee_name,
        e.manager_id,
        e.department_id,
        eh.hierarchy_level + 1
    FROM employees e
    JOIN employee_hierarchy eh
        ON e.manager_id = eh.employee_id
)
SELECT
    eh.employee_id,
    eh.employee_name,
    d.department_name,
    eh.hierarchy_level
FROM employee_hierarchy eh
JOIN departments d
    ON eh.department_id = d.department_id
ORDER BY eh.hierarchy_level, eh.employee_id;


-- ============================================================
-- QUERY 10: ML/DATA ANALYSIS USE CASE
-- Create a hierarchy-level feature for employees.
-- ============================================================

WITH RECURSIVE employee_hierarchy AS (
    SELECT
        employee_id,
        employee_name,
        manager_id,
        salary,
        0 AS hierarchy_level
    FROM employees
    WHERE manager_id IS NULL

    UNION ALL

    SELECT
        e.employee_id,
        e.employee_name,
        e.manager_id,
        e.salary,
        eh.hierarchy_level + 1
    FROM employees e
    JOIN employee_hierarchy eh
        ON e.manager_id = eh.employee_id
)
SELECT
    employee_id,
    employee_name,
    salary,
    hierarchy_level,
    CASE
        WHEN hierarchy_level = 0 THEN 'Top Management'
        WHEN hierarchy_level = 1 THEN 'Manager'
        ELSE 'Team Member'
    END AS hierarchy_role
FROM employee_hierarchy
ORDER BY hierarchy_level, employee_id;