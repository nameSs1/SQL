

-- data migration from swimming_competitions into just_like_others
-- insert into Group


GO

INSERT INTO just_like_others.dbo.[Group] ([Name], Gender)
SELECT DISTINCT c.birth_year AS [Name], g.title_gender AS Gender
FROM swimming_competitions.dbo.competition AS c 
JOIN swimming_competitions.dbo.gender AS g ON c.gender_id = g.gender_id

GO