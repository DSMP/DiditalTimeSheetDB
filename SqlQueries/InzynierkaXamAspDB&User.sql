
CREATE DATABASE DigitalDocs

GO
USE DigitalDocs

GO
IF NOT EXISTS 
(
	SELECT 1
    FROM sys.server_principals
	WHERE name = 'DigitalDocsUser'
)
BEGIN
	CREATE LOGIN DigitalDocsUser
		WITH PASSWORD='LigtJerY7l';
	EXEC sp_defaultdb DigitalDocsUser, DigitalDocs; 
	CREATE USER DigitalDocsUser FOR LOGIN DigitalDocsUser;
END
    
USE DigitalDocs;

GO
IF NOT EXISTS 
(
	SELECT 1
    FROM sys.database_principals
	WHERE name = 'DigitalDocsRole'
)
BEGIN
	CREATE ROLE DigitalDocsRole AUTHORIZATION [dbo];
	GRANT EXECUTE TO DigitalDocsRole
	EXEC sp_addrolemember 'DigitalDocsRole', 'DigitalDocsUser';
END