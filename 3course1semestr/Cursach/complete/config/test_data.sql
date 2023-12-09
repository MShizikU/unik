INSERT INTO user_level (level_name, level_description) VALUES ('First level', 'Level for new users');
INSERT INTO user_level (level_name, level_description) VALUES('Second level', 'Level for users with 5 year experience');
INSERT INTO user_level (level_name, level_description) VALUES('Third level', 'Level for users with 10 year experience');

INSERT INTO vehicle_group (group_name, group_description) VALUES('First group' , 'Basic group');
INSERT INTO vehicle_group (group_name, group_description) VALUES('Second group' , 'Middle class group');
INSERT INTO vehicle_group (group_name, group_description) VALUES('Third group' , 'Elite class group');

INSERT INTO permissions (id_group, id_level) VALUES(1, 1);
INSERT INTO permissions (id_group, id_level) VALUES(2, 2);
INSERT INTO permissions (id_group, id_level) VALUES(3, 3);

INSERT INTO vehicle_model (model_name, c_year) VALUES('Mark II', '2000');
INSERT INTO vehicle_model (model_name, c_year) VALUES('e200', '2001');
INSERT INTO vehicle_model (model_name, c_year) VALUES('CR-V', '2004');

INSERT INTO vehicle_brand (brand_name, division) VALUES('Toyota', 'Russia');
INSERT INTO vehicle_brand (brand_name, division) VALUES('Mercedes', 'Russia');
INSERT INTO vehicle_brand (brand_name, division) VALUES('Honda', 'Russia');

INSERT INTO vehicle_name (id_model, id_brand) VALUES(1, 1);
INSERT INTO vehicle_name (id_model, id_brand) VALUES(2, 2);
INSERT INTO vehicle_name (id_model, id_brand) VALUES(3, 3);

INSERT INTO vehicle_work_model (price_per_hour, id_vehicle_name, model_photo_name, id_group) VALUES(20.0, 1, 'toymarkii2000', 1);
INSERT INTO vehicle_work_model (price_per_hour, id_vehicle_name, model_photo_name, id_group) VALUES(25.5, 2, 'mere2002001', 2);
INSERT INTO vehicle_work_model (price_per_hour, id_vehicle_name, model_photo_name, id_group) VALUES(30.0, 3, 'honcrv2004', 3);


INSERT INTO vehicles (vin, color, state, place, id_vehicle_work_model) VALUES('ABCDEFGHIJKLMNO01', 'red', 'available', 'test', 1);
INSERT INTO vehicles (vin, color, state, place, id_vehicle_work_model) VALUES('ABCDEFGHIJKLMNO02', 'green', 'available', 'test', 2);
INSERT INTO vehicles (vin, color, state, place, id_vehicle_work_model) VALUES('ABCDEFGHIJKLMNO03', 'black', 'available', 'test', 3);