use dsedec;

create table cust (cid int,year date,sal int);
alter table cust modify year int;
insert into cust values(101,2006,1000),(101,2007,1100),(102,2006,3000),(102,2007,3100);
delete from cust;



select a.cid,a.year,a.sal,(a.sal-a.lagged)*100/a.lagged 'percentage_increased' from 
(select c1.cid,c1.year,c1.sal,(lag(c1.sal,1) over(partition by c1.cid )) 'lagged' from cust c1) a ;

-- single row subquery
select * from products where product_type_id =(
select product_type_id from product_types where name ='Book');
-- multi row subquery
select * from products where product_type_id in(
select product_type_id  from product_types p where p.name like '%d');


select * from products where price>( select avg(price) from products );
select * from products where price=( select min(price) from products );

select * from ( select min(price) from products ) a;

select * from products p  where product_id  in (
select  product_id from purchases);
select * from products where (product_type_id,price) in (
select product_type_id,min(price) from products group by product_type_id) ;


select * from products where product_id in(
select product_id from purchases where product_id  in 
(select product_id from products  where product_type_id in
(select product_type_id from product_types where name ='Video')));


select * from purchases;
select * from products;
select * from product_types;
-- correlated subquery
select * from products p1 where price >  
(select avg(price) from products p2 where p1.product_type_id =p2.product_type_id );

use dsedec;



select e1.employee_id,concat(e1.first_name,' ',e1.last_name) 'Emp name',e1.title,e1.manager_id,concat(e2.first_name,' ',e2.last_name) 'Manager name' 
from more_employees e1 join more_employees e2 on e1.manager_id =e2.employee_id;

select title,avg(salary) from more_employees group by title;
select * from more_employees;
select * from more_employees e1 where salary in (select min(salary) from more_employees e2 where e1.title =e2.title );
select * from more_employees e1 where salary > (select avg(salary) from more_employees e2 );
select * from more_employees e1 where salary > (select avg(salary) from more_employees e2 where e1.title =e2.title );

select * from more_employees e1 where salary > (select avg(salary) from more_employees e2 where e2.title = 'Support Person' );

select * from more_employees e1 where salary in (select max(salary) from more_employees e2 where e1.title =e2.title );


select * from products;
