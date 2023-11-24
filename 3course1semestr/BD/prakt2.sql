SELECT * FROM user_level;
SELECT level_name, level_discription FROM user_level;
SELECT * FROM user_level WHERE `level_discription` = 'middle';
SELECT * FROM user_level WHERE `id` > 6 OR `level_discription` = 'middle';
SELECT id_vehicle_name, vn.id_model, vb.brand_name FROM vehicle_name AS vn JOIN vehicle_brand AS vb ON vn.id_brand = vb.id_brand;

SELECT r.id_rent, r.duration, r.starting_point, r.start_time, u.snpassport, u.full_name, ul.level_name, v.vin, v.color, vg.group_name, vb.brand_name, vm.model_name, vwm.price_per_hour 
FROM rents AS r 
JOIN users AS u ON r.snpassport = u.snpassport
JOIN user_level AS ul ON u.id_level = ul.id_level
JOIN vehicles AS v ON r.vin = v.vin
JOIN vehicle_work_model AS vwm ON v.id_vehicle_work_model = vwm.id_vehicle_work_model
JOIN vehicle_name AS vn ON vwm.id_vehicle_name = vn.id_vehicle_name
JOIN vehicle_brand AS vb ON vb.id_brand = vn.id_brand
JOIN vehicle_model AS vm ON vm.id_model = vn.id_model
JOIN vehicle_group AS vg ON vwm.id_group = vg.id_group;

SELECT r.id_rent, r.duration, r.starting_point, r.start_time, u.snpassport, u.full_name, ul.level_name, v.vin, v.color, vg.group_name, vb.brand_name, vm.model_name, vwm.price_per_hour 
FROM rents AS r 
JOIN users AS u ON r.snpassport = u.snpassport
JOIN user_level AS ul ON u.id_level = ul.id_level
JOIN vehicles AS v ON r.vin = v.vin
JOIN vehicle_work_model AS vwm ON v.id_vehicle_work_model = vwm.id_vehicle_work_model
JOIN vehicle_name AS vn ON vwm.id_vehicle_name = vn.id_vehicle_name
JOIN vehicle_brand AS vb ON vb.id_brand = vn.id_brand
JOIN vehicle_model AS vm ON vm.id_model = vn.id_model
JOIN vehicle_group AS vg ON vwm.id_group = vg.id_group
ORDER BY u.snpassport ASC; 

SELECT * FROM users ORDER BY full_name, id_level DESC;

UPDATE users SET `full_name` = 'Anton' WHERE `snpassport` = '1718598309';