create database if not exists The_Project;

use The_Project;

CREATE TABLE Customer
(
  CustomerName VARCHAR(50) NOT NULL,
  CustomerID VARCHAR(4) NOT NULL,
  Email VARCHAR(50),
  City VARCHAR(30) NOT NULL,
  PRIMARY KEY (CustomerID)
);

CREATE TABLE Product
(
  ProductID VARCHAR(4) NOT NULL,
  ProductName VARCHAR(30) NOT NULL,
  StoreArea VARCHAR(30) NOT NULL,
  Aisle INT NOT NULL,
  Shelf INT NOT NULL,
  Size VARCHAR(20) NOT NULL,
  Weight FLOAT NOT NULL,
  Color VARCHAR(30) NOT NULL,
  ProductDescription VARCHAR(120) NOT NULL,
  PRIMARY KEY (ProductID)
);

CREATE TABLE SalesAssociate
(
  SalesAssociateID VARCHAR(4) NOT NULL,
  FirstName VARCHAR(20) NOT NULL,
  LastName VARCHAR(30) NOT NULL,
  Birthdate DATE NOT NULL,
  Wage FLOAT NOT NULL,
  PRIMARY KEY (SalesAssociateID)
);

CREATE TABLE CustomerPhone
(
  PhoneNumber VARCHAR(12),
  CustomerID VARCHAR(4) NOT NULL,
  FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE ProductSupply
(
  Quantity INT NOT NULL,
  ReOrderPoint INT NOT NULL,
  StockQuantity INT NOT NULL,
  ProductID VARCHAR(4) NOT NULL,
  FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

CREATE TABLE ProductPrice
(
  SalesPrice NUMERIC(8,2) NOT NULL,
  ActualPrice NUMERIC(8,2) NOT NULL,
  ProductID VARCHAR(4) NOT NULL,
  FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

CREATE TABLE SalesAssociateContactInformation
(
  Address VARCHAR(110) NOT NULL,
  HomePhone VARCHAR(12),
  Email VARCHAR(35),
  SalesAssociateID VARCHAR(4) NOT NULL,
  PRIMARY KEY (Address),
  FOREIGN KEY (SalesAssociateID) REFERENCES Salesassociate(SalesAssociateID)
);

CREATE TABLE SalesAssociateHistory
(
  Start_date DATE NOT NULL,
  Termination_date DATE,
  Termination_code VARCHAR(3),
  Termination_reason VARCHAR(120),
  Re_hire_date DATE,
  EmploymentStatus VARCHAR(30) NOT NULL,
  SalesAssociateID VARCHAR(4) NOT NULL,
  FOREIGN KEY (SalesAssociateID) REFERENCES Salesassociate(SalesAssociateID)
);

CREATE TABLE SoldVia
(
  SoldDate DATE NOT NULL,
  Quantity INT NOT NULL,
  ProductID VARCHAR(4) NOT NULL,
  SalesAssociateID VARCHAR(4) NOT NULL,
  FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
  FOREIGN KEY (SalesAssociateID) REFERENCES Salesassociate(SalesAssociateID)
);

CREATE TABLE SalesAssociatePrimaryPhoneNumber
(
  MobilePhone VARCHAR(12) NOT NULL,
  SalesAssociateID VARCHAR(4) NOT NULL,
  PRIMARY KEY (MobilePhone),
  FOREIGN KEY (SalesAssociateID) REFERENCES Salesassociate(SalesAssociateID)
);

CREATE TABLE SalesAssociateEmergencyContact
(
  EmergencyName VARCHAR(30),
  PhoneNumber VARCHAR(12),
  Relationship VARCHAR(20),
  SalesAssociateID VARCHAR(4) NOT NULL,
  FOREIGN KEY (SalesAssociateID) REFERENCES Salesassociate(SalesAssociateID)
);

CREATE TABLE CustomerBought
(
  Quantity INT NOT NULL,
  BoughtDate DATE NOT NULL,
  CustomerID VARCHAR(4) NOT NULL,
  ProductID VARCHAR(4) NOT NULL,
  FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
  FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);



INSERT INTO Customer	VALUES ('Chad Montague', 'C112', 'ChaddyMont31@yahoo.com', 'Manassas');
INSERT INTO Customer	VALUES ('Tiffany Winslow', 'C202', 'TstarWinslow@hotmail.com', 'Tallmadge');
INSERT INTO Customer	VALUES ('Cash_payee', '1111', null, 'Cuyahoga Falls');
INSERT INTO Customer	VALUES ('Ashley Tyler', 'C114',	'ATyler86@gmail.com',	'Kent');
INSERT INTO Customer	VALUES ('Timothy Cupo',	'C116',	'T-City316@yahoo.com',	'Stow');
INSERT INTO Customer	VALUES ('Cash_payee', '1112', null, 'Hudson');
INSERT INTO Customer	VALUES ('Laura Smith',	'C118',	'LSmith488@yahoo.com', 'Tallmadge');
INSERT INTO Customer	VALUES ('Chris Phillips',	'C120',	'ChaddyMont31@yahoo.com',	'Brunswick');
INSERT INTO Customer	VALUES ('Cash_payee', '1113', null, 'Boston Heights');
INSERT INTO Customer	VALUES ('GSP',	'C122',	'UFCGOAT@gmail.com',	'Brooklyn');
INSERT INTO Customer	VALUES ('Cash_payee', '1114', null, 'Penninsula');


INSERT INTO CustomerPhone		VALUES ('330-345-5555', 'C112');
INSERT INTO CustomerPhone		VALUES ('216-284-4585', 'C116');
INSERT INTO CustomerPhone		VALUES ('234-464-8483', 'C120');

INSERT INTO Product VALUES ('T225',	'Ball',	'Toy And Outdoor Play',	'1',	'2',	'5',	'1',	'Green',	'Soft. Easy to catch. Comes with air pump for fast inflation');
INSERT INTO Product VALUES ('T226',	'ActionHeroFigure',	'Toy And Outdoor Play',	'2',	'1',	'6',	'0.5',	'Red/Black',	'Hero man. Comes with cape and signature hammer');
INSERT INTO Product VALUES ('T227',	'Strainer',	'Household Essentials',	'2',	'3',	'6  x 4', 	'0.5',	'Yellow',	'Can be used to strain pasta and the like');
INSERT INTO Product VALUES ('T228',	'Golf ball',	'Sports And Outdoors', '5',	'2',	'3 x 3 x 1.5', 	'3',	'Black',	'Pack of 10');
INSERT INTO Product VALUES ('T229',	'Paper towels',	'Household Essentials',	'2',	'2',	'3',	'1.5',	'White',	'Pack of 2. Rugged');
INSERT INTO Product VALUES ('T230',	'Sponges',	'Household Essentials',	'3',	'2',	'2',	'0.5',	'Green/Yellow',	'Pack of 3');
INSERT INTO Product VALUES ('T231',	'Barbell plates',	'Sports And Outdoors',	'1',	'1',	'15 x 10 x 8', 	'105',	'Black',	'Set of 4, 25 lbs each');
INSERT INTO Product VALUES ('T232',	'Free weights',	'Sports And Outdoors',	'2',	'2',	'8',	'50',	'Black/Silver',	'A pair of 25 lb dumbells');
INSERT INTO Product VALUES ('T233',	'Treadmill',	'Sports And Outdoors',	'3',	'1',	'30 x 25 x 55',	'300',	'Black/Silver',	'17 in wide tread belt. 15 preset programs');
INSERT INTO Product VALUES ('T234',	'Electric drill',	'Home Improvement',	'3',	'2',	'5.55 x 9 x 3',	'2.8',	'Yellow/Black',	'20 V battery. Driver kit');
INSERT INTO Product VALUES ('T235',	'Scissors',	'Stationery and Office Supplies',	'2',	'2',	'6',	'0.5',	'Blue/Silver',	'Blue handle');
INSERT INTO Product VALUES ('T236',	'Mop',	'Household Essentials',	'2',	'3',	'60',	'3',	'Purple/silver',	'Yocada looped-end wet mop' );
INSERT INTO Product VALUES ('T237',	'Bucket',	'Household Essentials',	'2',	'1',	'13 x 12 x 10.5',	'1.1',	'Red',	'Heavy-duty, corrosive-resistant, round');
INSERT INTO Product VALUES ('T238',	'Workout Bench',	'Sports And Outdoors',	'3',	'1',	'55 x 14 x 37',	'440',	'Black/Red',	'Adjustable. Foldable incline');
INSERT INTO Product VALUES ('T239',	'Shredder',	'Stationery and Office Supplies',	'1',	'1',	'12.8 x 7.3 x 15.9',	'8.3',	'Black',	'8 sheet capacity, cross-cut paper. 4.1 gallons');
INSERT INTO Product VALUES ('T240',	'Barbell plates',	'Sports And Outdoors',	'1',	'1',	'15 x 15 x 10',	'185',	'Black',	'Set of 4, 45 lbs each');
INSERT INTO Product VALUES ('T241',	'Barbell plates',	'Sports And Outdoors',	'1',	'1',	'7 x 7 x 5', 	'45',	'Black',	'Set of 4, 10 lbs each' );
INSERT INTO Product VALUES ('T242',	'Barbell',	'Sports And Outdoors',	'1',	'1',	'86.4 x 4 x 4',	'44',	'Silver',	'Alloy steel, knurled grip');
INSERT INTO Product VALUES ('T243',	'Ball',	'Toy And Outdoor Play',	'1',	'2',	'5',	'1',	'Yellow', 'Soft. Easy to catch. Comes with air pump for fast inflation');

INSERT INTO ProductPrice VALUES (2.8, 4, 'T225');
INSERT INTO ProductPrice VALUES (3.5,	5,	'T226');
INSERT INTO ProductPrice VALUES (10,	12,	'T227');
INSERT INTO ProductPrice VALUES (16,	20,	'T228');
INSERT INTO ProductPrice VALUES (2,	3.5,	'T229');
INSERT INTO ProductPrice VALUES (1.5,	3,	'T230');
INSERT INTO ProductPrice VALUES (50,	70,	'T231');
INSERT INTO ProductPrice VALUES (100,	120,	'T232');
INSERT INTO ProductPrice VALUES (250,	300,	'T233');
INSERT INTO ProductPrice VALUES (250,	300,	'T233');
INSERT INTO ProductPrice VALUES (40,	50,	'T234');
INSERT INTO ProductPrice VALUES (2,	3,	'T235');
INSERT INTO ProductPrice VALUES (3,	4,	'T236');
INSERT INTO ProductPrice VALUES (2,	3,	'T237');
INSERT INTO ProductPrice VALUES (50,	70,	'T238');
INSERT INTO ProductPrice VALUES (30,	35,	'T239');
INSERT INTO ProductPrice VALUES (60,	75,	'T240');
INSERT INTO ProductPrice VALUES (40,	45,	'T241');
INSERT INTO ProductPrice VALUES (150,	165,	'T242');
INSERT INTO ProductPrice VALUES (2.8, 4, 'T243');



INSERT INTO SalesAssociate VALUES ('E101', 	'Thomas',	'Daily', '2002-12-15',	'9');
INSERT INTO SalesAssociate VALUES ('E103', 'Luffy',	'Monkey',	'1990-3-15',	'25');
INSERT INTO SalesAssociate VALUES ('E105', 'Calvin',	'Lynn',	'2000-09-08',	'11');
INSERT INTO SalesAssociate VALUES ('E107',	'Scott',	'Barger',	'2003-07-17',	'9');
INSERT INTO SalesAssociate VALUES ('E109',		'Zoro',	'Roronoa',	'1985-01-18',	'22');
INSERT INTO SalesAssociate VALUES ('E111',	'Rebecca',	'Ross',	'1993-02-19',	'22');
INSERT INTO SalesAssociate VALUES ('E113',	'Anna',	'Jones',	'2001-04-18',	'10');
INSERT INTO SalesAssociate VALUES ('E115',		'David',	'White',	'1997-10-21',	'9');
INSERT INTO SalesAssociate VALUES ('E117',		'Boris',	'Kerr',	'1999-05-05',	'10');
INSERT INTO SalesAssociate VALUES ('E119',		'Trevor',	'Ferguson',	'1997-07-07',	'22');
INSERT INTO SalesAssociate VALUES ('E121',		'Blake',	'Gibson',	'1995-05-05',	'11');
INSERT INTO SalesAssociate VALUES ('E123',		'Jonathan',	'Dyer',	'2002-07-25',	'9');
INSERT INTO SalesAssociate VALUES ('E125',		'Natalie',	'Oliver',	'2000-05-11',	'11');
INSERT INTO SalesAssociate VALUES ('E127',	'Sue',	'Metcalfe',	'2002-06-06',	'10');
INSERT INTO SalesAssociate VALUES ('E129',		'Tammi',	'Underwood',	'1998-02-03',	'9');
INSERT INTO SalesAssociate VALUES ('E131',	'Anna',	'Quinn',	'2001-06-05',	'9');
INSERT INTO SalesAssociate VALUES ('E133',		'Prasad',	'Bernice',	'1985-12-13',	'22');
INSERT INTO SalesAssociate VALUES ('E135',	'Yitzhak',	'Stein',	'1988-05-14',	'22');


INSERT INTO SalesAssociateContactInformation VALUES ('325 Timberlake Lane, Akron OH 44308',	'330-436-5848', null,	'E101');
INSERT INTO SalesAssociateContactInformation VALUES ('42731 Pirate King Blvd, Stow, OH 44224',	null,	'Lmonkey@gmail.com', 'E103');
INSERT INTO SalesAssociateContactInformation VALUES ('3485 Tall Grass Circle, Cuyahoga Falls, OH 44221',	'330-315-9284',	'Calvin.Lynn98@yahoo.com',	'E105');
INSERT INTO SalesAssociateContactInformation VALUES ('5482 Silvercreek Rd, Wadsworth OH, 44281',	null,	'Raptor_Zilla23@Hotmail.com',	'E107');
INSERT INTO SalesAssociateContactInformation VALUES ('234 Great Lakes ave, apt 4, Cuyahoga Falls OH 44221',	null, null,	'E109');
INSERT INTO SalesAssociateContactInformation VALUES ('43556 Turn Of Century Ave, Brunswick OH 44212',	null,	'Rebecca_Ross@gmail.com',	'E111');
INSERT INTO SalesAssociateContactInformation VALUES ('3382 State Road, Pennisula OH  44205', null,	'AnnaBonesJones21@yahoo.com',	'E113');
INSERT INTO SalesAssociateContactInformation VALUES ('6781 Longshore Street, Parma OH 44301', '330-475-0583',	'david.white@yahoo.com', 'E115');
INSERT INTO SalesAssociateContactInformation VALUES ('755 Crestwood Lane, Tallmadge OH 44303',	null,	'BKerr599@gmail.com', 'E117');
INSERT INTO SalesAssociateContactInformation VALUES ('6231 Avery Road, Warren OH 44124',	null,	'trevor.ferguson@yahoo.com', 'E119');
INSERT INTO SalesAssociateContactInformation VALUES ('6200 Enterprise Court, Youngstown OH 44124',	null, 'blake.gibson@yahoo.com',	'E121');
INSERT INTO SalesAssociateContactInformation VALUES ('4422 Bellaire Avenue, Mansfield OH 43342', null, 'jonathan.dyer@gmail.com', 'E123');
INSERT INTO SalesAssociateContactInformation VALUES ('3848 Heron Spring pkwy, Brunswick OH 44212', '330-478-1953', 'NOliver00@gmail.com', 'E125');
INSERT INTO SalesAssociateContactInformation VALUES ('349 Holly Drive, apt 14, Mogadore OH 44213', null, 'sue.metcalfe@gmail.com', 'E127');
INSERT INTO SalesAssociateContactInformation VALUES ('5885 Frantz Road, Akron OH 44303', null, null,	'E129');
INSERT INTO SalesAssociateContactInformation VALUES ('34598 Polk Dr, Norton OH 44030',	null, 'anna.quinn@gmail.com', 'E131');
INSERT INTO SalesAssociateContactInformation VALUES ('814 Chartier Dr, Wadsworth OH 44301',	null, 'PrasadFunGuy11@gmail.com', 'E133');
INSERT INTO SalesAssociateContactInformation VALUES ('652 Gateway Boulevard, Youngstown OH 44131', null, 'YSteinGate@yahoo.com', 'E135');



INSERT INTO SalesAssociateHistory VALUES ('2021-05-20', null, null, null, null, 'Junior Sales Associate','E101');
INSERT INTO SalesAssociateHistory VALUES ('2012-04-06', null,	null,	null,	null, 'Store Manager', 'E103');
INSERT INTO SalesAssociateHistory VALUES ('2019-10-18',	null,	null,	null,	null, 'Senior Sales Associate', 'E105');
INSERT INTO SalesAssociateHistory VALUES ('2021-05-25',	'2021-06-17',	'F', 'Employee was repeatedly late for work',	null,	'Stock Associate',	'E107');
INSERT INTO SalesAssociateHistory VALUES ('2014-08-15',	null,	null,	null,	null, 'Department Manager',	'E109');
INSERT INTO SalesAssociateHistory VALUES ('2013-05-13',	null,	null,	null,	null,	'Department Manager',	'E111');
INSERT INTO SalesAssociateHistory VALUES ('2018-03-22',	null,	null,	null,	null,	'Floater',	'E113');
INSERT INTO SalesAssociateHistory VALUES ('2020-12-03',	null,	null,	null,	null,	'Part-timer', 'E115');
INSERT INTO SalesAssociateHistory VALUES ('2021-03-14',	null,	null,	null,	null,	'Part-timer',	'E117');
INSERT INTO SalesAssociateHistory VALUES ('2012-03-17',	null,	null,	null,	null,	'Department Manager',	'E119');
INSERT INTO SalesAssociateHistory VALUES ('2017-09-12',	'2020-10-18',	'A',	'Employee quit to pursue underwater basket weaving',	'2021-11-02',	'Senior Sales Associate',	'E121');
INSERT INTO SalesAssociateHistory VALUES ('2019-08-17',	null,	null,	null,	null,	'Part-timer',	'E123');
INSERT INTO SalesAssociateHistory VALUES ('2021-04-22',	'2021-06-30',	'F',	'Employee was repeatedly disrespectful to customers',	null,	'Part-timer',	'E125');
INSERT INTO SalesAssociateHistory VALUES ('2018-03-22',	null,	null,	null,	null,	'Floater',	'E127');
INSERT INTO SalesAssociateHistory VALUES ('2018-02-15',	null,	null,	null,	null,	'Stock Associate',	'E129');
INSERT INTO SalesAssociateHistory VALUES ('2021-09-02',	null,	null,	null,	null,	'Junior Sales Associate',	'E131'); 
INSERT INTO SalesAssociateHistory VALUES ('2008-10-18',	'2021-03-19',	'A',	'Employee quit', null, 'Department Manager',	'E133');
INSERT INTO SalesAssociateHistory VALUES ('2010-01-19',	'2015-02-28',	'F',	'Insider trading',	null,	'Store Manager',	'E135');


INSERT INTO CustomerBought VALUES ('2',	'2021-01-12',	'1114',	'T230');
INSERT INTO CustomerBought VALUES ('3',	'2021-01-13',	'1114',	'T229');
INSERT INTO CustomerBought VALUES ('1',	'2020-05-14',	'C122',	'T233');
INSERT INTO CustomerBought VALUES ('1',	'2020-05-14',	'C122',	'T242');
INSERT INTO CustomerBought VALUES ('1',	'2020-05-14',	'C122',	'T231');
INSERT INTO CustomerBought VALUES ('1',	'2020-05-14',	'C122',	'T232');
INSERT INTO CustomerBought VALUES ('1',	'2020-07-07',	'C122',	'T226');
INSERT INTO CustomerBought VALUES ('2',	'2021-07-07',	'1113',	'T226');
INSERT INTO CustomerBought VALUES ('2',	'2020-07-07',	'1113',	'T228');
INSERT INTO CustomerBought VALUES ('2',	'2021-10-15',	'C120',	'T237');
INSERT INTO CustomerBought VALUES ('3',	'2021-10-15',	'C120',	'T236');
INSERT INTO CustomerBought VALUES ('2',	'2021-06-08',	'C120',	'T232');
INSERT INTO CustomerBought VALUES ('4',	'2021-12-12',	'C118',	'T236');
INSERT INTO CustomerBought VALUES ('2',	'2021-02-15',	'C118',	'T237');
INSERT INTO CustomerBought VALUES ('1',	'2021-02-15',	'1112',	'T239');
INSERT INTO CustomerBought VALUES ('1',	'2021-03-05',	'C116',	'T233');
INSERT INTO CustomerBought VALUES ('2',	'2021-06-08',	'C116',	'T230');
INSERT INTO CustomerBought VALUES ('1',	'2021-06-09',	'C116',	'T227');
INSERT INTO CustomerBought VALUES ('1',	'2021-03-03',	'C114',	'T238');
INSERT INTO CustomerBought VALUES ('1',	'2021-03-03',	'C114',	'T232');
INSERT INTO CustomerBought VALUES ('2',	'2021-09-15',	'1111',	'T235');
INSERT INTO CustomerBought VALUES ('2',	'2021-09-16',	'1111',	'T234');
INSERT INTO CustomerBought VALUES ('1',	'2021-10-19',	'C202',	'T241');
INSERT INTO CustomerBought VALUES ('1',	'2021-10-19',	'C202',	'T225');
INSERT INTO CustomerBought VALUES ('3',	'2021-09-19',	'C112',	'T230');


 INSERT INTO ProductSupply VALUES ('7',	'3', '1',	'T225');
INSERT INTO ProductSupply VALUES ('6',	'4', '1',	'T226');
INSERT INTO ProductSupply VALUES ('10',	'3', '1',	'T228');
INSERT INTO ProductSupply VALUES ('10',	'4', '1',	'T229');
INSERT INTO ProductSupply VALUES ('8', '2',	 '1','T230');
INSERT INTO ProductSupply VALUES ('8',	'2', '1',	'T231');
INSERT INTO ProductSupply VALUES ('2',	'2', '1',	'T232');
INSERT INTO ProductSupply VALUES ('4',	'1', '1',	'T233');
INSERT INTO ProductSupply VALUES ('1',	'2', '1',	'T234');
INSERT INTO ProductSupply VALUES ('12',	'4', '1',	'T235');
INSERT INTO ProductSupply VALUES ('7',	'3', '1',	'T236');
INSERT INTO ProductSupply VALUES ('2',	'2', '1',	'T237');
INSERT INTO ProductSupply VALUES ('1',	'2',  '1',	'T238');
INSERT INTO ProductSupply VALUES ('5',	'2', '1',	'T239');
INSERT INTO ProductSupply VALUES ('4',	'2', '1',	'T240');
INSERT INTO ProductSupply VALUES ('4',	'2', '1',	'T241');
INSERT INTO ProductSupply VALUES ('6',	'2', '1',	'T242');
INSERT INTO ProductSupply VALUES ('8',	'2', '1',	'T243');


INSERT INTO SoldVia VALUES ('2021-09-19',	'2',	'T225', 'E101');
INSERT INTO SoldVia VALUES ('2021-10-19',	'2',	'T225',	'E101');
INSERT INTO SoldVia VALUES ('2021-09-19',	'6',	'T236',	'E101');
INSERT INTO SoldVia VALUES ('2021-07-05',	'1',	'T237',	'E101');
INSERT INTO SoldVia VALUES ('2021-05-07',	'3',	'T226',	'E101');
INSERT INTO SoldVia VALUES ('2021-06-15',	'1',	'T237',	'E101');
INSERT INTO SoldVia VALUES ('2020-10-20',	'2',	'T229',	'E105');
INSERT INTO SoldVia VALUES ('2021-10-13',	'3',	'T231',	'E105');
INSERT INTO SoldVia VALUES ('2021-11-15',	'3',	'T236',	'E105');
INSERT INTO SoldVia VALUES ('2021-06-01',	'1',	'T240',	'E107');
INSERT INTO SoldVia VALUES ('2021-05-28',	'2',	'T229',	'E107');
INSERT INTO SoldVia VALUES ('2020-05-19',	'4',	'T242',	'E113');
INSERT INTO SoldVia VALUES ('2020-11-20',	'1',	'T242',	'E113');
INSERT INTO SoldVia VALUES ('2021-05-13',	'3',	'T230',	'E113');
INSERT INTO SoldVia VALUES ('2021-05-15',	'1',	'T228',	'E113');
INSERT INTO SoldVia VALUES ('2021-10-18',	'3',	'T242',	'E115');
INSERT INTO SoldVia VALUES ('2021-10-18',	'3',	'T241',	'E115');
INSERT INTO SoldVia VALUES ('2021-11-15',	'5',	'T240',	'E115');
INSERT INTO SoldVia VALUES ('2021-09-15',	'2',	'T230',	'E117');
INSERT INTO SoldVia VALUES ('2021-09-15',	'1',	'T231',	'E117');
INSERT INTO SoldVia VALUES ('2020-09-17',	'3',	'T237',	'E121');
INSERT INTO SoldVia VALUES ('2021-10-20',	'1',	'T232',	'E123');
INSERT INTO SoldVia VALUES ('2021-10-21',	'1',	'T228',	'E123');
INSERT INTO SoldVia VALUES ('2021-03-16',	'1',	'T239',	'E127');
INSERT INTO SoldVia VALUES ('2021-04-15',	'2',	'T241',	'E129');
INSERT INTO SoldVia VALUES ('2021-05-15',	'4',	'T232',	'E129');
INSERT INTO SoldVia VALUES ('2021-05-17',	'3',	'T225',	'E129');
INSERT INTO SoldVia VALUES ('2021-05-18',	'3',	'T225',	'E131');
INSERT INTO SoldVia VALUES ('2021-05-19',	'3',	'T225',	'E131');
INSERT INTO SoldVia VALUES ('2021-05-20',	'4',	'T225',	'E131');
INSERT INTO SoldVia VALUES ('2021-06-05',	'1',	'T242',	'E125');
INSERT INTO SoldVia VALUES ('2020-08-19',	'4',	'T235',	'E113');
INSERT INTO SoldVia VALUES ('2020-08-20',	'5',	'T236',	'E113');
INSERT INTO SoldVia VALUES ('2020-08-21',	'6',	'T237',	'E113');

INSERT INTO SalesAssociateEmergencyContact VALUES ('Cleopatra Chambers', '571-286-9854',	'Aunt', 'E103');
INSERT INTO SalesAssociateEmergencyContact VALUES ('Patrick Lowe', '571-286-9854',	'Wife',	'E107');
INSERT INTO SalesAssociateEmergencyContact VALUES ('Erica Barger', '234-286-9854',	'Cousin',	'E107');
INSERT INTO SalesAssociateEmergencyContact VALUES ('Marcus Woods', '440-583-4856',	'Cousin',	'E115');
INSERT INTO SalesAssociateEmergencyContact VALUES ('Kimberly Ferguson',	'330-224-8484',	'Wife',	'E119');
INSERT INTO SalesAssociateEmergencyContact VALUES ('Steven Baxter',	'216-444-8457',	'Friend',	'E133');


INSERT INTO SalesAssociatePrimaryPhoneNumber VALUES ('330-566-5837',	'E101');
INSERT INTO SalesAssociatePrimaryPhoneNumber VALUES ('216-435-5847',	'E103');
INSERT INTO SalesAssociatePrimaryPhoneNumber VALUES ('330-432-4445',	'E105');
INSERT INTO SalesAssociatePrimaryPhoneNumber VALUES ('216-584-4583',	'E107');
INSERT INTO SalesAssociatePrimaryPhoneNumber VALUES ('440-256-8869',	'E109');
INSERT INTO SalesAssociatePrimaryPhoneNumber VALUES ('234-255-3482',	'E111');
INSERT INTO SalesAssociatePrimaryPhoneNumber VALUES ('330-677-9800',	'E113');
INSERT INTO SalesAssociatePrimaryPhoneNumber VALUES ('440-463-2553',	'E115');
INSERT INTO SalesAssociatePrimaryPhoneNumber VALUES ('216-543-5485',	'E117');
INSERT INTO SalesAssociatePrimaryPhoneNumber VALUES ('234-431-5582',	'E119');
INSERT INTO SalesAssociatePrimaryPhoneNumber VALUES ('330-854-9938',	'E121');
INSERT INTO SalesAssociatePrimaryPhoneNumber VALUES ('234-432-5968',	'E123');
INSERT INTO SalesAssociatePrimaryPhoneNumber VALUES ('234-168-4446',	'E125');
INSERT INTO SalesAssociatePrimaryPhoneNumber VALUES ('330-586-5048',	'E127');
INSERT INTO SalesAssociatePrimaryPhoneNumber VALUES ('330-256-9998',	'E129');
INSERT INTO SalesAssociatePrimaryPhoneNumber VALUES ('440-235-4948',	'E131');
INSERT INTO SalesAssociatePrimaryPhoneNumber VALUES ('234-558-5158',	'E133');
INSERT INTO SalesAssociatePrimaryPhoneNumber VALUES ('216-421-4686',	'E135');
