SELECT Title, FirstName, LastName 
FROM Person.Person 
WHERE NOT (Title = 'Ms.' OR Title = 'Mrs.');
