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