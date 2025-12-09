-- Repeat Customers
-- Identify customers who have placed more than 2 orders.

SELECT
CustomerID AS NativeCustomer,
COUNT(OrderID) AS TotalOrders
FROM Sales.Orders
GROUP BY CustomerID 
HAVING COUNT(OrderID) > 2