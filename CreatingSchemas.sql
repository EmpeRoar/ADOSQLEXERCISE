-- creating schemas
CREATE SCHEMA Messages; --tables pertaining to the messages being sent 
GO 
CREATE SCHEMA Attendees; --tables pertaining to the attendees and how they can send messages 
GO

-- viewing schemas
SELECT 
name, 
USER_NAME(principal_id) as principal 
FROM  sys.schemas 
WHERE name <> USER_NAME(principal_id); --don't list user schemas


-- alter authorization of schema
ALTER AUTHORIZATION ON SCHEMA::Messages To DBO;

/*
CREATE USER <schemaUser>
FOR LOGIN <schemaUser>
WITH DEFAULT SCHEMA = schemaname;
*/




