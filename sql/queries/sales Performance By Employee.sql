-- Sales Performance by Employee
-- Show total sales amount handled by each employee 
-- (assume employee_id in orders), for orders in the last quarter.

SELECT
SalesPersonID,
SUM(Sales) AS TotalSales
FROM Sales.Orders
WHERE OrderDate >= DATEADD(QUARTER, -1, DATEADD(QUARTER, DATEDIFF(QUARTER, 0, GETDATE()), 0))
		AND OrderDate < DATEADD(QUARTER, DATEDIFF(QUARTER, 0, GETDATE()), 0)
GROUP BY SalesPersonID
ORDER BY SalesPersonID DESC