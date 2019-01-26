DROP TABLE IF EXISTS dbo.Transactions;
GO
CREATE TABLE dbo.Transactions
(
    txid INT NOT NULL CONSTRAINT PK_Transactions PRIMARY KEY,
    qty  INT NOT NULL,
    depletionqty INT NULL 
);
GO

TRUNCATE TABLE dbo.Transactions;
INSERT INTO db.Transactions(txid, qty)
 VALUES
 (1,2),
 (2,5),
 (3,4),
 (4,1);

 ---------------------------------------------------

DROP TABLE IF EXISTS Transactions;
GO
CREATE TABLE Transactions
(
    txid INT NOT NULL CONSTRAINT PK_Transactions PRIMARY KEY,
    qty  INT NOT NULL,
    depletionqty INT NULL 
);
GO

TRUNCATE TABLE Transactions;
INSERT INTO Transactions(txid, qty)
 VALUES(1,2),(2,5),(3,4),(4,1);