use orders;

-- 1
select  PRODUCT_ID,PRODUCT_DESC,PRODUCT_PRICE from product where PRODUCT_ID<1000 and  PRODUCT_PRICE in 
(select PRODUCT_PRICE from  product group by PRODUCT_PRICE having count(PRODUCT_PRICE)>1);

-- 2

select a.product_class_desc, max(a.product_quantity) ,a.Total_value from
(select prod_c.product_class_desc product_class_desc, sum(ot.product_quantity) product_quantity ,
sum((prod.product_price* ot.product_quantity)) Total_value 
from online_customer oc 
inner join address addr on oc.address_id = addr.address_id and addr.country not in ('USA','India')
inner join order_header oh on oh.customer_id =oc.customer_id  and oh.order_status ='Shipped'
inner join order_items ot on oh.order_id =ot.order_id 
inner join product prod on ot.product_id = prod.product_id 
inner join product_class prod_c on prod_c.product_class_code = prod.product_class_code
group by prod_c.product_class_desc) a;

-- 3
select * from online_customer oc where oc.customer_id in ((select customer_id from address ad ) );
select oc.customer_id,oc.CUSTOMER_FNAME,addr.ADDRESS_LINE2,addr.city,sum((prod.product_price* ot.product_quantity)) Total_value
from online_customer oc 
inner join address addr on oc.address_id = addr.address_id -- and addr.country not in ('USA','India')
inner join order_header oh on oh.customer_id =oc.customer_id  and oh.order_status ='Shipped'
inner join order_items ot on oh.order_id =ot.order_id 
inner join product prod on ot.product_id = prod.product_id 
inner join product_class prod_c on prod_c.product_class_code = prod.product_class_code
group by addr.ADDRESS_LINE2,addr.CITY;

-- PRODUCT_ID,PRODUCT_DESC,PRODUCT_PRICE
-- 4

select p.PRODUCT_ID, a.product_quantity,p.PRODUCT_DESC from product p inner join 
(select PRODUCT_ID,sum(ot.PRODUCT_QUANTITY) product_quantity from order_items ot group by product_id   ) a 
on a.PRODUCT_ID = p.PRODUCT_ID 
group by a.PRODUCT_ID
having  a.product_quantity = (select max(b.product_quantity) from (select PRODUCT_ID,sum(ot.PRODUCT_QUANTITY) product_quantity from order_items ot group by product_id) b);

-- 5

select * from 
(select  month(oh.ORDER_DATE) months,sum(ot.product_quantity) prod_quan
from online_customer oc 
inner join address addr on oc.address_id = addr.address_id and addr.country  != 'India'
inner join order_header oh on oh.customer_id =oc.customer_id -- and oh.order_status ='Shipped'
inner join order_items ot on oh.order_id =ot.order_id 
group by month(oh.ORDER_DATE)) b
group by b.months
having b.prod_quan = (select max(prod_quan) from (select  month(oh.ORDER_DATE) months,sum(ot.product_quantity) prod_quan
from online_customer oc 
inner join address addr on oc.address_id = addr.address_id and addr.country  != 'India'
inner join order_header oh on oh.customer_id =oc.customer_id--  and oh.order_status ='Shipped'
inner join order_items ot on oh.order_id =ot.order_id 
group by month(oh.ORDER_DATE)) a);


-- 6

select * from (
select oc.customer_id,concat(oc.CUSTOMER_FNAME,oc.CUSTOMER_LNAME) 'customer name',oh.order_status,
sum(prod.product_price* ot.product_quantity) 'Total_value'
from online_customer oc 
inner join order_header oh on oh.customer_id =oc.customer_id  and oh.order_status ='Shipped'
inner join order_items ot on oh.order_id =ot.order_id 
inner join product prod on ot.product_id = prod.product_id 
group by oc.customer_id )a group by a.customer_id
having 
a.Total_value = (select max(b.total) from (select oc.customer_id,concat(oc.CUSTOMER_FNAME,oc.CUSTOMER_LNAME) 'customer name',oh.order_status,
sum(prod.product_price* ot.product_quantity) total
from online_customer oc 
inner join order_header oh on oh.customer_id =oc.customer_id  and oh.order_status ='Shipped'
inner join order_items ot on oh.order_id =ot.order_id 
inner join product prod on ot.product_id = prod.product_id 
group by oc.customer_id) b);

-- 7
 
 -- inner join & correlated subquery
 
 select pc.PRODUCT_CLASS_CODE,pc.PRODUCT_CLASS_DESc,p.PRODUCT_DESC,p.PRODUCT_PRICE from product p 
join product_class pc on p.PRODUCT_CLASS_CODE =pc.PRODUCT_CLASS_CODE and 
p.PRODUCT_PRICE = (select max(PRODUCT_PRICE) from product p1 where p1.PRODUCT_CLASS_CODE = pc.PRODUCT_CLASS_CODE);
 
 -- 8
 
 select s.shipper_id,s.shipper_name,sum(p.LEN*p.WIDTH*p.HEIGHT*ot.PRODUCT_QUANTITY) 'total volume' from order_header oh 
 join shipper s on oh.SHIPPER_ID = s.SHIPPER_ID and oh.order_status ='Shipped'  -- and oh.shipper_id in (select shipper_id from shipper where oh.SHIPPER_ID = s.SHIPPER_ID)
 join order_items ot on ot.ORDER_ID = oh.ORDER_ID 
 join product p on p.product_id = ot.product_id 
 group by s.shipper_id
 order by 3 desc limit 1;
 
 
 -- 9
 select CARTON_ID,LEN*WIDTH*HEIGHT from carton where LEN*WIDTH*HEIGHT > (
 select sum(LEN*WIDTH*HEIGHT) from order_items ot  
 join product p on ot.product_id = p.product_id and ot.order_id = 10006 group by ot.order_id)
 order by 2 limit 1;
 
 -- 10
 select ot.PRODUCT_ID,p.PRODUCT_DESC,sum(ot.PRODUCT_QUANTITY) total_quantity from product p 
 join order_items ot on ot.product_id = p.product_id  group by ot.PRODUCT_ID
 having sum(ot.PRODUCT_QUANTITY) = (select min(b.pq) from (select sum(ot.PRODUCT_QUANTITY) pq from product p 
 join order_items ot on ot.product_id = p.product_id  group by ot.PRODUCT_ID) b)
 union 
  select ot.PRODUCT_ID,p.PRODUCT_DESC,sum(ot.PRODUCT_QUANTITY) total_quantity from product p 
 join order_items ot on ot.product_id = p.product_id  group by ot.PRODUCT_ID
 having sum(ot.PRODUCT_QUANTITY) = (select max(b.pq) from (select sum(ot.PRODUCT_QUANTITY) pq from product p 
 join order_items ot on ot.product_id = p.product_id  group by ot.PRODUCT_ID) b);
 
 
 
 
 
 