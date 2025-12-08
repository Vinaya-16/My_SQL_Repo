-- GET ALL CUSTOMERS WHO HAVEN'T PLACED ANY ORDERS

SELECT
c.id, c.first_name, c.country,
o.order_id, o.sales
FROM customers c
LEFT JOIN orders o
ON c.id = o.customer_id
WHERE o.customer_id IS NULL