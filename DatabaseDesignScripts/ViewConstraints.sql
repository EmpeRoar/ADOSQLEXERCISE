SELECT OBJECT_SCHEMA_NAME(object_id) + '.'  
	+ OBJECT_NAME(object_id) as object_name,  
	Name,is_primary_key, is_unique_constraint 
FROM sys.indexes 
WHERE OBJECT_SCHEMA_NAME(object_id) <> 'sys'  
	AND is_primary_key = 1 OR is_unique_constraint = 1 
ORDER BY object_name;
