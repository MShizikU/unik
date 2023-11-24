delimiter //


CREATE PROCEDURE delete_user (IN p_snpassport BIGINT) 
BEGIN
    DELETE FROM rents WHERE snpassport = p_snpassport;
    DELETE FROM users
    WHERE snpassport = p_snpassport;
END//

CREATE PROCEDURE rent_car(
    IN snpassport BIGINT,
    IN vin VARCHAR(17),
    IN starting_point VARCHAR(23)
)
BEGIN
    INSERT INTO rents (snpassport, vin, start_time, starting_point)
    VALUES (snpassport, vin, CURRENT_TIMESTAMP, starting_point);
END//

CREATE PROCEDURE stop_rent_car(
    IN rent_id INT,
    IN endingPoint VARCHAR(23)
)
BEGIN
    DECLARE startTime TIMESTAMP;
    DECLARE dduration INT;

    SELECT start_time INTO startTime
    FROM rents
    WHERE id_rent = rent_id;

    SET dduration = calculate_rent_duration(startTime, CURRENT_TIMESTAMP);

    UPDATE rents
    SET ending_point = endingPoint,
        end_time = CURRENT_TIMESTAMP,
        duration = dduration
    WHERE id_rent = rent_id;
END//



CREATE FUNCTION calculate_total_rent_amount (
    p_snpassport BIGINT
)
RETURNS FLOAT
DETERMINISTIC
BEGIN
    DECLARE total_amount FLOAT;
    SELECT SUM(duration * price_per_hour) INTO total_amount
    FROM rents
    JOIN vehicles ON rents.vin = vehicles.vin
    JOIN vehicle_work_model ON vehicles.id_vehicle_work_model = vehicle_work_model.id_vehicle_work_model
    WHERE snpassport = p_snpassport;
    RETURN total_amount;
END//

CREATE FUNCTION get_available_vehicle_count()
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE count INT;
    SELECT COUNT(*) INTO count
    FROM vehicles
    WHERE state = 'available';

    RETURN count;
END//

CREATE FUNCTION calculate_rent_duration(start_time TIMESTAMP, end_time TIMESTAMP) RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE duration INT;
    SET duration = TIMESTAMPDIFF(SECOND, start_time, end_time);
    RETURN duration;
END//



CREATE TRIGGER close_the_rent
AFTER UPDATE ON rents
FOR EACH ROW
BEGIN
    IF NEW.ending_point <> '' THEN
        UPDATE vehicles SET state = 'available', place = NEW.ending_point WHERE vin = OLD.vin;
    END IF;
END//

CREATE TRIGGER update_car_status
BEFORE INSERT ON rents
FOR EACH ROW
BEGIN
    DECLARE car_count INT;
    DECLARE user_count INT;
    DECLARE place_match INT;
    
    SELECT COUNT(*) INTO car_count FROM vehicles WHERE vin = NEW.vin;
    SELECT COUNT(*) INTO user_count FROM users WHERE snpassport = NEW.snpassport;
    SELECT COUNT(*) INTO place_match FROM vehicles WHERE vin = NEW.vin AND place = NEW.starting_point;
    
    IF car_count = 1 AND user_count = 1 THEN
        IF place_match = 1 THEN
            UPDATE vehicles SET state = 'unavailable' WHERE vin = NEW.vin;
        ELSE
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid start point';
        END IF;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid car or user';
    END IF;
END//

CREATE TRIGGER insert_car
BEFORE INSERT ON vehicles
FOR EACH ROW
BEGIN
    DECLARE work_model_count INT;
    SELECT COUNT(*) INTO work_model_count FROM vehicle_work_model WHERE id_vehicle_work_model = NEW.id_vehicle_work_model;
    
    IF work_model_count = 1 THEN
        SET NEW.state = 'available';
        SET NEW.place = '55.755829, 37.617627';
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid vehicle work model';
    END IF;
END//