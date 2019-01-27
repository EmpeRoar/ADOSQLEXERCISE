WITH TotalSalesBySalesDate 
(
    DailySales,
    OrderDate 
)
AS
(
    SELECT
        SUM(soh.SubTotal)	AS	DailySales,
        	soh.OrderDate
    FROM Sales.SalesOrderHeader	soh
    WHERE soh.OrderDate	>= '20120101'
        AND	soh.OrderDate <	'20130101'
    GROUP BY soh.OrderDate 
)
SELECT
    RANK()	OVER
    (
        ORDER BY
        DailySales DESC
    ) AS	Ranking,
    DailySales,
    OrderDate 
FROM TotalSalesBySalesDate 
ORDER BY Ranking;
