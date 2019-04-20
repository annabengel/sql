Drop Database If Exists prs;
Create Database prs;
Use prs; 

Create Table User (
ID 				int 			primary key 				auto_increment,
UserName 		varchar(20) 	not null 					unique,
Password 		varchar(10) 	not null,
FirstName 		varchar(20) 	not null,
LastName 		varchar(20) 	not null,
PhoneNumber 	varchar(12) 	not null,
Email 			varchar(75) 	not null,
IsReviewer 		TinyInt(1) 		not null,
IsAdmin 		TinyInt(1) 		not null,
IsActive 		TinyInt(1) 		default 1					not null,
DateCreated 	DATETIME 		default current_timestamp	not null,
DateUpdated 	DATETIME 		default current_timestamp	on update current_timestamp 	not null,
UpdatedByUser 	INT 			default 1					not null
);

Create Table Vendor (
	ID 				int 			primary key 	not null 	auto_increment,
    Code 			varchar(10) 	not null,
    Name 			varchar(255) 	not null,
    Address 		varchar(255) 	not null,
    City 			varchar(255) 	not null,
    State 			varchar(2) 		not null,
    Zip 			varchar(5) 		not null,
    PhoneNumber 	varchar(12) 	not null,
    Email 			varchar(100)	not null,
    IsPreApproved 	TinyInt(1) 		not null,
    IsActive 		TinyInt(1) 		default 1					not null,
    DateCreated 	DATETIME 		default current_timestamp	not null,
    DateUpdated 	DATETIME 		default current_timestamp	on update current_timestamp		not null,
    UpdatedByUser 	Int 			default 1					not null
    );
    
Create Table PurchaseRequest (
	ID 					int 			primary key not null auto_increment,
    UserID 				int 			not null,
    Description 		varchar(100) 	not null,
    Justification 		varchar(255) 	not null,
    DateNeeded 			DATE 			not null,
    DeliveryMode 		varchar(25) 	not null,
    Status 				varchar(20) 	not null,
    Total 				Decimal(10,2) 	not null,
    SubmittedDate 		DATETIME 		not null,
    ReasonForRejection 	varchar(100),
    IsActive 			TinyInt(1) 		default 1					not null,
    DateCreated 		DATETIME 		default current_timestamp	not null,
    DateUpdated 		DATETIME 		default current_timestamp	on update current_timestamp 	not null,
    UpdatedByUser 		int 			default 1					not null
    );

Create Table Product (
	ID 				int 			primary key 				not null 						auto_increment,
    VendorID 		int 			not null,
    PartNumber 		varchar(50) 	not null,
    Name 			varchar(150) 	not null,
    Price 			decimal(10,2) 	not null,
    Unit 			varchar(255),
    PhotoPath 		varchar(255),
    IsActive 		TinyInt(1)		default 1					not null,
    DateCreated 	DATETIME 		default current_timestamp	not null,
    DateUpdated 	DATETIME 		default current_timestamp 	on update current_timestamp		not null,
    UpdatedByUser 	int 			default 1					not null
    );
    
Create Table PurchaseRequestLineItem (
	ID 					int 		primary key 				not null 						auto_increment,
	PurchaseRequestID 	int 		not null,
	ProductID 			int 		not null,
	Quantity 			int 		not null,
	IsActive 			TinyInt(1)	default 1					not null,
	DateCreated 		DATETIME 	default current_timestamp	not null,
	DateUpdated 		DATETIME 	default current_timestamp	on update current_timestamp		not null,
	UpdatedByUser 		int 		not null					default 1
	); 

-- insert users
INSERT INTO user (ID, UserName, Password, FirstName, LastName, PhoneNumber, Email, IsReviewer, IsAdmin) VALUES 
(1,'SYSTEM','xxxxx','System','System','XXX-XXX-XXXX','system@test.com',1,1),
(2,'sblessing','login','Sean','Blessing','513-600-7096','sean@blessingtechnology.com',1,1),
(3,'abengel','password','Anna','Bengel','513-382-6083','annambengel@gmail.com',1,1);

-- insert vendors
INSERT INTO vendor (ID, Code, Name, Address, City, State, Zip, PhoneNumber, Email, isPreApproved) 
VALUES 
(1,'BB-1001','Best Buy','100 Best Buy Street','Louisville','KY','40207','502-111-9099','geeksquad@bestbuy.com',1),
(2,'AP-1001','Apple Inc','1 Infinite Loop','Cupertino','CA','95014','800-123-4567','genius@apple.com',1),
(3,'AM-1001','Amazon','410 Terry Ave. North','Seattle','WA','98109','206-266-1000','amazon@amazon.com',0),
(4,'ST-1001','Staples','9550 Mason Montgomery Rd','Mason','OH','45040','513-754-0235','support@orders.staples.com',0),
(5,'MC-1001','Micro Center','11755 Mosteller Rd','Sharonville','OH','45241','513-782-8500','support@microcenter.com',0),
(6,'TA-1001','Target','100 Rivers Edge Dr','Milford','OH','45150','513-831-5294','support@target.com',0),
(7,'NE-1001','NewEgg','9997 Rose Hills Rd','Whittier','CA','90601','800-390-1119','support@newegg.com',1);

INSERT INTO product (ID, VendorID,PartNumber,Name,Price,Unit,PhotoPath) VALUES 
(1,1,'ME280LL','iPad Mini 2',296.99,NULL,NULL),
(2,2,'ME280LL','iPad Mini 2',299.99,NULL,NULL),
(3,3,'105810','Hammermill Paper, Premium Multi-Purpose Paper Poly Wrap',8.99,'1 Ream / 500 Sheets',NULL),
(4,4,'122374','HammerMill® Copy Plus Copy Paper, 8 1/2\" x 11\", Case',29.99,'1 Case, 10 Reams, 500 Sheets per ream',NULL),
(5,4,'784551','Logitech M325 Wireless Optical Mouse, Ambidextrous, Black ',14.99,NULL,NULL),
(6,4,'382955','Staples Mouse Pad, Black',2.99,NULL,NULL),
(7,4,'2122178','AOC 24-Inch Class LED Monitor',99.99,NULL,NULL),
(8,4,'2460649','Laptop HP Notebook 15-AY163NR',529.99,NULL,NULL),
(9,4,'2256788','Laptop Dell i3552-3240BLK 15.6\"',239.99,NULL,NULL),
(10,4,'IM12M9520','Laptop Acer Acer™ Aspire One Cloudbook 14\"',224.99,NULL,NULL),
(11,4,'940600','Canon imageCLASS Copier (D530)',99.99,NULL,NULL),
(12,5,'228148','Acer Aspire ATC-780A-UR12 Desktop Computer',399.99,'','/images/AcerAspireDesktop.jpg'), 
(13,5,'279364','Lenovo IdeaCentre All-In-One Desktop',349.99,'','/images/LenovoIdeaCenter.jpg'),
(14,6,'081-07','Fellowes Powershred 9C Cross-Cut Paper Shredder',49.99,null,null),
(15,6,'071701','DYMO LetraTag 100H Handheld Label Maker',17.89,NULL,NULL),
(16,7,'9S1A','Epson PowerLite 2250U Wireless Full HD WUXGA 3LCD Projector',1379.99,NULL,NULL);

INSERT INTO purchaserequest (ID, UserID, Description, Justification, DateNeeded, DeliveryMode, 
Status, Total, SubmittedDate, ReasonForRejection) VALUES
(1,3,'Laptop HP Notebook 15-AY163NR','New Employee','2019-06-01','UPS','Requested',529.99,'2019-04-20',NULL),
(2,3,'Logitech M325 Wireless Optical Mouse, Ambidextrous, Black ','New Employee','2019-06-01','UPS','Requested',14.99,'2019-04-20',NULL),
(3,2,'iPad Mini 2','To Distribute To Team For Projects','2019-09-01','FedEx','Requested',296.99,'2019-04-25',NULL);

INSERT INTO purchaserequestlineitem (ID, PurchaseRequestID, ProductID, Quantity) VALUES
(1,1,8,1),
(2,2,5,1),
(3,3,1,12); 
