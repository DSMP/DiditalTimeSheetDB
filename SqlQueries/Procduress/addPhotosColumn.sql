SET IDENTITY_INSERT Meetups ON
GO
Insert into Meetups (
	IdMeetUp,
	TitleOcr,
	DateOcr,
	DateCreated,
	IsDeleted,
	FK_idPhoto
)
select IdMeetUp,
	TitleOcr,
	DateOcr,
	DateCreated,
	 0 AS IsDeleted,
	FK_idPhoto FROM Meetupstemp
GO
SET IDENTITY_INSERT Meetups OFF

SET IDENTITY_INSERT Photos ON
GO
Insert Into dbo.Photos
(
	IdPhoto,
	SourceImg
)
select * from Photos2
GO
SET IDENTITY_INSERT Photos OFF

insert into Meetups
(
		TitleOcr,
		DateOcr,
		DateCreated,
		IsDeleted,
		FK_idPhoto
)
select TitleOcr,
	DateOcr,
	DateCreated,
	IsDeleted,
	FK_idPhoto from Meetups2

SELECT ISNULL(myColumn, 0 ) FROM myTable

Update Photos Set IsDeleted = 0 WHere Photos.IsDeleted IS Null

Merge into Photos USING Meetups On Photos.IdPhoto = Meetups.FK_idPhoto 
When Matched Then Update Set DateCreated = Meetups.DateCreated;

select * FROM Photos inner Join Meetups On IdPhoto = FK_idPhoto Where IdPhoto > 0
select * FROM Photos