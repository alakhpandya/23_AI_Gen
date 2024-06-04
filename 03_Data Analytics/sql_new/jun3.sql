-- Adressing & Partitioning = window functions

use classwork;

select * from student_score;

select *,
-- rank() over(partition by dep_name order by score desc) as "Rank"
-- lead(score) over(order by score) as "Lead"
-- lead(score) over(partition by dep_name order by score) as "Lead"
-- lag(score) over() as "Lag"
lead(student_name) over()
from student_score;

select * from students;

select id,
coalesce(if(id % 2 = 0, lag(student_name) over(), lead(student_name) over()), student_name) as new
from students;

with cte as (
	select *,
	-- NTILE(2) over() as "Ntile"
	NTILE(3) over() as grouped
	from student_score
)
select grouped, avg(score)
from cte
group by grouped;

use hr;

select first_name, department_id, salary,
ntile(2) over(order by salary) as new_group
from employees;