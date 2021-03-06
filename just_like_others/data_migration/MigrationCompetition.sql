

-- data migration from swimming_competitions into just_like_others
-- insert into Competition

GO

	WITH CTE_competitions AS 
(
	SELECT c.birth_year    AS GroupName,
		   g.title_gender  AS Gender,
		   c.distance      AS Distance,
		   s.title_style   AS Style,
		   city.title_city AS City,
		   e.title_event   AS EventName,
		   e.[pool]        AS PoolSize,
		   DATEADD(day, DAY(c.[day] - 1), e.date_event) AS [Date]
	FROM swimming_competitions.dbo.competition AS c
	JOIN swimming_competitions.dbo.gender      AS g    ON c.gender_id = g.gender_id
	JOIN swimming_competitions.dbo.style       AS s    ON c.style_id = s.style_id
	JOIN swimming_competitions.dbo.[event]     AS e    ON c.event_id = e.event_id
	LEFT JOIN swimming_competitions.dbo.city   AS city ON e.city_id = city.city_id
)

INSERT INTO just_like_others.dbo.Competition (GroupID, DisciplineID, PoolID, [Date])
SELECT 
	(SELECT GroupID FROM just_like_others.dbo.[Group]
	 WHERE [Name] = cte.GroupName AND Gender = cte.Gender),
	(SELECT DisciplineID FROM just_like_others.dbo.Discipline
	 WHERE Style = cte.Style AND Distance = cte.Distance),
	(SELECT PoolID FROM just_like_others.dbo.[Pool] 
	 WHERE City = cte.City AND [Name] = EventName AND PoolSize = cte.PoolSize),
	[Date]
FROM CTE_competitions AS cte

GO