/*"What payment methods do customers prefer and how do they correlate with order value?"

Why this matters: Optimize payment processing and understand customer preferences.

What to analyze:

Payment method popularity

Average order value by payment type

Payment installments analysis

SQL concepts to practice:

Single table deep analysis

Multiple aggregate functions

CASE statements for categorization

Percentage calculations*/;

SELECT 
    payment_type AS payment_method,
    AVG(order_payments.payment_value) AS average_payment_value, 
    COUNT(*) AS payment_count,
    SUM(order_payments.payment_value) AS total_payment_value,
    AVG(CASE 
           WHEN order_payments.payment_installments = 1 THEN order_payments.payment_value
           ELSE NULL
        END) AS avg_single_installment_value,       
    AVG(CASE
           WHEN order_payments.payment_installments > 1 THEN order_payments.payment_value
           ELSE NULL
           END) AS avg_multiple_installments_value,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS payment_percentage,
    ROUND(SUM(payment_value) * 100.0 / SUM(SUM(payment_value)) OVER(), 2) AS revenue_percentage,
    AVG(order_payments.payment_installments) AS avg_number_of_installments,
    COUNT(CASE
           WHEN order_payments.payment_installments =1 THEN order_payments.payment_installments
           ELSE NULL
           END) AS single_installment_count,
    COUNT(CASE
            WHEN order_payments.payment_installments > 1 THEN order_payments.payment_installments
            ELSE NULL
            END) AS multiple_installment_count,
    CASE 
    WHEN COUNT(*) * 100.0 / SUM(COUNT(*)) OVER() > 50 THEN 'Market Leader'
    WHEN COUNT(*) * 100.0 / SUM(COUNT(*)) OVER() > 20 THEN 'Major Player'
    ELSE 'Niche Method'
    END AS market_position
FROM order_payments
GROUP BY
    payment_method  
ORDER BY
    total_payment_value DESC, payment_count DESC;


/*
🎯 Expected Insights from Your Query:
Your current query will reveal:

Most popular payment method (by count)

Highest revenue-generating method (by total value)

Payment method preferences for different order values

Installment behavior patterns across payment types

📊 Sample Insights You Might Discover:
Credit cards might be used for higher-value orders

Debit cards might be preferred for smaller, single-payment orders

Some payment methods might be exclusively used with installments
*/






















          
