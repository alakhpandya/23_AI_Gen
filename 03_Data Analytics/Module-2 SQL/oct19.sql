use classwork;
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

select * from employees;
select * from department;


Write a query to display the details of all those departments that don't have any working employees.
• Return the columns 'department_id', and 'department_name'.

select d.department_id, d.department_name
from department d
left join employees e 
on e.department_id = d.department_id
group by d.department_id, d.department_name
having count(e.employee_id) = 0
order by d.department_id;
*/
Create table If Not Exists Employee (empId int, name varchar(255), supervisor int, salary int);
Create table If Not Exists Bonus (empId int, bonus int);
Truncate table Employee;
insert into Employee (empId, name, supervisor, salary) values ('3', 'Brad', null, '4000');
insert into Employee (empId, name, supervisor, salary) values ('1', 'John', '3', '1000');
insert into Employee (empId, name, supervisor, salary) values ('2', 'Dan', '3', '2000');
insert into Employee (empId, name, supervisor, salary) values ('4', 'Thomas', '3', '4000');
Truncate table Bonus;
insert into Bonus (empId, bonus) values ('2', '500');
insert into Bonus (empId, bonus) values ('4', '2000');

select * from Employee;
select * from Bonus;

select e.name, b.bonus
from Employee e
Left join Bonus b
on e.empId = b.empID
where b.bonus < 1000 or b.bonus is null;

/*
Display the details of the employees who joined the company before their managers joined the company.
• Return the columns 'employee_id', 'first_name', and 'last_name'.
• Return the result ordered by employee_id in ascending order.
*/

select hire_date as manager_doj
from employees e
where employee_id in (
	select manager_id from employees
)



