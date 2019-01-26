DECLARE @pagesize AS BIGINT = 25,
        @pagenum  AS BIGINT = 3;

SELECT orderid, orderdate, custid, empid
FROM Sales.Orders
ORDER BY orderdate DESC, orderid DESC
OFFSET ((@pagenum-1) * @pagesize) ROWS
FETCH NEXT @pagesize ROWS ONLY 

-----------------------------------------

--CREATING A PAGING WITH OFFSET and FETCH clauses IN "SQL SERVER 2012"
DECLARE @PageNumber AS INT, 
        @RowspPage AS INT
SET @PageNumber = 2
SET @RowspPage = 10 
SELECT ID_EXAMPLE, NM_EXAMPLE, DT_CREATE
FROM TB_EXAMPLE
ORDER BY ID_EXAMPLE
OFFSET ((@PageNumber - 1) * @RowspPage) ROWS
FETCH NEXT @RowspPage ROWS ONLY;
