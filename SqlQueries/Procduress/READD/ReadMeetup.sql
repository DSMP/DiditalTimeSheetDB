USE DigitalDocs

GO
SET NOEXEC OFF

GO
IF NOT EXISTS 
(
	SELECT 1
    FROM sys.objects
    WHERE type = 'P'
		AND NAME = 'ReadMeetup'
)
EXEC sp_executesql N'CREATE PROCEDURE [dbo].[ReadMeetup] AS SELECT 1'

IF @@ERROR <> 0
	SET NOEXEC ON

--------------------------------------------------
GO
ALTER PROCEDURE [dbo].[ReadMeetup]
	@ItemId int = 0,
	@ItemsCount int = 0
AS
BEGIN
	BEGIN TRY
		IF @ItemId = 0
			SELECT * FROM MeetUps
		ELSE IF @ItemId > 0 AND @ItemsCount > 0
			SELECT TOP (@ItemsCount) * FROM Meetups WHERE IdMeetUp >= @ItemId;
		ELSE
			SELECT * FROM Meetups WHERE IdMeetUp = @ItemId;	
	END TRY
	BEGIN CATCH
		SELECT -1 as Status, 'Error occured.' as Description, IDENT_CURRENT('User_Roles') as CurrentID;
	END CATCH
END
--------------------------------------------------

GO
IF @@ERROR <> 0
    SET NOEXEC ON

PRINT 'OK'

GO
EXEC [dbo].[ReadMeetUp] 4, 3