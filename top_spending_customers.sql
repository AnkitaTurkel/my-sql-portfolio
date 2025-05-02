-- Query: Customers With Highest Total Spending
-- Purpose: Identifies customers with the highest total spending.
SELECT customer_id, SUM(total_amount) AS total_spent
FROM orders
GROUP BY customer_id
HAVING SUM(total_amount) = (
    SELECT MAX(total)
    FROM (
        SELECT customer_id, SUM(total_amount) AS total
        FROM orders
        GROUP BY customer_id
    ) AS totals
);
