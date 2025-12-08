-- FIND THE EMPLOYEES WHO ARE NOT CUSTOMERS AT THE SAME TIME

SELECT 
e.FirstName, e.LastName
FROM Sales.Employees e

EXCEPT

SELECT 
c.FirstName, c.LastName
FROM Sales.Customers c

-- FIND THE CUSTOMERS WHO ARE NOT EMPLOYEES AT THE SAME TIME

SELECT
FirstName, LastName
FROM Sales.customers

EXCEPT

SELECT 
FirstName, LastName
FROM Sales.Employees