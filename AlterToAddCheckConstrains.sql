ALTER TABLE Messages.Topic 
	ADD CONSTRAINT CHK__Messages_Topic_Name_NotEmpty 
	CHECK (LEN(RTRIM(Name)) > 0);

ALTER TABLE Messages.MessageTopic 
	ADD CONSTRAINT CHK__Messages_MessageTopic_UserDeﬁnedTopicName_NotEmpty 
	CHECK (LEN(RTRIM(UserDeﬁnedTopicName)) > 0);

ALTER TABLE Attendees.MessagingUser  
	ADD CONSTRAINT CHK__Attendees_MessagingUser_UserHandle_LenthAndStart   
	CHECK (LEN(Rtrim(UserHandle)) >= 5 
		AND LTRIM(UserHandle) LIKE '[a-z]' +  REPLICATE('[a-z1-9]',LEN(RTRIM(UserHandle)) -1));

-- for testing ---
INSERT INTO Messages.Topic(TopicId, Name, Description) VALUES (0,'User Deﬁned','User Enters Their Own User Deﬁned Topic');

ALTER TABLE Messages.MessageTopic  
	ADD CONSTRAINT CHK__Messages_MessageTopic_UserDeﬁnedTopicName_NullUnlessUserDeﬁned  
	CHECK ((UserDeﬁnedTopicName IS NULL AND TopicId <> 0)   
		OR (TopicId = 0 AND UserDeﬁnedTopicName IS NOT NULL));


