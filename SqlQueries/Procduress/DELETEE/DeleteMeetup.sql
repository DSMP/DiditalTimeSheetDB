USE DigitalDocs

GO
SET NOEXEC OFF

GO
IF NOT EXISTS 
(
	SELECT 1
    FROM sys.objects
    WHERE type = 'P'
		AND NAME = 'DeleteMeetup'
)
EXEC sp_executesql N'CREATE PROCEDURE [dbo].[DeleteMeetup] AS SELECT 1'

IF @@ERROR <> 0
	SET NOEXEC ON

--------------------------------------------------
GO
ALTER PROCEDURE [dbo].[DeleteMeetup]
		@IdMeetup int,
		@TitleOcr varchar(50),
		@DateOcr DateTime,
		@DateCreated DateTime,
		@IsDeleted tinyInt,
		@Fk_idPhoto int
AS
BEGIN
	BEGIN
		BEGIN TRY
			Delete Meetups
			WHERE IdMeetup = @IdMeetup
			SELECT 1 as Status, 'Meetup successfully Updated.' as Description, @IdMeetup as CurrentID;
		END TRY
		BEGIN CATCH
			SELECT -1 as Status, 'Error occured.' as Description, @IdMeetup as CurrentID;
		END CATCH
	END
END
--------------------------------------------------

GO
IF @@ERROR <> 0
    SET NOEXEC ON

PRINT 'OK'