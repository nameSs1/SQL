

USE just_like_others

GO

IF OBJECT_ID('dbo.[Pool]', 'U') IS NOT NULL
   DROP TABLE dbo.[Pool]

GO

CREATE TABLE [Pool]
(
	PoolID       SMALLINT        NOT NULL    IDENTITY,
	City         NVARCHAR(20)    NOT NULL,
	[Name]       NVARCHAR(200)   NOT NULL,
	PoolSize     TINYINT         NOT NULL,
	ModifiedDate DATETIME        NOT NULL,

	CONSTRAINT PK_Pool PRIMARY KEY (PoolID)
)

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

IF OBJECT_ID('dbo.Disqualification', 'U') IS NOT NULL
   DROP TABLE dbo.Disqualification

GO

CREATE TABLE Disqualification
(
	DisqualificationID INT          NOT NULL    IDENTITY,
	CompetitionID      SMALLINT     NOT NULL,
	SwimmerID          INT          NOT NULL,
	Reason             NVARCHAR(50),
	ModifiedDate       DATETIME     NOT NULL,

	CONSTRAINT PK_Disqualification PRIMARY KEY (DisqualificationID)
)

GO

IF OBJECT_ID('dbo.SwimmingClub', 'U') IS NOT NULL
   DROP TABLE dbo.SwimmingClub

GO

CREATE TABLE SwimmingClub
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

IF OBJECT_ID('dbo.Swimmer', 'U') IS NOT NULL
   DROP TABLE dbo.Swimmer

GO

CREATE TABLE Swimmer
(
	SwimmerID      INT           NOT NULL    IDENTITY,
	SwimmingClubID SMALLINT      NOT NULL,
	FirstName      NVARCHAR(20)  NOT NULL,
	LastName       NVARCHAR(20)  NOT NULL,
	YearOfBirth    SMALLINT      NOT NULL,
	Gender         NVARCHAR(1)   NOT NULL,
	ModifiedDate   DATETIME      NOT NULL,

	CONSTRAINT PK_Swimmer PRIMARY KEY (SwimmerID)
)

GO

IF OBJECT_ID('dbo.Result', 'U') IS NOT NULL
   DROP TABLE dbo.Result

GO

CREATE TABLE Result
(
	ResultID      INT           NOT NULL    IDENTITY,
	CompetitionID SMALLINT      NOT NULL,
	SwimmerID     INT           NOT NULL,
	[Time]        TIME(2)       NOT NULL,
	ModifiedDate  DATETIME      NOT NULL,

	CONSTRAINT PK_Result PRIMARY KEY (ResultID)
)

GO

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