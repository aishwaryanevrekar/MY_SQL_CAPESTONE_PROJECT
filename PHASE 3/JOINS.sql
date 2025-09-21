USE SQL_CAPESTONE_PROJECT ;

-- JOINS PART for all tables 
-- 1. List all eco-sites and the tribes associated with each site.
select site_name,state_region,type,tribe_name,population_estimate FROM ECO_SITES e
left join tribes t on e.site_id =t.site_id;

-- 2. Show all tourist visits with eco-site name and state/region.

with eco_sites1 as (
select site_id,site_name,state_region from eco_sites
)
select * from visit_logs l left join eco_sites1 using (site_id);

-- 3. Display conservation areas with their eco-site and region.


with eco_sites1 as (
select site_id,site_name,state_region from eco_sites
)
select * from conservation_areas  left join eco_sites1 using (site_id);


-- 4. List cultural assets with tribe name and eco-site.


with tribe_cultural as (
select tribe_id,site_name,state_region from tribes left join eco_sites using (site_id)
)
select * from cultural_assets c left join tribe_cultural t on c.tribe_id = t.tribe_id;

-- 5.Show local artisans, their craft, tribe, and eco-site. 

with tribe_cultural as (
select tribe_id,site_name,state_region from tribes left join eco_sites using (site_id)
)
select artist_id,name,craft_type,gender,site_name,state_region
 from local_artisians l left join tribe_cultural t on l.tribe_id = t.tribe_id;


-- 6. List traditional practices, tribe, eco-site, and eco-benefit. 


with tribe_cultural as (
select tribe_id,tribe_name,site_name,state_region from tribes left join eco_sites using (site_id)
)
select practice_name,eco_benefit,site_name,state_region,tribe_name from traditional_knowledge left join tribe_cultural using (tribe_id);

-- 7.  cultural workshops with site name and state

select c_id,workshop_name,site_name,state_region,workshop_type from cultural_workshops left join eco_sites on cultural_workshops.site_id =eco_sites.site_id;

-- 8. eco-guides programs with eco-site and region.

select * from eco_guides inner join eco_sites using (site_id);

-- 9.  youth awareness programs with eco-site and target group.

select p_id,program_name,target_group,state_region from youth_awareness_programs left join eco_sites using (site_id);

-- 10.  public education events with eco-site and region.

select event_name,description,season,audience,site_name,state_region from public_education_events left join eco_sites using (site_id);

-- 11. List eco-lodges with site name, capacity, and price per night.  

select lodge_name,price_per_night ,capacity,site_name,state_region  from eco_lodges left join eco_sites using (site_id);

-- 12. Display booking histories with visitor name, lodge name, and package name.  


select visitor_name,lodge_name,package_name from booking_history 
left join eco_lodges using (lodge_id)
left join package_types using ( package_id);

-- 13. Show package types with eco-site name and highlights.  

select package_name,duration_days,highlights , site_name,state_region  from package_types left join eco_sites using (site_id);

-- 14. List tourist feedback with visitor name, lodge, and eco-site.  
-- (tourist_feedback JOIN booking_history JOIN eco_lodges JOIN eco_sites)
select feedback_date,feedback_text,sentiment,tourist_feedback.rating,visitor_name,checkin_date,checkout_date,special_requests,lodge_name,lodge_type,facilities,
site_name,state_region
from tourist_feedback left join booking_history using (booking_id)
left join eco_lodges using(lodge_id)
left join eco_sites on eco_lodges.site_id=eco_sites.site_id;


-- 15. List waste items with site name, tribe, and waste category.  

with tribe_sites as (
select t.tribe_id, site_name,state_region,t.tribe_name from tribes t
left join eco_sites  on t.site_id =eco_sites.site_id
)
select item_name,quantity_kg,date_logged,status,tribe_name,site_name from waste_items left join tribe_sites using (tribe_id);

-- 16. Show waste sources with source name, eco-site, and tribe.  

select source_name,description,contact_person,tribe_name,site_name from waste_sources w
left join tribes t on w.tribe_id=t.tribe_id
left join eco_sites s on w.site_id =s.site_id;

-- 17. Display recycling centers with eco-site name and location.  

select center_name,accepted_waste,site_name,state_region from recycling_centers left join eco_sites using (site_id);

-- 18. List visitor statistics with site name, tribe, and year.  

select stat_id,domestic_visitors,foreign_visitors,tribe_name,year,site_name from visitor_statistics
left join tribes using (tribe_id)
left join eco_sites on visitor_statistics.site_id=eco_sites.site_id;

-- 19. Show reforestation logs with site, tribe, year, and species.  

select year,species,trees_planted,survival_rate_pct,site_name,tribe_name from reforestation_logs r
left join tribes t on r.tribe_id =t.tribe_id
left join eco_sites e on r.site_id =e.site_id;

-- 20. List IoT bin sensors with location, fill level, site, and tribe.  


select bin_location,fill_level,bin_capacity_kg,site_name,tribe_name from iot_bin_sensors i 
left join tribes t on i.tribe_id =t.tribe_id
left join eco_sites e on i.site_id =e.site_id;

-- 21. Show collection trucks with truck number, status, site, and tribe.  

select truck_number,status,site_name,tribe_name from collection_trucks c
left join tribes t on c.tribe_id =t.tribe_id
left join eco_sites e on c.site_id=e.site_id ;

-- 22. Display waste transfer logs with truck, site, center, and transfer date.  

with trucks_eco_recycle as (
select truck_id,truck_number,site_name,center_name from collection_trucks c
inner join eco_sites e on c.site_id=e.site_id
inner join recycling_centers r on e.site_id=r.site_id
) 
select transfer_id,weight_tons,transfer_status,truck_number,site_name,center_name 
from waste_transfer_logs w
left join trucks_eco_recycle t on  w.truck_id=t.truck_id ;

-- 23. List all tribes with their traditional knowledge practices and benefits.  

select tribe_name,roles,population_estimate ,practice_name,eco_benefit from tribes
inner join traditional_knowledge
using (tribe_id);

-- 24.  Show eco-sites with the number of associated conservation areas.  

select site_name,area_name as conservation_area from eco_sites 
left join conservation_areas using (site_id);

-- 25 . List all tribes, their population, and the number of artisans belonging to each.  

select * from tribes  left join local_artisians using (tribe_id);

-- 26. . Display all waste categories and the number of waste items logged per category.  

select * from waste_category left join waste_items using (cat_id);

-- 27. Show all reforestation logs with the name of the tribe involved.  

select trees_planted,species,area_hectares,survival_rate_pct,tribe_name 
from reforestation_logs 
left join tribes using (tribe_id);

-- 28. List all booking histories with the number of nights and the site region.  


select visitor_name,checkin_date,checkout_date,total_amount,site_name,lodge_name
from booking_history 
right join eco_lodges on booking_history.lodge_id = eco_lodges.lodge_id
right join eco_sites on booking_history.site_id = eco_sites.site_id;

-- 29.  Show workshops along with the tribe responsible, if any (via site-tribe link).  

SELECT cw.workshop_name, es.site_name, t.tribe_name
FROM cultural_workshops cw
INNER JOIN eco_sites es ON cw.site_id = es.site_id
LEFT JOIN tribes t ON es.site_id = t.site_id;

-- 30 Display all youth programs with the tribe and eco-site.  

SELECT yp.program_name, es.site_name, t.tribe_name
FROM youth_awareness_programs yp
INNER JOIN eco_sites es ON yp.site_id = es.site_id
LEFT JOIN tribes t ON es.site_id = t.site_id;

-- 31 Show all eco-sites with their total revenue (from visitor_statistics)
  
  SELECT es.site_name, vs.year, vs.total_revenue
FROM eco_sites es
INNER JOIN visitor_statistics vs ON es.site_id = vs.site_id;

-- 32. List every conservation area with the tribe name (from site)
SELECT ca.area_name, es.site_name, t.tribe_name
FROM conservation_areas ca
INNER JOIN eco_sites es ON ca.site_id = es.site_id
LEFT JOIN tribes t ON es.site_id = t.site_id;

-- 33. Show all eco-sites with number of unique tourist visitors (from visit_logs).  
SELECT es.site_name, COUNT(DISTINCT vl.visitor_name) AS unique_visitors
FROM eco_sites es
RIGHT JOIN visit_logs vl ON es.site_id = vl.site_id
GROUP BY es.site_name;

-- 34 Display all booking histories with associated waste generated join on site
select * from booking_history ; 
SELECT bh.visitor_name, es.site_name, wi.item_name, wi.quantity_kg
FROM booking_history bh
INNER JOIN eco_sites es ON bh.site_id = es.site_id
LEFT JOIN waste_items wi ON es.site_id = wi.site_id;

-- 35  List all workshops and the artisans who conduct them (via site and tribe).  

SELECT cw.workshop_name, es.site_name, t.tribe_name, la.name AS artisan_name, la.craft_type
FROM cultural_workshops cw
INNER JOIN eco_sites es ON cw.site_id = es.site_id
INNER JOIN tribes t ON es.site_id = t.site_id
INNER JOIN local_artisians la ON t.tribe_id = la.tribe_id;

-- 36 Show all eco-lodges and the conservation area they are closest to (join on site).

SELECT el.lodge_name, ca.area_name, el.site_id
FROM eco_lodges el
LEFT JOIN conservation_areas ca ON el.site_id = ca.site_id;

-- 37 Display all cultural assets with the local artisans who produce them 
SELECT ca.asset_type, ca.description, t.tribe_name, la.name AS artisan_name, la.craft_type
FROM cultural_assets ca
INNER JOIN tribes t ON ca.tribe_id = t.tribe_id
INNER JOIN local_artisians la ON t.tribe_id = la.tribe_id;

-- 38 List all waste transfers with the name of the recycling center and the site.

SELECT wt.transfer_id, rc.center_name, es.site_name, wt.transfer_date, wt.weight_tons
FROM waste_transfer_logs wt
INNER JOIN recycling_centers rc ON wt.center_id = rc.center_id
INNER JOIN eco_sites es ON wt.site_id = es.site_id;

-- 39 Show all eco-sites with the total number of reforestation trees planted.
SELECT es.site_name, SUM(rl.trees_planted) AS total_trees
FROM eco_sites es
LEFT JOIN reforestation_logs rl ON es.site_id = rl.site_id
GROUP BY es.site_name;

-- 40 List all IoT bin sensors at sites with waste items logged by tribe.

select * from iot_bin_sensors ; 
select * from waste_items ;
SELECT ibs.bin_location, es.site_name, t.tribe_name, wi.item_name, wi.quantity_kg
FROM iot_bin_sensors ibs
INNER JOIN eco_sites es ON ibs.site_id = es.site_id
INNER JOIN tribes t ON ibs.tribe_id = t.tribe_id
LEFT JOIN waste_items wi ON ibs.site_id = wi.site_id AND ibs.tribe_id = wi.tribe_id;

-- 41. Display all eco-guides programs with the tribe providing the guides .

SELECT eg.guide_program, es.site_name, t.tribe_name
FROM eco_guides eg
INNER JOIN eco_sites es ON eg.site_id = es.site_id
LEFT JOIN tribes t ON es.site_id = t.site_id;

-- 42. List all booking histories along with feedback and the reforestation activity at the same site.

SELECT bh.visitor_name, tf.feedback_text, rl.year, rl.trees_planted, rl.species
FROM booking_history bh
INNER JOIN tourist_feedback tf ON bh.booking_id = tf.booking_id
LEFT JOIN reforestation_logs rl ON bh.site_id = rl.site_id;

-- 43. Show all workshops, the site, and feedback from visitors who attended (via visit_logs).

SELECT cw.workshop_name, es.site_name, vl.visitor_name, vl.feedback
FROM cultural_workshops cw
INNER JOIN eco_sites es ON cw.site_id = es.site_id
LEFT JOIN visit_logs vl ON cw.site_id = vl.site_id;

-- 44.  Display all waste items with the disposal method used (via category or other logic).

SELECT wi.item_name, wc.category_name, dm.method_name
FROM waste_items wi
INNER JOIN waste_category wc ON wi.cat_id = wc.cat_id
LEFT JOIN disposal_methods dm ON wc.category_name = dm.method_name;

-- 45. Show all recycling centers and the trucks that delivered waste to them.

SELECT rc.center_name, ct.truck_number, wt.transfer_date, wt.weight_tons
FROM recycling_centers rc
INNER JOIN waste_transfer_logs wt ON rc.center_id = wt.center_id
INNER JOIN collection_trucks ct ON wt.truck_id = ct.truck_id;

-- 46. List all sites, the number of unique tribes, and number of workshops conducted.

SELECT es.site_name, COUNT(DISTINCT t.tribe_id) AS tribe_count, COUNT(DISTINCT cw.c_id) AS workshop_count
FROM eco_sites es
LEFT JOIN tribes t ON es.site_id = t.site_id
LEFT JOIN cultural_workshops cw ON es.site_id = cw.site_id
GROUP BY es.site_name;

-- 47. Display all site bookings with visitor statistics for that year (join on site and year).

SELECT bh.visitor_name, es.site_name, bh.checkin_date, vs.year, vs.domestic_visitors, vs.foreign_visitors, vs.total_revenue
FROM booking_history bh
INNER JOIN eco_sites es ON bh.site_id = es.site_id
LEFT JOIN visitor_statistics vs ON bh.site_id = vs.site_id AND YEAR(bh.checkin_date) = vs.year;


