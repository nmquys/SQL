CREATE SCHEMA Csdl_BongDa;

-- Switch to the schema Csdl_Bongda before creating tables

-- Create STADIUM table
CREATE TABLE STADIUM (
	City VARCHAR(20),
	StadName VARCHAR(20) NOT NULL,
	Capacity INT,
	Postal INT,
	CONSTRAINT PK_STADIUM PRIMARY KEY (StadName)
);

-- Create CONTRACT table
CREATE TABLE CONTRACT (
	ContractID INT NOT NULL,
	Employer VARCHAR(20),
	StartDate DATE,
	EndDate DATE,
	Salary INT,
	CONSTRAINT PK_CONTRACT PRIMARY KEY (ContractID)
);

-- Create TEAM table
CREATE TABLE TEAM (
	TeamName VARCHAR(20) NOT NULL,
	Abbr VARCHAR(3),
	Website VARCHAR(30),
	City VARCHAR(20),
	Points INT,
	CONSTRAINT PK_TEAM PRIMARY KEY (TeamName)
);

-- Create MANAGER table
CREATE TABLE MANAGER (
	ManagerID INT NOT NULL,
	Fname VARCHAR(10),
	Mname VARCHAR(10),
	Lname VARCHAR(10),
	BirthDay DATE,
	PhoneNo CHAR(10),
	TeamName VARCHAR(20),
	ContractID INT,
	CONSTRAINT PK_MANAGER PRIMARY KEY (ManagerID),
	CONSTRAINT FK_MANAGER_TEAM FOREIGN KEY (TeamName) REFERENCES TEAM(TeamName),
	CONSTRAINT FK_MANAGER_CONTRACT FOREIGN KEY (ContractID) REFERENCES CONTRACT(ContractID)
);

-- Create COACH table
CREATE TABLE COACH (
	CoachID INT NOT NULL,
	Fname VARCHAR(10),
	Mname VARCHAR(10),
	Lname VARCHAR(10),
	BirthDay DATE,
	PhoneNo CHAR(10),
	Type VARCHAR(10),
	TeamName VARCHAR(20),
	ContractID INT,
	CONSTRAINT PK_COACH PRIMARY KEY (CoachID),
	CONSTRAINT FK_COACH_TEAM FOREIGN KEY (TeamName) REFERENCES TEAM(TeamName),
	CONSTRAINT FK_COACH_CONTRACT FOREIGN KEY (ContractID) REFERENCES CONTRACT(ContractID)
);

-- Create PLAYER table
CREATE TABLE PLAYER (
	PlayerID INT NOT NULL,
	Fname VARCHAR(20),
	Mname VARCHAR(20),
	Lname VARCHAR(20),
	BirthDay DATE,
	Position VARCHAR(10),
	Weight INT,
	Height DECIMAL(2,1),
	Nationality VARCHAR(20),
	KitNumber INT,
	TeamName VARCHAR(20),
	ContractID INT,
	CONSTRAINT PK_PLAYER PRIMARY KEY (PlayerID),
	CONSTRAINT FK_PLAYER_TEAM FOREIGN KEY (TeamName) REFERENCES TEAM(TeamName),
	CONSTRAINT FK_PLAYER_CONTRACT FOREIGN KEY (ContractID) REFERENCES CONTRACT(ContractID)	
);

-- Create REFEREE table
CREATE TABLE REFEREE (
	RefereeID INT NOT NULL,
	Fname VARCHAR(10),
	Mname VARCHAR(10),
	Lname VARCHAR(10),
	BirthDay DATE,
	PhoneNo CHAR(10),
	ContractID INT,
	CONSTRAINT PK_REFEREE PRIMARY KEY (RefereeID),
	CONSTRAINT FK_REFEREE_CONTRACT FOREIGN KEY (ContractID) REFERENCES CONTRACT (ContractID)
);

-- Create GAME table
CREATE TABLE GAME (
	GameID INT NOT NULL,
	MDate DATE,
	MTime TIME,
	Result VARCHAR(10),
	HomeTeam VARCHAR(20),
	AwayTeam VARCHAR(20),
	StadName VARCHAR(20),
	TempDeg INT,
	PrecipPercent INT,
	HumidPercent INT,
	CONSTRAINT PK_GAME PRIMARY KEY (GameID),
	CONSTRAINT FK_GAME_HOMETEAM FOREIGN KEY (HomeTeam) REFERENCES TEAM(TeamName),
	CONSTRAINT FK_GAME_AWAYTEAM FOREIGN KEY (AwayTeam) REFERENCES TEAM(TeamName),
	CONSTRAINT FK_GAME_STADIUM FOREIGN KEY (StadName) REFERENCES STADIUM(StadName)
);

-- Create PLAYSIN table
CREATE TABLE PLAYSIN (
	GameID INT NOT NULL,
	PlayerID INT NOT NULL,
	CONSTRAINT PK_PLAYSIN PRIMARY KEY (GameID, PlayerID),
	CONSTRAINT FK_PLAYSIN_MATHCT FOREIGN KEY (GameID) REFERENCES GAME(GameID),
	CONSTRAINT FK_PLAYSIN_PLAYER FOREIGN KEY (PlayerID) REFERENCES PLAYER(PlayerID)
);

-- Create OFFICIATES table
CREATE TABLE OFFICIATES (
	GameID INT NOT NULL,
	RefereeID INT NOT NULL,
	CONSTRAINT PK_OFFICIATES PRIMARY KEY (GameID, RefereeID),
	CONSTRAINT FK_OFFICIATES_MATHCH FOREIGN KEY (GameID) REFERENCES GAME(GameID),
	CONSTRAINT FK_OFFICIATES_REFEREE FOREIGN KEY (RefereeID) REFERENCES REFEREE(RefereeID)
);

-- Create STATS table
CREATE TABLE STATS (
	PlayerID INT NOT NULL,
	RedCards INT,
	YellowCards INT,
	Goals INT,
	Assists INT,
	Cleansheets INT,
	CONSTRAINT PK PRIMARY KEY (PlayerID),
	CONSTRAINT FK_STATS_PLAYER FOREIGN KEY (PlayerID) REFERENCES PLAYER(PlayerID)
);

-- Create GOAL table
CREATE TABLE GOAL (
	GoalID INT NOT NULL,
	GTime VARCHAR(10),
	PlayerID INT,
	CONSTRAINT PK_GOAL PRIMARY KEY (GoalID),
	CONSTRAINT FK_GOAL_PLAYER FOREIGN KEY (PlayerID) REFERENCES PLAYER(PlayerID)
);