CREATE LOGIN login1 WITH PASSWORD = 'J3$5#$)thb';
GO
CREATE USER user1 FOR LOGIN login1;
GO
--------------------------------------------------
GRANT EXEC ON dbo.GetOrders TO user1;
--------------------------------------------------
SELECT SUSER_NAME() AS [login], USER_NAME() AS [user];
-----------------------------------------------------
EXECUTE AS LOGIN = 'login1';
---------------------------------------------------
SELECT SUSER_NAME() AS [login], USER_NAME() AS [user]; --- run again
--------------------------------------------------------
EXEC dbo.GetOrders @orderdate = '20151111', @custid = 85;
------------------------------------------------------------
REVERT


