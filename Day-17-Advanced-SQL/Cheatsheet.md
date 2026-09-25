==================================================
DAY 17 — ADVANCED SQL CHEATSHEET
==================================================

1. CTE
--------------------------------------------------
WITH name AS (
    SELECT ...
)
SELECT *
FROM name;


2. RECURSIVE CTE
--------------------------------------------------
WITH RECURSIVE numbers AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1
    FROM numbers
    WHERE n < 10
)
SELECT * FROM numbers;


3. WINDOW FUNCTION
--------------------------------------------------
FUNCTION() OVER (
    PARTITION BY column
    ORDER BY column
)


4. RANKING
--------------------------------------------------
ROW_NUMBER() OVER (ORDER BY salary DESC)

RANK() OVER (ORDER BY salary DESC)

DENSE_RANK() OVER (ORDER BY salary DESC)


RANK:
1, 2, 2, 4

DENSE_RANK:
1, 2, 2, 3


5. LAG / LEAD
--------------------------------------------------
LAG(value) OVER (ORDER BY date)
→ Previous row

LEAD(value) OVER (ORDER BY date)
→ Next row


6. RUNNING TOTAL
--------------------------------------------------
SUM(value) OVER (
    ORDER BY date
)


7. MOVING AVERAGE
--------------------------------------------------
AVG(value) OVER (
    ORDER BY date
    ROWS BETWEEN 2 PRECEDING
    AND CURRENT ROW
)


8. PARTITIONED RUNNING TOTAL
--------------------------------------------------
SUM(value) OVER (
    PARTITION BY customer_id
    ORDER BY date
)


9. ADVANCED CASE
--------------------------------------------------
CASE
    WHEN condition THEN result
    WHEN condition THEN result
    ELSE result
END


10. CORRELATED SUBQUERY
--------------------------------------------------
WHERE salary > (
    SELECT AVG(salary)
    FROM employees e2
    WHERE e2.department_id = e.department_id
)


11. FEATURE ENGINEERING
--------------------------------------------------
COUNT(order_id)
SUM(order_value)
AVG(order_value)
COUNT(DISTINCT product_id)
MAX(order_date)


12. RATIO FEATURE
--------------------------------------------------
spending / NULLIF(income, 0)


13. FLAG FEATURE
--------------------------------------------------
CASE
    WHEN order_count >= 2 THEN 1
    ELSE 0
END AS repeat_customer_flag


14. RECENCY
--------------------------------------------------
CURRENT_DATE - MAX(order_date)


15. ML-READY FEATURES
--------------------------------------------------
order_count
total_spending
average_order_value
unique_products
days_since_last_order
spending_income_ratio
repeat_customer_flag
high_value_flag


==================================================
MOST IMPORTANT
==================================================

CTE          → Break complex query into steps
RANK         → Ranking
PARTITION BY → Group inside window function
LAG          → Previous row
LEAD         → Next row
SUM OVER     → Running total
AVG OVER     → Moving/running average
CASE         → Conditional logic
NULLIF       → Prevent division by zero
Feature Eng. → Create ML-ready features

==================================================
DAY 17 COMPLETE 🚀
==================================================