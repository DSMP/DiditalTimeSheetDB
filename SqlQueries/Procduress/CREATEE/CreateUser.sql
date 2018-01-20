USE DigitalDocs

GO
SET NOEXEC OFF

GO
IF NOT EXISTS 
(
	SELECT 1
    FROM sys.objects
    WHERE type = 'P'
		AND NAME = 'CreateUser'
)
EXEC sp_executesql N'CREATE PROCEDURE [dbo].[CreateUser] AS SELECT 1'

IF @@ERROR <> 0
	SET NOEXEC ON

--------------------------------------------------
GO
ALTER PROCEDURE [dbo].[CreateUser]
		@IdUser int,
		@Email varchar(50),
		@Password varchar(64),
		@IsDeleted tinyint = 0
AS
BEGIN
		BEGIN TRY
			INSERT INTO Users
			(
				email,
				password,
				isDeleted
			)
			VALUES
			(
				@Email,
				@Password,
				@IsDeleted
			);
			SELECT 1 as Status, 'User successfully added.' as Description, IDENT_CURRENT('Users') as CurrentID;
		END TRY
		BEGIN CATCH
			SELECT -1 as Status, 'Error occured.' as Description, -1 as CurrentID;
		END CATCH
END
--------------------------------------------------

GO
IF @@ERROR <> 0
    SET NOEXEC ON

PRINT 'OK'

exec dbo.CreateUser 0,'asdasd','asdasd'