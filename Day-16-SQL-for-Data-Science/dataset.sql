-- DAY 16: SQL FOR DATA SCIENCE
-- CREATE TABLES

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    age INT,
    city VARCHAR(50),
    income NUMERIC(10,2)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50),
    price NUMERIC(10,2)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    product_id INT REFERENCES products(product_id),
    order_date DATE,
    quantity INT
);


-- INSERT CUSTOMER

INSERT INTO customers VALUES
(1, 'Gaurav', 23, 'Jalgaon', 35000),
(2, 'Priya', 25, 'Nashik', 42000),
(3, 'Gayu', 28, 'Pune', 50000),
(4, 'Suvarna', 30, 'Mumbai', 65000),
(5, 'Anu', 24, 'Nashik', 38000),
(6, 'Hema', 32, 'Pune', 72000),
(7, 'Hemant', 27, 'Jalgaon', 45000),
(8, 'Vishal', 35, 'Mumbai', 85000);


-- INSERT PRODUCTS

INSERT INTO products VALUES
(101, 'Laptop', 'Electronics', 55000),
(102, 'Mouse', 'Electronics', 1200),
(103, 'Keyboard', 'Electronics', 2500),
(104, 'Headphones', 'Accessories', 3000),
(105, 'Backpack', 'Accessories', 1800);


-- INSERT ORDERS

INSERT INTO orders VALUES
(1001, 1, 101, '2026-01-10', 1),
(1002, 2, 102, '2026-01-12', 2),
(1003, 3, 103, '2026-02-05', 1),
(1004, 4, 101, '2026-02-15', 1),
(1005, 5, 104, '2026-03-02', 2),
(1006, 6, 105, '2026-03-10', 3),
(1007, 7, 102, '2026-04-08', 1),
(1008, 8, 101, '2026-04-20', 2),
(1009, 1, 104, '2026-05-05', 1),
(1010, 3, 105, '2026-05-18', 2);



SELECT * FROM customers;

SELECT * FROM products;

SELECT * FROM orders;