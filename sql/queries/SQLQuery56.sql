-- SHOW THE EMPLOYEE HEIRARCHY BY DISPLAYING EACH EMPLOYEE'S LEVEL WITHIN THE ORGANIZATION

WITH CTE_level AS 
(
	SELECT
	EmployeeID,
	FirstName,
	ManagerID,
	1 AS Level
	FROM Sales.Employees
	WHERE ManagerID IS NULL

	UNION ALL

	SELECT
	e.EmployeeID,
	e.FirstName,
	e.ManagerID,
	level + 1
	FROM Sales.Employees e
	INNER JOIN CTE_level clvl
	ON e.ManagerID = clvl.EmployeeID
)

SELECT
*
FROM CTE_level