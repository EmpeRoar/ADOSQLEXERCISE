CREATE TABLE Attendees.AttendeeType (  
	AttendeeType varchar(20) NOT NULL ,  
	Description varchar(60) NOT NULL 
);

--As this is a non-editable table, we load the data here to 
--start with 
INSERT INTO Attendees.AttendeeType 
VALUES ('Regular', 'Typical conference attendee'),
	   ('Speaker', 'Person scheduled to speak'), 
	   ('Administrator','Manages System');

CREATE TABLE Attendees.MessagingUser (  
	MessagingUserId int NOT NULL IDENTITY ( 1,1 ),
	UserHandle varchar(20) NOT NULL,
	AccessKeyValue char(10) NOT NULL,
	AttendeeNumber char(8) NOT NULL,
	FirstName varchar(50) NULL,
	LastName varchar(50) NULL,
	AttendeeType varchar(20) NOT NULL,
	DisabledFlag bit NOT NULL,
	RowCreateTime datetime2(0) NOT NULL,
	RowLastUpdateTime datetime2(0) NOT NULL
); 

CREATE TABLE Attendees.UserConnection (
	UserConnectionId   int NOT NULL IDENTITY ( 1,1 ),
	ConnectedToMessagingUserId int NOT NULL,
	MessagingUserId   int NOT NULL,
	RowCreateTime    datetime2(0) NOT NULL,
	RowLastUpdateTime  datetime2(0) NOT NULL
);

CREATE TABLE Messages.Message (
	MessageId int NOT NULL IDENTITY ( 1,1 ) ,  
	RoundedMessageTime as (dateadd(hour,datepart(hour,MessageTime),    
		CAST(CAST(MessageTime as date)as datetime2(0)) ))    
		PERSISTED,  
	SentToMessagingUserId int NULL ,  
	MessagingUserId    int NOT NULL ,  
	Text nvarchar(200) NOT NULL ,  
	MessageTime datetime2(0) NOT NULL ,  
	RowCreateTime datetime2(0) NOT NULL ,  
	RowLastUpdateTime datetime2(0) NOT NULL 
);

CREATE TABLE Messages.MessageTopic ( 
	MessageTopicId int NOT NULL IDENTITY ( 1,1 ) ,  
	MessageId int NOT NULL ,  
	UserDeﬁnedTopicName nvarchar(30) NULL ,  
	TopicId int NOT NULL ,  
	RowCreateTime datetime2(0) NOT NULL ,  
	RowLastUpdateTime datetime2(0) NOT NULL 
);

CREATE TABLE Messages.Topic ( 
	TopicId int NOT NULL CONSTRAINT DFLTMessage_Topic_TopicId
		DEFAULT(NEXT VALUE FOR Messages.TopicIdGenerator),
	Name nvarchar(30) NOT NULL ,  
	Description varchar(60) NOT NULL ,  
	RowCreateTime datetime2(0) NOT NULL ,  
	RowLastUpdateTime datetime2(0) NOT NULL 
);

