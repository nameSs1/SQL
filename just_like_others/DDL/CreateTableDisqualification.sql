

-- �REATE TABLE dbo.Disqualification FOR just_like_others

USE just_like_others

GO

IF OBJECT_ID('dbo.Disqualification', 'U') IS NOT NULL
   DROP TABLE dbo.Disqualification

GO

CREATE TABLE dbo.Disqualification
(
	DisqualificationID INT          NOT NULL    IDENTITY,
	CompetitionID      SMALLINT     NOT NULL,
	SwimmerID          INT          NOT NULL,
	Reason             NVARCHAR(20),
	ModifiedDate       DATETIME     NOT NULL,

	CONSTRAINT PK_Disqualification PRIMARY KEY (DisqualificationID)
)

GO