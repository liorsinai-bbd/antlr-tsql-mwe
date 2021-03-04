CREATE PROCEDURE [dbo].[uspGetActorInfo]
		@MovieID int ,
		@WriterID int = NULL
AS
SELECT m.MovieName,
		m.ReleaseDate,
		CAST(m.RunningTime / 60 AS varchar(5)) + 'H ' + 
		CAST(m.RunningTime % 60 AS varchar(5)) + 'M' AS MovieLength,
		m.Genre,
		a.FirstName + ' ' + a.LastName AS ActorName,
		DATEDIFF(YEAR, a.BirthDate,GETDATE()) AS ActorAge,
		a.BirthPlace + ', ' + a.CountryOfBirth
FROM Movies m
INNER JOIN Actors a
	ON m.MovieID = a.MovieID
WHERE m.MovieID = @MovieID

IF NOT @WriterID IS NULL
SELECT MovieID,
		FirstName,
		LastName,
		BirthDate,
		BirthPlace,
		CountryOfBirth,
		DATEDIFF(YEAR, BirthDate, GETDATE()) AS 'Age'
FROM Writers
WHERE MovieID = @MovieID
AND WriterID = @WriterID


GO