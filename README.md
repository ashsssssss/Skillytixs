# Sales Trend Analysis (Complete)

This covers all parts of Task 9.

## Deliverables
- online_sales_sample.csv : synthetic dataset used for the demo
- analysis_queries_full.sql : SQL queries covering all required tasks
- monthly_revenue_table.csv : aggregated monthly revenue and order volume
- monthly_revenue_plot.pdf : line chart of monthly revenue
- analysis_report_full.pdf : combined PDF report

## Answers to Questions

1. **Extract month and year**: Use `EXTRACT(YEAR FROM date)` in PostgreSQL or `strftime('%Y', date)` in SQLite.  
2. **COUNT(DISTINCT order_id)**: ensures we count unique orders; `COUNT(*)` would overcount if an order has multiple products.  
3. **Average revenue per order**: Use a subquery to first group by order_id and SUM amounts, then take AVG of those sums.  
4. **WHERE vs HAVING**: WHERE filters rows *before* aggregation, HAVING filters groups *after* aggregation.  
5. **NULLs effect**: SUM/AVG ignore NULL values; they are not counted. COUNT(*) includes NULL, COUNT(column) ignores NULL.  
6. **Top 5 months**: Achieved with ORDER BY revenue DESC LIMIT 5.  
7. **Business scenarios**: Time-based aggregation is useful for sales trends, seasonal analysis, budgeting, demand forecasting, and performance dashboards.  
8. **Optimizations**: Add indexes on `order_date`, partition tables by date, use materialized views for pre-aggregation, and limit columns scanned.

## Top 5 Revenue Months (demo)
- 2023-11 : 15374.07 (orders: 84)
- 2023-12 : 14376.92 (orders: 70)
- 2024-11 : 13514.62 (orders: 70)
- 2022-12 : 12255.39 (orders: 57)
- 2024-12 : 12196.41 (orders: 65)


