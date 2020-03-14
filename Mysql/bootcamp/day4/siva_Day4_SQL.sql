-- Create an index on the column Mobile in table Customer_Information.
use bootcamp;
create index idx on customer_info (mobile);
-- Display the index information on table Customer_Information.
show index from customer_info;
-- Delete the index named idx from customer_information table.
drop index idx on customer_info;
-- x 2 -2 4 -4 -3 0 2 Write a single query to calculate the sum of all positive values of x and the sum of all negative values of x. Consider the Employee table below.
create table table1 (
a integer );
insert into table1 values(2);
insert into table1 values(-2);
insert into table1 values(4);
insert into table1 values(-4);
insert into table1 values(-3 );
insert into table1 values(0);
insert into table1 values(2);
select sum(a) from table1 group by a>0;
/* Emp_Id Emp_name Salary Manager_Id
10 Anil 50000 18
11 Vikas 75000 16
12 Nisha 40000 18
13 Nidhi 60000 17
14 Priya 80000 18
15 Mohit 45000 18
16 Rajesh 90000 –
17 Raman 55000 16
18 Santosh 65000 17
Write a query to generate below output:

Manager_Id Manager Average_Salary_Under_Manager
16 Rajesh 65000
17 Raman 62500
18 Santosh 53750 */
create table  employee_info (
Emp_Id integer primary key,
Emp_name varchar(50),
Salary integer,
Manager_Id integer);
insert into employee_info values ( 10, 'Anil', 50000, 18);
insert into employee_info values (11, 'Vikas', 75000, 16);
insert into employee_info values (12, 'Nisha', 40000, 18);
insert into employee_info values (13, 'Nidhi', 60000, 17);
insert into employee_info values (14 ,'Priya', 80000, 18);
insert into employee_info values (15, 'Mohit', 45000, 18);
insert into employee_info values (16, 'Rajesh', 90000, null);
insert into employee_info values (17, 'Raman', 55000, 16);
insert into employee_info values (18, 'Santosh', 65000, 17);
select e1.Emp_Id, e1.Emp_name, avg(e2.Salary) from employee_info as e1 inner join employee_info as e2 on e2.Manager_Id=e1.Emp_Id group by e1.Manager_Id;
/* The authors dataset has 1M+ rows; here’s the first six rows: 

author_name book_name 
author_1 book_1 
author_1 book_2 
author_2 book_3 
author_2 book_4 
author_2 book_5 
author_3 book_6 
… … 
The books dataset also has 1M+ rows and here’s the first six: 

book_name sold_copies 
book_1 1000 
book_2 1500 
book_3 34000 
book_4 29000 
book_5 40000 
book_6 4400 
… … 
Create an SQL query that shows the TOP 3 authors who sold the most books in total! */
create table  authors (
authorname varchar(50),
bookname varchar(50));
insert into authors values('author_1', 'book_1'); 
insert into authors values('author_1', 'book_2'); 
insert into authors values('author_2', 'book_3'); 
insert into authors values('author_2', 'book_4'); 
insert into authors values('author_2', 'book_5'); 
insert into authors values('author_3', 'book_6');  
create table books1 (
bookname varchar(50),
sold_copies integer);
insert into books1 values('book_1',1000); 
insert into books1 values('book_2',1500); 
insert into books1 values('book_3',34000); 
insert into books1 values('book_4',29000); 
insert into books1 values('book_5',40000); 
insert into books1 values('book_6',4400);
select a.authorname,sum(b.sold_copies) from authors as a inner join books1 as b where a.bookname=b.bookname group by a.authorname order by sum(b.sold_copies) desc;
-- Rename the column phone to Mobile.
alter table customer_info
rename column phone to mobile ; 
-- Rename table name as Customer_info.
rename table customer1 to customer_info;
-- Add a rule of uniqueness to the column mobile.
alter table customer_info
add constraint unique_mobile unique(mobile) ;
-- Create a blank table named Customer_Info_Copy with same structure as that of Customer_Information
create table customer_information as select * from  customer_info;
/* Insert the values in table Customer_Information for the below mentioned columns only
Cust_id, Cust_Name, Cust_age
with these values
1,'SampleName',34 */
insert into customer_info values ('SampleName',34,null,null,1);
-- Write a query to empty table Customer_Information.(Retain the structure)
delete from customer_info limit 1;
-- Create a view named v2 from employees table with details  first_name as name and salary.
use hr;
create view v2 as select first_name as name, salary from employees;
-- Update the view v2 By assigning the name 'Sara' in place of the name 'Valli'.
update v2 set name= 'sara' where name in ('valli');
-- Create a view named v3 with details first_name, salary and department_id for the departmentId 30. And apply restriction so that no person is able to update it.
create view v3 as select first_name, salary, department_id from employees where department_id=30;
update v3 set salary=6000 where department_id=30;
