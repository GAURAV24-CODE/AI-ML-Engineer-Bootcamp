DAY 16 — SQL FOR DATA SCIENCE
INTERVIEW QUESTIONS & ANSWERS

1. What is SQL?
Answer: SQL is a language used to store, retrieve, manipulate, and analyze data in relational databases.

2. What is the difference between WHERE and HAVING?
Answer: WHERE filters rows before grouping, while HAVING filters groups after GROUP BY.

3. What is GROUP BY?
Answer: GROUP BY groups rows with the same values so aggregate functions can be applied.

4. What are aggregate functions?
Answer: COUNT(), SUM(), AVG(), MIN(), and MAX() are common aggregate functions.

5. What is an INNER JOIN?
Answer: INNER JOIN returns only matching rows from both tables.

6. What is a LEFT JOIN?
Answer: LEFT JOIN returns all rows from the left table and matching rows from the right table.

7. What is a subquery?
Answer: A subquery is a query written inside another SQL query

8. What is a CTE?
Answer: A CTE is a temporary named result created using the WITH keyword.

9. CTE vs Subquery?
Answer: A CTE gives a query a reusable name and is generally easier to organize for complex multi-step analysis.

10. What is a window function?
Answer: A window function performs calculations across related rows without combining them into a single row.

11. Difference between RANK() and DENSE_RANK()?
Answer: RANK() leaves gaps after ties, while DENSE_RANK() does not.

12. What does ROW_NUMBER() do?
Answer: ROW_NUMBER() assigns a unique sequential number to each row.

13. What do LAG() and LEAD() do?
Answer: LAG() accesses a previous row, while LEAD() accesses a following row.

14. What is PARTITION BY?
Answer: PARTITION BY divides rows into groups for a window function calculation.

15. What is COALESCE()?
Answer: COALESCE() returns the first non-NULL value from the provided expressions.

16. What is CASE used for?
Answer: CASE applies conditional logic and can create categories or calculated features.

17. What is DISTINCT?
Answer: DISTINCT removes duplicate values from the query result.

18. What is DATE_TRUNC()?
Answer: DATE_TRUNC() truncates a date to a specified unit such as month, year, or day.

19. How can SQL be used for Data Science?
Answer: SQL can extract, clean, join, aggregate, analyze, and transform data before it is used for ML or analysis.

20. What is SQL feature engineering?
Answer: SQL feature engineering means creating useful ML features from database data, such as total spending, order frequency, and average order value.

21. How do you calculate total spending?
Answer:
SELECT SUM(quantity * price) AS total_spending
FROM orders;

22. How do you find customers earning above average income?
Answer:
SELECT customer_name, income
FROM customers
WHERE income > (SELECT AVG(income) FROM customers);

23. How do you rank customers by income?
Answer:
SELECT customer_name, income,
RANK() OVER (ORDER BY income DESC) AS income_rank
FROM customers;

24. How do you find the top 3 products by sales?
Answer:
SELECT product_id,
SUM(quantity * price) AS total_sales
FROM orders
GROUP BY product_id
ORDER BY total_sales DESC
LIMIT 3;

25. How do you create an ML-ready customer dataset?
Answer: Join customer and order/product data, aggregate customer-level information, create useful features, handle NULL values, and select the required columns for modeling.