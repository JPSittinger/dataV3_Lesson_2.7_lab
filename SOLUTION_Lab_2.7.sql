USE sakila;

-- 1. How many films are there for each of the categories in the category table. 
-- Use appropriate join to write this query.
SELECT * FROM category LIMIT 10;
SELECT * FROM film LIMIT 10;
SELECT * FROM film_category LIMIT 10;

SELECT name, COUNT(film_id) AS film_amount
FROM category
JOIN film_category
ON category.category_id = film_category.category_id
GROUP BY name;

-- 2. Display the total amount rung up by each staff member in August of 2005.
SELECT * FROM staff LIMIT 10;
SELECT * FROM payment LIMIT 10;

SELECT staff_id, COUNT(amount) AS total_amount
FROM staff
JOIN payment
USING (staff_id)
GROUP BY staff_id;

-- 3. Which actor has appeared in the most films?
SELECT * FROM film_actor LIMIT 10;

SELECT a.first_name as name, a.last_name as last_name, COUNT(DISTINCT(f.film_id)) as amount
FROM film_actor f
JOIN actor a
ON f.actor_id = a.actor_id
GROUP BY a.actor_id
ORDER BY amount DESC;

-- 4. Most active customer (the customer that has rented the most number of films)
SELECT COUNT(DISTINCT r.rental_id) AS amount_rented, first_name, last_name, c.customer_id
FROM customer c
JOIN rental r
USING (customer_id)
GROUP BY c.customer_id
ORDER BY amount_rented DESC
LIMIT 1;

-- 5. Display the first and last names, as well as the address, of each staff member.
SELECT * FROM staff;
SELECT * FROM address;

SELECT first_name, last_name, a.address
FROM staff
JOIN address a
USING (address_id);

-- 6. List each film and the number of actors who are listed for that film.
SELECT * FROM film_actor;
SELECT * FROM film;

SELECT title, COUNT(actor_id)
FROM film_actor
JOIN film
USING (film_id)
GROUP BY title
ORDER BY COUNT(actor_id) DESC;

-- 7. Using the tables payment and customer and the JOIN command, list the total paid by each customer. 
-- List the customers alphabetically by last name.

SELECT c.last_name, c.first_name, COUNT(p.amount)
FROM payment p 
JOIN customer c
USING (customer_id)
GROUP BY customer_id
ORDER BY c.last_name;

-- 8. List number of films per category.

-- SEE Nr. 1!
