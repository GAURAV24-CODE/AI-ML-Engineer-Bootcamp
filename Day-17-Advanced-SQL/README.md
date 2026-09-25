# 🚀 Day 17 — Advanced SQL

## 📌 Overview

Day 17 focuses on **Advanced SQL techniques** used for complex data analysis, analytics, reporting, and machine-learning feature engineering.

The goal is to move beyond basic SQL queries and learn how to write efficient, analytical, and reusable SQL queries for real-world Data Science and Data Analytics workflows.

---

## 🎯 Learning Objectives

By completing Day 17, I learned:

- Advanced SELECT queries
- Advanced JOIN techniques
- Correlated Subqueries
- Common Table Expressions (CTEs)
- Recursive CTEs
- Window Functions
- Ranking and Analytics
- LAG and LEAD
- Running and Moving Aggregates
- Advanced CASE expressions
- SQL-based Feature Engineering
- ML-ready dataset creation

---

# 📚 Topics Covered

## 1️⃣ Advanced SELECT

Learned how to build complex SELECT queries using:

- DISTINCT
- Calculated columns
- Conditional calculations
- CASE expressions
- ORDER BY calculated values
- LIMIT and OFFSET
- Analytical feature selection

---

## 2️⃣ Advanced JOINs

Practiced:

- INNER JOIN
- LEFT JOIN
- Multiple-table JOINs
- Self JOIN
- Customer and order analysis
- Employee-manager relationships
- Department-level analysis
- Revenue calculations

---

## 3️⃣ Correlated Subqueries

Learned how subqueries can reference columns from the outer query.

Covered examples such as:

- Employees above department average salary
- Customers above city average income
- Maximum salary per department
- Products above category average price
- Employees earning more than their managers
- Latest order per customer
- EXISTS and NOT EXISTS

---

## 4️⃣ Advanced CTEs

Learned how **Common Table Expressions (CTEs)** make complex queries easier to understand and maintain.

Covered:

- Basic CTEs
- Multiple CTEs
- CTE with aggregation
- CTE with CASE
- Customer analytics
- Product performance analysis
- ML feature datasets

---

## 5️⃣ Recursive CTEs

Learned how recursive queries can process hierarchical and sequential data.

Examples:

- Number generation
- Date generation
- Employee hierarchy
- Manager relationships
- Employee paths
- Subordinate analysis
- Hierarchy-level features

---

## 6️⃣ Window Functions

Practiced analytical functions without collapsing rows.

Covered:

- ROW_NUMBER()
- RANK()
- DENSE_RANK()
- PARTITION BY
- Running totals
- Running averages
- Department averages
- Difference from group averages
- Cumulative customer spending

---

## 7️⃣ Ranking Analytics

Learned how to identify top-performing records.

Examples:

- Top 3 employees
- Top employee per department
- Top 2 employees per department
- Customer income ranking
- City-level ranking
- Product category ranking
- Customer spending ranking
- Income quartiles using NTILE()

---

## 8️⃣ LAG and LEAD

Learned how to compare the current row with previous or future rows.

Covered:

- Previous order date
- Next order date
- Days since previous order
- Previous quantity
- Quantity change
- Previous revenue
- Revenue percentage change
- Purchase frequency features

---

## 9️⃣ Running and Moving Aggregates

Practiced time-based analytical calculations.

Covered:

- Running quantity
- Running revenue
- Running average
- Moving average
- Customer running spending
- Customer moving average
- Running maximum
- Revenue vs running average

---

## 🔟 Advanced CASE

Used CASE expressions to create meaningful categories and features.

Examples:

- Income segments
- Age groups
- Product price categories
- Discount categories
- Customer value segments
- Employee salary bands
- High-value customer flags
- ML-ready encoded features

---

## 1️⃣1️⃣ SQL Feature Engineering

Applied advanced SQL techniques to create machine-learning-ready features.

Created features such as:

- Order count
- Total spending
- Average order value
- Unique products
- Spending-to-income ratio
- Repeat customer flag
- High-value customer flag
- Product popularity
- Discount behavior
- Recency
- Purchase frequency

---

# 🗂️ Project Structure

```text
Day-17-Advanced-SQL/
│
├── README.md
├── dataset.sql
│
├── 01-Advanced-SELECT.sql
├── 02-Advanced-JOINs.sql
├── 03-Correlated-Subqueries.sql
├── 04-CTE-Advanced.sql
├── 05-Recursive-CTE.sql
├── 06-Window-Functions-Advanced.sql
├── 07-Ranking-Analytics.sql
├── 08-LAG-LEAD.sql
├── 09-Running-Moving-Aggregates.sql
├── 10-Advanced-CASE.sql
├── 11-SQL-Feature-Engineering-Advanced.sql
├── 12-Advanced-SQL-Practice.sql
│
├── Practice.sql
├── Cheatsheet.txt
└── Interview-Questions.txt