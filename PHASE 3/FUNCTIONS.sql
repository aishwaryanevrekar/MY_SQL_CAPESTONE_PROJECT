use sql_capestone_project ;
-- 1. Write a function to return the total number of eco-sites in a given state.
select * from eco_sites ;

DELIMITER //
create FUNCTION no_ecosites (state_region1 varchar(100))
returns int 
deterministic
begin
     DECLARE site_count int;
     select count(*) into site_count
     from eco_sites 
     where state_region = state_region1;
     return site_count;
end //
DELIMITER ;

select no_ecosites('Kerala')  ;


-- 2. Create a function that receives a site_id and gives back the average rating from visit_logs for that site.
select * from visit_logs ;

DELIMITER //
create FUNCTION avg_visit_logs_site (site_id1 int)
returns int
deterministic
begin
     DECLARE raa int;
     select avg(rating) into raa
     from visit_logs 
     where site_id = site_id1;
     return raa;
end //
DELIMITER ;

select avg_visit_logs_site(4);
-- 3.Define a function that takes a tribe_id and returns the number of local artisans for that tribe.



-- 6. Function to fetch the total revenue for a site in a given year.
select * from visitor_statistics ;

Delimiter $$
create function total_revenue(site1 int ,year11 int )
returns decimal(50,2)
deterministic
begin
    declare total decimal(50,2) ;
    select total_revenue into total
    from visitor_statistics
    where site_id = site1 and year = year11;
    return total;
end $$
delimiter ;

select total_revenue(1,2022);


-- 7.Function that takes a waste category name and returns the total waste (kg) logged for that category.

select * from waste_category ;
select * from waste_items ;

Delimiter $$
create function total_waste_kg(cat_name varchar(100) )
returns decimal(50,2)
deterministic
begin
    declare quantity decimal(50,2) ;
    declare vv_id int ;
    select cat_id into vv_id from waste_category 
    where category_name = cat_name;
    select sum(quantity_kg) into quantity
    from waste_items
    where cat_id = vv_id;
    
    return quantity;
end $$
delimiter ;

select total_waste_kg('Organic');

-- 8. Function to return price per night for a lodge, given lodge_id.

select * from eco_lodges ;
Delimiter $$
create function price_per_night(lodge1 int)
returns decimal(50,2)
deterministic
begin
    declare price decimal(50,2) ;
    select price_per_night  into price
    from eco_lodges
    where lodge_id = lodge1;
    
    return price;
end $$
delimiter ;

select price_per_night(20);

-- 9. Function to return the name of the tribe with the highest artisan count.
DELIMITER //
create FUNCTION tribe_with_highest_artisians ()
returns varchar(100) 
deterministic
begin
     DECLARE tribe_name100 varchar(100);
     select tribe_name into tribe_name100
     from tribes t
     inner join local_artisians a 
     using (tribe_id)
     group by t.tribe_id
     order by count(a.tribe_id) desc
     limit 1;
     return tribe_name100;
end //
DELIMITER ;
 
 select tribe_with_highest_artisians();
-- 10. Function to return the total trees planted at a site (optionally by year).

delimiter $$
create function total_trees_planted(s_id int ,year int)
returns int
deterministic
begin
declare trees_plant int;
select sum(trees_planted) into trees_plant
from reforestation_logs
where site_id=s_id and year=year1;
return trees_plant ;
end $$
delimiter ;
-- More Functions 

-- 1. Write a function to return the total number of eco-sites in a given state.  -- eco_sites
select * from eco_sites ;

delimiter $$
create function total_eco_sites(state varchar(50))
returns int
deterministic
begin
declare trees_plant int;
select sum(trees_planted) into trees_plant
from reforestation_logs
where site_id=s_id and year=year1;
return trees_plant ;
end $$
delimiter ;

-- 2. Create a function that gives the average rating for a given eco-site.  -- visit_logs

DELIMITER //
create FUNCTION avg_rating_site (site_id1 int)
returns decimal(10,2)
deterministic
begin
     DECLARE raa decimal(10,2);
     select avg(rating) into raa
     from visit_logs 
     where site_id = site_id1;
     return raa;
end //
DELIMITER ;

select avg_rating_site(16);

-- 3. Write a function to return the total number of visitors to a site in a year.  -- visitor_statistics


DELIMITER //
create FUNCTION avg_rating_site (site_id1 int)
returns decimal(10,2)
deterministic
begin
     DECLARE raa decimal(10,2);
     select avg(rating) into raa
     from visit_logs 
     where site_id = site_id1;
     return raa;
end //
DELIMITER ;

-- 4. Function to return the tribe associated with a particular eco-site.  -- eco_sites, tribes

-- Using group_concat to concat all
DELIMITER //
create FUNCTION tribe_site (site_id1 int)
returns varchar(500)
deterministic
begin
     DECLARE name varchar(500);
     select group_concat(tribe_name order by tribe_name asc SEPARATOR ',') into name
     from tribes inner join eco_sites using (site_id) 
     where site_id = site_id1;
     return name;
end //
DELIMITER ;

select tribe_site(17);

-- 5. Function to return the lodge with the highest occupancy rate for a site.  -- eco_lodges, bookings
select * from booking_history;
-- PENDING 
select lodge_id from booking_history where 

DELIMITER //
create FUNCTION lodge_highest_site ()
returns int
deterministic
begin
     DECLARE raa int;
     
     return raa;
end //
DELIMITER ;

-- 6. Write a function to find the total revenue generated by a site in a year.  -- visitor_statistics

DELIMITER //
create FUNCTION total_site_revenue (year1 int, site int)
returns decimal(50,2)
deterministic
begin
     DECLARE raa decimal(50,2);
     select sum(total_revenue) into raa
     from visitor_statistics where site_id = site and year = year1;
     return raa;
end //
DELIMITER ;

select total_site_revenue(2022,8);

-- 7. Function to return the number of domestic versus foreign visitors for a site and year.  -- visitor_statistics
DELIMITER //
create FUNCTION total_site_revenue (year1 int, site int)
returns decimal(50,2)
deterministic
begin
     DECLARE raa decimal(50,2);
     select sum(total_revenue) into raa
     from visitor_statistics where site_id = site and year = year1;
     return raa;
end //
DELIMITER ;

-- 8. Write a function to return the name of the site with the most repeat visitors.  -- visitor_statistics, eco_sites
-- 9. Function to return the number of local artisans for a given tribe.  -- local_artisans
DELIMITER //
create FUNCTION NO_LOCAL_ARTISITANS (TRIBE_NAME100 VARCHAR(100))
returns INT
deterministic
begin
     DECLARE raa int;
     select count(*) as total_artists into raa
     from local_artisians  join tribes using(tribe_id)
     where tribe_name = TRIBE_NAME100;
     return raa;
end //
DELIMITER ;

SELECT NO_LOCAL_ARTISITANS('Palians');

-- 10. Function to get the average stay duration at a site per year.  -- visitor_statistics

DELIMITER //
create FUNCTION average_stay (site int)
returns decimal(15,2)
deterministic
begin
     DECLARE raa decimal(15,2);
     select avg(avg_stay_days) into raa
     from visitor_statistics  
     where site_id = site;
     return raa;
end //
DELIMITER ;

select average_stay(5);

-- TABLE : VISITOR STATISTICS 
-- 11. Write a function to return the total_revenue for special events for site .  -- visitor_statistics, 

DELIMITER //
create FUNCTION visitor_s_special_events (site int)
returns decimal(15,2)
deterministic
begin
     DECLARE raa decimal(15,2);
     select sum(special_events_revenue) into raa
     from visitor_statistics  
     where site_id = site;
     return raa;
end //
DELIMITER ;

select visitor_s_special_events(5);

-- 12. Function to return the percentage of online bookings at a site for a year.  -- visitor_statistics

DELIMITER //
create FUNCTION visitor_s_online_bookings (site int, year1 int)
returns decimal(15,2)
deterministic
begin
     DECLARE raa decimal(15,2);
     select online_booking_pct into raa
     from visitor_statistics  
     where site_id = site and year =year1;
     return raa;
end //
DELIMITER ;

select visitor_s_online_bookings(6,2022);

-- 13. Write a function to return the eco-site with the highest total revenue.  -- visitor_statistics, eco_sites

DELIMITER //
create FUNCTION visitor_s_online_bookings (site int, year1 int)
returns decimal(15,2)
deterministic
begin
     DECLARE raa decimal(15,2);
     select online_booking_pct into raa
     from visitor_statistics  
     where site_id = site and year =year1;
     return raa;
end //
DELIMITER ;

select visitor_s_online_bookings(6,2022);

-- 14. Function to return the total visitors in a year.  -- events

DELIMITER //
create FUNCTION visitor_s_total_year ( year1 int)
returns decimal(15,2)
deterministic
begin
     DECLARE raa decimal(15,2);
     select count(*) into raa
     from visitor_statistics  
     where year =year1;
     return raa;
end //
DELIMITER ;
select visitor_s_total_year(2022);


-- 15. Function to return the total domestic visitors for a given site and year.
select * from visitor_statistics ;
DELIMITER //
create function domestic_visitors(site_id1 int , year1 int)
returns int
deterministic
BEGIN 
	declare domestic1 int;
    select domestic_visitors into domestic1
    from visitor_statistics
    where site_id = site_id1 and year = year1 ;
    return domestic1 ;
END //
DELIMITER ;

select domestic_visitors(5,2022);

-- 16. Function to return the total foreign visitors for a given site and year.

select * from visitor_statistics ;
DELIMITER //
create function foreign_visitors(site_id1 int , year1 int)
returns int
deterministic
BEGIN 
	declare foreign1 int;
    select foreign_visitors into foreign1
    from visitor_statistics
    where site_id = site_id1 and year = year1 ;
    return foreign1 ;
END //
DELIMITER ;

select foreign_visitors(5,2022);


-- Table: eco_lodges
-- 21. Function to return the average price per night for a lodge site  -- eco_lodges
DELIMITER //
create function avg_price(site int)
returns decimal(50,2)
deterministic
BEGIN 
	declare foreign1 decimal(50,2);
    select avg(price_per_night) into foreign1
    from eco_lodges
    where site_id = site ;
    return foreign1 ;
END //
DELIMITER ;

select avg_price(8);
-- 22. Function to return the lodge with the highest occupancy rate.  -- eco_lodges
DELIMITER //
create function highest_occupancy_rate_lodge()
returns varchar(100)
deterministic
BEGIN 
	declare foreign1 varchar(100);
    select lodge_name into foreign1
    from eco_lodges
    where price_per_night =(
    select max(price_per_night)
    from eco_lodges
    );
    return foreign1 ;
END //
DELIMITER ;

select highest_occupancy_rate_lodge();
-- 23. Function to return the number of rooms available at a lodge.  -- eco_lodges

DELIMITER //
create function no_rooms_available(lodge int)
returns int
deterministic
BEGIN 
	declare foreign1 int;
    select available into foreign1
    from eco_lodges
    where lodge_id = lodge;
    return foreign1 ;
END //
DELIMITER ;

select no_rooms_available(1);

-- 24. Function to return the average guest rating for each lodge.  -- eco_lodges

DELIMITER //
create function highest_rating(lodge int)
returns decimal(50,2)
deterministic
BEGIN 
	declare foreign1 decimal(50,2);
    select avg(rating) into foreign1
    from eco_lodges
    where lodge_id = lodge;
    return foreign1 ;
END //
DELIMITER ;

select highest_rating(5);

-- 25. Function to return the lodge with the lowest price per night.  -- eco_lodges

DELIMITER //
create function min_price_per_night()
returns varchar(100)
deterministic
BEGIN 
	declare foreign1 varchar(100);
    select lodge_name into foreign1
    from eco_lodges
    where price_per_night =(
    select min(price_per_night)
    from eco_lodges
    );
    return foreign1 ;
END //
DELIMITER ;

select min_price_per_night();
-- 26. Function to return the number of unique bookings at a lodge.  -- eco_lodges

DELIMITER //
create function unique_bookings_lodge(lodge int)
returns int
deterministic
BEGIN 
	declare foreign1 int;
    select count( distinct lodge_id) into foreign1
    from eco_lodges
    where lodge_id = lodge;
    return foreign1 ;
END //
DELIMITER ;

select unique_bookings_lodge(1);
-- 27. Function to return the average length of stay at a lodge.  -- eco_lodges

DELIMITER //
create function min_stay_lodge(lodge int)
returns varchar(100)
deterministic
BEGIN 
	declare foreign1 varchar(100);
    select min_stay_days into foreign1
    from eco_lodges
    where lodge_id = lodge;
    return foreign1 ;
    
END //
DELIMITER ;

select min_stay_lodge(1);
-- 28. Function to return the lodge  type .  -- eco_lodges

DELIMITER //
create function type_lodge(lodge int)
returns varchar(100)
deterministic
BEGIN 
	declare foreign1 varchar(100);
    select lodge_type into foreign1
    from eco_lodges
    where lodge_id = lodge;
    return foreign1 ;
END //
DELIMITER ;

select type_lodge(7);
29. Function to return the number of lodges in a particular region.  -- eco_lodges

DELIMITER //
create function highest_occupancy_rate_lodge()
returns varchar(100)
deterministic
BEGIN 
	declare foreign1 varchar(100);
    select lodge_name into foreign1
    from eco_lodges
    where price_per_night =(
    select max(price_per_night)
    from eco_lodges
    );
    return foreign1 ;
END //
DELIMITER ;

select highest_occupancy_rate_lodge();
30. Function to return the average number of bookings per month for a lodge.  -- eco_lodges

DELIMITER //
create function highest_occupancy_rate_lodge()
returns varchar(100)
deterministic
BEGIN 
	declare foreign1 varchar(100);
    select lodge_name into foreign1
    from eco_lodges
    where price_per_night =(
    select max(price_per_night)
    from eco_lodges
    );
    return foreign1 ;
END //
DELIMITER ;

select highest_occupancy_rate_lodge();
