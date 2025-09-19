USE SQL_CAPESTONE_PROJECT  ;

-- JOINS PART
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
-- (collection_trucks JOIN eco_sites JOIN tribes)

22. Display waste transfer logs with truck, site, center, and transfer date.  
-- (waste_transfer_logs JOIN collection_trucks JOIN eco_sites JOIN recycling_centers)

23. List all tribes with their traditional knowledge practices and benefits.  
-- (tribes JOIN traditional_knowledge)

24. Show all package bookings with the relevant eco-site and total amount.  
-- (booking_history JOIN eco_sites JOIN package_types)

25. Show feedback for each booking with site and package details.  
-- (tourist_feedback JOIN booking_history JOIN eco_sites JOIN package_types)

26. List all workshops conducted at sites with target audience and site region.  
-- (cultural_workshops JOIN eco_sites)

27. Show eco-sites with the number of associated conservation areas.  
-- (eco_sites LEFT JOIN conservation_areas)

28. List all tribes, their population, and the number of artisans belonging to each.  
-- (tribes LEFT JOIN local_artisians)

29. Display all waste categories and the number of waste items logged per category.  
-- (waste_category LEFT JOIN waste_items)

30. Show all reforestation logs with the name of the tribe involved.  
-- (reforestation_logs JOIN tribes)

31. List all booking histories with the number of nights and the site region.  
-- (booking_history JOIN eco_lodges JOIN eco_sites)

32. Show workshops along with the tribe responsible, if any (via site-tribe link).  
-- (cultural_workshops JOIN eco_sites JOIN tribes)

33. Display all youth programs with the tribe and eco-site.  
-- (youth_awareness_programs JOIN eco_sites JOIN tribes)

34. Show all eco-sites with their total revenue (from visitor_statistics).  
-- (eco_sites JOIN visitor_statistics)

35. List every conservation area with the tribe name (if associated via site).  
-- (conservation_areas JOIN eco_sites JOIN tribes)

36. Show all eco-sites with number of unique tourist visitors (from visit_logs).  
-- (eco_sites JOIN visit_logs)

37. Display all booking histories with associated waste generated (join on site).  
-- (booking_history JOIN eco_sites JOIN waste_items)

38. List all workshops and the artisans who conduct them (via site and tribe).  
-- (cultural_workshops JOIN eco_sites JOIN tribes JOIN local_artisians)

39. Show all eco-lodges and the conservation area they are closest to (join on site).  
-- (eco_lodges JOIN conservation_areas)

40. Display all cultural assets with the local artisans who produce them (via tribe).  
-- (cultural_assets JOIN tribes JOIN local_artisians)

41. List all waste transfers with the name of the recycling center and the site.  
-- (waste_transfer_logs JOIN recycling_centers JOIN eco_sites)

42. Show all eco-sites with the total number of reforestation trees planted.  
-- (eco_sites JOIN reforestation_logs)

43. List all IoT bin sensors at sites with waste items logged by tribe.  
-- (iot_bin_sensors JOIN eco_sites JOIN tribes JOIN waste_items)

44. Display all eco-guides programs with the tribe providing the guides (via site).  
-- (eco_guides JOIN eco_sites JOIN tribes)

45. List all booking histories along with feedback and the reforestation activity at the same site.  
-- (booking_history JOIN tourist_feedback JOIN reforestation_logs)

46. Show all workshops, the site, and feedback from visitors who attended (via visit_logs).  
-- (cultural_workshops JOIN eco_sites JOIN visit_logs)

47. Display all waste items with the disposal method used (via category or other logic).  
-- (waste_items JOIN waste_category JOIN disposal_methods)

48. Show all recycling centers and the trucks that delivered waste to them.  
-- (recycling_centers JOIN waste_transfer_logs JOIN collection_trucks)

49. List all sites, the number of unique tribes, and number of workshops conducted.  
-- (eco_sites LEFT JOIN tribes LEFT JOIN cultural_workshops)

50. Display all site bookings with visitor statistics for that year (join on site and year).  
-- (booking_history JOIN eco_sites JOIN visitor_statistics)