##### HR schema - can be loaded from seperate SQL file
#classicmodels - - can be loaded from seperate SQL file

######Rest of the tables created in bootcamp db
#create database bootcamp;
Use bootcamp;

#######Films table
Create table film
(
  film_id serial PRIMARY KEY,
  title text,
  length decimal(8,2)
);

INSERT INTO `bootcamp`.`film` (`film_id`, `title`, `length`) VALUES ('1', 'The Shawshank Redemption', '142');
INSERT INTO `bootcamp`.`film` (`film_id`, `title`, `length`) VALUES ('2', ' Forrest Gump', '142');
INSERT INTO `bootcamp`.`film` (`film_id`, `title`, `length`) VALUES ('3', 'The Godfather', '175');
INSERT INTO `bootcamp`.`film` (`film_id`, `title`, `length`) VALUES ('4', ' Schindler\'s List', '195');
INSERT INTO `bootcamp`.`film` (`film_id`, `title`, `length`) VALUES ('5', 'The Green Mile', '189');
INSERT INTO `bootcamp`.`film` (`film_id`, `title`, `length`) VALUES ('6', 'Goodfellas', '146');


#####Secret santa game question
CREATE TABLE giftnames
(
  id serial,
  name text,
  assignment int
);

INSERT INTO giftnames (name) VALUES ('Craig Kerstiens');
INSERT INTO giftnames (name) VALUES ('Aunt Jennifer');
INSERT INTO giftnames (name) VALUES ('Uncle Joe');

UPDATE giftnames set assignment = 2 where id = 1;
UPDATE giftnames set assignment = 3 where id = 2;
UPDATE giftnames set assignment = 1 where id = 3;

#####Products PRomotions tables
CREATE TABLE Products
(
  Product_id serial,
  Product_name text,
  Price decimal(8,2)
);
INSERT INTO `bootcamp`.`products` (`Product_id`, `Product_name`, `Price`) VALUES ('10001', 'Handbag', '2500');
INSERT INTO `bootcamp`.`products` (`Product_id`, `Product_name`, `Price`) VALUES ('10002', 'Cluthches', '899');
INSERT INTO `bootcamp`.`products` (`Product_id`, `Product_name`, `Price`) VALUES ('10003', 'Shoes ', '4000');
INSERT INTO `bootcamp`.`products` (`Product_id`, `Product_name`, `Price`) VALUES ('10004', 'Sandals', '1500');
INSERT INTO `bootcamp`.`products` (`Product_id`, `Product_name`, `Price`) VALUES ('10005', 'Pump heels', '1999');
INSERT INTO `bootcamp`.`products` (`Product_id`, `Product_name`, `Price`) VALUES ('10006', 'Flats', '599');

CREATE TABLE Promotions
(
  Promotion_id serial,
  Promo_name text,
  Promo_desc text
);
INSERT INTO `bootcamp`.`promotions` (`Promotion_id`, `Promo_name`, `Promo_desc`) VALUES ('1', 'EOSS-Dec', 'End of Season Sales December');
INSERT INTO `bootcamp`.`promotions` (`Promotion_id`, `Promo_name`, `Promo_desc`) VALUES ('2', 'EOSS-July', 'End of Season Sale July');
INSERT INTO `bootcamp`.`promotions` (`Promotion_id`, `Promo_name`, `Promo_desc`) VALUES ('3', 'Diwali Sale', 'Diwali Sale');
INSERT INTO `bootcamp`.`promotions` (`Promotion_id`, `Promo_name`, `Promo_desc`) VALUES ('4', 'Mid Year Sale', 'Middle of Year Sale');


##### Students and Course tables
CREATE TABLE Students
(Student_id serial,
Student_name text);

INSERT INTO `bootcamp`.`students` (`Student_id`, `Student_name`) VALUES ('101', 'Akhil');
INSERT INTO `bootcamp`.`students` (`Student_id`, `Student_name`) VALUES ('102', 'Bharath');
INSERT INTO `bootcamp`.`students` (`Student_id`, `Student_name`) VALUES ('103', 'Chetan');
INSERT INTO `bootcamp`.`students` (`Student_id`, `Student_name`) VALUES ('104', 'Dave');
INSERT INTO `bootcamp`.`students` (`Student_id`, `Student_name`) VALUES ('105', 'Jack');


CREATE TABLE Courses
(Course_id serial,
Course_name text, 
Course_Desc text);

INSERT INTO `bootcamp`.`courses` (`Course_id`, `Course_name`, `Course_Desc`) VALUES ('301', 'Statistics', 'Statistics');
INSERT INTO `bootcamp`.`courses` (`Course_id`, `Course_name`, `Course_Desc`) VALUES ('302', 'DBMS', 'Database management systems');
INSERT INTO `bootcamp`.`courses` (`Course_id`, `Course_name`, `Course_Desc`) VALUES ('303', 'ML', 'Machine learning');
INSERT INTO `bootcamp`.`courses` (`Course_id`, `Course_name`, `Course_Desc`) VALUES ('304', 'DV', 'Data Visualisation');
INSERT INTO `bootcamp`.`courses` (`Course_id`, `Course_name`, `Course_Desc`) VALUES ('305', 'EDA', 'Exploratory Data Analysis');



####### World cup match 
CREATE TABLE Teams 
(Team_id serial, 
Team_name text, 
Pool varchar(2));

INSERT INTO `bootcamp`.`teams` (`Team_id`, `Team_name`, `Pool`) VALUES ('1', 'India', 'a');
INSERT INTO `bootcamp`.`teams` (`Team_id`, `Team_name`, `Pool`) VALUES ('2', 'Australia', 'b');
INSERT INTO `bootcamp`.`teams` (`Team_id`, `Team_name`, `Pool`) VALUES ('3', 'England', 'a');
INSERT INTO `bootcamp`.`teams` (`Team_id`, `Team_name`, `Pool`) VALUES ('4', 'Pakistan', 'b');
INSERT INTO `bootcamp`.`teams` (`Team_id`, `Team_name`, `Pool`) VALUES ('5', 'Srilanka', 'a');
INSERT INTO `bootcamp`.`teams` (`Team_id`, `Team_name`, `Pool`) VALUES ('6', 'Afghanistan', 'b');
INSERT INTO `bootcamp`.`teams` (`Team_id`, `Team_name`, `Pool`) VALUES ('7', 'Bangladesh', 'a');
INSERT INTO `bootcamp`.`teams` (`Team_id`, `Team_name`, `Pool`) VALUES ('8', 'New Zealand', 'b');
INSERT INTO `bootcamp`.`teams` (`Team_id`, `Team_name`, `Pool`) VALUES ('9', 'South Africa', 'a');
INSERT INTO `bootcamp`.`teams` (`Team_id`, `Team_name`, `Pool`) VALUES ('10', 'West Indies', 'b');


##### Deck of cards 

CREATE TABLE Ranks
(ranks text);
 
CREATE TABLE suits 
(
    suit TEXT NOT NULL
);
 
INSERT INTO ranks(ranks) 
VALUES('2'),('3'),('4'),('5'),('6'),('7'),('8'),('9'),('10'),('J'),('Q'),('K'),('A');
 
INSERT INTO suits(suit) 
VALUES('Clubs'),('Diamonds'),('Hearts'),('Spades');

##### Store products tables

CREATE TABLE Store
(store_id int PRIMARY KEY, 
store_name text,
address text);

INSERT INTO `bootcamp`.`store` (`store_id`, `store_name`, `address`) VALUES ('10', 'Megastore', 'HSR,Bangalore');
INSERT INTO `bootcamp`.`store` (`store_id`, `store_name`, `address`) VALUES ('11', 'Supermarket', 'Haralur,Banglaore');
INSERT INTO `bootcamp`.`store` (`store_id`, `store_name`, `address`) VALUES ('12', 'Outlet', 'Bellandur,Bangalore');


CREATE TABLE Products1
(product_id int PRIMARY KEY, 
product_name text,
 description text);
 
 INSERT INTO `bootcamp`.`products1` (`product_id`, `product_name`, `description`) VALUES ('11001', 'Shoes', 'Full covered shoes ');
INSERT INTO `bootcamp`.`products1` (`product_id`, `product_name`, `description`) VALUES ('11002', 'Socks', 'Ankle length socks');
INSERT INTO `bootcamp`.`products1` (`product_id`, `product_name`, `description`) VALUES ('11003', 'Slippers', 'Casual Slippers');


CREATE TABLE Purchases
(store_id int ,
product_id int,
purchase_id serial PRIMARY KEY, 
purchase_amt decimal(8,2),
FOREIGN KEY(store_id) REFERENCES Store(store_id),
FOREIGN KEY(product_id) REFERENCES Products1(product_id));
INSERT INTO `bootcamp`.`purchases` (`store_id`, `product_id`, `purchase_id`, `purchase_amt`) VALUES ('10', '11001', '1', '999');
INSERT INTO `bootcamp`.`purchases` (`store_id`, `product_id`, `purchase_id`, `purchase_amt`) VALUES ('11', '11001', '2', '999');
INSERT INTO `bootcamp`.`purchases` (`store_id`, `product_id`, `purchase_id`, `purchase_amt`) VALUES ('10', '11002', '3', '799');
INSERT INTO `bootcamp`.`purchases` (`store_id`, `product_id`, `purchase_id`, `purchase_amt`) VALUES ('10', '11003', '4', '599');
INSERT INTO `bootcamp`.`purchases` (`store_id`, `product_id`, `purchase_id`, `purchase_amt`) VALUES ('11', '11002', '5', '799');
INSERT INTO `bootcamp`.`purchases` (`store_id`, `product_id`, `purchase_id`, `purchase_amt`) VALUES ('10', '11001', '6', '999');
INSERT INTO `bootcamp`.`purchases` (`store_id`, `product_id`, `purchase_id`, `purchase_amt`) VALUES ('12', '11003', '7', '599');


######## Pizza company data

CREATE TABLE   PizzaCompany 
(
   CompanyId   int  PRIMARY KEY ,
   CompanyName   varchar (50) ,
   CompanyCity   varchar (30)  
);

INSERT INTO   PizzaCompany  ( CompanyId ,  CompanyName ,  CompanyCity ) VALUES(1,'Dominos','Los Angeles') ;
INSERT INTO   PizzaCompany  ( CompanyId ,  CompanyName ,  CompanyCity ) VALUES(2,'Pizza Hut','San Francisco') ;
INSERT INTO   PizzaCompany  ( CompanyId ,  CompanyName ,  CompanyCity ) VALUES(3,'Papa johns','San Diego') ;
INSERT INTO   PizzaCompany  ( CompanyId ,  CompanyName ,  CompanyCity ) VALUES(4,'Ah Pizz','Fremont') ;
INSERT INTO   PizzaCompany  ( CompanyId ,  CompanyName ,  CompanyCity ) VALUES(5,'Nino Pizza','Las Vegas') ;
INSERT INTO   PizzaCompany  ( CompanyId ,  CompanyName ,  CompanyCity ) VALUES(6,'Pizzeria','Boston') ;
INSERT INTO   PizzaCompany  ( CompanyId ,  CompanyName ,  CompanyCity ) VALUES(7,'chuck e cheese','Chicago') ;
 
CREATE TABLE   Foods 
(
 ItemId  INT  PRIMARY KEY , 
  ItemName   Varchar(50), 
  UnitsSold  int,
 CompanyID int,
 FOREIGN KEY(CompanyID) REFERENCES PizzaCompany(CompanyID)
 );
 
INSERT INTO   Foods  ( ItemId ,  ItemName ,  UnitsSold ,  CompanyId ) VALUES(1,'Large Pizza',5,2);
INSERT INTO   Foods  ( ItemId ,  ItemName ,  UnitsSold ,  CompanyId ) VALUES(2,'Garlic Knots',6,3);
INSERT INTO   Foods  ( ItemId ,  ItemName ,  UnitsSold ,  CompanyId ) VALUES(3,'Large Pizza',3,3);
INSERT INTO   Foods  ( ItemId ,  ItemName ,  UnitsSold ,  CompanyId ) VALUES(4,'Medium Pizza',8,4);
INSERT INTO   Foods  ( ItemId ,  ItemName ,  UnitsSold ,  CompanyId ) VALUES(5,'Breadsticks',7,1);
INSERT INTO   Foods  ( ItemId ,  ItemName ,  UnitsSold ,  CompanyId ) VALUES(6,'Medium Pizza',11,1);
INSERT INTO   Foods  ( ItemId ,  ItemName ,  UnitsSold ,  CompanyId ) VALUES(7,'Small Pizza',9,6);
INSERT INTO   Foods  ( ItemId ,  ItemName ,  UnitsSold ,  CompanyId ) VALUES(8,'Small Pizza',6,7);
 

CREATE TABLE   WaterPark 
(
   WaterParkLocation  VARCHAR(50),
  CompanyId  int,
 FOREIGN KEY(CompanyID) REFERENCES PizzaCompany(CompanyID)
);

INSERT INTO   WaterPark  ( WaterParkLocation ,  CompanyId ) VALUES('Street 14',1);
INSERT INTO   WaterPark  ( WaterParkLocation ,  CompanyId ) VALUES('Boulevard 2',2);
INSERT INTO   WaterPark  ( WaterParkLocation ,  CompanyId ) VALUES('Rogers 54',4);
INSERT INTO   WaterPark  ( WaterParkLocation ,  CompanyId ) VALUES('Street 14',3);
INSERT INTO   WaterPark  ( WaterParkLocation ,  CompanyId ) VALUES('Rogers 54',5);
INSERT INTO   WaterPark  ( WaterParkLocation ,  CompanyId ) VALUES('Boulevard 2',5);
 

###### PRojects members tables
CREATE TABLE projects(
    id INT PRIMARY KEY ,
    title VARCHAR(255) NOT NULL
);
CREATE TABLE members(
    id INT PRIMARY KEY ,
    name VARCHAR(120) NOT NULL,
    project_id INT,
    FOREIGN KEY (project_id) REFERENCES projects(id)
);
INSERT INTO projects(id,title)
VALUES(1,'New CRM for Project Sales'),(2,'ERP Implementation'),(3,'Develop Mobile Sales Platform');
INSERT INTO members(id,name, project_id)
VALUES (1,'John Doe', 1),(2,'Lily Bush', 1),(3,'Jane Doe', 2),(4,'Jack Daniel', null);