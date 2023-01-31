
--   Rides per month by member type 

   SELECT member_type, ride_month, count(*) AS rides_per_month
   FROM `capstone-project2023.cyclistic_trip_data.combined_tripdata`
   GROUP BY member_type, ride_month

--  Rides per day by member type

   SELECT member_type, ride_day, count(*) AS rides_per_day
   FROM `capstone-project2023.cyclistic_trip_data.combined_tripdata`
   GROUP BY member_type, ride_day

--  Type of ride by member type 

   SELECT rideable_type, member_type, count(*) AS type_of_ride
   FROM `capstone-project2023.cyclistic_trip_data.combined_tripdata`
   GROUP BY rideable_type, member_type
   ORDER BY member_type, type_of_ride DESC