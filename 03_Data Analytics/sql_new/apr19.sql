use moviesdb;

select title, round(imdb_rating/2, 1) as new_rating from movies;

/*
id	title							release_year	imdb_rating		studio
101	K.G.F: Chapter 2 | Bollywood	2022			8.4				Hombale Films
*/

select movie_id, concat(title, " | ", industry) as title, release_year, imdb_rating, studio
from movies;

-- Print first character of the title of each movie
-- select title, substr(title, 1, 1) as initial from movies;
select title, substr(title, 3, 4) as initial from movies;

select upper(title) from movies;
select lower(title) from movies;

-- Print a table in a way that first character of each title is converted to uppercase & all other characters in lower case. Call this new column as 'title' and 
-- also return all the other columns as they are.

SELECT CONCAT(UPPER(SUBSTR(TITLE, 1, 1)),LOWER(SUBSTR(TITLE, 2))) TITLE FROM MOVIES;

-- coalesce
select title, coalesce(imdb_rating, 0) from movies;

-- Print average imdb_rating for each industry
select industry, round(avg(imdb_rating), 1) as avg_rating
-- select industry, imdb_rating
from movies
group by industry;

-- Print the maximum ratings each industry has got.
select industry, max(imdb_rating) as max_rating
from movies
group by industry;

-- Print each industry and their minimum, maximum and average rating alltogether
select industry, min(imdb_rating) as min_rating, max(imdb_rating) as max_rating, round(avg(imdb_rating), 1) as avg_rating
from movies
group by industry;

-- Print the number of movies each studio has produced
select studio, count(movie_id) as no_of_movies
from movies
where studio != ""
group by studio
-- having studio != ""
order by 2 desc
limit 3;