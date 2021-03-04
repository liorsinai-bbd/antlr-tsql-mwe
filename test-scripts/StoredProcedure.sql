/****************************************************************************************************
Stored Procedure - insert Rhino Death, including possible poaching incident
*****************************************************************************************************/
IF OBJECT_ID( '[dbo].[usp_RhinoDeath]', 'P' ) IS NOT NULL   
    DROP PROCEDURE [dbo].[usp_RhinoDeath];  
GO

CREATE PROCEDURE usp_RhinoDeath
(
	@RhinoId int,
	@WasPoached bit,
	@DateOfDeath DATE, 
	@NewPoacher bit = 0,
	@GpsLocation Geography = NULL, 
	@PoacherId int = 1, 
	@IncidentDetials Text = '',
	@NewPoacherName varchar(50) = '',
	@NewPoacherLastName varchar(120) = '',
	@NewPoacherGender varchar(20) = '',
	@NewPoacherHairColour varchar(20) = 'unkown',
	@NewPoacherHairStyle varchar(20) = 'unkown',
	@NewPoacherEthnicity varchar(20) = 'unkown',
	@NewPoacherHeightInCentimetres int = 0
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			UPDATE Rhinos SET DateOfDeath=@DateOfDeath WHERE RhinoID=@RhinoId;
			if (@WasPoached=1)
			BEGIN
				if @NewPoacher = 1
				BEGIN
					INSERT INTO Poachers (FirstName, LastName, Gender, HairColour, HairStyle, Ethnicity, HeightInCentimetres)
						VALUES (@NewPoacherName, @NewPoacherLastName, @NewPoacherGender, @NewPoacherHairColour, 
						@NewPoacherHairStyle, @NewPoacherEthnicity, @NewPoacherHeightInCentimetres)
				END
				INSERT INTO	PoachingIncidents (PoacherID, IncidentDate, GpsLoaction, IncidentDetails, CaseStatus)
					VALUES (@PoacherId, @DateOfDeath, @GpsLocation, @IncidentDetials, 'Ongoing')
			END
		COMMIT TRANSACTION
	END TRY
		BEGIN CATCH
			ROLLBACK TRANSACTION
		END CATCH
END
GO