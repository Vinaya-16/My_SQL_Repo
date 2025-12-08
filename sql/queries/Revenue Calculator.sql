-- Total Revenue Calculation
-- Calculate the total revenue generated from all orders.

SELECT 
	o.OrderId,o.ProductID,
	p.Product,o.Quantity, p.Price,
	o.Quantity*p.Price AS Revenue,
	SUM(o.Quantity*p.Price) 
		OVER(PARTITION BY p.ProductID) AS TotalRevenue
FROM Sales.Orders o
JOIN Sales.Products p
ON o.ProductID = p.ProductID