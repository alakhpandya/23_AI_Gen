-- Get the employees with missing names or salary
/*
use classwork;
select * from employees;
select * from salaries;

(select e.employee_id, e.name, s.salary
from employees e
left join salaries s on e.employee_id = s.employee_id
where s.salary is null)
union
(select s.employee_id, e.name, s.salary
from salaries s
left join employees e on e.employee_id = s.employee_id
where e.name is null);
*/

use paintings;
select * from artists;

-- Print the duplicate artists

select *
from artists
group by id, first_name, last_name
having count(*) > 1;

with cte as (
select *,
row_number() over() as row_id
from artists
)
select id, first_name, last_name
from cte
group by id, first_name, last_name
having count(row_id) > 1;

-- Delete the duplicate records

use hr;

select distinct department_id from employees;

-- Print first two employees of each department id
/*
select department_id , employee_id from employees
where(
	select count(*) from employees s
	where s.department_id = employees.department_id and s.employee_id <=employees.employee_id
)<=2;
*/
with t1 as (
	select employee_id, first_name, department_id,
	row_number() over(partition by department_id) as row_num
	from employees
)
select department_id, first_name, employee_id
from t1
where row_num <= 2
order by department_id, employee_id desc;