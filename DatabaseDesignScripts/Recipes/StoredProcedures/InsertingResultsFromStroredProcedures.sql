CREATE PROCEDURE dbo.usp_SEL_Production_TransactionHistory
    @ModiﬁedStartDT DATETIME,
    @ModiﬁedEndDT DATETIME 
AS    
    SELECT  TransactionID,
            ProductID,
            ReferenceOrderID,
            ReferenceOrderLineID,
            TransactionDate,
            TransactionType,
            Quantity,
            ActualCost,
            ModiﬁedDate
    FROM    Production.TransactionHistory
    WHERE   ModiﬁedDate BETWEEN @ModiﬁedStartDT
            AND   @ModiﬁedEndDT
            AND TransactionID NOT IN (
                    SELECT TransactionID
                    FROM   Production.TransactionHistoryArchive) ; 
GO 