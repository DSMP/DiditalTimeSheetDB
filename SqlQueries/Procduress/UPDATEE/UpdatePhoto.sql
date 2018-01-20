USE DigitalDocs

GO
SET NOEXEC OFF

GO
IF NOT EXISTS 
(
	SELECT 1
    FROM sys.objects
    WHERE type = 'P'
		AND NAME = 'UpdatePhoto'
)
EXEC sp_executesql N'CREATE PROCEDURE [dbo].[UpdatePhoto] AS SELECT 1'

IF @@ERROR <> 0
	SET NOEXEC ON

--------------------------------------------------
GO
ALTER PROCEDURE [dbo].[UpdatePhoto]
		@IdPhoto int,
		@SourceImg Image,
		@IsDeleted tinyint,
		@DateCreated DateTime
AS
BEGIN
	BEGIN
		BEGIN TRY
			Update Photos
			SET
				SourceImg = @SourceImg,
				DateCreated = @DateCreated,
				IsDeleted = @IsDeleted
			WHERE IdPhoto = @IdPhoto
			SELECT 1 as Status, 'Photo successfully Updated.' as Description, @IdPhoto as CurrentID;
		END TRY
		BEGIN CATCH
			SELECT -1 as Status, 'Error occured.' as Description, @IdPhoto as CurrentID;
		END CATCH
	END
END
--------------------------------------------------

GO
IF @@ERROR <> 0
    SET NOEXEC ON

PRINT 'OK'

--exec [UpdatePhoto] 50, 'dcwefdsf2', 0, '20170101'