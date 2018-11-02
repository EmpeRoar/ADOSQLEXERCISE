CREATE DATABASE ConferenceMessaging ON PRIMARY 
( NAME = N'ConferenceMessaging', 
  FILENAME =    N'C:\DELETABLE\DB\DATA\ConferenceMessaging.mdf' ,  
  SIZE = 1024MB , 
  MAXSIZE = 1024MB) 
  LOG ON ( NAME = N'ConferenceMessaging_log', 
           FILENAME =    N'C:\DELETABLE\DB\LOG\ConferenceMessaging_log.ldf' ,  
		   SIZE = 100MB, 
		   MAXSIZE = 2048GB , 
		   FILEGROWTH = 100MB);

-- or --

CREATE DATABASE DatabaseNameHere

-- to see where the database was placed --
SELECT type_desc, 
       size*8/1024 as [size (MB)],
       physical_name FROM sys.master_ﬁles 
WHERE database_id = db_id('dbNameHere');


--determine the login that is linked to the dbo user in the database 
SELECT suser_sname(sid) as databaseOwner 
FROM  sys.database_principals 
WHERE  name = 'dbo';


--Get the login of owner of the database from all database 
SELECT 
SUSER_SNAME(owner_sid) AS databaseOwner, 
name 
FROM  sys.databases;


ALTER AUTHORIZATION ON Database::ConferenceMessaging TO SA;


-- CREATE TABLE [<database>.][<schema>.]<tablename> ( <column speciﬁcation> );

-- # temporary table
-- ## global temporary table
-- @ variables

-- combination of schema and table must be unique in a database

-- Changing owners of the schema changes owners of the table. 
-- (This is done using the ALTER AUTHORIZATION statement.) 

/*
MessageId int, 
SentToMessagingUserId int, 
MessagingUserId int, 
Text nvarchar(200), 
MessageTime datetime2(0), 
RowCreateTime datetime2(0), 
RowLastUpdateTime datetime2(0)
*/


declare @time datetime2(0) 
set @time = SYSDATETIME()

-- dateadd(hour,datepart(hour,@time),cast(cast(@time as date) as datetime2(0)))

-- RowCreateTime as dateadd(hour,datepart(hour,MessageTime), cast(cast(MessageTime as date) as datetime2(0))) PERSISTED





