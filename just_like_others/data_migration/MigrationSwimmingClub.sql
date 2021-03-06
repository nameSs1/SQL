

-- data migration from swimming_competitions into just_like_others
-- insert into SwimmingClub

GO

INSERT INTO just_like_others.dbo.SwimmingClub (City, [Name])
SELECT DISTINCT city.title_city AS City, 
			IIF(club.title_club IS NOT NULL, club.title_club, city.title_city) AS [Name]
FROM swimming_competitions.dbo.person AS p
JOIN swimming_competitions.dbo.city AS city ON p.city_id = city.city_id
LEFT JOIN swimming_competitions.dbo.club AS club ON p.club_id = club.club_id

GO