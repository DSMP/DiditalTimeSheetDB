USE DigitalDocs

GO
SET NOEXEC OFF

GO
IF NOT EXISTS 
(
	SELECT 1
    FROM sys.objects
    WHERE type = 'P'
		AND NAME = 'CreateRole'
)
EXEC sp_executesql N'CREATE PROCEDURE [dbo].[CreateRole] AS SELECT 1'

IF @@ERROR <> 0
	SET NOEXEC ON

--------------------------------------------------
GO
ALTER PROCEDURE [dbo].[CreateRole]
		@IdRole int,
		@RoleName varchar(30)
AS
BEGIN
	BEGIN
		BEGIN TRY
			INSERT INTO Roles
			(
				RoleName
			)
			VALUES
			(
				@RoleName
			);
			SELECT 1 as Status, 'Role successfully added.' as Description, IDENT_CURRENT('Roles') as CurrentID;
		END TRY
		BEGIN CATCH
			SELECT -1 as Status, 'Error occured.' as Description, -1 as CurrentID;
		END CATCH
	END
END
--------------------------------------------------

GO
IF @@ERROR <> 0
    SET NOEXEC ON

PRINT 'OK'