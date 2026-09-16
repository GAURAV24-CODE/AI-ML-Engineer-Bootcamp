# 🚀 Day 15 — Feature Engineering

> Part of my **45-Day AI/ML Engineer Bootcamp**

Feature Engineering is the process of creating, transforming, and selecting useful features from raw data so that Machine Learning models can learn meaningful patterns more effectively.

---

## 🎯 Learning Objectives

By the end of Day 15, I learned how to:

- Understand Feature Engineering
- Identify Features and Target variables
- Handle Numerical and Categorical Features
- Handle Missing Values
- Detect and handle Outliers
- Encode Categorical Variables
- Apply Feature Scaling
- Perform Feature Transformation
- Create Date & Time Features
- Create New Features
- Perform Feature Selection
- Understand Multicollinearity
- Calculate VIF
- Understand Data Leakage
- Apply correct Train/Test preprocessing
- Build a complete Feature Engineering workflow

---

# 📚 Topics Covered

## 1️⃣ Feature Engineering Fundamentals

- What is Feature Engineering?
- Why Feature Engineering is important
- Features vs Target
- Numerical Features
- Categorical Features
  - Nominal
  - Ordinal

---

## 2️⃣ Handling Missing Values

Learned how to:

- Detect missing values
- Count missing values
- Handle numerical missing values
- Use Mean imputation
- Use Median imputation
- Understand categorical missing-value handling

Example:

```python
df.isnull().sum()
