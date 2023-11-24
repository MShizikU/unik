SELECT 
    id_rent,
    snpassport,
    duration,
    starting_point,
    start_time,
    end_time,
    vin,
    ending_point,
    SUM(duration) OVER (ORDER BY start_time) AS total_duration
FROM rents;

SELECT
    v.vin,
    v.color,
    v.state,
    AVG(r.duration) OVER (PARTITION BY v.id_vehicle_work_model) AS average_duration
FROM
    vehicles v
JOIN
    rents r ON v.vin = r.vin;

WITH AvgDurationCTE AS (
    SELECT
        v.vin,
        v.color,
        v.state,
        v.id_vehicle_work_model,
        AVG(r.duration) OVER (PARTITION BY v.id_vehicle_work_model) AS average_duration
    FROM
        vehicles v
    JOIN
        rents r ON v.vin = r.vin
)
SELECT
    vin,
    color,
    state,
    id_vehicle_work_model,
    average_duration,
    DENSE_RANK() OVER (ORDER BY average_duration) AS duration_rank
FROM
    AvgDurationCTE;

SELECT id_rent, snpassport, start_time,
           LAG(end_time) OVER (PARTITION BY snpassport ORDER BY start_time) AS previous_end_time
    FROM rents;

WITH firstRent AS (
	SELECT
		u.snpassport AS PassportData,
		u.full_name AS FullName,
		u.date_of_birth AS DateOfBirth,
		u.id_level AS LevelId,
        r.id_rent AS FirstRentId,
        r.end_time AS EndTime,
        FIRST_VALUE(r.id_rent) OVER (PARTITION BY u.snpassport ORDER BY r.start_time) AS first_rent_id
	FROM rents as r
    JOIN users as u ON r.snpassport = u.snpassport
)
SELECT 
	PassportData,
    FullName,
    DateOfBirth,
    LevelId,
    FirstRentId,
    EndTime
FROM firstRent
WHERE first_rent_id = FirstRentId;