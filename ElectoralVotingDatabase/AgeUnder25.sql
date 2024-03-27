USE ElectoralVotingDatabase
SELECT
divisionId
      ,seat
      ,voters
      ,rejected
  FROM Division
WHERE divisionId = 'A1' or divisionId = 'C1'
