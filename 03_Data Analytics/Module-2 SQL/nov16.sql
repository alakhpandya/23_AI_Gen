/*
CTE, Window function, 
AS2 - Q8,
AS5 - Q4, 
AS6 - Q2
Understanding ER Diagram
*/

-- create database as5;
-- use as5;

/*
Create table If Not Exists Playback (session_id int, customer_id int, start_time int, end_time int); 
Truncate table Playback; 
insert into Playback (session_id, customer_id, start_time, end_time) values ('1', '1', '1', '5'); 
insert into Playback (session_id, customer_id, start_time, end_time) values ('2', '1', '15', '23'); 
insert into Playback (session_id, customer_id, start_time, end_time) values ('3', '2', '10', '12'); 
insert into Playback (session_id, customer_id, start_time, end_time) values ('4', '2', '17', '28'); 
insert into Playback (session_id, customer_id, start_time, end_time) values ('5', '2', '2', '8'); 
Create table If Not Exists Ads (ad_id int, customer_id int, timestamp int); 
Truncate table Ads; 
insert into Ads (ad_id, customer_id, timestamp) values ('1', '1', '5'); 
insert into Ads (ad_id, customer_id, timestamp) values ('2', '2', '17'); 
insert into Ads (ad_id, customer_id, timestamp) values ('3', '2', '20');

select * from Playback;
select * from Ads;

select distinct p.session_id
from Playback p
join Ads a
on p.customer_id = a.customer_id
where a.timestamp not between p.start_time and p.end_time;
*/


-- create database as6;
/*
use as6;

Create table If Not Exists Product (product_id int, product_name varchar(10), unit_price int);
Create table If Not Exists Sales (seller_id int, product_id int, buyer_id int, sale_date date, quantity int, price int);
Truncate table Product;
insert into Product (product_id, product_name, unit_price) values ('1', 'S8', '1000');
insert into Product (product_id, product_name, unit_price) values ('2', 'G4', '800');
insert into Product (product_id, product_name, unit_price) values ('3', 'iPhone', '1400');
Truncate table Sales;
insert into Sales (seller_id, product_id, buyer_id, sale_date, quantity, price) values ('1', '1', '1', '2019-01-21', '2', '2000');
insert into Sales (seller_id, product_id, buyer_id, sale_date, quantity, price) values ('1', '2', '2', '2019-02-17', '1', '800');
insert into Sales (seller_id, product_id, buyer_id, sale_date, quantity, price) values ('2', '1', '3', '2019-06-02', '1', '800');
insert into Sales (seller_id, product_id, buyer_id, sale_date, quantity, price) values ('3', '3', '3', '2019-05-13', '2', '2800');
*/

/*
select * from Sales;
select * from Product;

select s.buyer_id
from Sales s
Join Product p
on s.product_id = p.product_id
where p.product_id = 1 and buyer_id not in (
	select buyer_id
    from Sales s
    join Product p
    on s.product_id = p.product_id
    where s.product_id = 3
);
*/

/*
use as6;

Create table If Not Exists SalesPerson (sales_id int, name varchar(255), salary int, commission_rate int, hire_date date);
Create table If Not Exists Company (com_id int, name varchar(255), city varchar(255));
Create table If Not Exists Orders (order_id int, order_date date, com_id int, sales_id int, amount int);
Truncate table SalesPerson;
insert into SalesPerson (sales_id, name, salary, commission_rate, hire_date) values ('1', 'John', '100000', '6', '2006-4-1');
insert into SalesPerson (sales_id, name, salary, commission_rate, hire_date) values ('2', 'Amy', '12000', '5', '2010-5-1');
insert into SalesPerson (sales_id, name, salary, commission_rate, hire_date) values ('3', 'Mark', '65000', '12', '2008-12-25');
insert into SalesPerson (sales_id, name, salary, commission_rate, hire_date) values ('4', 'Pam', '25000', '25', '2005-1-1');
insert into SalesPerson (sales_id, name, salary, commission_rate, hire_date) values ('5', 'Alex', '5000', '10', '2007-2-3');
Truncate table Company;
insert into Company (com_id, name, city) values ('1', 'RED', 'Boston');
insert into Company (com_id, name, city) values ('2', 'ORANGE', 'New York');
insert into Company (com_id, name, city) values ('3', 'YELLOW', 'Boston');
insert into Company (com_id, name, city) values ('4', 'GREEN', 'Austin');
Truncate table Orders;
insert into Orders (order_id, order_date, com_id, sales_id, amount) values ('1', '2014-1-1', '3', '4', '10000');
insert into Orders (order_id, order_date, com_id, sales_id, amount) values ('2', '2014-2-1', '4', '5', '5000');
insert into Orders (order_id, order_date, com_id, sales_id, amount) values ('3', '2014-3-1', '1', '1', '50000');
insert into Orders (order_id, order_date, com_id, sales_id, amount) values ('4', '2014-4-1', '1', '4', '25000');
*/