USE DigitalDocs

GO
SET NOEXEC OFF

GO
IF NOT EXISTS 
(
	SELECT 1
    FROM sys.objects
    WHERE type = 'P'
		AND NAME = 'LastIndexRow'
)
EXEC sp_executesql N'CREATE PROCEDURE [dbo].[LastIndexRow] AS SELECT 1'
IF @@ERROR <> 0
	SET NOEXEC ON

--------------------------------------------------
GO
ALTER PROCEDURE [dbo].[LastIndexRow]
	@TableName varchar(50)
AS
BEGIN
	declare @col1 as varchar(128)
	select @col1 = column_name from information_schema.columns where table_name = @TableName and ordinal_position = 1;
	declare @sql as varchar(128) SET @sql = 'select top (1) ' + @col1 + ' FROM ' + @TableName + ' Order By 1 DESC'
	BEGIN
		BEGIN TRY
			exec (@sql)
		END TRY
		BEGIN CATCH
			SELECT -1 AS My
		END CATCH
	END
END
--------------------------------------------------
--= IDENT_CURRENT('Photos');
GO
IF @@ERROR <> 0
    SET NOEXEC ON

PRINT 'OK'

exec LastIndexRow 'Meetups'