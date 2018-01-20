USE DigitalDocs

GO
SET NOEXEC OFF

GO
IF NOT EXISTS 
(
	SELECT 1
    FROM sys.objects
    WHERE type = 'P'
		AND NAME = 'DeleteRow'
)
EXEC sp_executesql N'CREATE PROCEDURE [dbo].[DeleteRow] AS SELECT 1'

IF @@ERROR <> 0
	SET NOEXEC ON

--------------------------------------------------
GO
ALTER PROCEDURE [dbo].[DeleteRow]
		@TableName varchar(100),
		@IdRow int,
		@IdForeign int = 0
AS
BEGIN
	declare @col1 as varchar(128)
	select @col1 = column_name from information_schema.columns where table_name = @TableName and ordinal_position = 1;
	declare @query varchar(128); SET @query = 'DELETE ' + @TableName + ' WHERE ' + @col1 + ' = ' + CONVERT(varchar, @IdRow)
	IF @IdForeign != 0
	BEGIN
		declare @col2 as varchar(128)
		select @col2 = column_name from information_schema.columns where table_name = @TableName and ordinal_position = 2;
		SET @query = @query + ' AND ' + @col2 + ' = ' + CONVERT(varchar, @IdForeign)
	END

	BEGIN
		BEGIN TRY
			exec (@query);
			SELECT 1 as Status, (@TableName + ' successfully Deleted.') as Description, @IdRow as CurrentID;
		END TRY
		BEGIN CATCH
			SELECT -1 as Status, 'Error occured.' as Description, @IdRow as CurrentID;
		END CATCH
	END
END
--------------------------------------------------

GO
IF @@ERROR <> 0
    SET NOEXEC ON

PRINT 'OK'
GO
--exec DeleteRow 'User_Meetups', 6, 0
