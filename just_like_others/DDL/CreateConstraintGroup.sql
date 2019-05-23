

-- Constraints for Group of just_like_others


USE just_like_others

GO 

IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'AK_Group_Name_Gender')
	ALTER TABLE dbo.[Group] DROP CONSTRAINT AK_Group_Name_Gender

GO

ALTER TABLE dbo.[Group] ADD CONSTRAINT AK_Group_Name_Gender UNIQUE ([Name], Gender)

GO

IF EXISTS(SELECT * FROM sys.sysobjects WHERE xtype = 'D' AND [NAME] = 'DF_Group_ModifiedDate')
	ALTER TABLE dbo.[Group] DROP CONSTRAINT DF_Group_ModifiedDate

GO

ALTER TABLE dbo.[Group] ADD CONSTRAINT DF_Group_ModifiedDate DEFAULT GETDATE() FOR ModifiedDate

GO