CREATE OR ALTER PROC dbo.GetOrders
(
    @orderid   AS INT  = NULL,
    @orderdate AS DATE = NULL,
    @custid    AS INT  = NULL,
    @empid     AS INT  = NULL
)
AS 
SET XACT_ABORT, NOCOUNT ON;

SELECT orderid, orderdate, shippeddate, custid, empid, shipperid
FROM Sales.Orders
WHERE (orderid  = @orderid     OR @orderid    IS  NULL)
 AND (orderdate = @orderdate   OR @orderdate  IS  NULL)
 AND (custid    = @custid      OR @custid     IS  NULL)
 AND (empid     = @empid       OR @empid      IS  NULL);

 GO