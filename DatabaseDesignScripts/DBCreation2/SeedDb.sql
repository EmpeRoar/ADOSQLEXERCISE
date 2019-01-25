INSERT INTO Music.Publisher (PublisherId, Name, CatalogNumberMask) 
VALUES (1,'Capitol', '[0-9][0-9][0-9]-[0-9][0-9][0-9a-z][0-9a-z][0-9a-z]-[0-9][0-9]'), 
	   (2,'MCA', '[a-z][a-z][0-9][0-9][0-9][0-9][0-9]');

INSERT INTO Music.Artist(ArtistId, Name) 
VALUES (1, 'The Beatles'),(2, 'The Who');

INSERT INTO Music.Album (AlbumId, Name, ArtistId, PublisherId, CatalogNumber) 
VALUES (1, 'The White Album',1,1,'433-43ASD-33'), 
	   (2, 'Revolver',1,1,'111-11111-11'), 
	   (3, 'Quadrophenia',2,2,'CD12345');




