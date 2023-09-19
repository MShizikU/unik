USE carsharing;

INSERT INTO user_level (level_name, level_discription, count_users) VALUES("first level", "basic", 0);
INSERT INTO user_level (level_name, level_discription, count_users) VALUES("second level", "basic", 0);
INSERT INTO user_level (level_name, level_discription, count_users) VALUES("third level", "basic", 0);
INSERT INTO user_level (level_name, level_discription, count_users) VALUES("fourth level", "middle", 0);
INSERT INTO user_level (level_name, level_discription, count_users) VALUES("fifth level", "middle", 0);
INSERT INTO user_level (level_name, level_discription, count_users) VALUES("six level", "middle", 0);
INSERT INTO user_level (level_name, level_discription, count_users) VALUES("seven level", "middle", 0);
INSERT INTO user_level (level_name, level_discription, count_users) VALUES("eight level", "top", 0);
INSERT INTO user_level (level_name, level_discription, count_users) VALUES("nine level", "top", 0);
INSERT INTO user_level (level_name, level_discription, count_users) VALUES("ten level", "top", 0);

INSERT INTO vehicle_group (group_name, group_description, count_vehicles) VALUES("first group" , "basic", 0);
INSERT INTO vehicle_group (group_name, group_description, count_vehicles) VALUES("second group" , "basic", 0);
INSERT INTO vehicle_group (group_name, group_description, count_vehicles) VALUES("third group" , "basic", 0);
INSERT INTO vehicle_group (group_name, group_description, count_vehicles) VALUES("fourth group" , "basic", 0);
INSERT INTO vehicle_group (group_name, group_description, count_vehicles) VALUES("fifth group" , "basic", 0);
INSERT INTO vehicle_group (group_name, group_description, count_vehicles) VALUES("six group" , "basic", 0);
INSERT INTO vehicle_group (group_name, group_description, count_vehicles) VALUES("seven group" , "basic", 0);
INSERT INTO vehicle_group (group_name, group_description, count_vehicles) VALUES("eight group" , "basic", 0);
INSERT INTO vehicle_group (group_name, group_description, count_vehicles) VALUES("nine group" , "basic", 0);
INSERT INTO vehicle_group (group_name, group_description, count_vehicles) VALUES("ten group" , "basic", 0);

INSERT INTO permissions (id_group, id_level) VALUES(1, 1);
INSERT INTO permissions (id_group, id_level) VALUES(2, 2);
INSERT INTO permissions (id_group, id_level) VALUES(3, 3);
INSERT INTO permissions (id_group, id_level) VALUES(4, 4);
INSERT INTO permissions (id_group, id_level) VALUES(5, 5);
INSERT INTO permissions (id_group, id_level) VALUES(6, 6);
INSERT INTO permissions (id_group, id_level) VALUES(7, 7);
INSERT INTO permissions (id_group, id_level) VALUES(8, 8);
INSERT INTO permissions (id_group, id_level) VALUES(9, 9);
INSERT INTO permissions (id_group, id_level) VALUES(10, 10);

INSERT INTO vehicle_model (model_name, c_year, complectation_name) VALUES("Mark II", "2000", "Full");
INSERT INTO vehicle_model (model_name, c_year, complectation_name) VALUES("e200", "2001", "Min");
INSERT INTO vehicle_model (model_name, c_year, complectation_name) VALUES("CR-V", "2004", "Full");
INSERT INTO vehicle_model (model_name, c_year, complectation_name) VALUES("Gets", "2010", "Middle");
INSERT INTO vehicle_model (model_name, c_year, complectation_name) VALUES("Lancer evo", "2008", "Sport");
INSERT INTO vehicle_model (model_name, c_year, complectation_name) VALUES("Matiz", "2011", "Min");
INSERT INTO vehicle_model (model_name, c_year, complectation_name) VALUES("Q5", "2021", "Min");
INSERT INTO vehicle_model (model_name, c_year, complectation_name) VALUES("m5", "2022", "Full");
INSERT INTO vehicle_model (model_name, c_year, complectation_name) VALUES("Tiguan", "2018", "Full");
INSERT INTO vehicle_model (model_name, c_year, complectation_name) VALUES("Kalina", "2006", "Top");

INSERT INTO vehicle_brand (brand_name, division) VALUES("Toyota", "Russia");
INSERT INTO vehicle_brand (brand_name, division) VALUES("Mercedes", "Russia");
INSERT INTO vehicle_brand (brand_name, division) VALUES("Honda", "Russia");
INSERT INTO vehicle_brand (brand_name, division) VALUES("Hundai", "Russia");
INSERT INTO vehicle_brand (brand_name, division) VALUES("Mitsubishi", "Russia");
INSERT INTO vehicle_brand (brand_name, division) VALUES("Daewoo", "Russia");
INSERT INTO vehicle_brand (brand_name, division) VALUES("Cherry", "Russia");
INSERT INTO vehicle_brand (brand_name, division) VALUES("BMW", "Russia");
INSERT INTO vehicle_brand (brand_name, division) VALUES("Wolkswagen", "Russia");
INSERT INTO vehicle_brand (brand_name, division) VALUES("Lada", "Russia");

INSERT INTO vehicle_name (id_model, id_brand) VALUES(1, 1);
INSERT INTO vehicle_name (id_model, id_brand) VALUES(2, 2);
INSERT INTO vehicle_name (id_model, id_brand) VALUES(3, 3);
INSERT INTO vehicle_name (id_model, id_brand) VALUES(4, 4);
INSERT INTO vehicle_name (id_model, id_brand) VALUES(5, 5);
INSERT INTO vehicle_name (id_model, id_brand) VALUES(6, 6);
INSERT INTO vehicle_name (id_model, id_brand) VALUES(7, 7);
INSERT INTO vehicle_name (id_model, id_brand) VALUES(8, 8);
INSERT INTO vehicle_name (id_model, id_brand) VALUES(9, 9);
INSERT INTO vehicle_name (id_model, id_brand) VALUES(10, 10);

INSERT INTO vehicle_work_model (price_per_hour, id_vehicle_name, model_photo_name, id_group) VALUES(20.0, 1, "toymarkii2000", 1);
INSERT INTO vehicle_work_model (price_per_hour, id_vehicle_name, model_photo_name, id_group) VALUES(25.5, 1, "mere2002001", 2);
INSERT INTO vehicle_work_model (price_per_hour, id_vehicle_name, model_photo_name, id_group) VALUES(30.0, 1, "honcrv2004", 3);
INSERT INTO vehicle_work_model (price_per_hour, id_vehicle_name, model_photo_name, id_group) VALUES(35.5, 1, "hungets2010", 4);
INSERT INTO vehicle_work_model (price_per_hour, id_vehicle_name, model_photo_name, id_group) VALUES(40.0, 1, "mitlancerevo2008", 5);
INSERT INTO vehicle_work_model (price_per_hour, id_vehicle_name, model_photo_name, id_group) VALUES(45.5, 1, "daematiz2011", 6);
INSERT INTO vehicle_work_model (price_per_hour, id_vehicle_name, model_photo_name, id_group) VALUES(50.0, 1, "cherq52021", 7);
INSERT INTO vehicle_work_model (price_per_hour, id_vehicle_name, model_photo_name, id_group) VALUES(55.5, 1, "bmwm52022", 8);
INSERT INTO vehicle_work_model (price_per_hour, id_vehicle_name, model_photo_name, id_group) VALUES(60.0, 1, "woltiguan2018", 9);
INSERT INTO vehicle_work_model (price_per_hour, id_vehicle_name, model_photo_name, id_group) VALUES(65.5, 1, "ladakalina2006", 10);


INSERT INTO vehicles (vin, color, state, place, id_vehicle_work_model) VALUES("ABCDEFGHIJKLMNO01", "red", "inactive", "56,08,00;40,25,00", 1);
INSERT INTO vehicles (vin, color, state, place, id_vehicle_work_model) VALUES("ABCDEFGHIJKLMNO02", "green", "inactive", "56,08,00;40,25,00", 2);
INSERT INTO vehicles (vin, color, state, place, id_vehicle_work_model) VALUES("ABCDEFGHIJKLMNO03", "black", "inactive", "56,08,00;40,25,00", 3);
INSERT INTO vehicles (vin, color, state, place, id_vehicle_work_model) VALUES("ABCDEFGHIJKLMNO04", "blue", "inactive", "56,08,00;40,25,00", 4);
INSERT INTO vehicles (vin, color, state, place, id_vehicle_work_model) VALUES("ABCDEFGHIJKLMNO05", "blue", "inactive", "56,08,00;40,25,00", 5);
INSERT INTO vehicles (vin, color, state, place, id_vehicle_work_model) VALUES("ABCDEFGHIJKLMNO06", "black", "inactive", "56,08,00;40,25,00", 6);
INSERT INTO vehicles (vin, color, state, place, id_vehicle_work_model) VALUES("ABCDEFGHIJKLMNO07", "green", "inactive", "56,08,00;40,25,00", 7);
INSERT INTO vehicles (vin, color, state, place, id_vehicle_work_model) VALUES("ABCDEFGHIJKLMNO08", "red", "inactive", "56,08,00;40,25,00", 8);
INSERT INTO vehicles (vin, color, state, place, id_vehicle_work_model) VALUES("ABCDEFGHIJKLMNO09", "green", "inactive", "56,08,00;40,25,00", 9);
INSERT INTO vehicles (vin, color, state, place, id_vehicle_work_model) VALUES("ABCDEFGHIJKLMNO10", "blakc", "inactive", "56,08,00;40,25,00", 10);

INSERT INTO users (snpassport, full_name, date_of_birth, id_level) VALUES(1718598304, "Stas", "2004-06-03", 1);
INSERT INTO users (snpassport, full_name, date_of_birth, id_level) VALUES(1718598305, "Roma", "1998-08-05", 2);
INSERT INTO users (snpassport, full_name, date_of_birth, id_level) VALUES(1718598306, "Vlad", "1995-05-26", 3);
INSERT INTO users (snpassport, full_name, date_of_birth, id_level) VALUES(1718598307, "Anton", "1999-06-13", 4);
INSERT INTO users (snpassport, full_name, date_of_birth, id_level) VALUES(1718598308, "Petya", "2002-04-13", 5);
INSERT INTO users (snpassport, full_name, date_of_birth, id_level) VALUES(1718598309, "Dima", "2014-04-03", 6);
INSERT INTO users (snpassport, full_name, date_of_birth, id_level) VALUES(1718598310, "Viktor", "2001-06-01", 7);
INSERT INTO users (snpassport, full_name, date_of_birth, id_level) VALUES(1718598311, "Egor", "2002-03-03", 8);
INSERT INTO users (snpassport, full_name, date_of_birth, id_level) VALUES(1718598312, "Nikita", "2003-05-03", 9);
INSERT INTO users (snpassport, full_name, date_of_birth, id_level) VALUES(1718598313, "Lexa", "2003-06-03", 10);

INSERT INTO rents (snpassport, vin, duration, starting_point, ending_point, start_time, end_time) 
VALUES(1718598304,"ABCDEFGHIJKLMNO01", 0, "56,08,00;40,25,00", "56,08,00;40,25,00", "2023-09-19 09:00:00", "2023-09-19 09:00:00");
INSERT INTO rents (snpassport, vin, duration, starting_point, ending_point, start_time, end_time) 
VALUES(1718598305,"ABCDEFGHIJKLMNO02", 0, "56,08,00;40,25,00", "56,08,00;40,25,00", "2023-09-19 09:00:00", "2023-09-19 09:00:00");
INSERT INTO rents (snpassport, vin, duration, starting_point, ending_point, start_time, end_time) 
VALUES(1718598306,"ABCDEFGHIJKLMNO03", 0, "56,08,00;40,25,00", "56,08,00;40,25,00", "2023-09-19 09:00:00", "2023-09-19 09:00:00");
INSERT INTO rents (snpassport, vin, duration, starting_point, ending_point, start_time, end_time) 
VALUES(1718598307,"ABCDEFGHIJKLMNO04", 0, "56,08,00;40,25,00", "56,08,00;40,25,00", "2023-09-19 09:00:00", "2023-09-19 09:00:00");
INSERT INTO rents (snpassport, vin, duration, starting_point, ending_point, start_time, end_time) 
VALUES(1718598308,"ABCDEFGHIJKLMNO05", 0, "56,08,00;40,25,00", "56,08,00;40,25,00", "2023-09-19 09:00:00", "2023-09-19 09:00:00");
INSERT INTO rents (snpassport, vin, duration, starting_point, ending_point, start_time, end_time) 
VALUES(1718598309,"ABCDEFGHIJKLMNO06", 0, "56,08,00;40,25,00", "56,08,00;40,25,00", "2023-09-19 09:00:00", "2023-09-19 09:00:00");
INSERT INTO rents (snpassport, vin, duration, starting_point, ending_point, start_time, end_time) 
VALUES(1718598310,"ABCDEFGHIJKLMNO07", 0, "56,08,00;40,25,00", "56,08,00;40,25,00", "2023-09-19 09:00:00", "2023-09-19 09:00:00");
INSERT INTO rents (snpassport, vin, duration, starting_point, ending_point, start_time, end_time) 
VALUES(1718598311,"ABCDEFGHIJKLMNO08", 0, "56,08,00;40,25,00", "56,08,00;40,25,00", "2023-09-19 09:00:00", "2023-09-19 09:00:00");
INSERT INTO rents (snpassport, vin, duration, starting_point, ending_point, start_time, end_time) 
VALUES(1718598312,"ABCDEFGHIJKLMNO09", 0, "56,08,00;40,25,00", "56,08,00;40,25,00", "2023-09-19 09:00:00", "2023-09-19 09:00:00");
INSERT INTO rents (snpassport, vin, duration, starting_point, ending_point, start_time, end_time) 
VALUES(1718598313,"ABCDEFGHIJKLMNO10", 0, "56,08,00;40,25,00", "56,08,00;40,25,00", "2023-09-19 09:00:00", "2023-09-19 09:00:00");