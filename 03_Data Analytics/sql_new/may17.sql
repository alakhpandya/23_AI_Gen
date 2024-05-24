use as5;
/*
Create table If Not Exists employees (employee_id int, employee_name varchar(255), phone varchar(20),salary int, department_id int); 
Truncate table employees; 
insert into employees (employee_id, employee_name, phone, salary, department_id) values ('1', 'Luis', '22995986404', '10023', '1'); 
insert into employees (employee_id, employee_name, phone, salary, department_id) values ('2', 'Den', '62795986600', '10903', '1'); 
insert into employees (employee_id, employee_name, phone, salary, department_id) values ('3', 'Alexander', '29475986399', '5346', '2'); 
insert into employees (employee_id, employee_name, phone, salary, department_id) values ('4', 'Shelli', '26445985238', '7606', '3'); 
create table if not Exists department (department_id int, department_name varchar(255)); 
Truncate table department; 
insert into department (department_id, department_name) values (1, 'Sales'); 
insert into department (department_id, department_name) values (2, 'Marketing'); 
insert into department (department_id, department_name) values (3, 'HR'); 
insert into department (department_id, department_name) values (4, 'Finance'); 
insert into department (department_id, department_name) values (5, 'IT');
*/

/*
select * from employees;
select * from department;

-- When we can not use cte:
with cte as (
	SELECT department_id FROM employees
)

SELECT d.department_id, d.department_name
FROM department d
WHERE d.department_id NOT IN (cte);
*/

/*
select session_id
from playback
where session_id not in
(
select session_id
from playback p
left join ads a
on p.customer_id = a.customer_id
where timestamp between start_time and end_time
);
*/
/*
Create table If Not Exists Cinema (seat_id int, free int); 
Truncate table Cinema; 
insert into Cinema (seat_id, free) values ('1', '1'); 
insert into Cinema (seat_id, free) values ('2', '0'); 
insert into Cinema (seat_id, free) values ('3', '1'); 
insert into Cinema (seat_id, free) values ('4', '1'); 
insert into Cinema (seat_id, free) values ('5', '1');
*/

select * from cinema;
-- seat itself must be free AND (seat before it must be free OR seat after it must be free)

select seat_id
from cinema
where free = 1 and (
	seat_id - 1 in (
		select seat_id
		from cinema
		where free = 1
    )
    or
    seat_id + 1 in (
    	select seat_id
		from cinema
		where free = 1
    )
);