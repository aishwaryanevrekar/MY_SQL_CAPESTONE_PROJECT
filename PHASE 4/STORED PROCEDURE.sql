USE SQL_CAPESTONE_PROJECT ;

/*
DELIMITER //

CREATE PROCEDURE GetEmployeesByDepartment(IN dept_id INT)
BEGIN
    SELECT * FROM employees WHERE department_id = dept_id;
END //

DELIMITER ;
*/



### 1. `eco_sites`

-- 1. Procedure to list all eco sites.
delimiter //
create procedure list_eco_sites()
begin
select * from eco_sites ;
end //
delimiter ;

call list_eco_sites();

-- 2. Procedure to get eco site details by `site_id`.
delimiter //
create procedure list_eco_site_detials(in site int)
begin
select * from eco_sites 
where site_id =site;
end //
delimiter ;
call list_eco_site_detials(8);

-- 3. Procedure to find sites in a given state.
delimiter //
create procedure state_eco_site_detials(in state varchar(100))
begin
select * from eco_sites 
where state_region =state;
end //
delimiter ;
call state_eco_site_detials('Kerala');


-- 4. Procedure to count eco sites per region.
delimiter //
create procedure count_sites_per_region()
begin
    select state_region, count(*) as total_sites
    from eco_sites group by state_region;
end //
delimiter ;
call count_sites_per_region();
-- 5. Procedure to get top N largest eco sites by area.
delimiter //
create procedure top_sites_by_area(in n int)
begin
    select site_name, area_km2
    from eco_sites order by area_km2 desc limit n;
end //
delimiter ;
call top_sites_by_area(5);

### 2. `tribes`

-- 6. Procedure to list all tribes.
select * from tribes ;
DELIMITER //

CREATE PROCEDURE listalltribes()
BEGIN
    select * from tribes ;
END //

DELIMITER ;
call listalltribes();

-- 7. Procedure to get tribe details by `tribe_id`.
DELIMITER //

CREATE PROCEDURE listTRIBEbyID(in tribeID int)
BEGIN
    select * from tribes
    where tribe_id =tribeID;
END //

DELIMITER ;
call listTRIBEbyID(3);
-- 8. Procedure to count tribes per site.
DELIMITER //

CREATE PROCEDURE SP_COUNTTRIBE_BY_SITE(in siteIID int)
BEGIN
    select * from tribes
    where site_id =siteIID;
END //

DELIMITER ;
call SP_COUNTTRIBE_BY_SITE(18);


-- 9. Procedure to find tribes with population above X.
select * from tribes ;
delimiter //
create procedure populationTribeaboveX( IN population INT)
BEGIN
		select * from tribes
        WHERE population_estimate > population;
END //
delimiter ;

call populationTribeaboveX(1500);
-- 10. Procedure to get tribe names in a given state.

Delimiter //
create procedure tribe_name(in state varchar(255))
begin
		select group_concat(tribe_name separator ",")
        from tribes left join eco_sites using(site_id)
        where state_region =state;
end //
delimiter ;

call tribe_name('Kerala');


### 3. `cultural_assets`

-- 11. Procedure to list all cultural assets.
delimiter //
create procedure list_assets()
begin
    select * from cultural_assets;
end //
delimiter ;
call list_assets();

-- 12. Procedure to get cultural asset details by `asset_id`.
delimiter //
create procedure asset_details(in aid int)
begin
    select * from cultural_assets where asset_id = aid;
end //
delimiter ;
call asset_details(3);

-- 13. Procedure to count assets by type.
delimiter //
create procedure count_assets_by_type()
begin
    select asset_type, count(*) as total
    from cultural_assets group by asset_type;
end //
delimiter ;
call count_assets_by_type();
-- 14. Procedure to find longest asset description.
delimiter //
create procedure longest_asset_desc()
begin
    select * from cultural_assets
    order by length(description) desc limit 1;
end //
delimiter ;
-- 15. Procedure to count assets for a given tribe.
delimiter //
create procedure assets_by_tribe(in tid int)
begin
    select * from cultural_assets where tribe_id = tid;
end //
delimiter ;

### 4. `local_artisians`


-- 16. Procedure to list all artisans.
delimiter //
create procedure list_artisans()
begin
    select * from local_artisians;
end //
delimiter ;
call list_artisans();

-- 17. Procedure to get artisan details by `artist_id`.
delimiter //
create procedure artisan_details(in aid int)
begin
    select * from local_artisians where artist_id = aid;
end //
delimiter ;
call artisan_details(5);

-- 18. Procedure to count artisans by tribe.
delimiter //
create procedure artisans_count_by_tribe()
begin
    select tribe_id, count(*) as total
    from local_artisians group by tribe_id;
end //
delimiter ;
call artisans_count_by_tribe();

-- 19. Procedure to count artisans by gender.
delimiter //
create procedure artisans_count_by_gender()
begin
    select gender, count(*) as total
    from local_artisians group by gender;
end //
delimiter ;
call artisans_count_by_gender();

-- 20. Procedure to list artisans of a specific craft type.
delimiter //
create procedure artisans_by_craft(in craft varchar(100))
begin
    select * from local_artisians where craft_type = craft;
end //
delimiter ;
call artisans_by_craft('Weaving');


### 5. `cultural_workshops`

-- 21. Procedure to list all workshops.
delimiter //
create procedure list_workshops()
begin
    select * from cultural_workshops;
end //
delimiter ;
call list_workshops();
-- 22. Procedure to get workshop details by `c_id`.
delimiter //
create procedure workshop_details(in wid int)
begin
    select * from cultural_workshops where c_id = wid;
end //
delimiter ;

-- 23. Procedure to count workshops by type.
delimiter //
create procedure workshops_count_by_type()
begin
    select workshop_type, count(*) as total
    from cultural_workshops group by workshop_type;
end //
delimiter ;
-- 24. Procedure to list workshops by target audience.

delimiter //
create procedure workshops_by_audience(in audience varchar(100))
begin
    select * from cultural_workshops where target_audience = audience;
end //
delimiter ;

-- 25. Procedure to find top N workshops by rating.
delimiter //
create procedure top_workshops_by_rating(in n int)
begin
    select * from cultural_workshops
    order by rating desc limit n;
end //
delimiter ;

### 6. `visit_logs`

-- 26. Procedure to list all visit logs.
delimiter //
create procedure list_logs()
begin
    select * from visit_logs;
end //
delimiter ;
-- 27. Procedure to get visit log by `log_id`.

delimiter //
create procedure log_details(in lid int)
begin
    select * from visit_logs where log_id = lid;
end //
delimiter ;
-- 28. Procedure to count visits by site.
delimiter //
create procedure count_logs_by_site()
begin
    select site_id, count(*) as total
    from visit_logs group by site_id;
end //
delimiter ;

-- 29. Procedure to count visits by visitor name.
delimiter //
create procedure count_logs_by_visitor()
begin
    select visitor_name, count(*) as total
    from visit_logs group by visitor_name;
end //
delimiter ;

-- 30. Procedure to find latest N visit logs.
delimiter //
create procedure latest_logs(in n int)
begin
    select * from visit_logs order by visit_date desc limit n;
end //
delimiter ;

### 7. `booking_history`

-- 31. Procedure to list all bookings.

delimiter //
create procedure list_bookings()
begin
    select * from booking_history;
end //
delimiter ;
call list_bookings();

-- 32. Procedure to get booking details by `booking_id`.

delimiter //
create procedure booking_details(in bid int)
begin
    select * from booking_history where booking_id = bid;
end //
delimiter ;
call booking_details(1);

-- 33. Procedure to count bookings per site.

delimiter //
create procedure count_bookings_by_site()
begin
    select site_id, count(*) as total
    from booking_history group by site_id;
end //
delimiter ;
call count_bookings_by_site();

-- 34. Procedure to calculate total booking amount per site.

delimiter //
create procedure total_booking_amount_by_site()
begin
    select site_id, sum(total_amount) as total_amt
    from booking_history group by site_id;
end //
delimiter ;
call total_booking_amount_by_site();

-- 35. Procedure to find top N bookings by amount
delimiter //
create procedure top_bookings_by_amount(in n int)
begin
    select * from booking_history
    order by total_amount desc limit n;
end //
delimiter ;
call top_bookings_by_amount(5);

### 8. `conservation_areas`

-- 36. Procedure to list all conservation areas.
delimiter //
create procedure list_areas()
begin
    select * from conservation_areas;
end //
delimiter ;
call list_areas();

-- 37. Procedure to get conservation area by `area_id`.
delimiter //
create procedure area_details(in aid int)
begin
    select * from conservation_areas where area_id = aid;
end //
delimiter ;
call area_details(1);

-- 38. Procedure to count areas by protection level.
delimiter //
create procedure count_areas_by_protection()
begin
    select protection_level, count(*) as total
    from conservation_areas
    group by protection_level;
end //
delimiter ;
call count_areas_by_protection();

-- 39. Procedure to find largest conservation area.
delimiter //
create procedure largest_area()
begin
    select * from conservation_areas
    order by area_size_km2 desc limit 1;
end //
delimiter ;
call largest_area();

-- 40. Procedure to calculate average area size.
delimiter //
create procedure avg_area_size()
begin
    select avg(area_size_km2) as avg_size
    from conservation_areas;
end //
delimiter ;
call avg_area_size();


### 9. `collection_trucks`

-- 41. Procedure to list all trucks.
delimiter //
create procedure list_trucks()
begin
    select * from collection_trucks;
end //
delimiter ;
-- 42. Procedure to get truck details by `truck_id`.
delimiter //
create procedure truck_details(in tid int)
begin
    select * from collection_trucks where truck_id = tid;
end //
delimiter ;

delimiter //
create procedure count_trucks_by_site()
begin
    select site_id, count(*) as total
    from collection_trucks
    group by site_id;
end //
delimiter ;
call count_trucks_by_site();

-- 44. Procedure to find truck with maximum capacity.
delimiter //
create procedure max_capacity_truck()
begin
    select * from collection_trucks
    order by capacity desc limit 1;
end //
delimiter ;
-- 45. Procedure to calculate total truck capacity.
delimiter //
create procedure total_truck_capacity()
begin
    select sum(capacity) as total_capacity
    from collection_trucks;
end //
delimiter ;
### 10. `disposal_methods`

-- 46. Procedure to list all disposal methods
delimiter //
create procedure list_disposal_methods()
begin
    select * from disposal_methods;
end //
delimiter ;
call list_disposal_methods();

-- 47. Procedure to get method details by method_id
delimiter //
create procedure get_disposal_method(in mid int)
begin
    select * from disposal_methods where method_id = mid;
end //
delimiter ;
call get_disposal_method(2);

-- 48. Procedure to count methods by type
delimiter //
create procedure count_methods_by_type()
begin
    select method_name, count(*) as total
    from disposal_methods
    group by method_name;
end //
delimiter ;
call count_methods_by_type();

-- 49. Procedure to find methods missing description
delimiter //
create procedure disposal_methods_no_desc()
begin
    select * from disposal_methods where description is null;
end //
delimiter ;
call disposal_methods_no_desc();

-- 50. Procedure to list all unique method types
delimiter //
create procedure distinct_method_types()
begin
    select distinct method_type from disposal_methods;
end //
delimiter ;
call distinct_method_types();


### 11. `eco_guides`

-- 51. List all guides
delimiter //
create procedure list_guides()
begin
    select * from eco_guides;
end //
delimiter ;
call list_guides();

-- 52. Get guide details by guide_id
delimiter //
create procedure get_guide(in gid int)
begin
    select * from eco_guides where guide_id = gid;
end //
delimiter ;
call get_guide(3);

-- 53. Count guides per site
delimiter //
create procedure count_guides_by_site()
begin
    select site_id, count(*) as total
    from eco_guides
    group by site_id;
end //
delimiter ;
call count_guides_by_site();

-- 54. Find guide with highest rating
delimiter //
create procedure best_guide()
begin
    select * from eco_guides order by rating desc limit 1;
end //
delimiter ;
call best_guide();

-- 55. Calculate average guide duration
delimiter //
create procedure avg_guide_duration()
begin
    select avg(duration_hours) as avg_duration from eco_guides;
end //
delimiter ;
call avg_guide_duration();


### 12. `eco_lodges`

-- 56. List all lodges
delimiter //
create procedure list_lodges()
begin
    select * from eco_lodges;
end //
delimiter ;
call list_lodges();

-- 57. Get lodge details by lodge_id
delimiter //
create procedure get_lodge(in lid int)
begin
    select * from eco_lodges where lodge_id = lid;
end //
delimiter ;
call get_lodge(4);

-- 58. Count lodges per site
delimiter //
create procedure count_lodges_by_site()
begin
    select site_id, count(*) as total
    from eco_lodges
    group by site_id;
end //
delimiter ;
call count_lodges_by_site();

-- 59. Find lodge with max price
DROP PROCEDURE most_expensive_lodge;
delimiter //
create procedure most_expensive_lodge()
begin
    select * from eco_lodges order by price_per_night desc limit 1;
end //
delimiter ;
call most_expensive_lodge();

-- 60. Calculate total lodge revenue


delimiter //
create procedure total_lodge_revenue()
begin
    select sum(price_per_night) as total_revenue from eco_lodges;
end //
delimiter ;
call total_lodge_revenue();


### 13. `iot_bin_sensors`

-- 61. List all sensors
delimiter //
create procedure list_sensors()
begin
    select * from iot_bin_sensors;
end //
delimiter ;
call list_sensors();

-- 62. Get sensor details by sensor_id
delimiter //
create procedure get_sensor(in sid int)
begin
    select * from iot_bin_sensors where sensor_id = sid;
end //
delimiter ;
call get_sensor(10);

-- 63. Count sensors per site
delimiter //
create procedure count_sensors_by_site()
begin
    select site_id, count(*) as total
    from iot_bin_sensors
    group by site_id;
end //
delimiter ;
call count_sensors_by_site();

-- 64. Find sensor with max fill level
delimiter //
create procedure fullest_sensor()
begin
    select * from iot_bin_sensors order by fill_level desc limit 1;
end //
delimiter ;
call fullest_sensor();

-- 65. Calculate average fill level
delimiter //
create procedure avg_fill_level()
begin
    select avg(fill_level) as avg_fill from iot_bin_sensors;
end //
delimiter ;
call avg_fill_level();


### 14. `package_types`

-- 66. List all packages
delimiter //
create procedure list_packages()
begin
    select * from package_types;
end //
delimiter ;
call list_packages();

-- 67. Get package details by package_id
delimiter //
create procedure get_package(in pid int)
begin
    select * from package_types where package_id = pid;
end //
delimiter ;
call get_package(2);

-- 68. Count packages per type
drop procedure count_packages_by_type;
delimiter //
create procedure count_packages_by_type()
begin
    select package_category, count(*) as total
    from package_types
    group by package_category;
end //
delimiter ;
call count_packages_by_type();

-- 69. Find cheapest package
delimiter //
create procedure cheapest_package()
begin
    select * from package_category order by price asc limit 1;
end //
delimiter ;
call cheapest_package();

-- 70. Calculate average package price
delimiter //
create procedure avg_package_price()
begin
    select avg(price) as avg_price from package_types;
end //
delimiter ;
call avg_package_price();


### 15. `public_education_events`

-- 71. List all public education events
delimiter //
create procedure list_events()
begin
    select * from public_education_events;
end //
delimiter ;
call list_events();

-- 72. Get event details by event_id
delimiter //
create procedure get_event(in eid int)
begin
    select * from public_education_events where event_id = eid;
end //
delimiter ;
call get_event(5);

-- 73. Count events per type
delimiter //
create procedure count_events_by_type()
begin
    select event_type, count(*) as total
    from public_education_events
    group by event_type;
end //
delimiter ;
call count_events_by_type();

-- 74. Find top N events by feedback rating
drop procedure top_events_by_rating;
delimiter //
create procedure top_events_by_rating(in n int)
begin
    select * from public_education_events
    order by feedback_rating desc limit n;
end //
delimiter ;
call top_events_by_rating(3);

-- 75. Count events per season
delimiter //
create procedure count_events_by_season()
begin
    select season, count(*) as total
    from public_education_events
    group by season;
end //
delimiter ;
call count_events_by_season();


### 16. `recycling_centers`

-- 76. List all recycling centers
delimiter //
create procedure list_centers()
begin
    select * from recycling_centers;
end //
delimiter ;
call list_centers();

-- 77. Get center details by center_id
delimiter //
create procedure get_center(in cid int)
begin
    select * from recycling_centers where center_id = cid;
end //
delimiter ;
call get_center(2);

-- 78. Count centers per site
delimiter //
create procedure count_centers_by_site()
begin
    select site_id, count(*) as total
    from recycling_centers
    group by site_id;
end //
delimiter ;
call count_centers_by_site();

-- 79. Find center with max capacity
delimiter //
create procedure largest_center()
begin
    select * from recycling_centers order by capacity_kg desc limit 1;
end //
delimiter ;
call largest_center();

-- 80. Calculate total recycling capacity
delimiter //
create procedure total_capacity()
begin
    select sum(capacity_kg) as total_capacity from recycling_centers;
end //
delimiter ;
call total_capacity();


### 17. `reforestation_logs`

-- 81. List all reforestation logs
delimiter //
create procedure list_reforestation_logs()
begin
    select * from reforestation_logs;
end //
delimiter ;
call list_reforestation_logs();

-- 82. Get log details by log_id
delimiter //
create procedure get_reforestation_log(in lid int)
begin
    select * from reforestation_logs where log_id = lid;
end //
delimiter ;
call get_reforestation_log(3);

-- 83. Count logs per site
delimiter //
create procedure count_logs_by_site_reforest()
begin
    select site_id, count(*) as total
    from reforestation_logs
    group by site_id;
end //
delimiter ;
call count_logs_by_site_reforest();

-- 84. Find log with max tree count
delimiter //
create procedure max_tree_log()
begin
    select * from reforestation_logs order by trees_planted desc limit 1;
end //
delimiter ;
call max_tree_log();

-- 85. Count logs per year
delimiter //
create procedure count_logs_by_year()
begin
    select year, count(*) as total
    from reforestation_logs
    group by year;
end //
delimiter ;
call count_logs_by_year();


### 18. `tourist_feedback`

-- 86. List all tourist feedbacks
delimiter //
create procedure list_feedbacks()
begin
    select * from tourist_feedback;
end //
delimiter ;
call list_feedbacks();

-- 87. Get feedback by feedback_id
delimiter //
create procedure get_feedback(in fid int)
begin
    select * from tourist_feedback where feedback_id = fid;
end //
delimiter ;
call get_feedback(2);

-- 88. Count feedback by sentiment
delimiter //
create procedure count_feedback_by_sentiment()
begin
    select sentiment, count(*) as total
    from tourist_feedback
    group by sentiment;
end //
delimiter ;
call count_feedback_by_sentiment();

-- 89. Find longest feedback text
delimiter //
create procedure longest_feedback()
begin
    select feedback_id, feedback_text
    from tourist_feedback
    order by char_length(feedback_text) desc
    limit 1;
end //
delimiter ;
call longest_feedback();

-- 90. Count total recommended feedbacks
delimiter //
create procedure count_recommended_feedbacks()
begin
    select count(*) as total
    from tourist_feedback
    where recommended = 1;
end //
delimiter ;
call count_recommended_feedbacks();


### 19. `traditional_knowledge`
-- 91. List all practices
delimiter //
create procedure list_practicestraditional_knowledge()
begin
    select * from traditional_knowledge;
end //
delimiter ;
call list_practices();

-- 92. Get practice by know_id
delimiter //
create procedure get_practicetraditional_knowledge(in kid int)
begin
    select * from traditional_knowledge where know_id = kid;
end //
delimiter ;
call get_practicetraditional_knowledge(3);

-- 93. Count practices per tribe
delimiter //
create procedure count_practices_by_tribetraditional_knowledge()
begin
    select tribe_id, count(*) as total
    from traditional_knowledge
    group by tribe_id;
end //
delimiter ;
call count_practices_by_tribetraditional_knowledge();

-- 94. Find practice with longest name
delimiter //
create procedure longest_practice_nametraditional_knowledge()
begin
    select know_id, practice_name
    from traditional_knowledge
    order by char_length(practice_name) desc
    limit 1;
end //
delimiter ;
call longest_practice_nametraditional_knowledge();

-- 95. Calculate average benefit length
delimiter //
create procedure avg_benefit_lengthtraditional_knowledge()
begin
    select avg(char_length(eco_benefit)) as avg_len
    from traditional_knowledge;
end //
delimiter ;
call avg_benefit_lengthtraditional_knowledge();


### 20. `visitor_statistics`

-- 96. List all statistics
delimiter //
create procedure list_statistics()
begin
    select * from visitor_statistics;
end //
delimiter ;
call list_statistics();

-- 97. Get statistics by stat_id
delimiter //
create procedure get_statistics(in sid int)
begin
    select * from visitor_statistics where stat_id = sid;
end //
delimiter ;
call get_statistics(3);

-- 98. Count visits per year
drop procedure  count_visits_per_year;
delimiter //
create procedure count_visits_per_year()
begin
    select  year, count(*) as total
    from visitor_statistics
    group by year;
end //
delimiter ;
call count_visits_per_year();

-- 99. Calculate average visitors per site
drop procedure avg_visitors_per_site;
delimiter //
create procedure avg_visitors_per_site()
begin
    select site_id, avg(domestic_visitors + foreign_visitors) as avg_visitors
    from visitor_statistics
    group by site_id;
end //
delimiter ;
call avg_visitors_per_site();

-- 100. Find max visitors in a year
drop procedure max_visitors_year;
delimiter //
create procedure max_visitors_year()
begin
    select year, max(domestic_visitors + foreign_visitors) as max_visitors
    from visitor_statistics
    group by year
    order by max_visitors desc
    limit 1;
end //
delimiter ;
call max_visitors_year();


### 21. `waste_category`

-- 101. List all waste categories
delimiter //
create procedure list_waste_categories()
begin
    select * from waste_category;
end //
delimiter ;
call list_waste_categories();

-- 102. Get waste category by category_id
drop procedure get_waste_category;
delimiter //
create procedure get_waste_category(in cid int)
begin
    select * from waste_category where cat_id = cid;
end //
delimiter ;
call get_waste_category(2);

-- 103. Count categories by type
drop procedure count_categories_by_type;
delimiter //
create procedure count_categories_by_hazard_level()
begin
    select hazard_level, count(*) as total
    from waste_category
    group by hazard_level;
end //
delimiter ;
call count_categories_by_hazard_level();

-- 104. Find categories with missing description
delimiter //
create procedure categories_missing_description()
begin
    select * from waste_category
    where description is null;
end //
delimiter ;
call categories_missing_description();

-- 105. List unique waste types
drop procedure unique_color_code;
delimiter //
create procedure unique_color_code()
begin
    select distinct color_code
    from waste_category;
end //
delimiter ;
call unique_color_code();


### 22. `waste_items`
-- 106. List all waste items
delimiter //
create procedure list_waste_items()
begin
    select * from waste_items;
end //
delimiter ;
call list_waste_items();

-- 107. Get waste item by item_id
drop procedure get_waste_item;
delimiter //
create procedure get_waste_item(in iid int)
begin
    select * from waste_items where w_id = iid;
end //
delimiter ;
call get_waste_item(3);

-- 108. Count items per category
drop procedure count_items_by_category;
delimiter //
create procedure count_items_by_category()
begin
    select item_name, count(*) as total
    from waste_items
    group by item_name;
end //
delimiter ;
call count_items_by_category();

-- 109. Find item with max quantity
delimiter //
create procedure max_quantity_item()
begin
    select w_id, item_name, quantity_kg
    from waste_items
    order by quantity_kg desc
    limit 1;
end //
delimiter ;
call max_quantity_item();

-- 110. Calculate total waste quantity
delimiter //
create procedure total_waste_quantity()
begin
    select sum(quantity_kg) as total_quantity
    from waste_items;
end //
delimiter ;
call total_waste_quantity();


### 23. `waste_sources`

-- 111. List all waste sources
delimiter //
create procedure list_waste_sources()
begin
    select * from waste_sources;
end //
delimiter ;
call list_waste_sources();

-- 112. Get source details by source_id
drop procedure get_waste_source;
delimiter //
create procedure get_waste_source(in sid int)
begin
    select * from waste_sources where s_id = sid;
end //
delimiter ;
call get_waste_source(4);

-- 113. Count sources per type
delimiter //
create procedure count_sources_by_type()
begin
    select source_name, count(*) as total
    from waste_sources
    group by source_name;
end //
delimiter ;
call count_sources_by_type();

-- 114. Find source with active
delimiter //
create procedure active_source()
begin
    select s_id, source_name
    from waste_sources
    where active =1;
end //
delimiter ;
call active_source();

-- 115. Calculate adistinct frequency logged
delimiter //
create procedure w_source_frequency_logged()
begin
    select distinct frequency_logged 
    from waste_sources;
end //
delimiter ;
call w_source_frequency_logged();


### 24. `waste_transfer_logs`

-- 116. List all transfer logs
delimiter //
create procedure list_transfer_logs()
begin
    select * from waste_transfer_logs;
end //
delimiter ;
call list_transfer_logs();

-- 117. Get transfer log by transfer_id
delimiter //
create procedure get_transfer_log(in tid int)
begin
    select * from waste_transfer_logs where transfer_id = tid;
end //
delimiter ;
call get_transfer_log(3);

-- 118. Count transfers per site
delimiter //
create procedure count_transfers_by_site()
begin
    select site_id, count(*) as total
    from waste_transfer_logs
    group by site_id;
end //
delimiter ;
call count_transfers_by_site();

-- 119. Calculate total transferred weight
delimiter //
create procedure total_transferred_weight()
begin
    select sum(weight_tons) as total_weight
    from waste_transfer_logs;
end //
delimiter ;
call total_transferred_weight();

-- 120. Find latest transfer log
delimiter //
create procedure latest_transfer_log()
begin
    select * from waste_transfer_logs
    order by transfer_date desc
    limit 1;
end //
delimiter ;
call latest_transfer_log();


### 25. `youth_awareness_programs`

-- 121. List all programs
delimiter //
create procedure list_programs()
begin
    select * from youth_awareness_programs;
end //
delimiter ;
call list_programs();

-- 122. Get program details by program_id
drop procedure get_program;
delimiter //
create procedure get_program(in pId int)
begin
    select * from youth_awareness_programs where p_id = pId;
end //
delimiter ;
call get_program(5);

-- 123. Count programs per program type
delimiter //
create procedure count_programs_by_type()
begin
    select program_type, count(*) as total
    from youth_awareness_programs
    group by program_type;
end //
delimiter ;
call count_programs_by_type();

-- 124. Find program with highest feedback rating
delimiter //
create procedure top_rated_program()
begin
    select p_id, program_name, feedback_rating
    from youth_awareness_programs
    order by feedback_rating desc
    limit 1;
end //
delimiter ;
call top_rated_program();

-- 125. Count programs per season
delimiter //
create procedure count_programs_by_season()
begin
    select season, count(*) as total
    from youth_awareness_programs
    group by season;
end //
delimiter ;
call count_programs_by_season();


