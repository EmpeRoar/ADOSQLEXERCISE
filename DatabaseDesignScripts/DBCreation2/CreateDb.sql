CREATE DATABASE MusicDb ON PRIMARY 
( NAME = N'MusicDb', 
  FILENAME =    N'C:\DELETABLE\DB\DATA\MusicDb.mdf' ,  
  SIZE = 1024MB , 
  MAXSIZE = 1024MB) 
  LOG ON ( NAME = N'MusicDb_log', 
           FILENAME =    N'C:\DELETABLE\DB\LOG\MusicDb_log.ldf' ,  
		   SIZE = 100MB, 
		   MAXSIZE = 2048GB , 
		   FILEGROWTH = 100MB);