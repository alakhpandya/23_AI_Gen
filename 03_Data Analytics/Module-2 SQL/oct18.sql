use classwork;
/*
Write a query for a report that provides the pairs (actor_id, director_id) where the actor has cooperated with the director at least three times.
• Return the result table ordered by actor_id in ascending manner.
*/
/* 

Create table If Not Exists ActorDirector (actor_id int, director_id int, timestamp int); 
Truncate table ActorDirector; 
insert into ActorDirector (actor_id, director_id, timestamp) values ('1', '1', '0');
insert into ActorDirector (actor_id, director_id, timestamp) values ('1', '1', '1');
insert into ActorDirector (actor_id, director_id, timestamp) values ('1', '1', '2');
insert into ActorDirector (actor_id, director_id, timestamp) values ('1', '2', '3');
insert into ActorDirector (actor_id, director_id, timestamp) values ('1', '2', '4');
insert into ActorDirector (actor_id, director_id, timestamp) values ('2', '1', '5');
insert into ActorDirector (actor_id, director_id, timestamp) values ('2', '1', '6');


select * from ActorDirector;

with t1 as (
	select actor_id, director_id, count(*) as frequency
	from ActorDirector
	group by actor_id, director_id
	having frequency >= 3
)
select actor_id, director_id
from t1
order by actor_id;


select d.department_id, d.department_name, avg(e.salary) as 'Average_salary'
from department d
join employees e on e.department_id = d.department_id
group by d.department_id, d.department_name
order by d.department_id asc;

select d.department_name, count(e.employee_id) No_of_Employees, sum(e.salary) as Total_Salary
from department d
join employees e on e.department_id = d.department_id
group by d.department_name
order by d.department_name;

select e.employee_id, e.department_id, e.first_name, e.last_name, e.job_id, d.department_name
from department d
join employees e on e.department_id = d.department_id
where d.department_name = "Human Resource"
order by e.employee_id asc; 
*/
/*
Write a SQL query that reports the product_name, year, and price for each sale_id in the sales table.
• Return the result table ordered by year and product_name in ascending order.
*/

Create table If Not Exists Sales (sale_id int, product_id int, year int, quantity int, price int);
Create table If Not Exists Product (product_id int, product_name varchar(10));
Truncate table Sales;
insert into Sales (sale_id, product_id, year, quantity, price) values ('1', '100', '2008', '10', '5000');
insert into Sales (sale_id, product_id, year, quantity, price) values ('2', '100', '2009', '12', '5000');
insert into Sales (sale_id, product_id, year, quantity, price) values ('7', '200', '2011', '15', '9000');
Truncate table Product;
insert into Product (product_id, product_name) values ('100', 'Nokia');
insert into Product (product_id, product_name) values ('200', 'Apple');
insert into Product (product_id, product_name) values ('300', 'Samsung');

select * from sales;
select * from Product;

select p.product_name, s.year, s.price
from Product p
join Sales s on p.product_id = s.product_id
order by s.year, p.product_name;

/*
Write a query to display the details of the employees who belong to the 'Europe' region. 
Note:
• Return the columns 'employee_id', 'full_name' (first_name and last_name separated by space), 'salary', 'phone_number', 'department_id', 'department_name', 'street_address', 
'city', 'country_name', 'region_id', 'region_name'.
• Return the result ordered by salary in descending order and by employee_id in ascending order.
*/

select e.employee_id, 
concat(e.first_name, " ", e.last_name) as full_name,
e.salary, e.phone_number, d.department_id, d.department_name, l.street_address, l.city, c.country_name, r.region_id, r.region_name
from employees e
join departments d on d.department_id = e.department_id
join locations l on l.location_id = d.location_id
join countries c on c.country_id = l.country_id
join regions r on r.region_id = c.region_id 
where r.region_name = "Europe"
order by e.salary desc, e.employee_id asc;

