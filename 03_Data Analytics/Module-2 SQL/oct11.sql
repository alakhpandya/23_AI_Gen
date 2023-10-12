-- create database banking;
-- use banking;
-- create table customers(
-- 	customer_id varchar(50),
-- 	first_name varchar(50),
-- 	last_name varchar(50),
-- 	phone int,
-- 	address varchar(100),
-- 	dob date,
-- 	is_active varchar(10)
-- );

insert into customers (customer_id, first_name, last_name, phone, address, dob, is_active) values('C1','mohan','agarwal', 786766,'bangalore', '1990-05-07', 'active');
insert into customers values ('C2', 'James', 'Xavier', null, 'Chennai', '1995-05-07', 'active');

select * from customers;

drop table customers;
create table customers(
	customer_id varchar(50) PRIMARY KEY,
	first_name varchar(50) NOT NULL,
	last_name varchar(50),
	phone int UNIQUE,
	address varchar(100),
	dob date,
	is_active varchar(10) CHECK(is_active IN ('active', 'inactive', 'blocked'))
);

insert into customers values ('c5', 'Ankit', 'Kavi', 788889888765, 'Sydney', '2004-07-06', 'inactive');
alter table customers modify column phone bigint;

CREATE TABLE Artciles ( 
	articleId INT AUTO_INCREMENT PRIMARY KEY, 
	articleTitle VARCHAR(60), 
	dateCreated TIMESTAMP, 
	datePublished TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
);

set time_zone = '+5:30';
truncate Artciles;
INSERT INTO 
	Artciles ( articleTitle, dateCreated ) 
VALUES 
	('Sample 1', '2019-07-21 00:00:01'), 
	('Sample 2', '2019-07-14 00:00:01'), 
	('Sample 3', '2019-07-07 00:00:01'), 
	('Sample 4', '2019-07-01 00:00:01');

set time_zone = "-7:00";
select * from Artciles;

use moviesdb;
select round(avg(imdb_rating), 2) as Avg_rating
from movies
where industry = "Bollywood";

select industry, round(avg(imdb_rating), 2) as Avg_rating
from movies
group by industry;

select studio, count(studio) as no_of_movies
from movies
where studio != ""
group by studio
having no_of_movies > 2
order by no_of_movies desc;

select * from movies;
