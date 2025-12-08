-- SEGMENT ALL ORDERS INTO 3 CATEGORIES: HIGH, MEDIUM AND LOW

SELECT
*,
	CASE 
		WHEN Buckets = 1 THEN 'High'
		WHEN Buckets = 2 THEN 'Medium'
		ELSE 'Low'
	END OrderLevel
FROM
(
	SELECT
	OrderID, Sales,
	NTILE(3) OVER(ORDER BY Sales DESC) AS Buckets
	FROM Sales.Orders
) t
