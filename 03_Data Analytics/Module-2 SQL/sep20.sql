create database demo;

use demo;
select * from products;

select distinct productLine
from products;

select count(productLine)
from products;


-- counting group wise using group by
select distinct productLine, count(productLine)
from products
group by productLine;

-- Using count(*)
select distinct productLine, count(*)
from products
group by productLine;

-- Give me count of each productLine but don't differentiate between cars. 
-- That is, if they are 'Classic Cars' or 'Vintage Cars', just call them 'Cars' and give their total count.

-- if-else = case when
select distinct
case when productLine in ('Classic Cars', 'Vintage Cars') then 'Cars'
else productLine end newProductLine,
count(*) 'Total'
from products
group by newProductLine;

-- subquery

select 
case when productLine in ('Classic Cars', 'Vintage Cars') then 'Cars'
else productLine end newProductLine
from products; -- table t1

select distinct newProductLine, count(*) as Total
from (
	select 
	case when productLine in ('Classic Cars', 'Vintage Cars') then 'Cars'
	else productLine end newProductLine
	from products
) t1
group by newProductLine;