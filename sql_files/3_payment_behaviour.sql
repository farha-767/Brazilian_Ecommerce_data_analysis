/*"What payment methods do customers prefer and how do they correlate with order value?"
Why this matters: Optimize payment processing and understand customer preferences.

What are analyzed:

Payment method popularity,
Average order value by payment type,
Payment installments analysis,
*/

SELECT 
    payment_type AS payment_method,
    ROUND(AVG(order_payments.payment_value),1) AS average_payment_value, 
    COUNT(*) AS payment_count,
    SUM(order_payments.payment_value) AS total_payment_value,
    ROUND(AVG(CASE 
           WHEN order_payments.payment_installments = 1 THEN order_payments.payment_value
           ELSE NULL
        END),1) AS avg_single_installment_value,       
    ROUND(AVG(CASE
           WHEN order_payments.payment_installments > 1 THEN order_payments.payment_value
           ELSE NULL
           END),1)AS avg_multiple_installments_value,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 1) AS payment_percentage,
    ROUND(SUM(payment_value) * 100.0 / SUM(SUM(payment_value)) OVER(), 1) AS revenue_percentage,
    ROUND(AVG(order_payments.payment_installments),1) AS avg_number_of_installments,
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
Insights:
1. Credit Card Controls '73.9%' of transactions and '78.3%'' of revenue, making it the undisputed market leader and primary revenue driver.
2.  66.8% of credit card payments use installments (avg: 3.5 installments), with installment orders being '105% higher value' ($197 vs $96 single payment).
3. Boleto As the #2 method with 19% market share, it serves customers preferring single payments with substantial average value ($145).
4. Clear tiers exist: Credit Card (premium), Boleto (mid-market), Voucher/Debit Card (low-value transactions <$66).
5. Heavy reliance on credit cards (78% of revenue) creates vulnerability to credit market changes or processor issues.

Recommendations:
1. Prioritize credit card processing optimizations to enhance customer experience and maximize revenue capture.
2. Promote installment options to boost average order values, especially for high-ticket items.
3. Monitor boleto usage trends to ensure it continues meeting mid-market customer needs effectively.
4. Explore opportunities to increase adoption of debit card payments for diversification.
5. Mitigate risks of credit card dependency by incentivizing alternative payment methods.


Result Set:

[
  {
    "payment_method": "credit_card",
    "average_payment_value": "163.3190206393645420",
    "payment_count": "76795",
    "total_payment_value": "12542084.19",
    "avg_single_installment_value": "95.8729298762522098",
    "avg_multiple_installments_value": "196.7636084381939304",
    "payment_percentage": "73.92",
    "revenue_percentage": "78.34",
    "avg_number_of_installments": "3.5071554137639169",
    "single_installment_count": "25455",
    "multiple_installment_count": "51338",
    "market_position": "Market Leader"
  },
  {
    "payment_method": "boleto",
    "average_payment_value": "145.0344354023453296",
    "payment_count": "19784",
    "total_payment_value": "2869361.27",
    "avg_single_installment_value": "145.0344354023453296",
    "avg_multiple_installments_value": null,
    "payment_percentage": "19.04",
    "revenue_percentage": "17.92",
    "avg_number_of_installments": "1.00000000000000000000",
    "single_installment_count": "19784",
    "multiple_installment_count": "0",
    "market_position": "Niche Method"
  },
  {
    "payment_method": "voucher",
    "average_payment_value": "65.7033541125541126",
    "payment_count": "5775",
    "total_payment_value": "379436.87",
    "avg_single_installment_value": "65.7033541125541126",
    "avg_multiple_installments_value": null,
    "payment_percentage": "5.56",
    "revenue_percentage": "2.37",
    "avg_number_of_installments": "1.00000000000000000000",
    "single_installment_count": "5775",
    "multiple_installment_count": "0",
    "market_position": "Niche Method"
  },
  {
    "payment_method": "debit_card",
    "average_payment_value": "142.5701700457815566",
    "payment_count": "1529",
    "total_payment_value": "217989.79",
    "avg_single_installment_value": "142.5701700457815566",
    "avg_multiple_installments_value": null,
    "payment_percentage": "1.47",
    "revenue_percentage": "1.36",
    "avg_number_of_installments": "1.00000000000000000000",
    "single_installment_count": "1529",
    "multiple_installment_count": "0",
    "market_position": "Niche Method"
  },
  {
    "payment_method": "not_defined",
    "average_payment_value": "0.00000000000000000000",
    "payment_count": "3",
    "total_payment_value": "0.00",
    "avg_single_installment_value": "0.00000000000000000000",
    "avg_multiple_installments_value": null,
    "payment_percentage": "0.00",
    "revenue_percentage": "0.00",
    "avg_number_of_installments": "1.00000000000000000000",
    "single_installment_count": "3",
    "multiple_installment_count": "0",
    "market_position": "Niche Method"
  }
]

*/