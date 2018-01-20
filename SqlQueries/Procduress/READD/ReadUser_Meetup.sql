USE DigitalDocs

GO
SET NOEXEC OFF

GO
IF NOT EXISTS 
(
	SELECT 1
    FROM sys.objects
    WHERE type = 'P'
		AND NAME = 'ReadUser_Meetup'
)
EXEC sp_executesql N'CREATE PROCEDURE [dbo].[ReadUser_Meetup] AS SELECT 1'

IF @@ERROR <> 0
	SET NOEXEC ON

--------------------------------------------------
GO
ALTER PROCEDURE [dbo].[ReadUser_Meetup]
	@ItemId int = 0,
	@ItemsCount int = 0
AS
BEGIN
	BEGIN TRY
		IF @ItemId = 0
			SELECT * FROM User_Meetups
		ELSE IF @ItemId > 0 AND @ItemsCount > 0
			SELECT TOP (@ItemsCount)* FROM User_Meetups WHERE FK_IdUser > @ItemId;
		ELSE
			SELECT * FROM User_Meetups WHERE FK_IdUser = @ItemId;
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
EXEC [dbo].[ReadUser_Meetup] 0