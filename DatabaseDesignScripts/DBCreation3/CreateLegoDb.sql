CREATE SCHEMA Lego; 
GO
CREATE TABLE Lego.Build ( 
	BuildId int NOT NULL CONSTRAINT PKLegoBuild PRIMARY KEY, 
	Name varchar(30) NOT NULL CONSTRAINT AKLegoBuild_Name UNIQUE, 
	LegoCode varchar(5) NULL, --ﬁve character set number 
	InstructionsURL varchar(255) NULL --where you can get the PDF of the instructions 
);

CREATE TABLE Lego.BuildInstance ( 
	BuildInstanceId Int NOT NULL CONSTRAINT PKLegoBuildInstance PRIMARY KEY , 
	BuildId Int NOT NULL CONSTRAINT FKLegoBuildInstance$isAVersionOf$LegoBuild REFERENCES Lego.Build (BuildId), 
	BuildInstanceName varchar(30) NOT NULL, --brief description of item 
	Notes varchar(1000) NULL, --longform notes. These could describe modiﬁcations 
		--for the instance of the model 
	CONSTRAINT AKLegoBuildInstance UNIQUE(BuildId, BuildInstanceName) 
);

CREATE TABLE Lego.Piece ( 
	PieceId int constraint PKLegoPiece PRIMARY KEY, 
	Type  varchar(15) NOT NULL, 
	Name  varchar(30) NOT NULL, 
	Color varchar(20) NULL, 
	Width int NULL, 
	Length int NULL, 
	Height int NULL, 
	LegoInventoryNumber int NULL, 
	OwnedCount int NOT NULL, 
	CONSTRAINT AKLego_Piece_Deﬁnition UNIQUE (Type,Name,Color,Width,Length,Height), 
	CONSTRAINT AKLego_Piece_LegoInventoryNumber UNIQUE (LegoInventoryNumber) 
);

CREATE TABLE Lego.BuildInstancePiece ( 
	BuildInstanceId int NOT NULL, 
	PieceId int NOT NULL, 
	AssignedCount int NOT NULL, 
	CONSTRAINT PKLegoBuildInstancePiece PRIMARY KEY (BuildInstanceId, PieceId) 
);

