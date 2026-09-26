--create database

CREATE DATABASE movie_stream

--create othe table
DROP TABLE if EXISTS neflix_titles;
CREATE TABLE neflix_titles 
(show_id varchar(6),
type varchar(10),
title varchar(150),
director varchar(210),
casts varchar(1000),
country varchar(150),
date_added date,
release_year int,
rating varchar(10),
duration varchar(15),
listed_in varchar(100),
description varchar(250)
)


SELECT*FROM neflix_titles 


-- 15 Business Problems & Solutions
/*
1. Count the number of Movies vs TV Shows
2. Find the most common rating for movies and TV shows
3. List all movies released in a specific year (e.g., 2020)
4. Find the top 5 countries with the most content on Netflix
5. Identify the longest movie
6. Find content added in the last 5 years
7. Find all the movies/TV shows by director 'Rajiv Chilaka'!
8. List all TV shows with more than 5 seasons
9. Count the number of content items in each genre
10.Find each year and the average numbers of content release in India on netflix. 
return top 5 year with highest avg content release!
11. List all movies that are documentaries
12. Find all content without a director
13. Find how many movies actor 'Salman Khan' appeared in last 10 years!
14. Find the top 10 actors who have appeared in the highest number of movies produced in India.
15.
Categorize the content based on the presence of the keywords 'kill' and 'violence' in 
the description field. Label content containing these keywords as 'Bad' and all other 
content as 'Good'. Count how many items fall into each category.*/

--1. Count the number of Movies vs TV Shows

SELECT
type,
count(*) as total_content
FROM neflix_titles 
GROUP BY
type

--2. Find the most common rating for movies and TV shows
select
type, 
max(rating)
FROM neflix_titles
GROUP by 1 --not currect


--
SELECT  
type,
rating,
count(*)
FROM neflix_titles
GROUP by type,rating
ORDER by count(*) DESC
--TV-MA movies and tv shows


--3. List all movies released in a specific year (e.g., 2020)
SELECT
title,
type,
date_added
from neflix_titles
WHERE
type='Movie'
AND
to_char(date_added,'yyyy')='2020'
ORDER BY
date_added

--4. Find the top 5 countries with the most content on Netflix
--Country combinations
SELECT
country,
count(*) as count_of_movies
FROM neflix_titles
WHERE
country is not null
GROUP by country
order by count(*) DESC
LIMIT 5;
-- this is not vcount the movie or conetent in multiple country
--Individual countries
SELECT
unnest(STRING_to_array(country,',')) as new_country,
count(show_id) as total_content
FROM neflix_titles
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;
--5. Identify the longest movie
SELECT*FROM neflix_titles 
