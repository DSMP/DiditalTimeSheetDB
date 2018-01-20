USE DigitalDocs

GO
SET NOEXEC OFF

GO
IF NOT EXISTS 
(
	SELECT 1
    FROM sys.objects
    WHERE type = 'P'
		AND NAME = 'CreateMeetup'
)
EXEC sp_executesql N'CREATE PROCEDURE [dbo].[CreateMeetup] AS SELECT 1'

IF @@ERROR <> 0
	SET NOEXEC ON

--------------------------------------------------
GO
ALTER PROCEDURE [dbo].[CreateMeetup]
		@IdMeetup int,
		@TitleOcr varchar(50),
		@DateOcr DateTime,
		@DateCreated DateTime,
		@IsDeleted int = 0,
		@Fk_idPhoto int
AS
BEGIN
	DECLARE @Result int;
	BEGIN	
		BEGIN TRY
			INSERT INTO Meetups
			(
				TitleOcr,
				DateOcr,
				DateCreated,
				IsDeleted,
				FK_idPhoto
			)
			VALUES
			(
				@TitleOcr,
				@DateOcr,
				@DateCreated,
				@IsDeleted,
				@Fk_idPhoto
			);
			SELECT 1 as Status, 'Meetup successfully added.' as Description, IDENT_CURRENT('Meetups') as CurrentID;
		END TRY
		BEGIN CATCH
			SELECT -1 as Status, 'Error occured.' as Description, -1 as CurrentID;
		END CATCH
	END
END
--------------------------------------------------
--(select top 1 IdMeetup from Meetups order by IdMeetup DESC)
GO
IF @@ERROR <> 0
    SET NOEXEC ON

PRINT 'OK'

--exec [dbo].[CreateMeetup] 0,'lol','20170101','20170101',0,50