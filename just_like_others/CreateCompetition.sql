

-- ÑREATE TABLE dbo.Competition FOR just_like_others

O

IF OBJECT_ID('dbo.Competition', 'U') IS NOT NULL
   DROP TABLE dbo.Competition

GO

CREATE TABLE Competition
(
	CompetitionID SMALLINT   NOT NULL    IDENTITY,
	GroupID       SMALLINT   NOT NULL,
	DisciplineID  SMALLINT   NOT NULL,
	PoolID        SMALLINT   NOT NULL,
	[Date]        DATE       NOT NULL,
	ModifiedDate  DATETIME   NOT NULL,

	CONSTRAINT PK_Competition PRIMARY KEY (CompetitionID)
)

GO