-- ANALYZE CUSTOMER LOYALTY BY RANKING CUSTOMERS 
-- BASED ON THE AVERAGE NUMBER OF DAYS BETWEEN ORDERS

SELECT
CustomerID,
AVG(DaysDiff) AS [Avg No. Of Days Betwn Orders],
RANK() OVER(ORDER BY COALESCE(AVG(DaysDiff), 99999)) AS Ranks
FROM
(
	SELECT
	OrderID,
	CustomerID,
	OrderDate AS CurrentOrder,
	LEAD(OrderDate) OVER(PARTITION BY CustomerID ORDER BY OrderDate) AS NextOrder,
	DATEDIFF(day, OrderDate, LEAD(OrderDate) OVER(PARTITION BY CustomerID ORDER BY OrderDate)) AS DaysDiff
	FROM Sales.Orders
) t
GROUP BY CustomerID