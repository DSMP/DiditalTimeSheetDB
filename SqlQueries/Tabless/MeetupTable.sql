GO
USE DigitalDocs

GO
IF NOT EXISTS 
(
	SELECT 1
    FROM sys.objects
    WHERE type = 'U'
		AND NAME = 'Meetups'
)
BEGIN
	CREATE TABLE Meetups
	(
		IdMeetup int IDENTITY(1,1) PRIMARY KEY,
		TitleOcr varchar(50),
		DateOcr DateTime,
		DateCreated DateTime,
		IsDeleted tinyint,
		FK_idPhoto int FOREIGN KEY REFERENCES Photos(idPhoto)
	);
END
