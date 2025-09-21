use sql_capestone_project;
-- FUNCTIONS PART 2

-- 9. youth awareness
DELIMITER //
-- 1. get program name by 1
CREATE FUNCTION fn_program_name(pid INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE ans VARCHAR(100);

    SELECT program_name 
    INTO ans
    FROM youth_awareness_programs
    WHERE program_id = pid;

    RETURN ans;
END //

DELIMITER ;

-- 2. get program by theme
DELIMITER //

CREATE FUNCTION fn_program_theme(pid INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE ans VARCHAR(100);

    SELECT theme
    INTO ans
    FROM youth_awareness_programs
    WHERE program_id = pid;

    RETURN ans;
END //

DELIMITER ;

-- 3. count all programs
DELIMITER //

CREATE FUNCTION fn_count_programs()
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE ans INT;

    SELECT COUNT(*)
    INTO ans
    FROM youth_awareness_programs;

    RETURN ans;
END //

DELIMITER ;

-- 4. count programs by site
DELIMITER //

CREATE FUNCTION fn_programs_by_site(sid INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE ans INT;

    SELECT COUNT(*)
    INTO ans
    FROM youth_awareness_programs
    WHERE site_id = sid;

    RETURN ans;
END //

DELIMITER ;

-- 5. Longest description
DELIMITER //

CREATE FUNCTION fn_longest_program_desc()
RETURNS TEXT
DETERMINISTIC
BEGIN
    DECLARE ans TEXT;

    SELECT description
    INTO ans
    FROM youth_awareness_programs
    ORDER BY CHAR_LENGTH(description) DESC
    LIMIT 1;

    RETURN ans;
END //

DELIMITER ;

-- Shortest describe
DELIMITER //

CREATE FUNCTION fn_shortest_program_desc()
RETURNS TEXT
DETERMINISTIC
BEGIN
    DECLARE ans TEXT;

    SELECT description
    INTO ans
    FROM youth_awareness_programs
    ORDER BY CHAR_LENGTH(description) ASC
    LIMIT 1;

    RETURN ans;
END //

DELIMITER ;

-- 7. check if program exists
DELIMITER //

CREATE FUNCTION fn_program_exist(pid INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE ans INT DEFAULT 0;

    IF EXISTS (SELECT 1 FROM youth_awareness_programs WHERE program_id = pid) THEN
        SET ans = 1;
    END IF;

    RETURN ans;
END //

DELIMITER ;
-- 8. avg length
DELIMITER //

CREATE FUNCTION fn_avg_program_desc_size()
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE ans DECIMAL(10,2);

    SELECT AVG(CHAR_LENGTH(description))
    INTO ans
    FROM youth_awareness_programs;

    RETURN ans;
END //

DELIMITER ;

-- 9. using group_concat
drop function fn_program_theme_list;

DELIMITER //

CREATE FUNCTION fn_program_theme_list()
RETURNS TEXT
DETERMINISTIC
BEGIN
    DECLARE ans TEXT;

    SELECT GROUP_CONCAT(DISTINCT program_type ORDER BY program_type ASC SEPARATOR ', ')
    INTO ans
    FROM youth_awareness_programs;

    RETURN ans;
END //

DELIMITER ;

select fn_program_theme_list();

-- 10. count programs by year
DELIMITER //

CREATE FUNCTION fn_programs_by_year(y INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE ans INT;

    SELECT COUNT(*)
    INTO ans
    FROM youth_awareness_programs
    WHERE YEAR(program_date) = y;

    RETURN ans;
END //

DELIMITER ;
drop function fn_programs_by_year;

DELIMITER //
-- 10. programs by season
CREATE FUNCTION fn_programs_by_season(seasonName VARCHAR(50))
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE ans INT;

    SELECT COUNT(*)
    INTO ans
    FROM youth_awareness_programs
    WHERE season = seasonName;

    RETURN ans;
END //

DELIMITER ;

select fn_programs_by_season('Winter');

-- table  10. public_education_events

-- 1.Function to return event name by ID.
select *  from public_education_events;
delimiter //
create function fn_publicevent_name(eventt int)
returns varchar(100)
deterministic
begin 
		declare event varchar(100);
        select event_name into event
        from public_education_events
		where event_id =eventt;
        return event;
end //
delimiter ;
select fn_publicevent_name(1);

-- 2. Function to return event type by ID.
delimiter //
create function fn_publicevent_type(eventt int)
returns varchar(100)
deterministic
begin 
		declare event varchar(100);
        select event_type into event
        from public_education_events
		where event_id =eventt;
        return event;
end //
delimiter ;
select fn_publicevent_type(1);

-- 3. Function to count total events.
delimiter //
create function fn_publicevent_total()
returns int
deterministic
begin 
		declare event int;
        select count(*) into event
        from public_education_events;
        return event;
end //
delimiter ;
select fn_publicevent_total();

-- 5. Function to count events by site.
DELIMITER //

CREATE FUNCTION fn_events_by_site(sid INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE ans INT;

    SELECT COUNT(*)
    INTO ans
    FROM public_education_events
    WHERE site_id = sid;

    RETURN ans;
END //

DELIMITER ;

-- 6. Function to return earliest event date.

DELIMITER //

CREATE FUNCTION fn_first_event_date()
RETURNS DATE
DETERMINISTIC
BEGIN
    DECLARE ans DATE;

    SELECT MIN(event_date)
    INTO ans
    FROM public_education_events;

    RETURN ans;
END //

DELIMITER ;


-- 7. Function to return latest event date.
DELIMITER //

CREATE FUNCTION fn_last_event_date()
RETURNS DATE
DETERMINISTIC
BEGIN
    DECLARE ans DATE;

    SELECT MAX(event_date)
    INTO ans
    FROM public_education_events;

    RETURN ans;
END //

DELIMITER ;

-- 8. Function to check if event exists by ID.
DELIMITER //

CREATE FUNCTION fn_event_exist(eid INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE ans INT DEFAULT 0;

    IF EXISTS (SELECT 1 FROM public_education_events WHERE event_id = eid) THEN
        SET ans = 1;
    END IF;

    RETURN ans;
END //

DELIMITER ;

-- 9. Function to return longest event description.
DELIMITER //

CREATE FUNCTION fn_longest_event_desc()
RETURNS TEXT
DETERMINISTIC
BEGIN
    DECLARE ans TEXT;

    SELECT description
    INTO ans
    FROM public_education_events
    ORDER BY CHAR_LENGTH(description) DESC
    LIMIT 1;

    RETURN ans;
END //

DELIMITER ;

-- 10. Function to return average participants per event.
DELIMITER //

CREATE FUNCTION fn_avg_event_participants()
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE ans DECIMAL(10,2);

    SELECT AVG(participants)
    INTO ans
    FROM public_education_events;

    RETURN ans;
END //

DELIMITER ;

-- TABLE 11. PACKAGE_TYPES

-- PACKAGE NAME BY ID
DELIMITER //

CREATE FUNCTION fn_package_name(pid INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE ans VARCHAR(100);

    SELECT package_name
    INTO ans
    FROM package_types
    WHERE package_id = pid;

    RETURN ans;
END //

DELIMITER ;

SELECT FN_PACKAGE_NAME(1);

-- 2. PACKAGE PRICE
DELIMITER //

CREATE FUNCTION fn_package_price(pid INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE ans DECIMAL(10,2);

    SELECT price
    INTO ans
    FROM package_types
    WHERE package_id = pid;

    RETURN ans;
END //

DELIMITER ;

-- 3. TOTAL PACKAGES
DELIMITER //

CREATE FUNCTION fn_count_packages()
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE ans INT;

    SELECT COUNT(*)
    INTO ans
    FROM package_types;

    RETURN ans;
END //

DELIMITER ;

-- 4. PACKAGE BY SITE COUNT
DELIMITER //

CREATE FUNCTION fn_packages_by_site(sid INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE ans INT;

    SELECT COUNT(*)
    INTO ans
    FROM package_types
    WHERE site_id = sid;

    RETURN ans;
END //

DELIMITER ;


-- 5. CHEAP PACKAGE NAME
DELIMITER //

CREATE FUNCTION fn_cheapest_package()
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE ans VARCHAR(100);

    SELECT package_name
    INTO ans
    FROM package_types
    ORDER BY price ASC
    LIMIT 1;

    RETURN ans;
END //

DELIMITER ;

-- 6. MOST EXPENSIVE PACKAGE
DELIMITER //

CREATE FUNCTION fn_costliest_package()
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE ans VARCHAR(100);

    SELECT package_name
    INTO ans
    FROM package_types
    ORDER BY price DESC
    LIMIT 1;

    RETURN ans;
END //

DELIMITER ;

-- 7. PACKAGE EXIST BY ID
DELIMITER //

CREATE FUNCTION fn_package_exist(pid INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE ans INT DEFAULT 0;

    IF EXISTS (SELECT 1 FROM package_types WHERE package_id = pid) THEN
        SET ans = 1;
    END IF;

    RETURN ans;
END //

DELIMITER ;
select fn_package_exist(250);

-- 8. avg price
DELIMITER //

CREATE FUNCTION fn_avg_package_price()
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE ans DECIMAL(10,2);

    SELECT AVG(price)
    INTO ans
    FROM package_types;

    RETURN ans;
END //

DELIMITER ;

-- 9. sum of all package price
DELIMITER //

CREATE FUNCTION fn_total_package_price()
RETURNS DECIMAL(15,2)
DETERMINISTIC
BEGIN
    DECLARE ans DECIMAL(15,2);

    SELECT SUM(price)
    INTO ans
    FROM package_types;

    RETURN ans;
END //

DELIMITER ;

-- 10. package description by id
DELIMITER //

CREATE FUNCTION fn_package_desc(pid INT)
RETURNS TEXT
DETERMINISTIC
BEGIN
    DECLARE ans TEXT;

    SELECT description
    INTO ans
    FROM package_types
    WHERE package_id = pid;

    RETURN ans;
END //

DELIMITER ;

-- 12. booking history

-- 1. Return booking date for a given booking ID
DROP FUNCTION IF EXISTS fn_booking_date;
DELIMITER //
CREATE FUNCTION fn_booking_date(bid INT)
RETURNS DATE
DETERMINISTIC
BEGIN
  DECLARE ans DATE;
  SELECT booking_date INTO ans FROM booking_history WHERE booking_id = bid;
  RETURN ans;
END //
DELIMITER ;

-- 2. Return package ID linked to a given booking ID
DROP FUNCTION IF EXISTS fn_booking_package;
DELIMITER //
CREATE FUNCTION fn_booking_package(bid INT)
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE ans INT;
  SELECT package_id INTO ans FROM booking_history WHERE booking_id = bid;
  RETURN ans;
END //
DELIMITER ;

-- 3. Count all bookings
DROP FUNCTION IF EXISTS fn_count_bookings;
DELIMITER //
CREATE FUNCTION fn_count_bookings()
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE ans INT;
  SELECT COUNT(*) INTO ans FROM booking_history;
  RETURN ans;
END //
DELIMITER ;

-- 4. Count bookings linked to a given site
DROP FUNCTION IF EXISTS fn_bookings_by_site;
DELIMITER //
CREATE FUNCTION fn_bookings_by_site(sid INT)
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE ans INT;
  SELECT COUNT(*) INTO ans FROM booking_history WHERE site_id = sid;
  RETURN ans;
END //
DELIMITER ;

-- 5. Return the most recent booking date
DROP FUNCTION IF EXISTS fn_last_booking_date;
DELIMITER //
CREATE FUNCTION fn_last_booking_date()
RETURNS DATE
DETERMINISTIC
BEGIN
  DECLARE ans DATE;
  SELECT MAX(booking_date) INTO ans FROM booking_history;
  RETURN ans;
END //
DELIMITER ;

-- 6. Return the earliest booking date
DROP FUNCTION IF EXISTS fn_first_booking_date;
DELIMITER //
CREATE FUNCTION fn_first_booking_date()
RETURNS DATE
DETERMINISTIC
BEGIN
  DECLARE ans DATE;
  SELECT MIN(booking_date) INTO ans FROM booking_history;
  RETURN ans;
END //
DELIMITER ;

-- 7. Check if a booking exists by ID (1 if exists, else 0)
DROP FUNCTION IF EXISTS fn_booking_exist;
DELIMITER //
CREATE FUNCTION fn_booking_exist(bid INT)
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE ans INT DEFAULT 0;
  IF EXISTS (SELECT 1 FROM booking_history WHERE booking_id = bid) THEN
    SET ans = 1;
  END IF;
  RETURN ans;
END //
DELIMITER ;

-- 8. Return total revenue from all bookings
DROP FUNCTION IF EXISTS fn_total_booking_revenue;
DELIMITER //
CREATE FUNCTION fn_total_booking_revenue()
RETURNS DECIMAL(15,2)
DETERMINISTIC
BEGIN
  DECLARE ans DECIMAL(15,2);
  SELECT IFNULL(SUM(total_amount),0) INTO ans FROM booking_history;
  RETURN ans;
END //
DELIMITER ;

-- 9. Return average revenue per booking
DROP FUNCTION IF EXISTS fn_avg_booking_revenue;
DELIMITER //
CREATE FUNCTION fn_avg_booking_revenue()
RETURNS DECIMAL(12,2)
DETERMINISTIC
BEGIN
  DECLARE ans DECIMAL(12,2);
  SELECT IFNULL(AVG(total_amount),0) INTO ans FROM booking_history;
  RETURN ans;
END //
DELIMITER ;

-- 10. Count how many bookings were made by a given customer
DROP FUNCTION IF EXISTS fn_bookings_by_customer;
DELIMITER //
CREATE FUNCTION fn_bookings_by_customer(cid INT)
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE ans INT;
  SELECT COUNT(*) INTO ans FROM booking_history WHERE customer_id = cid;
  RETURN ans;
END //
DELIMITER ;

-- 13. waste category



-- 1. Return category name for a given category ID
DROP FUNCTION IF EXISTS fn_category_name;
DELIMITER //
CREATE FUNCTION fn_category_name(cid INT)
RETURNS VARCHAR(200)
DETERMINISTIC
BEGIN
  DECLARE ans VARCHAR(200);
  SELECT category_name INTO ans FROM waste_category WHERE cat_id = cid;
  RETURN ans;
END //
DELIMITER ;

-- 2. Return category type for a given category ID
DROP FUNCTION IF EXISTS fn_category_type;
DELIMITER //
CREATE FUNCTION fn_category_type(cid INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
  DECLARE ans VARCHAR(100);
  SELECT category_type INTO ans FROM waste_category WHERE cat_id = cid;
  RETURN ans;
END //
DELIMITER ;

-- 3. Count total number of waste categories
DROP FUNCTION IF EXISTS fn_count_categories;
DELIMITER //
CREATE FUNCTION fn_count_categories()
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE ans INT;
  SELECT COUNT(*) INTO ans FROM waste_category;
  RETURN ans;
END //
DELIMITER ;

-- 4. Check if a category exists by ID (1 if exists, else 0)
DROP FUNCTION IF EXISTS fn_category_exist;
DELIMITER //
CREATE FUNCTION fn_category_exist(cid INT)
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE ans INT DEFAULT 0;
  IF EXISTS (SELECT 1 FROM waste_category WHERE cat_id = cid) THEN
    SET ans = 1;
  END IF;
  RETURN ans;
END //
DELIMITER ;

-- 5. Return the longest category name
DROP FUNCTION IF EXISTS fn_longest_category_name;
DELIMITER //
CREATE FUNCTION fn_longest_category_name()
RETURNS VARCHAR(200)
DETERMINISTIC
BEGIN
  DECLARE ans VARCHAR(200);
  SELECT category_name INTO ans FROM waste_category ORDER BY CHAR_LENGTH(category_name) DESC LIMIT 1;
  RETURN ans;
END //
DELIMITER ;

-- 6. Return the shortest category name
DROP FUNCTION IF EXISTS fn_shortest_category_name;
DELIMITER //
CREATE FUNCTION fn_shortest_category_name()
RETURNS VARCHAR(200)
DETERMINISTIC
BEGIN
  DECLARE ans VARCHAR(200);
  SELECT category_name INTO ans FROM waste_category ORDER BY CHAR_LENGTH(category_name) ASC LIMIT 1;
  RETURN ans;
END //
DELIMITER ;

-- 7. Return the average category name length
DROP FUNCTION IF EXISTS fn_avg_category_name_size;
DELIMITER //
CREATE FUNCTION fn_avg_category_name_size()
RETURNS DECIMAL(8,2)
DETERMINISTIC
BEGIN
  DECLARE ans DECIMAL(8,2);
  SELECT AVG(CHAR_LENGTH(category_name)) INTO ans FROM waste_category;
  RETURN ans;
END //
DELIMITER ;

-- 8. Return a list of all category names (comma-separated)
DROP FUNCTION IF EXISTS fn_category_list;
DELIMITER //
CREATE FUNCTION fn_category_list()
RETURNS TEXT
DETERMINISTIC
BEGIN
  DECLARE ans TEXT;
  SELECT GROUP_CONCAT(DISTINCT category_name ORDER BY category_name SEPARATOR ', ') INTO ans FROM waste_category;
  RETURN ans;
END //
DELIMITER ;

-- 9. Count how many categories belong to a given type
DROP FUNCTION IF EXISTS fn_count_categories_by_type;
DELIMITER //
CREATE FUNCTION fn_count_categories_by_type(typ VARCHAR(100))
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE ans INT;
  SELECT COUNT(*) INTO ans FROM waste_category WHERE category_type = typ;
  RETURN ans;
END //
DELIMITER ;

-- 10. Return the description length of a category by ID
DROP FUNCTION IF EXISTS fn_category_desc_size;
DELIMITER //
CREATE FUNCTION fn_category_desc_size(cid INT)
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE ans INT;
  SELECT CHAR_LENGTH(description) INTO ans FROM waste_category WHERE cat_id = cid;
  RETURN ans;
END //
DELIMITER ;


-- 14. waste items 
/* ======================================
   TABLE: waste_items
   Columns assumed: item_id, cat_id, item_name, quantity_kg
   ====================================== */

-- 1. Return item name for a given item ID
DROP FUNCTION IF EXISTS fn_item_name;
DELIMITER //
CREATE FUNCTION fn_item_name(iid INT)
RETURNS VARCHAR(200)
DETERMINISTIC
BEGIN
  DECLARE ans VARCHAR(200);
  SELECT item_name INTO ans FROM waste_items WHERE item_id = iid;
  RETURN ans;
END //
DELIMITER ;

-- 2. Return item weight (in kg) for a given item ID
DROP FUNCTION IF EXISTS fn_item_weight;
DELIMITER //
CREATE FUNCTION fn_item_weight(iid INT)
RETURNS DECIMAL(12,2)
DETERMINISTIC
BEGIN
  DECLARE ans DECIMAL(12,2);
  SELECT quantity_kg INTO ans FROM waste_items WHERE item_id = iid;
  RETURN ans;
END //
DELIMITER ;

-- 3. Count total number of waste items
DROP FUNCTION IF EXISTS fn_count_items;
DELIMITER //
CREATE FUNCTION fn_count_items()
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE ans INT;
  SELECT COUNT(*) INTO ans FROM waste_items;
  RETURN ans;
END //
DELIMITER ;

-- 4. Return the heaviest item (name)
DROP FUNCTION IF EXISTS fn_heaviest_item;
DELIMITER //
CREATE FUNCTION fn_heaviest_item()
RETURNS VARCHAR(200)
DETERMINISTIC
BEGIN
  DECLARE ans VARCHAR(200);
  SELECT item_name INTO ans FROM waste_items ORDER BY quantity_kg DESC LIMIT 1;
  RETURN ans;
END //
DELIMITER ;

-- 5. Return the lightest item (name)
DROP FUNCTION IF EXISTS fn_lightest_item;
DELIMITER //
CREATE FUNCTION fn_lightest_item()
RETURNS VARCHAR(200)
DETERMINISTIC
BEGIN
  DECLARE ans VARCHAR(200);
  SELECT item_name INTO ans FROM waste_items ORDER BY quantity_kg ASC LIMIT 1;
  RETURN ans;
END //
DELIMITER ;

-- 6. Return the average item weight
DROP FUNCTION IF EXISTS fn_avg_item_weight;
DELIMITER //
CREATE FUNCTION fn_avg_item_weight()
RETURNS DECIMAL(12,2)
DETERMINISTIC
BEGIN
  DECLARE ans DECIMAL(12,2);
  SELECT IFNULL(AVG(quantity_kg),0) INTO ans FROM waste_items;
  RETURN ans;
END //
DELIMITER ;

-- 7. Return the total weight of all items
DROP FUNCTION IF EXISTS fn_total_items_weight;
DELIMITER //
CREATE FUNCTION fn_total_items_weight()
RETURNS DECIMAL(15,2)
DETERMINISTIC
BEGIN
  DECLARE ans DECIMAL(15,2);
  SELECT IFNULL(SUM(quantity_kg),0) INTO ans FROM waste_items;
  RETURN ans;
END //
DELIMITER ;

-- 8. Check if an item exists by ID (1 if exists, else 0)
DROP FUNCTION IF EXISTS fn_item_exist;
DELIMITER //
CREATE FUNCTION fn_item_exist(iid INT)
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE ans INT DEFAULT 0;
  IF EXISTS (SELECT 1 FROM waste_items WHERE item_id = iid) THEN
    SET ans = 1;
  END IF;
  RETURN ans;
END //
DELIMITER ;

-- 9. Count items under a given category ID
DROP FUNCTION IF EXISTS fn_items_by_category;
DELIMITER //
CREATE FUNCTION fn_items_by_category(cid INT)
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE ans INT;
  SELECT COUNT(*) INTO ans FROM waste_items WHERE cat_id = cid;
  RETURN ans;
END //
DELIMITER ;

-- 10. Return the longest item name
DROP FUNCTION IF EXISTS fn_longest_item_name;
DELIMITER //
CREATE FUNCTION fn_longest_item_name()
RETURNS VARCHAR(200)
DETERMINISTIC
BEGIN
  DECLARE ans VARCHAR(200);
  SELECT item_name INTO ans FROM waste_items ORDER BY CHAR_LENGTH(item_name) DESC LIMIT 1;
  RETURN ans;
END //
DELIMITER ;

-- 15. disposal methods


-- 1. Return method name for a given method ID
DROP FUNCTION IF EXISTS fn_method_name;
DELIMITER //
CREATE FUNCTION fn_method_name(mid INT)
RETURNS VARCHAR(200)
DETERMINISTIC
BEGIN
  DECLARE ans VARCHAR(200);
  SELECT method_name INTO ans FROM disposal_methods WHERE method_id = mid;
  RETURN ans;
END //
DELIMITER ;

-- 2. Return method type for a given method ID
DROP FUNCTION IF EXISTS fn_method_type;
DELIMITER //
CREATE FUNCTION fn_method_type(mid INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
  DECLARE ans VARCHAR(100);
  SELECT method_type INTO ans FROM disposal_methods WHERE method_id = mid;
  RETURN ans;
END //
DELIMITER ;

-- 3. Count total disposal methods
DROP FUNCTION IF EXISTS fn_count_methods;
DELIMITER //
CREATE FUNCTION fn_count_methods()
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE ans INT;
  SELECT COUNT(*) INTO ans FROM disposal_methods;
  RETURN ans;
END //
DELIMITER ;

-- 4. Check if method exists by ID
DROP FUNCTION IF EXISTS fn_method_exist;
DELIMITER //
CREATE FUNCTION fn_method_exist(mid INT)
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE ans INT DEFAULT 0;
  IF EXISTS (SELECT 1 FROM disposal_methods WHERE method_id = mid) THEN
    SET ans = 1;
  END IF;
  RETURN ans;
END //
DELIMITER ;

-- 5. Return longest method name
DROP FUNCTION IF EXISTS fn_longest_method_name;
DELIMITER //
CREATE FUNCTION fn_longest_method_name()
RETURNS VARCHAR(200)
DETERMINISTIC
BEGIN
  DECLARE ans VARCHAR(200);
  SELECT method_name INTO ans FROM disposal_methods ORDER BY CHAR_LENGTH(method_name) DESC LIMIT 1;
  RETURN ans;
END //
DELIMITER ;

-- 6. Return shortest method name
DROP FUNCTION IF EXISTS fn_shortest_method_name;
DELIMITER //
CREATE FUNCTION fn_shortest_method_name()
RETURNS VARCHAR(200)
DETERMINISTIC
BEGIN
  DECLARE ans VARCHAR(200);
  SELECT method_name INTO ans FROM disposal_methods ORDER BY CHAR_LENGTH(method_name) ASC LIMIT 1;
  RETURN ans;
END //
DELIMITER ;

-- 7. Return average method name length
DROP FUNCTION IF EXISTS fn_avg_method_name_size;
DELIMITER //
CREATE FUNCTION fn_avg_method_name_size()
RETURNS DECIMAL(8,2)
DETERMINISTIC
BEGIN
  DECLARE ans DECIMAL(8,2);
  SELECT AVG(CHAR_LENGTH(method_name)) INTO ans FROM disposal_methods;
  RETURN ans;
END //
DELIMITER ;

-- 8. Return list of all methods (comma-separated)
DROP FUNCTION IF EXISTS fn_method_list;
DELIMITER //
CREATE FUNCTION fn_method_list()
RETURNS TEXT
DETERMINISTIC
BEGIN
  DECLARE ans TEXT;
  SELECT GROUP_CONCAT(DISTINCT method_name ORDER BY method_name SEPARATOR ', ') INTO ans FROM disposal_methods;
  RETURN ans;
END //
DELIMITER ;

-- 9. Count methods by type
DROP FUNCTION IF EXISTS fn_count_methods_by_type;
DELIMITER //
CREATE FUNCTION fn_count_methods_by_type(typ VARCHAR(100))
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE ans INT;
  SELECT COUNT(*) INTO ans FROM disposal_methods WHERE method_type = typ;
  RETURN ans;
END //
DELIMITER ;

-- 10. Return method description for a given ID
DROP FUNCTION IF EXISTS fn_method_desc;
DELIMITER //
CREATE FUNCTION fn_method_desc(mid INT)
RETURNS TEXT
DETERMINISTIC
BEGIN
  DECLARE ans TEXT;
  SELECT description INTO ans FROM disposal_methods WHERE method_id = mid;
  RETURN ans;
END //
DELIMITER ;

-- table 16 : waste sources


-- 1. Return source name for a given source ID
DROP FUNCTION IF EXISTS fn_source_name;
DELIMITER //
CREATE FUNCTION fn_source_name(sid INT)
RETURNS VARCHAR(200)
DETERMINISTIC
BEGIN
  DECLARE ans VARCHAR(200);
  SELECT source_name INTO ans FROM waste_sources WHERE source_id = sid;
  RETURN ans;
END //
DELIMITER ;

-- 2. Return source type for a given source ID
DROP FUNCTION IF EXISTS fn_source_type;
DELIMITER //
CREATE FUNCTION fn_source_type(sid INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
  DECLARE ans VARCHAR(100);
  SELECT source_type INTO ans FROM waste_sources WHERE source_id = sid;
  RETURN ans;
END //
DELIMITER ;

-- 3. Count all waste sources
DROP FUNCTION IF EXISTS fn_count_sources;
DELIMITER //
CREATE FUNCTION fn_count_sources()
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE ans INT;
  SELECT COUNT(*) INTO ans FROM waste_sources;
  RETURN ans;
END //
DELIMITER ;

-- 4. Check if source exists by ID
DROP FUNCTION IF EXISTS fn_source_exist;
DELIMITER //
CREATE FUNCTION fn_source_exist(sid INT)
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE ans INT DEFAULT 0;
  IF EXISTS (SELECT 1 FROM waste_sources WHERE source_id = sid) THEN
    SET ans = 1;
  END IF;
  RETURN ans;
END //
DELIMITER ;

-- 5. Return longest source name
DROP FUNCTION IF EXISTS fn_longest_source_name;
DELIMITER //
CREATE FUNCTION fn_longest_source_name()
RETURNS VARCHAR(200)
DETERMINISTIC
BEGIN
  DECLARE ans VARCHAR(200);
  SELECT source_name INTO ans FROM waste_sources ORDER BY CHAR_LENGTH(source_name) DESC LIMIT 1;
  RETURN ans;
END //
DELIMITER ;

-- 6. Return shortest source name
DROP FUNCTION IF EXISTS fn_shortest_source_name;
DELIMITER //
CREATE FUNCTION fn_shortest_source_name()
RETURNS VARCHAR(200)
DETERMINISTIC
BEGIN
  DECLARE ans VARCHAR(200);
  SELECT source_name INTO ans FROM waste_sources ORDER BY CHAR_LENGTH(source_name) ASC LIMIT 1;
  RETURN ans;
END //
DELIMITER ;

-- 7. Return average source name length
DROP FUNCTION IF EXISTS fn_avg_source_name_size;
DELIMITER //
CREATE FUNCTION fn_avg_source_name_size()
RETURNS DECIMAL(8,2)
DETERMINISTIC
BEGIN
  DECLARE ans DECIMAL(8,2);
  SELECT AVG(CHAR_LENGTH(source_name)) INTO ans FROM waste_sources;
  RETURN ans;
END //
DELIMITER ;

-- 8. Return list of all sources (comma-separated)
DROP FUNCTION IF EXISTS fn_source_list;
DELIMITER //
CREATE FUNCTION fn_source_list()
RETURNS TEXT
DETERMINISTIC
BEGIN
  DECLARE ans TEXT;
  SELECT GROUP_CONCAT(DISTINCT source_name ORDER BY source_name SEPARATOR ', ') INTO ans FROM waste_sources;
  RETURN ans;
END //
DELIMITER ;

-- 9. Count sources by type
DROP FUNCTION IF EXISTS fn_count_sources_by_type;
DELIMITER //
CREATE FUNCTION fn_count_sources_by_type(typ VARCHAR(100))
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE ans INT;
  SELECT COUNT(*) INTO ans FROM waste_sources WHERE source_type = typ;
  RETURN ans;
END //
DELIMITER ;

-- 10. Return source description by ID
DROP FUNCTION IF EXISTS fn_source_desc;
DELIMITER //
CREATE FUNCTION fn_source_desc(sid INT)
RETURNS TEXT
DETERMINISTIC
BEGIN
  DECLARE ans TEXT;
  SELECT description INTO ans FROM waste_sources WHERE source_id = sid;
  RETURN ans;
END //
DELIMITER ;

-- table 17 : recycling centers


-- 1. Return center name by ID
DROP FUNCTION IF EXISTS fn_center_name;
DELIMITER //
CREATE FUNCTION fn_center_name(cid INT)
RETURNS VARCHAR(200)
DETERMINISTIC
BEGIN
  DECLARE ans VARCHAR(200);
  SELECT center_name INTO ans FROM recycling_centers WHERE center_id = cid;
  RETURN ans;
END //
DELIMITER ;

-- 2. Return center capacity by ID
DROP FUNCTION IF EXISTS fn_center_capacity;
DELIMITER //
CREATE FUNCTION fn_center_capacity(cid INT)
RETURNS DECIMAL(12,2)
DETERMINISTIC
BEGIN
  DECLARE ans DECIMAL(12,2);
  SELECT capacity INTO ans FROM recycling_centers WHERE center_id = cid;
  RETURN ans;
END //
DELIMITER ;

-- 3. Count all recycling centers
DROP FUNCTION IF EXISTS fn_count_centers;
DELIMITER //
CREATE FUNCTION fn_count_centers()
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE ans INT;
  SELECT COUNT(*) INTO ans FROM recycling_centers;
  RETURN ans;
END //
DELIMITER ;

-- 4. Return center with maximum capacity
DROP FUNCTION IF EXISTS fn_center_max_capacity;
DELIMITER //
CREATE FUNCTION fn_center_max_capacity()
RETURNS VARCHAR(200)
DETERMINISTIC
BEGIN
  DECLARE ans VARCHAR(200);
  SELECT center_name INTO ans FROM recycling_centers ORDER BY capacity DESC LIMIT 1;
  RETURN ans;
END //
DELIMITER ;

-- 5. Return center with minimum capacity
DROP FUNCTION IF EXISTS fn_center_min_capacity;
DELIMITER //
CREATE FUNCTION fn_center_min_capacity()
RETURNS VARCHAR(200)
DETERMINISTIC
BEGIN
  DECLARE ans VARCHAR(200);
  SELECT center_name INTO ans FROM recycling_centers ORDER BY capacity ASC LIMIT 1;
  RETURN ans;
END //
DELIMITER ;

-- 6. Return average center capacity
DROP FUNCTION IF EXISTS fn_avg_center_capacity;
DELIMITER //
CREATE FUNCTION fn_avg_center_capacity()
RETURNS DECIMAL(12,2)
DETERMINISTIC
BEGIN
  DECLARE ans DECIMAL(12,2);
  SELECT IFNULL(AVG(capacity),0) INTO ans FROM recycling_centers;
  RETURN ans;
END //
DELIMITER ;

-- 7. Return total capacity across all centers
DROP FUNCTION IF EXISTS fn_total_center_capacity;
DELIMITER //
CREATE FUNCTION fn_total_center_capacity()
RETURNS DECIMAL(15,2)
DETERMINISTIC
BEGIN
  DECLARE ans DECIMAL(15,2);
  SELECT IFNULL(SUM(capacity),0) INTO ans FROM recycling_centers;
  RETURN ans;
END //
DELIMITER ;

-- 8. Check if a center exists by ID
DROP FUNCTION IF EXISTS fn_center_exist;
DELIMITER //
CREATE FUNCTION fn_center_exist(cid INT)
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE ans INT DEFAULT 0;
  IF EXISTS (SELECT 1 FROM recycling_centers WHERE center_id = cid) THEN
    SET ans = 1;
  END IF;
  RETURN ans;
END //
DELIMITER ;

-- 9. Return list of all center names
DROP FUNCTION IF EXISTS fn_center_list;
DELIMITER //
CREATE FUNCTION fn_center_list()
RETURNS TEXT
DETERMINISTIC
BEGIN
  DECLARE ans TEXT;
  SELECT GROUP_CONCAT(DISTINCT center_name ORDER BY center_name SEPARATOR ', ') INTO ans FROM recycling_centers;
  RETURN ans;
END //
DELIMITER ;

-- 10. Return center location by ID
DROP FUNCTION IF EXISTS fn_center_location;
DELIMITER //
CREATE FUNCTION fn_center_location(cid INT)
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
  DECLARE ans VARCHAR(255);
  SELECT location INTO ans FROM recycling_centers WHERE center_id = cid;
  RETURN ans;
END //
DELIMITER ;

-- table 18 : reforestation logs


-- 1. Return species planted by log ID
DROP FUNCTION IF EXISTS fn_species_by_log;
DELIMITER //
CREATE FUNCTION fn_species_by_log(lid INT)
RETURNS VARCHAR(200)
DETERMINISTIC
BEGIN
  DECLARE ans VARCHAR(200);
  SELECT species INTO ans FROM reforestation_logs WHERE log_id = lid;
  RETURN ans;
END //
DELIMITER ;

-- 2. Return number of trees planted by log ID
DROP FUNCTION IF EXISTS fn_trees_by_log;
DELIMITER //
CREATE FUNCTION fn_trees_by_log(lid INT)
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE ans INT;
  SELECT trees_planted INTO ans FROM reforestation_logs WHERE log_id = lid;
  RETURN ans;
END //
DELIMITER ;

-- 3. Count all reforestation logs
DROP FUNCTION IF EXISTS fn_count_reforestation_logs;
DELIMITER //
CREATE FUNCTION fn_count_reforestation_logs()
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE ans INT;
  SELECT COUNT(*) INTO ans FROM reforestation_logs;
  RETURN ans;
END //
DELIMITER ;

-- 4. Return total trees planted across all logs
DROP FUNCTION IF EXISTS fn_total_trees_planted;
DELIMITER //
CREATE FUNCTION fn_total_trees_planted()
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE ans INT;
  SELECT IFNULL(SUM(trees_planted),0) INTO ans FROM reforestation_logs;
  RETURN ans;
END //
DELIMITER ;

-- 5. Return maximum trees planted in a single log
DROP FUNCTION IF EXISTS fn_max_trees_in_log;
DELIMITER //
CREATE FUNCTION fn_max_trees_in_log()
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE ans INT;
  SELECT IFNULL(MAX(trees_planted),0) INTO ans FROM reforestation_logs;
  RETURN ans;
END //
DELIMITER ;

-- 6. Return minimum trees planted in a single log
DROP FUNCTION IF EXISTS fn_min_trees_in_log;
DELIMITER //
CREATE FUNCTION fn_min_trees_in_log()
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE ans INT;
  SELECT IFNULL(MIN(trees_planted),0) INTO ans FROM reforestation_logs;
  RETURN ans;
END //
DELIMITER ;

-- 7. Return average number of trees planted
DROP FUNCTION IF EXISTS fn_avg_trees_planted;
DELIMITER //
CREATE FUNCTION fn_avg_trees_planted()
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
  DECLARE ans DECIMAL(10,2);
  SELECT IFNULL(AVG(trees_planted),0) INTO ans FROM reforestation_logs;
  RETURN ans;
END //
DELIMITER ;

-- 8. Return list of all species planted
DROP FUNCTION IF EXISTS fn_species_list;
DELIMITER //
CREATE FUNCTION fn_species_list()
RETURNS TEXT
DETERMINISTIC
BEGIN
  DECLARE ans TEXT;
  SELECT GROUP_CONCAT(DISTINCT species ORDER BY species SEPARATOR ', ') INTO ans FROM reforestation_logs;
  RETURN ans;
END //
DELIMITER ;

-- 9. Count logs for a given tribe ID
DROP FUNCTION IF EXISTS fn_logs_by_tribe;
DELIMITER //
CREATE FUNCTION fn_logs_by_tribe(tid INT)
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE ans INT;
  SELECT COUNT(*) INTO ans FROM reforestation_logs WHERE tribe_id = tid;
  RETURN ans;
END //
DELIMITER ;

-- 10. Count logs for a given year
DROP FUNCTION IF EXISTS fn_logs_by_year;
DELIMITER //
CREATE FUNCTION fn_logs_by_year(y INT)
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE ans INT;
  SELECT COUNT(*) INTO ans FROM reforestation_logs WHERE year = y;
  RETURN ans;
END //
DELIMITER ;


-- table 19 : iot bin sensors
-- 1. Return bin location by sensor ID
DROP FUNCTION IF EXISTS fn_bin_location;
DELIMITER //
CREATE FUNCTION fn_bin_location(sid INT)
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
  DECLARE ans VARCHAR(255);
  SELECT bin_location INTO ans FROM iot_bin_sensors WHERE sensor_id = sid;
  RETURN ans;
END //
DELIMITER ;

-- 2. Return fill level for a given sensor
DROP FUNCTION IF EXISTS fn_fill_level;
DELIMITER //
CREATE FUNCTION fn_fill_level(sid INT)
RETURNS DECIMAL(5,2)
DETERMINISTIC
BEGIN
  DECLARE ans DECIMAL(5,2);
  SELECT fill_level INTO ans FROM iot_bin_sensors WHERE sensor_id = sid;
  RETURN ans;
END //
DELIMITER ;

-- 3. Count all sensors
DROP FUNCTION IF EXISTS fn_count_sensors;
DELIMITER //
CREATE FUNCTION fn_count_sensors()
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE ans INT;
  SELECT COUNT(*) INTO ans FROM iot_bin_sensors;
  RETURN ans;
END //
DELIMITER ;

-- 4. Return sensor with highest fill level
DROP FUNCTION IF EXISTS fn_sensor_max_fill;
DELIMITER //
CREATE FUNCTION fn_sensor_max_fill()
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE ans INT;
  SELECT sensor_id INTO ans FROM iot_bin_sensors ORDER BY fill_level DESC LIMIT 1;
  RETURN ans;
END //
DELIMITER ;

-- 5. Return sensor with lowest fill level
DROP FUNCTION IF EXISTS fn_sensor_min_fill;
DELIMITER //
CREATE FUNCTION fn_sensor_min_fill()
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE ans INT;
  SELECT sensor_id INTO ans FROM iot_bin_sensors ORDER BY fill_level ASC LIMIT 1;
  RETURN ans;
END //
DELIMITER ;

-- 6. Return average fill level
DROP FUNCTION IF EXISTS fn_avg_fill_level;
DELIMITER //
CREATE FUNCTION fn_avg_fill_level()
RETURNS DECIMAL(5,2)
DETERMINISTIC
BEGIN
  DECLARE ans DECIMAL(5,2);
  SELECT IFNULL(AVG(fill_level),0) INTO ans FROM iot_bin_sensors;
  RETURN ans;
END //
DELIMITER ;

-- 7. Return last updated datetime for a given sensor
DROP FUNCTION IF EXISTS fn_sensor_last_updated;
DELIMITER //
CREATE FUNCTION fn_sensor_last_updated(sid INT)
RETURNS DATETIME
DETERMINISTIC
BEGIN
  DECLARE ans DATETIME;
  SELECT last_updated INTO ans FROM iot_bin_sensors WHERE sensor_id = sid;
  RETURN ans;
END //
DELIMITER ;

-- 8. Count sensors by site ID
DROP FUNCTION IF EXISTS fn_sensors_by_site;
DELIMITER //
CREATE FUNCTION fn_sensors_by_site(sid INT)
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE ans INT;
  SELECT COUNT(*) INTO ans FROM iot_bin_sensors WHERE site_id = sid;
  RETURN ans;
END //
DELIMITER ;

-- 9. Check if sensor exists by ID
DROP FUNCTION IF EXISTS fn_sensor_exist;
DELIMITER //
CREATE FUNCTION fn_sensor_exist(sid INT)
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE ans INT DEFAULT 0;
  IF EXISTS (SELECT 1 FROM iot_bin_sensors WHERE sensor_id = sid) THEN
    SET ans = 1;
  END IF;
  RETURN ans;
END //
DELIMITER ;

-- 10. Count sensors updated after a given datetime
DROP FUNCTION IF EXISTS fn_sensors_updated_after;
DELIMITER //
CREATE FUNCTION fn_sensors_updated_after(dt DATETIME)
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE ans INT;
  SELECT COUNT(*) INTO ans FROM iot_bin_sensors WHERE last_updated > dt;
  RETURN ans;
END //

-- TABLE 20 : COLLECTION TRUCKS

-- 1. Return truck number by ID
DROP FUNCTION IF EXISTS fn_truck_number;
DELIMITER //
CREATE FUNCTION fn_truck_number(tid INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
  DECLARE ans VARCHAR(100);
  SELECT truck_number INTO ans FROM collection_trucks WHERE truck_id = tid;
  RETURN ans;
END //
DELIMITER ;

-- 2. Return truck capacity by ID
DROP FUNCTION IF EXISTS fn_truck_capacity;
DELIMITER //
CREATE FUNCTION fn_truck_capacity(tid INT)
RETURNS DECIMAL(12,2)
DETERMINISTIC
BEGIN
  DECLARE ans DECIMAL(12,2);
  SELECT capacity INTO ans FROM collection_trucks WHERE truck_id = tid;
  RETURN ans;
END //
DELIMITER ;

-- 3. Count all trucks
DROP FUNCTION IF EXISTS fn_count_trucks;
DELIMITER //
CREATE FUNCTION fn_count_trucks()
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE ans INT;
  SELECT COUNT(*) INTO ans FROM collection_trucks;
  RETURN ans;
END //
DELIMITER ;

-- 4. Return truck with max capacity
DROP FUNCTION IF EXISTS fn_truck_max_capacity;
DELIMITER //
CREATE FUNCTION fn_truck_max_capacity()
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
  DECLARE ans VARCHAR(100);
  SELECT truck_number INTO ans FROM collection_trucks ORDER BY capacity DESC LIMIT 1;
  RETURN ans;
END //
DELIMITER ;

-- 5. Return truck with min capacity
DROP FUNCTION IF EXISTS fn_truck_min_capacity;
DELIMITER //
CREATE FUNCTION fn_truck_min_capacity()
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
  DECLARE ans VARCHAR(100);
  SELECT truck_number INTO ans FROM collection_trucks ORDER BY capacity ASC LIMIT 1;
  RETURN ans;
END //
DELIMITER ;

-- 6. Return average truck capacity
DROP FUNCTION IF EXISTS fn_avg_truck_capacity;
DELIMITER //
CREATE FUNCTION fn_avg_truck_capacity()
RETURNS DECIMAL(12,2)
DETERMINISTIC
BEGIN
  DECLARE ans DECIMAL(12,2);
  SELECT IFNULL(AVG(capacity),0) INTO ans FROM collection_trucks;
  RETURN ans;
END //
DELIMITER ;

-- 7. Return total truck capacity
DROP FUNCTION IF EXISTS fn_total_truck_capacity;
DELIMITER //
CREATE FUNCTION fn_total_truck_capacity()
RETURNS DECIMAL(15,2)
DETERMINISTIC
BEGIN
  DECLARE ans DECIMAL(15,2);
  SELECT IFNULL(SUM(capacity),0) INTO ans FROM collection_trucks;
  RETURN ans;
END //
DELIMITER ;

-- 8. Return truck status by ID
DROP FUNCTION IF EXISTS fn_truck_status;
DELIMITER //
CREATE FUNCTION fn_truck_status(tid INT)
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
  DECLARE ans VARCHAR(50);
  SELECT status INTO ans FROM collection_trucks WHERE truck_id = tid;
  RETURN ans;
END //
DELIMITER ;

-- 9. Count trucks by site ID
DROP FUNCTION IF EXISTS fn_trucks_by_site;
DELIMITER //
CREATE FUNCTION fn_trucks_by_site(sid INT)
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE ans INT;
  SELECT COUNT(*) INTO ans FROM collection_trucks WHERE site_id = sid;
  RETURN ans;
END //
DELIMITER ;

-- 10. Check if truck exists by ID
DROP FUNCTION IF EXISTS fn_truck_exist;
DELIMITER //
CREATE FUNCTION fn_truck_exist(tid INT)
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE ans INT DEFAULT 0;
  IF EXISTS (SELECT 1 FROM collection_trucks WHERE truck_id = tid) THEN
    SET ans = 1;
  END IF;
  RETURN ans;
END //
DELIMITER ;


-- 21. TABLE WASTE TRANSFER LOGS


-- 1. Return transfer date by ID
DROP FUNCTION IF EXISTS fn_transfer_date;
DELIMITER //
CREATE FUNCTION fn_transfer_date(tid INT)
RETURNS DATE
DETERMINISTIC
BEGIN
  DECLARE ans DATE;
  SELECT transfer_date INTO ans FROM waste_transfer_logs WHERE transfer_id = tid;
  RETURN ans;
END //
DELIMITER ;

-- 2. Return site ID for a given transfer
DROP FUNCTION IF EXISTS fn_transfer_site;
DELIMITER //
CREATE FUNCTION fn_transfer_site(tid INT)
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE ans INT;
  SELECT site_id INTO ans FROM waste_transfer_logs WHERE transfer_id = tid;
  RETURN ans;
END //
DELIMITER ;

-- 3. Return center ID for a given transfer
DROP FUNCTION IF EXISTS fn_transfer_center;
DELIMITER //
CREATE FUNCTION fn_transfer_center(tid INT)
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE ans INT;
  SELECT center_id INTO ans FROM waste_transfer_logs WHERE transfer_id = tid;
  RETURN ans;
END //
DELIMITER ;

-- 4. Count all waste transfers
DROP FUNCTION IF EXISTS fn_count_transfers;
DELIMITER //
CREATE FUNCTION fn_count_transfers()
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE ans INT;
  SELECT COUNT(*) INTO ans FROM waste_transfer_logs;
  RETURN ans;
END //
DELIMITER ;

-- 5. Return most recent transfer date
DROP FUNCTION IF EXISTS fn_last_transfer_date;
DELIMITER //
CREATE FUNCTION fn_last_transfer_date()
RETURNS DATE
DETERMINISTIC
BEGIN
  DECLARE ans DATE;
  SELECT MAX(transfer_date) INTO ans FROM waste_transfer_logs;
  RETURN ans;
END //
DELIMITER ;

-- 6. Return earliest transfer date
DROP FUNCTION IF EXISTS fn_first_transfer_date;
DELIMITER //
CREATE FUNCTION fn_first_transfer_date()
RETURNS DATE
DETERMINISTIC
BEGIN
  DECLARE ans DATE;
  SELECT MIN(transfer_date) INTO ans FROM waste_transfer_logs;
  RETURN ans;
END //
DELIMITER ;

-- 7. Return total waste transferred (kg)
DROP FUNCTION IF EXISTS fn_total_waste_transferred;
DELIMITER //
CREATE FUNCTION fn_total_waste_transferred()
RETURNS DECIMAL(15,2)
DETERMINISTIC
BEGIN
  DECLARE ans DECIMAL(15,2);
  SELECT IFNULL(SUM(waste_amount_kg),0) INTO ans FROM waste_transfer_logs;
  RETURN ans;
END //
DELIMITER ;

-- 8. Return average waste transferred per log
DROP FUNCTION IF EXISTS fn_avg_waste_transferred;
DELIMITER //
CREATE FUNCTION fn_avg_waste_transferred()
RETURNS DECIMAL(12,2)
DETERMINISTIC
BEGIN
  DECLARE ans DECIMAL(12,2);
  SELECT IFNULL(AVG(waste_amount_kg),0) INTO ans FROM waste_transfer_logs;
  RETURN ans;
END //
DELIMITER ;

-- 9. Return maximum waste amount in a single log
DROP FUNCTION IF EXISTS fn_max_waste_transferred;
DELIMITER //
CREATE FUNCTION fn_max_waste_transferred()
RETURNS DECIMAL(12,2)
DETERMINISTIC
BEGIN
  DECLARE ans DECIMAL(12,2);
  SELECT IFNULL(MAX(waste_amount_kg),0) INTO ans FROM waste_transfer_logs;
  RETURN ans;
END //
DELIMITER ;

-- 10. Check if transfer exists by ID
DROP FUNCTION IF EXISTS fn_transfer_exist;
DELIMITER //
CREATE FUNCTION fn_transfer_exist(tid INT)
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE ans INT DEFAULT 0;
  IF EXISTS (SELECT 1 FROM waste_transfer_logs WHERE transfer_id = tid) THEN
    SET ans = 1;
  END IF;
  RETURN ans;
END //
DELIMITER ;
