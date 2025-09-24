-- EASY JOINS 
USE SQL_CAPESTONE_PROJECT ;

-- 1. List all eco-lodges with their eco-site and region.
SELECT el.lodge_name, es.site_name, es.state_region
FROM eco_lodges el
INNER JOIN eco_sites es ON el.site_id = es.site_id;

-- 2. Show all tourists and the eco-site they visited.
SELECT vl.visitor_name, es.site_name
FROM visit_logs vl
JOIN eco_sites es ON vl.site_id = es.site_id;

-- 3. Display artisan names with their tribe and craft type.
SELECT la.name, t.tribe_name, la.craft_type
FROM local_artisians la
JOIN tribes t ON la.tribe_id = t.tribe_id;

-- 4. List booking history with lodge name and number of guests.
SELECT bh.visitor_name, el.lodge_name, bh.num_guests
FROM booking_history bh
JOIN eco_lodges el ON bh.lodge_id = el.lodge_id;

-- 5. Show all waste items with their category name.
SELECT wi.item_name, wc.category_name
FROM waste_items wi
JOIN waste_category wc ON wi.cat_id = wc.cat_id;

-- 6. List all workshops along with site and target audience.
SELECT cw.workshop_name, es.site_name, cw.target_audience
FROM cultural_workshops cw
JOIN eco_sites es ON cw.site_id = es.site_id;

-- 7. Display all guides with their program and supported languages.
SELECT eg.guide_program, eg.language_supported, es.site_name
FROM eco_guides eg
JOIN eco_sites es ON eg.site_id = es.site_id;

-- 8. List all tribes with population estimate and the eco-site name.
SELECT t.tribe_name, t.population_estimate, es.site_name
FROM tribes t
JOIN eco_sites es ON t.site_id = es.site_id;

-- 9. Show all booking history with package name and price.
SELECT bh.visitor_name, pt.package_name, pt.price
FROM booking_history bh
JOIN package_types pt ON bh.package_id = pt.package_id;

-- 10. List all feedbacks with visitor name and lodge name.
SELECT tf.feedback_text, bh.visitor_name, el.lodge_name
FROM tourist_feedback tf
JOIN booking_history bh ON tf.booking_id = bh.booking_id
JOIN eco_lodges el ON bh.lodge_id = el.lodge_id;

-- 11. List eco-sites with more than 5 bookings.
SELECT site_name
FROM eco_sites
WHERE site_id IN (
  SELECT site_id FROM booking_history
  GROUP BY site_id
  HAVING COUNT(*) > 5
);

-- 12. Show tribes with above average population.
SELECT tribe_name, population_estimate
FROM tribes
WHERE population_estimate > (SELECT AVG(population_estimate) FROM tribes);

-- 13. List lodges with capacity above the average.
SELECT lodge_name, capacity
FROM eco_lodges
WHERE capacity > (SELECT AVG(capacity) FROM eco_lodges);

-- 14. Find categories where at least one waste item is over 10kg.
SELECT category_name
FROM waste_category
WHERE cat_id IN (
  SELECT cat_id FROM waste_items WHERE quantity_kg > 10
);

-- 15. Show sites where the average rating is above 4.
SELECT site_name
FROM eco_sites
WHERE site_id IN (
  SELECT site_id FROM visit_logs GROUP BY site_id HAVING AVG(rating) > 4
);

-- 16. List all cultural assets with tribe name.
SELECT ca.asset_type, ca.description, t.tribe_name
FROM cultural_assets ca
JOIN tribes t ON ca.tribe_id = t.tribe_id;

-- 17. Display conservation areas with eco-site and size.
SELECT ca.area_name, ca.area_size_km2, es.site_name
FROM conservation_areas ca
JOIN eco_sites es ON ca.site_id = es.site_id;

-- 18. List all workshops with the tribe conducting them.
SELECT cw.workshop_name, t.tribe_name
FROM cultural_workshops cw
JOIN eco_sites es ON cw.site_id = es.site_id
JOIN tribes t ON es.site_id = t.site_id;

-- 19. Show all booking history with feedback received.
SELECT bh.visitor_name, tf.feedback_text
FROM booking_history bh
LEFT JOIN tourist_feedback tf ON bh.booking_id = tf.booking_id;

-- 20. List all guides with their rating.
SELECT guide_program, rating
FROM eco_guides;

-- 21. Show all waste sources with their contact person.
SELECT source_name, contact_person
FROM waste_sources;

-- 22. List all recycling centers with their manager name.
SELECT center_name, manager_name
FROM recycling_centers;

-- 23. Show all visitor statistics with site name and year.
SELECT vs.year, vs.domestic_visitors, es.site_name
FROM visitor_statistics vs
JOIN eco_sites es ON vs.site_id = es.site_id;

-- 24. List all reforestation logs with tree species and volunteers count.
SELECT species, trees_planted, volunteers_count
FROM reforestation_logs;

-- 25. Show all bin sensors with location and fill level.
SELECT bin_location, fill_level
FROM iot_bin_sensors;

-- 26. List all trucks with their status and driver name.
SELECT truck_number, status, driver_name
FROM collection_trucks;

-- 27. List all waste transfers with status and handled team.
SELECT transfer_id, transfer_status, handled_by_team
FROM waste_transfer_logs;

-- 28. Show lodges that are pet-friendly.
SELECT lodge_name
FROM eco_lodges
WHERE pet_friendly = TRUE;

-- 29. List all guides who support more than one language.
SELECT guide_program, language_supported
FROM eco_guides
WHERE LENGTH(language_supported) - LENGTH(REPLACE(language_supported, ',', '')) + 1 > 1;

-- 30. Show all eco-sites with their activities count.
SELECT site_name, key_activites_no
FROM eco_sites;

-- 31. List all tribes with more than one role.
SELECT tribe_name, roles
FROM tribes
WHERE no_roles > 1;

-- 32. List all cultural assets and their asset type length.
SELECT asset_type, len_asset_type
FROM cultural_assets;

-- 33. Show all workshops and their type.
SELECT workshop_name, workshop_type
FROM cultural_workshops;

-- 34. List all waste categories with color code.
SELECT category_name, color_code
FROM waste_category;

-- 35. Show all waste items collected.
SELECT item_name, status
FROM waste_items
WHERE status = 'Collected';

-- 36. List all disposal methods that are eco-friendly.
SELECT method_name
FROM disposal_methods
WHERE eco_friendly = TRUE;

-- 37. Show all sources that are active.
SELECT source_name
FROM waste_sources
WHERE active = TRUE;

-- 38. List all recycling centers that are eco-certified.
SELECT center_name
FROM recycling_centers
WHERE eco_certified = TRUE;

-- 39. Show visitor statistics where repeat visitors > 200.
SELECT site_id, repeat_visitors
FROM visitor_statistics
WHERE repeat_visitors > 200;

-- 40. List all reforestation logs with survival rate above 85%.
SELECT species, survival_rate_pct
FROM reforestation_logs
WHERE survival_rate_pct > 85;

-- 41. Show bin sensors that are full.
SELECT bin_location
FROM iot_bin_sensors
WHERE bin_status = 'Full';

-- 42. List all trucks running on electric fuel.
SELECT truck_number
FROM collection_trucks
WHERE fuel_type = 'Electric';

-- 43. Show all completed waste transfers.
SELECT transfer_id
FROM waste_transfer_logs
WHERE transfer_status = 'Completed';

-- 44. List all packages with price above 10000.
SELECT package_name, price
FROM package_types
WHERE price > 10000;

-- 45. Show all lodges with rating above 4.5.
SELECT lodge_name, rating
FROM eco_lodges
WHERE rating > 4.5;

-- 46. List all guides with group size above 15.
SELECT guide_program, max_group_size
FROM eco_guides
WHERE max_group_size > 15;

-- 47. Show all sites in the 'South' region.
SELECT site_name
FROM eco_sites
WHERE region = 'South';

-- 48. List all bookings made by 'Online' source.
SELECT visitor_name, booking_source
FROM booking_history
WHERE booking_source = 'Online';

-- 49. Show all feedbacks that are positive.
SELECT feedback_text, sentiment
FROM tourist_feedback
WHERE sentiment = 'Positive';

-- 50. List all waste categories that are recyclable.
SELECT category_name
FROM waste_category
WHERE recyclable = TRUE;

-- 51. Show all bins with capacity above 160kg.
SELECT bin_location, bin_capacity_kg
FROM iot_bin_sensors
WHERE bin_capacity_kg > 160;

-- 52. List all trucks serviced after '2025-09-01'.
SELECT truck_number, last_service_date
FROM collection_trucks
WHERE last_service_date > '2025-09-01';

-- 53. Show all transfers handled by 'Team A'.
SELECT transfer_id
FROM waste_transfer_logs
WHERE handled_by_team = 'Team A';

-- 54. List all eco-sites with at least one artisan.
SELECT es.site_name
FROM eco_sites es
WHERE es.site_id IN (
  SELECT tribe_id FROM local_artisians
);

-- 55. Show all tribes whose population is 'High'.
SELECT tribe_name, population
FROM tribes
WHERE population = 'High';

-- 56. List all workshops for 'Tourists'.
SELECT workshop_name
FROM cultural_workshops
WHERE target_audience = 'Tourists';

-- 57. Show all guides with rating above 4.2.
SELECT guide_program, rating
FROM eco_guides
WHERE rating > 4.2;

-- 58. List all lodges where 'available' is TRUE.
SELECT lodge_name
FROM eco_lodges
WHERE available = TRUE;

-- 59. Show all packages in 'Adventure' category.
SELECT package_name
FROM package_types
WHERE package_category = 'Adventure';

-- 60. List all bookings with more than 3 guests.
SELECT visitor_name, num_guests
FROM booking_history
WHERE num_guests > 3;

-- 61. Show all feedbacks tagged with 'Safari'.
SELECT feedback_text, tags
FROM tourist_feedback
WHERE tags LIKE '%Safari%';

-- 62. List all waste items with disposal method 'Recycling'.
SELECT item_name
FROM waste_items
WHERE disposal_method_id = (
  SELECT method_id FROM disposal_methods WHERE method_name = 'Recycling'
);

-- 63. Show all sources logged 'Daily'.
SELECT source_name
FROM waste_sources
WHERE frequency_logged = 'Daily';

-- 64. List all recycling centers with capacity above 4000kg.
SELECT center_name, capacity_kg
FROM recycling_centers
WHERE capacity_kg > 4000;

-- 65. Show visitor statistics for 2023.
SELECT site_id, year, total_revenue
FROM visitor_statistics
WHERE year = 2023;

-- 66. List all reforestation logs funded by 'Government Grant'.
SELECT species, funding_source
FROM reforestation_logs
WHERE funding_source = 'Government Grant';

-- 67. Show all bins with next maintenance due in October.
SELECT bin_location, maintenance_due
FROM iot_bin_sensors
WHERE MONTH(maintenance_due) = 10;

-- 68. List all trucks on route 'Parambikulam - Periyar'.
SELECT truck_number, active_routes
FROM collection_trucks
WHERE active_routes = 'Parambikulam - Periyar';

-- 69. Show all transfers with time taken above 2 hours.
SELECT transfer_id, time_taken_hours
FROM waste_transfer_logs
WHERE time_taken_hours > 2;

-- 70. List all packages recommended for 'Winter'.
SELECT package_name, recommended_season
FROM package_types
WHERE recommended_season = 'Winter';

-- 71. Show all lodges with minimum stay days above 2.
SELECT lodge_name, min_stay_days
FROM eco_lodges
WHERE min_stay_days > 2;

-- 72. List all guides for 'Tourists' audience.
SELECT guide_program
FROM eco_guides
WHERE target_audience = 'Tourists';

-- 73. Show all bookings with 'Vegetarian meals' request.
SELECT visitor_name, special_requests
FROM booking_history
WHERE special_requests LIKE '%Vegetarian meals%';

-- 74. List all feedbacks submitted after '2025-01-20'.
SELECT feedback_text, feedback_date
FROM tourist_feedback
WHERE feedback_date > '2025-01-20';

-- 75. Show all categories with hazard level 'High'.
SELECT category_name, hazard_level
FROM waste_category
WHERE hazard_level = 'High';

-- 76. List all bins with status 'Empty'.
SELECT bin_location, bin_status
FROM iot_bin_sensors
WHERE bin_status = 'Empty';

-- 77. Show all trucks with driver name starting with 'R'.
SELECT truck_number, driver_name
FROM collection_trucks
WHERE driver_name LIKE 'R%';

-- 78. List all transfers with waste summary containing 'Plastic'.
SELECT transfer_id, waste_type_summary
FROM waste_transfer_logs
WHERE waste_type_summary LIKE '%Plastic%';

-- 79. Show all packages that are eco-friendly and easy.
SELECT package_name
FROM package_types
WHERE eco_friendly = TRUE AND difficulty_level = 'Easy';

-- 80. List all sites with activities containing 'trek'.
SELECT site_name, key_activites
FROM eco_sites
WHERE key_activites LIKE '%trek%';