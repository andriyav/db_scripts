  CREATE TABLE Leagues (
    LeagueId      		SERIAL PRIMARY KEY,
    TeamsId				INTEGER,
    LeagueName 		VARCHAR(20) NOT NULL,
    Description	 		VARCHAR(50),
    CreatedAt			TIMESTAMP,
    UpdatedAT			TIMESTAMP,
    Enabled 			BOOL
   );


CREATE TABLE Teams (
    TeamId      		SERIAL PRIMARY KEY,
    LeagueId			INTEGER,
    Team_name 			VARCHAR(20) NOT NULL,
    Description	 		VARCHAR(50),
    CreatedAt			TIMESTAMP,
    UpdatedAT			TIMESTAMP,
    Enabled 			BOOL,
    CONSTRAINT fk_Leagues_Teams
        FOREIGN KEY(LeagueId)
        REFERENCES Leagues(LeagueId)
   );



   CREATE TABLE Games (
    GameId      		SERIAL PRIMARY KEY,
    HomeTeamId			INTEGER,
    AwayTeamId			INTEGER,
    LeagueId			INTEGER,
    ArticleId 			INTEGER,
    GameTime 			TIMESTAMP,
    CreatedAt			DATE,
    UpdatedAT			DATE,
    Enabled 			BOOL,
    CONSTRAINT fk_HomeTeam_Team
        FOREIGN KEY(HomeTeamId)
        REFERENCES Teams(TeamId),

    CONSTRAINT fk_AwayTeam_Team
        FOREIGN KEY(AwayTeamId)
        REFERENCES Teams(TeamId),

    CONSTRAINT fk_Games_Leagues
        FOREIGN KEY(LeagueId)
        REFERENCES Leagues(LeagueId)
   );


    CREATE TABLE Events (
    EventID      		SERIAL PRIMARY KEY,
    GameId				INTEGER NOT NULL,
    Description	 		TEXT,
    EventTime			TIMESTAMP,
    CreatedAt			TIMESTAMP,
    UpdatedAT			TIMESTAMP,
    Enabled 			BOOL,
    CONSTRAINT fk_Events_Games
        FOREIGN KEY(GameId)
        REFERENCES Games(GameId)
   );


    CREATE TABLE Users (
    UserID       		SERIAL PRIMARY KEY,
    FirstName			VARCHAR(20),
    LastName			VARCHAR(20),
    Email 				VARCHAR(20) UNIQUE NOT null,
    Username			VARCHAR(20) UNIQUE NOT NULL,
    Password			VARCHAR(20) UNIQUE NOT NULL,
    CreatedAt			TIMESTAMP,
    UpdatedAT			TIMESTAMP,
    Enabled 			BOOL
   );


CREATE TABLE Articles (
    ArticleId      		SERIAL PRIMARY KEY,
    Title				VARCHAR(50) UNIQUE NOT null,
    Content 			TEXT NOT NULL,
    LeagueId      		INTEGER,
    TeamId				INTEGER,
    CreatedAt			DATE,
    UpdatedAT			DATE,

 	CONSTRAINT fk_Articles_Teams
        FOREIGN KEY(TeamId)
        REFERENCES Teams(TeamId),

    CONSTRAINT fk_Articles_Leagues
        FOREIGN KEY(LeagueId)
        REFERENCES Leagues(LeagueId)

   );


  CREATE TABLE ArticleViews (
   	ArticleViewID      SERIAL PRIMARY KEY,
    UserID       		INTEGER NOT NULL,
    ArticleId 			INTEGER,
    ViewTime 			TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_ArticleViews_Users
        FOREIGN KEY(UserID)
        REFERENCES Users(UserID),

    CONSTRAINT fk_ArticleViews_Article
        FOREIGN KEY(ArticleId)
        REFERENCES Articles(ArticleId)
   );


    CREATE TABLE Comments (
   	CommentID      		SERIAL PRIMARY KEY,
    UserID       		INTEGER,
    ArticleId 			INTEGER,
    ViewsNambers 		INTEGER,
    CommentText			TEXT NOT NULL,
    CommentedAt 		TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_Comments_Users
        FOREIGN KEY(UserID)
        REFERENCES Users(UserID),

    CONSTRAINT fk_Comments_Article
        FOREIGN KEY(ArticleId)
        REFERENCES Articles(ArticleId)
   );

  CREATE TABLE Advertisements (
    AdId 		SERIAL PRIMARY KEY,
    AdContent 	TEXT NOT NULL
);


CREATE TABLE Media (
    MediaId 		SERIAL PRIMARY KEY,
    MediaUrl 		TEXT NOT NULL,
    MediaType 		VARCHAR(50) NOT NULL
);


 CREATE TABLE ArticleMedia (
 	ArticleMediaId  SERIAL PRIMARY key,
    ArticleId 	INT NOT NULL,
    MediaId 	INT NOT NULL,

 CONSTRAINT fk_ArticleMedia_Articles
    FOREIGN KEY (ArticleId)
    REFERENCES Articles (ArticleId),

 CONSTRAINT fk_ArticleMedia_Media
    FOREIGN KEY (MediaId)
    REFERENCES Media (MediaId)
);


  CREATE TABLE TeamMedia (
  	TeamMedia  SERIAL PRIMARY key,
    TeamId 		INT NOT NULL,
    MediaId 	INT NOT NULL,


  CONSTRAINT fk_TeamMedia_Team
    FOREIGN KEY (TeamId)
    REFERENCES Teams (TeamId),

  CONSTRAINT fk_TeamMedia_Media
    FOREIGN KEY (MediaId)
    REFERENCES Media (MediaId)
);

  CREATE TABLE LeagueMedia (
  	TeamMedia   SERIAL PRIMARY key,
    LeagueId 	INT NOT NULL,
    MediaId 	INT NOT NULL,

  CONSTRAINT fk_LeagueMedia_League
    FOREIGN KEY (LeagueId)
    REFERENCES Leagues (LeagueId),

  CONSTRAINT fk_LeagueMedia_Media
    FOREIGN KEY (MediaId)
    REFERENCES Media (MediaId)
);


CREATE TABLE GameMedia (
	GameMedia   	SERIAL PRIMARY key,
    GameId 			INT NOT NULL,
    MediaId 		INT NOT NULL,
CONSTRAINT fk_GameMedia_Game
    FOREIGN KEY (GameId)
    REFERENCES Games (GameId),

CONSTRAINT fk_GameMedia_Media
    FOREIGN KEY (MediaId)
    REFERENCES Media (MediaId)
);


CREATE TABLE AdvertisementTeams (
	AdTeamId   	SERIAL PRIMARY key,
    AdId 		INT NOT NULL,
    TeamId 		INT NOT NULL,

CONSTRAINT fk_AdvertisementTeams_Ad
    FOREIGN KEY (AdId)
    REFERENCES Advertisements (AdId),

CONSTRAINT fk_AdvertisementTeams_Team
    FOREIGN KEY (TeamId)
    REFERENCES Teams (TeamId)
);


CREATE TABLE AdvertisementLeagues (
	AdLeagueId	    SERIAL PRIMARY key,
    AdId		 	INT NOT NULL,
    LeagueId 		INT NOT NULL,

CONSTRAINT AdvertisementLeagues_Ad
    FOREIGN KEY (AdId)
    REFERENCES Advertisements (AdId),

CONSTRAINT AdvertisementLeagues_League
    FOREIGN KEY (LeagueId)
    REFERENCES Leagues (LeagueId)
);

