-- DISPLAY THE NAME OF THE CUSTOMER BY MERGING FIRST NAME AND LAST NAME 
-- ADD 10 BONUS POINTS TO EACH CUSTOMER'S SCORE

-- BEFORE
SELECT
CustomerID,
FirstName,
LastName,
FirstName + ' ' + LastName AS FullName,
Score+10 AS Bonus_Score
FROM Sales.Customers


-- AFTER
SELECT
CustomerID,
FirstName,
LastName,
FirstName + ' ' + COALESCE(LastName, ' ')  AS FullName,
COALESCE(Score, 0)+10 AS Bonus_Score
FROM Sales.Customers
