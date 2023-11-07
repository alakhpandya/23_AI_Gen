/*
Get me the movies which made at least 500% profit. Profit percentage = (revenue - budget)*100/budget but have rating less than average ratings.
*/

use moviesdb;
select * from movies;
select * from financials;

with profitability as (
	select movie_id,
	(revenue - budget) * 100 / budget as profit_pct
	from financials
),
bad_movies as (
	select movie_id, title, imdb_rating
    from movies
    where imdb_rating < (select avg(imdb_rating) from movies)
)
select p.movie_id, b.title, b.imdb_rating, round(p.profit_pct) as protif
from profitability p
join bad_movies b on b.movie_id = p.movie_id
where p.profit_pct > 500;

/*
Find the most profitable orders. 
Orders which have higher sells price than the average sales price for their city and for which the deal size is not small are considered as ‘Most Profitable Orders’ 
(Use sales_order database)
*/
use demo;
select * from Sales_order;
select * from customers;
select * from products;

select c.city, avg(s.sales)
from Sales_order s
join customers c on c.customer_id = s.customer
group by c.city;