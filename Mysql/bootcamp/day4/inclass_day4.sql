#Section A
/*
1 Create a table named Customer_info with the below mentioned column
Cust_name - should be of type character maximum 50 length 
                      ,must not accept nulls
Cust_age - should be of type number type
Cust_DOB - should be of type date 
*/
create database day4;
use day4;
create table Customer_info(Cust_name varchar(50) not null ,Cust_age int(2),Cust_DOB date);
#2 Add a rule on age column ,that it should be greater than 17 years.
alter table Customer_info add check (Cust_age > 17);

#3 Add a column named phone of type number with a default rule of 0.
alter table Customer_info add phone integer(12) default 0;
#4 Add the column Cust_id of type number as a primary key.
alter table Customer_info add Cust_id integer(5) primary key;
#5 Rename the column phone to Mobile.
alter table Customer_info rename column  phone to Mobile;
#6 Rename table name as Customer_info.
rename table Customer_info to Customer_info;
#7 Add a rule of uniqueness to the column mobile.
alter table Customer_info add unique(Mobile) ;#constraint constraint_name
#8 Create a blank table named Customer_Info_Copy with same structure as that of Customer_Information.
create table Customer_Info_Copy as select *  from Customer_info;
/*9 Insert the values in table Customer_Information for the below mentioned columns only
Cust_id,Cust_Name,Cust_age
with these values
1,'SampleName',34
*/
insert into Customer_info (`Cust_id`,`Cust_name`,`Cust_age`)values(1,'SampleName',34);
##10 Write a query to empty table Customer_Information.(Retain the structure)
truncate table Customer_info;
/*11 Create a table named dept 
deptid of type number being the primary key
dname of type string with  a maximum of 50 characters*/

create table dept (deptid integer(5) primary key,dname varchar(50) );
/*12 Create a table emp with below mentioned details:-
1.empid of type number being primary key
2.emp_name of type string and not null
3.salary of type  number
4.deptid of type number and referencing the column deptid from dept table.
5.hire_date of type date 
*/
create table emp(empid integer primary key,emp_name varchar(15) not null,salary integer(5),deptid integer(5) ,hire_date date,
constraint dept_id_ref foreign key (deptid) references dept(deptid));

#Section B
use hrboot;
#1 Create a view named v1 with details department_id and total number of employees in each department.
create view v1 as (
select d.department_id,d.department_name,count(e.employee_id) from departments d join employees e on e.department_id =d.department_id group by department_id);


#2 Create a view named v2 from employees table with details  first_name as name and salary.

create view v2 as (select first_name,salary from employees);
drop view v2
#3 Update the view v2 By assigning the name 'Sara' in place of the name 'Valli'.
update  v2 set first_name = 'sara' where first_name ='Valli';
#4 Create a view named v3 with details first_name ,salary and department_id for the departmentId 30. And apply restriction so that no person is able to update it.
create view v3 as(
select  first_name,salary,department_id from employees where department_id=30);
lock table v3 write 
#5 Update the view v3. Assign the salary to be 6000 for those working in department 30.
unlock tables;
update v3 set salary=6000 where  department_id=30;


#Section C
 use day4;

#1 Create an index on the column Mobile in table Customer_Information.
create index idx on  customer_info(Mobile);
#2 Display the index information on table Customer_Information.
show index from customer_info;
#3 Delete the index named idx from customer_information table.
drop index idx on customer_info;
#4 Create an index on last_name and first_name together in the  employees table.
use hrboot;
create index idx_1 on  employees(last_name,first_name);

#Section D 
/*
1
x
------
  2
 -2
  4
 -4
 -3    
  0
  2

Write a single query to calculate the sum of all positive values of x and the sum of all negative values of x.*/

create table t1(val integer(2));
insert into t1 values(2),(-2),(4),(-4),(-3),(0),(2);

select sum(val) from (select sign(val),val from t1)a where sign(val)!=0 group by sign(val) ;
select sum(val) from t1 group by val>0;
/*2
Consider the Employee table below.

Emp_Id        Emp_name        Salary        Manager_Id
10        Anil        50000        18
11        Vikas        75000        16
12        Nisha        40000        18
13        Nidhi        60000        17
14        Priya        80000        18
15        Mohit        45000        18
16        Rajesh        90000        –
17        Raman        55000        16
18        Santosh        65000        17
Write a query to generate below output:

Manager_Id        Manager        Average_Salary_Under_Manager
16        Rajesh        65000
17        Raman        62500
18        Santosh        53750
*/
use day4;
create table  Employees(Emp_Id integer(2)    ,    Emp_name varchar(10)   ,     Salary integer(8)  ,     Manager_Id integer(2));
insert into Employees values(10  ,      'Anil'    ,    50000     ,   18),
(11    ,    'Vikas'   ,     75000     ,   16),
(12  ,      'Nisha'  ,    40000     ,   18),
(13   ,     'Nidhi'    ,    60000   ,     17),
(14   ,     'Priya'    ,    80000   ,     18),
(15   ,     'Mohit'    ,    45000   ,     180),
(16   ,     'Rajesh'   ,     90000  ,      null),
(17   ,     'Raman'    ,    55000    ,    16),
(18   ,     'Santosh'   ,     65000  ,      17);
select e1.Manager_Id,e2.Emp_name,sum(e1.Salary)/count(e1.Salary) from Employees e1 join Employees e2 on e1.Manager_Id=e2.Emp_Id group by e1.Manager_Id;
-- or 
select Manager_Id,sum(Salary)/count(Salary) from Employees where avg(Salary)>10 group by Manager_Id 
/*3
The authors dataset has 1M+ rows;
 here’s the first six rows:
author_name
book_name
author_1
book_1
author_1
book_2
author_2
book_3
author_2
book_4
author_2
book_5
author_3
book_6
…
…
The books dataset also has 1M+ rows and here’s the first six:

book_name
sold_copies
book_1
1000
book_2
1500
book_3
34000
book_4
29000
book_5
40000
book_6
4400
…
…
Create an SQL query that shows the TOP 3 authors who sold the most books in total!

*/
4
You work for a startup that makes an online presentation software. You have an event log that records every time a user inserted an image into a presentation. (One user can insert multiple images.) The event_log SQL table looks like this:

user_id        event_date_time
7494212        1535308430
7494212        1535308433
1475185        1535308444
6946725        1535308475
6946725        1535308476
6946725        1535308477
…        …
…and it has over one billion rows.
Write an SQL query to find out how many users inserted more than and equals to 2 but less than 5 images in their presentations!


5 You have two SQL tables! The first one is called employees and it contains the employee names, the unique employee ids and the department names of a company. Sample:

department_name        employee_id        employee_name
Sales        123        John Doe
Sales        211        Jane Smith
HR        556        Billy Bob
Sales        711        Robert Hayek
Marketing        235        Edward Jorgson
Marketing        236        Christine Packard
…        …        …
The second one is named salaries. It holds the same employee names and the same employee ids – and the salaries for each employee. Sample:

salary        employee_id        employee_name
500        123        John Doe
600        211        Jane Smith
1000        556        Billy Bob
400        711        Robert Hayek
1200        235        Edward Jorgson
200        236        Christine Packard
…        …        …
The company has 546 employees, hence both tables have 546 rows.

Print every department where the average salary per employee is lower than $500!

6 Display 3 highest salaries from the above employees table.


7 Consider the Customer and complaints table where
customer used to create complaints regarding some reasons:-
 Customer_info table with below mentioned attributes:--

Cust_Id        Cust_Name        DOB        Address_Id        Address        Online_Active

Complaints Table with below mentioned attributes:-

Cust_id        complaint_id        complaint_date        complaint_status        Month        closed_date        complaint_reason1        complaint_reason2        complaint_reason3

1.Display total number of complaints and total number of customers for each complaint_reason1.
2.Display month wise and complaint_reason1 total number of customers and complaints.
3.Display total number of  customers as per online_active status.
4. Calculate the age of customers.


