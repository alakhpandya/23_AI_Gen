use paintings;
select *
from artists;

-- Display the duplicate entries in artists table

use demo;
select *
from products;

select productName, count(*)
from products
group by productName;

select id, first_name, last_name, count(*) frequency
from artists
group by id, first_name, last_name
having frequency > 1;

select id, first_name, last_name
from artists
group by id, first_name, last_name
having count(*) > 1;

-- Delete the duplicate entries from artists table