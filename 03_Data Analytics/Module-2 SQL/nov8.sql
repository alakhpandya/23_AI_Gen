use classwork;

select * from student_score;
/*
DROP TABLE IF EXISTS student_score;

CREATE TABLE student_score (
  student_id SERIAL PRIMARY KEY,
  student_name VARCHAR(30),
  dep_name VARCHAR(40),
  score INT
);

INSERT INTO student_score VALUES (11, 'Nitin', 'Computer Science', 80);
INSERT INTO student_score VALUES (7, 'Taiwo', 'Microbiology', 76);
INSERT INTO student_score VALUES (9, 'Nikki', 'Biochemistry', 80);
INSERT INTO student_score VALUES (8, 'Joel', 'Computer Science', 90);
INSERT INTO student_score VALUES (10, 'Mauli', 'Industrial Chemistry', 78);
INSERT INTO student_score VALUES (5, 'Murlidhar', 'Biochemistry', 85);
INSERT INTO student_score VALUES (2, 'Yuyutsu', 'Biochemistry', 70);
INSERT INTO student_score VALUES (3, 'Heena', 'Microbiology', 80);
INSERT INTO student_score VALUES (1, 'Tomiwa', 'Microbiology', 65);
INSERT INTO student_score VALUES (4, 'Gbadebo', 'Computer Science', 80);
INSERT INTO student_score VALUES (12, 'Tolu', 'Computer Science', 67);

*/

select student_name, dep_name, score
from student_score
order by dep_name, score desc;

-- Print student_name, dep_name, score & rank of the student in the above example
with t1 as (
	select student_name, dep_name, score,
    row_number() over(partition by dep_name order by score desc) as 'Row Number',
    rank() over(partition by dep_name order by score desc) as 'Rank',
    dense_rank() over(partition by dep_name order by score desc) as 'Dense Rank'
    from student_score
    order by dep_name
)
select *
from t1;

-- Print highest score of each department
select dep_name, max(score) as 'Highest Score'
from student_score
group by dep_name;

-- Print student_id, dep_name and average score of each department
select student_id, dep_name, 
avg(score) over(partition by dep_name)  as 'Avg. Score'
from student_score
order by dep_name;

select * from students;
-- Swap names of adjesent students

use hr;

select employee_id, first_name,
lead(first_name) over() as next_employee,
lead(first_name, 2) over() as next_to_next
from employees;

select student_name, dep_name,
lead(student_name, 1, "N/A") over(partition by dep_name) as next_student,
lead(student_name, 1, student_name) over(partition by dep_name) as next_student2,
lag(student_name) over(partition by dep_name) as 'prev_student'
from student_score
order by dep_name;

create table students(
		id int primary key,
		student_name varchar(50) not null
);
insert into students values
(1, 'James'),
(2, 'Michael'),
(3, 'George'),
(4, 'Stewart'),
(5, 'Robin');

-- Next Class: AS-5 Q: Consecutive sits