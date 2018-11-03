CREATE SCHEMA Music; 
GO

CREATE TABLE Music.Artist ( 
	ArtistId int NOT NULL, 
	Name varchar(60) NOT NULL, 
	CONSTRAINT PKMusic_Artist PRIMARY KEY CLUSTERED (ArtistId), 
	CONSTRAINT PKMusic_Artist_Name UNIQUE NONCLUSTERED (Name) 
);

CREATE TABLE Music.Publisher ( 
	PublisherId int NOT NULL PRIMARY KEY,
	Name varchar(20) NOT NULL, 
	CatalogNumberMask varchar(100) NOT NULL CONSTRAINT DﬂtMusic_Publisher_CatalogNumberMask DEFAULT ('%'), 
	CONSTRAINT AKMusic_Publisher_Name UNIQUE NONCLUSTERED (Name)
);


CREATE TABLE Music.Album 
(
	AlbumId int NOT NULL, 
	Name varchar(60) NOT NULL, 
	ArtistId int NOT NULL,

	CatalogNumber varchar(20) NOT NULL, 
	PublisherId int NOT NULL --not requiring this information
	
	CONSTRAINT PKMusic_Album PRIMARY KEY CLUSTERED(AlbumId), 
	CONSTRAINT AKMusic_Album_Name UNIQUE NONCLUSTERED (Name), 
	CONSTRAINT FKMusic_Artist$records$Music_Album   
		FOREIGN KEY (ArtistId) REFERENCES Music.Artist(ArtistId), 
	CONSTRAINT FKMusic_Publisher$published$Music_Album   
		FOREIGN KEY (PublisherId) REFERENCES Music.Publisher(PublisherId) 
);

