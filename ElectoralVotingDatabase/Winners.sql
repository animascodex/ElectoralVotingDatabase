create view winners 
AS
SELECT
divisionID, seat, party = CASE WHEN divisionID = 'A1' or divisionId = 'B1' THEN 'OPP'
					ELSE 'JPP'
					END
FROM Division
