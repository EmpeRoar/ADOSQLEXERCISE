
CREATE OR ALTER PROC dbo.GetSequenceValue
    @seqname AS VARCHAR(128),
    @val     AS INT OUTPUT
AS 
SET XACT_ABORT, NOCOUNT ON;

UPDATE dbo.MySequences
    SET @val = val += 1
WHERE seqname = @seqname;

IF @@ROWCOUNT = 0
    THROW 51001, 'Specified sequence was not found.', 1;