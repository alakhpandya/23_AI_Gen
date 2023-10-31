/*
use friendly_movies;

select * from tvprogram;
select * from content;

select c.title
from tvprogram t
join content c on t.content_id = c.content_id
where month(program_date) = 6 and year(program_date) = 2020 and c.Kids_content = 'Y';

use classwork;

create database as4;
use as4;
*/
Create table If Not Exists Employees (employee_id int, name varchar(30), salary int);
Truncate table Employees;
insert into Employees (employee_id, name, salary) values ('2', 'Meir', '3000');
insert into Employees (employee_id, name, salary) values ('3', 'Michael', '3800');
insert into Employees (employee_id, name, salary) values ('7', 'Addilyn', '7400');
insert into Employees (employee_id, name, salary) values ('8', 'Juan', '6100');
insert into Employees (employee_id, name, salary) values ('9', 'Kannon', '7700');

select * from Employees;

select employee_id,
case
	when employee_id%2 <> 0 and name not like "M%" then salary
    else 0
end as bonus
from Employees
order by employee_id;

