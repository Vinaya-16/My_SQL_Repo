-- USING SALESDB, RETRIEVE A LIST OF ALL ORDERS, ALONG WITH THE RELATED CUSTOMER, PRODUCT AND EMPLOYEE DETAILS
-- FOR EACH ORDER, IT DISPLAY:
-- ORDER ID
-- CUSTOMER'S NAME
--PRODUCT NAME
-- SALES AMOUNT
-- PRODUCT PRICE
--SALESPERSON'S NAME

SELECT
	o.OrderID, o.Sales,
	c.FirstName as CustomerFirstName, 
	c.LastName as CustomerLastName,
	p.Product as ProdutName, 
	p.Price as Product_Price,
	e.FirstName as SalesPersonFirstName,
	e.LastName as SalesPersonLastName
FROM Sales.Orders o
LEFT JOIN Sales.Customers c
ON o.CustomerID = c.CustomerID
LEFT JOIN Sales.Products p
ON o.ProductID = p.ProductID
LEFT JOIN Sales.Employees e
ON o.SalesPersonID = e.EmployeeID
