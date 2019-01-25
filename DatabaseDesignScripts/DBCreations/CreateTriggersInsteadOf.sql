CREATE TRIGGER MessageTopic$InsteadOfInsertTrigger 
ON Messages.MessageTopic 
INSTEAD OF INSERT AS 
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
		--<perform action>

		INSERT INTO Messages.MessageTopic (MessageId, UserDeﬁnedTopicName, TopicId,RowCreateTime,RowLastUpdateTime) 
		SELECT MessageId, UserDeﬁnedTopicName, TopicId, SYSDATETIME(), SYSDATETIME() 
		FROM inserted ; 

	END TRY 

	BEGIN CATCH 
		
		IF @@trancount > 0 
			ROLLBACK TRANSACTION; 
		THROW; --will halt the batch or be caught by the caller's catch block

	END CATCH 

END 
GO


----------------------------------------------------------------------------------------------------------------------------


CREATE TRIGGER Messages.MessageTopic$InsteadOfUpdateTrigger 
ON Messages.MessageTopic 
INSTEAD OF UPDATE AS 
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
		--<perform action> 
		UPDATE MessageTopic SET MessageId = Inserted.MessageId,  
			UserDeﬁnedTopicName = Inserted.UserDeﬁnedTopicName,  TopicId = Inserted.TopicId,  
			RowCreateTime = MessageTopic.RowCreateTime, --no changes allowed  
			RowLastUpdateTime = SYSDATETIME() 
		FROM inserted  
			JOIN Messages.MessageTopic  
			ON inserted.MessageTopicId = MessageTopic.MessageTopicId; 
	END TRY
	BEGIN CATCH  
		IF @@trancount > 0    
			ROLLBACK TRANSACTION;  
		THROW; --will halt the batch or be caught by the caller's catch block 
	END CATCH 
END 
GO