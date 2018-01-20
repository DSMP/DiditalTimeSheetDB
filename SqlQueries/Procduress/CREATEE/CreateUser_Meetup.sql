USE DigitalDocs

GO
SET NOEXEC OFF

GO
IF NOT EXISTS 
(
	SELECT 1
    FROM sys.objects
    WHERE type = 'P'
		AND NAME = 'CreateUser_Meetup'
)
EXEC sp_executesql N'CREATE PROCEDURE [dbo].[CreateUser_Meetup] AS SELECT 1'

IF @@ERROR <> 0
	SET NOEXEC ON

--------------------------------------------------
GO
ALTER PROCEDURE [dbo].[CreateUser_Meetup]
		@Fk_idUser int,
		@Fk_idMeetUp int
AS
BEGIN
	BEGIN
		BEGIN TRY
			INSERT INTO User_Meetups
			(
				Fk_IdUser,
				Fk_IdMeetUp
			)
			VALUES
			(
				@Fk_idUser,
				@Fk_idMeetUp
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

exec CreateUser_Meetup 5,5000