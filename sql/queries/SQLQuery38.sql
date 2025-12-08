-- FIND THE DEVIATION OF EACH SALES FROM THE MIN AND MAX SALES AMOUNTS

SELECT
OrderID,
Sales,
MIN(Sales) OVER() AS MinSales,
MAX(Sales) OVER() AS MaxSales,
Sales - MIN(Sales) OVER() AS DeviationByMin,
MAX(Sales) OVER() - Sales AS DeviationBYMax
FROM Sales.Orders