-- Query 1: Find Top 3 Selling Products per Category
-- Purpose: This query identifies the top 3 products by sales in each category using a window function (RANK).
-- Business Scenario: A retail company wants to identify best-selling products in each category to optimize inventory and promotions.

SELECT category, product_name, total_sales
FROM (
    SELECT 
        category,
        product_name,
        SUM(sales) AS total_sales,
        RANK() OVER (PARTITION BY category ORDER BY SUM(sales) DESC) AS rank
    FROM products
    JOIN sales ON products.product_id = sales.product_id
    GROUP BY category, product_name
) AS ranked
WHERE rank <= 3;

-- Sample Output Explanation:
-- The result will show columns: category, product_name, total_sales.
-- Example: "Electronics", "Laptop", 50000 (if Laptop is a top seller in Electronics).
