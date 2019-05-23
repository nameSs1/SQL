

-- ÑREATE TABLE dbo.Swimmer FOR just_like_others

USE just_like_others

GO

IF OBJECT_ID('dbo.Swimmer', 'U') IS NOT NULL
   DROP TABLE dbo.Swimmer

GO

CREATE TABLE dbo.Swimmer
(
	SwimmerID      INT           NOT NULL    IDENTITY,
	SwimmingClubID SMALLINT      NOT NULL,
	FirstName      NVARCHAR(20)  NOT NULL,
	LastName       NVARCHAR(20)  NOT NULL,
	YearOfBirth    SMALLINT      NOT NULL,
	Gender         NCHAR(1)      NOT NULL,
	ModifiedDate   DATETIME      NOT NULL,

	CONSTRAINT PK_Swimmer PRIMARY KEY (SwimmerID)
)

GO