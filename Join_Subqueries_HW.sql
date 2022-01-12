-- WEEK 5 
-- Question 1
-- List all customers who live in Texas (use JOINS)


select *
from address a 
join customer c 
on c.address_id = a.address_id
where district = 'Texas'
order by a.district;

-- ANSWER: 5 customers live in Texas



--Question 2
-- Get all payments above $6.99 with the customer's full name 
select first_name, last_name, amount
from customer c
join payment p 
on  p.customer_id = c.customer_id 
where amount > 6.99
order by amount 
;

-- ANSWER: see table 


--Question 3

-- Show all customer names who have made payments over $175 (use subqueries)

select first_name,last_name
from customer c 
join payment p 
on p.customer_id = c.customer_id
where p.customer_id in(
select customer_id
from payment
group by customer_id 
having sum(amount) >175
order by customer_id)
order by last_name ;




--Question 4
-- List all the customers that live in Nepal (use city table)
select city.city_id,c.country_id ,c.country 
from city
join country c 
on city.country_id = c.country_id
where country like 'Nepal';


select c.address_id , city_id
from customer c 
join address a 
on c.address_id = a.address_id 
where city_id = 81
;


--ANSWER: one customer lives in Nepal

--Question 5
-- Which staff member had the most tansactions?
select s.staff_id, count(p.payment_id)
from staff s 
join payment p 
on s.staff_id = p.staff_id 
group by s.staff_id 
;

--ANSWER: staff member 2 sold the most at 7,304

--Question 6
-- What film had the most actors in it?
select count(fa.actor_id),f.title 
from film f
join film_actor fa 
on fa.film_id = f.film_id
group by f.title
order by f.title;

--ANSWER: Academy dinosaur has the most actors with 10

--Question 7
-- Which actor has been in the least movies?
select *
from actor ;
select fa.actor_id, count(f.film_id) 
from film f
join film_actor fa 
on f.film_id = fa.film_id
group by fa.actor_id 
order by count(f.film_id)  ;

--ANSWER: Actor_id 148 (emily dee)

--Question 8
-- How many districts have more than 5 customers in it?
select count(c.customer_id), a.district 
from customer c
join address a 
on c.address_id = a.address_id 
group by a.district 
having count(c.customer_id) > 5
;


--ANSWER: 9 districts have more than 5 customers