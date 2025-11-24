
 
# Task 6: Sales Trend Analysis Using Aggregations

## Objective
Analyze monthly revenue and order volume from online sales data to understand sales trends over time.

## Tools
- MySQL / PostgreSQL / SQLite
- SQL queries for aggregation

## Dataset
The `orders` table contains the following columns:  
- `order_id` (INT, Primary Key)  
- `order_date` (DATE)  
- `product_id` (INT)  
- `product_name` (VARCHAR)  
- `quantity` (INT)  
- `amount` (DECIMAL)

## Steps Performed
1. **Database Setup**  
   - Dropped the existing database (if any) and created a new database `onlinesales2`.
2. **Table Creation**  
   - Created the `orders` table with necessary columns.
3. **Data Insertion**  
   - Inserted sample data for the first three months of 2024.
4. **Query for Analysis**  
   - Used SQL aggregation functions to calculate monthly revenue and order volume.
   - Grouped by year and month using `EXTRACT`.
   - Sorted results by year and month.

## Key SQL Query
```sql
SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM orders
WHERE order_date BETWEEN '2024-01-01' AND '2024-03-31'
GROUP BY EXTRACT(YEAR FROM order_date), EXTRACT(MONTH FROM order_date)
ORDER BY year, month;

