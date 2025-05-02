-- Query: 3-Month Moving Average of Revenue
-- Purpose: Calculates the 3-month moving average of total order revenue.
SELECT 
    DATE_TRUNC('month', order_date) AS month,
    SUM(total_amount) AS monthly_revenue,
    AVG(SUM(total_amount)) OVER (
        ORDER BY DATE_TRUNC('month', order_date) 
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS moving_avg
FROM orders
GROUP BY DATE_TRUNC('month', order_date);
