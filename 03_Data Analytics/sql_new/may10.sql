use demo;

-- 1. Print the orders which were placed after august 2003 and their deal size is small.

select * from sales_order
where order_date > 2003-08-31 and deal_size = "Small";

-- 2. Print orders which were placed in the last quarter of 2003 and have deal size small.
select * from sales_order
where qtr_id = 4 and year_id = 2003 and deal_size="Small";

/*
5. Find the most profitable orders. Orders which have higher sells price than the average sales price for their city and for which the deal size is not small 
are considered as ‘Most Profitable Orders’ (Use ‘demo’ database)
*/

select * from customers;
select * from sales_order;
select * from products;

select order_number, sales, deal_size, customer, a.city, avg_sales
from (
	select order_number, sales, deal_size, customer, city
	from sales_order s
	left join customers c
	on s.customer = c.customer_id
) as a
left join (
	select city, round(avg(sales), 2) as avg_sales
	from (
	select order_number, sales, deal_size, customer, city
	from sales_order s
	left join customers c
	on s.customer = c.customer_id
	) as t1
	group by city
) as b
on a.city = b.city
where sales > avg_sales and deal_size <> "Small";

-- 6. Find the difference in average sales for each month of 2003 and 2004 (Use ‘demo’ database)
select a.month_id, 2003_avg_sales, 2004_avg_sales, round(2004_avg_sales - 2003_avg_sales, 2) as difference
from (
select month_id, round(avg(sales), 2) as 2003_avg_sales
from sales_order
where year_id = 2003
group by month_id) as a
join (
select month_id, round(avg(sales), 2) as 2004_avg_sales
from sales_order
where year_id = 2004
group by month_id) as b
on a.month_id = b.month_id
order by a.month_id;