-- Section A
use hrboot;
-- 1 Write a query to display the name ( first name and last name ) for those employees who gets more salary than the employee whose ID is 163
select concat(first_name,' ',last_name) Name_of_emp from employees where salary> (select salary from employees where employee_id =163);

-- 2 Write a query to display the name ( first name and last name ), salary, department id for those employees who earn such amount of salary which is the smallest salary of any of the departments.
 select e.* from employees e  where salary = any(select min(e1.salary) from employees e1 group by e1.department_id );
-- 3 Write a query to display the employee id, employee name (first name and last name ) for all employees who earn more than the average salary.
select e.* from employees e where salary > (select avg(salary) from employees );
-- 4 Write a query to display the employee name ( first name and last name ), employee id and salary of all employees who report to Payam.
select concat(e.first_name,' ',e.last_name) Name_of_emp from employees e  join employees m on m.employee_id =e.manager_id where m.first_name = 'Payam';
-- 5 Write a query to display all the information of the employees who does not work in those departments
-- where some employees works whose manager id within the range 100 and 200.

select * from employees where manager_id not between 100 and 200;

-- 6 Write a query to display the employee name( first name and last name ) and hiredate for all employees in the same department as Clara. Exclude Clara.
select concat(e.first_name,' ',e.last_name) Name_of_emp, e.hire_date from employees e  where department_id = (select department_id from employees  where first_name ='Clara') and first_name != 'Clara';
-- 7 Write a query to display the employee id, name ( first name and last name ), salary, department name and city
-- for all the employees who gets the salary as the salary earn by the employee which is maximum within the joining person January 1st, 1997 and December 31st,1997

select e.employee_id,concat(e.first_name,' ',e.last_name) Name_of_emp, e.salary,d.department_name,l.city from employees e join departments d on e.department_id =d.department_id join locations l on d.location_id = l.location_id where e.salary =
(select max(salary) from employees where hire_date between '1997-01-01' and '1997-12-31' );


-- 8 Write a query in SQL to display the first and last name, salary, and department ID for those employees who earn less than the average salary,
-- and also work at the department where the employee Laura is working as a first name holder.
select employee_id,concat(first_name,' ',last_name) Name_of_emp, salary,department_id from employees where salary <(select avg(salary) from employees ) and department_id = (select department_id from employees where first_name ='Laura');


-- 9 Display the name & department ID of all departments that has at least one employee with salary greater than 10,000.

select distinct d.department_name,d.department_id from employees e join departments d on e.department_id =d.department_id  where salary >10000  ;


-- 10 Write a query to fetch the employee ID, First Name, Last Name, Salary and Department ID of those employees
-- who draw a salary more than the average salary of their respective department.


select * from employees e where e.salary > (select avg(e1.salary) from employees e1 where e.department_id=e1.department_id ) ;

-- 11 Display first name ,last name of employees where deparment id is equal to Adam department id  and employee_id is 144 using subquery.
select * from employees where employee_id =144 and department_id =(select department_id from employees where first_name ='Adam');
-- 12 Display all the employees who have their manager and department matching with the employee having an Employee ID of 121 or 200 but not 121 or 200 using subquery .
select * from employees where (manager_id , department_id) in (select manager_id,department_id from employees where employee_id in(121,200)) and 
employee_id not in (121,200);
-- 13 Display 5th highest salary of employee using subquery
select a.salary from (select salary,dense_rank()over(order by salary desc) my_rank from employees ) a where  a.my_rank =5 ;
select distinct salary from employees as e1 where 5 = (select count(distinct salary) from employees  as e2 where e2.salary >= e1.salary);
-- 14 Display the employee number, name (first name and last name) and job title for all employees whose salary is 
-- smaller than any salary of those employees whose job title is MK_MAN using subquery.
select * from employees e  
join departments d on e.department_id =d.department_id 
join locations l on l.location_id = d.location_id 
join jobs j on j.job_id = e.job_id 
where 


-- 15 Write a query to find the name (first_name, last_name) of the employees who have a manager and worked in a US based department using subquery. 
 
16 Write a query in SQL to display the details of the current job for those employees who worked as a Sales Representative in the past

17 Write a query in SQL to display the country name, city, and number of those departments where at least 2 employees are working.
 
18 Write a query in SQL to display the name of the department, average salary and number of employees working in that department who got commission.

19 Write a Query to display the product id, product description and product price of products whose product id less than 1000 and that have the same price more than once.
 use classicmodels;
 
 select sys.username from dual
SELECT CURRENT_USER();
20 Display the count of employees whose last_name starts with 'A'
 
 
 
Section B
 
1 Write a query to display net Salary of employees even if the commission is not given .
 
2 Create table dummy(sno int,sal int);
Insert into dummy values(1,2000),(Null,3000),(3,null),(4,7990),(5,null);

Write a query to display information where sno is not 3;
 
3 Write a query to display employees information where department id is 10,20,30 or not defined.

4 create table table_a ( a int);
insert into table_a values (1);
insert into table_a values (2);
insert into table_a values (3);

create table table_b ( b int);
insert into table_b values(4);
insert into table_b values(3);
insert into table_b values(null);

Write a query to display table_a data which is not there in table_b;
 
5 Display the employee details for whom commission is not mentioned.

6 Display the employee details whose manager is not assigned

7 "Display first_name of the employees who are not receiving any commission and first name contains 't'"

8 CREATE TABLE IF NOT EXISTS contacts (
    contactid INT AUTO_INCREMENT PRIMARY KEY,
    contactname VARCHAR(20) NOT NULL,
    bizphone VARCHAR(15),
    homephone VARCHAR(15)
);
INSERT INTO contacts(contactname,bizphone,homephone)
VALUES('John Doe','(541) 754-3009',NULL),
      ('Cindy Smith',NULL,'(541) 754-3110'),
      ('Sue Greenspan','(541) 754-3010','(541) 754-3011'),
      ('Lily Bush',NULL,'(541) 754-3111');

Display contactname and phone of customers ,if bizphone is not there homephone should show up."

9 Display the contactname where biz phone is not provided

10 Display first_name ,commission and where commission ISNULL print 'Its Null' otherwise print 'Its not null



Section C

1 Display the current system date

2 Display the output for (90+20)/2

3 "Display the below given pattern

*
**
***


4 Display system date ,total number of rows from employees and departments table in a single row and 3 columns

5 Display your name on screen

6 Display 'Great Learnings' in capital letter

7 Display the sum of 5 and 3

8 Display the difference between 2007-01-21 and 2007-01-01

9 Display the age if the date of birth is '1999-09-08'

10 Display the square root of 4 

11 Display the addition of 2,3,4,5

12 Display '1' if 2<>0 condition is true otherwise display '0' 
 
13 Display the user name in mysql

14 Display on screen 'My name is <your name >
 
15 Display the square of 9
 