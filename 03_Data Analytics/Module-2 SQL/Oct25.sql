use moviesdb;

select * from movies;
select * from actors;
select * from moviesdb.movie_actor;

select count(distinct movie_id) from movie_actor;
select count(distinct movie_id) from movies;

select count(distinct actor_id) from movie_actor;
select count(distinct actor_id) from actors;

-- Print id and names of the actors who did not play role in any movie

select *
from movie_actor ma
-- JOIN actors a 
INNER JOIN actors a
ON ma.actor_id = a.actor_id;

select a.actor_id, a.name
from actors a
LEFT JOIN movie_actor ma
ON a.actor_id = ma.actor_id
where ma.actor_id is null;

-- There is no FULL OUTER JOIN in mySQL
-- UNION

use classwork;

alter table employee drop column supervisor;
alter table employee drop column salary;

select * from employees
union
select * from employee;

use hr;
select * from employees;