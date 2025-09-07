SELECT * FROM superstore;

SELECT * 
FROM superstore
WHERE state = 'California';

SELECT * 
FROM superstore
WHERE CAST(discount AS FLOAT) > 0.5;

SELECT order_id, product_name, CAST(sales AS FLOAT) AS sales
FROM superstore
ORDER BY sales DESC
LIMIT 10;

SELECT customer_name, SUM(CAST(profit AS FLOAT)) AS total_profit
FROM superstore
GROUP BY customer_name
ORDER BY total_profit DESC
LIMIT 10;

SELECT 
    SUM(CAST(sales AS FLOAT)) AS total_sales,
    SUM(CAST(quantity AS INT)) AS total_quantity,
    SUM(CAST(profit AS FLOAT)) AS total_profit
FROM superstore;

SELECT region, SUM(CAST(sales AS FLOAT)) AS total_sales
FROM superstore
GROUP BY region
ORDER BY total_sales DESC;

SELECT category, sub_category, SUM(CAST(sales AS FLOAT)) AS sales
FROM superstore
GROUP BY category, sub_category
ORDER BY sales DESC;

SELECT 
    DATE_TRUNC('month', TO_DATE(order_date, 'MM/DD/YYYY')) AS month,
    SUM(CAST(sales AS FLOAT)) AS monthly_sales
FROM superstore
GROUP BY month
ORDER BY month;

SELECT 
    DATE_PART('year', TO_DATE(order_date, 'MM/DD/YYYY')) AS year,
    SUM(CAST(profit AS FLOAT)) AS yearly_profit
FROM superstore
GROUP BY year
ORDER BY year;

SELECT category,
       SUM(CAST(profit AS FLOAT)) / SUM(CAST(sales AS FLOAT)) * 100 AS profit_margin_percent
FROM superstore
GROUP BY category
ORDER BY profit_margin_percent DESC;

SELECT city, SUM(CAST(profit AS FLOAT)) AS total_profit
FROM superstore
GROUP BY city
ORDER BY total_profit ASC
LIMIT 5;