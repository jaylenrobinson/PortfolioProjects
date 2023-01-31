-- #1 Remove rows where ride_id is not 16 characters

DELETE
FROM `capstone-project2023.cyclistic_trip_data.combined_tripdata`
WHERE LENGTH(ride_id) < 16


-- #2 Remove rows where start_station_name, start_station_id, end_station_name, and end_station_id are null

DELETE
FROM `capstone-project2023.cyclistic_trip_data.combined_tripdata`
WHERE start_station_name IS NULL AND start_station_id IS NULL OR
    end_station_name IS NULL AND end_station_id IS NULL 

    -- 1,297,502 rows removed

#3 Remove rows where start_lat, start_lng, end_lat, and end_lng are null

DELETE
FROM `capstone-project2023.cyclistic_trip_data.combined_tripdata`
WHERE start_lat IS NULL OR
 start_lng IS NULL OR
 end_lat IS NULL OR
 end_lng IS NULL;

--  0 rows were removed because removing rows where start_station_name, start_station_id, end_station_name, and end_station_id are null also removed the rows where start_lat, start_lng, end_lat, and end_lng are null

-- Data is clean. We will now analyze for visualization