==================================================
DAY 17 — ADVANCED SQL INTERVIEW QUESTIONS
==================================================

Q1. What is a CTE?
A: A CTE is a temporary named result set used to simplify complex SQL queries.

Q2. What is a recursive CTE?
A: A recursive CTE references itself and is useful for hierarchies and iterative data.

Q3. What is a window function?
A: A window function performs calculations across related rows without grouping them into one row.

Q4. What is PARTITION BY?
A: PARTITION BY divides rows into groups for a window function while keeping individual rows.

Q5. Difference between GROUP BY and PARTITION BY?
A: GROUP BY reduces rows into groups; PARTITION BY keeps all rows and calculates within each group.

Q6. What is ROW_NUMBER()?
A: It assigns a unique sequential number to each row.

Q7. Difference between RANK() and DENSE_RANK()?
A: RANK skips numbers after ties, while DENSE_RANK does not skip numbers.

Q8. What does LAG() do?
A: LAG() returns a value from a previous row.

Q9. What does LEAD() do?
A: LEAD() returns a value from a following row.

Q10. What is a running total?
A: A running total is a cumulative value calculated from the first row to the current row.

Q11. What is a moving average?
A: A moving average calculates an average over a sliding window of recent rows.

Q12. What does ROWS BETWEEN do?
A: It defines the range of rows included in a window calculation.

Q13. What does UNBOUNDED PRECEDING mean?
A: It means the window starts from the first row of the partition.

Q14. What is a correlated subquery?
A: A correlated subquery depends on values from the outer query and executes for related outer rows.

Q15. What is EXISTS?
A: EXISTS checks whether a subquery returns at least one row.

Q16. Difference between EXISTS and IN?
A: EXISTS checks for matching rows, while IN compares a value against a returned list.

Q17. What is a self join?
A: A self join joins a table with itself, commonly used for employee-manager relationships.

Q18. What is an advanced JOIN?
A: It combines multiple tables using complex conditions or multiple JOIN operations.

Q19. What is feature engineering in SQL?
A: It means creating useful ML features from raw database data using SQL transformations.

Q20. How can SQL create ML features?
A: SQL can create features using aggregation, CASE, ratios, rankings, and time-based calculations.

Q21. What is a flag feature?
A: A flag converts a condition into a binary value such as 0 or 1.

Q22. Why use NULLIF()?
A: NULLIF() prevents division-by-zero errors.

Q23. What is a ratio feature?
A: A ratio feature represents the relationship between two numerical values, such as spending/income.

Q24. What is a recency feature?
A: Recency measures how much time has passed since a customer's latest activity.

Q25. How do you find the top 3 records per group?
A: Use ROW_NUMBER(), RANK(), or DENSE_RANK() with PARTITION BY and filter the rank.

Q26. How do you calculate a previous value?
A: Use LAG() with ORDER BY to access the previous row.

Q27. How do you calculate cumulative spending?
A: Use SUM() OVER(PARTITION BY customer_id ORDER BY order_date).

Q28. How do you calculate a 3-row moving average?
A: Use AVG() OVER(ORDER BY date ROWS BETWEEN 2 PRECEDING AND CURRENT ROW).

Q29. Why is CASE useful in ML preprocessing?
A: CASE can convert numerical values into categories or encoded features such as 0, 1, and 2.

Q30. Why is advanced SQL important for Data Science?
A: It helps extract, transform, analyze, and engineer ML-ready datasets directly from databases.

==================================================
DAY 17 INTERVIEW REVISION COMPLETE 🚀
==================================================