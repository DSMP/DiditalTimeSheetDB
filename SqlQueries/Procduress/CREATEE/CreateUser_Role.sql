USE DigitalDocs

GO
SET NOEXEC OFF

GO
IF NOT EXISTS 
(
	SELECT 1
    FROM sys.objects
    WHERE type = 'P'
		AND NAME = 'CreateUser_Role'
)
EXEC sp_executesql N'CREATE PROCEDURE [dbo].[CreateUser_Role] AS SELECT 1'

IF @@ERROR <> 0
	SET NOEXEC ON

--------------------------------------------------
GO
ALTER PROCEDURE [dbo].[CreateUser_Role]
		@idUser int,
		@idMeetup int
AS
BEGIN
	BEGIN
		BEGIN TRY
			INSERT INTO User_Roles
			(
				FK_IdUser,
				FK_IdRole
			)
			VALUES
			(
				@idUser,
				@idMeetup
			);
			SELECT 1 as Status, 'User_Meetup successfully added.' as Description, 0 as CurrentID;
		END TRY
		BEGIN CATCH
			SELECT -1 as Status, 'Error occured.' as Description, 0 as CurrentID;
		END CATCH
	END
END
--------------------------------------------------

GO
IF @@ERROR <> 0
    SET NOEXEC ON

PRINT 'OK'