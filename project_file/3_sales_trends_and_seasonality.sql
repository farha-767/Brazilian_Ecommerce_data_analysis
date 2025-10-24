/*
"How do sales vary by month and are there specific seasonal patterns?"

Why this matters: Understand business cycles for inventory planning and marketing timing.

What to analyze:

Monthly revenue trends

Order volume patterns

Identify peak seasons/months

SQL concepts to practice:

Date functions (DATE_TRUNC, EXTRACT)

Time series analysis

Multiple aggregation levels

Trend analysis
*/;

SELECT
    EXTRACT(YEAR FROM orders.order_purchase_timestamp) AS order_year,
    EXTRACT(MONTH FROM orders.order_purchase_timestamp) AS order_month,
    TO_CHAR(orders.order_purchase_timestamp, 'Month') AS month_name,
    SUM(order_items.price) AS total_revenue,
    COUNT(orders.order_id) AS total_orders,
    AVG(order_items.price) AS avg_order_value,
    COUNT(DISTINCT orders.customer_id) AS unique_customers
FROM
    orders INNER JOIN order_items ON orders.order_id = order_items.order_id
GROUP BY
    order_year, order_month, month_name
ORDER BY
    order_year, order_month;

/*
🎯 Expected Insights from Your Query        
Your current query will reveal
- Monthly revenue trends over the years:
- Order volume patterns by month
- Average order values month-over-month 
These insights help identify peak seasons and inform strategic decisions.
*/;




































SELECT 
    DATE_TRUNC('month', o.order_purchase_timestamp) AS order_month,
    COUNT(o.order_id) AS total_orders,
    SUM(op.payment_value) AS total_revenue,
    AVG(op.payment_value) AS avg_order_value                
FROM 
    orders AS o
    INNER JOIN order_payments AS op ON o.order_id = op.order_id
GROUP BY
    order_month
ORDER BY
    order_month;
/*
🎯 Expected Insights from Your Query            

Your current query will reveal
- Monthly order counts to identify busy periods
- Total revenue trends over time
- Average order values to spot changes in customer spending
These insights help pinpoint seasonal patterns and inform strategic decisions.
*/:

/*
-- To analyze seasonal patterns more deeply, consider extending the query to include year-over-year comparisons or
  calculating month-over-month growth rates.        
-- You could also visualize the results using line charts to better illustrate trends and seasonal fluctuations.
-- Additionally, incorporating external factors such as holidays or promotional events could provide further context to the observed trends.
*/


