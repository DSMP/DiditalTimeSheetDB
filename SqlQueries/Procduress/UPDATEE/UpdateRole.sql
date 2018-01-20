USE DigitalDocs

GO
SET NOEXEC OFF

GO
IF NOT EXISTS 
(
	SELECT 1
    FROM sys.objects
    WHERE type = 'P'
		AND NAME = 'UpdateRole'
)
EXEC sp_executesql N'CREATE PROCEDURE [dbo].[UpdateRole] AS SELECT 1'

IF @@ERROR <> 0
	SET NOEXEC ON

--------------------------------------------------
GO
ALTER PROCEDURE [dbo].[UpdateRole]
		@IdRole int,
		@RoleName varchar(50)
		--@DateCreated DateTime
AS
BEGIN
	BEGIN
		BEGIN TRY
			Update Roles
			SET
				RoleName = @RoleName
			WHERE IdRole = @IdRole
			SELECT 1 as Status, 'Role successfully Updated.' as Description, @IdRole as CurrentID;
		END TRY
		BEGIN CATCH
			SELECT -1 as Status, 'Error occured.' as Description, @IdRole as CurrentID;
		END CATCH
	END
END
--------------------------------------------------

GO
IF @@ERROR <> 0
    SET NOEXEC ON

PRINT 'OK'

--exec [UpdatePhoto] 50, 'dcwefdsf2', 0, '20170101'