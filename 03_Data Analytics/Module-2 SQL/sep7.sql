SELECT * FROM moviesdb.actors;

select actor_id from moviesdb.actors;

use moviesdb;

select name from actors;

select name, birth_year from actors;

select actor_id, birth_year from actors;

select title, industry, imdb_rating from movies;

select title, imdb_rating 
from movies
WHERE industry = "bollywood";

select distinct industry
from movies;

select *
from movies
where title = "Sholay";

select *
from movies
where title like "%Thor%";