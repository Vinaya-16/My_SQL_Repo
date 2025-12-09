-- Most Profitable Products
-- Show products with the highest profit margin 
-- (price - cost) / price * 100, for products sold at least 5 units.

SELECT
t.ProductID,
SUM(t.Quantity) AS TotalProductSold,
( t.Price - t.Cost ) / t.Price * 100 AS Profit_Margin
FROM
(
	SELECT
		o.ProductID,
		o.Quantity,
		p.Product,
		p.Price,
		p.Price*0.50 AS Cost -- Since Cost column is not defined
	FROM Sales.Orders o
	JOIN Sales.Products p
		ON o.ProductID = p.ProductID
) t
GROUP BY t.ProductID,
		 t.Price,
		 t.Cost
HAVING SUM(t.Quantity) > = 5
ORDER BY Profit_Margin DESC


