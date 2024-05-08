/*
create database if not exists school;
use school;

create table if not exists students(
	name varchar(100),
    age int
);

truncate table students;

insert into students(name, age) values('Hardik', 19);
insert into students values ('Harshil', 20);

-- to delete a table:
-- drop table if exists students;
-- drop database if exists school;
-- select * from students;
alter table students rename to ai_student;
select * from ai_student;
RENAME TABLE AI_STUDENT TO AI_STUDENTS;

select * from AI_Students;

alter table ai_students rename column name to first_name;

select * from ai_students;
*/
drop table customers;
 
create table if not exists customers(
customers_id int primary key auto_increment,
first_name varchar(20) not null,
last_name varchar(20),
mobile_no varchar(10) unique,
email varchar(50) not null unique,
date_of_birth date,
is_active varchar(10)
);

insert into customers values (1, "Jay", "Nasriwala", 9898989898, "jay@royal.com", null, "active");
insert into customers values (2, "Khushi", null, null, "Ahmedabad", null, "inactive");
insert into customers values (3, "Devanshi", "Trivedi", 9898989897, "Surat", null, "active");
-- insert into customers values (4, "Jay", "Patel", 9598989897, "jay@royal.com", null, "active");
insert into customers (first_name, last_name, mobile_no, email, date_of_birth, is_active) values ("Jay", "Patel", 9598989897, "jayp@royal.com", null, "active");
insert into customers (first_name, last_name, mobile_no, email, date_of_birth, is_active) values ("Mitanshu", "Panchal", 987654321, "m@p.com", null, "Dhiraj");

select * from customers;