

-- Constraints for Disqualification of just_like_others


USE just_like_others


IF EXISTS(SELECT * FROM sys.sysobjects WHERE xtype = 'D' AND [NAME] = 'DF_Disqualification_ModifiedDate')
	ALTER TABLE dbo.Disqualification DROP CONSTRAINT DF_Disqualification_ModifiedDate

GO

ALTER TABLE dbo.Disqualification ADD CONSTRAINT DF_Disqualification_ModifiedDate DEFAULT GETDATE() FOR ModifiedDate

GO

IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'FK_Disqualification_CompetitionID')
	ALTER TABLE dbo.Disqualification DROP CONSTRAINT FK_Disqualification_CompetitionID

GO

ALTER TABLE dbo.Disqualification 
	ADD CONSTRAINT FK_Disqualification_CompetitionID FOREIGN KEY (CompetitionID) REFERENCES dbo.Competition (CompetitionID)

GO

IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'FK_Disqualification_SwimmerID')
	ALTER TABLE dbo.Disqualification DROP CONSTRAINT FK_Disqualification_SwimmerID

GO

ALTER TABLE dbo.Disqualification 
	ADD CONSTRAINT FK_Disqualification_SwimmerID FOREIGN KEY (SwimmerID) REFERENCES dbo.Swimmer (SwimmerID)

GO
