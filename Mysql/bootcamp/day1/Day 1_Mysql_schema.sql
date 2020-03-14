Create database Bootcamp;

Use Bootcamp;

#Section A
CREATE table  books
( 
Id INT ,
best_book_id INT , 
authors VARCHAR(255),
original_publication_year INT,
booksoriginal_title VARCHAR(255) ,
title VARCHAR(255),
language_code VARCHAR(255),
average_rating FLOAT,
Sell_count_2017 INT,
Sell_count_2018 INT,
Work_text_reviews_count INT,
ratings_1 INT ,
Genre VARCHAR(255), 
Price_per_book INT
);

INSERT INTO books
(`Id`,
`best_book_id`,
`authors`,
`original_publication_year`,
`booksoriginal_title`,
`title`,
`language_code`,
`average_rating`,
`Sell_count_2017`,
`Sell_count_2018`,
`Work_text_reviews_count`,
`ratings_1`,
`Genre`,
`Price_per_book`)
VALUES
('7481' , '821003' , 'A.A. Milne, Ernest H. Shepard' , '1924' , 'When We Were Very Young' , 'When We Were Very Young (Winnie-the-Pooh, #3)' , 'en-US' , '4.32' , '17922' , '18677' , '343' , '145' , 'Legend' , '981
'), 
('444' , '99107' , 'A.A. Milne, Ernest H. Shepard' , '1926' , 'Winnie-the-Pooh' , 'Winnie-the-Pooh (Winnie-the-Pooh, #1)' , 'eng' , '4.34' , '207550' , '215213' , '2978' , '2636' , ' Action and Adventure' , '720
'), 
('2648' , '99111' , 'A.A. Milne, Ernest H. Shepard' , '1926' , 'Winnie-the-Pooh & The House at Pooh Corner' , 'The World of Winnie-the-Pooh (Winnie-the-Pooh, #1-2)' , 'eng' , '4.43' , '32504' , '41109' , '625' , '444' , 'Fantasy' , '1119
'), 
('7696' , '821000' , 'A.A. Milne, Ernest H. Shepard' , '1927' , 'Now We Are Six' , 'Now We Are Six (Winnie-the-Pooh, #4)' , 'eng' , '4.38' , '15840' , '16568' , '287' , '85' , 'Legend' , '618
'), 
('1545' , '776407' , 'A.A. Milne, Ernest H. Shepard' , '1928' , 'The House at Pooh Corner' , 'The House at Pooh Corner (Winnie-the-Pooh, #2)' , 'en-US' , '4.36' , '69102' , '71538' , '866' , '689' , 'Mystery' , '1097
'), 
('1590' , '91244' , 'Beverly Cleary' , '1955' , 'Beezus and Ramona' , 'Beezus and Ramona (Ramona, #1)' , '' , '3.97' , '75987' , '79139' , '1477' , '1553' , 'Classic' , '764
'), 
('2877' , '99110' , 'A.A. Milne, Ernest H. Shepard' , '1961' , '' , 'The Complete Tales and Poems of Winnie-the-Pooh (Winnie-the-Pooh, #1-4)' , 'en-US' , '4.49' , '37312' , '38520' , '249' , '300' , 'Fantasy' , '1160
'), 
('2049' , '78039' , 'Beverly Cleary' , '1968' , 'Ramona the Pest' , 'Ramona the Pest (Ramona, #2)' , '' , '4.04' , '52242' , '54639' , '1082' , '805' , 'Mystery' , '463
'), 
('6959' , '13168' , 'Beverly Cleary' , '1970' , 'Runaway Ralph' , 'Runaway Ralph (Ralph S. Mouse, #2)' , '' , '3.95' , '16845' , '17858' , '324' , '159' , 'Drama' , '835
'), 
('3575' , '1728744' , 'A.L. Singer, Walt Disney Company' , '1974' , 'Sleeping Beauty' , 'Sleeping Beauty (Disney Princess, 5)' , 'eng' , '4.32' , '27469' , '27470' , '69' , '360' , 'Mystery' , '808
'), 
('5860' , '89551' , 'Beverly Cleary' , '1980' , 'Ramona and Her Mother' , 'Ramona and Her Mother (Ramona, #5)' , 'eng' , '4.08' , '20053' , '20989' , '422' , '199' , 'Classic' , '946
'), 
('1825' , '91253' , 'Beverly Cleary' , '1981' , 'Ramona Quimby, Age 8' , 'Ramona Quimby, Age 8 (Ramona, #6)' , 'eng' , '4.08' , '58135' , '61520' , '1177' , '934' , 'Drama' , '1031
'), 
('2701' , '26582' , 'A.N. Roquelaure, Anne Rice' , '1983' , 'The Claiming of Sleeping Beauty' , 'The Claiming of Sleeping Beauty (Sleeping Beauty, #1)' , 'en-US' , '3.28' , '38387' , '42828' , '3713' , '5675' , 'Mystery' , '1102
'), 
('4042' , '91249' , 'Beverly Cleary' , '1984' , 'Ramona Forever' , 'Ramona Forever (Ramona, #7)' , '' , '4.05' , '26685' , '28091' , '371' , '366' , 'Crime and Detective' , '673
'), 
('4820' , '25190' , 'A.N. Roquelaure, Anne Rice' , '1985' , 'Beauty\'s Release (Sleeping Beauty, #3)' , 'Beauty\'s Release (Sleeping Beauty, #3)' , 'eng' , '3.71' , '22424' , '24040' , '652' , '1218' , 'Fantasy' , '1053
'), 
('4265' , '101911' , 'A. Manette Ansay' , '1994' , 'Vinegar Hill (P.S.)' , 'Vinegar Hill' , 'en-US' , '3.36' , '23966' , '24802' , '901' , '1051' , 'Legend' , '649
'), 
('1449' , '28' , 'Bill Bryson' , '1995' , 'Notes from a Small Island' , 'Notes from a Small Island' , 'eng' , '3.91' , '66947' , '72421' , '3323' , '1073' , 'Classic' , '1109
'), 
('4717' , '508413' , 'Beverly  Lewis' , '1997' , 'The Shunning' , 'The Shunning (The Heritage of Lancaster County, #1)' , '' , '4.13' , '20379' , '21421' , '774' , '259' , ' Action and Adventure' , '516
'), 
('316' , '9791' , 'Bill Bryson' , '1997' , 'A Walk in the Woods' , 'A Walk in the Woods' , 'eng' , '4.05' , '250192' , '264449' , '14422' , '3553' , 'Mystery' , '1091
'), 
('1976' , '25' , 'Bill Bryson' , '1998' , 'Notes from a Big Country' , 'I\'m a Stranger Here Myself: Notes on Returning to America after Twenty Years Away' , 'en-US' , '3.89' , '44610' , '49430' , '2335' , '601' , 'Crime and Detective' , '1153
'), 
('1460' , '24' , 'Bill Bryson' , '2000' , 'Down Under' , 'In a Sunburned Country' , 'eng' , '4.05' , '58688' , '66668' , '4455' , '607' , 'Drama' , '900
'), 
('9760' , '80750' , 'Beverly  Lewis' , '2002' , 'The Covenant' , 'The Covenant (Abram\'s Daughters, #1)' , '' , '4.12' , '9408' , '10882' , '771' , '120' , 'Classic' , '687
'), 
('374' , '21' , 'Bill Bryson' , '2003' , 'A Short History of Nearly Everything' , 'A Short History of Nearly Everything' , 'en-US' , '4.19' , '191535' , '206367' , '9065' , '3514' , ' Action and Adventure' , '489
'), 
('4836' , '28116' , 'A.J. Jacobs' , '2004' , 'The Know-It-All: One Man\'s Humble Quest to Become the Smartest Person in the World' , 'The Know-It-All: One Man\'s Humble Quest to Become the Smartest Person in the World' , 'eng' , '3.77' , '22226' , '23256' , '2358' , '363' , 'Mystery' , '972
'), 
('2044' , '495395' , 'A.J. Jacobs' , '2007' , 'The Year of Living Biblically: One Man\'s Humble Quest to Follow the Bible As Literally As Possible' , 'The Year of Living Biblically: One Man\'s Humble Quest to Follow the Bible as Literally as Possible' , 'en-US' , '3.76' , '48711' , '51885' , '4930' , '1434' , 'Legend' , '1154
'), 
('1710' , '7507825' , 'Bill Bryson' , '2010' , 'At Home: A Short History of Private Life' , 'At Home: A Short History of Private Life' , 'eng' , '3.96' , '55296' , '61053' , '5259' , '995' , 'Legend' , '408
'), 
('5888' , '16102880' , 'A. Meredith Walters' , '2012' , '' , 'Bad Rep (Bad Rep, #1)' , 'en-GB' , '3.91' , '24287' , '24367' , '1179' , '575' , 'Classic' , '461
'), 
('6176' , '16081754' , 'A. Meredith Walters' , '2012' , 'Find You in the Dark' , 'Find You in the Dark (Find You in the Dark, #1)' , 'eng' , '3.98' , '24615' , '25092' , '1962' , '725' , 'Drama' , '426
'), 
('7657' , '11983940' , 'A.C. Gaughen' , '2012' , 'Scarlet' , 'Scarlet (Scarlet, #1)' , 'eng' , '3.95' , '19665' , '20503' , '2574' , '669' , 'Drama' , '503
'), 
('8977' , '8570787' , 'A.J. Jacobs' , '2012' , '' , 'Drop Dead Healthy: One Man\'s Humble Quest for Bodily Perfection' , 'eng' , '3.75' , '10831' , '11874' , '1622' , '156' , 'Fantasy' , '1034
'), 
('7944' , '16061734' , 'A.M. Homes' , '2012' , 'May We Be Forgiven' , 'May We Be Forgiven' , 'en-CA' , '3.66' , '7545' , '11953' , '1750' , '416' , 'Crime and Detective' , '1065
'), 
('3347' , '12558285' , 'A.G. Adam' , '2013' , 'Splintered' , 'Splintered (Splintered, #1)' , 'eng' , '3.96' , '37225' , '41708' , '6562' , '1634' , 'Mystery' , '955
'), 
('2509' , '25843420' , 'A.G. Riddle' , '2013' , 'The Atlantis Gene' , 'The Atlantis Gene (The Origin Mystery, #1)' , 'eng' , '3.69' , '20626' , '40455' , '2909' , '1360' , 'Drama' , '924
'), 
('4903' , '25843439' , 'A.G. Riddle' , '2013' , 'The Atlantis Plague' , 'The Atlantis Plague (The Origin Mystery, #2)' , 'eng' , '3.88' , '7905' , '20875' , '849' , '229' , 'Fantasy' , '507
'), 
('8933' , '22609522' , 'Bill Browder' , '2014' , 'Red Notice: A True Story of High Finance, Murder, and One Manâ€™s Fight for Justice' , 'Red Notice: A True Story of High Finance, Murder, and One Manâ€™s Fight for Justice' , 'en-GB' , '4.39' , '8729' , '12693' , '1398' , '117' , 'Drama' , '1064
'), 
('9130' , '17449197' , 'A.G. Adam' , '2014' , 'Unhinged' , 'Unhinged (Splintered, #2)' , 'eng' , '4.25' , '14445' , '16746' , '2387' , '152' , 'Mystery' , '522
'), 
('6015' , '25843453' , 'A.G. Riddle' , '2014' , 'The Atlantis World' , 'The Atlantis World (The Origin Mystery, #3)' , 'eng' , '3.93' , '9240' , '16826' , '792' , '200' , 'Legend' , '445
'), 
('7004' , '23675858' , 'A.G. Riddle' , '2014' , 'Departure' , 'Departure' , 'eng' , '3.79' , '11143' , '12344' , '1132' , '254' , 'Crime and Detective' , '830
'), 
('2243' , '25837341' , 'A.J. Banner' , '2015' , '' , 'The Good Neighbor' , 'eng' , '3.33' , '37604' , '38986' , '2898' , '1973' , 'Legend' , '490');



#Section B
CREATE TABLE employee_details
(
Employee_ID VARCHAR(255), 
Employee_Name VARCHAR(255), 
Country VARCHAR(255), 
YearsOfExperience FLOAT, 
Salary INT, 
Department VARCHAR(255), 
Designation VARCHAR(255), 
Employee_Rating FLOAT, 
Year_of_Joining INT
);



INSERT INTO employee_details
(`Employee_ID`,
`Employee_Name`,
`Country`,
`YearsOfExperience`,
`Salary`,
`Department`,
`Designation`,
`Employee_Rating`,
`Year_of_Joining`)
VALUES
						 
('1','Zoe','UK',1.95,37006,'Sales','Freshers',4.3,2019), 
 ('2','Emile','Russia',1.5,37731,'Sales','Freshers',3.4,2019), 
 ('3','Ema','Italy',1.1,39343,'Sales','Freshers',4.2,2019), 
 ('4','Sandy','Ameraicas',2.2,39891,'Sales','Freshers',4.7,2019), 
 ('5','Lola','Australia',10.01,40193,'Planning','Manager',3.1,2018), 
 ('6','Matthew','Europe',8.32,40926,'Planning','Manager',4.8,2018), 
 ('7','Hardik','Ameraicas',4.73,42339,'Planning','Sr. Lead',4.5,2018), 
 ('8','Daniel','UK',1.24,43472,'Planning','Freshers',5,2019), 
 ('9','Dave','Russia',2,43525,'Planning','Freshers',4.3,2019), 
 ('10','Diana','Italy',3.28,45860,'Planning','Jr. Lead',4,2018), 
 ('11','Den','Ameraicas',1.3,46205,'Marketing','Freshers',3.4,2018), 
 ('12','Adam','Australia',4.76,51497,'Marketing','Sr. Lead',3.1,2019), 
 ('13','Julia','Europe',8.22,52534,'Marketing','Manager',4.3,2019), 
 ('14','Jennice','Ameraicas',3.2,54445,'Marketing','Jr. Lead',3.2,2019), 
 ('15','Pat','UK',4,55794,'Marketing','Sr. Lead',3,2019), 
 ('16','Steven','Russia',2.9,56642,'Marketing','Jr. Lead',3.5,2019), 
 ('17','Daniel','Italy',4,56957,'Marketing','Sr. Lead',3.1,2018), 
 ('18','Priyanka','Ameraicas',4.1,57081,'Admin','Sr. Lead',4.5,2019), 
 ('19','Daniel','Australia',3.7,57189,'Admin','Jr. Lead',3.1,2019), 
 ('20','James','Europe',3,60150,'Admin','Jr. Lead',4,2018), 
 ('21','Rahul','Ameraicas',4.5,61111,'Admin','Sr. Lead',4.6,2019), 
 ('22','Priya','UK',7.05,61147,'Admin','Asst. Manager',4.7,2019), 
 ('23','Jason','Russia',3.9,63218,'Admin','Jr. Lead',4.9,2019), 
 ('24','Shaurya','Italy',6.03,64405,'Admin','Asst. Manager',4.9,2019), 
 ('25','Dazzy','Ameraicas',3.2,64445,'Admin','Jr. Lead',4.9,2018), 
 ('26','Hazel','Australia',5.1,66029,'Admin','Sr. Lead',3.4,2019), 
 ('27','Tom','Europe',4.9,67938,'Admin','Sr. Lead',4.7,2019), 
 ('28','Dave','Ameraicas',2.31,73191,'Admin','Freshers',4.1,2018), 
 ('29','Irene','UK',3.32,78385,'Admin','Jr. Lead',3.8,2018), 
 ('30','Nina','Russia',5.9,81363,'Admin','Asst. Manager',4.1,2018), 
 ('31','Curtis','Italy',5.3,83088,'Admin','Asst. Manager',3.9,2019), 
 ('32','Karen','Ameraicas',6.63,86051,'Admin','Asst. Manager',3.3,2018), 
 ('33','Zall','Australia',10.02,88789,'Admin','Manager',4.8,2018), 
 ('34','Eleni','Europe',9.05,89719,'Admin','Manager',3.8,2019), 
 ('35','Amy','Ameraicas',5.24,89935,'Admin','Asst. Manager',5,2018), 
 ('36','Allen','UK',6.8,91738,'Admin','Asst. Manager',4.3,2018), 
 ('37','Oliver','Russia',6,93940,'Admin','Asst. Manager',3.8,2018), 
 ('38','Peter','Italy',5.1,94090,'Admin','Sr. Lead',3.2,2019), 
 ('39','Gloria','Ameraicas',7.51,95776,'Engineering','Asst. Manager',3.4,2019), 
 ('40','Claire','Australia',2.7,95919,'Engineering','Jr. Lead',4.8,2019), 
 ('41','Randall','Europe',5.28,96197,'Engineering','Asst. Manager',4,2019), 
 ('42','Alex','Ameraicas',6.79,96573,'Engineering','Asst. Manager',4.7,2018), 
 ('43','Gerald','UK',7.1,98273,'Engineering','Asst. Manager',4.8,2019), 
 ('44','Luke','Russia',7.9,101302,'Engineering','Manager',3,2018), 
 ('45','Rahul','Italy',9,105582,'Engineering','Manager',3.3,2019), 
 ('46','Cameron','Ameraicas',5.63,105922,'Engineering','Asst. Manager',3.2,2019), 
 ('47','Mitchell','Australia',3.82,106359,'HR','Jr. Lead',3.6,2019), 
 ('48','Phil','Europe',8.7,109431,'HR','Manager',3.2,2018), 
 ('49','Many','Ameraicas',9.6,112635,'HR','Manager',4.9,2018), 
 ('50','Dylan','UK',8.2,113812,'Engineering','Manager',3.5,2019), 
 ('51','Frank','Russia',2.69,114814,'Engineering','Jr. Lead',4,2019), 
 ('52','Natalia','Italy',9.5,116969,'Operations','Manager',3,2019), 
 ('53','Rahul','Ameraicas',10.5,121872,'Operations','Manager',3.5,2019), 
 ('54','Sal','Australia',10.3,122391,'Operations','Manager',4.8,2019), 
 ('55','DeDe','Europe',4.87,124346,'Operations','Sr. Lead',3.9,2018), 
 ('56','Sonia','Ameraicas',5.01,125064,'Operations','Sr. Lead',4.1,2018), 
 ('57','Ronnie','UK',5.45,125343,'Operations','Asst. Manager',4.1,2018), 
 ('58','Daniel','Russia',9.25,127587,'Operations','Manager',3.1,2019);
