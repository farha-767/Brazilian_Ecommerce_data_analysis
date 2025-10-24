--- Load data into tables from CSV files

-- load data into 'customers' table
COPY customers FROM 'C:\Brazilian_Ecommerce_Data_Analysis\csv files\olist_customers_dataset.csv' DELIMITER ',' CSV HEADER;

-- load data into 'orders' table
COPY orders FROM 'C:\Brazilian_Ecommerce_Data_Analysis\csv files\olist_orders_dataset.csv' DELIMITER ',' CSV HEADER;

-- load data into 'products' table       
COPY products FROM 'C:\Brazilian_Ecommerce_Data_Analysis\csv files\olist_products_dataset.csv' DELIMITER ',' CSV HEADER;

-- load data into 'order_items' table
COPY order_items FROM 'C:\Brazilian_Ecommerce_Data_Analysis\csv files\olist_order_items_dataset.csv' DELIMITER ',' CSV HEADER;

-- load data into 'order_payments' table
COPY order_payments FROM 'C:\Brazilian_Ecommerce_Data_Analysis\csv files\olist_order_payments_dataset.csv' DELIMITER ',' CSV HEADER;

-- load data into 'order_reviews' table
COPY order_reviews FROM 'C:\Brazilian_Ecommerce_Data_Analysis\csv files\olist_order_reviews_dataset.csv' DELIMITER ',' CSV HEADER;

-- load data into 'sellers' table
COPY sellers FROM 'C:\Brazilian_Ecommerce_Data_Analysis\csv files\olist_sellers_dataset.csv' DELIMITER ',' CSV HEADER;

-- load data into 'product_category_name_translation' table
COPY product_category_name_translation FROM 'C:\Brazilian_Ecommerce_Data_Analysis\csv files\product_category_name_translation.csv' DELIMITER ',' CSV HEADER;

-- load data into 'geolocation' table
COPY geolocation FROM 'C:\Brazilian_Ecommerce_Data_Analysis\csv files\olist_geolocation_dataset.csv' DELIMITER ',' CSV HEADER;


/*Add any necessary modifications to the tables after loading data
For example, adding indexes or altering columns if needed */

