-- FIND THE TOTAL SALES FOR EACH PRODUCT,
-- ADDITIONALLY PROVIDE DETAILS SUCH ORDER ID AND ORDER DATE

SELECT 
OrderID, OrderDate,
SUM(Sales) OVER(Partition BY ProductID) AS TotalSalesBYProduct,
SUM(Sales) OVER(PARTITION BY ProductID, OrderStatus) AS TotalSalesByProductAndOrderStatus
FROM Sales.Orders