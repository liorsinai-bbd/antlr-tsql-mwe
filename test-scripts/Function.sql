CREATE FUNCTION [dbo].[udfAverageActorAge]
(
	@MovieID int
)
RETURNS int
AS
BEGIN
	DECLARE @AvgAge int

	SELECT @AvgAge = AVG(Age) FROM Actors
	WHERE MovieID = @MovieID

	RETURN @AvgAge
END

GO