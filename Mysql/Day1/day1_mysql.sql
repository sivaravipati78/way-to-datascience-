create database dsedec;

use dsedec;
create table movies(mid integer,mname varchar(20),languag varchar(20));
insert into movies values(1, 'John Wick','English'),(2, 'Sivaji','Tamil'),(3, 'Jodha Akbhar','Hindi'),
(4, 'Bigil','Tamil'),(5, 'Red','Tamil'),(6, 'Premam','Malayalam'),(7, 'Bahubali','Telugu'),(8, 'KGF','Kanada'),
(9, 'Ford Vs Ferrari','English'),(10, 'Sura','Tamil'),(11, 'Harry Potter','English'),(12, 'Oye','Telugu');


insert into movies values(2, 'Sivaji','Tamil');
insert into movies values(3, 'Jodha Akbhar','Hindi');
insert into movies values(4, 'Bigil','Tamil');
insert into movies values(5, 'Red','Tamil');
insert into movies values(6, 'Premam','Malayalam');
insert into movies values(7, 'Bahubali','Telugu');
insert into movies values(8, 'KGF','Kanada');
insert into movies values(9, 'Ford Vs Ferrari','English');
insert into movies values(10, 'Sura','Tamil');
insert into movies values(11, 'Harry Potter','English');
insert into movies values(12, 'Oye','Telugu');
insert into movies values((13, 'Oye','Telugu'));
insert into movies(mid ,mname ,languag ) values(14, 'Oye','Telugu'),(15, 'Oye','Telugu');

select * from movies where mid in (1,2);
select * from movies where mid not in (1,2);

-- DELETE FROM movies WHERE  mid =2; 
-- SET SQL_SAFE_UPDATES=0;
select * from movies where mname like '% %';
select * from movies where mname like '%Vs%';
select * from movies where mname like '%i';
select * from movies where mname like '%tt%';
select * from movies where mname like '%a_';
select * from movies where mname like '___';
select * from movies where mname like '__h%';

select * from movies where mname not like '__h%';

select * from movies where mid =5;
select * from movies where mid <>5;
select * from movies where mid !=5;
select * from movies where mid <=5;
select * from movies where mid >=5;
select * from movies where mid >5;
select * from movies where mid <5;

select * from movies where mname like '___';
select * from movies where length(mname)= 15;
select * from movies where mid >5 and mid <10;
select * from movies where mid between 5 and 10;

show tables;
describe movies;
desc movies;
-- ----------------------------------------
CREATE TABLE customers (customer_id INTEGER primary key,first_name VARCHAR(10) NOT NULL,last_name VARCHAR(10) NOT NULL,dob DATE,phone VARCHAR(12));

select * from customers;
desc customers;

insert into customers(customer_id,first_name,last_name,dob,phone) values
(1, 'John', 'Brown', '1965-01-01', '800-555-1211'),
(2, 'Cynthia', 'Green', '1968-02-05', '800-555-1212'),
(3, 'Steve', 'White', '1971-03-16', '800-555-1213'),
(4, 'Gail', 'Black', NULL, '800-555-1214'),
(5, 'Doreen', 'Blue', '1970-05-20', NULL);

select * from customers;
select first_name,last_name from customers;
select concat(first_name,' ',last_name) 'customer name' from customers;
select * from customers where last_name like 'Bl%';
select * from customers where last_name like '%ee%' or first_name like '%ee%';
select * from customers where dob >= date('1970-01-01');
select * from customers where phone like '%12';
select * from customers where phone like '%12%'  ;
select * from customers where dob  is NULL;
select * from customers where phone  is NULL;
select * from customers where first_name like '%n';
select * from customers where first_name like '%i_';
select concat('This is to certify that ',first_name,' ',last_name,' with customer_id ',customer_id,' was born on ',ifnull(dob,'1970-01-01'),'and their phone number is ',ifnull(phone,'1234567')) from customers ;
select * from customers order by first_name desc;
select * from customers order by dob is null desc, dob asc,first_name desc ,last_name asc;

---------
