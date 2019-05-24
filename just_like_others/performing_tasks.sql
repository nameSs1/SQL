
-- Выполнение задач for just_like_others


--  Выводит спортсменов которые участвовали в обоих соревнованиях

WITH CTE_Result AS 
(
	SELECT SwimmerID, CompetitionID FROM dbo.Result
	UNION SELECT SwimmerID, CompetitionID FROM  dbo.Disqualification
),
	CTE_TwoPool AS
(
	SELECT r.SwimmerID, COUNT(DISTINCT c.PoolID) [Count]
	FROM CTE_Result AS r
	JOIN Competition AS c ON r.CompetitionID = c.CompetitionID
	GROUP BY r.SwimmerID
)

SELECT s.FirstName, s.LastName, s.YearOfBirth, s.Gender
FROM CTE_TwoPool AS t 
JOIN dbo.Swimmer AS s ON t.SwimmerID = s.SwimmerID AND t.[Count] = 2

--2.1 каждое имя сколько раз встречается среди спортсменов

SELECT FirstName, COUNT(FirstName) CountName
FROM dbo.Swimmer
GROUP BY FirstName
ORDER BY CountName DESC

--2.2. сколько медалей у каждого из спортсменов в нашей базе данных/файле

WITH CTE_Result AS 
(
	SELECT SwimmerId, ROW_NUMBER() OVER (PARTITION BY CompetitionID ORDER BY [Time]) Place
	FROM dbo.Result
)

SELECT s.FirstName, s.LastName, s.Gender, s.YearOfBirth, 
	   SUM(IIF(Place IN (1,2,3), 1,0)) AS CountMedals
FROM CTE_Result AS r
JOIN Swimmer AS s ON r.SwimmerID = s.SwimmerID
GROUP BY s.FirstName, s.LastName, s.Gender, s.YearOfBirth 
ORDER BY CountMedals DESC

-- 3.1 вывести ВСЕХ спорсменов, лучший результат для них и стиль плавания/дистанцию на которой этот лучший результат был получен

WITH CTE_Result AS 
(
	SELECT SwimmerId, [Time], CompetitionID, 
		   ROW_NUMBER() OVER (PARTITION BY CompetitionID ORDER BY [Time]) Place
	FROM dbo.Result
),
	CTE_Best AS 
(
	SELECT SwimmerId, MIN(Place) BestResult
	FROM CTE_Result
	GROUP BY SwimmerId
)

SELECT s.FirstName, s.LastName, s.Gender, s.YearOfBirth, b.BestResult, r.[Time], dis.Style, dis.Distance
FROM dbo.Swimmer AS s 
LEFT JOIN CTE_Best AS b ON s.SwimmerID = b.SwimmerID
LEFT JOIN dbo.Disqualification AS d ON s.SwimmerID = d.SwimmerID AND 
	(SELECT SwimmerID FROM CTE_Best WHERE SwimmerID = s.SwimmerID) IS NULL
LEFT JOIN CTE_Result AS r ON s.SwimmerID =r.SwimmerID AND r.Place = b.BestResult
LEFT JOIN dbo.Competition AS c ON r.CompetitionID = c.CompetitionID OR d.CompetitionID = c.CompetitionID
LEFT JOIN dbo.Discipline AS dis ON c.DisciplineID = dis.DisciplineID
ORDER BY IIF(BestResult IS NULL, 1, 0), b.BestResult
