USE DigitalDocs

GO
SET NOEXEC OFF

GO
IF NOT EXISTS 
(
	SELECT 1
    FROM sys.objects
    WHERE type = 'P'
		AND NAME = 'ReadUser'
)
EXEC sp_executesql N'CREATE PROCEDURE [dbo].[ReadUser] AS SELECT 1'

IF @@ERROR <> 0
	SET NOEXEC ON

--------------------------------------------------
GO
ALTER PROCEDURE [dbo].[ReadUser]
	@ItemId int = 0,
	@ItemsCount int = 0
AS
BEGIN
	BEGIN TRY
		IF @ItemId = 0
			SELECT u.IdUser, u.email, u.password, u.isDeleted FROM Users AS u
		ELSE IF @ItemId > 0 AND @ItemsCount > 0
			SELECT TOP (@ItemsCount) u.IdUser, u.email, u.password, u.isDeleted FROM Users AS u WHERE u.IdUser >= @ItemId;
		ELSE
			SELECT u.IdUser, u.email, u.password, u.isDeleted FROM Users AS u WHERE u.IdUser = @ItemId;	
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
EXEC [dbo].[ReadUser] -1, 3