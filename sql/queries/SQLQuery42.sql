-- FIND THE LOWEST 2 CUSTOMERS 
-- BASED ON THEIR TOTAL SALES


SELECT TOP 2
CustomerID,
SUM(Sales) AS TotalSales
FROM Sales.Orders
GROUP BY CustomerID
ORDER BY SUM(Sales) 

-- OR

SELECT TOP 2
CustomerID,
SUM(Sales) AS TotalSales,
ROW_NUMBER() OVER(ORDER BY SUM(Sales)) AS LowestRankCustomer
FROM Sales.Orders
GROUP BY CustomerID

-- OR

SELECT
*
FROM
(
	SELECT TOP 2
	CustomerID,
	SUM(Sales) AS TotalSales,
	ROW_NUMBER() OVER(ORDER BY SUM(Sales)) AS LowestRankCustomer
	FROM Sales.Orders
	GROUP BY CustomerID
) t
WHERE LowestRankCustomer <= 2


