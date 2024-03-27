USE ElectoralVotingDatabase
GO

/* 	Be sure IDENTITY_INSERT is OFF for all tables. 								*/

SET IDENTITY_INSERT dbo.Party OFF
SET IDENTITY_INSERT dbo.Division OFF
SET IDENTITY_INSERT dbo.Candidacy OFF
SET IDENTITY_INSERT dbo.Candidate OFF


/********************************************************************************/			

/*	INSERT data for Party													*/

/*	Set IDENTITY_INSERT to ON for Party. 									*/
/*	reset it to OFF after Party data is inserted.							*/

SET IDENTITY_INSERT dbo.Party ON

INSERT INTO Party
	(PartyID, abbreviation, PartyName,  yearFormed)
	VALUES (
	1, 'JPP', 'Justice Progress Party', 1957);

INSERT INTO Party
	(PartyID, abbreviation, PartyName,  yearFormed)
	VALUES (
	2, 'OPP', 'One People Party', 1954);

INSERT INTO Party
	(PartyID,abbreviation, PartyName,  yearFormed)
	VALUES (
	3, 'TWP', 'Together We Party', 2020);

SET IDENTITY_INSERT dbo.Party OFF

/********************************************************************************/			

/*	INSERT data for Division														*/

/*	Set IDENTITY_INSERT to ON for Division. 										*/
/*	reset it to OFF after Division data is inserted.								*/

SET IDENTITY_INSERT dbo.Division ON

INSERT INTO Division
	(SerialNoDivision, divisionId, seat, voters, rejected)
	VALUES (
	1, 'A1', 2, 81232, 540);
INSERT INTO Division
	(SerialNoDivision, divisionId, seat, voters, rejected)
	VALUES (
	2, 'A2', 1, 31294, 491);
INSERT INTO Division
	(SerialNoDivision, divisionId, seat, voters, rejected)
	VALUES (
	3, 'B1', 1, 29192, 325);
INSERT INTO Division
	(SerialNoDivision, divisionId, seat, voters, rejected)
	VALUES (
	4, 'C1', 3, 129821, 738)
SET IDENTITY_INSERT dbo.Division OFF
/********************************************************************************/
		
/*	INSERT data for Candidacy														*/

/*	Set IDENTITY_INSERT to ON for Candidacy. 										*/
/*	reset it to OFF after Candidacy data is inserted.								*/

SET IDENTITY_INSERT dbo.Candidacy ON

INSERT INTO Candidacy (candidacyId, divisionId, votesObtained, sampleVotesPer100)
	VALUES (
	1, 'A1',52551, 65);
INSERT INTO Candidacy (candidacyId, divisionId, votesObtained, sampleVotesPer100)
	VALUES (
	2, 'A1',27112, 35);
INSERT INTO Candidacy (candidacyId, divisionId, votesObtained, sampleVotesPer100)
	VALUES (
	3, 'A2',12541, 40);
INSERT INTO Candidacy (candidacyId, divisionId, votesObtained, sampleVotesPer100)
	VALUES (
	4, 'A2',18252, 60);
INSERT INTO Candidacy (candidacyId, divisionId, votesObtained, sampleVotesPer100)
	VALUES (
	5, 'B1',14002, 49);
INSERT INTO Candidacy (candidacyId, divisionId, votesObtained, sampleVotesPer100)
	VALUES (
	6, 'B1',4324, 14);
INSERT INTO Candidacy (candidacyId, divisionId, votesObtained, sampleVotesPer100)
	VALUES (
	7, 'B1',9324, 37);
INSERT INTO Candidacy (candidacyId, divisionId, votesObtained, sampleVotesPer100)
	VALUES (
	8, 'C1',59482, 45);
INSERT INTO Candidacy (candidacyId, divisionId, votesObtained, sampleVotesPer100)
	VALUES (
	9, 'C1',69518, 55)
SET IDENTITY_INSERT dbo.Candidacy OFF

/********************************************************************************/			

/*	INSERT data for Candidate														*/

/*	Set IDENTITY_INSERT to ON for Candidate. 										*/
/*	reset it to OFF after Candidate data is inserted.								*/

SET IDENTITY_INSERT dbo.Candidate ON

INSERT INTO Candidate (CandidateID, id, name, dateOfBirth,
	candidacyId, party)
 	VALUES (
	1,'A1111111A', 'Mohamed Faisal', '1990-01-01', 1, 'OPP');
INSERT INTO Candidate (CandidateID, id, name, dateOfBirth,
	candidacyId, party)
 	VALUES (
	2,'A1111112A', 'Chia Hon Huat', '1999-07-16', 1, 'OPP');
INSERT INTO Candidate (CandidateID, id, name, dateOfBirth,
	candidacyId, party)
 	VALUES (
	3,'A1111113A', 'Nurul Ahmad', '1955-02-06', 2, 'TWP');
INSERT INTO Candidate (CandidateID, id, name, dateOfBirth,
	candidacyId, party)
 	VALUES (
	4,'A1111114A', 'Tan Chin Siong', '1960-03-12', 2, 'TWP');
INSERT INTO Candidate (CandidateID, id, name, dateOfBirth,
	candidacyId, party)
 	VALUES (
	5,'A2222221A', 'Peter Thiagu', '1970-04-17', 3, 'OPP');
INSERT INTO Candidate (CandidateID, id, name, dateOfBirth,
	candidacyId, party)
 	VALUES (
	6,'A2222222A', 'Ravi Pillay', '1973-05-19', 4, 'JPP');
INSERT INTO Candidate (CandidateID, id, name, dateOfBirth,
	candidacyId, party)
 	VALUES (
	7,'B1111111B', 'Goh Hong Hui', '1965-08-09', 5, 'OPP');
INSERT INTO Candidate (CandidateID, id, name, dateOfBirth,
	candidacyId, party)
 	VALUES (
	8,'B1111112B', 'Koh Li Choo', '1969-09-23', 6, 'JPP');
INSERT INTO Candidate (CandidateID, id, name, dateOfBirth,
	candidacyId, party)
 	VALUES (
	9,'B1111113B', 'Ng Tiong Keng', '1958-10-30', 7, 'TWP');
INSERT INTO Candidate (CandidateID, id, name, dateOfBirth,
	candidacyId, party)
 	VALUES (
	10,'C1111111C', 'Mohamed Azhar', '1984-11-01', 8, 'OPP');
INSERT INTO Candidate (CandidateID, id, name, dateOfBirth,
	candidacyId, party)
 	VALUES (
	11,'C1111112C', 'Loganathan', '1997-07-07', 8, 'OPP');
INSERT INTO Candidate (CandidateID, id, name, dateOfBirth,
	candidacyId, party)
 	VALUES (
	12,'C1111113C', 'Kelvin Ong', '1995-04-17', 8, 'OPP');
INSERT INTO Candidate (CandidateID, id, name, dateOfBirth,
	candidacyId, party)
 	VALUES (
	13,'C1111114C', 'Vigneswari Menon', '1992-03-26', 9, 'JPP');
INSERT INTO Candidate (CandidateID, id, name, dateOfBirth,
	candidacyId, party)
 	VALUES (
	14,'C1111115C', 'Lee Wei Zhong', '1994-02-04', 9, 'JPP');
INSERT INTO Candidate (CandidateID, id, name, dateOfBirth,
	candidacyId, party)
 	VALUES (
	15,'C1111117C', 'Abirami Raj', '1991-01-19', 9, 'JPP');

SET IDENTITY_INSERT dbo.Candidate OFF

/********************************************************************************/
