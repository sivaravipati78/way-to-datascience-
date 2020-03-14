use bootcamp;
-- Write a query to print the unique Genre names in the dataframe.
select distinct Genre from books;
-- Write a query to print the Book count corresponding to each unique Genre and which is having rating more than 3.7 in the dataframe.
select count(booksoriginal_title) from books  where average_rating >3.7 group by Genre; -- 7
-- Write a query to find out the most expensive book
select * from books order by Price_per_book desc limit 1;
-- Write a query to print out the name of the books and the corresponding author names whose work_text_reviews_count was greater than 100 and rating is more than 3.6
select booksoriginal_title,authors from books where Work_text_reviews_count>100 and average_rating>3.6;
 -- Write a query to print out the number of books with non-available data in language code
select count(*) from books where language_code not in ('en-US','eng','en-GB','en-CA');
----

-- Write a query to show the Sr.Leads name whose salary is more than 80,000
select * from employee_details where Designation like '%Sr.%' and Salary > 80000;
-- Write a query to show the Salary of the people from Italy working in Marketing Department or From Australia in Admin Department
select * from employee_details where (Country ='Italy' and Department = 'Marketing' ) or (Country ='Australia' and Department = 'Admin');
-- Write a query to show the employee detail for the employee who name either start with J or L
select * from employee_details where Employee_Name like 'J%' or Employee_Name like 'L%';
-- Write a query to show the employee detail apart from the country Qatar, Russia & India
select * from employee_details where Country not in ('Qatar','Russia','India');
-- Write a query to show the employee & employee rating name joined as Fresher’s in Planning Team
select Employee_Name,Employee_Rating from employee_details where Designation = 'Freshers';

------


-- Write a Query to print the word 'great learning' in Camel convention. (i.e. Capitalize the first alphabet in each word)
select 'great learning',concat(upper(substr('great learning',1,1)),(lower(substr('great learning',2,4))),' ',(upper(substr('great learning',7,1))),(lower(substr('great learning',8,14))));
-- Write a Query to display the word Learn from the string 'Great Learning'.
select substring('Great Learning',6,6) from dual;
-- Write a Query to display the word 'Great Learning' by removing the vowels.
select replace(replace(replace('Great Learning','a',''),'e',''),'i','') from dual;
-- Write a Query to remove all the leading and trailing exclamatory marks from the string '!!!!!Great Learning!!!!!!'.
select trim(replace('!!!!!Great Learning!!!!!!','!',' ')) from dual;
-- Write a Query to divide the number 100 by 3 and print the remainder after division.

select 100 mod 3 from dual;

-------
use hrboot;
-- Using HR Schema, Write a query to list the names of all people who report to the same person in department Accounting (i.e.110).
select concat(e.first_name,e.last_name) from employees e  join departments d on e.department_id =d.department_id  where   d.department_name ='Accounting'  and e.employee_id=d.manager_id;



-- Write a query in SQL to display the first name, last name, department number, and department name for each employee.
select e.first_name,e.last_name,e.department_id,d.department_name from employees e  join departments d on e.department_id =d.department_id ; 

-- Write a query in SQL to display those employees who contain a letter z to their first name and also display their last name, department, city, and state province.
select e.first_name,e.last_name,d.department_name,l.state_province from employees e  join departments d on e.department_id =d.department_id 
join locations l on d.location_id = l.location_id where e.first_name like '%z%';





-- Write a query in SQL to display the job title, department name, full name (first and last name ) of employee, and starting date for all the jobs which started on or after 1st January, 1993 and ending with on or before 31 August, 1997.

select e.first_name,e.last_name,j.job_title,d.department_name from employees e  join departments d on e.department_id =d.department_id join locations l on d.location_id = l.location_id join jobs j on e.job_id =j.job_id  join job_history jh on j.job_id = jh.job_id  where jh.start_date > '1993-01-01'   and jh.end_date <= '1997-08-31';

-- Write a query in SQL to display the name of the department, average salary and number of employees working in that department who got commission.


select d.department_name ,concat(e.first_name,e.last_name),avg(e.salary),count(e.employee_id) from employees e  join departments d on e.department_id =d.department_id where e.commission_pct is not null group by 1


