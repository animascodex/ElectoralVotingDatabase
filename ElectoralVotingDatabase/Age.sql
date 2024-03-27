CREATE FUNCTION [dbo].[getAge]
(
@DateOfBirth datetime, @calculateDate datetime
)
RETURNS int
AS
Begin
	declare @age int
	IF(@DateOfBirth >= @calculateDate)
		RETURN 0
SET @age = DATEDIFF (YY, @DateOfBirth, @calculateDate)
IF	MONTH(@DateOfBirth) > MONTH(@calculateDate) OR 
	(MONTH(@DateOfBirth) = MONTH(@calculateDate) AND 
	DAY( @DateOfBirth) > DAY(@calculateDate))
	SET @age = @age - 1
/* Checks to See if Birthday has passed, if so the Function will return the age - 1*/
RETURN @age
END
