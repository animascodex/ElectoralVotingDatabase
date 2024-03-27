USE ElectoralVotingDatabase
SELECT [id]
      ,[name]
      ,[dateOfBirth]
      ,[candidacyId]
      ,[party],age = dbo.getAge(dateOfBirth, '2020-07-18')
  FROM [ElectoralVotingDatabase].[dbo].[Candidate]
ORDER BY age DESC,party ASC
