USE DigitalDocs

GO
SET NOEXEC OFF

GO
IF NOT EXISTS 
(
	SELECT 1
    FROM sys.objects
    WHERE type = 'P'
		AND NAME = 'ReadRole'
)
EXEC sp_executesql N'CREATE PROCEDURE [dbo].[ReadRole] AS SELECT 1'

IF @@ERROR <> 0
	SET NOEXEC ON

--------------------------------------------------
GO
ALTER PROCEDURE [dbo].[ReadRole]
	@ItemId int = 0,
	@ItemsCount int = 0
AS
BEGIN
	BEGIN TRY
		IF @ItemId = 0
			SELECT * FROM Roles
		ELSE IF @ItemId > 0 AND @ItemsCount > 0
			SELECT TOP (@ItemsCount)* FROM Roles WHERE IdRole >= @ItemId;
		ELSE
			SELECT * FROM Roles WHERE IdRole = @ItemId;	
	END TRY
	BEGIN CATCH
		SELECT -1 as Status, 'Error occured.' as Description, IDENT_CURRENT('User_Roles') as CurrentID;
	END CATCH
END
--------------------------------------------------

GO
IF @@ERROR <> 0
    SET NOEXEC ON

PRINT 'OK'

GO
EXEC [dbo].[ReadRole] 4, 3