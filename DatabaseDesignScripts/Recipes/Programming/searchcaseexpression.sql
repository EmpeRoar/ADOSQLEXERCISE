SELECT DepartmentID, Name,   
    CASE    
        WHEN Name = 'Research and Development' THEN 'Room A'
        WHEN (Name = 'Sales and Marketing' OR DepartmentID = 10) THEN 'Room B'
        WHEN Name LIKE 'T%'THEN 'Room C'   
    ELSE 'Room D' END AS ConferenceRoom 
FROM HumanResources.Department;
