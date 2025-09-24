-- EASY SUBQUERIES 
USE MY_SQL_CAPESTONE_PROJECT;

-- 1. List all lodges at sites located in 'Kerala'.
SELECT lodge_name
FROM eco_lodges
WHERE site_id IN (
  SELECT site_id FROM eco_sites WHERE state_region = 'Kerala'
);

-- 2. Find all artisan names belonging to the tribe 'Gond'.
SELECT name
FROM local_artisians
WHERE tribe_id = (
  SELECT tribe_id FROM tribes WHERE tribe_name = 'Gond'
);

-- 3. Show all packages for sites with capacity above 20.
SELECT package_name
FROM package_types
WHERE site_id IN (
  SELECT site_id FROM eco_lodges WHERE capacity > 20
);

-- 4. List all guides at sites with 'Tribal' type.
SELECT guide_program
FROM eco_guides
WHERE site_id IN (
  SELECT site_id FROM eco_sites WHERE Type = 'Tribal'
);

-- 5. Show workshops held at sites with more than 1 conservation area.
SELECT workshop_name
FROM cultural_workshops
WHERE site_id IN (
  SELECT site_id FROM conservation_areas GROUP BY site_id HAVING COUNT(*) > 1
);

-- 6. Find all waste items from sites with region 'East'.
SELECT item_name
FROM waste_items
WHERE site_id IN (
  SELECT site_id FROM eco_sites WHERE region = 'East'
);

-- 7. List all feedbacks for bookings at the most expensive lodge.
SELECT feedback_text
FROM tourist_feedback
WHERE booking_id IN (
  SELECT booking_id FROM booking_history WHERE lodge_id = (
    SELECT lodge_id FROM eco_lodges ORDER BY price_per_night DESC LIMIT 1
  )
);

-- 8. Show all sites with more than 2 workshops.
SELECT site_name
FROM eco_sites
WHERE site_id IN (
  SELECT site_id FROM cultural_workshops GROUP BY site_id HAVING COUNT(*) > 2
);

-- 9. Find all eco-sites with a conservation area above 1000 km2.
SELECT site_name
FROM eco_sites
WHERE site_id IN (
  SELECT site_id FROM conservation_areas WHERE area_size_km2 > 1000
);

-- 10. List all artisans who produce 'Basket weaving'.
SELECT name
FROM local_artisians
WHERE craft_type = 'Basket weaving';

-- 11. Show all lodge names for sites with region 'South'.
SELECT lodge_name
FROM eco_lodges
WHERE site_id IN (
  SELECT site_id FROM eco_sites WHERE region = 'South'
);

-- 12. Find all tribes involved in 'Weaving'.
SELECT tribe_name
FROM tribes
WHERE tribe_id IN (
  SELECT tribe_id FROM local_artisians WHERE craft_type LIKE '%weaving%'
);

-- 13. List all bookings with package price more than 10000.
SELECT visitor_name
FROM booking_history
WHERE package_id IN (
  SELECT package_id FROM package_types WHERE price > 10000
);

-- 14. Show all workshops for the tribe 'Bodo'.
SELECT workshop_name
FROM cultural_workshops
WHERE site_id IN (
  SELECT site_id FROM tribes WHERE tribe_name = 'Bodo'
);

-- 15. Find all feedbacks for bookings at sites with 'Eco-hut' lodges.
SELECT feedback_text
FROM tourist_feedback
WHERE booking_id IN (
  SELECT booking_id FROM booking_history WHERE lodge_id IN (
    SELECT lodge_id FROM eco_lodges WHERE lodge_type = 'Eco-hut'
  )
);

-- 16. List all waste items for sources containing 'Kitchen'.
SELECT item_name
FROM waste_items
WHERE source_id IN (
  SELECT s_id FROM waste_sources WHERE source_name LIKE '%Kitchen%'
);

-- 17. Show all guides at sites with more than 1 artisan.
SELECT guide_program
FROM eco_guides
WHERE site_id IN (
  SELECT site_id FROM tribes WHERE tribe_id IN (
    SELECT tribe_id FROM local_artisians GROUP BY tribe_id HAVING COUNT(*) > 1
  )
);

-- 18. Find all booking visitors for lodges in 'Nagaland'.
SELECT visitor_name
FROM booking_history
WHERE lodge_id IN (
  SELECT lodge_id FROM eco_lodges WHERE site_id IN (
    SELECT site_id FROM eco_sites WHERE state_region = 'Nagaland'
  )
);

-- 19. List all feedbacks for bookings of packages of duration 4+ days.
SELECT feedback_text
FROM tourist_feedback
WHERE booking_id IN (
  SELECT booking_id FROM booking_history WHERE package_id IN (
    SELECT package_id FROM package_types WHERE duration_days >= 4
  )
);

-- 20. Show all eco-sites with guides having rating above 4.
SELECT site_name
FROM eco_sites
WHERE site_id IN (
  SELECT site_id FROM eco_guides WHERE rating > 4
);

-- 21. Find all packages for sites where workshops are for 'Tourists'.
SELECT package_name
FROM package_types
WHERE site_id IN (
  SELECT site_id FROM cultural_workshops WHERE target_audience = 'Tourists'
);

-- 22. List all waste items with disposal method 'Recycling'.
SELECT item_name
FROM waste_items
WHERE disposal_method_id = (
  SELECT method_id FROM disposal_methods WHERE method_name = 'Recycling'
);

-- 23. Show all tribes for sites with 'Buffer Zone' conservation area.
SELECT tribe_name
FROM tribes
WHERE site_id IN (
  SELECT site_id FROM conservation_areas WHERE protection_level = 'Buffer Zone'
);

-- 24. Find all workshops for sites with more than 2 guides.
SELECT workshop_name
FROM cultural_workshops
WHERE site_id IN (
  SELECT site_id FROM eco_guides GROUP BY site_id HAVING COUNT(*) > 2
);

-- 25. List all bins with capacity above 180kg.
SELECT bin_location
FROM iot_bin_sensors
WHERE bin_capacity_kg > 180;

-- 26. Show all guides for sites with region 'West'.
SELECT guide_program
FROM eco_guides
WHERE site_id IN (
  SELECT site_id FROM eco_sites WHERE region = 'West'
);

-- 27. Find all bookings made for packages with category 'Adventure'.
SELECT visitor_name
FROM booking_history
WHERE package_id IN (
  SELECT package_id FROM package_types WHERE package_category = 'Adventure'
);

-- 28. List all tribes for sites with more than 1 artisan involved in 'Craft'.
SELECT tribe_name
FROM tribes
WHERE tribe_id IN (
  SELECT tribe_id FROM local_artisians WHERE craft_type = 'Craft'
  GROUP BY tribe_id HAVING COUNT(*) > 1
);

-- 29. Show workshops for sites with conservation area larger than 500km2.
SELECT workshop_name
FROM cultural_workshops
WHERE site_id IN (
  SELECT site_id FROM conservation_areas WHERE area_size_km2 > 500
);

-- 30. Find all eco-sites with guides for 'School Students'.
SELECT site_name
FROM eco_sites
WHERE site_id IN (
  SELECT site_id FROM eco_guides WHERE target_audience = 'School Students'
);

-- 31. List all waste sources for sites with more than 2 bins.
SELECT source_name
FROM waste_sources
WHERE site_id IN (
  SELECT site_id FROM iot_bin_sensors GROUP BY site_id HAVING COUNT(*) > 2
);

-- 32. Show all guides at sites with 'Nature' package category.
SELECT guide_program
FROM eco_guides
WHERE site_id IN (
  SELECT site_id FROM package_types WHERE package_category = 'Nature'
);

-- 33. Find all lodges where bookings have more than 2 guests.
SELECT lodge_name
FROM eco_lodges
WHERE lodge_id IN (
  SELECT lodge_id FROM booking_history WHERE num_guests > 2
);

-- 34. List all packages for sites with region 'North East'.
SELECT package_name
FROM package_types
WHERE site_id IN (
  SELECT site_id FROM eco_sites WHERE region = 'North East'
);

-- 35. Show all workshops for sites where at least one artisan is female.
SELECT workshop_name
FROM cultural_workshops
WHERE site_id IN (
  SELECT site_id FROM tribes WHERE tribe_id IN (
    SELECT tribe_id FROM local_artisians WHERE GENDER = 'F'
  )
);

-- 36. Find all bookings for lodges with rating above 4.5.
SELECT visitor_name
FROM booking_history
WHERE lodge_id IN (
  SELECT lodge_id FROM eco_lodges WHERE rating > 4.5
);

-- 37. List all guides for sites with more than 1 conservation area.
SELECT guide_program
FROM eco_guides
WHERE site_id IN (
  SELECT site_id FROM conservation_areas GROUP BY site_id HAVING COUNT(*) > 1
);

-- 38. Show all feedbacks for bookings with total amount above average.
SELECT feedback_text
FROM tourist_feedback
WHERE booking_id IN (
  SELECT booking_id FROM booking_history WHERE total_amount > (
    SELECT AVG(total_amount) FROM booking_history
  )
);

-- 39. Find all artisans for tribes with population 'High'.
SELECT name
FROM local_artisians
WHERE tribe_id IN (
  SELECT tribe_id FROM tribes WHERE population = 'High'
);

-- 40. List all eco-sites with package price below 6000.
SELECT site_name
FROM eco_sites
WHERE site_id IN (
  SELECT site_id FROM package_types WHERE price < 6000
);

-- 41. Show all bins at sites with region 'North West'.
SELECT bin_location
FROM iot_bin_sensors
WHERE site_id IN (
  SELECT site_id FROM eco_sites WHERE region = 'North West'
);

-- 42. Find all guides for sites with 'Glamping' lodges.
SELECT guide_program
FROM eco_guides
WHERE site_id IN (
  SELECT site_id FROM eco_lodges WHERE lodge_type = 'Glamping'
);

-- 43. List all workshops for sites with more than 2 guides for 'Tourists'.
SELECT workshop_name
FROM cultural_workshops
WHERE site_id IN (
  SELECT site_id FROM eco_guides WHERE target_audience = 'Tourists'
  GROUP BY site_id HAVING COUNT(*) > 2
);

-- 44. Show all waste sources for sites with recycling centers accepting 'Organic'.
SELECT source_name
FROM waste_sources
WHERE site_id IN (
  SELECT site_id FROM recycling_centers WHERE accepted_waste LIKE '%Organic%'
);

-- 45. Find all packages for sites with capacity above 25.
SELECT package_name
FROM package_types
WHERE site_id IN (
  SELECT site_id FROM eco_lodges WHERE capacity > 25
);

-- 46. List all eco-sites with workshops for 'Young Adults'.
SELECT site_name
FROM eco_sites
WHERE site_id IN (
  SELECT site_id FROM cultural_workshops WHERE target_audience = 'Young Adults'
);

-- 47. Show all guides for sites in 'Tamil Nadu'.
SELECT guide_program
FROM eco_guides
WHERE site_id IN (
  SELECT site_id FROM eco_sites WHERE state_region = 'Tamil Nadu'
);

-- 48. Find all bookings for lodges with minimum stay days above 2.
SELECT visitor_name
FROM booking_history
WHERE lodge_id IN (
  SELECT lodge_id FROM eco_lodges WHERE min_stay_days > 2
);

-- 49. List all workshops for sites with at least one 'Festival' event.
SELECT workshop_name
FROM cultural_workshops
WHERE site_id IN (
  SELECT site_id FROM public_education_events WHERE event_type = 'Festival'
);

-- 50. Show all feedbacks for bookings at sites with 'Dance' workshops.
SELECT feedback_text
FROM tourist_feedback
WHERE booking_id IN (
  SELECT booking_id FROM booking_history WHERE site_id IN (
    SELECT site_id FROM cultural_workshops WHERE workshop_type = 'Dance'
  )
);

-- 51. Find all eco-sites with a conservation area of type 'Core Zone'.
SELECT site_name
FROM eco_sites
WHERE site_id IN (
  SELECT site_id FROM conservation_areas WHERE protection_level = 'Core Zone'
);

-- 52. List all guides for sites with more than 15,000 population estimate.
SELECT guide_program
FROM eco_guides
WHERE site_id IN (
  SELECT site_id FROM tribes WHERE population_estimate > 15000
);

-- 53. Show all bins for sites with more than 2 workshops.
SELECT bin_location
FROM iot_bin_sensors
WHERE site_id IN (
  SELECT site_id FROM cultural_workshops GROUP BY site_id HAVING COUNT(*) > 2
);

-- 54. Find all workshops for sites with more than 2 packages.
SELECT workshop_name
FROM cultural_workshops
WHERE site_id IN (
  SELECT site_id FROM package_types GROUP BY site_id HAVING COUNT(*) > 2
);

-- 55. List all eco-sites for guides supporting 'English'.
SELECT site_name
FROM eco_sites
WHERE site_id IN (
  SELECT site_id FROM eco_guides WHERE language_supported LIKE '%English%'
);

-- 56. Show all tribes for sites with capacity below 15.
SELECT tribe_name
FROM tribes
WHERE site_id IN (
  SELECT site_id FROM eco_lodges WHERE capacity < 15
);

-- 57. Find all feedbacks for bookings from 'Travel Agent'.
SELECT feedback_text
FROM tourist_feedback
WHERE booking_id IN (
  SELECT booking_id FROM booking_history WHERE booking_source = 'Travel Agent'
);

-- 58. List all guides for sites with 'Festival' event.
SELECT guide_program
FROM eco_guides
WHERE site_id IN (
  SELECT site_id FROM public_education_events WHERE event_type = 'Festival'
);

-- 59. Show all tribes for sites with 'Craft' workshops.
SELECT tribe_name
FROM tribes
WHERE site_id IN (
  SELECT site_id FROM cultural_workshops WHERE workshop_type = 'Craft'
);

-- 60. Find all eco-sites with at least one artisan named 'Raju'.
SELECT site_name
FROM eco_sites
WHERE site_id IN (
  SELECT site_id FROM tribes WHERE tribe_id IN (
    SELECT tribe_id FROM local_artisians WHERE name LIKE '%Raju%'
  )
);

-- 61. List all guides for sites with more than 2 bins.
SELECT guide_program
FROM eco_guides
WHERE site_id IN (
  SELECT site_id FROM iot_bin_sensors GROUP BY site_id HAVING COUNT(*) > 2
);

-- 62. Show all workshops for sites with package price above average.
SELECT workshop_name
FROM cultural_workshops
WHERE site_id IN (
  SELECT site_id FROM package_types WHERE price > (
    SELECT AVG(price) FROM package_types
  )
);

-- 63. Find all bins for sites with lodge rating below 4.
SELECT bin_location
FROM iot_bin_sensors
WHERE site_id IN (
  SELECT site_id FROM eco_lodges WHERE rating < 4
);

-- 64. List all guides for sites with more than 2 artisans named 'Meera'.
SELECT guide_program
FROM eco_guides
WHERE site_id IN (
  SELECT site_id FROM tribes WHERE tribe_id IN (
    SELECT tribe_id FROM local_artisians WHERE name LIKE '%Meera%'
    GROUP BY tribe_id HAVING COUNT(*) > 2
  )
);

-- 65. Show workshops for sites with feedback rating above 4.
SELECT workshop_name
FROM cultural_workshops
WHERE site_id IN (
  SELECT site_id FROM public_education_events WHERE feedback_rating > 4
);

-- 66. Find all tribes for sites with package duration 5+ days.
SELECT tribe_name
FROM tribes
WHERE site_id IN (
  SELECT site_id FROM package_types WHERE duration_days >= 5
);

-- 67. List all guides for sites with artisan craft type 'Weaving'.
SELECT guide_program
FROM eco_guides
WHERE site_id IN (
  SELECT site_id FROM tribes WHERE tribe_id IN (
    SELECT tribe_id FROM local_artisians WHERE craft_type = 'Weaving'
  )
);

-- 68. Show all bins for sites with more than 1 festival event.
SELECT bin_location
FROM iot_bin_sensors
WHERE site_id IN (
  SELECT site_id FROM public_education_events WHERE event_type = 'Festival'
  GROUP BY site_id HAVING COUNT(*) > 1
);

-- 69. Find all workshops for sites with conservation area below 50km2.
SELECT workshop_name
FROM cultural_workshops
WHERE site_id IN (
  SELECT site_id FROM conservation_areas WHERE area_size_km2 < 50
);

-- 70. List all guides for sites with lodge type 'Resort'.
SELECT guide_program
FROM eco_guides
WHERE site_id IN (
  SELECT site_id FROM eco_lodges WHERE lodge_type = 'Resort'
);

-- 71. Show all tribes for sites with average booking amount above 8000.
SELECT tribe_name
FROM tribes
WHERE site_id IN (
  SELECT site_id FROM booking_history GROUP BY site_id HAVING AVG(total_amount) > 8000
);

-- 72. Find all workshops for sites with more than 2 public events.
SELECT workshop_name
FROM cultural_workshops
WHERE site_id IN (
  SELECT site_id FROM public_education_events GROUP BY site_id HAVING COUNT(*) > 2
);

-- 73. List all guides for sites with at least one artisan named 'Radha'.
SELECT guide_program
FROM eco_guides
WHERE site_id IN (
  SELECT site_id FROM tribes WHERE tribe_id IN (
    SELECT tribe_id FROM local_artisians WHERE name LIKE '%Radha%'
  )
);

-- 74. Show all workshops for sites with package category 'Wellness'.
SELECT workshop_name
FROM cultural_workshops
WHERE site_id IN (
  SELECT site_id FROM package_types WHERE package_category = 'Wellness'
);

-- 75. Find all bins for sites with feedback sentiment 'Positive'.
SELECT bin_location
FROM iot_bin_sensors
WHERE site_id IN (
  SELECT site_id FROM booking_history WHERE booking_id IN (
    SELECT booking_id FROM tourist_feedback WHERE sentiment = 'Positive'
  )
);

-- 76. List all guides for sites with artisan craft type containing 'carving'.
SELECT guide_program
FROM eco_guides
WHERE site_id IN (
  SELECT site_id FROM tribes WHERE tribe_id IN (
    SELECT tribe_id FROM local_artisians WHERE craft_type LIKE '%carving%'
  )
);

-- 77. Show workshops for sites with lodge capacity above 20.
SELECT workshop_name
FROM cultural_workshops
WHERE site_id IN (
  SELECT site_id FROM eco_lodges WHERE capacity > 20
);

-- 78. Find all guides for sites with package price below 6000.
SELECT guide_program
FROM eco_guides
WHERE site_id IN (
  SELECT site_id FROM package_types WHERE price < 6000
);

-- 79. List all bins for sites with region 'East'.
SELECT bin_location
FROM iot_bin_sensors
WHERE site_id IN (
  SELECT site_id FROM eco_sites WHERE region = 'East'
);

-- 80. Show all workshops for sites with at least one artisan named 'Deepak'.
SELECT workshop_name
FROM cultural_workshops
WHERE site_id IN (
  SELECT site_id FROM tribes WHERE tribe_id IN (
    SELECT tribe_id FROM local_artisians WHERE name LIKE '%Deepak%'
  )
);

-- 81. Find all guides for sites with package type 'Heritage'.
SELECT guide_program
FROM eco_guides
WHERE site_id IN (
  SELECT site_id FROM package_types WHERE package_category = 'Heritage'
);

-- 82. List all bins for sites with more than 2 artisans.
SELECT bin_location
FROM iot_bin_sensors
WHERE site_id IN (
  SELECT site_id FROM tribes WHERE tribe_id IN (
    SELECT tribe_id FROM local_artisians GROUP BY tribe_id HAVING COUNT(*) > 2
  )
);

-- 83. Show all workshops for sites with 'Community Zone' conservation area.
SELECT workshop_name
FROM cultural_workshops
WHERE site_id IN (
  SELECT site_id FROM conservation_areas WHERE protection_level = 'Community Zone'
);

-- 84. Find all guides for sites with 'Adventure' package category.
SELECT guide_program
FROM eco_guides
WHERE site_id IN (
  SELECT site_id FROM package_types WHERE package_category = 'Adventure'
);

-- 85. List all bins for sites with more than 1 festival event.
SELECT bin_location
FROM iot_bin_sensors
WHERE site_id IN (
  SELECT site_id FROM public_education_events WHERE event_type = 'Festival'
  GROUP BY site_id HAVING COUNT(*) > 1
);

-- 86. Show all workshops for sites where at least one artisan produces 'Basket weaving'.
SELECT workshop_name
FROM cultural_workshops
WHERE site_id IN (
  SELECT site_id FROM tribes WHERE tribe_id IN (
    SELECT tribe_id FROM local_artisians WHERE craft_type = 'Basket weaving'
  )
);

-- 87. Find all guides for sites with 'Painting' workshops.
SELECT guide_program
FROM eco_guides
WHERE site_id IN (
  SELECT site_id FROM cultural_workshops WHERE workshop_type = 'Painting'
);

-- 88. List all bins for sites with more than 2 guides.
SELECT bin_location
FROM iot_bin_sensors
WHERE site_id IN (
  SELECT site_id FROM eco_guides GROUP BY site_id HAVING COUNT(*) > 2
);

-- 89. Show all workshops for sites with feedback rating above 4.5.
SELECT workshop_name
FROM cultural_workshops
WHERE site_id IN (
  SELECT site_id FROM public_education_events WHERE feedback_rating > 4.5
);

-- 90. Find all guides for sites with package price above 15000.
SELECT guide_program
FROM eco_guides
WHERE site_id IN (
  SELECT site_id FROM package_types WHERE price > 15000
);

-- 91. List all bins for sites with more than 1 artisan named 'Ramesh'.
SELECT bin_location
FROM iot_bin_sensors
WHERE site_id IN (
  SELECT site_id FROM tribes WHERE tribe_id IN (
    SELECT tribe_id FROM local_artisians WHERE name LIKE '%Ramesh%'
    GROUP BY tribe_id HAVING COUNT(*) > 1
  )
);

-- 92. Show all workshops for sites with lodge rating above 4.2.
SELECT workshop_name
FROM cultural_workshops
WHERE site_id IN (
  SELECT site_id FROM eco_lodges WHERE rating > 4.2
);

-- 93. Find all guides for sites with region 'North'.
SELECT guide_program
FROM eco_guides
WHERE site_id IN (
  SELECT site_id FROM eco_sites WHERE region = 'North'
);

-- 94. List all bins for sites with public event type 'Awareness'.
SELECT bin_location
FROM iot_bin_sensors
WHERE site_id IN (
  SELECT site_id FROM public_education_events WHERE event_type = 'Awareness'
);

-- 95. Show all workshops for sites with more than 2 bookings.
SELECT workshop_name
FROM cultural_workshops
WHERE site_id IN (
  SELECT site_id FROM booking_history GROUP BY site_id HAVING COUNT(*) > 2
);

-- 96. Find all guides for sites with feedback sentiment 'Neutral'.
SELECT guide_program
FROM eco_guides
WHERE site_id IN (
  SELECT site_id FROM booking_history WHERE booking_id IN (
    SELECT booking_id FROM tourist_feedback WHERE sentiment = 'Neutral'
  )
);

-- 97. List all bins for sites with capacity below 150kg.
SELECT bin_location
FROM iot_bin_sensors
WHERE bin_capacity_kg < 150;

-- 98. Show all workshops for sites with artisan named 'Lalita'.
SELECT workshop_name
FROM cultural_workshops
WHERE site_id IN (
  SELECT site_id FROM tribes WHERE tribe_id IN (
    SELECT tribe_id FROM local_artisians WHERE name LIKE '%Lalita%'
  )
);

-- 99. Find all guides for sites with 'Pottery' workshops.
SELECT guide_program
FROM eco_guides
WHERE site_id IN (
  SELECT site_id FROM cultural_workshops WHERE workshop_type = 'Pottery'
);

-- 100. List all bins for sites with 'Tribal' type.
SELECT bin_location
FROM iot_bin_sensors
WHERE site_id IN (
  SELECT site_id FROM eco_sites WHERE Type = 'Tribal'
);