-- create and select database
Drop Database If Exists sdb;
Create Database sdb;
use sdb; 

-- create the student table first, no data relies on other tables
Create Table Student (
	ID int primary key auto_increment,
    FirstName nvarchar(50) not null,
    LastName nvarchar(50) not null,
    StreetAddress nvarchar(50) not null,
    City nvarchar(50) not null,
    State nvarchar(2) not null,
    Zip nvarchar(5) not null,
    Birthdate date not null,
    PhoneNumber nvarchar(12) not null,
    Email nvarchar(50) not null,
    SSN nvarchar(11) not null
    );

-- create course table, no data relies on other tables
Create table Course (
	ID int primary key auto_increment,
    Number int unique not null,
    Subject nvarchar(50) not null,
    Name nvarchar(50) not null
    );

-- create instructor table, will rely on course table data
Create table instructor (
	ID int primary key not null auto_increment,
    CourseID int not null,
    FirstName nvarchar(50) not null,
    LastName nvarchar(50) not null,
    Foreign Key (CourseID) References Course (ID)
    );

-- create enrollment table, will rely on course and student table data
create table enrollment (
	ID int primary key not null auto_increment,
    StudentID int not null,
    CourseID int not null,
    Grade decimal(5,2),
    Foreign Key (StudentID) References Student (ID),
    foreign key (CourseID) References Course (ID)
    );
    
    -- insert data for tables in order tables occur
    Insert into Student Values
    (1, 'Anna', 'Bengel', '602 Stanton Ave', 'Terrace Park', 'OH', 45174, '1992-05-21', '513-382-6083', 'annambengel@gmail.com', '544-56-4444'),
    (2, 'Amber', 'Kidwell', '3453 Main Street', 'Cincinnati', 'OH', 45210, '1989-03-29', '859-835-8988', 'hemmerlea2@gmail.com', '324-32-2453'),
    (3, 'David', 'McCann', '2545 Union Street', 'Cincinnati', 'OH', 45234, '1991-04-23', '513-340-0175', 'mccanndt91@gmail.com', '234-34-5432');
    
    Insert into Course Values
    (1, 5436, 'Programming', 'Java'),
    (2, 6545, 'Math', 'Statistics'),
    (3, 4334, 'Music', 'Piano II');
    
    Insert into Instructor Values
    (1, 1, 'Sean', 'Blessing'),
    (2, 2, 'Bob', 'Saget'),
    (3, 3, 'Ben', 'Folds');
    
    Insert into enrollment Values
    (1, 1, 2, 95.48),
    (2, 2, 3, 97.20),
    (3, 2, 1, 99.98),
    (4, 3, 1, 99.98);
    
    -- Create a user and grant privileges to that user
    Create user sdb_user@localhost Identified by 'cow';
    Grant SELECT, INSERT, DELETE, UPDATE on sdb.* TO sdb_user@localhost;
    
    
    
    
    