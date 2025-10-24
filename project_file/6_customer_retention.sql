/*
"What percentage of customers make repeat purchases and how valuable are they?"

Why this matters: Measure business health and identify growth opportunities in customer loyalty.


What to analyze:

Repeat customer rate

Revenue from new vs returning customers

Time between purchases for repeat customers

SQL concepts to practice:

Advanced JOIN patterns

Subqueries or CTEs

Complex business logic

*/;

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

/*
🎯 Expected Insights from Your Query:
- Percentage of customers making repeat purchases
- Revenue contribution from repeat customers    
These insights help assess customer loyalty and identify growth opportunities.
*/;











