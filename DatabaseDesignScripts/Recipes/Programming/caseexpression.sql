SELECT DepartmentID AS DeptID, Name, GroupName,
    CASE GroupName
      WHEN 'Research and Development' THEN 'Room A'
      WHEN 'Sales and Marketing' THEN 'Room B'
      WHEN 'Manufacturing' THEN 'Room C'
    ELSE 'Room D'
    END AS ConfRoom 
FROM HumanResources.Department
