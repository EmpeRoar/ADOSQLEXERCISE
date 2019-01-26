DROP USER IF EXISTS user1;
GO
DROP LOGIN login1;
GO 
DROP PROC IF EXISTS dbo.GetOrders, dbo.GetSequenceValue, dbo.ComputeDepletionQuantities;
DROP TABLE IF EXISTS dbo.MySequences, dbo.Transactions;