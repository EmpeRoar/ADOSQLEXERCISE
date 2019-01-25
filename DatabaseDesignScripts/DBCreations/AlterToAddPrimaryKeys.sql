ALTER TABLE Attendees.AttendeeType 
	ADD CONSTRAINT PK_Attendees_AttendeeType PRIMARY KEY CLUSTERED (AttendeeType);

ALTER TABLE Attendees.MessagingUser 
	ADD CONSTRAINT PK_Attendees_MessagingUser PRIMARY KEY CLUSTERED (MessagingUserId);

ALTER TABLE Attendees.UserConnection 
	ADD CONSTRAINT PK_Attendees_UserConnection PRIMARY KEY CLUSTERED (UserConnectionId);

ALTER TABLE Messages.Message 
	ADD CONSTRAINT PK_Messages_Message PRIMARY KEY CLUSTERED (MessageId);

ALTER TABLE Messages.MessageTopic 
	ADD CONSTRAINT PK_Messages_MessageTopic PRIMARY KEY CLUSTERED (MessageTopicId);

ALTER TABLE Messages.Topic 
	ADD CONSTRAINT PK_Messages_Topic PRIMARY KEY CLUSTERED (TopicId);




