-- SHOW THE PRODUCT ID, PRODUCT NAME, PRICE AND THE TOTAL NUMBER OF ORDERS

SELECT
	p.*,
	o.TotalOrders
FROM Sales.Products p
LEFT JOIN
(
	SELECT 
	ProductID,
	COUNT(OrderID) AS TotalOrders
	FROM Sales.Orders
	GROUP BY ProductID
) o
ON p.ProductID = o.ProductID


-- SHOW ALL CUSTOMER DETAILS AND FIND THE TOTAL ORDERS OF EACH CUSTOMER

SELECT
c.*,
o.TotalOrders
FROM Sales.Customers c
LEFT JOIN
(
	SELECT 
	CustomerID,
	COUNT(OrderID) AS TotalOrders
	FROM Sales.Orders
	GROUP BY CustomerID
) o
ON c.CustomerID = o.CustomerID