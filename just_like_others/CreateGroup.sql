

-- ÑREATE TABLE dbo.Group FOR just_like_others

GO

IF OBJECT_ID('dbo.[Group]', 'U') IS NOT NULL
   DROP TABLE dbo.[Group]

GO

CREATE TABLE [Group]
(
	GroupID          SMALLINT       NOT NULL    IDENTITY,
	[Name]           NVARCHAR(20)   NOT NULL,
	Gender           NVARCHAR(1)    NOT NULL,
	LimitDescription NVARCHAR(255),
	ModifiedDate     DATETIME       NOT NULL,

	CONSTRAINT PK_Group PRIMARY KEY (GroupID)
)

GO
