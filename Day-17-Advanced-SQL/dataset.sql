-- ============================================================
-- DAY 17 - ADVANCED SQL DATASET
-- PostgreSQL
-- ============================================================

DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS employees;

-- ============================================================
-- CUSTOMERS
-- ============================================================

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    age INT,
    income NUMERIC(12,2),
    signup_date DATE
);

INSERT INTO customers
(customer_id, customer_name, city, age, income, signup_date)
VALUES
(1, 'Gaurav', 'Nashik', 24, 55000, '2025-01-10'),
(2, 'Priya', 'Pune', 27, 72000, '2025-01-15'),
(3, 'Gayu', 'Mumbai', 22, 38000, '2025-02-05'),
(4, 'Suvarna', 'Nashik', 31, 85000, '2025-02-18'),
(5, 'Anu', 'Pune', 26, 62000, '2025-03-01'),
(6, 'Hema', 'Mumbai', 35, 95000, '2025-03-12'),
(7, 'Hemant', 'Jalgaon', 29, 48000, '2025-03-20'),
(8, 'Vishal', 'Nashik', 41, 110000, '2025-04-02'),
(9, 'Nitin', 'Pune', 33, 68000, '2025-04-15'),
(10, 'Rahul', 'Mumbai', 23, 42000, '2025-05-01');

-- ============================================================
-- PRODUCTS
-- ============================================================

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price NUMERIC(12,2)
);

INSERT INTO products
(product_id, product_name, category, price)
VALUES
(101, 'Laptop', 'Electronics', 65000),
(102, 'Smartphone', 'Electronics', 30000),
(103, 'Headphones', 'Electronics', 2500),
(104, 'Office Chair', 'Furniture', 8500),
(105, 'Desk', 'Furniture', 12000),
(106, 'Keyboard', 'Electronics', 1800),
(107, 'Monitor', 'Electronics', 15000),
(108, 'Table Lamp', 'Furniture', 2200),
(109, 'Mouse', 'Electronics', 1200),
(110, 'Bookshelf', 'Furniture', 9500);

-- ============================================================
-- ORDERS
-- ============================================================

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    product_id INT REFERENCES products(product_id),
    order_date DATE,
    quantity INT,
    discount NUMERIC(5,2)
);

INSERT INTO orders
(order_id, customer_id, product_id, order_date, quantity, discount)
VALUES
(1001, 1, 101, '2026-01-05', 1, 5),
(1002, 2, 102, '2026-01-10', 2, 10),
(1003, 3, 103, '2026-01-15', 1, 0),
(1004, 4, 104, '2026-02-03', 1, 5),
(1005, 5, 105, '2026-02-12', 2, 10),
(1006, 6, 107, '2026-02-20', 1, 8),
(1007, 7, 106, '2026-03-02', 3, 0),
(1008, 8, 101, '2026-03-10', 1, 12),
(1009, 9, 102, '2026-03-18', 1, 5),
(1010, 10, 109, '2026-04-01', 2, 0),
(1011, 1, 103, '2026-04-12', 2, 5),
(1012, 2, 107, '2026-04-20', 1, 10),
(1013, 4, 105, '2026-05-05', 1, 15),
(1014, 6, 101, '2026-05-15', 1, 5),
(1015, 8, 104, '2026-06-01', 2, 10),
(1016, 9, 110, '2026-06-10', 1, 5),
(1017, 5, 108, '2026-07-02', 3, 0),
(1018, 3, 109, '2026-07-15', 2, 5),
(1019, 7, 103, '2026-08-01', 1, 10),
(1020, 10, 106, '2026-08-20', 2, 0);

-- ============================================================
-- DEPARTMENTS
-- ============================================================

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

INSERT INTO departments
(department_id, department_name)
VALUES
(1, 'Data Science'),
(2, 'Machine Learning'),
(3, 'Engineering'),
(4, 'Analytics'),
(5, 'Human Resources');

-- ============================================================
-- EMPLOYEES
-- ============================================================

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    manager_id INT,
    department_id INT REFERENCES departments(department_id),
    salary NUMERIC(12,2),
    joining_date DATE
);

INSERT INTO employees
(employee_id, employee_name, manager_id, department_id, salary, joining_date)
VALUES
(1, 'Amit', NULL, 1, 120000, '2022-01-10'),
(2, 'Sneha', 1, 1, 90000, '2023-03-15'),
(3, 'Rohan', 1, 1, 85000, '2023-06-20'),
(4, 'Neha', 2, 2, 95000, '2024-01-12'),
(5, 'Karan', 2, 2, 80000, '2024-04-10'),
(6, 'Pooja', 3, 3, 88000, '2023-08-18'),
(7, 'Vikas', 3, 3, 75000, '2024-02-14'),
(8, 'Meera', NULL, 4, 115000, '2022-09-01'),
(9, 'Arjun', 8, 4, 82000, '2024-05-05'),
(10, 'Kavya', 8, 4, 78000, '2024-07-15');