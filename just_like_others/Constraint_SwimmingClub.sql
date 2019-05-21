

-- Constraints for SwimmingClub of just_like_others


USE just_like_others

GO 

IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'AK_Group_Name_City')
	ALTER TABLE dbo.SwimmingClub DROP CONSTRAINT AK_Group_Name_City

GO

ALTER TABLE dbo.SwimmingClub ADD CONSTRAINT AK_Group_Name_City UNIQUE ([Name], City)

GO

IF EXISTS(SELECT * FROM sys.sysobjects WHERE xtype = 'D' AND [NAME] = 'DF_SwimmingClub_ModifiedDate')
	ALTER TABLE dbo.SwimmingClub DROP CONSTRAINT DF_SwimmingClub_ModifiedDate

GO

ALTER TABLE dbo.SwimmingClub ADD CONSTRAINT DF_SwimmingClub_ModifiedDate DEFAULT GETDATE() FOR ModifiedDate

GO