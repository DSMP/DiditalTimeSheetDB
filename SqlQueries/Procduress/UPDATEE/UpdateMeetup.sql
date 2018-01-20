USE DigitalDocs

GO
SET NOEXEC OFF

GO
IF NOT EXISTS 
(
	SELECT 1
    FROM sys.objects
    WHERE type = 'P'
		AND NAME = 'UpdateMeetup'
)
EXEC sp_executesql N'CREATE PROCEDURE [dbo].[UpdateMeetup] AS SELECT 1'

IF @@ERROR <> 0
	SET NOEXEC ON

--------------------------------------------------
GO
ALTER PROCEDURE [dbo].[UpdateMeetup]
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
			Update Meetups
			SET
				TitleOcr = @TitleOcr,
				DateOcr = @DateOcr,
				DateCreated = @DateCreated,
				IsDeleted = @IsDeleted,
				FK_idPhoto = @Fk_idPhoto
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