ALTER TABLE Attendees.MessagingUser  
	ADD CONSTRAINT DFAttendees_MessagingUser_DisabledFlag  
	DEFAULT (0) FOR DisabledFlag;	