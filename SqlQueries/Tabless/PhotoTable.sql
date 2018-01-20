GO
USE DigitalDocs

GO
IF NOT EXISTS 
(
	SELECT 1
    FROM sys.objects
    WHERE type = 'U'
		AND NAME = 'Photos'
)
BEGIN
	CREATE TABLE Photos 
	(
		IdPhoto int IDENTITY(1,1) PRIMARY KEY,
		SourceImg Image,
		IsDeleted tinyint
	);
END
