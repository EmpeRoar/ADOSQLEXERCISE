SELECT table_schema + '.' + TABLE_NAME as TABLE_NAME, COLUMN_NAME, 
	--types that have a character or binary lenght 
	case when DATA_TYPE IN ('varchar','char','nvarchar','nchar','varbinary')  
		then DATA_TYPE + case when character_maximum_length = -1 then '(max)'   
			else '(' + CAST(character_maximum_length as varchar(4)) + ')' end  
			--types with a datetime precision  
			when DATA_TYPE IN ('time','datetime2','datetimeoffset')     
				then DATA_TYPE + '(' + CAST(DATETIME_PRECISION as varchar(4)) + ')'  
			--types with a precision/scale  
			when DATA_TYPE IN ('numeric','decimal')     
				then DATA_TYPE + '(' + CAST(NUMERIC_PRECISION as varchar(4)) + ',' +
							CAST(NUMERIC_SCALE as varchar(4)) + ')'  
			--timestamp should be reported as rowversion  
			when DATA_TYPE = 'timestamp' then 'rowversion'  
			--and the rest. Note, ﬂoat is declared with a bit length, but is  
			--represented as either ﬂoat or real in types  
			else DATA_TYPE end as DECLARED_DATA_TYPE, 
		COLUMN_DEFAULT 
FROM INFORMATION_SCHEMA.COLUMNS 
ORDER BY TABLE_SCHEMA, TABLE_NAME,ORDINAL_POSITION
