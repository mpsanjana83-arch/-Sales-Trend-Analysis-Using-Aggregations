-- 1. Drop and recreate database
DROP DATABASE IF EXISTS onlinesales2;
CREATE DATABASE onlinesales2;
USE onlinesales2;

-- 2. Create the table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    product_id INT,
    product_name VARCHAR(100),
    quantity INT,
    amount DECIMAL(10,2)
);

-- 3. Insert sample data
INSERT INTO orders (order_id, order_date, product_id, product_name, quantity, amount)
VALUES
    (1, '2024-01-10', 101, 'Product A', 2, 500.00),
    (2, '2024-01-15', 102, 'Product B', 1, 300.00),
    (3, '2024-02-05', 103, 'Product C', 5, 1000.00),
    (4, '2024-03-20', 101, 'Product A', 1, 250.00);

-- 4. Query revenue and order volume by month
SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM
    orders
WHERE
    order_date BETWEEN '2024-01-01' AND '2024-03-31'
GROUP BY
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date)
ORDER BY
    year, month;
