

-- ÑREATE TABLE dbo.Discipline FOR just_like_others

GO

IF OBJECT_ID('dbo.Discipline', 'U') IS NOT NULL
   DROP TABLE dbo.Discipline

GO

CREATE TABLE Discipline
(
	DisciplineID SMALLINT       NOT NULL    IDENTITY,
	Style        NVARCHAR(20)   NOT NULL,
	Distance     SMALLINT       NOT NULL,
	ModifiedDate DATETIME       NOT NULL,

	CONSTRAINT PK_Discipline PRIMARY KEY (DisciplineID)
)

GO
