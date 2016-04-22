--
--Question 3: Why no rows are returned 
--

 SELECT [empID]
      ,[EmpName]
      ,[deptID]
      ,[salary]
  FROM 
		[dbo].[Emps]
  WHERE [empID] 
		NOT IN (
				  SELECT 
						[EmployeeDetailId]      
				  FROM 
						[dbo].[EmployeeDetails]	 			 
			   )

-- IN predicate can return TRUE | FALSE | NULL. 
-- Atleast one value must be NULL in the sub query set. Since this is a set based operation 
-- and NULL is a UNKNOWN set, so the predicate clause 'Not In' will evaluate this set operation 
-- to UNKNOWN i.e. NULL and hence filter out all the values, so no result.

