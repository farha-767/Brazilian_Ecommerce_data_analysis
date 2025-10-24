/*
"Which product categories drive the most revenue and have the best customer satisfaction?"

Why this matters: Helps optimize inventory, marketing focus, and product development.

What to analyze:

Revenue by product category

Review scores by category

Identify high-revenue, high-satisfaction categories
*/;



SELECT
    products.product_category_name AS category_name,
    SUM(order_items.price) AS total_revenue,
    AVG(order_reviews.review_score) AS average_review_score,
    COUNT(order_reviews.review_id) as review_count
FROM 
    products INNER JOIN order_items ON products.product_id = order_items.product_id
    INNER JOIN order_reviews ON order_items.order_id = order_reviews.order_id
GROUP BY
category_name
HAVING COUNT(order_reviews.review_id) > 10 
ORDER BY
total_revenue DESC, average_review_score DESC;





