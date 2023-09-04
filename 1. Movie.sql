-- maven movies

use mavenmovies;

-- lets see the data in rental table 

select * 
from rental;

-- let see the data inventory table 

select * 
from  inventory;

-- select 
 -- selecting the specific column 
 select 
	customer_id,
    rental_date
 from 
	rental;
    
-- assignment 1
	-- “I’m going to send an email letting our customers know there has been a management change. (email)
    -- could you pull a list of the first_name, last_name and email ?
 select 
	first_name,
    last_name,
    email
from 
	customer;
    
-- select distinct values
	-- show all the distinct rating in the film table
 
 select 
	distinct rating
from 
	film; 

-- assignment 2
	-- “My understanding is that we have titles that we rent for durations of 3 , 5 , or 7 days.
	-- could you please pull the records of our films and see if there are any other rental durations 

 select
	distinct rental_duration
from
	film;
    
-- WHERE clauses can filter records 
 
 -- filtering data using Equals ( = ) operator 
select 
	customer_id,
    rental_id,
    amount,
    payment_date
from
	payment 
where 
	amount = 0.99;

 -- filtering data using does not Equals ( <> ) operator
   select 
	customer_id,
    rental_id,
    amount,
    payment_date
from
	payment 
where 
	amount <> 0.99;  
    
-- filtering data using greator than ( > ) operator.
 select 
	customer_id,
	rental_id,
	amount,
	payment_date
 from
	payment 
where 
	payment_date > 2005-02-01;

-- filtering data using less than ( < ) operator.
 select 
	customer_id,
	rental_id,
	amount,
	payment_date
from
	payment 
where 
	amount < 5;
    
-- filtering data using greator than equal to ( >= ) operator.
 select 
	customer_id,
	rental_id,
	amount,
	payment_date
 from
	payment 
where 
	amount >=5.99;
    
-- filtering data using greator than equal to ( >= ) operator.
 select 
	customer_id,
	rental_id,
	amount,
	payment_date
 from
	payment 
where 
	amount >= 0.99 ;
  
-- assignment 3
  -- “I’d like to look at payment records for our long term customers to learn about their purchase patterns.
  -- Could you pull all payments from our first 100 customers (based on customer ID)?”
  
  ## first method
  select 
	customer_id,
    rental_id,
    amount,
    payment_date
 from 
	payment
 where 
    customer_id < 101;
    
  ## second method 
   select 
	customer_id,
    rental_id,
    amount,
    payment_date
 from 
	payment
 where 
    customer_id between 1 and 100;
    
    
-- where using and operator 

select 
	customer_id,
    rental_id,
    amount,
    payment_date
from
	payment
where
	amount = 0.99 and payment_date > '2006-01-01'; 

-- assignment 4 
 -- “The payment data you gave me on our first 100 customers was great thank you! 
 -- Now I’d love to see just payments over $5 for those same customers, since January 1, 2006 .”
 
 select 
	customer_id,
    rental_id,
    amount,
    payment_date
from
	payment
where 
	amount > 5 and payment_date > '2006-01-01' and customer_id < 101;  /* and wil trim your dataset*/
    
-- where clause with or
  select 
   customer_id,
   rental_id,
   amount,
   payment_id
  from 
   payment
  where 
   customer_id = 5 or customer_id = 11 or customer_id = 29; /* or will give the more large dataset */
   
-- asignment 5 
 -- “The data you shared previously on customers 42, 53, 60, and 75 was good to see.
 -- Now, could you please write a query to pull all payments from those specific customers along with payments over $5 , from any customer?”

  select 
	customer_id,
    rental_id,
    amount,
    payment_date
  from
   payment
  where amount > 5 or
   customer_id = 42 or
   customer_id = 53 or
   customer_id = 60 or
   customer_id = 75 ;
   
--  using AND & OR in one statement tell me what we wil the answers 
   select 
	customer_id,
    rental_id,
    amount,
    payment_date
  from
   payment
  where amount > 5 and
   customer_id = 75 or
   customer_id = 42 or
   customer_id = 53 or
   customer_id = 60;
   
-- Combining WHERE and IN
 -- we can easily write above query easily using in it can help in reading the file very easily 
 
  select 
	customer_id,
    rental_id,
    amount,
    payment_date
 from
	payment
 where 
	amount > 5 and customer_id IN (75,42,53,60);
    
-- let do one examplw with only customer_id
 
   select 
	customer_id,
    rental_id,
    amount,
    payment_date
 from
	payment 
 where
	customer_id in (5,11,23);
  
-- The Like Operator 
 -- it is used for patterm matching 
 
 -- let see the mutiple secnario of the Like with wild card (%,_)
 
  select
	title,
    description
 from 
	film
 Where 
	description LIKE '%Dentist%';
   
-- like with wild card %
 
 select 
	title,
    description
 from
	film
 where
	description like '%Epic%';  
    
-- like with wild card % 

	select 
		title,
        description
	from
		film
	where 
		description like 'Epic%';

-- like with wild card % 

	select 
		title,
        description
	from
		film
	where
		description like '%Epic';
        
 -- like with wild card % 
 
	select 
		title,
        description
	from
		film
	where
		description like '%china';
        
-- like with wild card % 
 
	select 
		title,
        description
	from
		film
	where
		description like '%china';
        
-- like with _ 
 
	select 
		title,
        description
	from
		film
	where
		description like '_china';  /* Note that space is not consider as the character */

        
 -- = (Equal to operator) with _ 
 
	select 
		title,
        description
	from
		film
	where
		title = '_LADDIN CALENDER';  /* we will not get any record because we using equal to opeartor which will exactly match the value and there is no value*/
	
 -- like with the _ 
 
	select 
		title,
        description
	from
		film
	where
		title NOT LIKE '_LADDIN CALENDER'; 


-- assignment 6
 -- we need to understand the special features in our films. 
 -- Could you pull a list of films which include a behind the scenes special features ?
 
 select 
	* 
 from
	film
 where 
	special_features LIKE '%Behind the Scenes';
    
-- the group by clause 
 -- use aggregate with non aggregate column
 
 select
	rating,
    COUNT(film_id) as film_id_with_rating
 from
	film
 Group by 
	rating;
	
-- assignment 7 
 -- “I need to get a quick overview of how long our movies tend to be rented out for.
 -- Could you please pull a count of titles sliced by rental duration ?”

 select
	rental_duration, 
    count(title) as film_with_rental_duration 
 from
	film
 group by
	rental_duration;

-- group by with mulitple duration

 select 
	rental_duration,
    rating,
    replacement_cost,
   count(film_id) as films_with_this_rental_duration 
 from
	film
 group by
	rental_duration ,
     rating ,
     replacement_cost;

-- Aggregate function with group by 
 select 
	rating,
    count(film_id) as count_of_films,
    min(length) as shortest_film,
    max(length) as longest_film,
    avg(length) as avg_length_film,
    -- sum(length) as total_mintues,
    avg(rental_duration) as average_rental_duration
 from 
	film
 group by
	rating;
    
-- assignment 8
 -- “I’m wondering if we charge more for a rental when the replacement cost is higher.
 -- Can you help me pull a count of films , along with the average , min , and max rental rate , grouped by replacement cost.
       
 select 
	replacement_cost,
    count(film_id) as number_of_films,
	avg(rental_duration) as average_rental,
    min(rental_rate) as cheapest_rental,
    max(rental_rate) as most_expensive_rental
 from
	film
 group by 
	replacement_cost;
    
 -- Having clause
  -- having clause is always used with group by 
  -- having is used to filter group level data
   --  we can use it like this ( HAVING Name LIKE 'B%' )

 select 
	customer_id,
    count(rental_id) as total_rentals
from
	rental
group by 
	customer_id
Having	
	count(rental_id) < 30;
    
-- “I’d like to talk to customers that have not rented much from us to understand if there is something we could be doing better.
 -- Could you pull a list of customer_ids with less than 15 rentals all time?”
 
 select
	customer_id,
    count(*) as total_rentals
 from
	rental
 group by 
  customer_id
 having 
  total_rentals < 15;
  
-- order by clause 
 --  it is used order the value 
 
 select 
	customer_id,
    rental_id,
    amount,
    payment_date
 from
	payment
 order by 
	amount desc, 
    customer_id desc;
    
 -- order by without group by
 
  select 
	customer_id,
    sum(amount) as total_payment_amount
 from
	payment
group by 
	customer_id
 order by
	sum(amount) desc;
	
 -- assignment number 9
  -- “I’d like to see if our longest films also tend to be our most expensive rentals.
  -- Could you pull me a list of all film titles along with their lengths and rental rates , and sort them from longest to shortest
	
    select
		title,
        length,
        rental_rate
	from
		film
	order by 
		length desc; 
        
-- Case Statement 
 --  case always run top to bottom and left to right
 -- exceution in case happen step by step 
 
 select 
	length,
    case 
		when length < 60 then 'under 1hr'
        when length between 60 and 90 then '1-1.5 hrs'
        when length > 90 then 'over 1.5 hrs'
        else 'uh ok... check logic'
	end as length_bucket
 from 
	film;
	
-- Common Case operator 
 -- all the operator that work with the where clause will work with in case statement also for example - (IN, Between, Or, and , = ,> ,< ,<=, >=)
 
 -- filt for recomenadtaion for these case 
 SELECT 
  distinct title,
  case	
	when rental_duration <= 4 then 'rental_too-short'
    when rental_rate >=3.99 then 'too_expensive'
    when rating IN ('Nc-17','R') then 'Too adult'
    when length Not Between 60 and 90 then 'too short or too long'
    when description like '%shark' then 'nope has sharks'
    else 'great reco for my niece'
    end as fit_for_recommendation,
 case	
	when description like '%shark' then 'nope has sharks'
    when length Not Between 60 and 90 then 'too short or too long'
	when rating IN ('Nc-17','R') then 'Too adult'
    when rental_duration <= 4 then 'rental_too-short'
    when rental_rate >=3.99 then 'too_expensive'
    else 'great reco for my niece'
    end as fit_for_recommendation
from 
	film;
 
--  assignment 10 
 -- “I’d like to know which store each customer goes to, and whether or not they are active.
 -- Could you pull a list of first and last names of all customers , and label them as either ‘store 1 active’, ‘store 1 inactive’, ‘store 2 active’, or ‘store 2 inactive’?”

Select 
	first_name,
    last_name,
    case
		when store_id = 1 and active = 1 then 'store 1 active'
        when store_id = 1 and active = 0 then 'store 1 inactive'
        when store_id = 2 and active = 1 then 'store 2 active'
        when store_id = 1 and active = 0 then 'store 2 inactive'
        else 'note store here'
	end as store_and_status 
from 
	customer ;
    

-- Pro tip : "Pivoting with Count and Case"  
   -- pivot (row to column)
   -- Unpivot (column to row)

 -- check the inventory table data
  
  select * from inventory;

 -- here we are finding count of inventory per film id
 
 select 
	film_id,
    count( ( case when store_id = 1 then inventory_id else Null end ) ) as count_of_store_1_inventory,
    count(( case when store_id = 2 then inventory_id else null end )) as count_of_store_2_inventory
 from
	inventory
 group by
	film_id
 order by
	film_id;

-- assignment 11
 -- “I’m curious how many inactive customers we have at each store.
 -- Could you please create a table to count the number of customers broken down by store_id (in rows), and active status (in columns)?”
 
 select 
	store_id,
    count(case when active = 1 then store_id end ) as active,
    count(case when active = 0 then store_id end) as inactive
 from
	customer
 group by 
	store_id; 
    
 -- let see the customer table first
select * from customer;  