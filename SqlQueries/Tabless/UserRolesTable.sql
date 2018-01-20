GO
USE DigitalDocs

GO
IF NOT EXISTS 
(
	SELECT 1
    FROM sys.objects
    WHERE type = 'U'
		AND NAME = 'User_Roles'
)
BEGIN
	CREATE TABLE User_roles
	(
		FK_IdUser int Foreign key REFERENCES dbo.Users(idUser),
		FK_IdRole int Foreign key REFERENCES dbo.Roles(idRole)
	);
END
