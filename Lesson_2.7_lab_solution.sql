use sakila;

-- How many films are there for each of the categories in the category table
select name, count(fc.film_id) AS num_film_each_category
from category c 
JOIN film_category fc
ON c.category_id = fc.category_id
group by name
order by num_film_each_category DESC;

-- Display the total amount rung up by each staff member in August of 2005.

select s.first_name, s.last_name, sum(p.amount)
from staff s
join payment p
on s.staff_id = p.staff_id
where payment_date between '2005-01-01' and '2005-12-31'
group by s.staff_id;

-- Which actor has appeared in the most films?
select a.first_name, a.last_name, count(fa.film_id) as film_count
from actor a
join film_actor fa
on a.actor_id = fa.actor_id
group by a.actor_id
order by film_count DESC
limit 1;

-- Most active customer (the customer that has rented the most number of films)
select cu.first_name, cu.last_name, count(*) as rental_count
from rental re
join customer cu
on re.customer_id = cu.customer_id
group by re.customer_id
order by rental_count DESC
limit 1;

-- Display the first and last names, as well as the address, of each staff member.
select s.first_name, s.last_name, ad.address
from staff s
join address ad
on s.address_id = ad.address_id;

-- List each film and the number of actors who are listed for that film.
select f.title, count(fa.actor_id) as num_of_actors
from film f
join film_actor fa
on f.film_id = fa.film_id
group by f.title;

-- Using the tables payment and customer and the JOIN command,
-- list the total paid by each customer.
-- List the customers alphabetically by last name.
select cu.last_name, cu.first_name, sum(p.amount) as total_pay
from customer cu
join payment p
on cu.customer_id = p.customer_id
group by cu.customer_id
order by cu.last_name;

-- List number of films per category
select name, count(fc.film_id) AS num_film_each_category
from category c 
JOIN film_category fc
ON c.category_id = fc.category_id
group by name
order by num_film_each_category DESC
