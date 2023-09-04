-- the join statements
  -- the whole point of using join is to enable muilti table querying 

 -- inner join:  Matching record from both the table
  select 
	 distinct inv.inventory_id, re.rental_id
  from
	inventory as inv
  inner join 
	rental as re
		on inv.inventory_id = re.inventory_id;
   
 -- assignment 1  
 --  “Can you pull for me a list of each film we have in inventory?
  -- I would like to see the film’s title , description , and the store_id value associated with each item, and its inventory_id .
  
  select 
	inventory.inventory_id,
    inventory.store_id,
    film.title,
    film.description 
 from
	inventory 
 inner join film
	on inventory.film_id = film.film_id;
    
 -- left join
  -- perserve all the record from the left table and matching record from the right table
   -- it is helpful when you addition data from the second table 
    
  -- count of all film in which each actor appeared
  
  select 
	actor.first_name,
    actor.last_name,
    count(film_actor.film_id) as number_of_films
 from
	actor
	left join film_actor 
     on actor.actor_id = film_actor.actor_id
 group by 
	actor.first_name,
    actor.last_name;
    
-- assignment 2
 -- “One of our investors is interested in the films we carry and how many actors are listed for each film title .
 -- Can you pull a list of all titles, and figure out how many actors are associated with each title?
 
  select 	
	film.title,
    count(film_actor.actor_id) as number_of_actors
 from 
	film
  left join film_actor
   on film.film_id = film_actor.film_id
 group by 	
	film.title;
    
    
-- right join
   -- return all the records from the right table and the matching records from the left table 
   
   select 
	actor.actor_id,
    actor.first_name as actor_first,
    actor.last_name as actor_last,
    actor_award.first_name as award_first,
    actor_award.last_name as award_last,
    actor_award.awards
 from
	actor
	right join actor_award
		on actor.actor_id = actor_award.actor_id
 order by 
	actor_id;
    
-- full outer join 
  -- it will return all the matching record from both the table 
  -- Note: You cannot do full outer join in my sql if have to use union to make full outer join 
 select 
	actor.actor_id,
    actor.first_name as actor_first,
    actor.last_name as actor_last,
    actor_award.first_name as award_first,
    actor_award.last_name as award_last,
    actor_award.awards
 from
	actor
	 left join actor_award
		on actor.actor_id = actor_award.actor_id
union     
      select 
	actor.actor_id,
    actor.first_name as actor_first,
    actor.last_name as actor_last,
    actor_award.first_name as award_first,
    actor_award.last_name as award_last,
    actor_award.awards
 from
	actor
	 right join actor_award
		on actor.actor_id = actor_award.actor_id;


-- pro tips: what we will do if we dont have key to join two table 
  -- bridge concept (Find that table which have link between these two table) 
  --  union all concept 
  
  select 
	film.film_id,
    film.title,
    category.name as category_name
 from
	film
 inner join film_category
	on film.film_id = film_category.film_id
 inner join category 
	on film_category.category_id = category.category_id; 
    
 -- let take one table langugae and film_actor
	
    select
		language_id,
        name,
        last_update,
	    ' ' as actor_id,
        ' ' as film_id,
        ' ' as last_update
	from
		language
	union 
    select
		'' as language_id,
        '' as name,
        '' as last_update,
	    actor_id,
        film_id,
        last_update
	from
		film_actor;
    
 -- assignment 3
  -- “Customers often ask which films their favorite actors appear in.
	-- It would be great to have a list of all actors , with each title that they appear in. Could you please pull that for me?”	
    
 select 
	actor.first_name as first_name,
    actor.last_name as last_name,
    film.title as title
 from
	film
 inner join 
	film_actor
 on  film.film_id = film_actor.film_id
 inner join 
	actor
 on film_actor.actor_id = actor.actor_id;
 
 
 --  multi-condition join 
   -- multi condition join using where clause
 select 
	film.film_id,
    film.title,
    film.rating,
    category.name
 from
	film 
	inner join film_category
     on film.film_id = film_category.film_id
	inner join category
     on film_category.category_id = category.category_id
     where 
		category.name = 'horror'
	order by 
		film_id; 
        
 -- multi condition join using and in join 
   
 select 
	film.film_id,
    film.title,
    film.rating,
    category.name
 from
	film 
	inner join film_category
     on film.film_id = film_category.film_id
	inner join category
     on film_category.category_id = category.category_id and category.name = 'horror'
	order by 
		film_id; 
        
        
 -- assigngment 4
  -- “The Manager from Store 2 is working on expanding our film collection there.
  -- Could you pull a list of distinct titles and their descriptions , currently available in inventory at store 2
  
  select
	film.title,
    film.description
 from
	film
 inner join inventory	
	on film.film_id = inventory.film_id and inventory.store_id = 2
 order by title;
 
 -- union 
	-- union - unique value 
    
 select 
	'advisor' as type,
    first_name,
    last_name
 from
	advisor
union
 select 
	'investor' as type,
    first_name,
    last_name
 from
	investor;
	
 -- assignment 5
  -- “We will be hosting a meeting with all of our staff and advisors soon.
  -- Could you pull one list of all staff and advisor names , and include a column noting whether they are a staff member or advisor ?

 select 
	'advisor' as type,
    first_name,
    last_name
 from
	advisor
 union 
 select 
	'staff' as type,
     first_name,
     last_name
 from
	staff /* we can do union of two table if we selecting same number of column in select statement it is not needed to select all the column from the both the table to do union*/
 
 
    
 