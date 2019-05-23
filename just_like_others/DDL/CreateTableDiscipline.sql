

-- ÑREATE TABLE dbo.Discipline FOR just_like_others

USE just_like_others

GO

IF OBJECT_ID('dbo.Discipline', 'U') IS NOT NULL
   DROP TABLE dbo.Discipline

GO

CREATE TABLE dbo.Discipline
(
	DisciplineID SMALLINT       NOT NULL    IDENTITY,
	Style        NVARCHAR(15)   NOT NULL,
	Distance     SMALLINT       NOT NULL,
	ModifiedDate DATETIME       NOT NULL,

	CONSTRAINT PK_Discipline PRIMARY KEY (DisciplineID)
)

GO
