
-- SQL scripts for Sales Trend Analysis (full coverage)

-- 1. Monthly revenue and order volume aggregation

SELECT 
    strftime('%Y', order_date) AS year,
    strftime('%m', order_date) AS month,
    printf('%s-%s', strftime('%Y', order_date), strftime('%m', order_date)) AS month_year,
    SUM(amount) AS revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM online_sales
GROUP BY year, month
ORDER BY year ASC, month ASC;


-- 2. Top 5 revenue months
SELECT month_year, revenue, order_volume FROM (
    SELECT 
        printf('%s-%s', strftime('%Y', order_date), strftime('%m', order_date)) AS month_year,
        SUM(amount) AS revenue,
        COUNT(DISTINCT order_id) AS order_volume
    FROM online_sales
    GROUP BY month_year
) ORDER BY revenue DESC LIMIT 5;

-- 3. Monthly revenue filtered by year (example: 2023)

-- Monthly revenue for a specific year (example: 2023)
SELECT 
    strftime('%Y', order_date) AS year,
    strftime('%m', order_date) AS month,
    SUM(amount) AS revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM online_sales
WHERE strftime('%Y', order_date) = '2023'
GROUP BY year, month
ORDER BY month;


-- 4. Average revenue per order

-- Average revenue per order
SELECT 
    AVG(order_revenue) AS avg_revenue_per_order
FROM (
    SELECT order_id, SUM(amount) AS order_revenue
    FROM online_sales
    GROUP BY order_id
);

