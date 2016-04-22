-- Unique Names 1st Tick- Use distinct keyword
SELECT DISTINCT
       Name
FROM [dbo].[EmployeeDetails];

-- Unique Names 2st tick -- Using Window Function
WITH Cte_UniqueList
     AS (SELECT ROW_NUMBER() OVER(PARTITION BY Name ORDER BY Name DESC) AS RowNo,
                Name
         FROM [dbo].[EmployeeDetails]
	    )
     
	SELECT Name
     FROM Cte_UniqueList
     WHERE RowNo = 1;

-- Unique Names 3st tick 
SELECT Name
FROM
(
    SELECT ROW_NUMBER() OVER(PARTITION BY Name ORDER BY Name DESC) AS RowNo,
           Name
    FROM [dbo].[EmployeeDetails]
) AS T
WHERE RowNo = 1;

-- Unique Names 4th tick -- GROUP BY
SELECT Name
FROM [dbo].[EmployeeDetails]
GROUP BY Name;
