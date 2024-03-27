create trigger checkSeatsLimit on Candidate
	instead of insert
	as
	BEGIN
	Declare 
		@CandidcyID int
	/* First check Candidate Table to see which CandidacyID is present*/
	DECLARE @CandidateCandidacyID int, @NumberofIdsFound int;  /*Declare Variables for Cursor to Fetch Into later*/
	select @CandidcyID = candidacyId from inserted
	Declare contact_cursor Cursor FOR
	SELECT   candidacyID,
			 count(*) AS dupe_cnt			/*Counts the Number of Candidates with the same Candidacy for Comparison later*/
	FROM     Candidate
	where candidacyId = @CandidcyID
	GROUP BY candidacyID
	OPEN contact_cursor;
	Fetch Next From contact_cursor							/*Fetching into Cursor*/
	into @CandidateCandidacyID, @NumberofIdsFound; /*Save the matching Candidacy as while as the number of current Ids found to variables to use later*/
	close contact_cursor
	Deallocate contact_cursor;
		Begin
		if @CandidcyID = 1 or @CandidcyID = 2 and @NumberofIdsFound >= 2  /*if candidacy ID is 1 or 2 and Candidate already has more than 2 candidates in candidacy */
			begin
				print 'Too many Candidates in Candidacy ' +cast(@CandidcyID as varchar)
				print 'Please ensure number of Candidates in a Candidacy do not exceed seats in a division the candidacy is for.'
				return
			end
		if @CandidcyID = 8 or @CandidcyID = 9 and @NumberofIdsFound >= 3 /*if candidacy ID is 8 or 9 and Candidate already has more than 3 candidates in candidacy */
			begin
				print 'Too many Candidates in Candidacy ' +cast(@CandidcyID as varchar)
				print 'Please ensure number of Candidates in a Candidacy do not exceed seats in a division the candidacy is for.'
				return
			end
		if (@CandidcyID between 3 and 7) and @NumberofIdsFound >= 1 /*if candidacy ID is between 3 and 7 and Candidate already has more than 1 candidates in candidacy */
			begin
		 		print 'Too many Candidates in Candidacy ' +cast(@CandidcyID as varchar)
				print 'Please ensure number of Candidates in a Candidacy do not exceed seats in a division the candidacy is for.'
				return
			end
		else /* Else insert the New Candidate's data into the table*/
			begin
				SET IDENTITY_INSERT dbo.Candidate ON;
				insert into Candidate(CandidateID, id, name, dateOfBirth,candidacyId, party) 
				select CandidateID, id, name, dateOfBirth,candidacyId, party
				from inserted;
				SET IDENTITY_INSERT dbo.Candidate OFF;
				print 'Insert is Successful' 
			end
		End
	END



















