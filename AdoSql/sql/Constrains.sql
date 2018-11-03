ALTER TABLE dbo.Person
	ADD CONSTRAINT CHK__Person_Name_GreaterNotFour 
	CHECK (LEN(RTRIM(FirstName)) > 4);
