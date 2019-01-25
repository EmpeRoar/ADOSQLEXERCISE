-- 1. Primary Keys
-- [CONSTRAINT constraintname] PRIMARY KEY [CLUSTERED | NONCLUSTERED]

-- 2. Unique Keys
-- [CONSTRAINT constraintname] UNIQUE [CLUSTERED | NONCLUSTERED] [(ColumnList)]

-- 3. Default Constrains
-- [CONSTRAINT constraintname] DEFAULT (<simple scalar expression>)

-- 4. Adding Foreign Keys
-- [CONSTRAINT <constraintName>] FOREIGN KEY REFERENCES <referenceTable> (<referenceColumns>) 
-- [ON DELETE <NO ACTION | CASCADE | SET NULL | SET DEFAULT> ] [ON UPDATE <NO ACTION | CASCADE | SET NULL | SET DEFAULT> ]

-- 5. Check Constrain
-- ALTER TABLE <tableName> [WITH CHECK | WITH NOCHECK]  
-- ADD [CONSTRAINT <constraintName>]  CHECK <BooleanExpression>
