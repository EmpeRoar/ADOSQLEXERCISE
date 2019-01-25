ALTER TABLE Attendees.MessagingUser  
	ADD CONSTRAINT    
	FK__Attendees_MessagingUser$IsSent$Messages_Message    
		FOREIGN KEY (AttendeeType) REFERENCES Attendees.AttendeeType(AttendeeType)    
		ON UPDATE CASCADE    
		ON DELETE NO ACTION;

ALTER TABLE Attendees.UserConnection  
	ADD CONSTRAINT    
	FK__Attendees_MessagingUser$ConnectsToUserVia$Attendees_UserConnection  
		FOREIGN KEY (MessagingUserId) REFERENCES Attendees.MessagingUser(MessagingUserId)  
		ON UPDATE NO ACTION  
		ON DELETE CASCADE;

ALTER TABLE Attendees.UserConnection  
	ADD CONSTRAINT    
	FK__Attendees_MessagingUser$IsConnectedToUserVia$Attendees_UserConnection  
		FOREIGN KEY (ConnectedToMessagingUserId) REFERENCES Attendees.MessagingUser(MessagingUserId)  
		ON UPDATE NO ACTION  
		ON DELETE CASCADE;

-------------------- fix cycle ------------------------------------

ALTER TABLE Attendees.UserConnection  
	DROP CONSTRAINT    
	FK__Attendees_MessagingUser$ConnectsToUserVia$Attendees_UserConnection 
GO

ALTER TABLE Attendees.UserConnection  
	ADD CONSTRAINT 
	FK__Attendees_MessagingUser$ConnectsToUserVia$Attendees_UserConnection  
		FOREIGN KEY (MessagingUserId) REFERENCES Attendees.MessagingUser(MessagingUserId)  
		ON UPDATE NO ACTION  
		ON DELETE NO ACTION;

ALTER TABLE Attendees.UserConnection  
	ADD CONSTRAINT    
	FK__Attendees_MessagingUser$IsConnectedToUserVia$Attendees_UserConnection  
		FOREIGN KEY (ConnectedToMessagingUserId) REFERENCES Attendees.MessagingUser(MessagingUserId)  
		ON UPDATE NO ACTION  
		ON DELETE NO ACTION; 
Go

-------------------------------------------------------------------------

ALTER TABLE Messages.Message  
	ADD CONSTRAINT 
	FK__Messages_MessagingUser$Sends$Messages_Message   
		FOREIGN KEY (MessagingUserId) REFERENCES Attendees.MessagingUser(MessagingUserId)  
		ON UPDATE NO ACTION  
		ON DELETE NO ACTION;

ALTER TABLE Messages.Message  
	ADD CONSTRAINT 
	FK__Messages_MessagingUser$IsSent$Messages   
		FOREIGN KEY (SentToMessagingUserId) REFERENCES Attendees.MessagingUser(MessagingUserId)  
		ON UPDATE NO ACTION  
		ON DELETE NO ACTION;

ALTER TABLE Messages.MessageTopic  
	ADD CONSTRAINT 
	FK__Messages_Topic$CategorizesMessagesVia$Messages_MessageTopic   
		FOREIGN KEY (TopicId) REFERENCES Messages.Topic(TopicId)  
		ON UPDATE NO ACTION  
		ON DELETE NO ACTION;

ALTER TABLE Messages.MessageTopic  
	ADD CONSTRAINT 
	FK_Message$iscCategorizedVia$MessageTopic   
		FOREIGN KEY (MessageId) REFERENCES Messages.Message(MessageId)
		ON UPDATE NO ACTION  
		ON DELETE NO ACTION;





