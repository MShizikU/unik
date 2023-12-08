CREATE TABLE users(
    snpassport BIGINT PRIMARY KEY,
    username VARCHAR(256),
    full_name VARCHAR(256),
    date_of_birth DATE,
    id_level INT NOT NULL
);

CREATE TABLE user_level(
    id_level SERIAL PRIMARY KEY,
    level_name VARCHAR(50),
    level_description VARCHAR(256)
);

ALTER TABLE users ADD FOREIGN KEY (id_level) REFERENCES user_level(id_level);

CREATE TABLE vehicle_group(
    id_group SERIAL PRIMARY KEY,
    group_name VARCHAR(50),
    group_description VARCHAR(256)
);

CREATE TABLE permissions(
    id_permission SERIAL,
    id_group INT,
    id_level INT,
    PRIMARY KEY (id_group, id_level)
);

ALTER TABLE permissions ADD FOREIGN KEY (id_group) REFERENCES user_level(id_level);
ALTER TABLE permissions ADD FOREIGN KEY (id_level) REFERENCES vehicle_group(id_group);

CREATE TABLE vehicle_model(
    id_model SERIAL PRIMARY KEY,
    model_name VARCHAR(100),
    c_year VARCHAR(4)
);

CREATE TABLE vehicle_brand(
    id_brand SERIAL PRIMARY KEY,
    brand_name VARCHAR(100),
    division VARCHAR(100)
);

CREATE TABLE vehicle_name(
    id_vehicle_name SERIAL PRIMARY KEY,
    id_model INT,
    id_brand INT
);

ALTER TABLE vehicle_name ADD FOREIGN KEY (id_model) REFERENCES vehicle_model(id_model);
ALTER TABLE vehicle_name ADD FOREIGN KEY (id_brand) REFERENCES vehicle_brand(id_brand);

CREATE TABLE vehicle_work_model(
    id_vehicle_work_model SERIAL PRIMARY KEY,
    price_per_hour FLOAT NOT NULL,
    id_vehicle_name INT NOT NULL,
    model_photo_name VARCHAR(256),
    id_group INT NOT NULL
);

ALTER TABLE vehicle_work_model ADD FOREIGN KEY (id_vehicle_name) REFERENCES vehicle_name(id_vehicle_name);
ALTER TABLE vehicle_work_model ADD FOREIGN KEY (id_group) REFERENCES vehicle_group(id_group);

CREATE TABLE vehicles(
    vin VARCHAR(17) NOT NULL PRIMARY KEY,
    color VARCHAR(50),
    state VARCHAR(30),
    place VARCHAR(23),
    id_vehicle_work_model INT
);

CREATE TABLE rents(
    id_rent SERIAL PRIMARY KEY,
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
ALTER TABLE vehicles ADD FOREIGN KEY (id_vehicle_work_model) REFERENCES vehicle_work_model(id_vehicle_work_model);