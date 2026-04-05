
//top selling products.
SELECT p.name, SUM(oi.quantity) AS total_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.name
ORDER BY total_sold DESC;

//monthly revenue
SELECT MONTH(order_date) AS month, SUM(total_price) AS revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY month;

//customer segmentation
SELECT c.name,
       SUM(oi.total_price) AS total_spent,
       CASE
           WHEN SUM(oi.total_price) > 5000 THEN 'High Value'
           WHEN SUM(oi.total_price) > 2000 THEN 'Medium Value'
           ELSE 'Low Value'
       END AS segment
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.name;