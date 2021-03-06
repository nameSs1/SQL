

-- data migration from swimming_competitions into just_like_others
-- insert into Pool

GO

INSERT INTO just_like_others.dbo.[Pool] (City, [Name], PoolSize)
SELECT c.title_city AS City, e.title_event AS [Name], e.[pool] AS PoolSize
FROM swimming_competitions.dbo.[event] AS e 
JOIN swimming_competitions.dbo.city AS c ON e.city_id = c.city_id

GO