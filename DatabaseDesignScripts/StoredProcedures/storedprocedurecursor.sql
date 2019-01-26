CREATE OR ALTER PROC dbo.ComputeDepletionQuantities
    @maxallowedqty AS INT
AS

SET XACT_ABORT, NOCOUNT ON;

Update dbo.Transactions
 SET depletionqty = NULL
WHERE depletionqty IS NOT NULL;

DECLARE @qty AS INT, 
        @sumqty AS INT = 0;

DECLARE C CURSOR FOR
  SELECT qty
  FROM dbo.Transactions
  ORDER BY txid;

OPEN C;

FETCH NEXT FROM C INTO @qty;

WHILE @@FETCH_STATUS = 0
BEGIN
   SET @sumqty += @qty;

   IF @sumqty > @maxallowedqty
   BEGIN  
      UPDATE dbo.Transactions
        SET depletionqty = @sumqty
      WHERE CURRENT OF C;

      SET @sumqty = 0;
   END;

   FETCH NEXT FROM C INTO @qty;
END   

CLOSE C;

DEALLOCATE C;

SELECT txid, qty, depletionqty,
 SUM(qt - ISNULL(depletionqty, 0))
   OVER(ORDER BY txid ROWS UNBOUNDED PRECEDING) AS totalqty
FROM dbo.Transactions
ORDER BY txid;
GO