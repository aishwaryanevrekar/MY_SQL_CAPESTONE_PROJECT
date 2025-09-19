USE SQL_CAPESTONE_PROJECT;

/*
5. Smart Waste System 
 Waste_Items → Logged waste items. 
 Waste_Categories → Plastic, organic, e-waste. 
 Disposal_Methods → How waste handled. 
 Waste_Sources → Lodges, vendors, activities. 
 Recycling_Centers → Linked to disposal.
 */
 
 -- 1. TABLE 1 : WASTE CATEGORY
 create TABLE Waste_category(
 cat_id int auto_increment primary key,
 category_name varchar(65) unique,
 description text
 );
 
 
INSERT INTO waste_category (category_name, description) VALUES
('Plastic', 'All non-biodegradable plastic waste'),
('Organic', 'Food and garden waste suitable for composting'),
('E-waste', 'Electronic and electrical waste'),
('Paper/Cardboard', 'Recyclable paper and cardboard products'),
('Glass', 'Bottles and glass containers'),
('Metal', 'Aluminium, steel, and tin waste'),
('Hazardous', 'Medical and chemical waste'),
('Textile', 'Fabric scraps and clothes for recycling'),
('Bio-Medical', 'Sanitary and medical waste'),
('Construction Debris', 'Non-toxic building waste');

select * from waste_category;
 
 
 -- 2. table 2 : waste items
 create table waste_items(
 w_id int auto_increment primary key,
 site_id int null,
 tribe_id int null,
 cat_id int null,
 item_name varchar(100),
 quantity_kg decimal(15,2),
 date_logged date,
 foreign key (site_id) references eco_sites(site_id) on delete set null on update cascade,
  foreign key (tribe_id) references tribes(tribe_id) on delete set null on update cascade,
foreign key (cat_id) references waste_category(cat_id) on delete set null on update cascade
 
 );
 
 INSERT INTO waste_items (site_id, tribe_id, cat_id, item_name, quantity_kg, date_logged) VALUES
(1, 1, 1, 'Plastic water bottles', 12.50, '2025-01-10'),
(1, 1, 2, 'Banana peels', 8.30, '2025-01-10'),
(2, 2, 1, 'Plastic cups', 5.00, '2025-01-12'),
(2, 2, 2, 'Fruit waste', 6.50, '2025-01-12'),
(3, 3, 3, 'Old batteries', 2.00, '2025-01-15'),
(3, 3, 2, 'Vegetable waste', 10.00, '2025-01-15'),
(4, 6, 1, 'Plastic wrappers', 15.00, '2025-01-18'),
(4, 6, 2, 'Food leftovers', 12.00, '2025-01-18'),
(5, 5, 4, 'Cardboard boxes', 8.50, '2025-01-20'),
(5, 5, 2, 'Tea leaves', 4.00, '2025-01-20'),
(7, 7, 1, 'Plastic bags', 6.00, '2025-01-22'),
(7, 7, 2, 'Vegetable peels', 3.50, '2025-01-22'),
(8, 8, 3, 'Old phones', 1.20, '2025-01-24'),
(8, 8, 2, 'Organic kitchen waste', 5.80, '2025-01-24'),
(9, NULL, 2, 'Bird food leftovers', 7.50, '2025-01-26'),
(9, NULL, 1, 'Plastic food packets', 4.30, '2025-01-26');
 
 -- 3. table 3: disposal methods
 
 CREATE TABLE disposal_methods (
    method_id INT AUTO_INCREMENT PRIMARY KEY,
    method_name VARCHAR(100),
    description TEXT
);

INSERT INTO disposal_methods (method_name, description) VALUES
('Composting', 'Organic waste converted to compost'),
('Recycling', 'Plastic, glass, paper, and metal processed for reuse'),
('Incineration', 'Controlled burning of hazardous and bio-medical waste'),
('Landfill', 'Safe dumping of non-recyclable waste'),
('E-waste processing', 'Electronic waste collected and processed'),
('Anaerobic digestion', 'Organic waste processed to generate biogas'),
('Donation', 'Reusable items given to local communities'),
('Upcycling', 'Creating new products from waste materials');

 -- 4. table 4 : waste sources
 CREATE TABLE waste_sources (
    s_id INT AUTO_INCREMENT PRIMARY KEY,
    site_id INT null,
    tribe_id INT null,
    source_name VARCHAR(100),
    description TEXT,
    FOREIGN KEY (site_id) REFERENCES eco_sites(site_id) on update set null on delete cascade,
    FOREIGN KEY (tribe_id) REFERENCES tribes(tribe_id) on update set null on delete cascade
);
 
 INSERT INTO waste_sources (site_id, tribe_id, source_name, description) VALUES
(1, 1, 'Lodge Kitchen', 'Organic and packaging waste from kitchen operations'),
(1, 1, 'Visitor Area', 'Plastic bottles and snack wrappers from tourists'),
(2, 2, 'Eco-Trail', 'Plastic and food waste along trails'),
(2, 2, 'Tribal Handicraft Center', 'Scrap materials and packaging from workshops'),
(3, 3, 'Homestay', 'Organic waste from meals'),
(3, 3, 'Safari Camp', 'Plastic and paper waste from tourists'),
(4, 6, 'Luxury Tents', 'Packaging and leftover food'),
(4, 6, 'Craft Market', 'Scrap materials from artisan stalls'),
(5, 5, 'Forest Huts', 'Organic food waste and tea leaves'),
(5, 5, 'Visitor Centre', 'Brochures, pamphlets, and packaging'),
(7, 7, 'Village Homestay', 'Vegetable peels and leftover meals'),
(8, 8, 'Tribal Retreat', 'Yoga and wellness waste'),
(9, NULL, 'Bird Sanctuary Visitor Centre', 'Plastic packets and leftover food'),
(10, NULL, 'Marine Eco-Lodge', 'Snorkel and boating activity waste'),
(11, NULL, 'Wild Ass Safari Camps', 'Plastic and organic waste from tourists');


DROP TABLE IF EXISTS recycling_centers;

-- 5. TABLE : RECYCLING CENTERS

CREATE TABLE recycling_centers (
    center_id INT AUTO_INCREMENT PRIMARY KEY,
    site_id INT,
    center_name VARCHAR(100),
    location VARCHAR(100),
    contact_info VARCHAR(100),
    accepted_waste TEXT,
    FOREIGN KEY (site_id) REFERENCES eco_sites(site_id)
);

INSERT INTO recycling_centers (site_id, center_name, location, contact_info, accepted_waste) VALUES
-- Kerala sites
(1, 'Parambikulam Eco-Recycling Center', 'Palakkad, Kerala', 'parambikulam.recycle@eco.org', 'Plastic, glass, paper, organic'),
(2, 'Periyar Green Waste Unit', 'Thekkady, Kerala', 'periyar.recycle@eco.org', 'Plastic, organic, paper'),
(5, 'Kerala Forest Recycling Hub', 'Thrissur, Kerala', 'kforest@eco.org', 'Plastic, glass, organic'),
(6, 'Chinnar Tribal Waste Facility', 'Idukki, Kerala', 'chinnar@eco.org', 'Plastic, organic, paper'),
(3, 'Manas Eco-Recycling Cooperative', 'Baksa, Assam', 'manas.recycle@eco.org', 'Organic, plastic, paper'),
(16, 'Kaziranga Rhino Waste Center', 'Golaghat, Assam', 'kaziranga@eco.org', 'Plastic, glass, metal'),
(4, 'Jawai Glamping Recycling Station', 'Pali, Rajasthan', 'jawai.recycle@eco.org', 'Plastic, glass, textile'),
(14, 'Bharatpur Bird Park Waste Unit', 'Bharatpur, Rajasthan', 'keoladeo@eco.org', 'Plastic, paper, organic'),
(7, 'Khonoma Village Recycling Hub', 'Kohima, Nagaland', 'khonoma@eco.org', 'Plastic, textile, organic'),
(8, 'Jabarra Tribal Waste Center', 'Raipur, Chhattisgarh', 'jabarra@eco.org', 'Plastic, organic, herbal waste'),
(9, 'Mangalajodi Wetland Recycling', 'Khordha, Odisha', 'mangalajodi@eco.org', 'Plastic, organic, paper'),
(10, 'Gulf of Kutch Marine Recycling', 'Jamnagar, Gujarat', 'gulf.recycle@eco.org', 'Plastic, glass, e-waste'),
(11, 'Wild Ass Desert Recycling Station', 'Kutch, Gujarat', 'wildass@eco.org', 'Plastic, paper, organic'),
(12, 'Andaman Marine Waste Unit', 'Port Blair, Andaman', 'andaman@eco.org', 'Plastic, e-waste, glass'),
(13, 'Valley of Flowers Alpine Recycling', 'Chamoli, Uttarakhand', 'valleyflowers@eco.org', 'Paper, organic, plastic'),
(15, 'Hemis High-Altitude Waste Hub', 'Leh, Ladakh', 'hemis@eco.org', 'Plastic, paper, organic');

SELECT COUNT(*) AS total_tables
FROM information_schema.tables
WHERE table_schema = 'sql_capestone_project';


