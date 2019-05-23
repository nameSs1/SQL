

-- data migration from swimming_competitions into just_like_others
-- insert into Discipline


GO

INSERT INTO just_like_others.dbo.Discipline (Style, Distance)
SELECT DISTINCT s.title_style AS Style, c.distance AS Distance
FROM swimming_competitions.dbo.competition AS c
JOIN swimming_competitions.dbo.style AS s ON s.style_id = c.style_id

GO