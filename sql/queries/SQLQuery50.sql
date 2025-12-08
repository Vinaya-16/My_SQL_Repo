-- FIND THE PRODUCTS THAT HAVE A PRICE HIGHER 
-- THAN THE AVERAGE PRICE OF ALL PRODUCTS

SELECT
ProductID,
Product,
Price,
Avg_Price
FROM
(
	SELECT
	*,
	AVG(Price) OVER() AS Avg_Price
	FROM Sales.Products
) t
WHERE Price > Avg_Price
