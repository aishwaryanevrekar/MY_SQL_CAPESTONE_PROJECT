# Data Manipulation Part
# adding, updating and deleting data

-- DDL PART CREATE IS DONE IN PART 1-6



use SQL_capestone_project;
show tables;

select * from tribes;
-- 1. Table 1: Tribe
alter table tribes add column Population int default 1000;
alter table tribes modify Population varchar(100) default 'Not Defined';
-- Updating Tribe using case 
update  tribes
set population =
	case 
    when population_estimate >20000 then "High"
    when population_estimate between 10000 and 20000 then "Medium"
    when population_estimate between 1000 and 10000 then "Low"
    else "Extremely Low"
    end;

-- 
set SQL_Safe_updates = 0;

-- For no of roles

alter table tribes add column no_roles int default 0;
update tribes
set no_roles = length(roles) - length(replace(roles,',',"")) + 1;

alter table tribes modify roles  varchar(300);

-- truncate tribes -- to remove all rows

-- table 2: eco_sites
select * from eco_sites;

alter table eco_sites add  column len_site_name int default 0; -- 1. add new column of length of name 

update eco_sites         -- 2. Updating eco_sites
set len_site_name = length(site_name);

alter table eco_sites add  column Region varchar(80) default 'dummy'; -- 3. add column region

update eco_sites        -- 4. UPDATING REGION COLUMN
       set region =
       case 
            when state_region ='Kerala' or state_region ='Tamil Nadu' then 'South'
            when state_region ='Assam' or state_region ='Nagaland' then 'North East'
            when state_region = 'Gujarat' or state_region ='Maharashtra' then 'West'
            when state_region = 'Odisha' or state_region like 'Chhattisgarh' then 'East'
            when state_region like "%Rajasthan%" then 'North West'
            when state_region like "%Ladakh%" or state_region like "%Uttarakhand%" then 'North '
            else 'UNION TERRITORY'
		end;
        
alter table eco_sites add  column KEY_ACTIVITES_NO int default 0; -- 5. add new column of KEY_ACTIVITES NO
update eco_sites
set key_activites_no = length(key_activites) - length(replace(key_activites,',',"")) +1;

select * from eco_sites;

-- truncate eco_sites  for deleting the data of table

-- 3. visit logs
select * from visit_logs;

alter table visit_logs modify visitor_name varchar(255) not null; -- 1. changing name datatype
alter table visit_logs add column length_feedback int; -- 2. new colum length feedback
update visit_logs
set length_feedback = length(feedback); -- 3. update length_feedback

alter table visit_logs add  column no_activites int default 0; -- 4. add new column no_activites

update visit_logs
set no_activites = length(activities_done) - length(replace(activities_done,",","")) +1; -- 5. activites done

alter table visit_logs add  column  year_visit year default 0; -- 6. add new column year
update visit_logs set year_visit = year(visit_date); -- 7. update year column


-- 4. Conservation Areas
select * from conservation_areas;

alter table conservation_areas add column type_area varchar(50); -- 1. new column type of area size

update conservation_areas             -- 2. update conservation area table type_area column
set type_area =
    case 
    when area_size_km2 <=100 then "short area"
    when area_size_km2 between 101 and 500 then "medium area"
    when area_size_km2 between 500 and 1000 then "large area"
    when area_size_km2 between 1001 and 50000 then "Extemely large area"
    end;

set SQL_Safe_updates = 0;
alter table conservation_areas add column p_level_meaning varchar(150); -- 3. new column type of area size

set SQL_Safe_updates = 0;
update conservation_areas
set p_level_meaning =          -- 4. Updating conservation areas
	case
        when protection_level = 'Core Zone' then 'No Human Entry'
		when protection_level = 'Community Zone' then 'Under Community'
        when protection_level = 'Community Reserve' then 'Under Community'
		when protection_level = 'Buffer Zone' then 'Allowed'
		when protection_level = 'Marine Core' then 'Very Restricted'
end;


-- 5. cultural_assets
select * from cultural_assets;

alter table cultural_assets add column len_asset_type int default 0;

update cultural_assets
set len_asset_type = char_length(asset_type);

-- 6. traditional_knowledge
select * from traditional_knowledge;

alter table traditional_knowledge ADD column len_practice_name int default 0;
update traditional_knowledge set len_practice_name = length(practice_name);

alter table traditional_knowledge ADD column len_eco_benefit int default 0;
update traditional_knowledge set len_eco_benefit = length(eco_benefit);

-- 7. LOCAL_ARTISIANS

select * from LOCAL_ARTISIANS;
alter table LOCAL_ARTISIANS add column notes text;
alter table LOCAL_ARTISIANS add column GENDER CHAR;

UPDATE LOCAL_ARTISIANS 
SET GENDER = 'M';

UPDATE LOCAL_ARTISIANS 
SET GENDER = 'F'
WHERE artist_id in (2,4,6,8,11);

-- workshop and awareness programs

-- 8. cultural workshops 
select * from cultural_workshops;

alter table cultural_workshops add column workshop_type varchar(100);

update cultural_workshops set workshop_type = 
case
when workshop_name like '%Dance%' then 'Dance'
when workshop_name like '%Painting%' then 'Painting'
when workshop_name like '%Song%' then 'Singing'
when workshop_name like '%Photography%' then 'Photography'
when workshop_name like '%Craft%' then 'Craft'
when workshop_name like '%Pottery%' then 'Pottery'
when workshop_name like '%Medicine%' then 'Medicine'
when workshop_name like '%Shawl%' then 'Weaving'
when workshop_name like '%Embroidery%' then 'Weaving'
end;

update cultural_workshops set workshop_type = 
case
when workshop_name like '%Craft%' then 'Craft'
when workshop_name like '%Pottery%' then 'Pottery'
when workshop_name like '%Medicine%' then 'Medicine'
when workshop_name like '%Shawl%' then 'Weaving'
when workshop_name like '%Embriodery%' then 'Weaving'
end;

update cultural_workshops set workshop_type ='drum' where c_id =18;
update cultural_workshops set workshop_type ='folk performance' where c_id =19;
update cultural_workshops set workshop_type ='metal casting' where c_id =16;
update cultural_workshops set workshop_type ='jewelry' where c_id =9;
update cultural_workshops set workshop_type ='Honey methods gathering' where c_id =7;

-- 9. Eco Guides

select guide_id,eco_guides.site_id,site_name,state_region,language_supported from eco_guides 
inner join eco_sites 
on eco_guides.site_id=eco_sites.site_id;

select * from eco_guides;

alter table eco_guides add column language_supported varchar(100);

update eco_guides
set language_supported = 'English,Malyalyam' where guide_id in (1,2,5,19,6); 

update eco_guides
set language_supported = 'English,Nagamese,Ao' where guide_id in (7,18);
update eco_guides
set language_supported = 'English,Assamese' where guide_id in (3,17,16); 

UPDATE eco_guides
SET language_supported = CASE 
    WHEN guide_id IN (1, 6) THEN 'Tamil,Malayalam,English'
    WHEN guide_id IN (2, 5, 19) THEN 'Malayalam,English'
    WHEN guide_id IN (3, 16) THEN 'Assamese,Hindi,English'
    WHEN guide_id IN (7, 18) THEN 'Angami,Nagamese,English'
    WHEN guide_id IN (4, 14) THEN 'Hindi'
    WHEN guide_id IN (10, 11) THEN 'English,Hindi,Gujarati'
    WHEN guide_id = 9 THEN 'Odia,Hindi,English'
    WHEN guide_id = 8 THEN 'Chhattisgarhi,Hindi'
    WHEN guide_id = 12 THEN 'English'
    WHEN guide_id = 13 THEN 'Hindi,Sanskrit'
    WHEN guide_id = 15 THEN 'Purgi,Hindi,Bhoti,English'
    WHEN guide_id = 17 THEN 'Bodo,Hindi,English'
    ELSE language_supported
END;

ALTER TABLE eco_guides    -- add new column rating
ADD COLUMN rating DECIMAL(2,1) DEFAULT NULL;

UPDATE eco_guides
SET rating = CASE 
        WHEN guide_id = 1 THEN 4.5
        WHEN guide_id = 2 THEN 4.3
        WHEN guide_id = 3 THEN 4.6
        WHEN guide_id = 4 THEN 4.2
        WHEN guide_id = 5 THEN 4.4
        WHEN guide_id = 6 THEN 4.5
        WHEN guide_id = 7 THEN 4.1
        WHEN guide_id = 8 THEN 4.0
        WHEN guide_id = 9 THEN 4.7
        WHEN guide_id = 10 THEN 4.6
        WHEN guide_id = 11 THEN 4.3
        WHEN guide_id = 12 THEN 4.5
        WHEN guide_id = 13 THEN 4.6
        WHEN guide_id = 14 THEN 4.2
        WHEN guide_id = 15 THEN 4.8
        WHEN guide_id = 16 THEN 4.4
        WHEN guide_id = 17 THEN 4.1
        WHEN guide_id = 18 THEN 4.0
        WHEN guide_id = 19 THEN 4.3
        ELSE rating
    END;
    

ALTER TABLE eco_guides ADD COLUMN max_group_size INT DEFAULT NULL;  -- add new column max_group_size

UPDATE eco_guides
SET max_group_size = CASE   -- update max group size
    WHEN guide_id IN (1, 2, 5, 6, 19) THEN 20
    WHEN guide_id IN (3, 7, 8, 17, 18) THEN 15
    WHEN guide_id IN (4, 10, 11, 12) THEN 10
    WHEN guide_id IN (9, 13, 14, 16) THEN 25
    WHEN guide_id = 15 THEN 8
    ELSE max_group_size
END;


ALTER TABLE eco_guides  ADD COLUMN duration_hours DECIMAL(4,2) DEFAULT NULL; -- add new column duration hours

UPDATE eco_guides
SET duration_hours = CASE   -- set duration hrs update 
    WHEN guide_id IN (1, 6, 13, 15) THEN 5.0
    WHEN guide_id IN (2, 5, 19) THEN 3.0
    WHEN guide_id IN (3, 7, 17, 18) THEN 4.0
    WHEN guide_id IN (4, 10, 11, 12, 14, 16) THEN 2.0
    WHEN guide_id = 8 THEN 1.5
    WHEN guide_id = 9 THEN 2.5
    ELSE duration_hours
END;

-- 10. youth_awareness_programs
ALTER TABLE youth_awareness_programs ADD COLUMN program_type VARCHAR(100); 
-- program category like Awareness, Workshop, Campaign

-- Update program_name
UPDATE youth_awareness_programs
SET program_type = CASE
    WHEN program_name LIKE '%Save%' THEN 'Awareness'
    WHEN program_name LIKE '%Campaign%' THEN 'Campaign'
    WHEN program_name LIKE '%Club%' THEN 'Workshop'
    WHEN program_name LIKE '%Challenge%' THEN 'Competition'
    WHEN program_name LIKE '%Fair%' THEN 'Event'
    WHEN program_name LIKE '%Project%' THEN 'Project'
    ELSE 'Other'
END;

ALTER TABLE youth_awareness_programs ADD COLUMN age_group VARCHAR(50); -- target age group e.g., 6-12, 13-18, 18+

-- Update age_group 
UPDATE youth_awareness_programs
SET age_group = CASE
    WHEN target_group LIKE '%School Students%' THEN '6-18'
    WHEN target_group LIKE '%Primary Students%' THEN '6-12'
    WHEN target_group LIKE '%High School Students%' THEN '14-18'
    WHEN target_group LIKE '%College Students%' THEN '18-22'
    WHEN target_group LIKE '%Village Youth%' THEN '15-25'
    WHEN target_group LIKE '%Young Adults%' THEN '18-30'
    WHEN target_group LIKE '%Eco Clubs%' THEN '10-20'
    ELSE 'All Ages'
END;

ALTER TABLE youth_awareness_programs ADD COLUMN season VARCHAR(20); -- season when program runs e.g., Summer, Winter

UPDATE youth_awareness_programs SET season = 'Winter' WHERE program_name LIKE '%Snow Leopard%'; -- Ladakh winter
UPDATE youth_awareness_programs SET season = 'Spring' WHERE program_name LIKE '%Alpine%'; -- mountain spring
UPDATE youth_awareness_programs SET season = 'Summer' WHERE program_name LIKE '%Coral%'; -- marine summer
UPDATE youth_awareness_programs SET season = 'Monsoon' WHERE program_name LIKE '%Wetlands%'; -- wetlands monsoon
UPDATE youth_awareness_programs SET season = 'Summer' WHERE program_name LIKE '%Forest%' OR program_name LIKE '%Glamping%'; -- forest summer
UPDATE youth_awareness_programs SET season = 'Winter' WHERE program_name LIKE '%Tigers%'; -- tiger winter
UPDATE youth_awareness_programs SET season = 'Spring' WHERE program_name LIKE '%Bird%'; -- bird spring
UPDATE youth_awareness_programs SET season = 'All Seasons' WHERE season IS NULL; -- default

ALTER TABLE youth_awareness_programs ADD COLUMN feedback_rating DECIMAL(2,1); -- participant feedback rating (1-5)


-- feedback_rating updates
UPDATE youth_awareness_programs SET feedback_rating = 4.5 WHERE program_name LIKE '%Save Tigers%'; -- tiger
UPDATE youth_awareness_programs SET feedback_rating = 4.2 WHERE program_name LIKE '%Green Periyar%'; -- periyar
UPDATE youth_awareness_programs SET feedback_rating = 4.0 WHERE program_name LIKE '%Bird Festival%'; -- bird
UPDATE youth_awareness_programs SET feedback_rating = 4.3 WHERE program_name LIKE '%Eco-Youth%'; -- eco-youth
UPDATE youth_awareness_programs SET feedback_rating = 4.1 WHERE program_name LIKE '%Forest Rangers%'; -- ranger

ALTER TABLE youth_awareness_programs ADD COLUMN volunteer_involvement BOOLEAN; -- if volunteers are involved TRUE/FALSE


-- volunteer_involvement updates
UPDATE youth_awareness_programs SET volunteer_involvement = TRUE WHERE program_name LIKE '%Save%' OR program_name LIKE '%Drive%'; -- drive
UPDATE youth_awareness_programs SET volunteer_involvement = FALSE WHERE program_name LIKE '%Club%' OR program_name LIKE '%Project%'; -- club/project
UPDATE youth_awareness_programs SET volunteer_involvement = TRUE WHERE program_name LIKE '%Challenge%' OR program_name LIKE '%Fair%'; -- challenge/fair

select * from youth_awareness_programs;

-- 11. public_education_events

select * from public_education_events;

ALTER TABLE public_education_events ADD COLUMN season VARCHAR(20); -- season of event e.g., Summer, Winter, Monsoon

ALTER TABLE public_education_events ADD COLUMN age_group VARCHAR(50); -- target age group e.g., 6-12, 13-18, 18+

-- update season
UPDATE public_education_events SET season = 'Summer' WHERE event_id IN (1,3,5); -- summer events
UPDATE public_education_events SET season = 'Winter' WHERE event_id IN (2,6); -- winter events
UPDATE public_education_events SET season = 'Monsoon' WHERE event_id IN (4,7); -- monsoon events
UPDATE public_education_events SET season = 'All Seasons' WHERE event_id IN (8); -- year-round event

-- update age_group
UPDATE public_education_events SET age_group = 'All Ages' WHERE event_id IN (1,4,8); -- general public
UPDATE public_education_events SET age_group = '6-18' WHERE event_id IN (2,3,6); -- school/young students
UPDATE public_education_events SET age_group = '18+' WHERE event_id IN (5,7); -- adults/college


ALTER TABLE public_education_events ADD COLUMN max_participants INT; -- max number of participants allowed
ALTER TABLE public_education_events ADD COLUMN feedback_rating DECIMAL(2,1); -- participant rating 1.0-5.0

-- update max_participants
UPDATE public_education_events SET max_participants = 200 WHERE event_id IN (1,4,8); -- large public events
UPDATE public_education_events SET max_participants = 50 WHERE event_id IN (2,6); -- medium events
UPDATE public_education_events SET max_participants = 30 WHERE event_id IN (3,5,7); -- small workshops

-- update feedback_rating
UPDATE public_education_events SET feedback_rating = 4.5 WHERE event_id IN (1,4); -- highly rated
UPDATE public_education_events SET feedback_rating = 4.2 WHERE event_id IN (2,6); -- good rating
UPDATE public_education_events SET feedback_rating = 4.0 WHERE event_id IN (3,5,7); -- average rating
UPDATE public_education_events SET feedback_rating = 4.3 WHERE event_id IN (8); -- special event rating


ALTER TABLE public_education_events ADD COLUMN event_type VARCHAR(100); 
-- type of event e.g., Awareness, Workshop, Festival

UPDATE public_education_events SET event_type = 'Awareness' WHERE event_id IN (1,4,10,16); -- awareness events
UPDATE public_education_events SET event_type = 'Workshop' WHERE event_id IN (6); -- workshop type
UPDATE public_education_events SET event_type = 'Festival' WHERE event_id IN (2,9,12,14); -- festival type

-- 12. eco_lodges

ALTER TABLE eco_lodges ADD COLUMN lodge_type VARCHAR(50); -- type of lodge e.g., Eco-hut, Glamping, Resort

ALTER TABLE eco_lodges ADD COLUMN facilities TEXT; -- detailed facilities e.g., Wi-Fi, Pool, Kitchen

ALTER TABLE eco_lodges ADD COLUMN rating DECIMAL(2,1); -- average guest rating 1.0-5.0

ALTER TABLE eco_lodges ADD COLUMN available BOOLEAN; -- whether lodge is currently available TRUE/FALSE

ALTER TABLE eco_lodges ADD COLUMN min_stay_days INT; -- minimum stay requirement

ALTER TABLE eco_lodges ADD COLUMN pet_friendly BOOLEAN; -- if lodge allows pets

UPDATE eco_lodges SET lodge_type = 'Eco-hut' WHERE lodge_id IN (1,3,5,6,9,12,13); -- lodge type Eco-hut
UPDATE eco_lodges SET lodge_type = 'Glamping' WHERE lodge_id IN (4,7); -- lodge type Glamping
UPDATE eco_lodges SET lodge_type = 'Resort' WHERE lodge_id IN (10,16); -- lodge type Resort

UPDATE eco_lodges SET facilities = 'Solar lights, Organic food, Eco-friendly toilets' WHERE lodge_id IN (1,5,6); -- facilities for eco-huts
UPDATE eco_lodges SET facilities = 'Luxury tents, Private safaris, Craft market' WHERE lodge_id = 4; -- facilities for luxury glamping
UPDATE eco_lodges SET facilities = 'Birdwatching deck, Canoe rides, Local meals' WHERE lodge_id IN (9,12,13); -- facilities for other lodges

UPDATE eco_lodges SET rating = 4.5 WHERE lodge_id IN (1,4,9); -- lodge ratings
UPDATE eco_lodges SET rating = 4.0 WHERE lodge_id IN (2,3,5,6); 
UPDATE eco_lodges SET rating = 4.8 WHERE lodge_id IN (10,16); 

UPDATE eco_lodges SET available = TRUE WHERE lodge_id IN (1,2,3,5,6,9,12,13); -- lodge availability
UPDATE eco_lodges SET available = FALSE WHERE lodge_id IN (4,7,10,16); -- lodge not available

UPDATE eco_lodges SET min_stay_days = 2 WHERE lodge_id IN (1,2,3); -- min stay days
UPDATE eco_lodges SET min_stay_days = 3 WHERE lodge_id IN (5,6,9,12); 
UPDATE eco_lodges SET min_stay_days = 1 WHERE lodge_id IN (4,7,10,16); 

UPDATE eco_lodges SET pet_friendly = TRUE WHERE lodge_id IN (1,2,3,5,9); -- pet friendly
UPDATE eco_lodges SET pet_friendly = FALSE WHERE lodge_id IN (4,6,7,10,12,13,16); -- not pet friendly

-- 13. package_types

ALTER TABLE package_types ADD COLUMN package_category VARCHAR(50); -- type of package e.g., Adventure, Heritage, Wellness

ALTER TABLE package_types ADD COLUMN max_guests INT; -- maximum allowed guests per package

ALTER TABLE package_types ADD COLUMN recommended_season VARCHAR(20); -- best season for package e.g., Summer, Winter

ALTER TABLE package_types ADD COLUMN difficulty_level VARCHAR(20); -- easy, medium, hard (for trekking/adventure)

ALTER TABLE package_types ADD COLUMN eco_friendly BOOLEAN; -- eco-friendly package TRUE/FALSE

ALTER TABLE package_types ADD COLUMN inclusions TEXT; -- details of included services

UPDATE package_types SET package_category = 'Adventure' WHERE package_id IN (1,3,4); -- adventure packages
UPDATE package_types SET package_category = 'Heritage' WHERE package_id = 2; -- heritage package
UPDATE package_types SET package_category = 'Wellness' WHERE package_id = 8; -- wellness package
UPDATE package_types SET package_category = 'Nature' WHERE package_id IN (5,7,9); -- nature/eco packages

UPDATE package_types SET max_guests = 10 WHERE package_id IN (1,4,8); -- max guests 10
UPDATE package_types SET max_guests = 15 WHERE package_id IN (2,3,5,6,7,9); -- max guests 15

UPDATE package_types SET recommended_season = 'Summer' WHERE package_id IN (1,5,8); -- summer packages
UPDATE package_types SET recommended_season = 'Winter' WHERE package_id IN (2,6); -- winter packages
UPDATE package_types SET recommended_season = 'All Seasons' WHERE package_id IN (3,4,7,9); -- all seasons

UPDATE package_types SET difficulty_level = 'Medium' WHERE package_id IN (1,3); -- trekking/adventure medium
UPDATE package_types SET difficulty_level = 'Easy' WHERE package_id IN (2,5,6,7,8,9); -- easy packages
UPDATE package_types SET difficulty_level = 'Hard' WHERE package_id = 4; -- hard adventure

UPDATE package_types SET eco_friendly = TRUE WHERE package_id IN (1,3,5,6,7,8,9); -- eco-friendly packages
UPDATE package_types SET eco_friendly = FALSE WHERE package_id IN (2,4); -- not eco-friendly

UPDATE package_types SET inclusions = 'Trekking, Safari, Tribal interaction' WHERE package_id = 1; -- package inclusions
UPDATE package_types SET inclusions = 'Heritage walk, Cultural show, Birdwatching' WHERE package_id = 2;
UPDATE package_types SET inclusions = 'Safari, Weaving demo, Homestay, Campfire' WHERE package_id = 3;
UPDATE package_types SET inclusions = 'Luxury tent stay, Leopard safari, Craft market' WHERE package_id = 4;
UPDATE package_types SET inclusions = 'Eco-lodge stay, Trekking, Forest interpretation' WHERE package_id = 5;
UPDATE package_types SET inclusions = 'Homestay, Farming, Weaving workshop' WHERE package_id = 7;
UPDATE package_types SET inclusions = 'Medicinal walk, Yoga, Cultural demo' WHERE package_id = 8;
UPDATE package_types SET inclusions = 'Birdwatching, Boating, Eco-cottage stay' WHERE package_id = 9;


-- 14. booking_history

ALTER TABLE booking_history ADD COLUMN booking_status VARCHAR(50); -- e.g., Confirmed, Cancelled, Pending
ALTER TABLE booking_history ADD COLUMN payment_status VARCHAR(50); -- e.g., Paid, Partial, Pending
ALTER TABLE booking_history ADD COLUMN booking_source VARCHAR(50); -- e.g., Online, Direct, Travel Agent
ALTER TABLE booking_history ADD COLUMN special_requests TEXT; -- e.g., dietary needs, room preference
ALTER TABLE booking_history ADD COLUMN feedback_received BOOLEAN; -- whether feedback has been submitted TRUE/FALSE

UPDATE booking_history SET booking_status = 'Confirmed' WHERE booking_id IN (1,2,3,4,5,6,7,8); -- all confirmed
UPDATE booking_history SET payment_status = 'Paid' WHERE booking_id IN (1,3,5,6,8); -- fully paid
UPDATE booking_history SET payment_status = 'Partial' WHERE booking_id IN (2,4,7); -- partial payment
UPDATE booking_history SET booking_source = 'Online' WHERE booking_id IN (1,2,3,4); -- online bookings
UPDATE booking_history SET booking_source = 'Direct' WHERE booking_id IN (5,6); -- direct bookings
UPDATE booking_history SET booking_source = 'Travel Agent' WHERE booking_id IN (7,8); -- via travel agent
UPDATE booking_history SET special_requests = 'Vegetarian meals' WHERE booking_id = 2; -- special requests
UPDATE booking_history SET special_requests = 'Extra bed' WHERE booking_id = 3; -- special requests
UPDATE booking_history SET special_requests = 'Sea view room' WHERE booking_id = 4; -- special requests
UPDATE booking_history SET feedback_received = TRUE WHERE booking_id IN (1,2,3,4,5,6,7,8); -- feedback received for all

select * from booking_history;

-- 15. Tourist Feedback

ALTER TABLE tourist_feedback ADD COLUMN feedback_date DATE; -- date feedback submitted
ALTER TABLE tourist_feedback ADD COLUMN sentiment VARCHAR(20); -- e.g., Positive, Neutral, Negative
ALTER TABLE tourist_feedback ADD COLUMN response_status VARCHAR(20); -- e.g., Addressed, Pending
ALTER TABLE tourist_feedback ADD COLUMN tags TEXT; -- keywords like Safari, Lodging, Food, Staff
ALTER TABLE tourist_feedback ADD COLUMN recommended BOOLEAN; -- whether tourist recommends TRUE/FALSE

UPDATE tourist_feedback SET feedback_date = '2025-01-15' WHERE feedback_id = 1; -- set feedback date
UPDATE tourist_feedback SET feedback_date = '2025-01-24' WHERE feedback_id = 2;
UPDATE tourist_feedback SET feedback_date = '2025-01-15' WHERE feedback_id = 3;
UPDATE tourist_feedback SET feedback_date = '2025-01-22' WHERE feedback_id = 4;
UPDATE tourist_feedback SET feedback_date = '2025-01-17' WHERE feedback_id = 5;
UPDATE tourist_feedback SET feedback_date = '2025-01-20' WHERE feedback_id = 6;
UPDATE tourist_feedback SET feedback_date = '2025-01-12' WHERE feedback_id = 7;
UPDATE tourist_feedback SET feedback_date = '2025-02-01' WHERE feedback_id = 8;

UPDATE tourist_feedback SET sentiment = 'Positive' WHERE feedback_id IN (1,3,5,6,8); -- positive feedback
UPDATE tourist_feedback SET sentiment = 'Neutral' WHERE feedback_id IN (2,7);
UPDATE tourist_feedback SET sentiment = 'Negative' WHERE feedback_id = 4;

UPDATE tourist_feedback SET response_status = 'Addressed' WHERE feedback_id IN (1,3,5,6,8);
UPDATE tourist_feedback SET response_status = 'Pending' WHERE feedback_id IN (2,4,7);

UPDATE tourist_feedback SET tags = 'Safari, Tribal Guide' WHERE feedback_id = 1;
UPDATE tourist_feedback SET tags = 'Cultural Show, Food' WHERE feedback_id = 2;
UPDATE tourist_feedback SET tags = 'Weaving, Campfire, Safari' WHERE feedback_id = 3;
UPDATE tourist_feedback SET tags = 'Luxury, Tents' WHERE feedback_id = 4;
UPDATE tourist_feedback SET tags = 'Eco-lodge, Tribal Hospitality' WHERE feedback_id = 5;
UPDATE tourist_feedback SET tags = 'Village Tour, Food' WHERE feedback_id = 6;
UPDATE tourist_feedback SET tags = 'Herbal, Rustic Stay' WHERE feedback_id = 7;
UPDATE tourist_feedback SET tags = 'Birdwatching, Rare Species' WHERE feedback_id = 8;

UPDATE tourist_feedback SET recommended = TRUE WHERE feedback_id IN (1,3,5,6,8);
UPDATE tourist_feedback SET recommended = FALSE WHERE feedback_id IN (2,4,7);

-- 16. Waste Category

ALTER TABLE waste_category ADD COLUMN hazard_level VARCHAR(20); 
ALTER TABLE waste_category ADD COLUMN recyclable BOOLEAN; 
ALTER TABLE waste_category ADD COLUMN color_code VARCHAR(10); 

select * from waste_category;

UPDATE waste_category SET hazard_level = 'High' WHERE category_name = 'Plastic';
UPDATE waste_category SET hazard_level = 'Low' WHERE category_name = 'Organic';
UPDATE waste_category SET hazard_level = 'High' WHERE category_name = 'E-waste';
UPDATE waste_category SET hazard_level = 'Low' WHERE category_name = 'Paper/Cardboard';
UPDATE waste_category SET hazard_level = 'Low' WHERE category_name = 'Glass';
UPDATE waste_category SET hazard_level = 'Medium' WHERE category_name = 'Metal';
UPDATE waste_category SET hazard_level = 'High' WHERE category_name = 'Hazardous';
UPDATE waste_category SET hazard_level = 'Low' WHERE category_name = 'Textile';
UPDATE waste_category SET hazard_level = 'High' WHERE category_name = 'Bio-Medical';
UPDATE waste_category SET hazard_level = 'Low' WHERE category_name = 'Construction Debris';

UPDATE waste_category SET recyclable = 1 
WHERE category_name IN ('Plastic','Paper/Cardboard','Glass','Metal','Textile');
UPDATE waste_category SET recyclable = 0 
WHERE category_name IN ('Hazardous','Bio-Medical','Organic','Construction Debris','E-waste');

UPDATE waste_category SET color_code = 'Red' WHERE category_name = 'Plastic';
UPDATE waste_category SET color_code = 'Green' WHERE category_name = 'Organic';
UPDATE waste_category SET color_code = 'Yellow' WHERE category_name = 'E-waste';
UPDATE waste_category SET color_code = 'Blue' WHERE category_name = 'Paper/Cardboard';
UPDATE waste_category SET color_code = 'Brown' WHERE category_name = 'Glass';
UPDATE waste_category SET color_code = 'Grey' WHERE category_name = 'Metal';
UPDATE waste_category SET color_code = 'Black' WHERE category_name = 'Hazardous';
UPDATE waste_category SET color_code = 'White' WHERE category_name = 'Textile';
UPDATE waste_category SET color_code = 'Purple' WHERE category_name = 'Bio-Medical';
UPDATE waste_category SET color_code = 'Orange' WHERE category_name = 'Construction Debris';

-- 17. WASTE ITEMS

ALTER TABLE waste_items ADD COLUMN disposal_method_id INT;
ALTER TABLE waste_items ADD COLUMN source_id INT;
ALTER TABLE waste_items ADD COLUMN status VARCHAR(20);
ALTER TABLE waste_items ADD COLUMN weight_unit VARCHAR(10);
ALTER TABLE waste_items ADD COLUMN notes TEXT;

UPDATE waste_items SET disposal_method_id = 2 WHERE cat_id = 1; -- Plastic → Recycling
UPDATE waste_items SET disposal_method_id = 1 WHERE cat_id = 2; -- Organic → Composting
UPDATE waste_items SET disposal_method_id = 5 WHERE cat_id = 3; -- E-waste → E-waste processing

UPDATE waste_items SET source_id = 1 WHERE site_id = 1 AND tribe_id = 1; -- lodge kitchen example
UPDATE waste_items SET source_id = 2 WHERE site_id = 1 AND tribe_id = 1; -- visitor area example

UPDATE waste_items SET status = 'Collected' WHERE w_id <= 10;
UPDATE waste_items SET status = 'Pending' WHERE w_id > 10;

UPDATE waste_items SET weight_unit = 'kg';
UPDATE waste_items SET notes = 'Logged during daily monitoring';

-- 18. Disposal Methods

ALTER TABLE disposal_methods ADD COLUMN eco_friendly BOOLEAN;
ALTER TABLE disposal_methods ADD COLUMN cost_per_kg DECIMAL(10,2);
ALTER TABLE disposal_methods ADD COLUMN time_required_hours INT;
ALTER TABLE disposal_methods ADD COLUMN notes TEXT;

UPDATE disposal_methods SET eco_friendly = 1 
WHERE method_name IN ('Composting','Recycling','Anaerobic digestion','Upcycling','Donation');
UPDATE disposal_methods SET eco_friendly = 0 
WHERE method_name IN ('Incineration','Landfill','E-waste processing');

UPDATE disposal_methods SET cost_per_kg = 10.00 WHERE method_name = 'Composting';
UPDATE disposal_methods SET cost_per_kg = 15.00 WHERE method_name = 'Recycling';
UPDATE disposal_methods SET cost_per_kg = 50.00 WHERE method_name = 'Incineration';

UPDATE disposal_methods SET time_required_hours = 24 WHERE method_name = 'Composting';
UPDATE disposal_methods SET time_required_hours = 48 WHERE method_name = 'Recycling';
UPDATE disposal_methods SET time_required_hours = 12 WHERE method_name = 'Incineration';

UPDATE disposal_methods SET notes = 'Standard procedure for all waste types';
select * from disposal_methods;

-- 19. waste_sources

ALTER TABLE waste_sources ADD COLUMN frequency_logged VARCHAR(50);
ALTER TABLE waste_sources ADD COLUMN active BOOLEAN;
ALTER TABLE waste_sources ADD COLUMN contact_person VARCHAR(100);

UPDATE waste_sources SET frequency_logged = 'Daily' WHERE s_id <= 10;
UPDATE waste_sources SET frequency_logged = 'Weekly' WHERE s_id > 10;

UPDATE waste_sources SET active = 1 WHERE s_id IN (1,2,3,4,5,6,7,8,9,10);
UPDATE waste_sources SET active = 0 WHERE s_id > 10;

UPDATE waste_sources SET contact_person = 'Ramesh Kumar' WHERE s_id = 1;
UPDATE waste_sources SET contact_person = 'Anita Rao' WHERE s_id = 2;
UPDATE waste_sources SET contact_person = 'Ajay Singh' WHERE s_id = 3;
UPDATE waste_sources SET contact_person = 'Sunita Verma' WHERE s_id = 4;
UPDATE waste_sources SET contact_person = 'Rahul Mehta' WHERE s_id = 5;
UPDATE waste_sources SET contact_person = 'Neha Sharma' WHERE s_id = 6;
UPDATE waste_sources SET contact_person = 'Vikram Joshi' WHERE s_id = 7;
UPDATE waste_sources SET contact_person = 'Tanya Das' WHERE s_id = 8;
UPDATE waste_sources SET contact_person = 'Ravi Shankar' WHERE s_id = 9;
UPDATE waste_sources SET contact_person = 'Swati Menon' WHERE s_id = 10;
UPDATE waste_sources SET contact_person = 'Unknown' WHERE s_id > 10;


select * from waste_sources;

-- 20. recycling_centers

ALTER TABLE recycling_centers ADD COLUMN operating_hours VARCHAR(50);
ALTER TABLE recycling_centers ADD COLUMN capacity_kg DECIMAL(15,2);
ALTER TABLE recycling_centers ADD COLUMN eco_certified BOOLEAN;
ALTER TABLE recycling_centers ADD COLUMN manager_name VARCHAR(100);

UPDATE recycling_centers SET operating_hours = '9AM-5PM';
UPDATE recycling_centers SET capacity_kg = 5000 WHERE center_id <= 5;
UPDATE recycling_centers SET capacity_kg = 3000 WHERE center_id > 5;

UPDATE recycling_centers SET eco_certified = 1 WHERE center_id IN (1,2,3,5,6,7);
UPDATE recycling_centers SET eco_certified = 0 WHERE center_id NOT IN (1,2,3,5,6,7);

UPDATE recycling_centers SET manager_name = 'Center Manager' WHERE center_id <= 10;

select * from recycling_centers;

-- 21. Visitor Statistics

ALTER TABLE visitor_statistics ADD COLUMN avg_stay_days INT; -- average length of stay in days
ALTER TABLE visitor_statistics ADD COLUMN repeat_visitors INT; -- number of repeat visitors
ALTER TABLE visitor_statistics ADD COLUMN online_booking_pct DECIMAL(5,2); -- % bookings online
ALTER TABLE visitor_statistics ADD COLUMN special_events_revenue DECIMAL(12,2); -- revenue from events

UPDATE visitor_statistics SET avg_stay_days = 3 WHERE site_id = 1;
UPDATE visitor_statistics SET avg_stay_days = 2 WHERE site_id = 2;
UPDATE visitor_statistics SET avg_stay_days = 4 WHERE site_id = 3;
UPDATE visitor_statistics SET avg_stay_days = 5 WHERE site_id = 4;
UPDATE visitor_statistics SET avg_stay_days = 3 WHERE site_id = 5;
UPDATE visitor_statistics SET avg_stay_days = 2 WHERE site_id = 6;
UPDATE visitor_statistics SET avg_stay_days = 2 WHERE site_id = 7;
UPDATE visitor_statistics SET avg_stay_days = 3 WHERE site_id = 8;
UPDATE visitor_statistics SET avg_stay_days = 4 WHERE site_id = 9;
UPDATE visitor_statistics SET avg_stay_days = 2 WHERE site_id = 10;

UPDATE visitor_statistics SET repeat_visitors = 500 WHERE site_id = 1;
UPDATE visitor_statistics SET repeat_visitors = 300 WHERE site_id = 2;
UPDATE visitor_statistics SET repeat_visitors = 200 WHERE site_id = 3;
UPDATE visitor_statistics SET repeat_visitors = 100 WHERE site_id = 4;
UPDATE visitor_statistics SET repeat_visitors = 400 WHERE site_id = 5;
UPDATE visitor_statistics SET repeat_visitors = 150 WHERE site_id = 6;
UPDATE visitor_statistics SET repeat_visitors = 80 WHERE site_id = 7;
UPDATE visitor_statistics SET repeat_visitors = 120 WHERE site_id = 8;
UPDATE visitor_statistics SET repeat_visitors = 250 WHERE site_id = 9;
UPDATE visitor_statistics SET repeat_visitors = 60 WHERE site_id = 10;


UPDATE visitor_statistics SET online_booking_pct = 65.00 WHERE site_id = 1;
UPDATE visitor_statistics SET online_booking_pct = 50.00 WHERE site_id = 2;
UPDATE visitor_statistics SET online_booking_pct = 40.00 WHERE site_id = 3;
UPDATE visitor_statistics SET online_booking_pct = 30.00 WHERE site_id = 4;
UPDATE visitor_statistics SET online_booking_pct = 55.00 WHERE site_id = 5;
UPDATE visitor_statistics SET online_booking_pct = 45.00 WHERE site_id = 6;
UPDATE visitor_statistics SET online_booking_pct = 35.00 WHERE site_id = 7;
UPDATE visitor_statistics SET online_booking_pct = 50.00 WHERE site_id = 8;
UPDATE visitor_statistics SET online_booking_pct = 60.00 WHERE site_id = 9;
UPDATE visitor_statistics SET online_booking_pct = 25.00 WHERE site_id = 10;

UPDATE visitor_statistics SET special_events_revenue = 250000.00 WHERE site_id = 1;
UPDATE visitor_statistics SET special_events_revenue = 150000.00 WHERE site_id = 2;
UPDATE visitor_statistics SET special_events_revenue = 120000.00 WHERE site_id = 3;
UPDATE visitor_statistics SET special_events_revenue = 100000.00 WHERE site_id = 4;
UPDATE visitor_statistics SET special_events_revenue = 180000.00 WHERE site_id = 5;
UPDATE visitor_statistics SET special_events_revenue = 90000.00 WHERE site_id = 6;
UPDATE visitor_statistics SET special_events_revenue = 50000.00 WHERE site_id = 7;
UPDATE visitor_statistics SET special_events_revenue = 60000.00 WHERE site_id = 8;
UPDATE visitor_statistics SET special_events_revenue = 130000.00 WHERE site_id = 9;
UPDATE visitor_statistics SET special_events_revenue = 40000.00 WHERE site_id = 10;




-- 22 reforestation_logs

ALTER TABLE reforestation_logs ADD COLUMN area_hectares DECIMAL(7,2); -- area planted in hectares
ALTER TABLE reforestation_logs ADD COLUMN survival_rate_pct DECIMAL(5,2); -- % of trees surviving
ALTER TABLE reforestation_logs ADD COLUMN volunteers_count INT; -- number of volunteers
ALTER TABLE reforestation_logs ADD COLUMN funding_source VARCHAR(100); -- source of p

-- Combined update per row for all new columns
UPDATE reforestation_logs SET 
    area_hectares = 5.5,
    survival_rate_pct = 90.0,
    volunteers_count = 25,
    funding_source = 'Government Grant'
WHERE log_id = 1;

UPDATE reforestation_logs SET 
    area_hectares = 4.2,
    survival_rate_pct = 85.0,
    volunteers_count = 20,
    funding_source = 'Government Grant'
WHERE log_id = 2;

UPDATE reforestation_logs SET 
    area_hectares = 3.0,
    survival_rate_pct = 88.0,
    volunteers_count = 15,
    funding_source = 'Government Grant'
WHERE log_id = 3;

UPDATE reforestation_logs SET 
    area_hectares = 2.5,
    survival_rate_pct = 92.0,
    volunteers_count = 10,
    funding_source = 'Government Grant'
WHERE log_id = 4;

UPDATE reforestation_logs SET 
    area_hectares = 6.0,
    survival_rate_pct = 95.0,
    volunteers_count = 30,
    funding_source = 'Government Grant'
WHERE log_id = 5;

UPDATE reforestation_logs SET 
    area_hectares = 2.8,
    survival_rate_pct = 87.0,
    volunteers_count = 12,
    funding_source = 'NGO Support'
WHERE log_id = 6;

UPDATE reforestation_logs SET 
    area_hectares = 1.8,
    survival_rate_pct = 80.0,
    volunteers_count = 8,
    funding_source = 'NGO Support'
WHERE log_id = 7;

UPDATE reforestation_logs SET 
    area_hectares = 2.0,
    survival_rate_pct = 85.0,
    volunteers_count = 10,
    funding_source = 'NGO Support'
WHERE log_id = 8;

UPDATE reforestation_logs SET 
    area_hectares = 3.5,
    survival_rate_pct = 90.0,
    volunteers_count = 18,
    funding_source = 'NGO Support'
WHERE log_id = 9;

UPDATE reforestation_logs SET 
    area_hectares = 1.2,
    survival_rate_pct = 78.0,
    volunteers_count = 6,
    funding_source = 'NGO Support'
WHERE log_id = 10;

UPDATE reforestation_logs SET 
    area_hectares = 6.0,
    survival_rate_pct = 96.0,
    volunteers_count = 28,
    funding_source = 'Corporate Sponsorship'
WHERE log_id = 11;

UPDATE reforestation_logs SET 
    area_hectares = 4.5,
    survival_rate_pct = 88.0,
    volunteers_count = 22,
    funding_source = 'Corporate Sponsorship'
WHERE log_id = 12;

UPDATE reforestation_logs SET 
    area_hectares = 3.8,
    survival_rate_pct = 84.0,
    volunteers_count = 16,
    funding_source = 'Corporate Sponsorship'
WHERE log_id = 13;

UPDATE reforestation_logs SET 
    area_hectares = 2.5,
    survival_rate_pct = 80.0,
    volunteers_count = 12,
    funding_source = 'Corporate Sponsorship'
WHERE log_id = 14;

UPDATE reforestation_logs SET 
    area_hectares = 7.0,
    survival_rate_pct = 97.0,
    volunteers_count = 35,
    funding_source = 'Corporate Sponsorship'
WHERE log_id = 15;


-- 23  iot_bin_sensors

ALTER TABLE iot_bin_sensors ADD COLUMN bin_capacity_kg DECIMAL(7,2); -- max bin capacity in kg
ALTER TABLE iot_bin_sensors ADD COLUMN bin_status VARCHAR(20); -- status: Full, Empty, Half-full
ALTER TABLE iot_bin_sensors ADD COLUMN sensor_type VARCHAR(50); -- type of sensor e.g., Ultrasonic
ALTER TABLE iot_bin_sensors ADD COLUMN maintenance_due DATE; -- next maintenance date

UPDATE iot_bin_sensors
SET 
    bin_capacity_kg = CASE sensor_id
        WHEN 1 THEN 150.00
        WHEN 2 THEN 200.00
        WHEN 3 THEN 180.00
        WHEN 4 THEN 160.00
        WHEN 5 THEN 220.00
        WHEN 6 THEN 140.00
        WHEN 7 THEN 130.00
        WHEN 8 THEN 120.00
        WHEN 9 THEN 170.00
        WHEN 10 THEN 160.00
        WHEN 11 THEN 150.00
        WHEN 12 THEN 180.00
        WHEN 13 THEN 190.00
        WHEN 14 THEN 160.00
        WHEN 15 THEN 170.00
    END,
    
    bin_status = CASE sensor_id
        WHEN 1 THEN 'Half-full'
        WHEN 2 THEN 'Full'
        WHEN 3 THEN 'Full'
        WHEN 4 THEN 'Half-full'
        WHEN 5 THEN 'Empty'
        WHEN 6 THEN 'Half-full'
        WHEN 7 THEN 'Full'
        WHEN 8 THEN 'Half-full'
        WHEN 9 THEN 'Empty'
        WHEN 10 THEN 'Empty'
        WHEN 11 THEN 'Half-full'
        WHEN 12 THEN 'Full'
        WHEN 13 THEN 'Full'
        WHEN 14 THEN 'Half-full'
        WHEN 15 THEN 'Empty'
    END,
    
    sensor_type = CASE sensor_id
        WHEN 1 THEN 'Ultrasonic'
        WHEN 2 THEN 'Infrared'
        WHEN 3 THEN 'Ultrasonic'
        WHEN 4 THEN 'Infrared'
        WHEN 5 THEN 'Ultrasonic'
        WHEN 6 THEN 'Infrared'
        WHEN 7 THEN 'Ultrasonic'
        WHEN 8 THEN 'Infrared'
        WHEN 9 THEN 'Ultrasonic'
        WHEN 10 THEN 'Ultrasonic'
        WHEN 11 THEN 'Infrared'
        WHEN 12 THEN 'Ultrasonic'
        WHEN 13 THEN 'Infrared'
        WHEN 14 THEN 'Ultrasonic'
        WHEN 15 THEN 'Ultrasonic'
    END,
    
    maintenance_due = CASE sensor_id
        WHEN 1 THEN '2025-10-01'
        WHEN 2 THEN '2025-10-05'
        WHEN 3 THEN '2025-10-07'
        WHEN 4 THEN '2025-10-09'
        WHEN 5 THEN '2025-10-12'
        WHEN 6 THEN '2025-10-15'
        WHEN 7 THEN '2025-10-18'
        WHEN 8 THEN '2025-10-20'
        WHEN 9 THEN '2025-10-22'
        WHEN 10 THEN '2025-10-25'
        WHEN 11 THEN '2025-10-28'
        WHEN 12 THEN '2025-10-30'
        WHEN 13 THEN '2025-11-01'
        WHEN 14 THEN '2025-11-03'
        WHEN 15 THEN '2025-11-05'
    END;



-- 24 collection_trucks

ALTER TABLE collection_trucks ADD COLUMN last_service_date DATE; -- last maintenance date
ALTER TABLE collection_trucks ADD COLUMN driver_name VARCHAR(100); -- assigned driver
ALTER TABLE collection_trucks ADD COLUMN fuel_type VARCHAR(20); -- Diesel, Electric, Hybrid
ALTER TABLE collection_trucks ADD COLUMN active_routes VARCHAR(255); -- eco-sites routes

UPDATE collection_trucks
SET 
    last_service_date = CASE truck_id
        WHEN 1 THEN '2025-08-15'
        WHEN 2 THEN '2025-08-10'
        WHEN 3 THEN '2025-08-05'
        WHEN 4 THEN '2025-08-12'
        WHEN 5 THEN '2025-08-18'
        WHEN 6 THEN '2025-08-20'
        WHEN 7 THEN '2025-08-25'
        WHEN 8 THEN '2025-08-30'
        WHEN 9 THEN '2025-09-01'
        WHEN 10 THEN '2025-09-05'
        WHEN 11 THEN '2025-09-07'
        WHEN 12 THEN '2025-09-10'
        WHEN 13 THEN '2025-09-12'
        WHEN 14 THEN '2025-09-15'
        WHEN 15 THEN '2025-09-18'
    END,
    
    driver_name = CASE truck_id
        WHEN 1 THEN 'Ramesh Kumar'
        WHEN 2 THEN 'Suresh Patel'
        WHEN 3 THEN 'Anil Singh'
        WHEN 4 THEN 'Vikram Rao'
        WHEN 5 THEN 'Deepak Sharma'
        WHEN 6 THEN 'Manish Joshi'
        WHEN 7 THEN 'Karan Mehta'
        WHEN 8 THEN 'Rahul Verma'
        WHEN 9 THEN 'Amit Das'
        WHEN 10 THEN 'Rajesh Nair'
        WHEN 11 THEN 'Sunil Yadav'
        WHEN 12 THEN 'Pankaj Choudhary'
        WHEN 13 THEN 'Neeraj Gupta'
        WHEN 14 THEN 'Mohit Kapoor'
        WHEN 15 THEN 'Ashok Reddy'
    END,
    
    fuel_type = CASE truck_id
        WHEN 1 THEN 'Diesel'
        WHEN 2 THEN 'Diesel'
        WHEN 3 THEN 'Hybrid'
        WHEN 4 THEN 'Diesel'
        WHEN 5 THEN 'Electric'
        WHEN 6 THEN 'Diesel'
        WHEN 7 THEN 'Hybrid'
        WHEN 8 THEN 'Electric'
        WHEN 9 THEN 'Diesel'
        WHEN 10 THEN 'Diesel'
        WHEN 11 THEN 'Hybrid'
        WHEN 12 THEN 'Diesel'
        WHEN 13 THEN 'Electric'
        WHEN 14 THEN 'Diesel'
        WHEN 15 THEN 'Hybrid'
    END,
    
    active_routes = CASE truck_id
        WHEN 1 THEN 'Parambikulam - Periyar'
        WHEN 2 THEN 'Periyar - Manas'
        WHEN 3 THEN 'Manas - Jawai'
        WHEN 4 THEN 'Jawai - Kerala'
        WHEN 5 THEN 'Kerala - Khonoma'
        WHEN 6 THEN 'Khonoma - Jabarra'
        WHEN 7 THEN 'Jabarra - Mangalajodi'
        WHEN 8 THEN 'Mangalajodi - Nanda Devi'
        WHEN 9 THEN 'Nanda Devi - Kaziranga'
        WHEN 10 THEN 'Kaziranga - Hemis'
        WHEN 11 THEN 'Parambikulam - Kerala'
        WHEN 12 THEN 'Periyar - Khonoma'
        WHEN 13 THEN 'Manas - Mangalajodi'
        WHEN 14 THEN 'Jawai - Hemis'
        WHEN 15 THEN 'Kerala - Kaziranga'
    END;




-- 25 waste_transfer_logs

ALTER TABLE waste_transfer_logs ADD COLUMN transfer_status VARCHAR(20); -- Completed, Pending, In-Transit
ALTER TABLE waste_transfer_logs ADD COLUMN waste_type_summary VARCHAR(255); -- summary of waste types
ALTER TABLE waste_transfer_logs ADD COLUMN time_taken_hours DECIMAL(5,2); -- duration of transfer
ALTER TABLE waste_transfer_logs ADD COLUMN handled_by_team VARCHAR(100); -- responsible team/person

UPDATE waste_transfer_logs
SET 
    transfer_status = CASE transfer_id
        WHEN 1 THEN 'Completed'
        WHEN 2 THEN 'Completed'
        WHEN 3 THEN 'Completed'
        WHEN 4 THEN 'Completed'
        WHEN 5 THEN 'Pending'
        WHEN 6 THEN 'Completed'
        WHEN 7 THEN 'In-Transit'
        WHEN 8 THEN 'Pending'
        WHEN 9 THEN 'Completed'
        WHEN 10 THEN 'Completed'
        WHEN 11 THEN 'Completed'
        WHEN 12 THEN 'Pending'
        WHEN 13 THEN 'Completed'
        WHEN 14 THEN 'In-Transit'
        WHEN 15 THEN 'Completed'
    END,
    
    waste_type_summary = CASE transfer_id
        WHEN 1 THEN 'Plastic, Organic'
        WHEN 2 THEN 'Plastic, Organic'
        WHEN 3 THEN 'Plastic, E-waste'
        WHEN 4 THEN 'Plastic, Textile'
        WHEN 5 THEN 'Organic, Paper'
        WHEN 6 THEN 'Plastic, Glass'
        WHEN 7 THEN 'Plastic, Organic'
        WHEN 8 THEN 'Organic, Herbal'
        WHEN 9 THEN 'Plastic, Organic'
        WHEN 10 THEN 'Plastic, Glass'
        WHEN 11 THEN 'Plastic, Paper'
        WHEN 12 THEN 'Plastic, Organic'
        WHEN 13 THEN 'Paper, Plastic'
        WHEN 14 THEN 'Plastic, Organic'
        WHEN 15 THEN 'Plastic, Organic'
    END,
    
    time_taken_hours = CASE transfer_id
        WHEN 1 THEN 2.50
        WHEN 2 THEN 1.80
        WHEN 3 THEN 3.20
        WHEN 4 THEN 4.00
        WHEN 5 THEN 1.50
        WHEN 6 THEN 2.00
        WHEN 7 THEN 3.00
        WHEN 8 THEN 1.20
        WHEN 9 THEN 2.80
        WHEN 10 THEN 1.60
        WHEN 11 THEN 2.70
        WHEN 12 THEN 1.90
        WHEN 13 THEN 3.10
        WHEN 14 THEN 2.50
        WHEN 15 THEN 2.00
    END,
    
    handled_by_team = CASE transfer_id
        WHEN 1 THEN 'Team A'
        WHEN 2 THEN 'Team B'
        WHEN 3 THEN 'Team C'
        WHEN 4 THEN 'Team D'
        WHEN 5 THEN 'Team E'
        WHEN 6 THEN 'Team F'
        WHEN 7 THEN 'Team G'
        WHEN 8 THEN 'Team H'
        WHEN 9 THEN 'Team I'
        WHEN 10 THEN 'Team J'
        WHEN 11 THEN 'Team A'
        WHEN 12 THEN 'Team B'
        WHEN 13 THEN 'Team C'
        WHEN 14 THEN 'Team D'
        WHEN 15 THEN 'Team E'
    END;














































	
       






