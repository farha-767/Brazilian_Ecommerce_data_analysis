/*
"What percentage of customers make repeat purchases and how valuable are they?"
Why this matters: Measure business health and identify growth opportunities in customer loyalty.

What are analyzed:

Repeat customer rate,
Revenue from new vs returning customers,
Time between purchases for repeat customers
*/

WITH customer_orders AS (
    SELECT
        customers.customer_id,
        COUNT(orders.order_id) AS total_orders,
        SUM(order_items.price) AS total_spent
    FROM 
        customers
        INNER JOIN orders ON customers.customer_id = orders.customer_id
        INNER JOIN order_items ON orders.order_id = order_items.order_id
    GROUP BY
        customers.customer_id
)


SELECT
    COUNT(DISTINCT CASE 
        WHEN customer_orders.total_orders > 1 THEN customer_orders.customer_id
        ELSE NULL
    END) AS repeat_customers,
    COUNT(DISTINCT customer_orders.customer_id) AS total_customers,
    ROUND(
        COUNT(DISTINCT CASE 
            WHEN customer_orders.total_orders > 1 THEN customer_orders.customer_id
            ELSE NULL
        END) * 100.0 / COUNT(DISTINCT customer_orders.customer_id), 2
    ) AS repeat_purchase_percentage,
    SUM(CASE 
        WHEN customer_orders.total_orders > 1 THEN customer_orders.total_spent
        ELSE 0
    END) AS total_revenue_from_repeat_customers,
    SUM(customer_orders.total_spent) AS total_revenue,
    ROUND(
        SUM(CASE 
            WHEN customer_orders.total_orders > 1 THEN customer_orders.total_spent
            ELSE 0
        END) * 100.0 / SUM(customer_orders.total_spent), 2
    ) AS revenue_percentage_from_repeat_customers   
FROM 
    customer_orders;


-- customer tier analysis

WITH customer_orders AS (
    SELECT
        customers.customer_id,
        COUNT(orders.order_id) AS total_orders,
        SUM(order_items.price) AS total_spent
    FROM 
        customers
        INNER JOIN orders ON customers.customer_id = orders.customer_id
        INNER JOIN order_items ON orders.order_id = order_items.order_id
    GROUP BY
        customers.customer_id
)

SELECT
    CASE 
        WHEN total_orders = 1 THEN 'One-time'
        WHEN total_orders = 2 THEN 'Returning' 
        WHEN total_orders >= 3 THEN 'Loyal'
    END AS customer_tier,
    COUNT(*) AS customer_count,
    AVG(total_spent) AS avg_spent
FROM customer_orders
GROUP BY customer_tier;


/* Insights:
1. Small but Mighty: Just 10% of customers are repeat buyers, but they generate 15% of all revenue.
2. Value Gap: A repeat customer is 50% more valuable than a new one (204 vs. 135).
3. Acquisition Heavy: Over 90% of customers don't return, showing a heavy reliance on new buyer acquisition.
4. Efficiency Opportunity: Retaining existing customers is more profitable than constantly acquiring new ones.
5. Growth Lever: The biggest growth opportunity is converting one-time buyers into repeat purchasers.

Recommendations:
1. Implement loyalty programs to incentivize repeat purchases.
2. Personalize marketing to re-engage one-time buyers.
3. Analyze barriers preventing repeat purchases and address them.
4. Focus on customer satisfaction to build long-term relationships.
5. Monitor repeat purchase metrics regularly to track improvement.

Result Set:

[
  {
    "repeat_customers": "9803",
    "total_customers": "98666",
    "repeat_purchase_percentage": "9.94",
    "total_revenue_from_repeat_customers": "2005862.42",
    "total_revenue": "13591643.70",
    "revenue_percentage_from_repeat_customers": "14.76"
  }
]

*/