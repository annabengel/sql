Drop Database If Exists bmdb;
Create Database bmdb;
Use bmdb;

Create Table Actor (
	ID int not null primary key auto_increment,
	FirstName nvarchar(25) not null,
    LastName nvarchar(25) not null,
    Gender nvarchar(25),
    Birthdate date not null
    );

Create Table Movie (
	ID int not null primary key auto_increment,
    Title nvarchar(100) not null,
    Rating nvarchar(5) not null,
    Year int not null,
    Director  nvarchar(50) not null
    );

Create Table Genre (
	ID int not null primary key auto_increment,
    Name nvarchar(10)
    );

Create Table Credit (
	ID int not null primary key auto_increment,
    ActorID int not null,
    MovieID int not null,
    Role nvarchar(50) not null,
    Foreign Key (ActorID) References Actor (ID),
    Foreign Key (MovieID) References Movie (ID)
    );

Create Table Moviegenre (
	ID int not null primary key auto_increment,
    MovieID int not null,
    GenreID int not null,
    Foreign Key (MovieID) References Movie (ID),
    Foreign Key (GenreID) References Genre (ID)
    ); 

Insert into Actor Values 
(1, 'Tom', 'Hanks', 'Male', '1956-07-09'),
(2, 'Meg', 'Ryan', 'Female', '1961-11-19'),
(3, 'Billy', 'Crystal', 'Male', '1948-03-14'),
(4, 'John', 'Cusack', 'Male', '1966-06-28'),
(5, 'Ryan', 'Gosling', 'Male', '1980-11-12'),
(6, 'Emma', 'Stone', 'Female', '1988-11-06'),
(7, 'Ellen', 'Page', 'Female', '1987-02-21'),
(8, 'Michael', 'Cera', 'Male', '1988-06-07');

Insert into Movie Values
(1, 'When Harry Met Sally', 'R', 1989, 'Rob Reiner'),
(2, 'Serendipity', 'PG-13', 2001, 'Peter Chelsom'),
(3, 'Sleepless in Seattle', 'PG', 1993, 'Nora Ephron'),
(4, 'Crazy Stupid Love', 'PG-13', 2011, 'Glenn Ficarra'),
(5, 'Juno', 'PG-13', 2007, 'Jason Reitman');

Insert into Genre Values
(1, 'Drama'),
(2, 'Romance'),
(3, 'Comedy');

Insert into Credit Values
(1, 2, 3, 'Annie Reed'),
(2, 2, 1, 'Sally Albright'),
(3, 4, 2, 'Jonathan Trager'),
(4, 7, 5, 'Juno MacGuff'),
(5, 8, 5, 'Paulie Bleeker');

Insert into MovieGenre Values
(1, 1, 3),
(2, 2, 2),
(3, 3, 1),
(4, 4, 3),
(5, 5, 3);

  Create user bmdb_user@localhost Identified by 'film';
    Grant SELECT, INSERT, DELETE, UPDATE on bmdb.* TO bmdb_user@localhost;





