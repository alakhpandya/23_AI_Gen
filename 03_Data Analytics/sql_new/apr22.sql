use moviesdb;
-- Print the number of movies produced by all those studio which have produced atleast 2 movies
select studio, count(title)
from movies
where studio != ""
group by studio
having count(title) > 1
order by studio;

-- Important sequence: SELECT -> FROM -> WHERE -> GROUP BY -> HAVING -> ORDER BY -> LIMIT

-- CASE - WHEN
select distinct language_id from movies;
select * from languages;

-- Create a column named "Language" which has value "Hindi" if language_id is 1, "English" if language_id is 5 otherwise "Other"
SELECT title, industry, imdb_rating,
CASE
	WHEN language_id = 1 THEN "Hindi"
    WHEN language_id = 5 THEN "English"
    WHEN language_id = 2 THEN "Telugu"
    WHEN language_id = 3 THEN "Kannada"
    ELSE "Other"
END as language
from movies;

-- Create a column named "Box Office Performance" which has type of movie based on its ratings as below:
/*
	less than 4 - flop
    4 - 5.9 - Average
    6 - 7.9 - Hit
    8 or more - Blockbuster
*/

select distinct unit from financials;
-- From financials table, convert budget & revenue of each movie into millions
select movie_id,
CASE
	WHEN unit = "Thousands" THEN budget/1000
    WHEN unit = "Billions" THEN budget*1000
    ELSE budget
END as new_budget
from financials;

-- Subquery
select *,
CASE
	WHEN language in ("Hindi", "Telugu", "Kannada") THEN "Indian"
    WHEN language = "Other" THEN "Unknown"
    ELSE "Foreign Language"
END as origin
from (
	SELECT title, industry, imdb_rating,
	CASE
		WHEN language_id = 1 THEN "Hindi"
		WHEN language_id = 5 THEN "English"
		WHEN language_id = 2 THEN "Telugu"
		WHEN language_id = 3 THEN "Kannada"
		ELSE "Other"
	END as language
	from movies
) as t1;

use sql_basic1;

select name
from customer
where name not in (
select name 
from customer
where referee_id = 2
);

select name 
from customer
where referee_id = 2;