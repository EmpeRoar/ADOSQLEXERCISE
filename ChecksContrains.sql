﻿SELECT TABLE_SCHEMA + '.' + TABLE_NAME AS TABLE_NAME,    
		TABLE_CONSTRAINTS.CONSTRAINT_NAME, CHECK_CLAUSE 
FROM  INFORMATION_SCHEMA.TABLE_CONSTRAINTS      
		JOIN INFORMATION_SCHEMA.CHECK_CONSTRAINTS        
			ON TABLE_CONSTRAINTS.CONSTRAINT_SCHEMA = 
					CHECK_CONSTRAINTS.CONSTRAINT_SCHEMA          
						AND TABLE_CONSTRAINTS.CONSTRAINT_NAME = CHECK_CONSTRAINTS.CONSTRAINT_NAME