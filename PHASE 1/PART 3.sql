use SQL_CAPESTONE_PROJECT;

/*
Cultural_Workshops → Tribal art demos. 
Eco_Guides → Tribal guides. 
Youth_Awareness_Programs → Campaigns for youth. 
Public_Education_Events → Events like Clean India.
*/

-- 1. CULTURAL AWARENESS
create TABLE CULTURAL_WORKSHOPS(
c_id int auto_increment primary key,
site_id int null,
foreign key (site_id) references eco_sites(site_id) on delete set null on update cascade,
workshop_name varchar(100),
description text,
target_audience varchar(100)
);

INSERT INTO cultural_workshops (site_id, workshop_name, description, target_audience) VALUES
(1, 'Kadar Bamboo Craft Demo', 'Live demo of bamboo basket weaving by Kadar artisans', 'Tourists'),
(2, 'Malasar Dance Workshop', 'Traditional forest dance with costumes & drums', 'Visitors & Students'),
(3, 'Mannan Pottery Camp', 'Hands-on clay pottery learning session', 'School Children'),
(4, 'Rabari Embroidery Showcase', 'Traditional embroidery techniques with storytelling', 'Tourists'),
(7, 'Angami Shawl Weaving', 'Symbolic tribal shawl weaving demo', 'Young Artisans'),
(9, 'Baiga Bead Jewelry Workshop', 'Bead craft taught by women artisans', 'Local Youth'),
(12, 'Bhil Mural Painting Session', 'Interactive mural painting outdoors', 'Visitors'),
(16, 'Santhal Dhokra Bronze Workshop', 'Traditional metal casting demo', 'Tourists');

truncate cultural_workshops;

INSERT INTO cultural_workshops (site_id, workshop_name, description, target_audience) VALUES
(1, 'Kadar Bamboo Craft Demo', 'Live demo of bamboo basket weaving by Kadar artisans', 'Tourists'),
(2, 'Malasar Dance Workshop', 'Traditional forest dance with costumes & drums', 'Visitors & Students'),
(3, 'Mannan Pottery Camp', 'Hands-on clay pottery learning session', 'School Children'),
(4, 'Rabari Embroidery Showcase', 'Traditional embroidery techniques with storytelling', 'Tourists'),
(5, 'Tribal Herbal Medicine Demo', 'Display of medicinal herbs & remedies by tribal healers', 'Tourists'),
(6, 'Muduvar Honey Collection Workshop', 'Demonstration of honey gathering methods', 'Adventure Tourists'),
(7, 'Angami Shawl Weaving', 'Symbolic tribal shawl weaving demo', 'Young Artisans'),
(8, 'Baiga Bamboo Dance Workshop', 'Interactive tribal dance with music', 'Tourists'),
(9, 'Baiga Bead Jewelry Workshop', 'Bead craft taught by women artisans', 'Local Youth'),
(10, 'Odisha Wetland Painting', 'Art workshop showcasing wetland birds', 'School Students'),
(11, 'Salt Desert Craft Fair', 'Handicrafts expo by desert artisans', 'Tourists'),
(12, 'Bhil Mural Painting Session', 'Interactive mural painting outdoors', 'Visitors'),
(13, 'Garhwali Folk Song Demo', 'Traditional Himalayan songs & instruments', 'Tourists'),
(14, 'Bird Photography Workshop', 'Practical bird photography lessons', 'Students & Birders'),
(15, 'Ladakhi Mask Dance Workshop', 'Traditional Buddhist cultural performance', 'Tourists'),
(16, 'Santhal Dhokra Bronze Workshop', 'Traditional metal casting demo', 'Tourists'),
(16, 'Kaziranga Bamboo Craft Show', 'Rhino-themed bamboo handicrafts demo', 'Tourists'),
(2, 'Palian Drumming Session', 'Interactive drum beats from tribal rituals', 'Visitors'),
(4, 'Glamping Cultural Night', 'Evening with tribal folk performances', 'Tourists'),
(8, 'Chhattisgarh Folk Painting Workshop', 'Warli & tribal designs on walls & cloth', 'Students');

show tables;

-- TABLE 2: ECO_GUIDES
create TABLE ECO_GUIDES(
guide_id int auto_increment primary key,
site_id int null,
guide_program varchar(150),
description text,
target_audience varchar(100),
foreign key (site_id) references eco_sites(site_id) on delete set null on update cascade
);

INSERT INTO eco_guides (site_id, guide_program, description, target_audience) VALUES
(1, 'Parambikulam Nature Guides', 'Guided treks by trained Kadar youth', 'Tourists'),
(2, 'Periyar Heritage Trails', 'Guides narrating forest folklore & survival skills', 'Domestic Tourists'),
(3, 'Manas Park Eco-Guides', 'Ex-poachers turned guides for birding & safaris', 'Tourists'),
(4, 'Glamping Eco-Guides', 'Guides explaining desert flora & fauna', 'Luxury Tourists'),
(5, 'Kerala Eco-Interpretation Guides', 'Tribal youth explain plants & animals', 'Tourists'),
(6, 'Chinnar Hilltop Treks', 'Guided walks to hilltop huts & tribal sites', 'Adventure Tourists'),
(7, 'Khonoma Village Guides', 'Local guides teaching sustainable farming', 'Tourists'),
(8, 'Jabarra Healing Walks', 'Guides narrating herbal knowledge', 'Wellness Tourists'),
(9, 'Mangalajodi Birding Guides', 'Fishermen trained as bird guides', 'Birdwatchers'),
(10, 'Marine Park Reef Guides', 'Certified guides for coral viewing', 'Snorkelers'),
(11, 'Wild Ass Desert Trackers', 'Local youth track wildlife in salt desert', 'Tourists'),
(12, 'MG Marine Park Eco-Guides', 'Island guides for coral protection tours', 'Tourists'),
(13, 'Valley of Flowers Trek Leaders', 'Guides ensuring eco-rules on treks', 'Trekkers'),
(14, 'Keoladeo Park Guides', 'Local youth trained in bird photography', 'Tourists'),
(15, 'Hemis Snow Leopard Trackers', 'Community-trained guides for snow leopard treks', 'Wildlife Enthusiasts'),
(16, 'Kaziranga Rhino Guides', 'Local guides narrating rhino stories', 'Tourists'),
(3, 'Bodo Cultural Guides', 'Explain weaving & cultural performances', 'Tourists'),
(7, 'Angami Eco-Leaders', 'Students as eco-volunteer guides', 'School Visitors'),
(5, 'Kerala Forest Night Safari Guides', 'Night jungle walks with safety briefings', 'Tourists');


-- TABLE 3 : YOUTH AWARENESS_PROGRAMS
Create table youth_awareness_programs(
p_id int primary key auto_increment,
site_id int null,
foreign key (site_id) references eco_sites(site_id) on delete set null on update cascade,
program_name varchar(155),
description text,
target_group varchar(100)
);

INSERT INTO youth_awareness_programs (site_id, program_name, description, target_group) VALUES
(1, 'Save Tigers Drive', 'Youth rally for tiger awareness', 'School Students'),
(2, 'Green Periyar Campaign', 'School kids journaling nature experiences', 'School Students'),
(3, 'Bird Festival Youth Camp', 'Youth organizing cultural fest', 'Village Youth'),
(4, 'Eco-Youth Glamping Camp', 'Youth learn eco-tourism & crafts', 'College Students'),
(5, 'Forest Rangers for a Day', 'Interactive eco-learning activity', 'High School Students'),
(6, 'Medicinal Plant Club', 'Youth learning from elders about herbs', 'Local Youth'),
(7, 'No-Hunting Drive', 'Youth campaign to protect wildlife', 'Village Youth'),
(8, 'Yoga in the Forest', 'Youth promoting health & eco living', 'Young Adults'),
(9, 'Save Wetlands Program', 'Workshops on bird & wetland conservation', 'School Students'),
(10, 'Coral Reef School Project', 'Children draw reefs & fish awareness art', 'Primary Students'),
(11, 'Desert Eco-Challenge', 'Youth clean salt pans & wetlands', 'Village Youth'),
(12, 'Marine Plastic-Free Drive', 'Students campaign against plastic', 'College Students'),
(13, 'Alpine Flower Guardians', 'Trekking campaign for ecosystem awareness', 'Eco Clubs'),
(14, 'Young Birdwatchers Club', 'Bird ID contests for children', 'Students'),
(15, 'Snow Leopard Drive', 'Awareness rally in Ladakh schools', 'Youth & Students'),
(16, 'Save Rhinos Youth March', 'Street rally against rhino poaching', 'Village Youth'),
(4, 'Craft & Conservation Fair', 'Youth manage eco fair + cultural events', 'College Students'),
(6, 'Wildlife Art Competition', 'School painting competition on wildlife', 'School Kids'),
(9, 'Clean Wetlands Challenge', 'Youth boat campaign removing plastics', 'Eco Clubs');

CREATE TABLE public_education_events (
    event_id INT AUTO_INCREMENT PRIMARY KEY,
    site_id INT,
    event_name VARCHAR(150),
    description TEXT,
    audience VARCHAR(100),
    FOREIGN KEY (site_id) REFERENCES eco_sites(site_id)
);

INSERT INTO public_education_events (site_id, event_name, description, audience) VALUES
(1, 'Clean Forest Walkathon', 'Visitors join trail clean-up drive', 'General Public'),
(2, 'Periyar Heritage Day', 'Exhibition of tribal culture & eco-practices', 'Tourists'),
(6, 'Eco-Campfire Talks', 'Evening eco-education storytelling', 'Tourists'),
(9, 'Mangalajodi Wetland Festival', 'Bird festival + clean-up drives', 'General Public'),
(10, 'Marine Conservation Day', 'Snorkeling + coral awareness events', 'Tourists'),
(12, 'Bharatpur Bird Festival', 'Birdwatching + Clean India events', 'Tourists'),
(14, 'Valley of Flowers Eco-Day', 'Trek + clean India awareness drive', 'Youth & Tourists'),
(16, 'Kaziranga Conservation Mela', 'Cultural fair + rhino conservation education', 'General Public');

show tables;




