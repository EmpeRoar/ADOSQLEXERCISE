
/* 1.

CREATE TABLE [<database>.][<schema>.]<tablename> ( <column speciﬁcation> );

*/

/* 2
CREATE TABLE [<database>.][<schema>.]<tablename>  
( 
  <columnName> <datatype> [<NULL speciﬁcation>] [IDENTITY [(seed,increment)]    
  --or    
  <columnName> AS <computed deﬁnition>  
);
*/

/*

MessageId int NOT NULL IDENTITY(1,1), 
SentToMessagingUserId int NULL , 
MessagingUserId int NOT NULL , 
Text nvarchar(200) NOT NULL , 
MessageTime datetime2(0) NOT NULL , 
RowCreateTime datetime2(0) NOT NULL , 
RowLastUpdateTime datetime2(0) NOT NULL

*/
-- insert own value in Identity SET IDENTITY_INSERT <tablename>ON