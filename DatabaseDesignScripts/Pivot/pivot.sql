WITH PivotData AS
(
    SELECT 
       custid,
       shipperid,
       freight
    FROM Sales.Order   
)
SELECT custid,
  ISNULL([1], 0.00) AS [1],
  ISNULL([2], 0.00) AS [2],
  ISNULL([3], 0.00) AS [3]
FROM PivotData
   PIVOT(SUM(freight) FOR shipperid IN ([1],[2],[3]) ) AS P;  