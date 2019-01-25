CREATE SEQUENCE Messages.TopicIdGenerator 
AS INT MINVALUE 10000 --starting value 
NO MAXVALUE --technically will max out at max int 
START WITH 10000 --value where the sequence will start, differs from min based on   
				 --cycle property 
INCREMENT BY 1 --number that is added the previous value 
NO CYCLE --if setting is cycle, when it reaches max value it starts over

CACHE 100; --Use adjust number of values that SQL Server caches. Cached values would    
		   --be lost if the server is restarted, but keeping them in RAM makes access faster;

SELECT NEXT VALUE FOR Messages.TopicIdGenerator AS TopicId 
UNION ALL 
SELECT NEXT VALUE FOR Messages.TopicIdGenerator AS TopicId;


--To start a certain number add WITH <starting value literal> 
ALTER SEQUENCE Messages.TopicIdGenerator RESTART;


TopicId int NOT NULL CONSTRAINT DFLTMessage_Topic_TopicId  
DEFAULT(NEXT VALUE FOR Messages.TopicIdGenerator),

