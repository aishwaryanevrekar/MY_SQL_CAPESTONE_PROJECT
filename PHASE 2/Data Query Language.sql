use sql_capestone_project;

-- 1. Ecosites
select * from eco_sites;

select site_name,state_region,key_activites,Type from eco_sites where Type ='Tribal'; -- Tribal
select site_name,state_region,key_activites,Type from eco_sites where Type ='Non-Tribal'; -- Non -Tribal
select site_name,state_region,key_activites,Type from eco_sites where Region ='North '; -- Region = North
select site_name,state_region,key_activites,Type from eco_sites where Region ='South'; -- Region = South
select site_name,state_region,key_activites,Type from eco_sites where key_activites like '%safari%'; -- safari activites
select site_name,state_region,key_activites,Type from eco_sites where key_activites like '%luxury%'; -- luxury activites
select site_name,state_region,key_activites,Type from eco_sites where key_activites like '%jungle%'; -- jungle activites
select site_name,state_region,key_activites,Type from eco_sites where key_activites like '%medicine%'; -- medicine activites
select site_name,state_region,key_activites,Type from eco_sites where key_activites like '%coral%'; -- coral activites
select site_name,state_region,key_activites,Type from eco_sites where key_activites like '%Bird%'; -- bird activites

select Type,count(*) as Total from eco_sites group by Type ;  -- group by type
select state_region,count(*) as Total from eco_sites group by state_region; -- group by state
select Region,count(*) as Total from eco_sites group by Region; -- group by region
select count(*) as total_rows from eco_sites;
select distinct state_region from eco_sites;

-- TABLE 2: visit_logs

select * from visit_logs;

select max(visit_date) from visit_logs; -- Max date
select min(visit_date) from visit_logs; -- Min date
select * from visit_logs where rating = 5; -- 5 star rating
select * from visit_logs where rating = 5 and no_activites <2; -- 5 star rating and activites less than 2
select * from visit_logs where site_id between 5 and 10; -- site id ranging between 5 and 10
select * from visit_logs where visitor_name like '%Singh'; -- visitor name ending with Singh
select * from visit_logs where visitor_name like '%Singh' order by rating; -- visitor name ending with Singh order by rating
select * from visit_logs order by length_feedback asc, rating desc; -- Length of feedback order asc and rating desc
select * from visit_logs where year_visit < 2025; -- years less than 2025
select * from visit_logs where year_visit > 2025; -- years more than 2025
select * from visit_logs where feedback like '%peaceful%'; -- feedback - peaceful
select * from visit_logs where activities_done like '%yoga%'; -- yoga activites
select count(*) as total_visitors from visit_logs; -- total visitors
select * from visit_logs where log_id between 40 and 50;
select max(no_activites) from visit_logs;
select min(activities_done) from visit_logs;

-- 3. Conservation_Areas
select * from Conservation_Areas;
select * from Conservation_Areas where area_size_km2 < 500; -- area less than 500
select * from Conservation_Areas where area_size_km2 > 500; -- more than 500
select * from Conservation_Areas where p_level_meaning like '%No Human%'; -- No Human Entry
select * from Conservation_Areas where protection_level = 'Core Zone';

select count(*) as total_rows from conservation_areas; -- total
 
select p_level_meaning,count(*) as total   -- group by p_level with area > 500
from conservation_areas 
where area_size_km2 > 500
group by p_level_meaning;

select p_level_meaning,count(*) as total    -- group by p_level with area under 500
from conservation_areas 
where area_size_km2 < 500
group by p_level_meaning;


select type_area,count(*) as total   -- group by type_area with area > 500
from conservation_areas 
where area_size_km2 > 500
group by type_area;

select type_area,count(*) as total    -- group by type_area with area under 500
from conservation_areas 
where area_size_km2 < 500
group by type_area;

select * from Conservation_Areas where area_size_km2 between 100 and 300 ; -- range between 100 and 500
select * from Conservation_Areas where site_id > 10; -- greater than 10
select * from Conservation_Areas where site_id < 10; -- < than 10
select * from Conservation_Areas where area_name like '%forest%'; -- like pattern
select * from Conservation_Areas where area_name like '%Lake%'; -- like pattern
select * from Conservation_Areas where area_name like '%Zone'; -- like pattern ending
select * from Conservation_Areas where area_name like '%Reef%'; -- like pattern reef


-- 4. Tribal

select * from tribes;

select * from tribes where no_roles >3; -- no of roles > 3
select * from tribes where Population ='Low'; -- population = low
select * from tribes where tribe_name like '%r'; -- ending with r

select Population,count(*) as total from tribes group by Population;
select no_roles, count(*) as total from tribes group by no_roles;

select max(population_estimate) from tribes; -- max population

select min(population_estimate) from tribes; -- min population

select * from tribes where roles like '%herbal%'; -- roles herbal
select * from tribes where roles like '%healers%'; -- roles healers
select * from tribes where roles like '%weav%'; -- roles weav
select * from tribes where roles like '%trek%'; -- roles trek

select count(*) as total from tribes;

-- 5: CULTURAL ASSETS
select * from cultural_assets;

select * from cultural_assets where asset_type = 'Dance'; -- all dances
select * from cultural_assets where asset_type = 'Craft'; -- crafts
select * from cultural_assets where asset_type = 'Medicine'; -- medicine practices
select * from cultural_assets where asset_type = 'Festival'; -- festivals
select * from cultural_assets where description like '%heritage%'; -- heritage mention
select * from cultural_assets where description like '%weav%'; -- weaving related
select * from cultural_assets where description like '%paint%'; -- painting related
select * from cultural_assets where description like '%drum%'; -- music/drums

select asset_type, count(*) as total from cultural_assets group by asset_type; -- group by type
select tribe_id, count(*) as total from cultural_assets group by tribe_id; -- group by tribe
select asset_type, tribe_id, count(*) as total from cultural_assets group by asset_type, tribe_id; -- group by type + tribe

select count(*) as total_rows from cultural_assets; -- total rows
select distinct asset_type from cultural_assets; -- distinct asset types


-- TABLE 6 : TRADITIONAL KNOWLEDGE
select * from traditional_knowledge;

select * from traditional_knowledge where practice_name like '%honey%'; -- honey practices
select * from traditional_knowledge where practice_name like '%farming%'; -- farming practices
select * from traditional_knowledge where practice_name like '%cultivation%'; -- cultivation practices
select * from traditional_knowledge where practice_name like '%forest%'; -- forest related
select * from traditional_knowledge where practice_name like '%herb%'; -- medicinal herbs

select tribe_id, count(*) as total from traditional_knowledge group by tribe_id; -- count per tribe
select practice_name, length(eco_benefit) as desc_length from traditional_knowledge order by desc_length desc; -- longest benefit description

select substring(practice_name,1,1) as starting_letter, count(*) as total
from traditional_knowledge
group by starting_letter; -- group by first letter

select length(eco_benefit) div 50 as length_bucket, count(*) as total
from traditional_knowledge
group by length_bucket; -- group by benefit length category

select count(*) as total_rows from traditional_knowledge; -- total rows


-- TABLE 7: LOCAL ARTISIANS
select * from local_artisians;

select * from local_artisians where craft_type like '%wood%'; -- wood work
select * from local_artisians where craft_type like '%weav%'; -- weaving
select * from local_artisians where craft_type like '%paint%'; -- paintings
select * from local_artisians where craft_type like '%jewel%'; -- jewelry
select * from local_artisians where name like '%a'; -- names ending with 'a'
select * from local_artisians where tribe_id between 1 and 5; -- tribe range 1-5

select craft_type, count(*) as total from local_artisians group by craft_type; -- group by craft
select tribe_id, count(*) as total from local_artisians group by tribe_id; -- group by tribe
select tribe_id, craft_type, count(*) as total from local_artisians group by tribe_id, craft_type; -- group by tribe + craft

select substring(name,1,1) as starting_letter, count(*) as total
from local_artisians
group by starting_letter; -- group by first letter of name

select length(name) div 5 as name_length_group, count(*) as total
from local_artisians
group by name_length_group; -- group by name length category

select max(length(name)) as longest_name from local_artisians; -- longest name length
select min(length(name)) as shortest_name from local_artisians; -- shortest name length
select count(*) as total_rows from local_artisians; -- total rows
select distinct craft_type from local_artisians; -- distinct crafts

-- 8.  CULTURAL_WORKSHOPS
select * from cultural_workshops;

select * from cultural_workshops where workshop_name like '%Dance%'; -- dance workshops
select * from cultural_workshops where workshop_name like '%Weaving%'; -- weaving workshops
select * from cultural_workshops where workshop_name like '%Painting%'; -- painting workshops
select * from cultural_workshops where workshop_name like '%Craft%'; -- craft workshops
select * from cultural_workshops where workshop_name like '%Pottery%'; -- pottery workshops
select * from cultural_workshops where workshop_name like '%Medicine%'; -- medicine workshops
select * from cultural_workshops where target_audience like '%Tourists%'; -- tourists audience
select * from cultural_workshops where target_audience like '%Students%'; -- students audience

select workshop_type,count(*) as total from cultural_workshops group by workshop_type; -- group by workshop type
select target_audience,count(*) as total from cultural_workshops group by target_audience; -- group by audience
select site_id,count(*) as total from cultural_workshops group by site_id; -- group by site
select workshop_name,count(*) as total from cultural_workshops group by workshop_name; -- duplicate names

select count(*) as total_rows from cultural_workshops; -- total rows
select distinct workshop_name from cultural_workshops; -- unique workshop names
select distinct workshop_type from cultural_workshops; -- unique workshop types
select substring(workshop_name,1,1) as starting_letter,count(*) as total
from cultural_workshops
group by starting_letter; -- group by first letter

select target_audience, count(*) as total from cultural_workshops group by target_audience; -- group by target audience

-- 9. ECO_GUIDES
select * from eco_guides;

select * from eco_guides where guide_program like '%Bird%'; -- bird guides
select * from eco_guides where guide_program like '%Treks%'; -- trekking guides
select * from eco_guides where guide_program like '%Heritage%'; -- heritage guides
select * from eco_guides where target_audience like '%Tourists%'; -- tourists audience
select * from eco_guides where target_audience like '%Students%'; -- students audience
select * from eco_guides where language_supported like '%English%'; -- English speaking guides
select * from eco_guides where max_group_size > 15; -- guides with large groups
select * from eco_guides where rating >= 4.5; -- high rating guides

select target_audience,count(*) as total from eco_guides group by target_audience; -- group by audience
select language_supported,count(*) as total from eco_guides group by language_supported; -- group by language
select rating,count(*) as total from eco_guides group by rating; -- group by rating
select max_group_size,count(*) as total from eco_guides group by max_group_size; -- group by max group size
select duration_hours,count(*) as total from eco_guides group by duration_hours; -- group by duration hours
select site_id,count(*) as total from eco_guides group by site_id; -- group by site
select guide_program,count(*) as total from eco_guides group by guide_program; -- duplicate programs

select max(rating) as highest_rating from eco_guides; -- maximum rating
select min(rating) as lowest_rating from eco_guides; -- minimum rating
select max(duration_hours) as longest_duration from eco_guides; -- maximum duration
select min(duration_hours) as shortest_duration from eco_guides; -- minimum duration

select count(*) as total_rows from eco_guides; -- total guides
select distinct guide_program from eco_guides; -- unique programs
select distinct language_supported from eco_guides; -- unique languages

-- 10. Youth awareness program
select * from youth_awareness_programs; -- all rows
select program_name, target_group from youth_awareness_programs; -- only name + target
select * from youth_awareness_programs where target_group like '%School%'; -- audience contains 'School'
select * from youth_awareness_programs where program_name like '%Drive%'; -- program name contains 'Drive'
select * from youth_awareness_programs where season = 'Summer'; -- only summer programs
select * from youth_awareness_programs where feedback_rating >= 4.0; -- rating 4 or more
select * from youth_awareness_programs where volunteer_involvement = 1; -- programs with volunteers
select * from youth_awareness_programs where age_group = '6-18'; -- specific age group

select program_type, count(*) as total 
from youth_awareness_programs group by program_type; -- group by type

select season, count(*) as total from youth_awareness_programs 
group by season; -- group by season

select target_group, count(*) as total 
from youth_awareness_programs group by target_group; -- group by audience

select age_group, count(*) as total 
from youth_awareness_programs 
group by age_group; -- group by age category

select program_type, avg(feedback_rating) as avg_rating 
from youth_awareness_programs 
group by program_type; -- avg rating by type

select volunteer_involvement, count(*) as total from youth_awareness_programs group by volunteer_involvement; -- group by volunteer presence

select program_type, season, count(*) as total from youth_awareness_programs group by program_type, season; -- group by type + season

select program_type, volunteer_involvement, count(*) as total 
from youth_awareness_programs 
group by program_type, volunteer_involvement; -- type + volunteers
select target_group, max(feedback_rating) as max_rating, min(feedback_rating) as min_rating 
from youth_awareness_programs group by target_group; -- max/min rating per audience

select age_group, season, count(*) as total from youth_awareness_programs group by age_group, season; -- age + season
select floor(feedback_rating) as rating_bucket, count(*) as total from youth_awareness_programs group by rating_bucket; -- group by rating range

select program_type, age_group, count(*) as total from youth_awareness_programs group by program_type, age_group; -- type + age
select volunteer_involvement, season, count(*) as total from youth_awareness_programs group by volunteer_involvement, season; -- volunteers + season
select target_group, season, count(*) as total from youth_awareness_programs group by target_group, season; -- audience + season

select program_type, count(*) as total 
from youth_awareness_programs 
where feedback_rating is not null 
group by program_type; -- only rated programs

-- 11. public_education_events

select * from public_education_events;

select * from public_education_events where audience like '%Tourists%'; -- tourists events
select * from public_education_events where audience like '%General Public%'; -- general public events
select * from public_education_events where audience like '%Youth%'; -- youth events

select * from public_education_events where season = 'Summer'; -- summer events
select * from public_education_events where season = 'Winter'; -- winter events
select * from public_education_events where season = 'Monsoon'; -- monsoon events
select * from public_education_events where season = 'All Seasons'; -- all season events

select * from public_education_events where age_group = '6-18'; -- age 6-18
select * from public_education_events where age_group = '18+'; -- age 18+
select * from public_education_events where age_group = 'All Ages'; -- all ages

select * from public_education_events where event_type = 'Awareness'; -- awareness events
select * from public_education_events where event_type = 'Workshop'; -- workshops
select * from public_education_events where event_type = 'Festival'; -- festivals

select * from public_education_events where max_participants > 100; -- big events
select * from public_education_events where max_participants <= 50; -- small events

select * from public_education_events where feedback_rating >= 4.5; -- highly rated
select * from public_education_events where feedback_rating < 4.5; -- others

select season, count(*) as total from public_education_events group by season; -- group by season
select age_group, count(*) as total from public_education_events group by age_group; -- group by age
select event_type, count(*) as total from public_education_events group by event_type; -- group by type
select audience, count(*) as total from public_education_events group by audience; -- group by audience
select max_participants, count(*) as total from public_education_events group by max_participants; -- group by max participants
select feedback_rating, count(*) as total from public_education_events group by feedback_rating; -- group by rating

select * from public_education_events where event_name like '%Bird%'; -- events with Bird
select * from public_education_events where description like '%conservation%'; -- description contains conservation
select * from public_education_events where event_name like '%Festival%'; -- festival in name
select * from public_education_events where description like '%clean%'; -- clean in description

select count(*) as total_events from public_education_events; -- total events
select distinct audience from public_education_events; -- unique audiences
select distinct season from public_education_events; -- unique seasons
select distinct event_type from public_education_events; -- unique event types


-- 12. eco_lodges

select * from eco_lodges;

USE sql_capestone_project;

SELECT * FROM eco_lodges; -- all lodges

SELECT lodge_name, capacity, price_per_night, lodge_type FROM eco_lodges WHERE lodge_type='Eco-hut'; -- eco-hut lodges
SELECT lodge_name, capacity, price_per_night, lodge_type FROM eco_lodges WHERE lodge_type='Glamping'; -- glamping lodges
SELECT lodge_name, capacity, price_per_night, lodge_type FROM eco_lodges WHERE lodge_type='Resort'; -- resorts

SELECT lodge_name, capacity, price_per_night FROM eco_lodges WHERE lodge_name LIKE '%Jungle%'; -- name contains Jungle
SELECT lodge_name, capacity, price_per_night FROM eco_lodges WHERE lodge_name LIKE '%Bird%'; -- name contains Bird
SELECT lodge_name, capacity, price_per_night FROM eco_lodges WHERE lodge_name LIKE '%Eco%'; -- name contains Eco
SELECT lodge_name, capacity, price_per_night FROM eco_lodges WHERE lodge_name LIKE '%Marine%'; -- name contains Marine

SELECT lodge_type, COUNT(*) as total FROM eco_lodges GROUP BY lodge_type; -- group by lodge type
SELECT site_id, COUNT(*) as total FROM eco_lodges GROUP BY site_id; -- group by site
SELECT available, COUNT(*) as total FROM eco_lodges GROUP BY available; -- group by availability

SELECT MAX(capacity) as max_capacity FROM eco_lodges; -- maximum capacity
SELECT MIN(capacity) as min_capacity FROM eco_lodges; -- minimum capacity
SELECT AVG(price_per_night) as avg_price FROM eco_lodges; -- average price per night

SELECT lodge_name, rating FROM eco_lodges WHERE rating >= 4.5; -- lodges with high rating
SELECT lodge_name, amenities FROM eco_lodges WHERE amenities LIKE '%Yoga%'; -- lodges offering Yoga
SELECT lodge_name, facilities FROM eco_lodges WHERE facilities LIKE '%Solar%'; -- facilities with Solar
SELECT lodge_name, facilities FROM eco_lodges WHERE facilities LIKE '%Birdwatching%'; -- birdwatching facilities

SELECT site_id, lodge_type, COUNT(*) as total FROM eco_lodges GROUP BY site_id, lodge_type; -- group by site + type
SELECT lodge_type, available, COUNT(*) as total FROM eco_lodges GROUP BY lodge_type, available; -- type + availability

SELECT SUBSTRING(lodge_name,1,1) as first_letter, COUNT(*) as total FROM eco_lodges GROUP BY first_letter; -- group by first letter
SELECT LENGTH(lodge_name) DIV 5 as name_length_group, COUNT(*) as total FROM eco_lodges GROUP BY name_length_group; -- group by name length category

SELECT COUNT(*) as total_rows FROM eco_lodges; -- total rows
SELECT DISTINCT lodge_type FROM eco_lodges; -- distinct lodge types

-- 13. package_types

select * from package_types;

select package_name, duration_days, price from package_types; -- basic info
select package_name, package_category from package_types; -- name + category
select package_name, max_guests from package_types; -- name + max guests
select package_name, recommended_season from package_types; -- name + season
select package_name, difficulty_level from package_types; -- name + difficulty
select package_name, eco_friendly from package_types; -- name + eco-friendly
select package_name, inclusions from package_types; -- name + inclusions

select * from package_types where package_category = 'Adventure';
select * from package_types where package_category = 'Heritage';
select * from package_types where package_category = 'Wellness';
select * from package_types where recommended_season = 'Summer';
select * from package_types where recommended_season = 'Winter';
select * from package_types where recommended_season = 'All Seasons';
select * from package_types where eco_friendly = 1;
select * from package_types where package_name like '%Safari%';
select * from package_types where package_name like '%Birdwatching%';
select * from package_types where package_name like '%Heritage%';
select * from package_types where package_name like '%Wellness%';

select package_category, count(*) as total from package_types group by package_category;
select recommended_season, count(*) as total from package_types group by recommended_season;
select difficulty_level, count(*) as total from package_types group by difficulty_level;
select eco_friendly, count(*) as total from package_types group by eco_friendly;

select count(*) as total_rows from package_types; -- total packages
select distinct package_category from package_types;
select distinct recommended_season from package_types;


-- 14. Booking History

select * from booking_history;

select visitor_name, checkin_date, checkout_date from booking_history; -- basic info
select visitor_name, num_guests, total_amount from booking_history; -- guests + total
select visitor_name, booking_status from booking_history; -- booking status
select visitor_name, payment_status from booking_history; -- payment status
select visitor_name, booking_source from booking_history; -- source
select visitor_name, special_requests from booking_history; -- requests
select visitor_name, feedback_received from booking_history; -- feedback received

select * from booking_history where booking_status = 'Confirmed';
select * from booking_history where booking_status = 'Pending';
select * from booking_history where booking_status = 'Cancelled';
select * from booking_history where payment_status = 'Paid';
select * from booking_history where payment_status = 'Partial';
select * from booking_history where payment_status = 'Pending';
select * from booking_history where booking_source = 'Online';
select * from booking_history where booking_source = 'Direct';
select * from booking_history where booking_source = 'Travel Agent';
select * from booking_history where num_guests > 2;
select * from booking_history where total_amount > 20000;
select * from booking_history where checkin_date between '2025-01-10' and '2025-01-20';
select * from booking_history where visitor_name like '%Shah%';
select * from booking_history where visitor_name like '%Verma%';

select booking_status, count(*) as total from booking_history group by booking_status;
select payment_status, count(*) as total from booking_history group by payment_status;
select booking_source, count(*) as total from booking_history group by booking_source;
select num_guests, count(*) as total from booking_history group by num_guests;

select count(*) as total_rows from booking_history; -- total bookings
select distinct booking_status from booking_history;
select distinct payment_status from booking_history;
select distinct booking_source from booking_history;


-- 15. Tourist Feedback
select * from tourist_feedback;

SELECT feedback_text FROM tourist_feedback; -- all feedback texts
SELECT rating FROM tourist_feedback; -- only ratings
SELECT feedback_text, rating FROM tourist_feedback; -- feedback + rating
SELECT feedback_text, sentiment FROM tourist_feedback; -- feedback + sentiment
SELECT feedback_text, recommended FROM tourist_feedback; -- feedback + recommended flag
SELECT feedback_text FROM tourist_feedback WHERE recommended = 1; -- only recommended
SELECT feedback_text FROM tourist_feedback WHERE recommended = 0; -- not recommended
SELECT feedback_text FROM tourist_feedback WHERE sentiment = 'Positive'; -- only positive feedback
SELECT feedback_text FROM tourist_feedback WHERE sentiment = 'Negative'; -- only negative feedback
SELECT feedback_text FROM tourist_feedback WHERE sentiment = 'Neutral'; -- neutral feedback
SELECT feedback_text FROM tourist_feedback WHERE rating >= 4; -- rating 4 or 5
SELECT feedback_text FROM tourist_feedback WHERE rating <= 3; -- rating 3 or less
SELECT feedback_text FROM tourist_feedback WHERE tags LIKE '%Safari%'; -- feedback mentioning Safari
SELECT feedback_text FROM tourist_feedback WHERE tags LIKE '%Food%'; -- feedback mentioning Food
SELECT feedback_text FROM tourist_feedback WHERE tags LIKE '%Birdwatching%'; -- feedback mentioning Birdwatching
SELECT feedback_text, rating FROM tourist_feedback ORDER BY rating DESC; -- highest rating first
SELECT feedback_text, feedback_date FROM tourist_feedback ORDER BY feedback_date ASC; -- oldest first
SELECT feedback_text, LENGTH(feedback_text) as text_length FROM tourist_feedback ORDER BY text_length DESC; -- longest feedback first

SELECT rating, COUNT(*) as total FROM tourist_feedback GROUP BY rating; -- group by rating
SELECT sentiment, COUNT(*) as total FROM tourist_feedback GROUP BY sentiment; -- group by sentiment
SELECT response_status, COUNT(*) as total FROM tourist_feedback GROUP BY response_status; -- group by response status
SELECT recommended, COUNT(*) as total FROM tourist_feedback GROUP BY recommended; -- group by recommended yes/no

SELECT tags FROM tourist_feedback WHERE tags LIKE '%Safari%'; -- feedback mentioning Safari
SELECT tags FROM tourist_feedback WHERE tags LIKE '%Food%'; -- feedback mentioning Food
SELECT tags FROM tourist_feedback WHERE tags LIKE '%Birdwatching%'; -- feedback mentioning Birdwatching

SELECT feedback_date, COUNT(*) as total FROM tourist_feedback GROUP BY feedback_date; -- feedback count by date
SELECT feedback_date, sentiment, COUNT(*) as total FROM tourist_feedback GROUP BY feedback_date, sentiment; -- feedback by date + sentiment

SELECT * FROM tourist_feedback ORDER BY rating DESC; -- highest rating first
SELECT * FROM tourist_feedback ORDER BY feedback_date ASC; -- oldest feedback first
SELECT * FROM tourist_feedback ORDER BY LENGTH(feedback_text) DESC; -- longest feedback first

-- 16. waste_category

select * from waste_category;

SELECT * FROM waste_category; -- all categories

SELECT * FROM waste_category WHERE category_name = 'Plastic'; -- filter plastic
SELECT * FROM waste_category WHERE category_name = 'Organic'; -- filter organic
SELECT * FROM waste_category WHERE category_name = 'E-waste'; -- filter e-waste
SELECT * FROM waste_category WHERE category_name LIKE '%Paper%'; -- paper/cardboard
SELECT * FROM waste_category WHERE category_name LIKE '%Glass%'; -- glass

SELECT * FROM waste_category WHERE risk_level = 'High'; -- high risk
SELECT * FROM waste_category WHERE risk_level = 'Medium'; -- medium risk
SELECT * FROM waste_category WHERE risk_level = 'Low'; -- low risk

SELECT * FROM waste_category WHERE eco_certified = 1; -- eco certified
SELECT * FROM waste_category WHERE eco_certified = 0; -- not eco certified

SELECT * FROM waste_category WHERE color_code = 'Red'; -- red code
SELECT * FROM waste_category WHERE color_code = 'Green'; -- green code
SELECT * FROM waste_category WHERE color_code = 'Yellow'; -- yellow code

SELECT risk_level, COUNT(*) AS total FROM waste_category GROUP BY risk_level; -- group by risk
SELECT eco_certified, COUNT(*) AS total FROM waste_category GROUP BY eco_certified; -- group by eco certified

SELECT COUNT(*) AS total_rows FROM waste_category; -- total rows
SELECT DISTINCT risk_level FROM waste_category; -- unique risk levels
SELECT DISTINCT color_code FROM waste_category; -- unique colors

-- 17. Waste Items

SELECT * FROM waste_items; -- all waste items

SELECT * FROM waste_items WHERE cat_id = 1; -- plastic items
SELECT * FROM waste_items WHERE cat_id = 2; -- organic items
SELECT * FROM waste_items WHERE cat_id = 3; -- e-waste items
SELECT * FROM waste_items WHERE cat_id IN (4,5); -- paper or glass items

SELECT * FROM waste_items WHERE quantity_kg > 10; -- quantity greater than 10 kg
SELECT * FROM waste_items WHERE quantity_kg < 5; -- quantity less than 5 kg
SELECT * FROM waste_items WHERE quantity_kg BETWEEN 5 AND 10; -- quantity between 5 and 10 kg

SELECT * FROM waste_items WHERE date_logged = '2025-01-10'; -- items logged on specific date
SELECT * FROM waste_items WHERE date_logged > '2025-01-15'; -- items logged after specific date
SELECT * FROM waste_items WHERE date_logged < '2025-01-20'; -- items logged before specific date

SELECT site_id, COUNT(*) AS total_items FROM waste_items GROUP BY site_id; -- items per site
SELECT tribe_id, COUNT(*) AS total_items FROM waste_items GROUP BY tribe_id; -- items per tribe
SELECT cat_id, COUNT(*) AS total_items FROM waste_items GROUP BY cat_id; -- items per category

SELECT SUM(quantity_kg) AS total_quantity FROM waste_items; -- total quantity of waste
SELECT SUM(quantity_kg) AS total_quantity FROM waste_items WHERE cat_id = 2; -- total organic waste

SELECT * FROM waste_items WHERE item_name LIKE '%Plastic%'; -- items with plastic in name
SELECT * FROM waste_items WHERE item_name LIKE '%food%'; -- items with food in name

SELECT site_id, cat_id, SUM(quantity_kg) AS total_kg 
FROM waste_items 
GROUP BY site_id, cat_id; -- total per site and category

SELECT COUNT(*) AS total_rows FROM waste_items; -- total rows
SELECT DISTINCT site_id FROM waste_items; -- unique sites
SELECT DISTINCT tribe_id FROM waste_items; -- unique tribes

-- 18. Disposal_methods

SELECT * FROM disposal_methods; -- all disposal methods

SELECT * FROM disposal_methods WHERE method_id = 1; -- composting
SELECT * FROM disposal_methods WHERE method_id = 2; -- recycling
SELECT * FROM disposal_methods WHERE method_id = 3; -- incineration
SELECT * FROM disposal_methods WHERE method_id IN (4,5); -- landfill or e-waste processing

SELECT * FROM disposal_methods WHERE eco_certified = 1; -- eco-certified methods
SELECT * FROM disposal_methods WHERE eco_certified = 0; -- not eco-certified

SELECT * FROM disposal_methods WHERE cost_per_ton > 10; -- methods costing more than 10 per ton
SELECT * FROM disposal_methods WHERE duration_hours <= 24; -- methods taking 24 hours or less

SELECT method_name, cost_per_ton, duration_hours FROM disposal_methods ORDER BY cost_per_ton DESC; -- order by cost
SELECT method_name, cost_per_ton, duration_hours FROM disposal_methods ORDER BY duration_hours ASC; -- order by duration

SELECT COUNT(*) AS total_methods FROM disposal_methods; -- total disposal methods
SELECT SUM(cost_per_ton) AS total_cost_per_ton FROM disposal_methods; -- sum of cost per ton

SELECT method_name, eco_certified, COUNT(*) AS total_methods 
FROM disposal_methods 
GROUP BY eco_certified, method_name; -- grouped by eco-certified and method name

SELECT DISTINCT method_name FROM disposal_methods; -- unique disposal methods

SELECT * FROM disposal_methods WHERE description LIKE '%organic%'; -- methods dealing with organic waste
SELECT * FROM disposal_methods WHERE description LIKE '%plastic%'; -- methods for plastic/metal/paper
SELECT * FROM disposal_methods WHERE description LIKE '%hazardous%'; -- hazardous waste methods

-- 19. Waste Sources

SELECT * FROM waste_sources; -- all waste sources

SELECT * FROM waste_sources WHERE s_id = 1; -- Lodge Kitchen
SELECT * FROM waste_sources WHERE s_id = 2; -- Visitor Area
SELECT * FROM waste_sources WHERE s_id IN (3,4); -- Eco-Trail and Tribal Handicraft Center

SELECT * FROM waste_sources WHERE frequency = 'Daily'; -- daily waste sources
SELECT * FROM waste_sources WHERE frequency = 'Weekly'; -- weekly waste sources

SELECT * FROM waste_sources WHERE manager_name LIKE '%Ramesh%'; -- manager Ramesh
SELECT * FROM waste_sources WHERE manager_name LIKE '%Anita%'; -- manager Anita
SELECT * FROM waste_sources WHERE manager_name = 'Unknown'; -- sources without assigned manager

SELECT site_id, COUNT(*) AS total_sources 
FROM waste_sources 
GROUP BY site_id; -- count sources per site

SELECT tribe_id, COUNT(*) AS total_sources 
FROM waste_sources 
GROUP BY tribe_id; -- count sources per tribe

SELECT manager_name, COUNT(*) AS total_sources 
FROM waste_sources 
GROUP BY manager_name; -- count sources per manager

SELECT * FROM waste_sources WHERE source_name LIKE '%Kitchen%'; -- all kitchen sources
SELECT * FROM waste_sources WHERE source_name LIKE '%Visitor%'; -- visitor area sources
SELECT * FROM waste_sources WHERE description LIKE '%Plastic%'; -- sources generating plastic waste
SELECT * FROM waste_sources WHERE description LIKE '%Organic%'; -- sources generating organic waste




-- 20. 


















