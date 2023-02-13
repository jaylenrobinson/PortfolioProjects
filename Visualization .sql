
--   Ride month by member type 

   SELECT member_type, ride_month, count(*) AS rides_per_month
   FROM `capstone-project2023.cyclistic_trip_data.combined_tripdata`
   GROUP BY member_type, ride_month

--  Ride day by member type

   SELECT member_type, ride_day, count(*) AS rides_per_day
   FROM `capstone-project2023.cyclistic_trip_data.combined_tripdata`
   GROUP BY member_type, ride_day


