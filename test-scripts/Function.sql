CREATE FUNCTION [dbo].[udfGetActors]
(
	@MovieID int
)
RETURNS TABLE
AS 
RETURN
(
	SELECT MovieID,
		FirstName,
		LastName,
		BirthDate,
		BirthPlace,
		CountryOfBirth,
		DATEDIFF(YEAR, BirthDate, GETDATE()) AS 'Age'
	FROM Actors
	WHERE MovieID = @MovieID
)
;