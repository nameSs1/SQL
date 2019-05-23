

-- ÑREATE TABLE dbo.Group FOR just_like_others

USE just_like_others

GO

IF OBJECT_ID('dbo.[Group]', 'U') IS NOT NULL
   DROP TABLE dbo.[Group]

GO

CREATE TABLE dbo.[Group]
(
	GroupID          SMALLINT       NOT NULL    IDENTITY,
	[Name]           NVARCHAR(20)   NOT NULL,
	Gender           NCHAR(1)       NOT NULL,
	LimitDescription NVARCHAR(255),
	ModifiedDate     DATETIME       NOT NULL,

	CONSTRAINT PK_Group PRIMARY KEY (GroupID)
)

GO
