 -- Final Project
/* Dear Maven Movies Management,
   
   I am excited about the potential acquisition and learning more about your rental business.
	
    Please bear with me as I am new to the industry, but I have a
	number of questions for you. Assuming you can answer them all,
	and that there are no major surprises, we should be able to move
	forward with the purchase.

	Best,
	Martin Moneybags 
*/

-- -------------------------------------------------------------------------------------------------------
								      -- Questions
-- -------------------------------------------------------------------------------------------------------

/*  
  1.  My partner and I want to come by each of the stores in person and meet the managers. Please send over
      the managers’ names at each store, with the full address of each property (street address, district, city, and
      country please).
*/
	select 
		st.first_name,
        st.last_name,
        addr.address,
        addr.address2,
        addr.district,
        ci.city,
        co.country
    from staff as st
    inner join address as addr
     on st.address_id = addr.address_id
	inner join city as ci
		on addr.city_id = ci.city_id
	inner join country as co
		on ci.country_id = co.country_id;


/*
2.  I would like to get a better understanding of all of the inventory that would come along with the business.
	Please pull together a list of each inventory item you have stocked, including the store_id number, the
	inventory_id , the name of the film, the film’s rating, its rental rate and replacement cost.
*/
 
  select 
	inv.store_id,
    inv.inventory_id,
    film.title,
    film.rating,
    film.rental_rate,
    film.replacement_cost
  from 
   film
  inner join inventory as inv
   on film.film_id = inv.film_id;

    

/*
3. 	From the same list of films you just pulled, please roll that data up and provide a summary level overview of
	your inventory. We would like to know how many inventory items you have with each rating at each store.
*/

  select 
    film.rating,
    count(case 
			when store.store_id = 1 then inv.inventory_id end) as store_1,
    count(case        
			when store.store_id = 2 then inv.inventory_id end) as store_2
  from 
   film
  inner join inventory as inv
   on film.film_id = inv.film_id
  inner join store 
	on inv.store_id = store.store_id
    group by 
    	film.rating;
     
 

/*
4.  Similarly, we want to understand how diversified the inventory is in terms of replacement cost. We want to
	see how big of a hit it would be if a certain category of film became unpopular at a certain store.
	We would like to see the number of films, as well as the average replacement cost, and total replacement
	cost, sliced by store and film category.
*/

	select 
		inventory.store_id,
        category.name,
        count(case 
					when store_id = 1 then inventory_id 
			 end) as store_1,
		count(case
					when store_id = 2 then inventory_id
			 end) as store_2,
	AVG(film.replacement_cost) AS avg_replacement_cost, 
    SUM(film.replacement_cost) AS total_replacement_cost
    from
		inventory
	inner join film
     on inventory.film_id = film.film_id
    inner join film_category
     on film.film_id = film_category.film_id
	inner join category
	 on film_category.category_id = category.category_id
     group by 
		inventory.store_id,
        category.name;
        
        
       -- 2nd method
       SELECT 
	store_id, 
    category.name AS category, 
	COUNT(inventory.inventory_id) AS films, 
    AVG(film.replacement_cost) AS avg_replacement_cost, 
    SUM(film.replacement_cost) AS total_replacement_cost
    
FROM inventory
	LEFT JOIN film
		ON inventory.film_id = film.film_id
	LEFT JOIN film_category
		ON film.film_id = film_category.film_id
	LEFT JOIN category
		ON category.category_id = film_category.category_id
	GROUP BY 
		store_id, 
        category.name
	ORDER BY 
		SUM(film.replacement_cost) DESC;

/* 
 5.	We want to make sure you folks have a good handle on who your customers are. Please provide a list
	of all customer names, which store they go to, whether or not they are currently active, and their full
	addresses street address, city, and country.
*/

	select 
		concat(customer.first_name,customer.last_name) as customer_name,
        store.store_id,
        case 
			when store.store_id = 1 and active = 1 then "active" 
            when store.store_id = 2 and active = 1 then "active" 
            when store.store_id = 1 and active = 0 then "inactive"
            when store.store_id = 2 and active = 0 then "inactive" 
            end as active_status,
		address.address,
        address.district,
        city.city,
        country.country
	from
     country
	inner join city
     on country.country_id = city.city_id
	inner join   address 
     on city.city_id = address.city_id
	inner join customer
     on address.address_id = customer.address_id
	inner join store
     on store.address_id = store.address_id;
		


/* 
6.	My partner and I would like to get to know your board of advisors and any current investors. Could you
	please provide a list of advisor and investor names in one table? Could you please note whether they are an
	investor or an advisor, and for the investors, it would be good to include which company they work with.
*/
	select 
		"advisor" as 'invest/adivs',
        concat(first_name," ",last_name) as full_name,
        "n.a" as company_name
	from
		advisor
	union
    select 
		"investor" as 'invest/adivs',
        concat(first_name," ",last_name) as full_name,
        company_name
	from
		investor;
	

/*	
7.	We would like to understand how much your customers are spending with you, and also to know who your
	most valuable customers are. Please pull together a list of customer names, their total lifetime rentals, and the
	sum of all payments you have collected from them. It would be great to see this ordered on total lifetime value,
	with the most valuable customers at the top of the list.
*/

  select
	customer.first_name,
    customer.last_name,
    count(rental.rental_id) as count_rental,
    sum(payment.amount) as total_amount
FROM customer
	LEFT JOIN rental ON customer.customer_id = rental.customer_id
    LEFT JOIN payment ON rental.rental_id = payment.rental_id
  group by
   	customer.first_name,
    customer.last_name
  order by  sum(payment.amount) desc;
    

/*	
8.	We're interested in how well you have covered the most awarded actors. Of all the actors with three types of
	awards, for what % of them do we carry a film? And how about for actors with two types of awards? Same
	questions. Finally, how about actors with just one award?
*/

 SELECT
	CASE 
		WHEN actor_award.awards = 'Emmy, Oscar, Tony ' THEN '3 awards'
        WHEN actor_award.awards IN ('Emmy, Oscar','Emmy, Tony', 'Oscar, Tony') THEN '2 awards'
		ELSE '1 award'
	END AS number_of_awards, 
    AVG(CASE WHEN actor_award.actor_id IS NULL THEN 0 ELSE 1 END) AS pct_w_one_film
	FROM 
	actor_award
	GROUP BY 
	  number_of_awards;
	

	