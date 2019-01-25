ALTER TABLE Attendees.MessagingUser   
	ADD CONSTRAINT DFLTAttendees_MessagingUser_RowCreateTime   
	DEFAULT (SYSDATETIME()) FOR RowCreateTime;

ALTER TABLE Attendees.MessagingUser   
	ADD CONSTRAINT DFLTAttendees_MessagingUser_RowLastUpdateTime   
	DEFAULT (SYSDATETIME()) FOR RowLastUpdateTime;

ALTER TABLE Attendees.UserConnection   
	ADD CONSTRAINT DFLTAttendees_UserConnection_RowCreateTime   
	DEFAULT (SYSDATETIME()) FOR RowCreateTime;

ALTER TABLE Attendees.UserConnection   
	ADD CONSTRAINT DFLTAttendees_UserConnection_RowLastUpdateTime   
	DEFAULT (SYSDATETIME()) FOR RowLastUpdateTime;

ALTER TABLE Messages.Message   
	ADD CONSTRAINT DFLTMessages_Message_RowCreateTime   
	DEFAULT (SYSDATETIME()) FOR RowCreateTime;

ALTER TABLE Messages.Message   
	ADD CONSTRAINT DFLTMessages_Message_RowLastUpdateTime   
	DEFAULT (SYSDATETIME()) FOR RowLastUpdateTime;

ALTER TABLE Messages.MessageTopic   
	ADD CONSTRAINT DFLTMessages_MessageTopic_RowCreateTime   
	DEFAULT (SYSDATETIME()) FOR RowCreateTime;

ALTER TABLE Messages.MessageTopic   
	ADD CONSTRAINT DFLTMessages_MessageTopic_RowLastUpdateTime   
	DEFAULT (SYSDATETIME()) FOR RowLastUpdateTime;

ALTER TABLE Messages.Topic   
	ADD CONSTRAINT DFLTMessages_Topic_RowCreateTime   
	DEFAULT (SYSDATETIME()) FOR RowCreateTime;

ALTER TABLE Messages.Topic   
	ADD CONSTRAINT DFLTMessages_Topic_RowLastUpdateTime   
	DEFAULT (SYSDATETIME()) FOR RowLastUpdateTime;