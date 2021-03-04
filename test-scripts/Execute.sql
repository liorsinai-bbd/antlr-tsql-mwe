-- Declare a variable to return the results of the function. 
DECLARE @avgAge int;   

-- Execute the function while passing a value to the @status parameter
EXEC @avgAge = dbo.[udfAverageActorAge] 
	@MovieID = 2; 

-- View the returned value.  The Execute and Select statements must be executed at the same time.  
SELECT @avgAge; 
