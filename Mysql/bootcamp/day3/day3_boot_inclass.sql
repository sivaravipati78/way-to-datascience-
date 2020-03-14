##Section A
use classicmodels;
## 1	Using Classicmodels schema, Write a Query to find the list of customers residing in the same city.
select distinct c1.customerName,c1.city from customers c1 join customers c2  on c1.city =c2.city and c1.customerName !=c2.customerName;

#2. The movies database has a table called Movies. I would like to identify the movies of the same length for my project analysis. 
#Help me identify such movies along with the length of the movie.
use bootcamp;
select f1.title,f1.length from film f1 join film f2 on f1.length =f2.length and f1.film_id !=f2.film_id;
## 3. A Family is planning to play secret Santa game for Christmas. Create a list who should gift to whom. The list should read as below:
#Givername is buying a Gift for Receivername.
#The data is present in the table below:GiftTable(id, name, assignment)
use bootcamp;
select  g1.name,g2.name from giftnames g1 join giftnames g2 on  g2.id =g1.assignment;
# 4. A company is conducting survey and needs data of employees with same last name to be grouped together. Get a list of such employees.
#Let us consider the below tables.
#Students(Student_id,Student_name)
#Courses(Course_id,Course_name, Course_Desc)
#Find the combinations of enrolment of students into the courses

#A Game Developer is working on a cards game. He needs to create a list of cards in a Deck. If the Suits and Ranks are stored in 2 tables with respective names. Help him find the list of cards in a complete Deck. Order the result by suits and ranks.

#Ranks(rank varchar(5)
#Suits(suit varchar(20))
#A famous brand ABC has 10 outlets in Bangalore. The brand sells only its signature products in the stores. There are 25 signature products in the brand. The data is stored in the tables given below. Find the Store wise sales of every product.

Store(store_id, store_name,address)
Products(product_id,product_name, desc)
Purchases(store_id,product_id,purchase_id, purchase_amt)
Using Classicmodels schema, Write a Query to find the list of all the products with the details of code,name,productLine and description.
Using Classicmodels schema, Generate a report with all the order_number, status and the total sales.
The below data sample has details about Pizza Companies and their food distribution.

PizzaCompany(CompanyId,CompanyName,CompanyCity)
Foods(ItemId,ItemName,UnitsSold,CompanyID)

Generate a report to see city wise food distribution from all the outlets.
The below data sample has details about Pizza Companies and their food distribution.

PizzaCompany(CompanyId,CompanyName,CompanyCity)
Foods(ItemId,ItemName,UnitsSold,CompanyID)

Suppose three waterparks (looks like summer) get opened in the state and these waterparks outsource food from the pizza outlets.

Generate a Report to see all the food distribution across the waterparks by the Pizza outlets.

#Using Classicmodels schema, Generate a report with all the customers and their order details and products ordered.
use classicmodels;

select c.customerName,o.orderNumber,od.productCode,p.productName from customers c  join orders o on c.customerNumber =o.customerNumber join orderdetails od on o.orderNumber =od.orderNumber join products p on od.productCode =p.productCode ; 


select * from customers;
select * from orderdetails;
select * from orders;
select * from products;
select * from productLines;
A Retail Store XYZ recently started up in the locality. After 3 months of running the store successfully, during analysis the store manager has observed that some products were unsold. The product was not sold even once to any customer. Retail store wants to release some offers on such products. Make a list of such products for the manager.
Use the tables from Classicmodels schema.
A Shopping ecommerce site recently performed a detailed analysis of the data. It needs a report on the list of inactive customers. The company is planning on releasing offers to convert the inactive customers into active. Make a list of such names.
Use the tables from Classicmodels schema.
use classicmodels;
select c.customerNumber from customers c left join orders o on c.customerNumber =o.customerNumber  where c.customerNumber not in (select c.customerNumber from customers c  join orders o on c.customerNumber =o.customerNumber);
select c.customerNumber from customers c left join orders o on c.customerNumber =o.customerNumber  where o.ordernumber is null;

select * from customers;
select * from orderdetails;
select * from orders;
select * from products;
select * from productLines;

A Retail Store XYZ recently started up in the locality. After 3 months of running the store successfully, during analysis the store manager has observed that some products were unsold. The product was not sold even once to any customer. Retail store wants to release some offers on such products. Make a list of such products for the manager.
Use the tables from Classicmodels schema and achieve the results using a Right Join.
A Shopping ecommerce site recently performed a detailed analysis of the data. It needs a report on the list of inactive customers. The company is planning on releasing offers to convert the inactive customers into active. Make a list of such names.
Use the tables from Classicmodels schema and achieve the results using a Right Join.
Using Classicmodels schema, Generate a report with all the customers their ids, names and lifetime sales from the customer.

Using HR Schema, Write a Query to find the first day of first job of every employee.
Using HR Schema, write a Query to find the starting minimum salary of the first job that every employee held.
Using HR Schema, Write a Query to find the first day of the most recent job of every employee.
Using HR Schema, write a Query to find the minimum salary of the most recent job that every employee holds.
Using HR Schema, write a Query to find the last day of first job of every employee.
Using HR Schema, Write a Query to find the starting maximum salary of the first job that every employee held.
Using HR Schema, Write a Query to find the last day of the most recent job of every employee.
Using HR Schema, write a Query to find the maximum salary of the most recent job that every employee holds.
Using HR Schema, write a Query to List the current designation and previous designation of all the employees in the company.
Using classicmodels Schema, Write a Query to fetch the name of the customer along with the current and previous order date.
#Using classicmodels Schema, Write a Query to fetch the name of the product line with sales for every Year along with sales from the Previous year.
use classicmodels;
select * from customers;
select * from orderdetails;
select * from orders;
select * from products;
select * from productLines;
select  b.productLine,b.y previous_year,b1.y,b.total previous_year_sales,b1.total from 
(select a.productLine,a.y, sum(line_price) total from 
(select od.orderNumber, od.quantityOrdered*od.priceEach line_price, year(o.orderDate) y ,o.status,o.shippedDate,p.productCode,p.productName,p.productLine from orderdetails od join products p on od.productCode =p.productCode join orders o on o.orderNumber =od.orderNumber)a
group by  a.productLine, a.y)b join 
(select a.productLine,a.y, sum(line_price) total from 
(select od.orderNumber, od.quantityOrdered*od.priceEach line_price, year(o.orderDate) y ,o.status,o.shippedDate,p.productCode,p.productName,p.productLine from orderdetails od join products p on od.productCode =p.productCode join orders o on o.orderNumber =od.orderNumber)a
group by  a.productLine, a.y) b1 on b.productLine = b1.productLine and b.y!= b1.y and b1.y in (2004,2005) and b.y in (2003,2004) and (b.y-b1.y) in (1,-1);
---
with cur as 
(select a.productLine,a.y, sum(line_price) total from 
(select od.orderNumber, od.quantityOrdered*od.priceEach line_price, year(o.orderDate) y ,o.status,o.shippedDate,p.productCode,p.productName,p.productLine from orderdetails od join products p on od.productCode =p.productCode join orders o on o.orderNumber =od.orderNumber)a
group by  a.productLine, a.y)
select  b.productLine,b.y previous_year,b1.y,b.total previous_year_sales,b1.total from cur b join cur b1 on b.productLine = b1.productLine and b.y!= b1.y and b1.y in (2004,2005) and b.y in (2003,2004) and (b.y-b1.y) in (1,-1);


#Using HR Schema, Write a Query to List the first designation and next promoted designation of all the employees in the company.
#Using classicmodels Schema, write a Query to fetch the name of the customer along with the current and next order date.
#Using classicmodels Schema, Write a Query to fetch the name of the product line with sales for every Year along with sales from the Next year.

#Using HR Schema, write a Query to calculate the cumulative distribution of Salary in the employees table.
use hrboot;
#Using HR Schema, write a Query to List the first designation and next promoted designation of all the employees in the company.
select employee_id,sum(salary) over (order by employee_id) from employees;

select * from employees e join jobs j on e.job_id =j.job_id;

select * from cur c1  group by c1.employee_id having count(*)>2 ;

select * from jobs;
select * from job_history;
select * from employees;
select * from (select  employee_id,job_id,last_value(job_id) OVER (partition by employee_id order  BY employee_id) least from job_history)a where a.job_id!=a.least;


select e.employee_id,e.first_name,e.job_id current_job,jh.job_id previous,jh.start_date,jh.end_date from employees e left join job_history jh on e.employee_id =jh.employee_id;

with cur as (
select e.employee_id,e.job_id current_job,jh.job_id previous from employees e left join job_history jh on e.employee_id =jh.employee_id
)
select * from cur  where employee_id not in (select employee_id from cur c1 group by c1.employee_id having count(c1.employee_id)>1)
union 
(select * from (select  employee_id,job_id,last_value(job_id) OVER (partition by employee_id order  BY employee_id) least from job_history)a where a.job_id!=a.least);


