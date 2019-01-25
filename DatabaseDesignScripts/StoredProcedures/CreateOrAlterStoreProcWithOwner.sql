CREATE OR ALTER PROC dbo.GetOrders
   @orderid    AS  INT   =  NULL,
   @orderdate  AS  DATE  =  NULL,
   @custid     AS  INT   =  NULL,
   @empid      AS  INT   =  NULL 
WITH EXECUTE AS OWNER
AS

SET  XACT_ABORT, NOCOUNT ON;

DECLARE @sql AS NVARCHAR(MAX) = N'SELECT orderid, orderdate, shippeddate, custid, empid, shipperid
FROM Sales.Orders
WHERE 1 = 1'
   + CASE WHEN @orderid    IS NOT NULL THEN N' AND orderid    = @orderid  ' ELSE N'' END
   + CASE WHEN @orderdate  IS NOT NULL THEN N' AND orderdate  = @orderdate' ELSE N'' END
   + CASE WHEN @custid     IS NOT NULL THEN N' AND custid     = @custid   ' ELSE N'' END
   + CASE WHEN @empid      IS NOT NULL THEN N' AND empid      = @empid    ' ELSE N'' END
   + N';'

EXEC sys.sp_executesql
    @stms      = @sql,
    @params    = N'@roderid AS INT, @orderdate AS DATE, @custid AS INT, @empid AS INT',
    @orderid   = @orderid,
    @orderdate = @orderdate,
    @custid    = @custid,
    @empid     = @empid;
GO
