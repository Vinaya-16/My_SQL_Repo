-- SHOW CREATION TIME USING THE FORMAT:
--- DAY WED JAN Q1 2025 12:34:56 PM

SELECT
 CreationTime,
'Day ' + FORMAT(CreationTime, 'ddd') + ' ' +
FORMAT(CreationTime, 'MMM') + ' ' +
'Q' + FORMAT(CreationTime, 'MM') + ' ' +
FORMAT(CreationTime, 'yyyy') + ' ' +
FORMAT(CreationTime, 'hh:mm:ss tt') + ' ' 
AS CreationTime
FROM Sales.Orders