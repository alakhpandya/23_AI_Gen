use assignments;

Create table If Not Exists Cinema (seat_id int, free int);
Truncate table Cinema;
insert into Cinema (seat_id, free) values ('1', '1');
insert into Cinema (seat_id, free) values ('2', '0'); 
insert into Cinema (seat_id, free) values ('3', '1'); 
insert into Cinema (seat_id, free) values ('4', '1'); 
insert into Cinema (seat_id, free) values ('5', '1');

select * from cinema;

select seat_id
from cinema
where free = 1
and
(
	seat_id + 1 in
	(
		select seat_id
		from cinema
		where free = 1
	)
	or
	seat_id -1 in
	(
		select seat_id
		from cinema
		where free = 1
	)
);

use classwork;

select * from students;

select *,
	case
		when id % 2 != 0 then lead(student_name, 1, student_name) over()
        else lag(student_name) over()
	end temp
from students;

select * from student_score;

-- Indexing & Partitioning
select *,
-- avg(score) over(partition by dep_name order by score rows between unbounded preceding and unbounded following) as "Avg. Score"
-- avg(score) over(partition by dep_name order by score rows between 1 preceding and 1 following) as "Avg. Score"
-- avg(score) over(partition by dep_name order by score rows between 0 preceding and 2 following) as "Avg. Score"
-- avg(score) over(partition by dep_name order by score rows between 0 preceding and 2 following) as "Avg. Score"
avg(score) over(partition by dep_name order by score rows between unbounded preceding and 0 following) as "Avg. Score"		-- default
from student_score
order by dep_name;

with t1 as
(
	select *,
	lead(free) over() as next
	from cinema
),
t2 as
(
	select *,
	lag(free) over() as prev
	from cinema
),
t3 as
(
select t1.seat_id, t1.free,
t1.free - next as diff1,
t2.free - prev as diff2
from t1
join t2 on t1.seat_id = t2.seat_id
)
select * from t3
where free = 1 and (diff1 = 0 or diff2 = 0);

