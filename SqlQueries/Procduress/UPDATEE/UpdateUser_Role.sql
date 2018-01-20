USE DigitalDocs

GO
SET NOEXEC OFF

GO
IF NOT EXISTS 
(
	SELECT 1
    FROM sys.objects
    WHERE type = 'P'
		AND NAME = 'UpdateUser_Role'
)
EXEC sp_executesql N'CREATE PROCEDURE [dbo].[UpdateUser_Role] AS SELECT 1'

IF @@ERROR <> 0
	SET NOEXEC ON

--------------------------------------------------
GO
ALTER PROCEDURE [dbo].[UpdateUser_Role]
		@FK_IdUser int,
		@FK_IdRole int
		--@DateCreated DateTime
AS
BEGIN
	BEGIN
		BEGIN TRY
			--Update User_Meetups
			--SET
			--	FK_IdUser = @FK_IdUser,
			--	FK_IdMeetup = @FK_IdMeetup
			--WHERE FK_IdUser = @FK_IdUser AND FK_IdMeetup = @FK_IdMeetup
			SELECT 1 as Status, 'User_Role Cannot be Updated.' as Description, 0 as CurrentID;
		END TRY
		BEGIN CATCH
			SELECT -2 as Status, 'Error occured.' as Description, 0 as CurrentID;
		END CATCH
	END
END
--------------------------------------------------

GO
IF @@ERROR <> 0
    SET NOEXEC ON

PRINT 'OK'

--exec [UpdatePhoto] 50, 'dcwefdsf2', 0, '20170101'