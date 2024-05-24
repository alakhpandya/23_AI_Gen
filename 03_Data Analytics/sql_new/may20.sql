/*
use as5;

select *
from points p1
join points p2;

select *
from points p1, points p2;

with cte as (
select p1.x as x1, p1.y as y1, p2.x as x2, p2.y as y2
from points p1
cross join points p2
where p1.x != p2.x or p1.y != p2.y
)

-- select
-- min(round(sqrt(pow((x2 - x1), 2) + pow((y2 - y1), 2)), 2)) as shotest
select *,
round(sqrt(pow((x2 - x1), 2) + pow((y2 - y1), 2)), 2) as shortest
from cte
order by shortest
limit 1;
*/

use as6;

-- Write a query to report the names of all the salespersons who did not have any orders related to the company named "RED".
select * from salesperson;
select * from orders;
select * from company;

select name from salesperson
where name not in (
	select s.name
	from salesperson s
	left join orders o on s.sales_id = o.sales_id
	left join company c on o.com_id = c.com_id
	where c.name = "RED"
);

select name
from salesperson
where sales_id not in (
	select sales_id
	from orders
	where com_id in (
		select com_id
		from company
		where name = "RED"
	)
);