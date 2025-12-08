-- GET ALL THE CUSTOMERS WITH THEIR ORDERS 
--INCLUDING ORDERS WITHOUT MATCHING

SELECT 
c.id, c.first_name, c.country,
o.customer_id, o.order_id, o.sales, o.order_date
FROM customers c
LEFT JOIN Orders o
ON c.id = o.customer_id