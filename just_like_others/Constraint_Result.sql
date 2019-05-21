

-- Constraints for Result of just_like_others


USE just_like_others


IF EXISTS(SELECT * FROM sys.sysobjects WHERE xtype = 'D' AND [NAME] = 'DF_Result_ModifiedDate')
	ALTER TABLE dbo.Result DROP CONSTRAINT DF_Result_ModifiedDate

GO

ALTER TABLE dbo.Result ADD CONSTRAINT DF_Result_ModifiedDate DEFAULT GETDATE() FOR ModifiedDate

GO

IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'FK_Result_CompetitionID')
	ALTER TABLE dbo.Result DROP CONSTRAINT FK_Result_CompetitionID

GO

ALTER TABLE dbo.Result 
	ADD CONSTRAINT FK_Result_CompetitionID FOREIGN KEY (CompetitionID) REFERENCES dbo.Competition (CompetitionID)

GO

IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'FK_Result_SwimmerID')
	ALTER TABLE dbo.Result DROP CONSTRAINT FK_Result_SwimmerID

GO

ALTER TABLE dbo.Result 
	ADD CONSTRAINT FK_Result_SwimmerID FOREIGN KEY (SwimmerID) REFERENCES dbo.Swimmer (SwimmerID)

GO
