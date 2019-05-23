

-- Constraints for Competition of just_like_others


USE just_like_others


IF EXISTS(SELECT * FROM sys.sysobjects WHERE xtype = 'D' AND [NAME] = 'DF_Competition_ModifiedDate')
	ALTER TABLE dbo.Competition DROP CONSTRAINT DF_Competition_ModifiedDate

GO

ALTER TABLE dbo.Competition ADD CONSTRAINT DF_Competition_ModifiedDate DEFAULT GETDATE() FOR ModifiedDate

GO

IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'FK_Competition_GroupID')
	ALTER TABLE dbo.Competition DROP CONSTRAINT FK_Competition_GroupID

GO

ALTER TABLE dbo.Competition 
	ADD CONSTRAINT FK_Competition_GroupID FOREIGN KEY (GroupID) REFERENCES dbo.[Group] (GroupID)

GO

IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'FK_Competition_DisciplineID')
	ALTER TABLE dbo.Competition DROP CONSTRAINT FK_Competition_DisciplineID

GO

ALTER TABLE dbo.Competition 
	ADD CONSTRAINT FK_Competition_DisciplineID FOREIGN KEY (DisciplineID) REFERENCES dbo.Discipline (DisciplineID)

GO

IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'FK_Competition_PoolID')
	ALTER TABLE dbo.Competition DROP CONSTRAINT FK_Competition_PoolID

GO

ALTER TABLE dbo.Competition 
	ADD CONSTRAINT FK_Competition_PoolID FOREIGN KEY (PoolID) REFERENCES dbo.[Pool] (PoolID)

GO