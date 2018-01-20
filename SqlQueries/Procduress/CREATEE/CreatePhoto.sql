USE DigitalDocs

GO
SET NOEXEC OFF

GO
IF NOT EXISTS 
(
	SELECT 1
    FROM sys.objects
    WHERE type = 'P'
		AND NAME = 'CreatePhoto'
)
EXEC sp_executesql N'CREATE PROCEDURE [dbo].[CreatePhoto] AS SELECT 1'

IF @@ERROR <> 0
	SET NOEXEC ON

--------------------------------------------------
GO
ALTER PROCEDURE [dbo].[CreatePhoto]
		@idPhoto int,
		@SourceImg Image,
		@IsDeleted tinyint,
		@DateCreated DateTime
AS
BEGIN
	BEGIN
		BEGIN TRY
			INSERT INTO Photos
			(
				SourceImg,
				IsDeleted,
				DateCreated
			)
			VALUES
			(
				@SourceImg,
				@IsDeleted,
				@DateCreated
			);
			SELECT 1 as Status, 'Meetup successfully added.' as Description, IDENT_CURRENT('Photos') as CurrentID
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