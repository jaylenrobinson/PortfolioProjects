-- First we will combine the data from all 12 months of 2022 into one table. This includes January 1st 2022 - December 31st 2022

CREATE TABLE `capstone-project2023.cyclistic_trip_data.combined_tripdata` AS 
SELECT *
FROM (
  SELECT * FROM `capstone-project2023.cyclistic_trip_data.jan_2022`
  UNION ALL
  SELECT * FROM `capstone-project2023.cyclistic_trip_data.feb_2022`
  UNION ALL
  SELECT * FROM `capstone-project2023.cyclistic_trip_data.mar_2022`
  UNION ALL
  SELECT * FROM `capstone-project2023.cyclistic_trip_data.apr_2022`
  UNION ALL
  SELECT * FROM `capstone-project2023.cyclistic_trip_data.may_2022`
  UNION ALL
  SELECT * FROM `capstone-project2023.cyclistic_trip_data.jun_2022`
  UNION ALL
  SELECT * FROM `capstone-project2023.cyclistic_trip_data.jul_2022`
  UNION ALL
  SELECT * FROM `capstone-project2023.cyclistic_trip_data.aug_2022`
  UNION ALL
  SELECT * FROM `capstone-project2023.cyclistic_trip_data.sep_2022`
  UNION ALL
  SELECT * FROM `capstone-project2023.cyclistic_trip_data.oct_2022`
  UNION ALL
  SELECT * FROM `capstone-project2023.cyclistic_trip_data.nov_2022`
  UNION ALL
  SELECT * FROM `capstone-project2023.cyclistic_trip_data.dec_2022`
  );

  SELECT *
  FROM `capstone-project2023.cyclistic_trip_data.combined_tripdata`

-- The combined data returned 5,667,717 rows

-- We now analyze the data from columns to figure out what needs to be cleaned

  -- #1 ride_id
  -- Check ride Id combinations ride_id
  -- Confirm all ride_id values are unique 

SELECT LENGTH(ride_id), count(*)
FROM `capstone-project2023.cyclistic_trip_data.combined_tripdata`
GROUP BY LENGTH(ride_id);

-- There are 3,794 rows where the ride_id is not 16 characters. This is less than 1% of the data and will be removed.  

SELECT COUNT (DISTINCT ride_id)
FROM `capstone-project2023.cyclistic_trip_data.combined_tripdata`;

-- all ride_id values are unique 

-- #2 rideable_type
-- Confirm that there is only 3 rideable_type values

SELECT DISTINCT rideable_type
FROM `capstone-project2023.cyclistic_trip_data.combined_tripdata`

-- There are 3 rideable_type values. electric_bike, classic_bike, and docked_bike

-- #4 start_station_name, end_station_name, start_station_id, and end_station_id
-- We will analyze these columns together because they dependent on one another.
-- Check null values 

SELECT *
FROM `capstone-project2023.cyclistic_trip_data.combined_tripdata`
WHERE start_station_name IS NULL AND start_station_id IS NULL OR
    end_station_name IS NULL AND end_station_id IS NULL 

-- 1,298,357 rows had null values wehre the start_station_name, start_station_id and or the end_station_name, end_station_id is null. 
-- This is a signifigant portion of the data but it will be removed to ensure the reliability of the data. 

-- #5 start_lat, start_lng, end_lat, and end_lng
-- Check null values
-- Note: by removing the null vaules in the start and edn location columns, the null values in start_lat, start_lng, end_lat, and end_lng will likely be removed as well.

SELECT *
FROM `capstone-project2023.cyclistic_trip_data.combined_tripdata`
WHERE start_lat IS NULL OR
 start_lng IS NULL OR
 end_lat IS NULL OR
 end_lng IS NULL;

--  There are 5,858 null values. These will be removed. 

-- #6 member_casual
-- Confirm there are only 2 values. 

SELECT DISTINCT member_type
FROM `capstone-project2023.cyclistic_trip_data.combined_tripdata`

-- There are only 2 member values. member and casual. 

-- We will now clean the data