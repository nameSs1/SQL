

-- data migration from swimming_competitions into just_like_others
-- insert into Result


	WITH CTE_result AS 
(
	SELECT 
		(SELECT sc.SwimmingClubID 
		 FROM just_like_others.dbo.SwimmingClub AS sc
		 WHERE sc.[Name] = (IIF(club.title_club IS NOT NULL, club.title_club, city.title_city))
		 AND sc.City = city.title_city) AS SwimmingClubID,
		p.firstname                     AS FirstName,
		p.lastname                      AS LastName,
		p.birth_year                    AS YearOfBirth,
		g.title_gender                  AS Gender,
		r.result_id                     AS result_id,
		r.competition_id                AS competition_id,
		[time]                          AS [Time]
	FROM swimming_competitions.dbo.result AS r 
	JOIN swimming_competitions.dbo.person AS p ON r.person_id = p.person_id
	JOIN swimming_competitions.dbo.city AS city ON p.city_id = city.city_id
	LEFT JOIN swimming_competitions.dbo.club AS club ON p.club_id = club.club_id
	JOIN swimming_competitions.dbo.gender AS g ON p.gender_id = g.gender_id
),
	CTE_competitions AS 
(
	SELECT c.birth_year     AS GroupName,
		   c.distance       AS Distance,
		   s.title_style    AS Style,
		   city.title_city  AS EventCity,
		   e.title_event    AS EventName,
		   c.competition_id AS competition_id
	FROM swimming_competitions.dbo.competition AS c
	JOIN swimming_competitions.dbo.gender      AS g    ON c.gender_id = g.gender_id
	JOIN swimming_competitions.dbo.style       AS s    ON c.style_id = s.style_id
	JOIN swimming_competitions.dbo.[event]     AS e    ON c.event_id = e.event_id
	LEFT JOIN swimming_competitions.dbo.city   AS city ON e.city_id = city.city_id
),
	CTE_total AS 
(
	SELECT r.[Time],
		  (SELECT SwimmerID FROM just_like_others.dbo.Swimmer AS s 
			   WHERE s.SwimmingClubID = r.SwimmingClubID AND 
					 s.FirstName = r.FirstName AND 
					 s.LastName = r.LastName AND 
					 s.YearOfBirth = r.YearOfBirth AND 
					 s.Gender = r.Gender) AS SwimmerID,
		  (SELECT GroupID FROM just_like_others.dbo.[Group] AS g
				WHERE g.[Name] = c.GroupName AND g.Gender = r.Gender) AS GroupID,
		  (SELECT DisciplineID FROM just_like_others.dbo.Discipline AS d 
				WHERE d.Distance = c.Distance AND d.Style = c.Style) AS DisciplineID,
		  (SELECT PoolID FROM just_like_others.dbo.[Pool] AS p 
				WHERE p.City = c.EventCity AND p.[Name] = c.EventName) AS PoolID
	FROM CTE_result AS r 
	JOIN CTE_competitions AS c ON r.competition_id = c.competition_id
)

INSERT just_like_others.dbo.Result ([Time], SwimmerID, CompetitionID)
SELECT [Time], SwimmerID, 
	   (SELECT CompetitionID FROM just_like_others.dbo.Competition AS c
			WHERE c.GroupID = t.GroupID AND 
				  c.DisciplineID = t.DisciplineID AND 
				  c.PoolID = t.PoolID) AS CompetitionID
FROM CTE_total AS t
WHERE [Time] IS NOT NULL
