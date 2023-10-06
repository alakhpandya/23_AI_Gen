/*
use moviesdb;
select * from movies;

select *
from movies
order by imdb_rating desc
limit 5;

select *
from movies
order by imdb_rating desc
limit 3 offset 2;

select max(imdb_rating) best, min(imdb_rating) as worst, round(avg(imdb_rating), 1) as average
from movies;

-- Give me the movies whose rating is above average.

select * 
from movies 
where imdb_rating>(select avg(imdb_rating) from movies)
order by imdb_rating;

select concat(title, " | ", industry) as new_title
from movies;

-- select *, substr(title, 1, 3) as initials
select *, substr(title, 3, 3) as initials
from movies;

select lower(title) 
from movies;

select upper(title)
from movies;

-- Print the titles of movies in a way that first character of title of every movie is capitalized and every other character in lower case.

select title, coalesce(imdb_rating, 100) new_rating
from movies;
*/

-- Datatypes:
/*
int
char(50)
varchar(50)
enum
date - format: "YYYY/MM/DD"
time - format: "HH:MM:SS AM/PM"
datetime - format: "YYYY/MM/DD HH:MM:SS AM/PM"
timestamp: Allows to use timezone info, faster than datetime
*/

-- creating a database
/*
create database school;
create database if not exists school;
*/
-- deleting a database
/*
drop database school;
*/
-- creating tables
create table if not exists student(
	id int,
    student_name varchar(255)
);

truncate student;
-- select * from student;

insert into student (id, student_name) values (1, "Krutarth");
insert into student (id, student_name) values (2, "Manish");
insert into student (id, student_name) values (3, "Mina");
insert into student (id, student_name) values (4, "Sunaina");

select * from student;

/*
Database: banking
table: customer
columns: id, name, gender (M/F/O), date of joining, last login date & time
*/

alter table student rename to aspirants;

select * from aspirants;

alter table aspirants rename column id to stu_id;

