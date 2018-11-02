CREATE TRIGGER MessageTopic$UpdateRowControlsTrigger 
ON Messages.MessageTopic 
AFTER UPDATE AS 
BEGIN
	 DECLARE @msg varchar(2000), --used to hold the error message 
	 --use inserted for insert or update trigger, deleted for update or delete trigger 
	 --count instead of @@rowcount due to merge behavior that sets @@rowcount to a number 
	 --that is equal to number of merged rows, not rows being checked in trigger
	@rowsAffected int = (SELECT COUNT(*) FROM inserted) 
	--@rowsAffected = (SELECT COUNT(*) FROM deleted) 
	--no need to continue on if no rows affected 
	IF @rowsAffected = 0 RETURN;
	SET NOCOUNT ON; --to avoid the rowcount messages 
	SET ROWCOUNT 0; --in case the client has modiﬁed the rowcount

	BEGIN TRY   
		--[validation section]   
		--[modiﬁcation section] 
	UPDATE MessageTopic 
	SET RowCreateTime = SYSDATETIME(),     
		RowLastUpdateTime = SYSDATETIME() 
	FROM  inserted  
		JOIN Messages.MessageTopic  
		on inserted.MessageTopicId = MessageTopic.MessageTopicId; 
	END TRY 
	
	BEGIN CATCH   
		IF @@trancount > 0     
			ROLLBACK TRANSACTION;
		THROW --will halt the batch or be caught by the caller's catch block; 
   END CATCH 
 
END
 