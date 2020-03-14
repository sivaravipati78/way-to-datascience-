use HR;
select * from DEPARTMENTS where department_name like 'IT%' and manager_id is null;
select concat('This is to certify that ',first_name,' ',last_name ,' with employee id ',employee_id ,' is working as ',job_id,' in dept. ', department_id) from employees where employee_id = 123;


select employee_id,salary,
case 
when salary <5000 then 'Tier1'
when salary between 5000 and 10000 then 'Tier2'
when salary >10000 then 'Tier3'
end 'salary Range'

from employees order by 3;
select sum(salary) from employees  group by department_id ,job_id having sum(salary)>25000 order by department_id,job_id;
select * from employees where (substr(first_name,-1,1) in ('a','e','i','o','u')) and (substr(last_name,-1,1) in ('a','e','i','o','u'));

select substring(job_title,11,10),(sum(max_salary)-sum(min_salary)) from jobs   where job_title like '%Manager%' or job_title like '%Clerk%' 
 group by job_title like '%Manager%', job_title like '%Clerk%';



select * from locations where city not like  'South%'  and city like 'S%' and country_id in ('US','UK');



use orders;
select * from online_customer where CUSTOMER_CREATION_DATE < date('2016-01-12') and (CUSTOMER_EMAIL like '%gmail%' or CUSTOMER_EMAIL like '%yahoo%')
and CUSTOMER_USERNAME like 'dave%';

select PRODUCT_ID,PRODUCT_DESC,(PRODUCT_PRICE*PRODUCT_QUANTITY_AVAIL) Total_worth from product group by PRODUCT_DESC;

select concat(CUSTOMER_FNAME,' ',CUSTOMER_LNAME,CUSTOMER_USERNAME,' created on ',CUSTOMER_CREATION_DATE,'. Contact Phone: ',CUSTOMER_PHONE,' E-mail: ',CUSTOMER_EMAIL) from online_customer where CUSTOMER_EMAIL like '%gmail%' and CUSTOMER_PHONE like '%77%';

select country_id,count(city) from locations where country_id not in ('US','UK') group by country_id   having count(city)>1 order by country_id desc


