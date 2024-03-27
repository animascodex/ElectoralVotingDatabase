USE ElectoralVotingDatabase
Go
CREATE TABLE Party (
	PartyID				Int				NOT NULL IDENTITY(1,1),
	abbreviation 		Char(3) 		NOT NULL,
	PartyName			Char(25)		NOT NULL,
	yearFormed			Int				NOT NULL,
	CONSTRAINT 	PartyIDPK			PRIMARY KEY(PartyID),
	CONSTRAINT  PartyIDAK1			UNIQUE(abbreviation),
	CONSTRAINT  abbreviation_Length_Check	CHECK (LEN(abbreviation) = 3),
	CONSTRAINT	ValidyearFormed			CHECK (yearFormed between 1954 and 2020),
	);
	
CREATE TABLE Division (
	SerialNoDivision	Int				NOT NULL IDENTITY(1,1),
	divisionId 			Varchar(2) 		NOT NULL,
	seat 				Int 			NOT NULL,
	voters 				Int				NOT NULL,
	rejected 			Int 			NOT NULL
	CONSTRAINT SerialNoDivisionPK		PRIMARY KEY (SerialNoDivision),
	CONSTRAINT SerialNoDivisionAK1		UNIQUE(divisionId),
	CONSTRAINT ValiddivisionID			CHECK (divisionId like '[A-Z][0-9]'),
	CONSTRAINT Validseat				CHECK (seat like '[1-6]'),
	CONSTRAINT VotersRange				CHECK (voters >=10000),
	);

CREATE TABLE Candidacy (
	candidacyId 		Int 			NOT NULL IDENTITY(1,1),
	divisionId 			Varchar(2) 		NOT NULL,
	votesObtained 		Int 			NOT NULL,	
	sampleVotesPer100	Int			 	NOT NULL,
	CONSTRAINT 	candidacyIdPK		PRIMARY KEY(candidacyId),
	CONSTRAINT	CandidacyDivisionFK	FOREIGN KEY(divisionId)
						REFERENCES Division(divisionId)
							ON UPDATE CASCADE
							ON DELETE CASCADE
	);

CREATE TABLE Candidate (
	CandidateID			Int				NOT NULL IDENTITY(1,1),
	id					Varchar(9) 		NOT NULL,
	name 				char(30)		NOT NULL, 
	dateOfBirth			Date			NOT NULL,
	candidacyId			Int				NOT NULL,
	party				Char(3)			NULL,

	CONSTRAINT 	CandidateIDPK		PRIMARY KEY(CandidateID),
	CONSTRAINT  CandidateIDAK1		UNIQUE(id),
	CONSTRAINT  id_Length_Check		CHECK(LEN(id) = 9),
	CONSTRAINT  id_Format_Check		CHECK(id like '[A-Z][0-9][0-9][0-9][0-9][0-9][0-9][0-9][A-Z]'),
	CONSTRAINT  dateOfBirth_Check	CHECK(dbo.getAge(dateOfBirth, Getdate()) >=21),
	CONSTRAINT 	CandidatecandidacyFK	FOREIGN KEY(candidacyId)
						REFERENCES Candidacy(candidacyId)
 							ON UPDATE CASCADE
							ON DELETE NO ACTION,
	CONSTRAINT 	CandidatepartyFK FOREIGN KEY(party)
						REFERENCES Party(abbreviation)
 							ON UPDATE CASCADE
							ON DELETE SET NULL,
	);
