use sql_capestone_project;

show tables;

/*
### 🌍 1. Eco-Tourism Destinations * 
Eco_Sites → Master list of eco-tourism sites. 
* Visit_Logs → Records of tourists visiting sites. 
* Conservation_Areas → Protected zones linked to sites. 
*/

Create table eco_sites(
site_id int auto_increment primary key,
site_name varchar(100),
state_region varchar(50),
key_activites text,
sustainability_notes text
);

alter table eco_sites add column Type varchar(255) default "NOT DEFINED";


-- Tribal Involvement Sites
INSERT INTO eco_sites (site_name, state_region, key_activites, sustainability_notes, Type) VALUES
('Parambikulam Tiger Reserve', 'Kerala', 'Trekking, safaris, forest canopy walks', 'Tribal guides; colonies inside reserve; direct employment of tribes in tourism operations', 'Tribal'),
('Periyar Tiger Reserve / Wildlife Sanctuary', 'Kerala', 'Nature trails, tribal heritage tours, cultural performances, museum', 'Tribal Heritage Programme; local guide role; cultural asset sharing', 'Tribal'),
('Manas National Park', 'Assam', 'Jungle safaris, cultural performances, homestays, birding', 'Community-led camps; ex-poachers turned guides; conservation + livelihood link', 'Tribal'),
('Suján Jawai & other glamping lodges', 'Rajasthan / MP / Karnataka', 'Luxury glamping, wildlife tours, craft markets, guided walks', 'Eco-lodges employing tribal artisans/guides; blending culture & nature', 'Tribal'),
('Kerala Forest Ecotourism Centres', 'Kerala', 'Forest huts, nature walks, interpretation, lodging', 'Co-managed centers; tribal involvement in guiding and hospitality', 'Tribal'),
('Chinnar Wildlife Sanctuary', 'Kerala', 'Jungle treks, hilltop huts, guided walks to tribal settlements', 'Tribal people lead treks; cultural exchange; forest experiences', 'Tribal'),
('Khonoma Village', 'Nagaland', 'Nature walks, sustainable farming, homestays, cultural interaction', 'Community-driven conservation village; no hunting; eco-tourism governance', 'Tribal'),
('Jabarra Village', 'Chhattisgarh', 'Medicinal plant walks, forest tours, yoga/naturopathy, homestays', 'Use of traditional knowledge; healers as hosts; villagers trained as guides', 'Tribal');

-- Non-Tribal Involvement Sites
INSERT INTO eco_sites (site_name, state_region, key_activites, sustainability_notes, Type) VALUES
('Mangalajodi Bird Sanctuary', 'Odisha', 'Birdwatching, boat excursions, eco-cottages', 'Wetland conservation; ex-poachers trained as guides; community-led but not tribal', 'Non-Tribal'),
('Marine National Park (Gulf of Kutch)', 'Gujarat', 'Snorkelling, glass-bottom boats, mangrove/intertidal tours', 'Marine biodiversity; government-managed; coral conservation', 'Non-Tribal'),
('Indian Wild Ass Sanctuary (Little Rann of Kutch)', 'Gujarat', 'Safaris, flamingo/bird viewing, desert-wetland exploration', 'Unique salt desert ecosystem; wildlife protection; no tribal involvement', 'Non-Tribal'),
('Mahatma Gandhi Marine National Park', 'Andaman & Nicobar Islands', 'Snorkelling/diving, coral reefs, reef fish viewing, boat rides', 'Uninhabited islands; strict conservation; government-managed', 'Non-Tribal'),
('Valley of Flowers National Park', 'Uttarakhand', 'Alpine flower trekking, wildlife viewing', 'UNESCO protected; fragile ecosystem; regulated access', 'Non-Tribal'),
('Keoladeo National Park (Bharatpur)', 'Rajasthan', 'Birdwatching, cycling, walking tours', 'UNESCO wetland; migratory bird hub; government management', 'Non-Tribal'),
('Hemis National Park', 'Ladakh', 'High-altitude trekking, snow leopard viewing, remote camping', 'Cold desert park; minimal settlements; government-led eco-tourism', 'Non-Tribal'),
('Kaziranga National Park', 'Assam', 'Rhino safaris, birdwatching, big mammal viewing', 'UNESCO heritage; flagship rhino species; conservation initiatives', 'Non-Tribal');

-- Check inserted values
SELECT * FROM eco_sites;

-- TABLE 2: visit_logs

CREATE TABLE visit_logs(
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    site_id INT NULL,
    visitor_name VARCHAR(100),
    visit_date DATE,
    activities_done TEXT,
    feedback TEXT,
    rating INT CHECK(rating BETWEEN 1 AND 5),
    FOREIGN KEY (site_id) REFERENCES eco_sites(site_id) ON update SET NULL on delete cascade
);

INSERT INTO visit_logs (site_id, visitor_name, visit_date, activities_done, feedback, rating) VALUES
-- Parambikulam Tiger Reserve (site_id = 1)
(1, 'Anita Rao', '2025-01-12', 'Trekking, canopy walk', 'Amazing tribal guides, felt very authentic!', 5),
(1, 'Ramesh Iyer', '2025-02-05', 'Safari, nature photography', 'Saw tigers, guides were knowledgeable.', 4),
(1, 'Sonal Mehta', '2025-03-18', 'Forest walk, birdwatching', 'Good conservation efforts, well maintained.', 5),
(1, 'Deepak Sharma', '2025-04-21', 'Camping, trekking', 'Great but limited food options.', 3),
(1, 'Meera Nair', '2025-05-15', 'Safari, tribal interaction', 'Loved cultural exchange with local tribes.', 5),
(1, 'Vikram Desai', '2025-06-10', 'Jungle trek, canopy walk', 'Guides were friendly, very safe.', 4),

-- Periyar Tiger Reserve (site_id = 2)
(2, 'Ajay Kumar', '2025-01-22', 'Nature trail, heritage tour', 'Tribal heritage walk was eye-opening.', 5),
(2, 'Kavita Joshi', '2025-02-14', 'Museum visit, cultural performance', 'Engaging and well presented.', 4),
(2, 'Prakash Singh', '2025-03-09', 'Tribal hamlet walk', 'Informative but could improve facilities.', 3),
(2, 'Nidhi Agarwal', '2025-04-30', 'Nature trail, birdwatching', 'Loved the biodiversity.', 5),
(2, 'Suresh Pillai', '2025-05-28', 'Cultural programme, trekking', 'Excellent guides and safety measures.', 4),
(2, 'Farah Khan', '2025-06-18', 'Heritage museum, guided walk', 'Very educational and family-friendly.', 5),

-- Manas National Park (site_id = 3)
(3, 'Rahul Verma', '2025-01-11', 'Jungle safari, homestay', 'Great cultural immersion.', 5),
(3, 'Sneha Patil', '2025-02-02', 'Birdwatching, weaving demo', 'Enjoyed the handicrafts session.', 4),
(3, 'Mohit Gupta', '2025-03-05', 'Community camp stay', 'Basic but very authentic experience.', 3),
(3, 'Ritika Jain', '2025-04-12', 'Safari, cultural performance', 'Wonderful balance of nature and culture.', 5),
(3, 'Arjun Malhotra', '2025-05-25', 'Homestay, folk music', 'Loved the Boro songs and dances.', 5),
(3, 'Pooja Bansal', '2025-06-07', 'Craft workshop, campfire', 'Unique and interactive.', 4),

-- Suján Jawai & Glamping (site_id = 4)
(4, 'Neha Shah', '2025-01-20', 'Glamping, leopard safari', 'Luxury + eco-friendly. Amazing!', 5),
(4, 'Rohit Khanna', '2025-02-15', 'Nature walk, craft market', 'Loved Rabari culture showcase.', 4),
(4, 'Divya Reddy', '2025-03-08', 'Luxury stay, guided walks', 'Service was excellent, eco-values clear.', 5),
(4, 'Sandeep Kapoor', '2025-04-16', 'Wildlife tours, cultural dance', 'Good but expensive.', 3),
(4, 'Mona Thakur', '2025-05-22', 'Glamping, camel safari', 'Unique desert vibe.', 4),
(4, 'Alok Pandey', '2025-06-11', 'Guided trek, luxury stay', 'Blended comfort with conservation.', 5),

-- Kerala Forest Eco Centres (site_id = 5)
(5, 'Swati Menon', '2025-01-14', 'Forest hut stay, trekking', 'Tribal hospitality was warm.', 5),
(5, 'Vishal Deshmukh', '2025-02-27', 'Nature walk, local cuisine', 'Simple but great eco-learning.', 4),
(5, 'Isha Choudhary', '2025-03-29', 'Forest interpretation tour', 'Educational and peaceful.', 5),
(5, 'Naveen Kumar', '2025-04-20', 'Eco-lodge stay, trekking', 'Could improve facilities.', 3),
(5, 'Anjali Singh', '2025-05-24', 'Forest walk, cultural exchange', 'Unique experience with locals.', 5),
(5, 'Rajiv Arora', '2025-06-13', 'Nature trek, birdwatching', 'Good management by community.', 4),

-- Chinnar Wildlife Sanctuary (site_id = 6)
(6, 'Lakshmi Krishnan', '2025-01-25', 'Jungle trek, tribal settlement visit', 'Incredible interaction with tribes.', 5),
(6, 'Manoj Patel', '2025-02-12', 'Hilltop hut stay, trekking', 'Basic facilities but great view.', 3),
(6, 'Kiran Bhat', '2025-03-16', 'Guided trek, birdwatching', 'Tribal guides were very patient.', 4),
(6, 'Reema Kapoor', '2025-04-27', 'Cultural visit, trekking', 'Good learning but tiring.', 4),
(6, 'Harish Rao', '2025-05-19', 'Jungle walk, camping', 'Adventurous and raw experience.', 5),
(6, 'Pallavi Joshi', '2025-06-09', 'Forest trail, cultural exchange', 'Tribal stories were enriching.', 5),

-- Khonoma Village (site_id = 7)
(7, 'Tanya Das', '2025-01-18', 'Village tour, farming demo', 'Best example of sustainable living.', 5),
(7, 'Amit Sinha', '2025-02-22', 'Homestay, cultural walk', 'Very welcoming families.', 4),
(7, 'Ruchi Agarwal', '2025-03-25', 'Birdwatching, weaving workshop', 'Loved the crafts.', 5),
(7, 'Kunal Malhotra', '2025-04-19', 'Trek, conservation walk', 'Community-led eco-tourism impressive.', 5),
(7, 'Shweta Nair', '2025-05-29', 'Homestay, cooking demo', 'Delicious food and warm people.', 5),
(7, 'Nitin Sharma', '2025-06-21', 'Cultural dance, trekking', 'Truly eco-conscious community.', 4),

-- Jabarra Village (site_id = 8)
(8, 'Sunita Yadav', '2025-01-09', 'Medicinal plant walk, forest tour', 'Learned a lot about traditional medicine.', 5),
(8, 'Rohini Kulkarni', '2025-02-11', 'Yoga, homestay', 'Peaceful and rejuvenating.', 4),
(8, 'Mahesh Joshi', '2025-03-19', 'Guided trek, forest tour', 'Very raw eco-tourism feel.', 4),
(8, 'Geeta Mishra', '2025-04-23', 'Herbal medicine demo, village walk', 'Truly unique health insights.', 5),
(8, 'Anand Verma', '2025-05-26', 'Homestay, cultural interaction', 'Very enriching but rustic.', 3),
(8, 'Seema Shah', '2025-06-15', 'Naturopathy, forest exploration', 'Great healing experience.', 5),

-- Mangalajodi Bird Sanctuary (site_id = 9)
(9, 'Ravi Shankar', '2025-01-30', 'Boat ride, birdwatching', 'Saw amazing migratory birds.', 5),
(9, 'Pooja Sharma', '2025-02-20', 'Eco-cottage stay, wetland tour', 'Ex-poachers as guides inspiring.', 5),
(9, 'Karthik Reddy', '2025-03-28', 'Birding, photography', 'Excellent for photographers.', 4),
(9, 'Rina Dutta', '2025-04-15', 'Village walk, eco-tour', 'Community-led, very sustainable.', 5),
(9, 'Arvind Patel', '2025-05-21', 'Bird sanctuary visit, boating', 'Could improve infrastructure.', 3),
(9, 'Neelam Gupta', '2025-06-25', 'Guided birdwatching, stay', 'Great eco-tourism effort.', 5),

-- Marine National Park, Gujarat (site_id = 10)
(10, 'Rohit Mehra', '2025-01-13', 'Snorkelling, coral tour', 'Beautiful marine life.', 5),
(10, 'Shreya Kapoor', '2025-02-16', 'Glass-bottom boat, mangrove visit', 'Very scenic and clean.', 4),
(10, 'Akhil Menon', '2025-03-21', 'Snorkelling, reef walk', 'Coral reefs were mesmerizing.', 5),
(10, 'Priya Sharma', '2025-04-25', 'Boat ride, marine conservation tour', 'Educational and exciting.', 5),
(10, 'Gaurav Sinha', '2025-05-27', 'Mangrove exploration, diving', 'Fascinating ecosystem.', 4),
(10, 'Nikita Jain', '2025-06-22', 'Reef fish viewing, snorkelling', 'Amazing biodiversity.', 5),

-- Indian Wild Ass Sanctuary (site_id = 11)
(11, 'Rajesh Kumar', '2025-01-19', 'Safari, birdwatching', 'Saw wild asses and flamingos.', 5),
(11, 'Ananya Banerjee', '2025-02-13', 'Desert tour, photography', 'Unique desert ecosystem.', 4),
(11, 'Varun Sharma', '2025-03-24', 'Safari, desert exploration', 'Very remote but beautiful.', 4),
(11, 'Smita Reddy', '2025-04-28', 'Birdwatching, eco-tour', 'Loved the flamingo colonies.', 5),
(11, 'Aditya Singh', '2025-05-30', 'Safari, nature walk', 'Eco-tourism facilities could improve.', 3),
(11, 'Nisha Joshi', '2025-06-17', 'Wildlife safari, desert trek', 'Unique but tiring in heat.', 4),

-- Mahatma Gandhi Marine National Park (site_id = 12)
(12, 'Kiran Kumar', '2025-01-26', 'Snorkelling, island tour', 'Pristine waters, very clean.', 5),
(12, 'Snehal Patil', '2025-02-21', 'Coral reef viewing, diving', 'Stunning marine life.', 5),
(12, 'Pankaj Gupta', '2025-03-22', 'Boat ride, reef exploration', 'Well-managed by govt.', 4),
(12, 'Sushma Menon', '2025-04-24', 'Coral reef snorkelling', 'Strictly regulated but safe.', 4),
(12, 'Manish Sharma', '2025-05-31', 'Diving, boat excursion', 'Great conservation effort.', 5),
(12, 'Ritika Sen', '2025-06-19', 'Marine tour, coral walk', 'Truly world-class.', 5),

-- Valley of Flowers (site_id = 13)
(13, 'Alok Mehta', '2025-01-17', 'Flower trek, wildlife viewing', 'Absolutely breathtaking!', 5),
(13, 'Neha Sharma', '2025-02-23', 'Trekking, photography', 'Challenging trek but rewarding.', 4),
(13, 'Amit Patel', '2025-03-27', 'Guided trek, alpine flowers', 'One of the best treks ever.', 5),
(13, 'Roshni Kapoor', '2025-04-26', 'Wildlife photography, trek', 'Saw rare species.', 5),
(13, 'Kunal Joshi', '2025-05-18', 'Eco-tour, trekking', 'Very well preserved park.', 4),
(13, 'Shikha Agarwal', '2025-06-14', 'Alpine trek, nature study', 'Strict entry rules but good.', 4),

-- Keoladeo National Park (site_id = 14)
(14, 'Rahul Kapoor', '2025-01-21', 'Birdwatching, cycling', 'Heaven for bird lovers.', 5),
(14, 'Megha Reddy', '2025-02-19', 'Walking tour, bird photography', 'Lots of migratory birds.', 5),
(14, 'Ashok Sharma', '2025-03-23', 'Cycling, wetland viewing', 'Good management, needs better signage.', 4),
(14, 'Shruti Nair', '2025-04-18', 'Nature walk, birding', 'Saw Siberian cranes.', 5),
(14, 'Yash Gupta', '2025-05-20', 'Bird photography, cycling', 'Great for long visits.', 4),
(14, 'Priyanka Das', '2025-06-12', 'Walking, birdwatching', 'Very rich biodiversity.', 5),

-- Hemis National Park (site_id = 15)
(15, 'Karan Singh', '2025-01-28', 'Snow leopard trek, camping', 'Saw footprints, thrilling.', 5),
(15, 'Smriti Jain', '2025-02-24', 'High-altitude trek, wildlife viewing', 'Tough trek but worth it.', 4),
(15, 'Aayush Mehta', '2025-03-26', 'Trekking, camping', 'Beautiful landscapes.', 5),
(15, 'Poonam Sharma', '2025-04-29', 'Wildlife tour, snow leopard search', 'Cold but amazing.', 4),
(15, 'Sanjay Patel', '2025-05-17', 'Eco-tour, high-altitude trek', 'Well managed eco-tourism.', 5),
(15, 'Divya Singh', '2025-06-20', 'Camping, trekking', 'Remote but stunning.', 5),

-- Kaziranga National Park (site_id = 16)
(16, 'Abhishek Verma', '2025-01-16', 'Rhino safari, birdwatching', 'Saw rhinos up close.', 5),
(16, 'Pallavi Desai', '2025-02-25', 'Elephant safari, photography', 'Amazing experience.', 5),
(16, 'Tarun Khanna', '2025-03-30', 'Safari, wildlife viewing', 'Well maintained and safe.', 4),
(16, 'Nisha Patel', '2025-04-17', 'Birdwatching, eco-tour', 'Excellent biodiversity.', 5),
(16, 'Gautam Sharma', '2025-05-23', 'Safari, rhino photography', 'Very exciting.', 4),
(16, 'Rekha Menon', '2025-06-08', 'Elephant ride, jungle safari', 'Felt adventurous.', 5);



-- TABLE 3: CONSERVATION AREAS
CREATE TABLE Conservation_Areas (
    area_id INT AUTO_INCREMENT PRIMARY KEY,
    site_id INT NULL,
    area_name VARCHAR(100),
    protection_level VARCHAR(50), -- e.g. Core Zone, Buffer Zone, Community Zone
    area_size_km2 DECIMAL(10,2),
    biodiversity_notes TEXT,
    FOREIGN KEY (site_id) REFERENCES eco_sites(site_id) ON delete SET NULL on update cascade
);

INSERT INTO Conservation_Areas (site_id, area_name, protection_level, area_size_km2, biodiversity_notes) VALUES
(1, 'Parambikulam Core Zone', 'Core Zone', 285.0, 'Rich biodiversity: tigers, elephants, lion-tailed macaques'),
(2, 'Periyar Lake Zone', 'Community Zone', 350.0, 'Elephants, gaurs, and tribal interaction areas'),
(3, 'Manas Core Area', 'Core Zone', 500.0, 'UNESCO World Heritage; home to golden langur'),
(4, 'Jawai Leopard Conservation Area', 'Buffer Zone', 200.0, 'Leopard sightings with Rabari herders coexistence'),
(5, 'Kerala Eco-Centres Forest Patch', 'Community Zone', 50.0, 'Forest dependent communities co-managing eco-huts'),
(6, 'Chinnar River Belt', 'Core Zone', 90.0, 'Dry thorn forest; endangered grizzled giant squirrel'),
(7, 'Khonoma Community Forest', 'Community Reserve', 20.0, 'Pioneering no-hunting village; bird conservation'),
(8, 'Jabarra Forest Reserve', 'Community Zone', 30.0, 'Medicinal plants; tribal healer heritage'),
(9, 'Mangalajodi Wetlands', 'Community Reserve', 30.0, 'Migratory birds like pintail ducks, herons'),
(10, 'Gulf of Kutch Coral Reef Zone', 'Marine Core', 400.0, 'India’s first marine national park; corals, sponges'),
(11, 'Little Rann Core Desert', 'Core Zone', 4954.0, 'Wild ass, flamingos, saline desert habitat'),
(12, 'South Andaman Reef Islands', 'Core Zone', 281.5, 'Coral reefs, reef sharks, protected marine life'),
(13, 'Valley of Flowers Alpine Zone', 'Core Zone', 87.5, 'Himalayan endemic flora, snow leopard sightings'),
(14, 'Keoladeo Wetland Core', 'Core Zone', 29.0, 'Migratory bird hub; Siberian cranes historically'),
(15, 'Hemis Snow Leopard Habitat', 'Core Zone', 4400.0, 'Largest snow leopard habitat in India'),
(16, 'Kaziranga Rhino Zone', 'Core Zone', 430.0, 'World’s largest one-horned rhinoceros population');



