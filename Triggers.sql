SELECT OBJECT_SCHEMA_NAME(parent_id) + '.' + OBJECT_NAME(parent_id) AS TABLE_NAME, 
	name AS TRIGGER_NAME, 
	CASE WHEN is_instead_of_trigger = 1 THEN 'INSTEAD OF' ELSE 'AFTER' End  
	AS TRIGGER_FIRE_TYPE 
FROM sys.triggers 
WHERE type_desc = 'SQL_TRIGGER' --not a clr trigger 
	AND parent_class = 1 --DML Triggers 
ORDER BY TABLE_NAME, TRIGGER_NAME
