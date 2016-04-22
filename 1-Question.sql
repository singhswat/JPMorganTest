--Question 1 : What's wrong with the below query.
SELECT DISTINCT
       a.EmpName , c.DeptName , b.Salary
FROM Emps AS a , Pay AS b , Depts AS c
WHERE a.empID = b.empID
      AND
      c.DeptName LIKE 'JPM%';

--Test Data
SELECT TOP 1000 [EmpID]
      ,[EmpName]
      ,[DeptId]
      ,[Salary]
  FROM [dbo].[Emps]

  SELECT TOP 1000 [EmpID] AS PayEmpId
      ,[EmpName] AS	PayEmpName
      ,[DeptId] AS PayDeptId
      ,[Salary] AS PaySalary
  FROM [dbo].[Pay]

  SELECT TOP 1000 [DeptId]
      ,[DeptName]
  FROM [dbo].[Depts]

--For desired O/P
SELECT
	   a.EmpName , c.DeptName , b.salary
FROM Emps AS a LEFT JOIN Pay AS b ON a.empID = b.empID
               LEFT JOIN Depts AS c ON a.DeptId = c.DeptId
                                       AND
                                       c.DeptName LIKE 'JPM%';