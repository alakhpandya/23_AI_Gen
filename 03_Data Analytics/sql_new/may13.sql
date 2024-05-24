use sql50;
select * from students;
select * from subjects;
select * from examinations;

/*
select s.student_id, s.student_name, s.subject_name, count(e.subject_name)
from (
select *
from students s1
cross join subjects s2
) s
left join examinations e
on s.student_id = e.student_id  and s.subject_name = e.subject_name
group by s.student_id, s.student_name, s.subject_name
order by s.student_id, s.subject_name;
*/
-- CTE: Common Table Expression
with s as (
	select *
	from students s1
	cross join subjects s2
)

select s.student_id, s.student_name, s.subject_name, count(e.subject_name)
from s
left join examinations e
on s.student_id = e.student_id and s.subject_name = e.subject_name
group by s.student_id, s.student_name, s.subject_name
order by s.student_id, s.subject_name;

use demo;

-- 6. Find the difference in average sales for each month of 2003 and 2004 (Use ‘demo’ database) - Use CTE
with a as (
	select month_id, round(avg(sales), 2) as 2003_avg_sales
	from sales_order
	where year_id = 2003
	group by month_id
),
b as (
	select month_id, round(avg(sales), 2) as 2004_avg_sales
	from sales_order
	where year_id = 2004
	group by month_id
)
select a.month_id, 2003_avg_sales, 2004_avg_sales, round(2004_avg_sales - 2003_avg_sales, 2) as difference
from a
join b
on a.month_id = b.month_id
order by a.month_id;

/*
5. Find the most profitable orders. Orders which have higher sells price than the average sales price for their city and for which the deal size is not small 
are considered as ‘Most Profitable Orders’ (Use ‘demo’ database) - Use CTE
*/