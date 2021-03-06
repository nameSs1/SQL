

-- data migration from swimming_competitions into just_like_others
-- insert into Swimmer

GO

INSERT INTO just_like_others.dbo.Swimmer (SwimmingClubID, 
										  FirstName, 
										  LastName, 
										  YearOfBirth, 
										  Gender)
SELECT 
	(SELECT sc.SwimmingClubID 
	 FROM just_like_others.dbo.SwimmingClub AS sc
	 WHERE sc.[Name] = (IIF(club.title_club IS NOT NULL, club.title_club, city.title_city))
	 AND sc.City = city.title_city) AS SwimmingClubID,
	p.firstname                     AS FirstName,
	p.lastname                      AS LastName,
	p.birth_year                    AS YearOfBirth,
	g.title_gender                  AS Gender
FROM swimming_competitions.dbo.person AS p
JOIN swimming_competitions.dbo.city AS city ON p.city_id = city.city_id
LEFT JOIN swimming_competitions.dbo.club AS club ON p.club_id = club.club_id
JOIN swimming_competitions.dbo.gender AS g ON p.gender_id = g.gender_id

GO