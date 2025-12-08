-- ANALYZE THE MONTH-OVER-MONTH (MOM) PERFORMANCE 
-- BY FINDING THE PERCENTAGE CHANGE IN SALES
-- BETWEEN THE CURRENT AND PREVIOUS MONTH

SELECT
*,
[Total Sale] - [Sale OF Previous Month] AS MoM,
ROUND(CAST([Total Sale] - [Sale OF Previous Month] AS FLOAT) / [Sale OF Previous Month] * 100, 2) AS MoM_percentage
FROM
(
	SELECT
	MONTH(OrderDate) AS Month,
	SUM(Sales) As [Total Sale],
	LAG(SUM(Sales)) OVER(ORDER BY MONTH(OrderDate)) AS [Sale OF Previous Month]
	FROM Sales.Orders
	GROUP BY MONTH(OrderDate)
) t 
