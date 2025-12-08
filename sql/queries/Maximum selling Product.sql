-- Top Selling Products
-- List the top 5 products by total quantity sold.

SELECT
	TOP 5
	p.ProductID,
	p.Product,
	o.Quantity,
	SUM(o.Quantity)  AS TotalQuantity
FROM Sales.Products p
JOIN Sales.Orders o
ON p.ProductID = o.ProductID
GROUP BY p.ProductID,
		 p.Product,
		 o.Quantity
ORDER BY SUM(o.Quantity) DESC