Select Name, Salary, Gender,
COUNT(Gender) Over (Partition By Gender) AS GendersTotal,
AVG(Salary) Over (Partition By Gender) AS AvgSal,
MIN(Salary) Over (Partition By Gender) AS MinSal,
MAX(Salary) Over (Partition By Gender) AS MaxSal
From Employees

-----------------------------------------------------------

Select Name, Salary, Employees.Gender, 
       Genders.GenderTotal, 
       Genders.AvgSal,
       Genders.MinSal,
       Genders.MaxSal
From Employees
INNER JOIN
  (
    SELECT Gender, 
          COUNT(*) AS GenderTotal, 
          AVG(Salary) AS AvgSal,
          MIN(Salary) AS MinSal,
          MAX(Salary) AS MaxSal
    FROM Employees
    GROUP BY Gender
  ) AS Genders
ON Genders.Gender = Employees.Gender