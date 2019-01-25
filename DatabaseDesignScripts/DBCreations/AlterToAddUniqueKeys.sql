ALTER TABLE Messages.Message  
	ADD CONSTRAINT AK_Messages_Message_TimeUserAndText UNIQUE  
	(RoundedMessageTime, MessagingUserId, Text);

ALTER TABLE Messages.Topic  
	ADD CONSTRAINT AK_Messages_Topic_Name UNIQUE 
	(Name);

ALTER TABLE Messages.MessageTopic  
	ADD CONSTRAINT AK_Messages_MessageTopic_TopicAndMessage UNIQUE  
	(MessageId, TopicId, UserDeﬁnedTopicName);

ALTER TABLE Attendees.MessagingUser  
	ADD CONSTRAINT AK_Attendees_MessagingUser_UserHandle UNIQUE 
	(UserHandle);

ALTER TABLE Attendees.MessagingUser  
	ADD CONSTRAINT AK_Attendees_MessagingUser_AttendeeNumber UNIQUE  
	(AttendeeNumber);

ALTER TABLE Attendees.UserConnection  
	ADD CONSTRAINT AK_Attendees_UserConnection_Users UNIQUE  
	(MessagingUserId, ConnectedToMessagingUserId);





