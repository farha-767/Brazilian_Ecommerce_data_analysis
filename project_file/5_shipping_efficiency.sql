/*
"How efficient is our delivery process across different regions?"

Why this matters: Identify operational bottlenecks and regional performance variations.

What to analyze:

Average delivery time by state

On-time delivery performance

Freight cost analysis

SQL concepts to practice:

Date arithmetic (date1 - date2)

JOINs with geographic data

Conditional aggregates

NULL handling for incomplete deliveries
*/


SELECT
    customers.customer_state,
    ROUND(AVG(EXTRACT(DAY FROM (orders.order_delivered_customer_date - orders.order_purchase_timestamp))),0) AS avg_delivery_time_days,
    ROUND(AVG(EXTRACT(DAY FROM (orders.order_estimated_delivery_date - orders.order_delivered_customer_date))),0) AS avg_days_early_positive_late_negative,
    ROUND(COUNT(CASE WHEN orders.order_delivered_customer_date <= orders.order_estimated_delivery_date THEN 1 END) * 100.0 / COUNT(orders.order_id), 0) AS on_time_delivery_percentage,
    ROUND(AVG(order_items.freight_value),0) AS avg_freight_cost,
    ROUND(SUM(order_items.freight_value),0)AS total_freight_revenue,
    COUNT(orders.order_id) AS total_orders,
    COUNT(DISTINCT customers.customer_id) AS unique_customers
FROM customers
    INNER JOIN orders ON customers.customer_id = orders.customer_id
    INNER JOIN order_items ON orders.order_id = order_items.order_id
WHERE orders.order_delivered_customer_date IS NOT NULL
GROUP BY
    customers.customer_state
ORDER BY
    avg_delivery_time_days ASC;

/*
🎯 Expected Insights from Your Query:
- Average delivery times by state to identify slower regions
- On-time delivery percentages to assess reliability    
- Freight cost patterns to evaluate shipping efficiency
These insights help optimize logistics and improve customer satisfaction.
*/; 






















