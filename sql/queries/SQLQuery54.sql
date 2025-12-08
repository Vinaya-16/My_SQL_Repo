--STEP 1: FIND THE TOTAL SALES FOR EACH CUSTOMERS

WITH CTE_TotalSale AS 
(
	SELECT
	CustomerID,
	SUM(Sales) AS TotalSales
	FROM Sales.Orders
	GROUP BY CustomerID
)

-- STEP 2: FIND THE LAST ORDER DATE FOR EACH CUSTOMER
, CTE_LastOrder AS 
(
	SELECT
	CustomerID,
	MAX(OrderDate) AS LastOrder
	FROM Sales.Orders
	GROUP BY CustomerID
)

-- STEP 3: RANK THE CUSTOMERS BASED ON TOTAL SALES PER CUSTOMER

, CTE_Rank AS
(
	SELECT
	CustomerID,
	RANK() OVER(ORDER BY TotalSales DESC) As Ranks
	FROM CTE_TotalSale 

)

-- STEP 4: SEGMENT CUSTOMERS BASED ON THEIR TOTAL SALES
, CTE_CustomerSegmentation AS
(
	SELECT
	CustomerID,
	CASE
		WHEN TotalSales > 100 THEN 'High'
		WHEN TotalSales > 50 THEN 'Medium'
		ELSE 'Low'
	END CustomerSegments
	FROM CTE_TotalSale 
)

-- MAIN QUERY

SELECT
c.CustomerID,
c.FirstName,
c.LastName,
cte1.TotalSales,
cte2.LastOrder,
cte3.Ranks,
cte4.CustomerSegments
FROM Sales.Customers c
LEFT JOIN CTE_TotalSale cte1
ON c.CustomerID = cte1.CustomerID
LEFT JOIN CTE_LastOrder cte2
ON c.CustomerID = cte2.CustomerID
LEFT JOIN CTE_Rank cte3
ON c.CustomerID = cte3.CustomerID
LEFT JOIN CTE_CustomerSegmentation cte4
ON c.CustomerID = cte4.CustomerID
ORDER BY CustomerID