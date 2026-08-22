# 🚀 Day 09 — Data Cleaning | AI/ML Engineer Bootcamp

Welcome to **Day 09** of my **45-Day AI/ML Engineer Bootcamp**.

Today, I focused on **Data Cleaning**, an essential step in the Data Science and Machine Learning workflow. The goal was to learn how to identify and fix problems in raw datasets before performing EDA or building ML models.

---

## 📚 Topics Covered

* Understanding Data Cleaning
* Importance of Data Quality
* Inspecting Raw Data
* Missing Values
* `isnull()`
* `fillna()`
* `dropna()`
* Duplicate Detection
* Removing Duplicates
* Data Type Checking
* Data Type Conversion
* Handling Inconsistent Values
* Text Cleaning
* Standardizing Data
* Outlier Detection
* IQR Method
* Z-Score Method
* Final Data Quality Checks
* Preparing Data for EDA and Machine Learning

---

## 🛠️ Technologies & Libraries

* Python 🐍
* Pandas 🐼
* NumPy 🔢
* Jupyter Notebook 📓

---

## 🧹 Common Data Cleaning Operations

### Check Missing Values

```python
df.isnull().sum()
```

### Fill Missing Values

```python
df["Age"] = df["Age"].fillna(df["Age"].median())
```

### Remove Missing Rows

```python
df.dropna()
```

### Find Duplicates

```python
df.duplicated().sum()
```

### Remove Duplicates

```python
df.drop_duplicates(inplace=True)
```

### Check Data Types

```python
df.dtypes
```

### Convert Data Type

```python
df["Date"] = pd.to_datetime(df["Date"])
```

### Clean Text

```python
df["Name"] = df["Name"].str.strip().str.lower()
```

---

## 📊 Outlier Detection

I learned how to identify unusual values using:

### IQR Method

```text
IQR = Q3 - Q1

Lower Bound = Q1 - 1.5 × IQR
Upper Bound = Q3 + 1.5 × IQR
```

### Other Methods

* Z-Score
* Box Plot
* Statistical analysis

> ⚠️ Outliers should not automatically be removed. First determine whether they are errors or genuine observations.

---

## 💻 Mini Project

### 🧑‍💻 Titanic Dataset — Data Cleaning

As part of Day 09, I practiced data cleaning using the **Titanic dataset**.

The project included:

* Loading the dataset
* Inspecting the dataset
* Checking missing values
* Handling missing `Age` values
* Handling missing `Embarked` values
* Checking duplicate records
* Checking data types
* Detecting outliers
* Preparing the dataset for EDA

---

## 📁 Project Structure

```text
Day-09-Data-Cleaning/
│
├── Assignment/
│
├── Cheat_Sheet/
│
├── Code/
│
├── Dataset/
│
├── Images/
│
├── Interview_Questions/
│
├── Mini_Project/
│   └── Titanic_Data_Cleaning.ipynb
│
├── Notebook/
│
├── Notes/
│
├── Quiz/
│
├── README.md
│
└── requirements.txt
```

---

## 🎯 Learning Outcomes

After completing Day 09, I can:

✅ Identify missing values
✅ Handle missing data appropriately
✅ Detect and remove duplicate records
✅ Check and convert data types
✅ Clean inconsistent values
✅ Perform basic text cleaning
✅ Detect potential outliers
✅ Prepare datasets for EDA
✅ Understand the importance of data quality

---

## 💡 Key Learning

> **Clean Data → Better Analysis → Better Features → Better Models 🚀**

Data cleaning is not just about removing bad data. It is about **understanding the dataset and making informed decisions about how the data should be prepared**.

---

## 🔥 Next Step

**Day 10 → Exploratory Data Analysis (EDA)** 📊

The next step will be to explore the cleaned dataset, discover patterns, visualize relationships, and generate meaningful insights.

---

## 👨‍💻 Author

**Gaurav Eknath Kumbhar**

🎓 MCA | AI/ML Engineer Aspirant
🚀 45-Day AI/ML Engineer Bootcamp
📊 Learning Python, Data Science, Machine Learning & AI

---

⭐ If you find this learning journey useful, feel free to follow my progress!
