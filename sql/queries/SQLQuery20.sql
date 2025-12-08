-- FIND THE AVERAGE SHIPPING DURATIONS IN DAYS IN EACH MONTH

SELECT
FORMAT(OrderDate, 'MMM') AS OrderMonth,
AVG(DATEDIFF(DAY, OrderDate, ShipDate)) AS [Average of Shipping Durations]
FROM Sales.Orders
GROUP BY FORMAT(OrderDate, 'MMM')