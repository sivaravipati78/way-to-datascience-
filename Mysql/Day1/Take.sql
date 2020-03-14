use hr;
select location_id,city from locations where state_province is null;
select * from jobs where max_salary >10000;
select department_id,department_name,manager_id from departments where manager_id >200 and location_id =2400;
select * from jobs where min_salary >8000 and max_salary <20000;
select department_id,department_name,manager_id from departments where location_id = 1700 and manager_id is not null;

use orders;
select PRODUCT_ID,PRODUCT_DESC,PRODUCT_CLASS_CODE,PRODUCT_PRICE from product where PRODUCT_CLASS_CODE in(2050,2053,2055);

select CUSTOMER_ID,ORDER_ID,ORDER_DATE,ORDER_SHIPMENT_DATE from order_header where ORDER_SHIPMENT_DATE is not null order by CUSTOMER_ID ,ORDER_DATE desc;

select * from product where PRODUCT_CLASS_CODE =2050 and PRODUCT_QUANTITY_AVAIL >= 15 and  PRODUCT_PRICE BETWEEN 10000 AND 30000;

select * from order_header where ORDER_STATUS != 'Shipped';
select * from order_header where ORDER_STATUS = 'Shipped' and PAYMENT_MODE in('Net Banking', 'Credit Card')-- ,'Net Banking') 
 and PAYMENT_DATE >= date('2013-01-01');


