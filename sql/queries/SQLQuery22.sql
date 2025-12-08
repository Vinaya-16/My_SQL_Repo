-- FIND THE AVERAGE OF SCORES

-- BEFORE NULL HANDLING
SELECT
CustomerID,
Score,
AVG(Score) OVER () AvgScore
FROM Sales.Customers


-- AFTER NULL HANDLING
SELECT
CustomerID,
Score,
AVG(COALESCE(Score, 0)) OVER() AvgScore
FROM Sales.Customers