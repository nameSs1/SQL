

-- Constraints for Discipline of just_like_others


USE just_like_others

GO 

IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'AK_Discipline_Style_Distance')
	ALTER TABLE dbo.Discipline DROP CONSTRAINT AK_Discipline_Style_Distance

GO

ALTER TABLE dbo.Discipline ADD CONSTRAINT AK_Discipline_Style_Distance UNIQUE (Style, Distance)

GO

IF EXISTS(SELECT * FROM sys.sysobjects WHERE xtype = 'D' AND [NAME] = 'DF_Discipline_ModifiedDate')
	ALTER TABLE dbo.Discipline DROP CONSTRAINT DF_Discipline_ModifiedDate

GO

ALTER TABLE dbo.Discipline ADD CONSTRAINT DF_Discipline_ModifiedDate DEFAULT GETDATE() FOR ModifiedDate

GO