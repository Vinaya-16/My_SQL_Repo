-- Customer Count by City
-- Show how many customers are in each city, ordered by highest count.

SELECT
Country,
SUM(CustomerID) AS [ Max. Customer In The City ]
FROM Sales.Customers
GROUP BY Country
ORDER BY SUM(CustomerID) DESC