USE SQL_CAPESTONE_PROJECT ;
-- 1.
CREATE VIEW  eco_sites_view as 
select * from eco_sites;

select * from eco_sites_view;
-- 2. 
CREATE VIEW  eco_sites_tribe_name as 
select tribe_name,site_name,state_region from tribes
inner join eco_sites using (site_id);
select * from eco_sites_tribe_name;

-- 3.  tribes
create view whole_tribes as
select * from tribes ;

DROP view eco_sites_view ;
drop view eco_sites_tribe_name;
drop view whole_tribes;

-- 1. View for all eco sites
CREATE VIEW v_all_eco_sites AS
select * from eco_sites ;
SELECT * FROM v_all_eco_sites;

-- 2. View for site names and regions
CREATE VIEW v_site_names_regions AS
SELECT site_name, state_region FROM eco_sites;

-- 3. View for total eco sites count
CREATE VIEW v_count_eco_sites AS
SELECT COUNT(*) AS total_sites FROM eco_sites;


-- 4. View for unique region count
CREATE VIEW v_unique_regions_count AS
SELECT COUNT(DISTINCT state_region) AS region_count FROM eco_sites;

-- 5. View for sites in Kerala
CREATE VIEW v_sites_kerala AS
SELECT * FROM eco_sites WHERE state_region = 'Kerala';

-- 6. View for sites with area > 100 sq km
CREATE VIEW v_sites_area_over_100 AS
SELECT site_name FROM eco_sites inner join conservation_areas using(site_id)
 WHERE area_size_km2 > 100;

-- 7. View for smallest eco site area
CREATE VIEW v_smallest_site_area AS
SELECT site_name FROM eco_sites inner join conservation_areas using(site_id)
 WHERE area_size_km2 = (
 select min(area_size_km2) from conservation_areas
 );

-- 8. View for largest eco site area
CREATE VIEW v_largest_site_area AS
SELECT site_name FROM eco_sites inner join conservation_areas using(site_id)
 WHERE area_size_km2 = (
 select max(area_size_km2) from conservation_areas
 );

-- 9. View for average eco site area
CREATE VIEW v_avg_site_area AS
SELECT site_name FROM eco_sites inner join conservation_areas using(site_id)
 WHERE area_size_km2 > (
 select avg(area_size_km2) from conservation_areas
 );

-- 10. View for total eco site area -- pending 
CREATE VIEW v_total_site_area AS
SELECT SUM(area_km2) AS total_area FROM eco_sites_view;

-- 11. View for eco sites ordered by name
CREATE VIEW v_sites_order_name AS
SELECT * FROM eco_sites ORDER BY site_name;

-- 12. View for eco sites ordered by area descending
CREATE VIEW v_sites_order_area_desc AS
SELECT site_name FROM eco_sites inner join conservation_areas using(site_id) 
ORDER BY area_size_km2 DESC;

-- 13. View for top 5 largest sites by len_name
CREATE VIEW v_top5_sites_area AS
SELECT * FROM eco_sites ORDER BY len_site_name DESC LIMIT 5;

-- 14. View for southern states sites
CREATE VIEW v_southern_sites AS
SELECT * FROM eco_sites WHERE state_region IN ('Kerala','Tamil Nadu','Karnataka');

-- TRIBES : 15 - 25
CREATE VIEW v_all_tribes AS 
SELECT * FROM tribes; -- 15

CREATE VIEW v_count_tribes AS 
SELECT COUNT(*) AS total FROM tribes; -- 16

CREATE VIEW v_distinct_tribes AS
 SELECT DISTINCT tribe_name FROM tribes; -- 17
 
CREATE VIEW v_tribes_pop_gt1000 AS
 SELECT * FROM tribes WHERE population > 1000; -- 18
 
CREATE VIEW v_smallest_tribe AS
 SELECT * FROM tribes ORDER BY population ASC LIMIT 1; -- 19
 
CREATE VIEW v_largest_tribe AS 
SELECT * FROM tribes ORDER BY population DESC LIMIT 1; -- 20

CREATE VIEW v_avg_tribe_pop AS SELECT AVG(population) AS avg_pop FROM tribes; -- 21

CREATE VIEW v_total_tribe_pop AS SELECT SUM(population) AS total_pop FROM tribes; -- 22

CREATE VIEW v_tribes_by_site AS SELECT site_id, COUNT(*) AS total FROM tribes GROUP BY site_id; -- 23

CREATE VIEW v_max_tribes_per_site AS SELECT site_id, COUNT(*) AS cnt FROM tribes GROUP BY site_id ORDER BY cnt DESC LIMIT 1; -- 24

CREATE VIEW v_min_tribes_per_site AS SELECT site_id, COUNT(*) AS cnt FROM tribes GROUP BY site_id ORDER BY cnt ASC LIMIT 1; -- 25

-- CULTURAL ASSETS - 26- 35

select * FROM CULTURAL_ASSETS ;
CREATE VIEW v_all_assets AS SELECT * FROM cultural_assets; -- 26
CREATE VIEW v_count_assets AS SELECT COUNT(*) AS total FROM cultural_assets; -- 27
CREATE VIEW v_asset_types AS SELECT DISTINCT asset_type FROM cultural_assets; -- 28
CREATE VIEW v_assets_by_tribe AS SELECT tribe_id, COUNT(*) AS total FROM cultural_assets GROUP BY tribe_id; -- 29
CREATE VIEW v_longest_asset_desc AS SELECT asset_id, asset_type FROM cultural_assets ORDER BY LENGTH(asset_type) DESC LIMIT 1; -- 30
CREATE VIEW v_shortest_asset_desc AS SELECT asset_id, asset_type FROM cultural_assets ORDER BY LENGTH(asset_type) ASC LIMIT 1; -- 31
CREATE VIEW v_avg_asset_desc_len AS SELECT AVG(CHAR_LENGTH(asset_type)) AS avg_len FROM cultural_assets; -- 32
CREATE VIEW v_asset_word_count AS SELECT asset_id, (LENGTH(asset_type)-LENGTH(REPLACE(asset_type,' ',''))+1) AS word_count FROM cultural_assets; -- 33
CREATE VIEW v_assets_missing_desc AS SELECT * FROM cultural_assets WHERE asset_type IS NULL; -- 34
CREATE VIEW v_assets_by_type AS SELECT asset_type, COUNT(*) AS total FROM cultural_assets GROUP BY asset_type; -- 35

-- ARTISIANS -36 -45

CREATE VIEW v_all_artisans AS SELECT * FROM local_artisians; -- 36
CREATE VIEW v_count_artisans AS SELECT COUNT(*) AS total FROM local_artisians; -- 37
CREATE VIEW v_distinct_crafts AS SELECT DISTINCT craft_type FROM local_artisians; -- 38
CREATE VIEW v_artisans_by_tribe AS SELECT tribe_id, COUNT(*) AS total FROM local_artisians GROUP BY tribe_id; -- 39
CREATE VIEW v_longest_artisan_name AS SELECT artist_id, name FROM local_artisians ORDER BY LENGTH(name) DESC LIMIT 1; -- 40
CREATE VIEW v_shortest_artisan_name AS SELECT artist_id, name FROM local_artisians ORDER BY LENGTH(name) ASC LIMIT 1; -- 41
CREATE VIEW v_avg_name_len AS SELECT AVG(CHAR_LENGTH(name)) AS avg_len FROM local_artisians; -- 42
CREATE VIEW v_avg_craft_len AS SELECT AVG(CHAR_LENGTH(craft_type)) AS avg_len FROM local_artisians; -- 43
CREATE VIEW v_female_artisans AS SELECT COUNT(*) AS total FROM local_artisians WHERE gender='Female'; -- 44
CREATE VIEW v_male_artisans AS SELECT COUNT(*) AS total FROM local_artisians WHERE gender='Male'; -- 45


-- cultural workshops 56- 65

SELECT * FROM cultural_workshops;

CREATE VIEW v_all_workshops AS SELECT * FROM cultural_workshops; -- 56
CREATE VIEW v_count_workshops AS SELECT COUNT(*) AS total FROM cultural_workshops; -- 57
CREATE VIEW v_distinct_workshop_types AS SELECT DISTINCT workshop_type FROM cultural_workshops; -- 58

-- 59. Workshops grouped by type
CREATE VIEW v_workshops_by_type AS
SELECT workshop_type, COUNT(*) AS total
FROM cultural_workshops
GROUP BY workshop_type;

-- 60. Distinct audiences
CREATE VIEW v_distinct_audiences AS
SELECT DISTINCT target_audience FROM cultural_workshops;

-- 61. Workshops grouped by audience
CREATE VIEW v_workshops_by_audience AS
SELECT target_audience, COUNT(*) AS total
FROM cultural_workshops
GROUP BY target_audience;

-- 62. Longest workshop description
CREATE VIEW v_longest_workshop_desc AS
SELECT c_id, workshop_name, description
FROM cultural_workshops
ORDER BY CHAR_LENGTH(description) DESC
LIMIT 1;

-- 63. Shortest workshop description
CREATE VIEW v_shortest_workshop_desc AS
SELECT c_id, workshop_name, description
FROM cultural_workshops
ORDER BY CHAR_LENGTH(description) ASC
LIMIT 1;

-- 64. Average description length
CREATE VIEW v_avg_workshop_desc_len AS
SELECT AVG(CHAR_LENGTH(description)) AS avg_len
FROM cultural_workshops;

-- 65. Workshops missing description
CREATE VIEW v_workshops_no_desc AS
SELECT * FROM cultural_workshops
WHERE description IS NULL;


--  VISTOR LOGS - 65 TO 80
CREATE VIEW v_all_logs AS SELECT * FROM visit_logs; -- 66
CREATE VIEW v_count_logs AS SELECT COUNT(*) AS total FROM visit_logs; -- 67
CREATE VIEW v_earliest_visit AS SELECT * FROM visit_logs ORDER BY visit_date ASC LIMIT 1; -- 68
CREATE VIEW v_latest_visit AS SELECT * FROM visit_logs ORDER BY visit_date DESC LIMIT 1; -- 69
CREATE VIEW v_avg_feedback_len AS SELECT AVG(CHAR_LENGTH(feedback)) AS avg_len FROM visit_logs; -- 70

CREATE VIEW v_logs_no_feedback AS SELECT * FROM visit_logs WHERE feedback IS NULL; -- 71
CREATE VIEW v_logs_with_feedback AS SELECT * FROM visit_logs WHERE feedback IS NOT NULL; -- 72
CREATE VIEW v_feedback_count AS SELECT COUNT(feedback) AS total FROM visit_logs; -- 73
CREATE VIEW v_feedback_length_per_log AS SELECT log_id, CHAR_LENGTH(feedback) AS length FROM visit_logs; -- 74
CREATE VIEW v_recent5_logs AS SELECT * FROM visit_logs ORDER BY visit_date DESC LIMIT 5; -- 75
CREATE VIEW v_oldest5_logs AS SELECT * FROM visit_logs ORDER BY visit_date ASC LIMIT 5; -- 76

CREATE VIEW v_logs_by_visitor AS SELECT visitor_name, COUNT(*) AS total FROM visit_logs GROUP BY visitor_name; -- 77
CREATE VIEW v_logs_by_site AS SELECT site_id, COUNT(*) AS total FROM visit_logs GROUP BY site_id; -- 78
CREATE VIEW v_longest_feedback AS SELECT log_id, feedback FROM visit_logs ORDER BY CHAR_LENGTH(feedback) DESC LIMIT 1; -- 79
CREATE VIEW v_shortest_feedback AS SELECT log_id, feedback FROM visit_logs ORDER BY CHAR_LENGTH(feedback) ASC LIMIT 1; -- 80

-- BOOKING HISTORY  81-92
CREATE VIEW v_all_bookings AS SELECT * FROM booking_history; -- 81
CREATE VIEW v_count_bookings AS SELECT COUNT(*) AS total FROM booking_history; -- 82
CREATE VIEW v_latest_booking AS SELECT * FROM booking_history ORDER BY checkin_date DESC LIMIT 1; -- 83
CREATE VIEW v_earliest_booking AS SELECT * FROM booking_history ORDER BY checkin_date ASC LIMIT 1; -- 84
CREATE VIEW v_bookings_by_site AS SELECT site_id, COUNT(*) AS total FROM booking_history GROUP BY site_id; -- 85

CREATE VIEW v_bookings_by_package AS SELECT package_id, COUNT(*) AS total FROM booking_history GROUP BY package_id; -- 86
CREATE VIEW v_avg_booking_amount AS SELECT AVG(total_amount) AS avg_amt FROM booking_history; -- 87
CREATE VIEW v_total_booking_amount AS SELECT SUM(total_amount) AS total_amt FROM booking_history; -- 88
CREATE VIEW v_max_booking AS SELECT * FROM booking_history ORDER BY total_amount DESC LIMIT 1; -- 89
CREATE VIEW v_min_booking AS SELECT * FROM booking_history ORDER BY total_amount ASC LIMIT 1; -- 90



CREATE VIEW v_top5_bookings AS SELECT * FROM booking_history ORDER BY total_amount DESC LIMIT 5; -- 91
CREATE VIEW v_bottom5_bookings AS SELECT * FROM booking_history ORDER BY total_amount ASC LIMIT 5; -- 92



-- CONSERVATION AREAS (93–102)

CREATE VIEW v_all_areas AS SELECT * FROM conservation_areas; -- 93
CREATE VIEW v_count_areas AS SELECT COUNT(*) AS total FROM conservation_areas; -- 94
CREATE VIEW v_largest_area AS SELECT * FROM conservation_areas ORDER BY area_size_km2 DESC LIMIT 1; -- 95
CREATE VIEW v_smallest_area AS SELECT * FROM conservation_areas ORDER BY area_size_km2 ASC LIMIT 1; -- 96
CREATE VIEW v_avg_area_size AS SELECT AVG(area_size_km2) AS avg_size FROM conservation_areas; -- 97
CREATE VIEW v_total_area_size AS SELECT SUM(area_size_km2) AS total_size FROM conservation_areas; -- 98
CREATE VIEW v_area_types AS SELECT DISTINCT protection_level FROM conservation_areas; -- 99
CREATE VIEW v_area_by_type AS SELECT protection_level, COUNT(*) AS total FROM conservation_areas GROUP BY protection_level; -- 100
CREATE VIEW v_latest_area AS SELECT * FROM conservation_areas ORDER BY area_id DESC LIMIT 1; -- 101
CREATE VIEW v_shortest_area_name AS SELECT * FROM conservation_areas ORDER BY LENGTH(area_name) ASC LIMIT 1; -- 102

-- COLLECTION TRUCKS 103 - 112
SELECT * FROM collection_trucks;
CREATE VIEW v_all_trucks AS SELECT * FROM collection_trucks; -- 103
CREATE VIEW v_count_trucks AS SELECT COUNT(*) AS total FROM collection_trucks; -- 104
CREATE VIEW v_trucks_by_status AS SELECT *  FROM collection_trucks where status='Active'; -- 105
CREATE VIEW v_latest_truck AS SELECT * FROM collection_trucks ORDER BY truck_id DESC LIMIT 1; -- 106
CREATE VIEW v_oldest_truck AS SELECT * FROM collection_trucks ORDER BY truck_id ASC LIMIT 1; -- 107
CREATE VIEW v_truck_capacity_max AS SELECT * FROM collection_trucks ORDER BY capacity DESC LIMIT 1; -- 108
CREATE VIEW v_truck_capacity_min AS SELECT * FROM collection_trucks ORDER BY capacity ASC LIMIT 1; -- 109
CREATE VIEW v_avg_truck_capacity AS SELECT AVG(capacity) AS avg_cap FROM collection_trucks; -- 110
CREATE VIEW v_total_truck_capacity AS SELECT SUM(capacity) AS total_cap FROM collection_trucks; -- 111
CREATE VIEW v_trucks_missing_capacity AS SELECT * FROM collection_trucks WHERE capacity_tons IS NULL; -- 112

-- DISPOSAL METHODS (113–120)
CREATE VIEW v_all_methods AS SELECT * FROM disposal_methods; -- 113
CREATE VIEW v_count_methods AS SELECT COUNT(*) AS total FROM disposal_methods; -- 114
CREATE VIEW v_distinct_method_types AS SELECT DISTINCT method_name FROM disposal_methods; -- 115
CREATE VIEW v_methods_by_type AS SELECT method_name, COUNT(*) AS total FROM disposal_methods GROUP BY method_name; -- 116
CREATE VIEW v_longest_method_name AS SELECT * FROM disposal_methods ORDER BY LENGTH(method_name) DESC LIMIT 1; -- 117
CREATE VIEW v_shortest_method_name AS SELECT * FROM disposal_methods ORDER BY LENGTH(method_name) ASC LIMIT 1; -- 118
CREATE VIEW v_methods_no_desc AS SELECT * FROM disposal_methods WHERE description IS NULL; -- 119
CREATE VIEW v_avg_method_desc_len AS SELECT AVG(CHAR_LENGTH(description)) AS avg_len FROM disposal_methods; -- 120


-- ECO GUIDES (121–130)
CREATE VIEW v_all_guides AS SELECT * FROM eco_guides; -- 121
CREATE VIEW v_count_guides AS SELECT COUNT(*) AS total FROM eco_guides; -- 122
CREATE VIEW v_guides_by_site AS SELECT site_id, COUNT(*) AS total FROM eco_guides GROUP BY site_id; -- 123
CREATE VIEW v_longest_guide_name AS SELECT * FROM eco_guides ORDER BY LENGTH(guide_program) DESC LIMIT 1; -- 124
CREATE VIEW v_shortest_guide_name AS SELECT * FROM eco_guides ORDER BY LENGTH(guide_program) ASC LIMIT 1; -- 125

CREATE VIEW v_avg_guide_rating AS SELECT AVG(rating) AS avg_rating FROM eco_guides;

CREATE VIEW v_top_rated_guide AS SELECT * FROM eco_guides ORDER BY rating DESC LIMIT 1;

CREATE VIEW v_lowest_rated_guide AS SELECT * FROM eco_guides ORDER BY rating ASC LIMIT 1;

CREATE VIEW v_avg_guide_duration AS SELECT AVG(duration_hours) AS avg_duration FROM eco_guides;
CREATE VIEW v_max_group_size_guide AS SELECT * FROM eco_guides ORDER BY max_group_size DESC LIMIT 1;



-- ECO LODGES (131–140)

CREATE VIEW v_all_lodges AS SELECT * FROM eco_lodges; -- 131
CREATE VIEW v_count_lodges AS SELECT COUNT(*) AS total FROM eco_lodges; -- 132
CREATE VIEW v_lodges_by_site AS SELECT site_id, COUNT(*) AS total FROM eco_lodges GROUP BY site_id; -- 133
CREATE VIEW v_most_expensive_lodge AS SELECT * FROM eco_lodges ORDER BY price_per_night DESC LIMIT 1; -- 134
CREATE VIEW v_cheapest_lodge AS SELECT * FROM eco_lodges ORDER BY price_per_night ASC LIMIT 1; -- 135
CREATE VIEW v_avg_lodge_price AS SELECT AVG(price_per_night) AS avg_price FROM eco_lodges; -- 136
CREATE VIEW v_total_lodge_revenue AS SELECT SUM(price_per_night) AS total_price FROM eco_lodges; -- 137
CREATE VIEW v_lodges_by_capacity AS SELECT capacity, COUNT(*) AS total FROM eco_lodges GROUP BY capacity; -- 138
CREATE VIEW v_lodge_max_capacity AS SELECT * FROM eco_lodges ORDER BY capacity DESC LIMIT 1; -- 139
CREATE VIEW v_lodge_min_capacity AS SELECT * FROM eco_lodges ORDER BY capacity ASC LIMIT 1; -- 140


-- -- IOT BIN SENSORS (141–150)
CREATE VIEW v_all_sensors AS SELECT * FROM iot_bin_sensors; -- 141
CREATE VIEW v_count_sensors AS SELECT COUNT(*) AS total FROM iot_bin_sensors; -- 142
CREATE VIEW v_sensors_by_site AS SELECT site_id, COUNT(*) AS total FROM iot_bin_sensors GROUP BY site_id; -- 143
CREATE VIEW v_latest_sensor AS SELECT * FROM iot_bin_sensors ORDER BY sensor_id DESC LIMIT 1; -- 144
CREATE VIEW v_oldest_sensor AS SELECT * FROM iot_bin_sensors ORDER BY sensor_id ASC LIMIT 1; -- 145
CREATE VIEW v_avg_fill_level AS SELECT AVG(fill_level) AS avg_fill FROM iot_bin_sensors; -- 146
CREATE VIEW v_max_fill_sensor AS SELECT * FROM iot_bin_sensors ORDER BY fill_level DESC LIMIT 1; -- 147
CREATE VIEW v_min_fill_sensor AS SELECT * FROM iot_bin_sensors ORDER BY fill_level ASC LIMIT 1; -- 148
CREATE VIEW v_sensors_missing_data AS SELECT * FROM iot_bin_sensors WHERE fill_level IS NULL; -- 149
CREATE VIEW v_sensors_by_status AS SELECT bin_status, COUNT(*) AS total FROM iot_bin_sensors GROUP BY bin_status; -- 150

-- PACKAGE TYPES 151 TO 160

CREATE VIEW v_all_package_types AS SELECT * FROM package_types; -- 151
CREATE VIEW v_count_package_types AS SELECT COUNT(*) AS total FROM package_types; -- 152
CREATE VIEW v_distinct_package_names AS SELECT DISTINCT package_name FROM package_types; -- 153
CREATE VIEW v_longest_package_name AS SELECT * FROM package_types ORDER BY LENGTH(package_name) DESC LIMIT 1; -- 154
CREATE VIEW v_shortest_package_name AS SELECT * FROM package_types ORDER BY LENGTH(package_name) ASC LIMIT 1; -- 155
CREATE VIEW v_avg_package_name_len AS SELECT AVG(CHAR_LENGTH(package_name)) AS avg_len FROM package_types; -- 156
CREATE VIEW v_package_types_no_desc AS SELECT * FROM package_types WHERE highlights IS NULL; -- 157
CREATE VIEW v_latest_package_type AS SELECT * FROM package_types ORDER BY package_id DESC LIMIT 1; -- 158
CREATE VIEW v_package_types_by_price AS SELECT package_name, price FROM package_types ORDER BY price DESC; -- 159
CREATE VIEW v_avg_package_price_type AS SELECT AVG(price) AS avg_price FROM package_types; -- 160


-- PUBLIC EDUCATION EVENTS (161–170)
-- 161
CREATE VIEW v_all_public_events_educational AS
SELECT * FROM public_education_events;

-- 162
CREATE VIEW v_count_public_events_e AS
SELECT COUNT(*) AS total FROM public_education_events;

-- 163
CREATE VIEW v_events_by_type_e AS
SELECT event_type, COUNT(*) AS total
FROM public_education_events
GROUP BY event_type;

-- 164
CREATE VIEW v_events_by_audience_e AS
SELECT audience, COUNT(*) AS total
FROM public_education_events
GROUP BY audience;

-- 165
CREATE VIEW v_event_max_participants_e AS
SELECT * FROM public_education_events
ORDER BY max_participants DESC
LIMIT 1;

-- 166
CREATE VIEW v_event_min_participants_e AS
SELECT * FROM public_education_events
ORDER BY max_participants ASC
LIMIT 1;

-- 167
CREATE VIEW v_avg_event_rating_e AS
SELECT AVG(feedback_rating) AS avg_rating
FROM public_education_events;

-- 168
CREATE VIEW v_top5_events_rating_e AS
SELECT * FROM public_education_events
ORDER BY feedback_rating DESC
LIMIT 5;

-- 169
CREATE VIEW v_events_no_desc_e AS
SELECT * FROM public_education_events
WHERE description IS NULL;

-- 170
CREATE VIEW v_events_by_season_e AS
SELECT season, COUNT(*) AS total
FROM public_education_events
GROUP BY season;


-- RECYCLING CENTERS (171–180)
CREATE VIEW v_all_centers AS SELECT * FROM recycling_centers; -- 171
CREATE VIEW v_count_centers AS SELECT COUNT(*) AS total FROM recycling_centers; -- 172
CREATE VIEW v_centers_by_site AS SELECT site_id, COUNT(*) AS total FROM recycling_centers GROUP BY site_id; -- 173
CREATE VIEW v_longest_center_name AS SELECT * FROM recycling_centers ORDER BY LENGTH(center_name) DESC LIMIT 1; -- 174
CREATE VIEW v_shortest_center_name AS SELECT * FROM recycling_centers ORDER BY LENGTH(center_name) ASC LIMIT 1; -- 175

CREATE VIEW v_avg_capacity AS SELECT AVG(capacity_kg) AS avg_capacity FROM recycling_centers; -- 176
CREATE VIEW v_max_capacity_center AS SELECT * FROM recycling_centers ORDER BY capacity_kg DESC LIMIT 1; -- 177
CREATE VIEW v_min_capacity_center AS SELECT * FROM recycling_centers ORDER BY capacity_kg ASC LIMIT 1; -- 178
CREATE VIEW v_total_capacity AS SELECT SUM(capacity_kg) AS total_capacity FROM recycling_centers; -- 179
CREATE VIEW v_centers_no_capacity AS SELECT * FROM recycling_centers WHERE capacity_kg IS NULL; -- 180

-- REFORESTATION LOGS (181–190)
CREATE VIEW v_all_reforest AS SELECT * FROM reforestation_logs; -- 181
CREATE VIEW v_count_reforest AS SELECT COUNT(*) AS total FROM reforestation_logs; -- 182
CREATE VIEW v_trees_by_site AS SELECT site_id, SUM(trees_planted) AS total FROM reforestation_logs GROUP BY site_id; -- 183
CREATE VIEW v_avg_trees AS SELECT AVG(trees_planted) AS avg_trees FROM reforestation_logs; -- 184
CREATE VIEW v_max_trees_log AS SELECT * FROM reforestation_logs ORDER BY trees_planted DESC LIMIT 1; -- 185
CREATE VIEW v_min_trees_log AS SELECT * FROM reforestation_logs ORDER BY trees_planted ASC LIMIT 1; -- 186

CREATE VIEW v_logs_by_year AS SELECT year, COUNT(*) AS total FROM reforestation_logs GROUP BY year; -- 187
CREATE VIEW v_latest_year AS SELECT * FROM reforestation_logs where year =(select max( year) from reforestation_logs) ORDER BY tribe_id DESC LIMIT 1; -- 188
CREATE VIEW v_earliest_year AS SELECT * FROM reforestation_logs where year =(select min( year) from reforestation_logs) ORDER BY tribe_id DESC LIMIT 1; -- 189
CREATE VIEW v_logs_no_trees AS SELECT * FROM reforestation_logs WHERE trees_planted IS NULL; -- 190

-- TOURIST FEEDBACK (191–200)
CREATE VIEW v_all_tourist_feedback AS SELECT * FROM tourist_feedback; -- 191
CREATE VIEW v_count_tourist_feedback AS SELECT COUNT(*) AS total FROM tourist_feedback; -- 192
CREATE VIEW v_avg_tourist_rating AS SELECT AVG(rating) AS avg_rating FROM tourist_feedback; -- 193
CREATE VIEW v_top5_feedback AS SELECT * FROM tourist_feedback ORDER BY rating DESC LIMIT 5; -- 194
CREATE VIEW v_bottom5_feedback AS SELECT * FROM tourist_feedback ORDER BY rating ASC LIMIT 5; -- 195



-- 196
CREATE VIEW v_feedback_by_sentiment AS
SELECT sentiment, COUNT(*) AS total
FROM tourist_feedback
GROUP BY sentiment;

-- 197
CREATE VIEW v_feedback_by_status AS
SELECT response_status, COUNT(*) AS total
FROM tourist_feedback
GROUP BY response_status;

-- 198
CREATE VIEW v_feedback_recommended AS
SELECT COUNT(*) AS total
FROM tourist_feedback
WHERE recommended = 1;

-- 199
CREATE VIEW v_longest_feedback_text AS
SELECT * FROM tourist_feedback
ORDER BY CHAR_LENGTH(feedback_text) DESC
LIMIT 1;

-- 200
CREATE VIEW v_shortest_feedback_text AS
SELECT * FROM tourist_feedback
ORDER BY CHAR_LENGTH(feedback_text) ASC
LIMIT 1;

