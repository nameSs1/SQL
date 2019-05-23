

-- Constraints for Swimmer of just_like_others


USE just_like_others

GO 

IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
		  WHERE CONSTRAINT_NAME = 'AK_Swimmer_SwimmingClubID_FirstName_LastName_YearOfBirth_Gender')

	ALTER TABLE dbo.Swimmer DROP CONSTRAINT AK_Swimmer_SwimmingClubID_FirstName_LastName_YearOfBirth_Gender

GO

ALTER TABLE dbo.Swimmer ADD CONSTRAINT AK_Swimmer_SwimmingClubID_FirstName_LastName_YearOfBirth_Gender 
	UNIQUE (SwimmingClubID, FirstName, LastName, YearOfBirth, Gender)

GO

IF EXISTS(SELECT * FROM sys.sysobjects WHERE xtype = 'D' AND [NAME] = 'DF_Swimmer_ModifiedDate')
	ALTER TABLE dbo.Swimmer DROP CONSTRAINT DF_Swimmer_ModifiedDate

GO

ALTER TABLE dbo.Swimmer ADD CONSTRAINT DF_Swimmer_ModifiedDate DEFAULT GETDATE() FOR ModifiedDate

GO

IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
		  WHERE CONSTRAINT_NAME = 'FK_Swimmer_SwimmingClub')

	ALTER TABLE dbo.Swimmer DROP CONSTRAINT FK_Swimmer_SwimmingClub

GO

ALTER TABLE dbo.Swimmer 
	ADD CONSTRAINT FK_Swimmer_SwimmingClub FOREIGN KEY (SwimmingClubID) REFERENCES dbo.SwimmingClub (SwimmingClubID)

GO