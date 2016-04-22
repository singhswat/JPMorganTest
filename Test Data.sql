declare @table_name varchar(100) 
set nocount on
DECLARE @cnt INT = 0;
--SET @table_name= 'TableName' + cast(@cnt as varchar)
declare @dt datetime =  getdate();

WHILE @cnt < 10000
BEGIN   

   --SET @table_name= 'TableName' + cast(@cnt as varchar)
   
   --DECLARE @sSQL nvarchar(1000)= null

--SET @sSQL = 'CREATE TABLE ' + @table_name + ' ( ' +
--' [table_name]       VARCHAR (128) NOT NULL, ' +
--' [CreatedDate]      DATETIME NULL ' +
-- ');' ;

insert into [dbo].[TableName012] (table_name, CreatedDate) values('table_name012', getdate())
--insert into [dbo].[TableName01] (table_name, CreatedDate) values('table_name02', getdate())

 --print @sSQL
 --Execute sp_executesql @sSQL
 
   SET @cnt = @cnt + 1;
END;

