

-- ÑREATE TABLE dbo.SwimmingClub FOR just_like_others

USE just_like_others

GO

IF OBJECT_ID('dbo.SwimmingClub', 'U') IS NOT NULL
   DROP TABLE dbo.SwimmingClub

GO

CREATE TABLE dbo.SwimmingClub
(
	SwimmingClubID  SMALLINT         NOT NULL    IDENTITY,
	[Name]          NVARCHAR(100)    NOT NULL ,
	City            NVARCHAR(40)     NOT NULL ,
	[Address]       NVARCHAR(100),
	Phone           NVARCHAR(20),
	YearEstablished SMALLINT,
	ModifiedDate    DATETIME         NOT NULL,

	CONSTRAINT PK_SwimmingClub PRIMARY KEY (SwimmingClubID)
)

GO