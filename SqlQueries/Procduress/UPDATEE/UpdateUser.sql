USE DigitalDocs

GO
SET NOEXEC OFF

GO
IF NOT EXISTS 
(
	SELECT 1
    FROM sys.objects
    WHERE type = 'P'
		AND NAME = 'UpdateUser'
)
EXEC sp_executesql N'CREATE PROCEDURE [dbo].[UpdateUser] AS SELECT 1'

IF @@ERROR <> 0
	SET NOEXEC ON

--------------------------------------------------
GO
ALTER PROCEDURE [dbo].[UpdateUser]
		@IdUser int,
		@Email varchar(50),
		@Password varchar(50),
		@IsDeleted tinyint
		--@DateCreated DateTime
AS
BEGIN
	BEGIN
		BEGIN TRY
			Update Users
			SET
				email = @Email,
				password = @Password,
				isDeleted = @IsDeleted
			WHERE IdUser = @IdUser
			SELECT 1 as Status, 'User successfully Updated.' as Description, @IdUser as CurrentID;
		END TRY
		BEGIN CATCH
			SELECT -1 as Status, 'Error occured.' as Description, @IdUser as CurrentID;
		END CATCH
	END
END
--------------------------------------------------

GO
IF @@ERROR <> 0
    SET NOEXEC ON

PRINT 'OK'

--exec [UpdatePhoto] 50, 'dcwefdsf2', 0, '20170101'