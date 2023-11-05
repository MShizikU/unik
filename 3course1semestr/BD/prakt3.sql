--ПРОЦЕДУРЫ--

--Удаление пользователя--
CREATE PROCEDURE delete_user (
    IN p_snpassport BIGINT
) 
BEGIN
    DELETE FROM rents
    WHERE snpassport = p_snpassport;

    DELETE FROM users
    WHERE snpassport = p_snpassport;
END

--Добавление поездки--
CREATE PROCEDURE rent_car(
    IN snpassport BIGINT NOT NULL,
    IN vin VARCHAR(17),
    IN starting_point VARCHAR(23)
)
BEGIN
    INSERT INTO rents (snpassport, vin, start_time, starting_point)
    VALUES (snpassport, vin, CURRENT_TIMESTAMP, starting_point);
END;

--Завршение поездки--
CREATE PROCEDURE stop_rent_car(
    IN rent_id INT,
    IN endingPoint VARCHAR(23)
)
BEGIN
    UPDATE rents SET ending_point = endingPoint, end_time = CURRENT_TIMESTAMP  WHERE id = rent_id

--Функции--

--Подсчет общий суммы аренд--
CREATE FUNCTION calculate_total_rent_amount (
    p_snpassport BIGINT
)
RETURNS FLOAT
BEGIN
    DECLARE total_amount FLOAT;
    SELECT SUM(duration * price_per_hour) INTO total_amount
    FROM rents
    JOIN vehicles ON rents.vin = vehicles.vin
    JOIN vehicle_work_model ON vehicles.id_vehicle_work_model = vehicle_work_model.id_vehicle_work_model
    WHERE snpassport = p_snpassport;
    RETURN total_amount;
END

--Список доступных для аренды машин--
CREATE FUNCTION get_available_vehicles ()
RETURNS TABLE (
    vin VARCHAR(17),
    color VARCHAR(50),
    state VARCHAR(30),
    place VARCHAR(23),
    vehicle_name VARCHAR(50)
)
BEGIN
    RETURN (
        SELECT vehicles.vin, vehicles.color, vehicles.state, vehicles.place, vehicle_name.vehicle_name
        FROM vehicles
        JOIN vehicle_work_model ON vehicles.id_vehicle_work_model = vehicle_work_model.id_vehicle_work_model
        JOIN vehicle_name ON vehicle_work_model.id_vehicle_name = vehicle_name.id_vehicle_name
        WHERE vehicles.state = 'available'
    );
END

--Подсчет длительности поездки--
CREATE FUNCTION calculate_rent_duration(start_time TIMESTAMP, end_time TIMESTAMP) RETURNS INT
BEGIN
    DECLARE duration INT;
    SET duration = TIMESTAMPDIFF(HOUR, start_time, end_time);
    RETURN duration;
END;


--Тригеры--

--Закрытие поездки--
CREATE TRIGGER close_the_rent
AFTER UPDATE ON rents
FOR EACH ROW
BEGIN
    IF NEW.endTime IS NOT NULL THEN
        UPDATE rents SET duration = calculate_rent_duration(OLD.start_time, NEW.end_time) WHERE id = NEW.id;
        IF ending_point <> '' THEN
            UPDATE vehicles SET status = 'available', place = NEW.ending_point WHERE vin = OLD.vin;
        END IF;
    END IF;
END;

--Добавление новой поездки
CREATE TRIGGER update_car_status
BEFORE INSERT ON rents
FOR EACH ROW
BEGIN
    DECLARE car_count INT;
    DECLARE user_count INT;
    DECLARE place_match INT;
    
    SELECT COUNT(*) INTO car_count FROM cars WHERE vin = NEW.vin;
    SELECT COUNT(*) INTO user_count FROM users WHERE snpassport = NEW.snpassport;
    SELECT COUNT(*) INTO place_match FROM cars WHERE vin = NEW.vin AND place = NEW.start_point;
    
    IF car_count = 1 AND user_count = 1 THEN
        IF place_match = 1 THEN
            UPDATE cars SET status = 'unavailable' WHERE vin = NEW.vin;
        ELSE
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid start point';
        END IF;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid car or user';
    END IF;
END;

--Добавление новой машины
CREATE TRIGGER insert_car
BEFORE INSERT ON cars
FOR EACH ROW
BEGIN
    DECLARE work_model_count INT;
    SELECT COUNT(*) INTO work_model_count FROM vehicle_work_models WHERE model = NEW.vehicle_work_model;
    
    IF work_model_count = 1 THEN
        SET NEW.status = 'available';
        SET NEW.place = '55.755829, 37.617627';
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid vehicle work model';
    END IF;
END;