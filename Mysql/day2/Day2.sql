
use dsedec;

CREATE TABLE product_types (
  product_type_id INTEGER  PRIMARY KEY,
  name VARCHAR(10) NOT NULL
);

CREATE TABLE products (
  product_id INTEGER    PRIMARY KEY,
  product_type_id INTEGER
        REFERENCES product_types(product_type_id),
  name VARCHAR(30) NOT NULL,
  description VARCHAR(50),
  price decimal(5, 2)
);

INSERT INTO product_types (product_type_id, name) VALUES ( 1, 'Book');
INSERT INTO product_types (product_type_id, name) VALUES (  2, 'Video');
INSERT INTO product_types (product_type_id, name) VALUES ( 3, 'DVD');
INSERT INTO product_types (product_type_id, name) VALUES ( 4, 'CD');
INSERT INTO product_types (product_type_id, name) VALUES ( 5, 'Magazine');
-- commit the transaction
COMMIT;

-- insert sample data into products table

INSERT INTO products (  product_id, product_type_id, name, description, price) VALUES (1, 1, 'Modern Science', 'A description of modern science', 19.95);
INSERT INTO products (  product_id, product_type_id, name, description, price) VALUES (2, 1, 'Chemistry', 'Introduction to Chemistry', 30.00);
INSERT INTO products (  product_id, product_type_id, name, description, price) VALUES (3, 2, 'Supernova', 'A star explodes', 25.99);
INSERT INTO products (  product_id, product_type_id, name, description, price) VALUES (4, 2, 'Tank War', 'Action movie about a future war', 13.95);
INSERT INTO products (  product_id, product_type_id, name, description, price) VALUES (5, 2, 'Z Files', 'Series on mysterious activities', 49.99);
INSERT INTO products (  product_id, product_type_id, name, description, price) VALUES (6, 2, '2412: The Return', 'Aliens return', 14.95);
INSERT INTO products (  product_id, product_type_id, name, description, price) VALUES (7, 3, 'Space Force 9', 'Adventures of heroes', 13.49);
INSERT INTO products (  product_id, product_type_id, name, description, price) VALUES (8, 3, 'From Another Planet', 'Alien from another planet lands on Earth', 12.99);
INSERT INTO products (  product_id, product_type_id, name, description, price) VALUES (9, 4, 'Classical Music', 'The best classical music', 10.99);
INSERT INTO products (  product_id, product_type_id, name, description, price) VALUES (10, 4, 'Pop 3', 'The best popular music', 15.99);
INSERT INTO products (  product_id, product_type_id, name, description, price) VALUES (11, 4, 'Creative Yell', 'Debut album', 14.99);
INSERT INTO products (  product_id, product_type_id, name, description, price) VALUES (12, NULL, 'My Front Line', 'Their greatest hits', 13.49);
COMMIT;


select * from products;
select * from product_types;

select * from customers;
select upper(first_name) first_name,ucase(first_name),(last_name) last_name from customers;

select ltrim(first_name),rtrim(first_name),trim(first_name) from customers;


select ltrim('   dec     '),rtrim('     dec    '),trim('    dec     ') from dual;

select first_name, lpad(first_name,10,'.'),rpad(first_name,10,'*') from customers;

select first_name, reverse(first_name) from customers;

select name,substring(name,1,1) from products;
select name,substr(name,2,3) from products;
select name,substr(name,3,2) from products;
select name,substr(name,-3,2) from products;

select name, replace(name,'o','O') from products;
select name, replace(name,substr(name,1,1),lower(substr(name,1,1))) from products;
select name,instr(name ,'e') from products;
select 8+7,8-7,8/7,8*7,8 mod 7, 8 div 7 from dual;
select power(2,3) from dual;
select abs(-200),abs(200) from dual;
select sign(-200),sign(200),sign(0) from dual;
select ceil(33.000000001),floor(33.000000001) from dual;
select ceil(33.9999),floor(33.9999) from dual;
select ceil(-33.9999),floor(-33.9999) from dual;
select round(2.9999,2),round(2.5555),round(2.4999),round(2.4999999,3) from dual;
select truncate(625.883,2),round(625.883,2) from dual;

select round(74.367,2),truncate(74.367,2) from dual;
select (6+3)/100*56 from dual;
--  ----denomination
select (375 div 200) 200din, ((375 mod 200) div 100) 100din, ((375 mod 200) mod 100) div 50 50din,((((375 mod 200) mod 100) mod 50) div 20) div20,(((((375 mod 200) mod 100) mod 50) mod 20) div 5) 5din from dual;

-- date
select curdate(),current_date(),curtime(),current_time(),current_user(),current_timestamp() from dual;

select datediff(curdate(),'1994-04-29')/365 from dual;
select dayname(curdate()) from dual;
select dayofyear(curdate()) from dual;
select dayofmonth(curdate()) from dual;
select dayofweek(curdate()) from dual;
select weekofyear(curdate()) from dual;
select adddate(curdate(),interval 5 day) from dual;
select adddate(curdate(),interval 5 month) from dual;
select adddate(curdate(),interval 30 day) from dual;
select adddate(curdate(),interval 1 year) from dual;
select last_day(curdate()) from dual;
-- -----aggregate function

select price from products;
select sum(price),min(price),max(price),count(price),avg(price) from products;
select product_type_id,sum(price),avg(price) from products group by product_type_id;
select product_type_id,sum(price),avg(price) from products where product_type_id is not null group by 1;
select product_type_id,sum(price),avg(price) pp 
from products 
where product_type_id is not null 
group by 1 
having pp>13;                                -- for agrregate use having only used with group by
select product_type_id,sum(price),avg(price) pp 
from products 
where product_type_id is not null 
group by 1 
having pp>20
order by 2 desc; 

select *
from products 
-- #where product_type_id is not null and 
-- #group by product_type_id
having price > avg(price);

select * from products
 
order by price desc limit 2;

select * from products order by price desc limit 3,1;-- 4th expensive product;
select * from products order by price desc limit 1 offset 3;
/*
select from 
where
group by 
having
order by
limit 2 offset 3
*/

select product_id,name,price ,
case 
when price <=15 then 'price is low'
when price >15 AND PRICE <=20 then 'price is moderate'
when price >20 AND PRICE <=30 then 'price is moderate'
else 'price is expensive'
end comments
from products;

select product_id,name,price ,
case 
when price <=15 then price -price/10
when price >15 AND PRICE <=20 then price -price/5
when price >20 AND PRICE <=30 then price -price/4
else price -price*30/100
end after_discounted_price

from products;

CREATE TABLE more_products (
  prd_id INTEGER PRIMARY KEY,
  prd_type_id INTEGER
    REFERENCES product_types(product_type_id),
  name VARCHAR(30) NOT NULL,
  available CHAR(1)
);

-- insert sample data into more_products table

INSERT INTO more_products (  prd_id, prd_type_id, name, available) VALUES (  1, 1, 'Modern Science', 'Y');
INSERT INTO more_products (  prd_id, prd_type_id, name, available) VALUES (  2, 1, 'Chemistry', 'Y');
INSERT INTO more_products (  prd_id, prd_type_id, name, available) VALUES (  3, NULL, 'Supernova', 'N');
INSERT INTO more_products (  prd_id, prd_type_id, name, available) VALUES (  4, 2, 'Lunar Landing', 'N');
INSERT INTO more_products ( prd_id, prd_type_id, name, available) VALUES ( 5, 2, 'Submarine', 'Y');

-- commit the transaction
COMMIT;
select * from products;


select product_id,product_type_id,name from products
union all
select prd_id,prd_type_id,name from more_products;

select product_id,product_type_id,name from products
union 
select prd_id,prd_type_id,name from more_products;



create table food (id numeric, food_name varchar(20),cost numeric);

insert into food(id,food_name,cost) values(1,'mutton biryani',300),(2,'pasta',399),(3,'kalaki',15),(4,'momos',99),(5,'prawn fried rice',350),(6,'garlic bread',90),(7,'mexican pizza',450),(8,'South indian meals',60),(9,'maggi',60),(10,'brownie',50);
select * from food;

SET SQL_SAFE_UPDATES=0;
update food set cost =100 where id =10;
update food set cost =290 ,  food_name = 'mixed pasta' where id =2;

Alter table food modify food_name varchar(30);
alter table food add type varchar(10);

update  food set type = 'Veg';
update food set type = 'Non Veg' where id in (1,5,4);

alter table food drop type;

describe food;
delete from food where id =9;
delete from food where id in (5,6) ;

show tables;
rename table food to menu;

truncate table menu;
describe menu;

drop table menu
