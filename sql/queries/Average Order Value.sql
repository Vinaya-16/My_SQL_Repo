-- Average Order Value
-- Find the average order value (total revenue / number of orders).

SELECT
    SUM(p.Price * o.Quantity) * 1.0 / COUNT(OrderID) AS AverageOrderValue
FROM Sales.Orders o
JOIN Sales.Products p
    ON o.ProductID = p.ProductID
