/*
IF OBJECT_ID ('V_MonthlySummary', 'V') IS NOT NULL
	DROP VIEW V_CustomerDetails;
*/

/*
CREATE VIEW Sales.V_MonthlySummary AS
(
	SELECT
	FORMAT(OrderDate, 'MMM') AS OrderMonth,
	COUNT(OrderID) AS TotalOrders,
	SUM(Sales) AS TotalSale,
	SUM(Quantity) AS TotalQuantity
	FROM Sales.Orders
	GROUP BY FORMAT(OrderDate, 'MMM')
)
*/

-- PROVIDE VIEW THAT COMBINES DETAILS FROM ORDERS, PRODUCTS, CUSTOMERS, AND EMPLOYEES
/*
CREATE VIEW Sales.V_OrderDetails AS 
(
	SELECT
	o.OrderID,
	OrderDate AS Order_Date,
	Quantity,
	Sales,
	p.Product,
	p.Category,
	CONCAT(c.FirstName,' ',c.LastName) AS Customer_Name,
	c.Country,
	CONCAT(e.FirstName,' ',e.LastName) AS Sales_Person,
	e.Department
	FROM Sales.Orders o
	LEFT JOIN Sales.Products p
	ON o.ProductID = p.ProductID
	LEFT JOIN Sales.Customers c
	ON o.CustomerID = c.CustomerID
	LEFT JOIN Sales.Employees e
	ON o.SalesPersonID = e.EmployeeID	
)
*/

-- PROVIDE A VIEW FOR EU SALES TEAM 
-- THAT COMBINES DETAILS FROM ALL TABLES
-- AND EXCLUDE DATA RELATED TO THE USA

/*
CREATE VIEW Sales.OrderDetails_EU AS 
(
	SELECT
	o.OrderID,
	OrderDate AS Order_Date,
	Quantity,
	Sales,
	p.Product,
	p.Category,
	CONCAT(c.FirstName,' ',c.LastName) AS Customer_Name,
	c.Country,
	CONCAT(e.FirstName,' ',e.LastName) AS Sales_Person,
	e.Department
	FROM Sales.Orders o
	LEFT JOIN Sales.Products p
	ON o.ProductID = p.ProductID
	LEFT JOIN Sales.Customers c
	ON o.CustomerID = c.CustomerID
	LEFT JOIN Sales.Employees e
	ON o.SalesPersonID = e.EmployeeID
	WHERE c.Country <> 'USA'
)
*/