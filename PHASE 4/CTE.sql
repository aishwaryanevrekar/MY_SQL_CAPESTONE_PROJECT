use sql_capestone_project;

-- 1. List all lodge names and capacities.
WITH L AS (SELECT lodge_name, capacity FROM eco_lodges)
SELECT * FROM L;

-- 2. Show all package names and their prices.
WITH P AS (SELECT package_name, price FROM package_types)
SELECT * FROM P;

-- 3. Find all bookings made by 'Ajay Kumar'.
WITH B AS (SELECT * FROM booking_history WHERE visitor_name = 'Ajay Kumar')
SELECT * FROM B;

-- 4. List lodges with price per night above 2500.
WITH C AS (SELECT lodge_name, price_per_night FROM eco_lodges WHERE price_per_night > 2500)
SELECT * FROM C;

-- 5. Count total lodges.
WITH X AS (SELECT COUNT(*) AS total_lodges FROM eco_lodges)
SELECT * FROM X;

-- 6. Find packages with duration more than 2 days.
WITH P AS (SELECT * FROM package_types WHERE duration_days > 2)
SELECT * FROM P;

-- 7. Show all feedbacks with rating 5.
WITH F AS (SELECT * FROM tourist_feedback WHERE rating = 5)
SELECT * FROM F;

-- 8. List distinct visitor names from booking_history.
WITH V AS (SELECT DISTINCT visitor_name FROM booking_history)
SELECT * FROM V;

-- 9. Find all bookings for site_id 1.
WITH B AS (SELECT * FROM booking_history WHERE site_id = 1)
SELECT * FROM B;

-- 10. Show all lodges with capacity less than 15.
WITH L AS (SELECT lodge_name, capacity FROM eco_lodges WHERE capacity < 15)
SELECT * FROM L;

-- 11. List all package types with price less than 7000.
WITH P AS (SELECT * FROM package_types WHERE price < 7000)
SELECT * FROM P;

-- 12. Show feedback text where rating <= 3.
WITH F AS (SELECT feedback_text FROM tourist_feedback WHERE rating <= 3)
SELECT * FROM F;

-- 13. Find average price per night of all lodges.
WITH A AS (SELECT AVG(price_per_night) AS avg_price FROM eco_lodges)
SELECT * FROM A;

-- 14. Display all bookings with more than 2 guests.
WITH B AS (SELECT * FROM booking_history WHERE num_guests > 2)
SELECT * FROM B;

-- 15. Show all lodges at site_id 5.
WITH L AS (SELECT lodge_name FROM eco_lodges WHERE site_id = 5)
SELECT * FROM L;

-- 16. List feedbacks for booking_id = 1.
WITH F AS (SELECT * FROM tourist_feedback WHERE booking_id = 1)
SELECT * FROM F;

-- 17. Find the total number of bookings for each lodge.
WITH C AS (SELECT lodge_id, COUNT(*) AS cnt FROM booking_history GROUP BY lodge_id)
SELECT * FROM C;

-- 18. Show all packages for site_id = 3.
WITH P AS (SELECT * FROM package_types WHERE site_id = 3)
SELECT * FROM P;

-- 19. Display all bookings with total_amount > 15000.
WITH B AS (SELECT * FROM booking_history WHERE total_amount > 15000)
SELECT * FROM B;

-- 20. List lodge names containing 'Eco'.
WITH L AS (SELECT lodge_name FROM eco_lodges WHERE lodge_name LIKE '%Eco%')
SELECT * FROM L;

-- 21. Show feedbacks with the word 'food'.
WITH F AS (SELECT * FROM tourist_feedback WHERE feedback_text LIKE '%food%')
SELECT * FROM F;

-- 22. Count the number of feedbacks for each rating.
WITH C AS (SELECT rating, COUNT(*) AS cnt FROM tourist_feedback GROUP BY rating)
SELECT * FROM C;

-- 23. Find the highest price per night among all lodges.
WITH M AS (SELECT MAX(price_per_night) AS max_price FROM eco_lodges)
SELECT * FROM M;

-- 24. Show all bookings between 2025-01-10 and 2025-01-20.
WITH B AS (SELECT * FROM booking_history WHERE checkin_date BETWEEN '2025-01-10' AND '2025-01-20')
SELECT * FROM B;

-- 25. List all packages with highlights containing 'safari'.
WITH P AS (SELECT * FROM package_types WHERE highlights LIKE '%safari%')
SELECT * FROM P;

-- 26. Find average number of guests per booking.
WITH A AS (SELECT AVG(num_guests) AS avg_guests FROM booking_history)
SELECT * FROM A;

-- 27. Show all bookings for 'Neha Shah'.
WITH B AS (SELECT * FROM booking_history WHERE visitor_name = 'Neha Shah')
SELECT * FROM B;

-- 28. List lodges with the highest capacity.
WITH M AS (SELECT MAX(capacity) AS max_cap FROM eco_lodges), L AS (SELECT * FROM eco_lodges WHERE capacity = (SELECT max_cap FROM M))
SELECT lodge_name, capacity FROM L;

-- 29. Display feedbacks containing 'guide'.
WITH F AS (SELECT * FROM tourist_feedback WHERE feedback_text LIKE '%guide%')
SELECT * FROM F;

-- 30. List all packages priced above 10000.
WITH P AS (SELECT * FROM package_types WHERE price > 10000)
SELECT * FROM P;

-- 31. Show bookings with exactly 2 guests.
WITH B AS (SELECT * FROM booking_history WHERE num_guests = 2)
SELECT * FROM B;

-- 32. Find the minimum price per night of all lodges.
WITH M AS (SELECT MIN(price_per_night) AS min_price FROM eco_lodges)
SELECT * FROM M;

-- 33. List unique lodge names from booking_history.
WITH L AS (SELECT DISTINCT lodge_id FROM booking_history)
SELECT el.lodge_name FROM L JOIN eco_lodges el ON L.lodge_id = el.lodge_id;

-- 34. Show all feedbacks that mention 'eco'.
WITH F AS (SELECT * FROM tourist_feedback WHERE feedback_text LIKE '%eco%')
SELECT * FROM F;

-- 35. Display all lodge names and their corresponding site_ids.
WITH L AS (SELECT lodge_name, site_id FROM eco_lodges)
SELECT * FROM L;

-- 36. List all packages with duration = 2 days.
WITH P AS (SELECT * FROM package_types WHERE duration_days = 2)
SELECT * FROM P;

-- 37. Show all bookings with total_amount between 10000 and 20000.
WITH B AS (SELECT * FROM booking_history WHERE total_amount BETWEEN 10000 AND 20000)
SELECT * FROM B;

-- 38. Find the average price of all packages.
WITH A AS (SELECT AVG(price) AS avg_price FROM package_types)
SELECT * FROM A;

-- 39. Show bookings for all visitors whose names start with 'A'.
WITH B AS (SELECT * FROM booking_history WHERE visitor_name LIKE 'A%')
SELECT * FROM B;

-- 40. List all feedbacks for bookings at lodge_id = 2.
WITH B AS (SELECT booking_id FROM booking_history WHERE lodge_id = 2)
SELECT * FROM tourist_feedback WHERE booking_id IN (SELECT booking_id FROM B);

-- 41. Show all lodges with amenities including 'organic'.
WITH L AS (SELECT * FROM eco_lodges WHERE amenities LIKE '%organic%')
SELECT * FROM L;

-- 42. Find the number of bookings at each site.
WITH C AS (SELECT site_id, COUNT(*) AS cnt FROM booking_history GROUP BY site_id)
SELECT * FROM C;

-- 43. List all packages for which the highlights include 'trek'.
WITH P AS (SELECT * FROM package_types WHERE highlights LIKE '%trek%')
SELECT * FROM P;

-- 44. Show bookings made after '2025-01-25'.
WITH B AS (SELECT * FROM booking_history WHERE checkin_date > '2025-01-25')
SELECT * FROM B;

-- 45. List all feedbacks with rating = 4.
WITH F AS (SELECT * FROM tourist_feedback WHERE rating = 4)
SELECT * FROM F;

-- 46. Show all lodges with price per night between 2000 and 3500.
WITH L AS (SELECT * FROM eco_lodges WHERE price_per_night BETWEEN 2000 AND 3500)
SELECT * FROM L;

-- 47. Find the total revenue generated by each lodge.
SELECT lodge_id, SUM(total_amount) AS revenue FROM booking_history GROUP BY lodge_id;
WITH R AS (SELECT lodge_id, SUM(total_amount) AS revenue FROM booking_history GROUP BY lodge_id)
SELECT el.lodge_name, R.revenue FROM R JOIN eco_lodges el ON R.lodge_id = el.lodge_id;

-- 48. List all packages for site_id = 7.
WITH P AS (SELECT * FROM package_types WHERE site_id = 7)
SELECT * FROM P;

-- 49. Show bookings with checkout_date after '2025-02-01'.
WITH B AS (SELECT * FROM booking_history WHERE checkout_date > '2025-02-01')
SELECT * FROM B;

-- 50. Display average rating from tourist_feedback.
WITH A AS (SELECT AVG(rating) AS avg_rating FROM tourist_feedback)
SELECT * FROM A;

-- 51. List all lodges whose name ends with 'Camp'.
WITH L AS (SELECT * FROM eco_lodges WHERE lodge_name LIKE '%Camp')
SELECT * FROM L;

-- 52. Show all bookings for 'Ravi Shankar'.
WITH B AS (SELECT * FROM booking_history WHERE visitor_name = 'Ravi Shankar')
SELECT * FROM B;

-- 53. List names of packages that cost exactly 8500.
WITH P AS (SELECT package_name FROM package_types WHERE price = 8500)
SELECT * FROM P;

-- 54. Show feedbacks with the text length over 30.
WITH F AS (SELECT * FROM tourist_feedback WHERE LENGTH(feedback_text) > 30)
SELECT * FROM F;

-- 55. Find the site with the most lodges.
WITH C AS (SELECT site_id, COUNT(*) AS cnt FROM eco_lodges GROUP BY site_id), M AS (SELECT MAX(cnt) AS max_cnt FROM C)
SELECT site_id, cnt FROM C WHERE cnt = (SELECT max_cnt FROM M);

-- 56. List all bookings at 'Manas Community Eco Camp'.
WITH L AS (SELECT lodge_id FROM eco_lodges WHERE lodge_name = 'Manas Community Eco Camp')
SELECT * FROM booking_history WHERE lodge_id IN (SELECT lodge_id FROM L);

-- 57. Show all packages where highlights mention 'boat'.
WITH P AS (SELECT * FROM package_types WHERE highlights LIKE '%boat%')
SELECT * FROM P;

-- 58. List all feedbacks for visitor 'Sunita Yadav'.
WITH B AS (SELECT booking_id FROM booking_history WHERE visitor_name = 'Sunita Yadav')
SELECT * FROM tourist_feedback WHERE booking_id IN (SELECT booking_id FROM B);

-- 59. Show all lodges with capacity >= 20.
WITH L AS (SELECT * FROM eco_lodges WHERE capacity >= 20)
SELECT * FROM L;

-- 60. Find average duration of all packages.
WITH A AS (SELECT AVG(duration_days) AS avg_days FROM package_types)
SELECT * FROM A;

-- 61. List all booking_ids with total_amount = 14000.
WITH B AS (SELECT booking_id FROM booking_history WHERE total_amount = 14000)
SELECT * FROM B;

-- 62. Show all packages for which the package name contains 'Adventure'.
WITH P AS (SELECT * FROM package_types WHERE package_name LIKE '%Adventure%')
SELECT * FROM P;

-- 63. List all bookings with num_guests > 3.
WITH B AS (SELECT * FROM booking_history WHERE num_guests > 3)
SELECT * FROM B;

-- 64. Show feedbacks where the text includes 'stay'.
WITH F AS (SELECT * FROM tourist_feedback WHERE feedback_text LIKE '%stay%')
SELECT * FROM F;

-- 65. Find the earliest checkin_date in booking_history.
WITH M AS (SELECT MIN(checkin_date) AS min_date FROM booking_history)
SELECT * FROM M;

-- 66. List all lodges with price_per_night = 2100.
WITH L AS (SELECT * FROM eco_lodges WHERE price_per_night = 2100)
SELECT * FROM L;

-- 67. Show all feedbacks for booking_ids greater than 4.
WITH F AS (SELECT * FROM tourist_feedback WHERE booking_id > 4)
SELECT * FROM F;

-- 68. List all bookings for visitor names ending with 'Shah'.
WITH B AS (SELECT * FROM booking_history WHERE visitor_name LIKE '%Shah')
SELECT * FROM B;

-- 69. Display all packages with duration_days < 3.
WITH P AS (SELECT * FROM package_types WHERE duration_days < 3)
SELECT * FROM P;

-- 70. Find the number of bookings for each package.
WITH C AS (SELECT package_id, COUNT(*) AS cnt FROM booking_history GROUP BY package_id)
SELECT * FROM C;

-- 71. Show all feedbacks where rating = 3.
WITH F AS (SELECT * FROM tourist_feedback WHERE rating = 3)
SELECT * FROM F;

-- 72. List lodge names and their amenities.
WITH L AS (SELECT lodge_name, amenities FROM eco_lodges)
SELECT * FROM L;

-- 73. Show all bookings with num_guests = 2 and total_amount < 15000.
WITH B AS (SELECT * FROM booking_history WHERE num_guests = 2 AND total_amount < 15000)
SELECT * FROM B;

-- 74. List all packages for site_id = 8.
WITH P AS (SELECT * FROM package_types WHERE site_id = 8)
SELECT * FROM P;

-- 75. Find the maximum number of guests in a booking.
WITH M AS (SELECT MAX(num_guests) AS max_guests FROM booking_history)
SELECT * FROM M;

-- 76. Display feedbacks that contain 'cultural'.
WITH F AS (SELECT * FROM tourist_feedback WHERE feedback_text LIKE '%cultural%')
SELECT * FROM F;

-- 77. List all bookings with checkin_date in January 2025.
WITH B AS (SELECT * FROM booking_history WHERE checkin_date BETWEEN '2025-01-01' AND '2025-01-31')
SELECT * FROM B;

-- 78. Show package names with price less than 6000.
WITH P AS (SELECT package_name FROM package_types WHERE price < 6000)
SELECT * FROM P;

-- 79. List all lodges whose name includes 'Hut'.
WITH L AS (SELECT lodge_name FROM eco_lodges WHERE lodge_name LIKE '%Hut%')
SELECT * FROM L;

-- 80. Show all feedbacks for bookings at site_id = 2.
WITH B AS (SELECT booking_id FROM booking_history WHERE site_id = 2)
SELECT * FROM tourist_feedback WHERE booking_id IN (SELECT booking_id FROM B);

-- 81. List all bookings for package_id = 3.
WITH B AS (SELECT * FROM booking_history WHERE package_id = 3)
SELECT * FROM B;

-- 82. Find the lodge(s) with the lowest price per night.
WITH M AS (SELECT MIN(price_per_night) AS min_price FROM eco_lodges), L AS (SELECT * FROM eco_lodges WHERE price_per_night = (SELECT min_price FROM M))
SELECT lodge_name, price_per_night FROM L;

-- 83. Show feedbacks where the text contains 'amazing'.
WITH F AS (SELECT * FROM tourist_feedback WHERE feedback_text LIKE '%amazing%')
SELECT * FROM F;

-- 84. List all packages for site_id = 9.
WITH P AS (SELECT * FROM package_types WHERE site_id = 9)
SELECT * FROM P;

-- 85. Show all bookings for 'Swati Menon'.
WITH B AS (SELECT * FROM booking_history WHERE visitor_name = 'Swati Menon')
SELECT * FROM B;

-- 86. Find the longest package (max duration_days).
WITH M AS (SELECT MAX(duration_days) AS max_days FROM package_types)
SELECT * FROM M;

-- 87. List all feedbacks for ratings less than 4.
WITH F AS (SELECT * FROM tourist_feedback WHERE rating < 4)
SELECT * FROM F;

-- 88. Show all lodges with amenities containing 'bird'.
WITH L AS (SELECT * FROM eco_lodges WHERE amenities LIKE '%bird%')
SELECT * FROM L;

-- 89. List all bookings for package names containing 'Nature'.
WITH P AS (SELECT package_id FROM package_types WHERE package_name LIKE '%Nature%')
SELECT * FROM booking_history WHERE package_id IN (SELECT package_id FROM P);

-- 90. Show feedbacks with rating = 2.
WITH F AS (SELECT * FROM tourist_feedback WHERE rating = 2)
SELECT * FROM F;

-- 91. List all lodges at site_id = 10.
WITH L AS (SELECT * FROM eco_lodges WHERE site_id = 10)
SELECT * FROM L;

-- 92. Show all packages with highlights mentioning 'cultural'.
WITH P AS (SELECT * FROM package_types WHERE highlights LIKE '%cultural%')
SELECT * FROM P;

-- 93. List feedbacks where feedback_text contains 'package'.
WITH F AS (SELECT * FROM tourist_feedback WHERE feedback_text LIKE '%package%')
SELECT * FROM F;

-- 94. Find the sum of all total_amount in booking_history.
WITH S AS (SELECT SUM(total_amount) AS total_sum FROM booking_history)
SELECT * FROM S;

-- 95. Show all bookings for lodge_id = 5.
WITH B AS (SELECT * FROM booking_history WHERE lodge_id = 5)
SELECT * FROM B;

-- 96. List package names with highlights containing 'forest'.
WITH P AS (SELECT package_name FROM package_types WHERE highlights LIKE '%forest%')
SELECT * FROM P;

-- 97. Show all bookings for visitor_name = 'Tanya Das'.
WITH B AS (SELECT * FROM booking_history WHERE visitor_name = 'Tanya Das')
SELECT * FROM B;

-- 98. List all feedbacks that mention 'bird'.
WITH F AS (SELECT * FROM tourist_feedback WHERE feedback_text LIKE '%bird%')
SELECT * FROM F;

-- 99. Show all bookings for lodges with capacity > 20.
WITH L AS (SELECT lodge_id FROM eco_lodges WHERE capacity > 20)
SELECT * FROM booking_history WHERE lodge_id IN (SELECT lodge_id FROM L);

-- 100. Find the average total_amount per booking.
WITH A AS (SELECT AVG(total_amount) AS avg_amount FROM booking_history)
SELECT * FROM A;