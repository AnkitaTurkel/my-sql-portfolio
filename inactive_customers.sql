-- Query: Customers With No Orders in Last 5 Months
-- Purpose: Identifies customers who haven’t placed orders recently.
SELECT c.customer_id, c.name
FROM customers c
WHERE NOT EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.customer_id
      AND o.order_date >= CURRENT_DATE - INTERVAL '5 months'
);
