use moviesdb;

select *
from movies 
where release_year in (2003, 2010, 2015, 2018);

-- Give me the movies for which imdb_rating is not available
select *
from movies
where imdb_rating is null;

-- Give me the movies for which imdb_rating is available
select *
from movies
where imdb_rating is not null;

-- Print all the movies sorted by the year of their release
select title, industry, release_year, imdb_rating
from movies
order by release_year asc;

select title, industry, imdb_rating
from movies
order by release_year desc;

select title, industry, release_year, imdb_rating
from movies
order by 3;

-- Print movie_id, budget & revenue from financials table for all movies sorted in descending order of their budget.

-- Print all the Bollywood movies (movie name, imdb_rating & language_id) in such a way that the most popular movie comes at the top and least one comes at the bottom.
select title, imdb_rating, language_id
from movies
where industry = "Bollywood"
order by imdb_rating desc;

-- Print the movies which have ratings between 6 to 9 sorted in ascending order of their release year.
select *
from movies
where imdb_rating between 6 and 9
order by release_year asc;

-- Print all the hollywood movies which have ratings between 6 to 9 in alphabetical order.
select *
from movies
where industry = "Hollywood" and imdb_rating between 6 and 9
order by title;

-- Print all the bollywood movies which have ratings between 6 to 9 in descending order of their release_year and if there is a tie then sorted in descending order of imdb_rating.
select *
from movies
where industry = "bollywood" and imdb_rating between 6 and 9
order by release_year desc, imdb_rating desc;

-- Get me the top 5 movies as per their ratings
select *
from movies
order by imdb_rating desc
limit 5;

-- Print movie ids of the most expensive 4 movies.
select movie_id
from financials
order by budget desc
limit 4;

-- We have organized an award ceremony for these movies. Top 3 movies are getting the bumper prizes which have been already announced. 
-- Now we want to give condolence prizes to the movies which stood from rank 4th till 10th according to their imdb_rating. 
-- You are asked to print titles and ratings of these movies.

select title, imdb_rating
from movies
order by 2 desc
limit 7
offset 3;

-- Get me the second last, third last and fourth last movies in terms of their revenue.
select *
from financials
order by revenue
limit 3 
offset 1;

-- Print profit of each movie along with the other details in the financials table
select *, revenue - budget as profit
-- select *, revenue - budget Profits
from financials;

select * from movies;


-- Print the best rating any movie has ever got.
select max(imdb_rating)
from movies;

-- Print the minimum budget that any movies was created with (ignore the currency & unit)
select min(budget)
from financials;

-- Print the average revenue of all the movies (ignore the currency & unit)
select avg(revenue)
from financials;

-- Print minimum, maximum and average imdb_rating of all movies
select min(imdb_rating) as Minimum, max(imdb_rating) as Maximum, round(avg(imdb_rating), 1) as Average
from movies;