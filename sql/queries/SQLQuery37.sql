-- FIND THE PERCENTAGE CONTRIBUTION OF EACH PRODUCT'S SALES TO THE TOTAL SALES

SELECT
	OrderID,
	ProductID,
	Sales,
	SUM(Sales) OVER() AS TotalSales,
	ROUND( CAST(Sales AS FLOAT) / SUM(Sales) OVER() * 100 , 2) AS [Percentage Of Each Product's Sale]
FROM Sales.Orders