/*Who are our most valuable customers and where are they located?"
Why this matters: Identifies your best customers for targeted marketing and retention strategies

What to analyze:
Top customers by total spending,
Geographic distribution of high-value customers*/


SELECT 
    customers.customer_id,
    customers.customer_state AS state,
    customers.customer_city AS city,
    COUNT(orders.order_id) AS number_of_orders,
    SUM(op.payment_value) AS total_sales_amount
FROM customers 
    INNER JOIN orders ON customers.customer_id = orders.customer_id
    INNER JOIN order_payments AS op ON orders.order_id = op.order_id
GROUP BY
    customers.customer_id, customers.customer_state, customers.customer_city
ORDER BY
    total_sales_amount DESC, number_of_orders DESC
LIMIT 15;

/* 
insights: 
1. The top 15 customers by total spending have been identified, providing a clear view of who our most valuable customers are.        
2. The geographic distribution of these high-value customers is available, allowing for targeted marketing efforts in specific states and cities.        
3. The number of orders placed by these top customers indicates their purchasing frequency, which can inform retention strategies.        
4. Analyzing whether high spenders are also frequent buyers can help tailor personalized offers and promotions to enhance customer loyalty.

Recommendations:
1. Develop targeted marketing campaigns focusing on the states and cities where high-value customers are concentrated.  
2. Create personalized retention strategies for top customers based on their purchasing behavior and frequency.
3. Consider loyalty programs or exclusive offers for customers with high total spending to encourage repeat business.
4. Analyze purchasing patterns of these top customers to identify potential upselling or cross-selling opportunities.
5. Monitor changes in customer value over time to adjust marketing and retention strategies accordingly.*/



/* Result Set
[
  {
    "customer_id": "1617b1357756262bfa56ab541c47bc16",
    "state": "RJ",
    "city": "rio de janeiro",
    "number_of_orders": "1",
    "total_sales_amount": "13664.08"
  },
  {
    "customer_id": "ec5b2ba62e574342386871631fafd3fc",
    "state": "ES",
    "city": "vila velha",
    "number_of_orders": "1",
    "total_sales_amount": "7274.88"
  },
  {
    "customer_id": "c6e2731c5b391845f6800c97401a43a9",
    "state": "MS",
    "city": "campo grande",
    "number_of_orders": "1",
    "total_sales_amount": "6929.31"
  },
  {
    "customer_id": "f48d464a0baaea338cb25f816991ab1f",
    "state": "ES",
    "city": "vitoria",
    "number_of_orders": "1",
    "total_sales_amount": "6922.21"
  },
  {
    "customer_id": "3fd6777bbce08a352fddd04e4a7cc8f6",
    "state": "SP",
    "city": "marilia",
    "number_of_orders": "1",
    "total_sales_amount": "6726.66"
  },
  {
    "customer_id": "05455dfa7cd02f13d132aa7a6a9729c6",
    "state": "MG",
    "city": "divinopolis",
    "number_of_orders": "1",
    "total_sales_amount": "6081.54"
  },
  {
    "customer_id": "df55c14d1476a9a3467f131269c2477f",
    "state": "RJ",
    "city": "araruama",
    "number_of_orders": "1",
    "total_sales_amount": "4950.34"
  },
  {
    "customer_id": "e0a2412720e9ea4f26c1ac985f6a7358",
    "state": "GO",
    "city": "goiania",
    "number_of_orders": "1",
    "total_sales_amount": "4809.44"
  },
  {
    "customer_id": "24bbf5fd2f2e1b359ee7de94defc4a15",
    "state": "SP",
    "city": "maua",
    "number_of_orders": "1",
    "total_sales_amount": "4764.34"
  },
  {
    "customer_id": "3d979689f636322c62418b6346b1c6d2",
    "state": "PB",
    "city": "joao pessoa",
    "number_of_orders": "1",
    "total_sales_amount": "4681.78"
  },
  {
    "customer_id": "1afc82cd60e303ef09b4ef9837c9505c",
    "state": "SP",
    "city": "sao paulo",
    "number_of_orders": "1",
    "total_sales_amount": "4513.32"
  },
  {
    "customer_id": "cc803a2c412833101651d3f90ca7de24",
    "state": "RJ",
    "city": "niteroi",
    "number_of_orders": "1",
    "total_sales_amount": "4445.50"
  },
  {
    "customer_id": "926b6a6fb8b6081e00b335edaf578d35",
    "state": "DF",
    "city": "brasilia",
    "number_of_orders": "2",
    "total_sales_amount": "4194.76"
  },
  {
    "customer_id": "35a413c7ca3c69756cb75867d6311c0d",
    "state": "MG",
    "city": "bom jesus do galho",
    "number_of_orders": "1",
    "total_sales_amount": "4175.26"
  },
  {
    "customer_id": "e9b0d0eb3015ef1c9ce6cf5b9dcbee9f",
    "state": "MG",
    "city": "nova lima",
    "number_of_orders": "1",
    "total_sales_amount": "4163.51"
  }
]
*/