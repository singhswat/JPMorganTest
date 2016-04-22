-- Question 2: To get sum of all ages for each Id and Name.

--Intial Script
SELECT 
	  EmployeeDetailId AS ID,
	  Name,
	  SUM(Age) AS Age
From [dbo].EmployeeDetails
Group By EmployeeDetailId

--Error Message
-- o/p: Column 'dbo.EmployeeDetails.Name' is invalid in the select list because it is not contained in either 
--      an aggregate function or the GROUP BY clause.

-- Altered Script
SELECT 
	  EmployeeDetailId AS ID,
	  Name,
	  SUM(Age) AS Age
From [dbo].EmployeeDetails
Group By EmployeeDetailId, Name