USE [JPMorgan]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[sp_DeleteRecords]
(
    @BatchSize INT,   
    @ChildTableName NVARCHAR(50),
    @CreatedDate DATE
)
AS
BEGIN

/******************************************************************************************
 Description:					Delete records from passing varaible
 Dependencies:					dbo.[Tables]: list of tables
							[dbo].[usp_DeleteRecords]: Loops through the table 
							and deletes the records.

 Sample Execution:				EXEC dbo.[sp_DeleteRecords]
								@BatchSize = 5000,
								@ChildTableName = 'EmployeeDetails',
								@CreatedDate = '20160101'
-- ***************************************************************************************
-- TicketNo		Created date		User		Comments
--				18-04-2016		Ssingh	Initial Creation
-- ***************************************************************************************/

SET NOCOUNT ON;

DECLARE  @DyncDeleteSQL NVARCHAR(4000);

--Logging	
	   SET @DyncDeleteSQL =
	   N' BEGIN TRY
		  DECLARE @Cnt INT=1;

		  WHILE ( @Cnt > 0 )
		  BEGIN 										
				DELETE TOP (@BatchSize) FROM ' + QUOTENAME (@ChildTableName) + ' 
				--WHERE CreatedDate = @DeleteFrom
				
				SET @Cnt = @@ROWCOUNT;
	  
		  END
		  END TRY
		  BEGIN CATCH
		  
		  
		  -- STANDARD LOGGING PROCESS
		  END CATCH; '

	   EXEC sp_executesql @DyncDeleteSQL, N'@DeleteFrom DATE,											 
									@BatchSize INT'
								   , @DeleteFrom =@CreatedDate											
								   , @BatchSize= @BatchSize											 		
END		
go