CREATE TRIGGER [dbo].[DbEvent$UpdateRowControlsTrigger] 
ON [dbo].[Person]
AFTER UPDATE AS 
BEGIN
	SET NOCOUNT ON; 
	SET ROWCOUNT 0; 
	BEGIN TRY   
		insert into dbo.DbEvent2 (EventDesc, 
								  RowCreated) 
		values('Updated by:' + ORIGINAL_LOGIN(), 
				GETDATE());
	END TRY 
	BEGIN CATCH   
		IF @@trancount > 0
			ROLLBACK TRANSACTION;
		THROW 
	END CATCH 
END
