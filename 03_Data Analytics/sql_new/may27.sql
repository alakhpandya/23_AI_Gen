use hr;
/*
Print full names (first_name + space + last_name) of top 2 earners from each department (if they exist).
*/

select first_name, last_name, salary, department_name
from employees e
left join departments d
on e.department_id = d.department_id
order by department_name;

select first_name, last_name, department_name, avg(salary)
from employees e
left join departments d
on e.department_id = d.department_id
group by first_name, last_name, department_name;

-- Window Functions
select *,
row_number() over() as sr_no
from employees;

-- Sorting two columns independently
/*
use as7;

with t1 as (
select *, row_number() over() as sr_no
from data
order by first_col
),
t2 as (
select *, row_number() over() as sr_no
from data
order by second_col desc)

select t1.first_col, t2.second_col
from t1
join t2 on t1.sr_no = t2.sr_no;
*/

with cte as (
select *,
row_number() over(partition by department_id order by salary desc) as sr_no
from employees
)
select *
from cte
where sr_no <= 2
order by department_id;

select * from employees;