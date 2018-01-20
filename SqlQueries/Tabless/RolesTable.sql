GO
USE DigitalDocs

GO
IF NOT EXISTS 
(
	SELECT 1
    FROM sys.objects
    WHERE type = 'U'
		AND NAME = 'Roles'
)
BEGIN
	CREATE TABLE Roles 
	(
		IdRole int IDENTITY(1,1) PRIMARY KEY,
		RoleName varchar(50)
	);
END
