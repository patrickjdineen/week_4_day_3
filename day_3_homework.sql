--Q1 List all customers who live in Texas
SELECT first_name, last_name
FROM customer
LEFT JOIN address
ON customer.address_id = address.address_id
WHERE address.district = 'Texas';
--A1: 5 customers

--Q2 Get all payments above $6.99 with the Customer's Full Name
SELECT first_name, last_name, amount
FROM customer
LEFT JOIN payment
ON customer.customer_id = payment.customer_id
WHERE payment.amount > 6.99
ORDER BY amount DESC;
--ANS 1406 payments

--Q3 Show all customers names who have made payments over $175
SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) >175
);
--ANS - 6 customers

--Q4 List all customers that live in Nepal
SELECT first_name, last_name
FROM customer
FULL JOIN address
ON customer.address_id = address.address_id
FULL JOIN city
ON address.city_id = city.city_id
FULL JOIN country
ON city.country_id = country.country_id
WHERE country = 'Nepal';
--ANS - Kevin Schuler

--Q5 Which staff member had the most transactions
SELECT first_name, last_name, COUNT(rental_id)
FROM rental
LEFT JOIN staff
ON rental.staff_id = staff.staff_id
GROUP BY first_name, last_name
ORDER BY count DESC;
--ANS Mike Hillyer

--Q6 How many movies of each rating are there
SELECT rating, COUNT(film_id)
FROM film
GROUP BY rating
ORDER BY count DESC;
--ANS pg-13-223, nc-17-210, R-195,PG - 194, G - 178

--Q7 show all customers who made a single payment above 6.99
SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	WHERE amount > 6.99
);
--ANS 539

--Q8 How many free rentals did our stores give out
SElECT *
FROM rental
FULL JOIN payment
ON rental.rental_id = payment.rental_id
WHERE payment.amount IS NULL;
--ANS 1452 free rentals