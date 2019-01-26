SELECT ProductID, Name 
FROM Production.Product 
ORDER BY Name 
OFFSET 0 ROWS 
FETCH NEXT 10 ROWS ONLY;

------------------------------

DECLARE @PageNumber AS INT, 
        @RowspPage AS INT
SET @PageNumber = 2
SET @RowspPage = 10 
SELECT ID_EXAMPLE, NM_EXAMPLE, DT_CREATE
FROM TB_EXAMPLE
ORDER BY ID_EXAMPLE
OFFSET ((@PageNumber - 1) * @RowspPage) ROWS
FETCH NEXT @RowspPage ROWS ONLY;