DAY 16 — SQL FOR DATA SCIENCE CHEAT SHEET

1. DATA EXTRACTION
SELECT → choose columns
WHERE → filter rows
DISTINCT → unique values
ORDER BY → sort data
LIMIT → limit rows

2. DATA CLEANING
IS NULL → find missing value
COALESCE() → replace NULL
TRIM() → remove spaces
CAST / :: → change data type
CASE → create categories

3. AGGREGATION
COUNT() → count rows
SUM() → total
AVG() → average
MIN() → minimum
MAX() → maximum
GROUP BY → group data
HAVING → filter groups

4. JOINS
INNER JOIN → matching rows
LEFT JOIN → all left rows
RIGHT JOIN → all right rows
FULL JOIN → all rows

5. SUBQUERIES
Query inside another query.
IN → match multiple values
NOT IN → exclude values

6. CTE
WITH → create temporary named result
Useful for complex multi-step queries.

7. WINDOW FUNCTIONS
ROW_NUMBER() → unique numbering
RANK() → ranking with gaps
DENSE_RANK() → ranking without gaps
LAG() → previous row
LEAD() → next row
PARTITION BY → calculate by group

8. DATE & TIME
EXTRACT() → get year/month/day
DATE_TRUNC() → group dates
CURRENT_DATE → current date

9. CASE
CASE
    WHEN condition THEN result
    ELSE result
END

Used for categories and conditional features.

10. FEATURE ENGINEERING
Order Value = Quantity × Price
Total Spending = SUM(Quantity × Price)
Order Frequency = COUNT(Order ID)
Average Order Value = AVG(Order Value)

11. DATA SCIENCE SQL WORKFLOW
Raw Data
→ Extract
→ Clean
→ Join
→ Aggregate
→ Analyze
→ Feature Engineering
→ ML Dataset

12. IMPORTANT
WHERE → filters rows
HAVING → filters groups

Subquery → nested query
CTE → named temporary query

SQL + Python/Pandas
→ Data Cleaning
→ EDA
→ Feature Engineering
→ Machine Learning