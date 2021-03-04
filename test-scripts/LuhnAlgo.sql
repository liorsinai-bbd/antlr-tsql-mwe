CREATE FUNCTION [dbo].[udfLuhnAlgo]
(
	@ID varchar (13)
)
RETURNS int
AS
BEGIN
	DECLARE @even int;
	DECLARE @odd int;

	SET @even = ( 
		dbo.udfDoubleDigitSum(CAST(SUBSTRING(@ID, 2, 1) AS INT))
	+   dbo.udfDoubleDigitSum(CAST(SUBSTRING(@ID, 4, 1) AS INT))
	+   dbo.udfDoubleDigitSum(CAST(SUBSTRING(@ID, 6, 1) AS INT))
	+   dbo.udfDoubleDigitSum(CAST(SUBSTRING(@ID, 8, 1) AS INT))
	+   dbo.udfDoubleDigitSum(CAST(SUBSTRING(@ID, 10, 1) AS INT))
	+   dbo.udfDoubleDigitSum(CAST(SUBSTRING(@ID, 12, 1) AS INT))
	)

	SET @odd = ( 
		CAST(SUBSTRING(@ID, 1, 1) AS INT) 
	+ 	CAST(SUBSTRING(@ID, 3, 1) AS INT) 
	+ 	CAST(SUBSTRING(@ID, 5, 1) AS INT) 
	+ 	CAST(SUBSTRING(@ID, 7, 1) AS INT) 
	+ 	CAST(SUBSTRING(@ID, 9, 1) AS INT) 
	+ 	CAST(SUBSTRING(@ID, 11, 1) AS INT) 
	+ 	CAST(SUBSTRING(@ID, 13, 1) AS INT) 
	)


	RETURN CASE WHEN ((@odd + @even) % 10 = 0) THEN 1 ELSE 0 END
END