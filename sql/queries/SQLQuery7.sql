-- GET ALL THE ORDERS WITHOUT MATCHING CUSTOMERS

SELECT  
c.first_name, c.country,
o.order_id, o.customer_id, o.order_date, o.sales
FROM customers c
RIGHT JOIN orders o
ON c.id = o.customer_id
WHERE c.id IS NULL