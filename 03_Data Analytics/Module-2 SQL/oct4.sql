use moviesdb;

select * from movies;

select title, industry
from movies
where industry = "Bollywood";

select distinct industry
from movies;

select *
from movies
where title like "%Avenger%";

select * 
from movies
-- where imdb_rating >= 4 and imdb_rating <= 8;
where imdb_rating between 4 and 8;

-- Print titles & release_year of all the movies from Marvel Studios
-- Give me all the Hollywood movies with even movie_id & above 7 ratings
-- Print all the movies which have “The” in them and have rating between 5 to 9 (including both)
-- Print the year in which the movie Godfather was released
-- Print all the movie studios of Bollywood.

select distinct studio from movies where industry like "%bollywood%";

-- Give me all the movies released between 2015 and 2017 (including both)

-- select count(title)
select count(*)
from movies
where industry = "Bollywood";

select count(distinct industry)
from movies;

-- Give me the total number of movies released in years 2013, 2017 & 2022
select count(*)
from movies
-- where release_year = 2013 or release_year = 2017 or release_year = 2022;
where release_year in (2013, 2017, 2022);

-- Give me the movies for which imdb_rating is not available.
select *
from movies
where imdb_rating IS NULL;

-- Give me the movies for which imdb_rating are available.
select *
from movies
where imdb_rating is not NULL;

-- Print the movies sorted by their imdb_ratings
select *
from movies
order by imdb_rating;

select *
from movies
order by imdb_rating desc;

-- Give me the top 3 movies based on their ratings
select *
from movies
order by imdb_rating desc
limit 3;

-- Give me the 5 latest movies