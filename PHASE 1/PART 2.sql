USE SQL_CAPESTONE_PROJECT;

/*
* Tribes → Each tribe is linked to one eco-site. 
* Cultural_Assets → Heritage like dance, crafts. 
* Traditional_Knowledge → Sustainable practices. 
* Local_Artisans → People producing tribal goods.
*/

-- 1. TRIBE TABLE
create TABLE TRIBES(
tribe_id int auto_increment primary key,
site_id int null,
tribe_name varchar(100),
population_estimate int,
roles text,
foreign key (site_id) references eco_sites(site_id) on delete set null on update cascade

);

INSERT INTO tribes (site_id, tribe_name, population_estimate, roles) VALUES
(1, 'Kadar', 1200, 'Guides, forest protection, eco-tourism staff'),
(1, 'Malasar', 800, 'Traditional knowledge keepers, forest workers'),
(2, 'Mannans', 3000, 'Cultural performers, eco-guides, hamlet visits'),
(2, 'Palians', 700, 'Herbal healers, trekking guides'),
(3, 'Boro', 15000, 'Homestays, weaving, folk performances'),
(4, 'Rabari', 22000, 'Camel herders, storytellers, craft sellers'),
(4, 'Gond', 35000, 'Folk dances, music, tribal art'),
(5, 'Mala Arayan', 5000, 'Forest interpretation, trekking support'),
(6, 'Muduvar', 4500, 'Tribal trekking guides, honey collection'),
(7, 'Angami Naga', 12000, 'Village council governance, homestay hosts'),
(8, 'Baiga', 25000, 'Forest tours, herbal knowledge, craftwork');

select * from tribes;

-- TABLE 2: CULTURAL ASSETS
create table cultural_assets(
asset_id int auto_increment primary key,
tribe_id int null,
asset_type varchar(100),
description text,
foreign key (tribe_id) references tribes(tribe_id) on delete set null on update cascade
);

INSERT INTO cultural_assets (tribe_id, asset_type, description) VALUES
(1, 'Dance', 'Kadar harvest festival dances'),
(2, 'Craft', 'Malasar bamboo mats and baskets'),
(3, 'Museum', 'Mannan Tribal Heritage Museum exhibits'),
(4, 'Medicine', 'Palien herbal healing practices'),
(5, 'Weaving', 'Boro handwoven textiles and looms'),
(6, 'Craft', 'Rabari embroidery and mirror work'),
(7, 'Art', 'Gond paintings with nature motifs'),
(8, 'Dance', 'Mala Arayan forest ritual songs'),
(9, 'Craft', 'Muduvar honey wax artifacts'),
(10, 'Festival', 'Angami Sekrenyi festival of purification'),
(11, 'Dance', 'Baiga Karma dance with drums');

-- TABLE 3: TRADITIONAL KNOWLEDGE

create table traditional_knowledge(
know_id int auto_increment primary key,
tribe_id int null,
practice_name varchar(100),
eco_benefit text,
foreign key (tribe_id) references tribes(tribe_id) on delete set null on update cascade

);

INSERT INTO traditional_knowledge (tribe_id, practice_name, eco_benefit) VALUES
(1, 'Sustainable honey collection', 'Avoids damaging bee colonies, supports pollination'),
(2, 'Sacred groves', 'Preserves biodiversity and water sources'),
(3, 'Shifting cultivation', 'Maintains soil fertility through rotation'),
(4, 'Medicinal herbs use', 'Promotes natural healing, protects native plants'),
(5, 'Floodplain farming', 'Uses natural cycles, supports wetlands'),
(6, 'Camel pastoralism', 'Sustainable desert adaptation, eco-friendly transport'),
(7, 'Folk painting traditions', 'Cultural preservation, promotes eco-awareness'),
(8, 'Community forest protection', 'Stops over-extraction, maintains balance'),
(9, 'Wild honey collection', 'Forest-based, renewable livelihood'),
(10, 'Rice terrace farming', 'Conserves soil and water in hilly terrain'),
(11, 'Baiga shifting cultivation', 'Rotational farming sustaining biodiversity');

-- TABLE 4: LOCAL ARTISIANS

create TABLE LOCAL_ARTISIANS(
artist_id int auto_increment primary key,
tribe_id int,
name varchar(100),
craft_type varchar(100),
foreign key (tribe_id) references tribes(tribe_id) on delete set null on update cascade
);

INSERT INTO LOCAL_ARTISIANS (tribe_id, name, craft_type) VALUES
(1, 'Ravi Kadar', 'Wood carving'),
(2, 'Meena Malasar', 'Bamboo weaving'),
(3, 'Shaji Mannan', 'Pottery'),
(4, 'Lakshmi Palian', 'Herbal medicine preparation'),
(5, 'Biju Boro', 'Handloom weaving'),
(6, 'Kamla Rabari', 'Embroidery'),
(7, 'Ramesh Gond', 'Tribal paintings'),
(8, 'Devi Mala Arayan', 'Forest ritual crafts'),
(9, 'Suresh Muduvar', 'Honey wax craft'),
(10, 'Neitho Angami', 'Wooden handicrafts'),
(11, 'Radha Baiga', 'Bead jewelry');

show tables;




