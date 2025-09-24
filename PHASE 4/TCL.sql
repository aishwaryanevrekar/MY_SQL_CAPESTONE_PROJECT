Use sql_capestone_project;

/*
1. commit
2. rollback
3. savepoint
4. set transaction

COMMIT → Save

ROLLBACK → Undo

SAVEPOINT → Checkpoint

SET TRANSACTION → Control behavior (isolation)
*/

-- 1. eco_sites

start transaction;

INSERT INTO eco_sites (site_name, state_region, key_activites, sustainability_notes, Type)
VALUES ('Demo EcoSite', 'Demo Region', 'Birding, Trekking', 'Demo sustainability note', 'Tribal');

set sql_safe_updates =0;
update eco_sites set state_region='Updated Region'
where site_name='Demo EcoSite';

savepoint eco_step;
select * from eco_sites;
delete from eco_sites where  site_name='Demo EcoSite';

rollback to eco_step;
select * from eco_sites; -- did undo so it is back
commit;

-- 2. visitLlogs

START TRANSACTION;

INSERT INTO visit_logs (site_id, visitor_name, visit_date, activities_done, feedback, rating) 
VALUES (1, 'Test Visitor', '2025-09-24', 'Trekking', 'Good Experience', 4);

UPDATE visit_logs SET rating = 5 WHERE visitor_name = 'Test Visitor';

SAVEPOINT visit_step;

DELETE FROM visit_logs WHERE visitor_name = 'Test Visitor';

ROLLBACK TO visit_step;

COMMIT;

-- 3. tribes
START TRANSACTION;

INSERT INTO tribes (site_id, tribe_name, population_estimate, roles) 
VALUES (1, 'Test Tribe', 500, 'Crafts, Dance');

UPDATE tribes SET population_estimate = 1000 WHERE tribe_name = 'Test Tribe';

SAVEPOINT tribe_step;

DELETE FROM tribes WHERE tribe_name = 'Test Tribe';

ROLLBACK TO tribe_step;

COMMIT;

-- 4. conservation areas

START TRANSACTION;

INSERT INTO conservation_areas 
(site_id, area_name, protection_level, area_size_km2, biodiversity_notes, type_area, p_level_meaning)
VALUES 
(1, 'Demo Conservation Area', 'High', 250.50, 'Demo biodiversity notes', 'Forest', 'Strict protection');
UPDATE conservation_areas
SET biodiversity_notes = 'Updated biodiversity notes for TCL demo'
WHERE area_name = 'Demo Conservation Area';

SAVEPOINT ca_step;

DELETE FROM conservation_areas
WHERE area_name = 'Demo Conservation Area';

ROLLBACK TO ca_step;


COMMIT;

-- 5. cultural assets

START TRANSACTION;


INSERT INTO cultural_assets (tribe_id, asset_type, description)
VALUES (1, 'Dance', 'Demo tribal dance description');


UPDATE cultural_assets
SET description = 'Updated cultural asset description'
WHERE asset_type = 'Dance' AND description = 'Demo tribal dance description';


SAVEPOINT ca_step;
DELETE FROM cultural_assets
WHERE asset_type = 'Dance' AND description = 'Updated cultural asset description';


ROLLBACK TO ca_step;


COMMIT;

-- 6. local artisans
START TRANSACTION;

INSERT INTO local_artisians (tribe_id, name, craft_type, notes, gender)
VALUES (1, 'Demo Artisan', 'Pottery', 'Specializes in clay pots', 'M');

UPDATE local_artisians
SET notes = 'Updated artisan notes'
WHERE name = 'Demo Artisan';

SAVEPOINT la_step;

DELETE FROM local_artisians
WHERE name = 'Demo Artisan';

ROLLBACK TO la_step;

COMMIT;

-- 7. traditional knowledge
START TRANSACTION;

INSERT INTO traditional_knowledge (tribe_id, practice_name, eco_benefit)
VALUES (1, 'Herbal Medicine', 'Used for natural healthcare');

UPDATE traditional_knowledge
SET eco_benefit = 'Updated eco benefit (better phrasing)'
WHERE practice_name = 'Herbal Medicine';

SAVEPOINT tk_step;

DELETE FROM traditional_knowledge
WHERE practice_name = 'Herbal Medicine';

ROLLBACK TO tk_step;

COMMIT;

-- 8. cultural workshops
START TRANSACTION;

INSERT INTO cultural_workshops (site_id, workshop_name, description, target_audience, workshop_type)
VALUES (1, 'Demo Workshop', 'Demo workshop description', 'Students', 'Crafts');

UPDATE cultural_workshops
SET description = 'Updated workshop description'
WHERE workshop_name = 'Demo Workshop';

SAVEPOINT cw_step;

DELETE FROM cultural_workshops
WHERE workshop_name = 'Demo Workshop';

ROLLBACK TO cw_step;

COMMIT;

-- 9. eco_guides
START TRANSACTION;

INSERT INTO eco_guides (site_id, guide_program, description, target_audience, language_supported, rating, max_group_size, duration_hours)
VALUES (1, 'Demo Guide Program', 'Demo description for guide program', 'Tourists', 'English,Hindi', 4.5, 20, 3.5);

UPDATE eco_guides
SET rating = 5.0
WHERE guide_program = 'Demo Guide Program';

SAVEPOINT eg_step;

DELETE FROM eco_guides
WHERE guide_program = 'Demo Guide Program';

ROLLBACK TO eg_step;

COMMIT;

-- 10. youth awareness program

START TRANSACTION;

INSERT INTO youth_awareness_programs (site_id, program_name, description, target_group, program_type, age_group, season, feedback_rating, volunteer_involvement)
VALUES (1, 'Demo Youth Program', 'Demo program description', 'Students', 'Awareness', '15-25', 'Summer', 4.2, 1);

UPDATE youth_awareness_programs
SET feedback_rating = 4.8
WHERE program_name = 'Demo Youth Program';

SAVEPOINT yap_step;

DELETE FROM youth_awareness_programs
WHERE program_name = 'Demo Youth Program';

ROLLBACK TO yap_step;

COMMIT;

-- 11. public educational events
START TRANSACTION;

INSERT INTO public_education_events (site_id, event_name, description, audience, season, age_group, event_type, max_participants, feedback_rating)
VALUES (1, 'Demo Education Event', 'Demo description for education event', 'General Public', 'Winter', 'All', 'Workshop', 100, 4.3);

UPDATE public_education_events
SET feedback_rating = 4.8
WHERE event_name = 'Demo Education Event';

SAVEPOINT pee_step;

DELETE FROM public_education_events
WHERE event_name = 'Demo Education Event';

ROLLBACK TO pee_step;

COMMIT;


-- 12. eco_lodges
START TRANSACTION;

INSERT INTO eco_lodges (site_id, lodge_name, capacity, price_per_night, amenities, lodge_type, facilities, rating, available, min_stay_days, pet_friendly)
VALUES (1, 'Demo Eco Lodge', 20, 1500.00, 'WiFi, Solar Power', 'Cottage', 'Parking, Restaurant', 4.2, 1, 2, 0);

UPDATE eco_lodges
SET rating = 4.9
WHERE lodge_name = 'Demo Eco Lodge';

SAVEPOINT el_step;

DELETE FROM eco_lodges
WHERE lodge_name = 'Demo Eco Lodge';

ROLLBACK TO el_step;

COMMIT;

-- 13. packages types
START TRANSACTION;

INSERT INTO package_types (site_id, package_name, duration_days, price, highlights, package_category, max_guests, recommended_season, difficulty_level, eco_friendly, inclusions)
VALUES (1, 'Demo Adventure Package', 5, 7500.00, 'Trekking, Wildlife Safari', 'Adventure', 15, 'Summer', 'Moderate', 1, 'Meals, Guide, Transport');

UPDATE package_types
SET price = 8000.00
WHERE package_name = 'Demo Adventure Package';

SAVEPOINT pt_step;

DELETE FROM package_types
WHERE package_name = 'Demo Adventure Package';

ROLLBACK TO pt_step;

COMMIT;

-- 14. booking history
START TRANSACTION;

INSERT INTO booking_history (visitor_name, site_id, lodge_id, package_id, checkin_date, checkout_date, num_guests, total_amount, booking_status)
VALUES ('Demo Visitor', 1, 1, 1, '2025-10-01', '2025-10-05', 2, 15000.00, 'Confirmed');

UPDATE booking_history
SET booking_status = 'Cancelled'
WHERE visitor_name = 'Demo Visitor';

SAVEPOINT bh_step;

DELETE FROM booking_history
WHERE visitor_name = 'Demo Visitor';

ROLLBACK TO bh_step;

COMMIT;

-- 15. tourist feedback

START TRANSACTION;

INSERT INTO tourist_feedback (booking_id, feedback_text, rating)
VALUES (1, 'Demo feedback for TCL practice', 4);

UPDATE tourist_feedback
SET rating = 5
WHERE feedback_text = 'Demo feedback for TCL practice';

SAVEPOINT tf_step;

DELETE FROM tourist_feedback
WHERE feedback_text = 'Demo feedback for TCL practice';

ROLLBACK TO tf_step;

COMMIT;

-- 16. waste category
START TRANSACTION;

INSERT INTO waste_category (category_name, description)
VALUES ('Demo Waste', 'Demo waste description');

UPDATE waste_category
SET description = 'Updated waste description'
WHERE category_name = 'Demo Waste';

SAVEPOINT wc_step;

DELETE FROM waste_category
WHERE category_name = 'Demo Waste';

ROLLBACK TO wc_step;

COMMIT;

-- 17. waste_items

START TRANSACTION;

INSERT INTO waste_items (site_id, cat_id, item_name, quantity_kg, date_logged)
VALUES (1, 1, 'Demo Waste Item', 5.50, '2025-09-24');

UPDATE waste_items
SET quantity_kg = 10.00
WHERE item_name = 'Demo Waste Item';

SAVEPOINT wi_step;

DELETE FROM waste_items
WHERE item_name = 'Demo Waste Item';

ROLLBACK TO wi_step;

COMMIT;


-- 18. disposal_methods

START TRANSACTION;

INSERT INTO disposal_methods (method_name, description)
VALUES ('Demo Method', 'Demo disposal description');

UPDATE disposal_methods
SET description = 'Updated disposal description'
WHERE method_name = 'Demo Method';

SAVEPOINT dm_step;

DELETE FROM disposal_methods
WHERE method_name = 'Demo Method';

ROLLBACK TO dm_step;

COMMIT;

-- 19. waste_sources

START TRANSACTION;

INSERT INTO waste_sources (site_id, source_name, description)
VALUES (1, 'Demo Source', 'Demo waste source description');

UPDATE waste_sources
SET description = 'Updated waste source description'
WHERE source_name = 'Demo Source';

SAVEPOINT ws_step;

DELETE FROM waste_sources
WHERE source_name = 'Demo Source';

ROLLBACK TO ws_step;

COMMIT;

-- 20. reycling centers
START TRANSACTION;

INSERT INTO recycling_centers (site_id, center_name, location, contact_info, accepted_waste)
VALUES (1, 'Demo Recycling Center', 'Demo Location', 'demo@eco.org', 'Plastic, Organic');

UPDATE recycling_centers
SET accepted_waste = 'Plastic, Organic, Metal'
WHERE center_name = 'Demo Recycling Center';

SAVEPOINT rc_step;

DELETE FROM recycling_centers
WHERE center_name = 'Demo Recycling Center';

ROLLBACK TO rc_step;

COMMIT;

-- 21. visitor_statistics
START TRANSACTION;

INSERT INTO visitor_statistics (site_id, tribe_id, year, domestic_visitors, foreign_visitors, total_revenue)
VALUES (1, 1, 2025, 2000, 500, 1500000.00);

UPDATE visitor_statistics
SET domestic_visitors = 2500
WHERE year = 2025 AND site_id = 1;

SAVEPOINT vs_step;

DELETE FROM visitor_statistics
WHERE year = 2025 AND site_id = 1;

ROLLBACK TO vs_step;

COMMIT;

-- reforestation logs
START TRANSACTION;

INSERT INTO reforestation_logs (site_id, tribe_id, year, trees_planted, species)
VALUES (1, 1, 2025, 500, 'Demo Tree');

UPDATE reforestation_logs
SET trees_planted = 800
WHERE species = 'Demo Tree';

SAVEPOINT rl_step;

DELETE FROM reforestation_logs
WHERE species = 'Demo Tree';

ROLLBACK TO rl_step;

COMMIT;

-- iot bin sensors
START TRANSACTION;

INSERT INTO iot_bin_sensors (site_id, tribe_id, bin_location, fill_level, last_updated)
VALUES (1, 1, 'Demo Bin Location', 60, '2025-09-24');

UPDATE iot_bin_sensors
SET fill_level = 80
WHERE bin_location = 'Demo Bin Location';

SAVEPOINT ibs_step;

DELETE FROM iot_bin_sensors
WHERE bin_location = 'Demo Bin Location';

ROLLBACK TO ibs_step;

COMMIT;

-- 24. collection_trucks
START TRANSACTION;

INSERT INTO collection_trucks (site_id, tribe_id, truck_number, capacity_tons, status)
VALUES (1, 1, 'DEMO-TRUCK-01', 4.50, 'Active');

UPDATE collection_trucks
SET status = 'Under Maintenance'
WHERE truck_number = 'DEMO-TRUCK-01';

SAVEPOINT ct_step;

DELETE FROM collection_trucks
WHERE truck_number = 'DEMO-TRUCK-01';

ROLLBACK TO ct_step;

COMMIT;

-- 25. waste_transfer logs
START TRANSACTION;

INSERT INTO waste_transfer_logs (site_id, tribe_id, truck_id, center_id, transfer_date, weight_tons)
VALUES (1, 1, 1, 1, '2025-09-24', 2.75);

UPDATE waste_transfer_logs
SET weight_tons = 3.20
WHERE site_id = 1 AND transfer_date = '2025-09-24';

SAVEPOINT wtl_step;

DELETE FROM waste_transfer_logs
WHERE site_id = 1 AND transfer_date = '2025-09-24';

ROLLBACK TO wtl_step;

COMMIT;


-- total 175 queries


