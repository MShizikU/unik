--Trigger insert car test 
--success
SELECT * FROM vehicles;
--error
INSERT INTO vehicles (vin, color, state, place, id_vehicle_work_model) VALUES("ABCDEFGHIJKLMNO01", "red", "inactive", "56,08,00;40,25,00", 45);

--Procedure rent_car
--Success
CALL rent_car(1718598304, "ABCDEFGHIJKLMNO01", "55.755829, 37.617627");
SELECT * FROM rents;

--Also Trigger update_car_status
--Success
SELECT * from vehicles; 

--Error
CALL rent_car(1718598124, "ABCDEFGHIJKLMNO01", "55.755829, 37.617627");
CALL rent_car(1718598304, "ABCDEFGHIJKLMN141", "55.755829, 37.617627");
CALL rent_car(1718598304, "ABCDEFGHIJKLMN141", "55.755829, 37.617628");

--Trigger close the rents
--Procedure stop_rent_car
--Success
CALL stop_rent_car(1, "55.755829, 37.617628");
SELECT * FROM rents;
SELECT * from vehicles; 


--Test func claluate_total_rent_amount
SELECT calculate_total_rent_amount('1718598304');

--Test func get_available_vehicle_Count
SELECT get_available_vehicle_count();

--Test procdeure delete_user
call delete_user(1718598304);
SELECT * FROM users;
SELECT * FROM rents;