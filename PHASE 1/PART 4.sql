USE SQL_CAPESTONE_PROJECT;

/*
STAY AND PACKAGES

1. ECO LODGES
2. PACKAGE TYPES
3. BOOKINGS
4. Booking history
*/

# 1. eco lodges
create table eco_lodges(
lodge_id int auto_increment primary key,
site_id int null,
lodge_name varchar(255),
capacity int,
price_per_night decimal(10,2),
amenities text,
foreign key (site_id) references eco_sites(site_id) on delete set null on update cascade
);


INSERT INTO eco_lodges (site_id, lodge_name, capacity, price_per_night, amenities) VALUES
(1, 'Parambikulam Jungle Lodge', 20, 3500.00, 'Eco-huts, solar lights, organic food'),
(2, 'Periyar Tribal Heritage Lodge', 15, 2800.00, 'Cultural shows, eco-cottages, guided tours'),
(3, 'Manas Community Eco Camp', 25, 2500.00, 'Homestays, safari packages, local cuisine'),
(4, 'Suján Jawai Glamping Camp', 10, 15000.00, 'Luxury tents, safaris, Rabari craft shops'),
(5, 'Kerala Forest Eco Huts', 30, 2000.00, 'Forest huts, tribal hospitality, local meals'),
(7, 'Khonoma Heritage Homestay', 12, 1800.00, 'Farming demo, cultural exchange, local food'),
(8, 'Jabarra Tribal Retreat', 10, 1500.00, 'Medicinal plant tours, yoga, homestays'),
(9, 'Mangalajodi Birdwatcher Lodge', 18, 2200.00, 'Eco-cottages, birding decks, boating access'),
(6, 'Chinnar Hilltop Eco Huts', 16, 2100.00, 'Treks, tribal-led tours, hilltop views'),
(10, 'Marine Eco Resort - Gulf of Kutch', 22, 3200.00, 'Glass-bottom boat rides, snorkelling gear, mangrove walks'),
(11, 'Desert Eco Camp - Little Rann', 14, 2800.00, 'Salt desert safaris, flamingo viewing deck, campfire dinners'),
(12, 'Mahatma Gandhi Marine Eco Cottages', 12, 4000.00, 'Beach huts, coral reef tours, diving support'),
(13, 'Valley of Flowers Base Eco Lodge', 20, 2500.00, 'Trekking base, alpine meals, guided hikes'),
(14, 'Keoladeo Birders Eco Camp', 18, 2200.00, 'Birdwatching towers, cycle rentals, nature library'),
(15, 'Hemis Highland Eco Lodge', 10, 5500.00, 'Snow leopard tracking, high-altitude tents, solar heating'),
(16, 'Kaziranga Rhino Eco Resort', 24, 3000.00, 'Jeep safaris, riverside cottages, cultural evenings'),
(3, 'Manas Riverbank Eco Huts', 12, 2600.00, 'Riverside stay, birding decks, fishing demos'),
(5, 'Silent Valley Forest Retreat', 15, 2400.00, 'Rainforest huts, nature trails, eco-library'),
(7, 'Khonoma Bamboo Eco Lodges', 8, 1700.00, 'Bamboo huts, traditional farming demo, Angami cuisine'),
(9, 'Mangalajodi Wetland Stay', 14, 2100.00, 'Eco-cottages, canoe rides, migratory bird viewing');

-- table 2: packages types

CREATE TABLE package_types (
    package_id INT AUTO_INCREMENT PRIMARY KEY,
    site_id INT,
    package_name VARCHAR(100),
    duration_days INT,
    price DECIMAL(10,2),
    highlights TEXT,
    FOREIGN KEY (site_id) REFERENCES eco_sites(site_id)
);

INSERT INTO package_types (site_id, package_name, duration_days, price, highlights) VALUES
(1, 'Tiger Trail Adventure', 3, 8500.00, 'Trekking, canopy walk, safari, tribal interaction'),
(2, 'Heritage & Nature Experience', 2, 6000.00, 'Heritage walk, cultural show, birdwatching'),
(3, 'Manas Wilderness Immersion', 4, 9500.00, 'Safari, weaving demo, homestay, campfire'),
(4, 'Luxury Glamping Safari', 2, 28000.00, 'Luxury tent stay, leopard safari, craft market'),
(5, 'Kerala Eco Living', 3, 7000.00, 'Eco-lodge stay, trekking, forest interpretation'),
(7, 'Khonoma Green Village Tour', 2, 5000.00, 'Homestay, farming, weaving workshop'),
(8, 'Wellness Forest Escape', 3, 5500.00, 'Medicinal walk, yoga, cultural demo'),
(9, 'Birding Paradise Package', 2, 4800.00, 'Birdwatching, boating, eco-cottage stay');


-- 3. Booking History
CREATE TABLE booking_history (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    visitor_name VARCHAR(100),
    site_id INT null,
    lodge_id INT null,
    package_id INT null,
    checkin_date DATE,
    checkout_date DATE,
    num_guests INT,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (site_id) REFERENCES eco_sites(site_id) on delete set null on update cascade,
    FOREIGN KEY (lodge_id) REFERENCES eco_lodges(lodge_id) on delete set null on update cascade,
    FOREIGN KEY (package_id) REFERENCES package_types(package_id) on delete set null on update cascade
);

INSERT INTO booking_history (visitor_name, site_id, lodge_id, package_id, checkin_date, checkout_date, num_guests, total_amount) VALUES
('Anita Rao', 1, 1, 1, '2025-01-12', '2025-01-15', 2, 17000.00),
('Ajay Kumar', 2, 2, 2, '2025-01-22', '2025-01-24', 3, 18000.00),
('Rahul Verma', 3, 3, 3, '2025-01-11', '2025-01-15', 4, 38000.00),
('Neha Shah', 4, 4, 4, '2025-01-20', '2025-01-22', 2, 56000.00),
('Swati Menon', 5, 5, 5, '2025-01-14', '2025-01-17', 2, 14000.00),
('Tanya Das', 7, 6, 6, '2025-01-18', '2025-01-20', 2, 10000.00),
('Sunita Yadav', 8, 7, 7, '2025-01-09', '2025-01-12', 3, 16500.00),
('Ravi Shankar', 9, 8, 8, '2025-01-30', '2025-02-01', 2, 9600.00);

select * from booking_history;

-- 4. Tourist Feedback 
CREATE TABLE tourist_feedback (
    feedback_id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT,
    feedback_text TEXT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    FOREIGN KEY (booking_id) REFERENCES booking_history(booking_id)
);

INSERT INTO tourist_feedback (booking_id, feedback_text, rating) VALUES
(1, 'Great tiger safari and tribal guide interaction, loved the eco-hut stay!', 5),
(2, 'Cultural show was fantastic, food options could improve.', 4),
(3, 'Loved weaving demo and campfire, safari was thrilling.', 5),
(4, 'Luxury tents were amazing, but package was too costly.', 3),
(5, 'Eco-lodge was peaceful and tribal hospitality was warm.', 5),
(6, 'Green village tour was inspiring, excellent local food.', 5),
(7, 'Herbal medicine demo was eye-opening, but stay was very rustic.', 4),
(8, 'Birdwatching package was excellent, saw rare migratory species.', 5);

show tables;

