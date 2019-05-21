

-- ÑREATE TABLE dbo.Pool FOR just_like_others


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