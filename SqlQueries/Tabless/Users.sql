GO
USE DigitalDocs

GO
IF NOT EXISTS 
(
	SELECT 1
    FROM sys.objects
    WHERE type = 'U'
		AND NAME = 'Users'
)
BEGIN
	CREATE TABLE Users 
	(
		IdUser int IDENTITY(1,1) PRIMARY KEY,
		email varchar(50) NOT NULL,
		password varchar(64) NOT NULL,
		isDeleted tinyint NOT NULL
	);
END
