-- How many distinct (different) actors' last names are there?
SELECT COUNT(DISTINCT last_name) AS distinct_last_names
FROM actor;
-- In how many different languages where the films originally produced? (Use the column language_id from the film table)
SELECT COUNT(DISTINCT language_id) AS distinct_languages
FROM film;
-- How many movies were released with "PG-13" rating?
SELECT COUNT(*) AS movies_with_pg13_rating
FROM film
WHERE rating = 'PG-13';
-- Get 10 the longest movies from 2006
SELECT film_id AS film_id, title AS title, length AS duration
FROM film
WHERE release_year = 2006
ORDER BY length DESC
LIMIT 10;
-- How many days has been the company operating (check DATEDIFF() function)?
SELECT DATEDIFF(MAX(last_update), MIN(rental_date)) AS "operating"
FROM rental;
-- Show rental info with additional columns month and weekday. Get 20.
SELECT rental_id, rental_date, MONTH(rental_date) AS month, WEEKDAY(rental_date) AS weekday
FROM rental
LIMIT 20;

-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT *, 
  CASE 
    WHEN WEEKDAY(rental_date) IN (5, 6) THEN 'weekend'
    ELSE 'workday'
  END AS day_type
FROM rental;

-- How many rentals were in the last month of activity?
SELECT COUNT(*) AS rental_count
FROM rental
WHERE MONTH(rental_date) IN (6);
