-- Customer Lifetime Value
-- Calculate total revenue per customer, and rank them from highest to lowest.

SELECT
CustomerID,
SUM(Sales) AS TotalRevenue,
RANK() OVER(ORDER BY SUM(Sales) DESC) AS Ranks
FROM Sales.Orders
GROUP BY CustomerID