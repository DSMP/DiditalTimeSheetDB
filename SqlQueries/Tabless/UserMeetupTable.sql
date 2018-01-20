GO
USE DigitalDocs

GO
IF NOT EXISTS 
(
	SELECT 1
    FROM sys.objects
    WHERE type = 'U'
		AND NAME = 'User_Meetups'
)
BEGIN
	CREATE TABLE User_Meetups
	(
		FK_IdUser int Foreign key REFERENCES dbo.Users(idUser),
		FK_IdMeetup int Foreign key REFERENCES dbo.Meetups(idMeetup)
	);
END
