-- Monthly Sales Trend
-- Display total revenue per month 
-- OPTIONAL [for the last 6 months.]

SELECT
FORMAT(ShipDate, 'yyyy,MM') AS Month,
SUM(Sales) AS TotalSales
FROM Sales.Orders
--WHERE Shipdate >= DATEADD(MONTH, -6, GETDATE())
GROUP BY FORMAT(ShipDate, 'yyyy,MM')
ORDER BY SUM(Sales) DESC
