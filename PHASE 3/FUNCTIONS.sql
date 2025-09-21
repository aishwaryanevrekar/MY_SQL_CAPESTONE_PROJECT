use sql_capestone_project ;
/*
8 tables 
visitor statistics
visit logs
local_artisians 
traditional knowledge
eco_lodges
conservation areas 
cultural_workshops
cultural assets



*/
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


-- 2. Table: eco_lodges
-- 1. Function to return the average price per night for a lodge site  -- eco_lodges
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
-- 2. Function to return the lodge with the highest occupancy rate.  -- eco_lodges
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
-- 3. Function to return the number of rooms available at a lodge.  -- eco_lodges

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

-- 4. Function to return the average guest rating for each lodge.  -- eco_lodges

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

-- 5. Function to return the lodge with the lowest price per night.  -- eco_lodges

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
-- 6. Function to return the number of unique bookings at a lodge.  -- eco_lodges

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
-- 7. Function to return the average length of stay at a lodge.  -- eco_lodges

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
-- 8. Function to return the lodge  type .  -- eco_lodges

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

-- TABLE 3. traditional_knowledge

-- 1. Create a function  that returns the practice name.

DELIMITER //
create function fn_get_practice_name(knowId INT)
returns varchar(100)
deterministic
BEGIN 
	declare NAME varchar(100);
    select practice_name into NAME
    from traditional_knowledge
    where know_id = knowId;
    return NAME ;
END //
DELIMITER ;

select fn_get_practice_name(5);

-- 2. Write a function  that returns the total number of traditional knowledge practices.
DELIMITER //
create function fn_count_practices()
returns INT
deterministic
BEGIN 
	declare NAME INT;
    select count(*) into NAME
    from traditional_knowledge;
    return NAME ;
END //
DELIMITER ;

select fn_count_practices();

-- 3. Create a function fn_check_practice_exists(knowId INT) that returns 1 if practice exists.

DELIMITER //
create function fn_check_practice_exists(knowId INT)
returns INT
deterministic
BEGIN 
	declare x INT default 0;
    declare NAME1 varchar(100);
    select practice_name into NAME1
    from traditional_knowledge
    where know_id = knowId
    limit 1;
    if NAME1 is not null
    then 
    set x = 1;
    end if;
    return x;
END //
DELIMITER ;

select fn_check_practice_exists(1);

-- 4. Write a function fn_longest_practice_name() that returns the longest practice name.

DELIMITER //

CREATE FUNCTION fn_biggest_practice_name()
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE ans VARCHAR(100);

    SELECT practice_name 
    INTO ans
    FROM traditional_knowledge
    ORDER BY CHAR_LENGTH(practice_name) DESC
    LIMIT 1;

    RETURN ans;
END //

DELIMITER ;

select fn_biggest_practice_name();

-- 5. Create a function  that returns the shortest practice name.

DELIMITER //

CREATE FUNCTION fn_SHORT_practice_name()
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE ans VARCHAR(100);

    SELECT practice_name 
    INTO ans
    FROM traditional_knowledge
    ORDER BY CHAR_LENGTH(practice_name) ASC
    LIMIT 1;

    RETURN ans;
END //

DELIMITER ;

select fn_SHORT_practice_name();

-- 6. Write a function  that returns average practice name length.

DELIMITER //

CREATE FUNCTION fn_avg_practice_name_length()
RETURNS decimal(10,2)
DETERMINISTIC
BEGIN
    DECLARE ans decimal(10,2);

    SELECT avg(char_length(practice_name)) 
    INTO ans
    from traditional_knowledge;

    RETURN ans;
END //

DELIMITER ;

select fn_avg_practice_name_length();


-- 7. Create a function  that returns average eco_benefit description length.
DELIMITER //
CREATE FUNCTION fn_avg_benefit_length()
RETURNS decimal(10,2)
DETERMINISTIC
BEGIN
    DECLARE ans decimal(10,2);

    SELECT avg(char_length(eco_benefit)) INTO ans
    from traditional_knowledge;

    RETURN ans;
END //

DELIMITER ;

-- 8. t counts words in eco_benefit.

DELIMITER //

CREATE FUNCTION fn_benefit_word_count(pid INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE ans INT;

    SELECT LENGTH(eco_benefit) - LENGTH(REPLACE(eco_benefit,' ','')) + 1
    INTO ans
    FROM traditional_knowledge
    WHERE know_id = pid;

    RETURN ans;
END //

DELIMITER ;
-- 9.  returns the most frequent eco_benefit keyword.

DELIMITER //

CREATE FUNCTION fn_top_benefit100()
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    DECLARE ans VARCHAR(255);

    SELECT eco_benefit 
    INTO ans
    FROM traditional_knowledge
    GROUP BY eco_benefit
    ORDER BY COUNT(*) DESC
    LIMIT 1;

    RETURN ans;
END //

DELIMITER ;
SELECT fn_top_benefit100();

-- 10. counts practices linked to a tribe.

DELIMITER //

CREATE FUNCTION fn_practice_count_by_tribe100(tid INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE ans INT;

    SELECT COUNT(*) 
    INTO ans
    FROM traditional_knowledge
    WHERE tribe_id = tid;

    RETURN ans;
END //

DELIMITER ;

-- table 4 : visit logs

-- 1. Create a function fn_get_visitor_name(logId INT) that returns the visitor’s name by log ID.

Write a function fn_count_visits() that returns the total number of visit logs.
DELIMITER //

CREATE FUNCTION fn_count_visits(tid INT)
RETURNS varchar(50)
DETERMINISTIC
BEGIN
    DECLARE ans varchar(50);

    SELECT visitor_name 
    INTO ans
    FROM visit_logs
    WHERE log_id = tid;

    RETURN ans;
END //

DELIMITER ;

select fn_count_visits(5);

-- 2. Create a function  that returns the average rating across all logs.
delimiter //
CREATE FUNCTION fn_avg_rating()
RETURNS int
DETERMINISTIC
BEGIN
    DECLARE ans int;

    SELECT avg(rating) 
    INTO ans
    FROM visit_logs;

    RETURN ans;
END //

DELIMITER ;

-- 3. Write a function fn_max_rating() that returns the highest rating.
delimiter //
CREATE FUNCTION max_rating()
RETURNS int
DETERMINISTIC
BEGIN
    DECLARE ans int;

    SELECT max(rating) 
    INTO ans
    FROM visit_logs;

    RETURN ans;
END //

DELIMITER ;

-- 4.  returns the lowest rating.
delimiter //
CREATE FUNCTION min_rating()
RETURNS int
DETERMINISTIC
BEGIN
    DECLARE ans int;

    SELECT min(rating) 
    INTO ans
    FROM visit_logs;

    RETURN ans;
END //

DELIMITER ;

-- 5. Write a function fn_total_activities_done() that counts the number of activities across all logs.

delimiter //
CREATE FUNCTION count_activites()
RETURNS int
DETERMINISTIC
BEGIN
    DECLARE ans int;

    SELECT count(*)
    INTO ans
    FROM visit_logs;

    RETURN ans;
END //

DELIMITER ;

-- 6. Create a function fn_visit_feedback_length(logId INT) that returns the length of a visitor’s feedback.
delimiter //
CREATE FUNCTION fn_feedback_size(lid INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE ans INT;

    SELECT CHAR_LENGTH(feedback)
    INTO ans
    FROM visit_logs
    WHERE log_id = lid;

    RETURN ans;
END //

DELIMITER ;

-- 7. Write a function fn_check_log_exists(logId INT) that returns 1 if a log exists, else 0.
DELIMITER //

CREATE FUNCTION fn_log_exist(lid INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE ans INT DEFAULT 0;

    IF EXISTS (SELECT 1 FROM visit_logs WHERE log_id = lid) THEN
        SET ans = 1;
    END IF;

    RETURN ans;
END //

DELIMITER ;


-- 8. Create a function fn_latest_visit_date() that returns the most recent visit date.

DELIMITER //

CREATE FUNCTION fn_last_visit_date()
RETURNS DATE
DETERMINISTIC
BEGIN
    DECLARE ans DATE;

    SELECT MAX(visit_date)
    INTO ans
    FROM visit_logs;

    RETURN ans;
END //

DELIMITER ;


-- 9. Write a function fn_earliest_visit_date() that returns the oldest visit date.

DELIMITER //

CREATE FUNCTION fn_first_visit_date()
RETURNS DATE
DETERMINISTIC
BEGIN
    DECLARE ans DATE;

    SELECT MIN(visit_date)
    INTO ans
    FROM visit_logs;

    RETURN ans;
END //

DELIMITER ;

-- table 5 : local_artisians

-- 1. Write a function fn_get_artist_name(artistId INT) that returns artisan’s name.
DELIMITER //

CREATE FUNCTION fn_artist_name(aid INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE ans VARCHAR(100);

    SELECT name 
    INTO ans
    FROM local_artisians
    WHERE artist_id = aid;

    RETURN ans;
END //

DELIMITER ;

-- 2. Create a function fn_count_artisans() that returns total artisans.
DELIMITER //

CREATE FUNCTION fn_count_artists()
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE ans INT;

    SELECT COUNT(*) 
    INTO ans
    FROM local_artisians;

    RETURN ans;
END //

DELIMITER ;

-- 3. Write a function fn_check_artisan_exists(artistId INT) that returns 1 if artisan exists.
DELIMITER //

CREATE FUNCTION fn_artist_exist(aid INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE ans INT DEFAULT 0;

    IF EXISTS (SELECT 1 FROM local_artisians WHERE artist_id = aid) THEN
        SET ans = 1;
    END IF;

    RETURN ans;
END //

DELIMITER ;

-- 4. Create a function fn_craft_type(artistId INT) that returns craft type of artisan.
DELIMITER //

CREATE FUNCTION fn_artist_craft(aid INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE ans VARCHAR(100);

    SELECT craft_type 
    INTO ans
    FROM local_artisians
    WHERE artist_id = aid;

    RETURN ans;
END //

DELIMITER ;

-- 5. Write a function fn_artisans_by_tribe(tribeId INT) that counts artisans linked to a tribe.
DELIMITER //

CREATE FUNCTION fn_artists_by_tribe(tid INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE ans INT;

    SELECT COUNT(*) 
    INTO ans
    FROM local_artisians
    WHERE tribe_id = tid;

    RETURN ans;
END //

DELIMITER ;

-- 6. Create a function fn_longest_name_artisan() that returns the artisan with the longest name.
DELIMITER //

CREATE FUNCTION fn_longest_artist_name()
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE ans VARCHAR(100);

    SELECT name 
    INTO ans
    FROM local_artisians
    ORDER BY CHAR_LENGTH(name) DESC
    LIMIT 1;

    RETURN ans;
END //

DELIMITER ;

-- 7. Write a function fn_shortest_name_artisan() that returns the artisan with the shortest name.
DELIMITER //

CREATE FUNCTION fn_shortest_artist_name()
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE ans VARCHAR(100);

    SELECT name 
    INTO ans
    FROM local_artisians
    ORDER BY CHAR_LENGTH(name) ASC
    LIMIT 1;

    RETURN ans;
END //

DELIMITER ;

-- 8. Create a function fn_avg_name_length() that returns average artisan name length.
DELIMITER //

CREATE FUNCTION fn_avg_artist_name_size()
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE ans DECIMAL(10,2);

    SELECT AVG(CHAR_LENGTH(name)) 
    INTO ans
    FROM local_artisians;

    RETURN ans;
END //

DELIMITER ;

-- 9. Write a function fn_avg_craft_length() that returns average craft type length.
DELIMITER //

CREATE FUNCTION fn_avg_craft_size()
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE ans DECIMAL(10,2);

    SELECT AVG(CHAR_LENGTH(craft_type)) 
    INTO ans
    FROM local_artisians;

    RETURN ans;
END //

DELIMITER ;
-- 10. Create a function fn_total_female_artisans() that counts female artisans.
DELIMITER //

CREATE FUNCTION fn_total_female_artists()
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE ans INT;

    SELECT COUNT(*) 
    INTO ans
    FROM local_artisians
    WHERE gender = 'F';

    RETURN ans;
END //

DELIMITER ;

-- TABLE 6 : CONSERVATION_AREAS
-- 1. Write a function fn_get_area_size(areaId INT) that returns the size (km²) of a conservation area.
DELIMITER //

CREATE FUNCTION fn_area_size(aid INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE ans DECIMAL(10,2);

    SELECT area_size_km2
    INTO ans
    FROM conservation_areas
    WHERE area_id = aid;

    RETURN ans;
END //

DELIMITER ;

-- 2. Create a function fn_count_conservation_areas() that returns the total number of areas.
DELIMITER //

CREATE FUNCTION fn_count_areas()
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE ans INT;

    SELECT COUNT(*)
    INTO ans
    FROM conservation_areas;

    RETURN ans;
END //

DELIMITER ;

-- 3. Write a function fn_max_area_size() that returns the largest conservation area size.
DELIMITER //

CREATE FUNCTION fn_biggest_area_size()
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE ans DECIMAL(10,2);

    SELECT MAX(area_size_km2)
    INTO ans
    FROM conservation_areas;

    RETURN ans;
END //

DELIMITER ;

-- 4. Create a function fn_min_area_size() that returns the smallest conservation area size.
DELIMITER //

CREATE FUNCTION fn_smallest_area_size()
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE ans DECIMAL(10,2);

    SELECT MIN(area_size_km2)
    INTO ans
    FROM conservation_areas;

    RETURN ans;
END //

DELIMITER ;

-- 5. Write a function fn_avg_area_size() that returns the average area size.
DELIMITER //

CREATE FUNCTION fn_avg_area_size()
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE ans DECIMAL(10,2);

    SELECT AVG(area_size_km2)
    INTO ans
    FROM conservation_areas;

    RETURN ans;
END //

DELIMITER ;

-- 6. Create a function fn_sum_area_size() that returns the total area size.
DELIMITER //

CREATE FUNCTION fn_total_area_size()
RETURNS DECIMAL(15,2)
DETERMINISTIC
BEGIN
    DECLARE ans DECIMAL(15,2);

    SELECT SUM(area_size_km2)
    INTO ans
    FROM conservation_areas;

    RETURN ans;
END //

DELIMITER ;

-- 7. Write a function fn_check_area_exists(areaId INT) that returns 1 if an area exists, else 0.
DELIMITER //

CREATE FUNCTION fn_area_exist(aid INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE ans INT DEFAULT 0;

    IF EXISTS (SELECT 1 FROM conservation_areas WHERE area_id = aid) THEN
        SET ans = 1;
    END IF;

    RETURN ans;
END //

DELIMITER ;

-- 8. Create a function fn_area_type(areaId INT) that returns the protection level of a conservation area.
DELIMITER //

CREATE FUNCTION fn_area_type(aid INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE ans VARCHAR(100);

    SELECT protection_level
    INTO ans
    FROM conservation_areas
    WHERE area_id = aid;

    RETURN ans;
END //

DELIMITER ;

-- 9. Write a function fn_latest_area_created() that returns the most recently inserted area ID.
DELIMITER //

CREATE FUNCTION fn_latest_area_id()
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE ans INT;

    SELECT MAX(area_id)
    INTO ans
    FROM conservation_areas;

    RETURN ans;
END //

DELIMITER ;

-- 10. Create a function fn_shortest_area_name() that returns the name of the shortest-named conservation area.
DELIMITER //

CREATE FUNCTION fn_shortest_area_name()
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE ans VARCHAR(100);

    SELECT area_name
    INTO ans
    FROM conservation_areas
    ORDER BY CHAR_LENGTH(area_name) ASC
    LIMIT 1;

    RETURN ans;
END //

DELIMITER ;

-- tab;e 7 cultural assets
-- 1.  returns the type of a cultural asset.
DELIMITER //

CREATE FUNCTION fn_asset_type(aid INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE ans VARCHAR(100);

    SELECT asset_type 
    INTO ans
    FROM cultural_assets
    WHERE asset_id = aid;

    RETURN ans;
END //

DELIMITER ;

-- 2.  description of a cultural asset.
DELIMITER //

CREATE FUNCTION fn_asset_desc(aid INT)
RETURNS TEXT
DETERMINISTIC
BEGIN
    DECLARE ans TEXT;

    SELECT description 
    INTO ans
    FROM cultural_assets
    WHERE asset_id = aid;

    RETURN ans;
END //

DELIMITER ;

-- 3. Write a function fn_count_assets() that returns the total number of cultural assets.
DELIMITER //

CREATE FUNCTION fn_count_assets()
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE ans INT;

    SELECT COUNT(*) 
    INTO ans
    FROM cultural_assets;

    RETURN ans;
END //

DELIMITER ;

-- 4. Create a function fn_assets_by_tribe(tribeId INT) that counts assets linked to a tribe.
DELIMITER //

CREATE FUNCTION fn_assets_by_tribe(tid INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE ans INT;

    SELECT COUNT(*) 
    INTO ans
    FROM cultural_assets
    WHERE tribe_id = tid;

    RETURN ans;
END //

DELIMITER ;

-- 5. Write a function fn_longest_asset_desc() that returns the asset with the longest description.
DELIMITER //

CREATE FUNCTION fn_longest_asset_desc()
RETURNS TEXT
DETERMINISTIC
BEGIN
    DECLARE ans TEXT;

    SELECT description 
    INTO ans
    FROM cultural_assets
    ORDER BY CHAR_LENGTH(description) DESC
    LIMIT 1;

    RETURN ans;
END //

DELIMITER ;

-- 6. Create a function fn_shortest_asset_desc() that returns the asset with the shortest description.
DELIMITER //

CREATE FUNCTION fn_shortest_asset_desc()
RETURNS TEXT
DETERMINISTIC
BEGIN
    DECLARE ans TEXT;

    SELECT description 
    INTO ans
    FROM cultural_assets
    ORDER BY CHAR_LENGTH(description) ASC
    LIMIT 1;

    RETURN ans;
END //

DELIMITER ;

-- 7. Write a function fn_check_asset_exists(assetId INT) that returns 1 if the asset exists, else 0.
DELIMITER //

CREATE FUNCTION fn_asset_exist(aid INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE ans INT DEFAULT 0;

    IF EXISTS (SELECT 1 FROM cultural_assets WHERE asset_id = aid) THEN
        SET ans = 1;
    END IF;

    RETURN ans;
END //

DELIMITER ;
-- 8. Create a function fn_asset_type_list() that returns all distinct asset types as a comma-separated list.
DELIMITER //

CREATE FUNCTION fn_asset_type_list()
RETURNS TEXT
DETERMINISTIC
BEGIN
    DECLARE ans TEXT;

    SELECT GROUP_CONCAT(DISTINCT asset_type ORDER BY asset_type ASC SEPARATOR ', ')
    INTO ans
    FROM cultural_assets;

    RETURN ans;
END //

DELIMITER ;

-- 9. Write a function fn_avg_asset_desc_size() that returns the average description length across assets.

DELIMITER //

CREATE FUNCTION fn_avg_asset_desc_size()
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE ans DECIMAL(10,2);

    SELECT AVG(CHAR_LENGTH(description)) 
    INTO ans
    FROM cultural_assets;

    RETURN ans;
END //

DELIMITER ;

-- 10. Create a function fn_asset_word_count(assetId INT) that returns the number of words in a cultural asset description.

DELIMITER //

CREATE FUNCTION fn_asset_word_count(aid INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE ans INT;

    SELECT LENGTH(description) - LENGTH(REPLACE(description,' ','')) + 1
    INTO ans
    FROM cultural_assets
    WHERE asset_id = aid;

    RETURN ans;
END //

DELIMITER ;

-- 8. cultural WORKSHOPS
DELIMITER //

CREATE FUNCTION fn_workshop_name(wid INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE ans VARCHAR(100);

    SELECT workshop_name 
    INTO ans
    FROM cultural_workshops
    WHERE workshop_id = wid;

    RETURN ans;
END //

DELIMITER ;
--  Returns the name of the workshop for a given workshop_id.
-- type of workshop  for a given workshop.
DELIMITER //

CREATE FUNCTION fn_workshop_type(wid INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE ans VARCHAR(100);

    SELECT workshop_type 
    INTO ans
    FROM cultural_workshops
    WHERE workshop_id = wid;

    RETURN ans;
END //

DELIMITER ;

-- 3. COUNT TOTAL WORKSHOPS
DELIMITER //

CREATE FUNCTION fn_count_workshops()
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE ans INT;

    SELECT COUNT(*) 
    INTO ans
    FROM cultural_workshops;

    RETURN ans;
END //

DELIMITER ;

-- 4. COUNT WORKSHOP BY SITE
DELIMITER //

CREATE FUNCTION fn_workshops_by_site(sid INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE ans INT;

    SELECT COUNT(*) 
    INTO ans
    FROM cultural_workshops
    WHERE site_id = sid;

    RETURN ans;
END //

DELIMITER ;

-- 5. LONGEST WORKSHOP NAME
DELIMITER //

CREATE FUNCTION fn_longest_workshop_name()
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE ans VARCHAR(100);

    SELECT workshop_name
    INTO ans
    FROM cultural_workshops
    ORDER BY CHAR_LENGTH(workshop_name) DESC
    LIMIT 1;

    RETURN ans;
END //

DELIMITER ;

-- 6. SHORTEST WORKSHOP NAME
DELIMITER //

CREATE FUNCTION fn_SHORTEST_workshop_name()
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE ans VARCHAR(100);

    SELECT workshop_name
    INTO ans
    FROM cultural_workshops
    ORDER BY CHAR_LENGTH(workshop_name) asc
    LIMIT 1;

    RETURN ans;
END //

DELIMITER ;

-- avg name length
DELIMITER //

CREATE FUNCTION fn_avg_workshop_name_size()
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE ans DECIMAL(10,2);

    SELECT AVG(CHAR_LENGTH(workshop_name)) 
    INTO ans
    FROM cultural_workshops;

    RETURN ans;
END //

DELIMITER ;

-- 8. workshop size avg
DELIMITER //

CREATE FUNCTION fn_avg_workshop_desc_size()
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE ans DECIMAL(10,2);

    SELECT AVG(CHAR_LENGTH(description)) 
    INTO ans
    FROM cultural_workshops;

    RETURN ans;
END //

DELIMITER ;

-- 9. if workshop exists 
DELIMITER //

CREATE FUNCTION fn_workshop_exist(wid INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE ans INT DEFAULT 0;

    IF EXISTS (SELECT 1 FROM cultural_workshops WHERE workshop_id = wid) THEN
        SET ans = 1;
    END IF;

    RETURN ans;
END //

DELIMITER ;

-- 10. count workshop by target audience
DELIMITER //

CREATE FUNCTION fn_workshops_by_target(target VARCHAR(100))
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE ans INT;

    SELECT COUNT(*) 
    INTO ans
    FROM cultural_workshops
    WHERE target_audience = target;

    RETURN ans;
END //

DELIMITER ;

