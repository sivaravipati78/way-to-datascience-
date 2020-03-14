-- 
use dsedec;
-- cartesian product or cross join 
select p.product_id,p.product_type_id ,p.name,pt.name,p.description  ,p.price from  products p, product_types pt;
-- innerjoin
select p.product_id,p.product_type_id ,p.name,pt.name,p.description  ,p.price from  products p, product_types pt where p.product_type_id =pt.product_type_id;
-- using inner join name
select p.product_id,p.product_type_id ,p.name,pt.name,p.description  ,p.price from  products p inner join product_types pt on p.product_type_id =pt.product_type_id;
-- we need to use from master table of common col as it may impact in outer joins
select p.product_id,pt.product_type_id ,p.name,pt.name,p.description  ,p.price from  products p inner join product_types pt on p.product_type_id =pt.product_type_id;

select pur.product_id,p.name 'product name',pur.customer_id,pur.quantity from products p inner join purchases pur on p.product_id = pur.product_id;

select pur.product_id,pur.customer_id,concat(cust.first_name,' ',cust.last_name) 'customer name',pur.quantity from purchases pur inner join customers cust  on cust.customer_id = pur.customer_id;

select pur.product_id,p.name 'product name',pur.customer_id,concat(cust.first_name,' ',cust.last_name) 'customer name',pur.quantity from purchases pur, customers cust,products p  where  cust.customer_id = pur.customer_id and p.product_id = pur.product_id;

select pur.product_id,p.name 'product name',pur.customer_id,concat(cust.first_name,' ',cust.last_name) 'customer name',pur.quantity from products p inner join purchases pur on p.product_id = pur.product_id inner join customers cust  on cust.customer_id = pur.customer_id;

select pur.product_id,p.name 'product name',pur.customer_id,concat(cust.first_name,' ',cust.last_name) 'customer name',pur.quantity,p.price, p.price*pur.quantity 'Total Price'  from products p inner join purchases pur on p.product_id = pur.product_id inner join customers cust  on cust.customer_id = pur.customer_id;

select pur.product_id,p.name 'product name', pt.name,pur.customer_id,concat(cust.first_name,' ',cust.last_name) 'customer name',pur.quantity,p.price, p.price*pur.quantity 'Total Price'  from products p inner join purchases pur on p.product_id = pur.product_id inner join customers cust  on cust.customer_id = pur.customer_id inner join product_types pt on p.product_type_id =pt.product_type_id;

select pur.product_id,p.name 'product name', pt.name,pur.customer_id,concat(cust.first_name,' ',cust.last_name) 'customer name',pur.quantity,p.price, 
case when pt.name ='Book' then p.price-((p.price*1)/10)
when pt.name ='Video' then p.price-((p.price*15)/100)
end Discounted_price
from products p inner join purchases pur on p.product_id = pur.product_id inner join customers cust  on cust.customer_id = pur.customer_id inner join product_types pt on p.product_type_id =pt.product_type_id;

select p.product_id,p.product_type_id,pt.name,p.name,p.description, p.price from products p inner join product_types pt on p.product_type_id =pt.product_type_id;
-- outer join(left,right,no --full in mysql)
select p.product_id,p.product_type_id,pt.name,p.name,p.description, p.price from products p left outer join product_types pt on p.product_type_id =pt.product_type_id;

select p.product_id,p.product_type_id,pt.name,p.name,p.description, p.price from products p right outer join product_types pt on p.product_type_id =pt.product_type_id;
-- we can do this using union 
select p.product_id,p.product_type_id,pt.name,p.name,p.description, p.price from products p left outer join product_types pt on p.product_type_id =pt.product_type_id
union
select p.product_id,p.product_type_id,pt.name,p.name,p.description, p.price from products p right outer join product_types pt on p.product_type_id =pt.product_type_id;
-- self join
select e.employee_id,e.first_name,e.last_name,e.title,e.manager_id,m.first_name,m.last_name from employees e inner join employees m on e.manager_id =m.employee_id;

select e.employee_id,e.first_name,e.last_name,e.title,e.manager_id,m.first_name,m.last_name from employees e left outer join employees m on e.manager_id =m.employee_id;


use hr;


select * from employees;
select e.employee_id,e.first_name,e.last_name,e.manager_id,m.first_name,m.last_name from employees e left outer join employees m on e.manager_id =m.employee_id;

CREATE TABLE overtime (
    employee_name VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL,
    hours INT NOT NULL,
    PRIMARY KEY (employee_name , department)
);
INSERT INTO overtime(employee_name, department, hours)
VALUES('Diane Murphy','Accounting',37),
('Mary Patterson','Accounting',74),
('Jeff Firrelli','Accounting',40),
('William Patterson','Finance',58),
('Gerard Bondur','Finance',47),
('Anthony Bow','Finance',66),
('Leslie Jennings','IT',90),
('Leslie Thompson','IT',88),
('Julie Firrelli','Sales',81),
('Steve Patterson','Sales',29),
('Foon Yue Tseng','Sales',65),
('George Vanauf','Marketing',89),
('Loui Bondur','Marketing',49),
('Gerard Hernandez','Marketing',66),
('Pamela Castillo','SCM',96),
('Larry Bott','SCM',100),
('Barry Jones','SCM',65);

select * from overtime;



SELECT
    employee_name,
    hours,
    FIRST_VALUE(employee_name) OVER (ORDER BY hours) least_over_time
FROM
overtime;
-- ---------------
SELECT
    employee_name,department,
    hours,
    FIRST_VALUE(employee_name) OVER (ORDER BY hours desc) least_over_time
FROM
overtime
order by hours;

SELECT
    employee_name,department,
    hours,
    FIRST_VALUE(employee_name) OVER (partition by department order  BY hours) least_over_time
FROM
overtime;

create table t (val int);
insert into t values(1),(2),(2),(3),(4),(4),(5);

select val,
rank()over(order by val) my_rank,
dense_rank()over(order by val) my_denserank,
row_number()over(order by val) my_rownum
from t;

-- 

