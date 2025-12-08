-- FIND THE PRODUCTS THAT FALL WITHIN THE HIGHEST 40% OF PRICES

SELECT
*,
CONCAT(DistRank*100, '%') AS PercentageOfPrice
FROM
(
	SELECT
	*,
	PERCENT_RANK() OVER(ORDER BY Price) AS DistRank
	FROM Sales.Products
) t
WHERE DistRank <= 0.4

-- OR 

SELECT
*,
CONCAT(DistRank*100, '%') AS PercentageOfPrice
FROM
(
	SELECT
	*,
	CUME_DIST() OVER(ORDER BY Price) AS DistRank
	FROM Sales.Products
) t
WHERE DistRank <= 0.4