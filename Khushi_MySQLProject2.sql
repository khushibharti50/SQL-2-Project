-- use database 
create database painting;


-- use painting;
use painting;

-- show tables

show tables;

-- Joining Tables:
-- 1. Retrieve the full name of artists along with the names of the museums where their works are displayed.

select artist.full_name,museum.name as museum_name
from artist
inner join work on artist.artist_id = work.artist_id
inner join museum on work.museum_id = museum.museum_id;


-- 2. Group By and Count:
-- How many works does each artist have in the database? Display the artist's full name along with the count of their works, ordered by the count in descending order.

select artist.full_name,count(work.work_id) as work_count
from artist
inner join work on artist.artist_id = work.artist_id
group by artist.full_name
order by work_count desc;


-- 3. Order By and Limit:
-- List the top 5 museums with the highest number of works displayed in the database, along with their respective counts.

select museum.name ,count(work.work_id) as work_count
from museum
inner join work on museum.museum_id = work.museum_id
group by museum.name
order by work_count desc
limit 5;


-- 4. Join, Order By, and Limit:
-- Display the names and styles of the works along with the corresponding museum names, ordered by the museum name in ascending order. Limit the results to 10.
select work.name,work.style,museum.name as museum_name
from museum
inner join work on museum.museum_id = work.museum_id
order by museum_name asc
limit 10;


-- 5.Join, Group By, and Sum:
-- Show the total sale price for each artist's works. Display the artist's full name along with the total sale price, ordered by the total sale price in descending order.

select a.full_name as artist_name, sum(c.sale_price) as total_sale_price
from artist a
inner join work b on a.artist_id = b.artist_id
inner join product_size c on b.work_id = c.work_id
group by artist_name
order by total_sale_price desc;



-- 6. Join, Group By, and Having:
-- List artists who have more than 3 works in the database, along with the count of their works.


SELECT artist.full_name, COUNT(work.work_id) AS work_count
FROM artist
JOIN work ON artist.artist_id = work.artist_id
GROUP BY artist.full_name
HAVING COUNT(work.work_id) > 3;

-- 7. Join, Where, and Order By:
-- Retrieve the names of works and their corresponding artists' full names for works that have a sale price smaller than their regular price. 

select artist.full_name,work.name,sale_price,regular_price
from artist
join work on artist.artist_id = work.artist_id
join product_size on product_size.work_id = work.work_id
where sale_price < regular_price
order by sale_price;


-- 8. Join, Group By, and Average:
-- Calculate the average height and width of the artworks in the database. Display the average height and width.


select work.name as painting_name, avg(canvas_size.height) as avg_height,avg(canvas_size.width) as avg_width
from work 
inner join product_size  on work.work_id = product_size.work_id
inner join canvas_size  on canvas_size.size_id = product_size.size_id
group by painting_name;



-- Join, Group By, and Max:
-- 9 Find the maximum sale price among all the works in each museum. Display the museum name along with the maximum sale price.
select work.name as painting_name, max(product_size.sale_price) as max_price
from work
inner join product_size on work.work_id = product_size.work_id
group by painting_name
order by max_price desc;


-- Join, Group By, and Concatenate:
-- 10. Concatenate the first name and last name of artists along with their nationality, separated by a comma. Display the concatenated string along with the count of works by each artist, ordered by the count in descending order.

select concat(artist.first_name,' ',artist.last_name,',',artist.nationality) as Name_with_nationality,
count(*) as work_count
from artist
inner join work on artist.artist_id = work.artist_id
group by Name_with_nationality
order by work_count desc;



