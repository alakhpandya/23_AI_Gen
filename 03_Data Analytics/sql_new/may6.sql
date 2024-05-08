
use moviesdb;

select * from movies;
select * from movie_actor;

select *
from movies m
join movie_actor ma
on m.movie_id = ma.movie_id
where m.movie_id % 2 != 0;

-- where imdb_rating > 7;

select actor_id, max(imdb_rating)
from movies m
join movie_actor ma
on m.movie_id = ma.movie_id
group by actor_id
having max(imdb_rating) > 7.5;

-- Get me the highest budget and highest revenue for each actor present in movie_actor table

-- Get me the names of the movies for which we do not have any financial details.

select *
from movies m
left join financials f
on m.movie_id = f.movie_id
where f.movie_id is null;



-- Print all the actor ids who have not played a role in any movie
select * from actors;
select * from movie_actor;

select a.actor_id, a.name from actors a
left join movie_actor ma
on a.actor_id = ma.actor_id
where ma.movie_id is null;

-- Display the languages in which no movies has ever produced