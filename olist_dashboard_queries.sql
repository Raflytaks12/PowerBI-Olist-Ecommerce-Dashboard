---TOTAL REVENUE---
SELECT
    SUM(price) AS total_revenue
FROM `olist_dataset.order_items`;


--10 category--
SELECT
    p.product_category_name,
    SUM(oi.price) AS total_revenue
FROM `olist_dataset.order_items` oi
JOIN `olist_dataset.products` p
ON oi.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY total_revenue DESC
LIMIT 10;


--revenue perbulan--

SELECT
    EXTRACT(YEAR FROM o.order_purchase_timestamp) AS year,
    EXTRACT(MONTH FROM o.order_purchase_timestamp) AS month,
    SUM(oi.price) AS total_revenue
FROM `olist_dataset.orders` o
JOIN `olist_dataset.order_items` oi
ON o.order_id = oi.order_id
GROUP BY year, month
ORDER BY year, month;


--10 kota dengan revenue tebesar--

SELECT
    c.customer_city,
    SUM(oi.price) AS total_revenue
FROM `olist_dataset.orders` o
JOIN `olist_dataset.customers` c
ON o.customer_id = c.customer_id
JOIN `olist_dataset.order_items` oi
ON o.order_id = oi.order_id
GROUP BY c.customer_city
ORDER BY total_revenue DESC
LIMIT 10;


--10 seller berdsasarkan revenue--

SELECT
    s.seller_id,
    SUM(oi.price) AS total_revenue
FROM `olist_dataset.order_items` oi
JOIN `olist_dataset.sellers` s
ON oi.seller_id = s.seller_id
GROUP BY s.seller_id
ORDER BY total_revenue DESC
LIMIT 10;

--status order--

SELECT
    order_status,
    COUNT(*) AS total_order
FROM `olist_dataset.orders`
GROUP BY order_status
ORDER BY total_order DESC;


--rata2 nilai riview--

SELECT
    AVG(review_score) AS average_review
FROM `olist_dataset.order_riviews`;

--metode yg sering di gunakan--

SELECT
    payment_type,
    COUNT(*) AS total_transaction
FROM `olist_dataset.order_payments`
GROUP BY payment_type
ORDER BY total_transaction DESC;


--category paling banyak terjual--

SELECT
    p.product_category_name,
    COUNT(*) AS total_sold
FROM `olist_dataset.order_items` oi
JOIN `olist_dataset.products` p
ON oi.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY total_sold DESC
LIMIT 10;

--category aov--

SELECT
    ROUND(SUM(price) / COUNT(DISTINCT order_id), 2) AS average_order_value
FROM `olist_dataset.order_items`;



