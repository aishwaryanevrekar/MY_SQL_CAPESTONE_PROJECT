# Subquery Part 1 and 2

use sql_capestone_project;
select * from eco_sites;
select * from visit_logs;
select * from conservation_areas;
select * from tribes;

-- 1. eco-sites where the average rating is higher than the overall average rating across all sites.
select * from eco_sites
where site_id in (
select site_id from visit_logs 
group by site_id
having avg(rating) > (select avg(rating) from visit_logs) -- grouping data and then using having clause
);

-- 2. List the visitors who gave the highest rating in sites located in Kerala.

select * from visit_logs
where  site_id in ( select site_id from eco_sites where state_region ='Kerala')
and rating = 5;

--  3. tribes whose population is above the average population of all tribes.
select * from tribes where population_estimate > (select avg(population_estimate) from tribes);

-- 4. Get the names of sites that have conservation areas larger than the average conservation area size.
select * from eco_sites 
where site_id in(
 select site_id from conservation_areas
 group by site_id
 having avg(area_size_km2) > (select avg(area_size_km2) from conservation_areas));


 -- 5. Retrieve all artisans who belong to tribes linked with sites in Assam.
with tribe_eco_ as (
select tribe_id,tribe_name,site_name,state_region,tribes.site_id
from tribes inner join eco_sites on tribes.site_id = eco_sites.site_id
)
select artist_id,name,craft_type from LOCAL_ARTISIANS inner join
tribe_eco_ on LOCAL_ARTISIANS.tribe_id = tribe_eco_.tribe_id
where state_region = 'Assam' ;

-- 6. List cultural assets that belong to tribes from the same site as “Boro.”
select * from cultural_assets
where tribe_id = (select tribe_id from tribes where tribe_name ='Boro');

-- 7. Find the conservation areas linked to the same site as “Kaziranga National Park.”
select * from conservation_areas where site_id = ( select site_id from eco_sites 
where area_name ="Kaziranga National Park");

-- 8. Get the visitors who gave the highest rating overall.
select * FROM visit_logs
where rating =(select max(rating) from visit_logs
);

-- 9.List all eco-sites that are in the same type category as “Chinnar Wildlife Sanctuary.”
select * from eco_sites
where Type = ( select type from eco_sites where site_name like '%Chinnar%');

-- 10. Find the eco-sites that are located in the same region as “Manas National Park.”

select * from eco_sites
where state_region = ( select state_region from eco_sites where site_name like '%Manas%');


-- Part 3 and part 4

select * from cultural_workshops;
select * from ECO_GUIDES;
select * from youth_awareness_programs;
select * from public_education_events;

select * from eco_lodges;
select * from package_types;
select * from booking_history;
select * from tourist_feedback;

-- 1. Find all cultural workshops that belong to the same site as “Periyar Tiger Reserve / Wildlife Sanctuary.”

select * from cultural_workshops where
site_id = (select site_id from eco_sites where site_name ='Periyar Tiger Reserve / Wildlife Sanctuary');

-- 2. List eco-guides linked to sites in the same state as “Kaziranga National Park.”
select * from eco_guides where site_id in (
select site_id from eco_sites where site_name ='Kaziranga National Park');

-- 3. Find all youth awareness programs that belong to the same site as the “Kadar Bamboo Craft Demo” workshop.
-- (youth_awareness_programs, cultural_workshops)
select * from youth_awareness_programs where site_id =
(select site_id from cultural_workshops where workshop_name = 'Kadar Bamboo Craft Demo');

-- 4. Retrieve all public education events happening at sites where the state_region is Kerala.

select * from public_education_events
where site_id in 
(select site_id from eco_sites where state_region ='Kerala');

-- 5. Get the eco-lodges located at the same site as “Khonoma Heritage Homestay.”
-- (eco_lodges)
select * from eco_lodges where
site_id = (
select site_id from eco_lodges where lodge_name ="Khonoma Heritage Homestay") ;

-- 6. Find all package types that belong to the same site as the lodge “Manas Community Eco Camp.”

select * from package_types where site_id = (
select site_id from eco_lodges where lodge_name ='Manas Community Eco Camp');

--  7. List booking history records where the visitor booked a lodge with the maximum price_per_night.
-- (booking_history, eco_lodges)
select * from booking_history
 where site_id in (select site_id from eco_lodges 
 where price_per_night  = (select max(price_per_night) from eco_lodges ));

-- 8. Retrieve all tourist feedbacks that belong to bookings where visitors gave the minimum rating.
-- (tourist_feedback)
select * from tourist_feedback where rating
 = (select min(rating) from tourist_feedback);


-- 9. Find all eco-lodges that are at sites where a cultural workshop is offered to “Tourists.”
-- (eco_lodges, cultural_workshops)
select * from eco_lodges  where site_id in (
select site_id from cultural_workshops where target_audience ='Tourists');

-- 10. Get the package types where the duration_days is greater than the average duration_days of all packages.
-- (package_types)
select * from package_types where duration_days >
(select avg(duration_days) from  package_types);

-- 11. List all eco-guides that are linked to the same site as the “Forest Rangers for a Day” youth program.

select * from eco_guides where site_id =
(select site_id from youth_awareness_programs where program_name = 'Forest Rangers for a Day');

-- 12 Find cultural workshops conducted at sites where a public education event is also scheduled.
select * from cultural_workshops where site_id in (
select site_id from public_education_events) ;

-- 13 Retrieve all eco-lodges whose capacity is greater than the average capacity across all lodges.

select * from eco_lodges where capacity > (
select avg(capacity) from eco_lodges);

-- 14 Find the package types at sites where the price_per_night of lodges is less than 2500.

select * from package_types where site_id in (
select site_id from eco_lodges where price_per_night < 2500);

-- 15. List all visitors in booking history who booked a package with a price higher than the average package price.

select * from booking_history where package_id in (
select package_id from package_types where price > (
select avg(price) from package_types));

-- 16. Find eco-guides that are offered at the same sites where bird-related workshops are conducted.

select * from eco_guides
where site_id in (
select site_id from cultural_workshops where description like "%bird%" );

-- 17. Retrieve the booking history entries where the total_amount is equal to the maximum total_amount booked.

select * from booking_history where total_amount = (
select max(total_amount) from booking_history);

-- 18. Find package types where the price is equal to the minimum package price.
-- (package_types)
select * from package_types where price = (select min(price) from package_types);


-- 19. Find all public education events that are held at sites where eco-guides target “Tourists.”

select * from public_education_events
 where site_id in (
select site_id from eco_guides where target_audience ='Tourists');


-- 20. Retrieve feedbacks where the rating is equal to the maximum rating given across all feedback.

select * from tourist_feedback where rating = (
select max(rating) from tourist_feedback);


-- 21 Find all booking history entries where the package duration was greater than the shortest package duration.

select * from booking_history where package_id in
(select package_id from package_types where duration_days > (select min(duration_days) from package_types));

-- Part 5 and part 6

-- Waste Management (Part 5)


-- Waste_category,waste_items,disposal_methods,waste_sources,recycling_centers

-- 1.List categories of waste where at least one item has a quantity greater than 10 kg.
select * from waste_category where cat_id in
(select cat_id  from waste_items 
where quantity_kg > 10);

-- 2. Retrieve all waste sources that are linked to the same site as “Visitor Area.”
select * from waste_sources where site_id =(
select site_id from waste_sources where source_name ='Visitor Area') ;

-- 3. Find waste items belonging to the same category as “Old phones.”
select * from waste_items where cat_id = (
select cat_id from waste_items where item_name='Old phones') ;

-- 4. Get all recycling centers that are located in the same state as “Kaziranga Rhino Waste Center.”
select * from recycling_centers
where location in (
select location from eco_sites where center_name ='Kaziranga Rhino Waste Center');

-- 5.List all waste items whose quantity_kg is greater than the average quantity logged.

-- select * from waste_category where cat_id in
select *  from waste_items where quantity_kg > (
select avg(quantity_kg) from waste_items);


-- 6. Retrieve waste sources that belong to the same tribe as waste items containing “Plastic.”
select * from waste_sources where tribe_id in(
select tribe_id from waste_sources where description like '%plastic%') ;

-- 7. Find all disposal methods except the one used for “E-waste.”
select * from disposal_methods  where method_id not in (
select method_id from disposal_methods where method_name = 'E-waste processing');

-- 8. -- Find all waste items that belong to the same site as “Plastic water bottles.”
select * from waste_items where site_id =(
select site_id from  waste_items where item_name ='Plastic water bottles'
);

-- 9. Get waste items from sites where recycling centers accept ‘Organic’ waste.
select * from waste_items
where site_id in (select site_id from recycling_centers
where accepted_waste like '%organic%');

-- 10. List recycling centers at the same site where “Khonoma Village Recycling Hub” is located.
select * from recycling_centers  where site_id =
( select site_id from recycling_centers where center_name ="Khonoma Village Recycling Hub") ;


-- Find visitor statistics for sites that earned more revenue than the average revenue across all sites.

select * from visitor_statistics;
select * from reforestation_logs;
select * from iot_bin_sensors;

-- 11. Retrieve all reforestation logs that belong to the same site as the “Teak” plantation.
select * from reforestation_logs
where site_id in (select site_id from reforestation_logs where species='Teak' );

-- 12. Find IoT bin sensors where the fill level is greater than the average fill level.
select * from iot_bin_sensors where fill_level >
(select avg(fill_level) from iot_bin_sensors);

-- 13. List collection trucks that belong to the same site as “KL01-ECO-101.”
select * from collection_trucks where site_id = (
select site_id from collection_trucks where truck_number ="KL01-ECO-101");

-- 14. Retrieve waste transfer logs where the transferred weight is greater than the minimum weight recorded.
SELECT * 
FROM waste_transfer_logs
WHERE weight_tons > (
    SELECT MIN(weight_tons) 
    FROM waste_transfer_logs
);

-- 15. Find all sites from visitor_statistics where the total domestic visitors > foreign visitors.
select * from visitor_statistics where domestic_visitors > foreign_visitors ;


-- 16. List reforestation logs for sites where Neem trees were planted.
select * from reforestation_logs where site_id in (
select site_id from reforestation_logs where species ='Neem'
);

-- 17.  Find IoT bin sensors located at the same site as “Periyar Lake Entry.”
select * from iot_bin_sensors where 
site_id in (select site_id from iot_bin_sensors where bin_location ="Periyar Tribal Museum");

 -- 18 Retrieve all trucks whose capacity is greater than the average capacity across trucks.
 select * from collection_trucks where capacity_tons > (
 select avg(capacity_tons) from collection_trucks);

-- 19. Find waste transfer logs where the truck_id is linked to a site with an active truck.

select * from waste_transfer_logs
where truck_id in (select truck_id from collection_trucks where status='Active' );


