 CREATE DATABASE IF NOT EXISTS carsharing;
 USE carsharing;
 CREATE TABLE IF NOT EXISTS users(
    snpassport BIGINT PRIMARY KEY,
    full_name VARCHAR(256),
    date_of_birth DATE NOT NULL,
    id_level INT NOT NULL
);
CREATE TABLE IF NOT EXISTS user_level(
    id_level INT AUTO_INCREMENT PRIMARY KEY, 
    level_name VARCHAR(50), 
    level_discription VARCHAR(256), 
    count_users INTEGER NOT NULL
);
ALTER TABLE users ADD FOREIGN KEY (id_level) REFERENCES user_level(id_level);
CREATE TABLE IF NOT EXISTS vehicle_group(
    id_group INT AUTO_INCREMENT PRIMARY KEY, 
    group_name VARCHAR(50), 
    group_description VARCHAR(256), 
    count_vehicles INT NOT NULL
);

CREATE TABLE IF NOT EXISTS permissions(
    id_permission INT AUTO_INCREMENT, 
    id_group INT, 
    id_level INT, 
    primary key(id_permission, id_group, id_level)
);

ALTER TABLE permissions ADD FOREIGN KEY (id_group) REFERENCES user_level(id_level);
ALTER TABLE permissions ADD FOREIGN KEY (id_level) REFERENCES vehicle_group(id_group);

CREATE TABLE IF NOT EXISTS vehicle_model(
    id_model INTEGER AUTO_INCREMENT PRIMARY KEY, 
    model_name VARCHAR(100), 
    c_year VARCHAR(4), 
    complectation_name VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS vehicle_brand(
    id_brand INTEGER AUTO_INCREMENT PRIMARY KEY, 
    brand_name VARCHAR(100), 
    division VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS vehicle_name(
    id_vehicle_name INTEGER AUTO_INCREMENT, 
    id_model INT, 
    id_brand INT, 
    PRIMARY KEY (id_vehicle_name, id_model, id_brand)
);

ALTER TABLE vehicle_name ADD FOREIGN KEY (id_model) REFERENCES vehicle_model(id_model);
ALTER TABLE vehicle_name ADD FOREIGN KEY (id_brand) REFERENCES vehicle_brand(id_brand);

CREATE TABLE IF NOT EXISTS vehicle_work_model(
    id_vehicle_work_model INTEGER AUTO_INCREMENT PRIMARY KEY, 
    price_per_hour FLOAT NOT NULL, 
    id_vehicle_name INT NOT NULL, 
    model_photo_name VARCHAR(256), 
    id_group INT NOT NULL
);

ALTER TABLE vehicle_work_model ADD FOREIGN KEY (id_vehicle_name) REFERENCES vehicle_name(id_vehicle_name);
ALTER TABLE vehicle_work_model ADD FOREIGN KEY (id_group) REFERENCES vehicle_group(id_group);

CREATE TABLE IF NOT EXISTS vehicles(
    vin VARCHAR(17) NOT NULL PRIMARY KEY, 
    color VARCHAR(50), 
    state VARCHAR(30), 
    place VARCHAR(23), 
    id_vehicle_work_model INT
);

CREATE TABLE IF NOT EXISTS rents(
    id_rent INT AUTO_INCREMENT PRIMARY KEY, 
    snpassport BIGINT NOT NULL, 
    duration INT, 
    starting_point VARCHAR(23), 
    start_time TIMESTAMP, 
    end_time TIMESTAMP, 
    vin VARCHAR(17) NOT NULL, 
    ending_point VARCHAR(23)
);
ALTER TABLE rents ADD FOREIGN KEY (snpassport) REFERENCES users(snpassport);
ALTER TABLE rents ADD FOREIGN KEY (vin) REFERENCES vehicles(vin);
ALTER TABLE vahicles ADD FOREIGN KEY (id_vehicle_work_model) REFERENCES vehicle_work_model(id_vehicle_work_model);