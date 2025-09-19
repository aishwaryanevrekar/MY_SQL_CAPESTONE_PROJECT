use SQL_capestone_project;

/*
This is the Miscellaneous part where we are getting information about the stats of the
eco sites and tribal area

1. Visitor Statistics :
Tracks how many people visited ecosites area and how much revenue it is generated
Connection : Linked to Ecosites and tribes

2. Reforestation Logs:
Records yearly plantation drives at each eco sites

3. IOT Bin sensors :

4. Collection Trucks : Track trucks used to collect waste from Eco Sites
 
5. Waste Transfer Logs : Records when waste is transported from an eco site to a 
recycle center 
*/

-- 1.  Visitor_Statistics
CREATE TABLE visitor_statistics (
    stat_id INT AUTO_INCREMENT PRIMARY KEY,
    site_id INT NULL,
    tribe_id INT NULL,
    year YEAR,
    domestic_visitors INT,
    foreign_visitors INT,
    total_revenue DECIMAL(12,2),
    FOREIGN KEY (site_id) REFERENCES eco_sites(site_id) on delete set null on update cascade,
    FOREIGN KEY (tribe_id) REFERENCES tribes(tribe_id) on delete set null on update cascade
);

INSERT INTO visitor_statistics (site_id, tribe_id, year, domestic_visitors, foreign_visitors, total_revenue) VALUES
(1, 1, 2022, 12000, 2500, 8500000.00),
(2, 2, 2022, 8000, 1200, 4800000.00),
(3, 3, 2022, 6000, 900, 3200000.00),
(4, 4, 2022, 4000, 2000, 9500000.00),
(5, 5, 2022, 9000, 1100, 5000000.00),
(6, 6, 2022, 5000, 700, 2800000.00),
(7, 7, 2022, 3000, 500, 1600000.00),
(8, 8, 2022, 3500, 800, 2000000.00),
(9, 9, 2022, 7000, 1500, 4200000.00),
(10, 10, 2022, 2500, 400, 1200000.00),
(1, 1, 2023, 14000, 3000, 10000000.00),
(2, 2, 2023, 9500, 1500, 5600000.00),
(3, 3, 2023, 6200, 1000, 3400000.00),
(4, 4, 2023, 5000, 2500, 12000000.00),
(5, 5, 2023, 11000, 1400, 6200000.00);


-- 2. Reforestation_Logs
CREATE TABLE reforestation_logs (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    site_id INT null,
    tribe_id INT null,
    year YEAR,
    trees_planted INT,
    species VARCHAR(100),
    FOREIGN KEY (site_id) REFERENCES eco_sites(site_id) on delete set null on update cascade,
    FOREIGN KEY (tribe_id) REFERENCES tribes(tribe_id) on delete set null on update cascade
);

INSERT INTO reforestation_logs (site_id, tribe_id, year, trees_planted, species) VALUES
(1, 1, 2022, 1500, 'Teak'),
(2, 2, 2022, 1200, 'Bamboo'),
(3, 3, 2022, 800, 'Sal'),
(4, 4, 2022, 500, 'Neem'),
(5, 5, 2022, 2000, 'Mango'),
(6, 6, 2022, 950, 'Mahua'),
(7, 7, 2022, 400, 'Alder'),
(8, 8, 2022, 600, 'Tendu'),
(9, 9, 2022, 1000, 'Casuarina'),
(10, 10, 2022, 300, 'Oak'),
(1, 1, 2023, 2000, 'Rosewood'),
(2, 2, 2023, 1500, 'Bamboo'),
(3, 3, 2023, 1200, 'Sal'),
(4, 4, 2023, 900, 'Neem'),
(5, 5, 2023, 2500, 'Jackfruit');


-- 3. IoT_Bin_Sensors
CREATE TABLE iot_bin_sensors (
    sensor_id INT AUTO_INCREMENT PRIMARY KEY,
    site_id INT,
    tribe_id INT,
    bin_location VARCHAR(100),
    fill_level INT, -- percentage
    last_updated DATE,
    FOREIGN KEY (site_id) REFERENCES eco_sites(site_id) on delete set null on update cascade,
    FOREIGN KEY (tribe_id) REFERENCES tribes(tribe_id) on delete set null on update cascade
);

INSERT INTO iot_bin_sensors (site_id, tribe_id, bin_location, fill_level, last_updated) VALUES
(1, 1, 'Parambikulam Gate', 45, '2023-07-01'),
(1, 1, 'Safari Parking Lot', 70, '2023-07-02'),
(2, 2, 'Periyar Tribal Museum', 90, '2023-07-03'),
(3, 3, 'Manas River Camp', 65, '2023-07-04'),
(4, 4, 'Jawai Safari Camp', 30, '2023-07-01'),
(5, 5, 'Kerala Eco Huts', 85, '2023-07-03'),
(6, 6, 'Satpura Lodge', 55, '2023-07-02'),
(7, 7, 'Khonoma Village Center', 95, '2023-07-04'),
(8, 8, 'Jabarra Retreat', 60, '2023-07-02'),
(9, 9, 'Mangalajodi Dock', 40, '2023-07-01'),
(10, 10, 'Nanda Devi Trailhead', 35, '2023-07-01'),
(2, 2, 'Periyar Lake Entry', 80, '2023-07-05'),
(3, 3, 'Manas Tribal Hall', 75, '2023-07-06'),
(4, 4, 'Jawai Leopard Point', 50, '2023-07-05'),
(5, 5, 'Kerala Spice Garden', 60, '2023-07-06');


-- 4. Collection_Trucks
CREATE TABLE collection_trucks (
    truck_id INT AUTO_INCREMENT PRIMARY KEY,
    site_id INT null,
    tribe_id INT null,
    truck_number VARCHAR(20),
    capacity_tons DECIMAL(5,2),
    status VARCHAR(50),
    FOREIGN KEY (site_id) REFERENCES eco_sites(site_id) on delete set null on update cascade,
    FOREIGN KEY (tribe_id) REFERENCES tribes(tribe_id) on delete set null on update cascade
);

INSERT INTO collection_trucks (site_id, tribe_id, truck_number, capacity_tons, status) VALUES
(1, 1, 'KL01-ECO-101', 5.00, 'Active'),
(2, 2, 'KL02-ECO-201', 3.50, 'Active'),
(3, 3, 'AS01-ECO-301', 4.00, 'Under Maintenance'),
(4, 4, 'RJ01-ECO-401', 6.00, 'Active'),
(5, 5, 'KL03-ECO-501', 2.50, 'Active'),
(6, 6, 'MP01-ECO-601', 3.00, 'Active'),
(7, 7, 'NL01-ECO-701', 4.50, 'Active'),
(8, 8, 'CG01-ECO-801', 2.00, 'Under Maintenance'),
(9, 9, 'OD01-ECO-901', 5.00, 'Active'),
(10, 10, 'UK01-ECO-1001', 3.50, 'Active'),
(1, 1, 'KL01-ECO-102', 5.50, 'Active'),
(2, 2, 'KL02-ECO-202', 3.00, 'Active'),
(3, 3, 'AS01-ECO-302', 4.20, 'Active'),
(4, 4, 'RJ01-ECO-402', 6.50, 'Active'),
(5, 5, 'KL03-ECO-502', 2.80, 'Active');


-- 5. Waste_Transfer_Logs
CREATE TABLE waste_transfer_logs (
    transfer_id INT AUTO_INCREMENT PRIMARY KEY,
    site_id INT null,
    tribe_id INT null,
    truck_id INT null,
    center_id INT null,
    transfer_date DATE,
    weight_tons DECIMAL(6,2),
    FOREIGN KEY (site_id) REFERENCES eco_sites(site_id) on delete set null on update cascade,
    FOREIGN KEY (tribe_id) REFERENCES tribes(tribe_id) on delete set null on update cascade,
    FOREIGN KEY (truck_id) REFERENCES collection_trucks(truck_id) on delete set null on update cascade,
    FOREIGN KEY (center_id) REFERENCES recycling_centers(center_id) on delete set null on update cascade
);

INSERT INTO waste_transfer_logs (site_id, tribe_id, truck_id, center_id, transfer_date, weight_tons) VALUES
(1, 1, 1, 1, '2023-07-10', 3.20),
(2, 2, 2, 2, '2023-07-11', 2.50),
(3, 3, 3, 3, '2023-07-12', 3.80),
(4, 4, 4, 4, '2023-07-13', 5.20),
(5, 5, 5, 5, '2023-07-14', 1.90),
(6, 6, 6, 6, '2023-07-15', 2.70),
(7, 7, 7, 7, '2023-07-16', 3.50),
(8, 8, 8, 8, '2023-07-17', 1.60),
(9, 9, 9, 9, '2023-07-18', 4.00),
(10, 10, 10, 10, '2023-07-19', 2.20),
(1, 1, 11, 1, '2023-07-20', 3.40),
(2, 2, 12, 2, '2023-07-21', 2.60),
(3, 3, 13, 3, '2023-07-22', 4.10),
(4, 4, 14, 4, '2023-07-23', 5.00),
(5, 5, 15, 5, '2023-07-24', 2.10);


