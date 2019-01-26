DROP TABLE IF EXISTS dbo.MySequences;
GO
CREATE TABLE dbo.MySequences
(
    seqname VARCHAR(128) NOT NULL
        CONSTRAINT PK_MySequences PRIMARY KEY,
    val INT NOT NULL
        CONSTRAINT DFT_MySequences_val DEFAULT(0)
);
----------------------------------------------------
INSERT INTO dbo.MySequences(seqname, val) VALUES('SEQINVOICES', 0);
------------------------------------------------------

 