USE master
IF EXISTS(select * from sys.databases where name='SwiftFox3')
DROP DATABASE SwiftFox3
GO

CREATE DATABASE SwiftFox3 ON PRIMARY 
( NAME = N'SwiftFox3', 
  FILENAME =    N'C:\DELETABLE\DB\DATA\SwiftFox3.mdf' ,  
  SIZE = 1024MB , 
  MAXSIZE = 1024MB) 
  LOG ON ( NAME = N'SwiftFox3_log', 
           FILENAME =    N'C:\DELETABLE\DB\LOG\SwiftFox3_log.ldf' ,  
		   SIZE = 100MB, 
		   MAXSIZE = 2048GB , 
		   FILEGROWTH = 100MB);
GO
USE SwiftFox3
GO

CREATE SCHEMA GeneralLookup; 
GO
CREATE SCHEMA General; 
GO
CREATE SCHEMA Organization; 
GO
CREATE SCHEMA OrganizationJunction; 
GO



CREATE TABLE GeneralLookup.Country (  
	Id                          tinyint      NOT NULL 
       CONSTRAINT PK_GeneralLookup_Country PRIMARY KEY CLUSTERED
       IDENTITY ( 1,1 ),
	Code                        varchar(16)     NOT NULL,
	Value                       nvarchar(256)   NOT NULL,
	SortOrder                   tinyint         NOT NULL,	
    Enabled                     bit             NOT NULL,
	Selected                    bit             NOT NULL
); 
GO

CREATE TABLE GeneralLookup.AddressType (  
	Id                          tinyint      NOT NULL 
       CONSTRAINT PK_GeneralLookup_AddressType PRIMARY KEY CLUSTERED
       IDENTITY ( 1,1 ),
	Code                        varchar(16)     NOT NULL,
	Value                       varchar(256)    NOT NULL,
	SortOrder                   tinyint         NOT NULL,	
    Enabled                     bit             NOT NULL,
	Selected                    bit             NOT NULL
); 
GO

CREATE TABLE GeneralLookup.State (  
	Id                          tinyint      NOT NULL 
       CONSTRAINT PK_GeneralLookup_State PRIMARY KEY CLUSTERED
       IDENTITY ( 1,1 ),
	Code                        varchar(16)     NOT NULL,
	Value                       varchar(256)    NOT NULL,
	SortOrder                   tinyint         NOT NULL,	
    Enabled                     bit             NOT NULL,
	Selected                    bit             NOT NULL,
    CountryId                   tinyint         NOT NULL
); 
GO

CREATE TABLE General.Address (  
	Id                          int           NOT NULL 
       CONSTRAINT PK_General_Address PRIMARY KEY  CLUSTERED
       IDENTITY ( 1,1 ),
	AddressTypeId               tinyint       NOT NULL,
	AddressLine1                varchar(128)  NOT NULL,
    AddressLine2                varchar(128)      NULL,
    AddressLine3                varchar(128)      NULL,
    AddressLine4                varchar(128)      NULL,
    Suburb                      varchar(64)   NOT NULL,
    StateId                     tinyint       NOT NULL,
    PostalCode                  varchar(16)   NOT NULL,
    IsDeleted                   bit           NOT NULL,
    CountryId                   tinyint       NOT NULL
); 
GO


CREATE TABLE Organization.Company (  
	Id                          int           NOT NULL 
       CONSTRAINT PK_Organization_Company PRIMARY KEY CLUSTERED
       IDENTITY ( 1,1 ),
	OrganizationName            nvarchar(64)       NOT NULL,
	RegisteredName              nvarchar(64)      NULL,
    IsDeleted                   bit               NOT NULL,
    Updated                     DATETIME2         NULL,
    Deleted                     DATETIME2         NULL,
    Created                     DATETIME2         NOT NULL
); 
GO


CREATE TABLE Organization.BusinessUnit (  
	Id                          int           NOT NULL 
       CONSTRAINT PK_Organization_BusinessUnit PRIMARY KEY CLUSTERED
       IDENTITY ( 1,1 ),
	OrganizationName            nvarchar(64)       NOT NULL,
	RegisteredName              nvarchar(64)      NULL,
    CompanyId                   int               NOT NULL,
    IsDeleted                   bit               NOT NULL,
    Updated                     DATETIME2         NULL,
    Deleted                     DATETIME2         NULL,
    Created                     DATETIME2         NOT NULL
); 
GO

CREATE TABLE Organization.PayrollServiceProvider (  
	Id                          int           NOT NULL 
       CONSTRAINT PK_Organization_PayrollServiceProvider PRIMARY KEY CLUSTERED
       IDENTITY ( 1,1 ),
	OrganizationName            nvarchar(64)       NOT NULL,
	RegisteredName              nvarchar(64)      NULL,
    IsDeleted                   bit               NOT NULL,
    Updated                     DATETIME2         NULL,
    Deleted                     DATETIME2         NULL,
    Created                     DATETIME2         NOT NULL
); 
GO

CREATE TABLE OrganizationJunction.OrganizationAddress (  
	OrganizationId              int               NOT NULL,
	AddressId                   int               NOT NULL,
    CONSTRAINT AK_OrganizationAddress UNIQUE (OrganizationId,AddressId)
); 
GO

CREATE TABLE OrganizationJunction.PayrollServiceProviderBusinessUnit (  
	PayrollServiceProviderId      int               NOT NULL,
	BusinessUnitId                int               NOT NULL,
    CONSTRAINT AK_PayrollServiceProviderBusinessUnit UNIQUE (PayrollServiceProviderId, BusinessUnitId)
); 
GO


insert into GeneralLookup.Country(Code, Value, SortOrder, Enabled, Selected)
values ('Ph','Philippines', 0, 1, 1),
       ('Au','Australia', 0, 1, 0),
       ('Ch','China', 0, 1, 0);
GO


insert into GeneralLookup.AddressType(Code, Value, SortOrder, Enabled, Selected)
values ('RA','Registered Address', 1, 1, 1),
       ('PA','Postal Address', 2, 1, 0);
GO

insert into GeneralLookup.State(Code, Value, SortOrder, Enabled, Selected, CountryId)
values ('NT', 'Northern Territory', 0, 1, 1, 2),
       ('NSW','New South Wales',    0, 1, 0, 2),
       ('QL', 'Queensland',         0, 1, 0, 2),
       ('WA', 'Western Australia',  0, 1, 0, 2),
       ('SA', 'South Australia',    0, 1, 0, 2),
       ('V',  'Victoria',           0, 1, 0, 2);
GO

insert into General.Address(AddressTypeId, AddressLine1, AddressLine2, AddressLine3, AddressLine4, Suburb, StateId, PostalCode, IsDeleted, CountryId)
    values (1, 'AddressLine 1A xx','Addredss Line 2A xx','Address Line 3A xx',' Address Line 4A xx','Subrub A xx',1,'Postal A xx', 0, 2),
           (2, 'AddressLine 1B xx','Addredss Line 2B xx','Address Line 3B xx',' Address Line 4B xx','Subrub B xx',1,'Postal B xx', 0, 2),
           (1, 'AddressLine 1C zz','Addredss Line 2C zz','Address Line 3C zz',' Address Line 4C zz','Subrub C zz',1,'Postal C zz', 0, 2),
           (2, 'AddressLine 1D zz','Addredss Line 2D zz','Address Line 3D zz',' Address Line 4D zz','Subrub D zz',1,'Postal D zz', 0, 2),
           (1, 'AddressLine 1E yy','Addredss Line 2E yy','Address Line 3E yy',' Address Line 4E yy','Subrub E yy',1,'Postal E yy', 0, 2);;
GO


insert into Organization.Company(OrganizationName, RegisteredName, IsDeleted, Created)
values ('Facebook','Facebook Inc.',0, getdate()),
       ('Google','Alphabet Inc.',0, getdate());
GO

insert into Organization.BusinessUnit(OrganizationName, RegisteredName, CompanyId, IsDeleted, Created)
values ('Facebook Australia','Facebook Australia Inc.',1, 0, getdate()),
       ('Google Austrlia','Alphabet Australia Inc.', 2, 0, getdate());
GO

insert into OrganizationJunction.OrganizationAddress(OrganizationId, AddressId)
values (1,1),
       (1,2),
       (2,3),
       (2,4);
GO