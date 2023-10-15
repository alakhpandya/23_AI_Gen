use moviesdb;

select * from movies;

-- Joins
-- Print language of every movie along with its title.
select * from languages;

select title, name as "language"
from movies
JOIN languages
ON movies.language_id = languages.language_id;

select m.title, l.name "language"
from movies as m
JOIN languages l
ON m.language_id = l.language_id;

-- Give me the profit made by every movie sorted in a way so that the highest profit making movie comes at the top and lowest at the bottom.

-- select m.title, 
-- f.revenue - f.budget as profit
select *
from movies m
join financials f
on m.movie_id = f.movie_id
order by profit desc;

-- Print actor_id vs. movies names that actor has played a role in. Sort your result in the ascending order of actor_id.

select ma.actor_id, m.title
from movies m
join movie_actor ma
on m.movie_id = ma.movie_id
order by actor_id asc;

-- Print each movie title along with the names of the actors played role in that movie.




