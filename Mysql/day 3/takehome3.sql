use orders;
-- 1
select PRODUCT_CLASS_CODE,PRODUCT_ID,PRODUCT_DESC,PRODUCT_PRICE,case when PRODUCT_CLASS_CODE = 2050 then PRODUCT_PRICE+2000
when PRODUCT_CLASS_CODE = 2051 then PRODUCT_PRICE+500
when PRODUCT_CLASS_CODE = 2052 then PRODUCT_PRICE+600
end price_change from product order by PRODUCT_CLASS_CODE;

-- 2

select p.PRODUCT_DESC,pc.PRODUCT_CLASS_DESC,p.PRODUCT_PRICE from product p 
inner join product_class pc on p.PRODUCT_CLASS_CODE =pc.PRODUCT_CLASS_CODE 
inner join order_items ot on p.PRODUCT_ID =ot.PRODUCT_ID 
inner join order_header oh on oh.ORDER_ID = ot.ORDER_ID
where oh.ORDER_STATUS = 'Shipped';


-- 3

select oc.CUSTOMER_ID,concat(oc.CUSTOMER_FNAME,oc.CUSTOMER_LNAME) 'customer name',oc.CUSTOMER_EMAIL,oh.ORDER_ID,p.PRODUCT_DESC,p.PRODUCT_QUANTITY_AVAIL,
p.PRODUCT_QUANTITY_AVAIL*p.PRODUCT_PRICE 'Sub Total' 
from online_customer oc left join order_header oh on oc.CUSTOMER_ID =oh.CUSTOMER_ID 
left join order_items ot on ot.ORDER_ID = oh.ORDER_ID 
left join product p on p.product_id = ot.product_id;
-- other way--
select oc.CUSTOMER_ID,concat(oc.CUSTOMER_FNAME,oc.CUSTOMER_LNAME) 'customer name',oc.CUSTOMER_EMAIL,oh.ORDER_ID,p.PRODUCT_DESC,p.PRODUCT_QUANTITY_AVAIL,
p.PRODUCT_QUANTITY_AVAIL*p.PRODUCT_PRICE 'Sub Total' 
from product p
join order_items ot on p.product_id = ot.product_id
 right join order_header oh on  ot.ORDER_ID = oh.ORDER_ID
right join online_customer oc on oc.CUSTOMER_ID =oh.CUSTOMER_ID;

-- -4

select oc.customer_id,concat(oc.CUSTOMER_FNAME,oc.CUSTOMER_LNAME) 'customer name',addr.city,addr.pincode,oh.order_id,oh.order_date,
prod_c.product_class_desc,prod.product_desc,prod.product_price* ot.product_quantity
from online_customer oc 
inner join address addr on oc.address_id = addr.address_id and addr.pincode not like ('%0%')
inner join order_header oh on oh.customer_id =oc.customer_id and oh.order_status ='Shipped'
inner join order_items ot on oh.order_id =ot.order_id 
inner join product prod on ot.product_id = prod.product_id 
inner join product_class prod_c on prod_c.product_class_code = prod.product_class_code;

-- 5

select oco.customer_id,concat(oco.CUSTOMER_FNAME,' ',oco.CUSTOMER_LNAME) 'customer name',addr.city  from online_customer oco 
 join address addr  on oco.address_id = addr.address_id  and addr.state != 'Karnataka' and oco.customer_id not in (
select  distinct oc.customer_id
from online_customer oc  
inner join order_header oh on oh.customer_id =oc.customer_id 
join order_items  ot on oh.order_id =ot.order_id  and oh.order_status  = 'Shipped'
join product p on  ot.product_id = p.product_id and 
p.product_class_code in (select product_class_code from product_class where PRODUCT_CLASS_DESC in ('Toys','Books') )
);

-- 6
select  distinct oco.customer_id,concat(oco.CUSTOMER_FNAME,' ',oco.CUSTOMER_LNAME) 'customer name',ot.order_id,sum(ot.product_quantity) 'Total quantity'
from online_customer oco 
inner join order_header oh on oh.customer_id =oco.customer_id  and oh.order_status  = 'Shipped'
-- and oh.order_id in (select order_id from order_items where oh.order_id =ot.order_id )
join order_items  ot on oh.order_id =ot.order_id 
group by ot.order_id having  sum(ot.product_quantity) >10;

-- 7
select oc.customer_id,concat(oc.CUSTOMER_FNAME,' ',oc.CUSTOMER_LNAME),sum(ot.product_quantity*p.product_price) 'Total order value' 
from online_customer oc 
join order_header oh on oh.customer_id =oc.customer_id  and oh.order_status  = 'Shipped'
join order_items  ot on oh.order_id =ot.order_id 
join product p on  ot.product_id = p.product_id 
group by oc.customer_id
having  sum(ot.product_quantity*p.product_price)> 100000;

-- 8

select oc.customer_id,concat(oc.CUSTOMER_FNAME,' ',oc.CUSTOMER_LNAME),sum(ot.product_quantity) 'Total order value' 
from online_customer oc 
join order_header oh on oh.customer_id =oc.customer_id  and oh.order_status  = 'Shipped'
join order_items  ot on oh.order_id =ot.order_id and ot.order_id > 10060
join product p on  ot.product_id = p.product_id 
group by ot.order_id 



-- -- 9
select prod_c.PRODUCT_CLASS_DESC,p.PRODUCT_ID,p.PRODUCT_QUANTITY_AVAIL,
case 
when prod_c.PRODUCT_CLASS_DESC in ('Electronics','Computer') and p.PRODUCT_QUANTITY_AVAIL <10 then 'Low stock'
when prod_c.PRODUCT_CLASS_DESC in ('Electronics','Computer') and p.PRODUCT_QUANTITY_AVAIL between 11 and 30 then 'In stock'
when prod_c.PRODUCT_CLASS_DESC in ('Electronics','Computer') and p.PRODUCT_QUANTITY_AVAIL > 30 then 'Enough stock'
when prod_c.PRODUCT_CLASS_DESC in ('Stationery','Clothes') and p.PRODUCT_QUANTITY_AVAIL <20 then 'Low stock'
when prod_c.PRODUCT_CLASS_DESC in ('Stationery','Clothes') and p.PRODUCT_QUANTITY_AVAIL between 21 and 80 then 'In stock'
when prod_c.PRODUCT_CLASS_DESC in ('Stationery','Clothes') and p.PRODUCT_QUANTITY_AVAIL >81 then 'Enough stock'
when prod_c.PRODUCT_CLASS_DESC not in ('Stationery','Clothes','Electronics','Computer') and p.PRODUCT_QUANTITY_AVAIL <15 then 'Low stock'
when prod_c.PRODUCT_CLASS_DESC not in ('Stationery','Clothes','Electronics','Computer') and p.PRODUCT_QUANTITY_AVAIL between 16 and 50 then 'In stock'
when prod_c.PRODUCT_CLASS_DESC not in ('Stationery','Clothes','Electronics','Computer') and p.PRODUCT_QUANTITY_AVAIL >5 then 'Low stock'
when p.PRODUCT_QUANTITY_AVAIL = 0 then 'Out of stock'
end 'inventory status'
from product p inner join product_class prod_c on prod_c.product_class_code = p.product_class_code;

