CREATE OR REPLACE TABLE `henryfirstgcpproject.uber_data_engineering_henry.tbl_analytics` AS (
SELECT 
  f.VendorID,
  DATETIME(d.pick_year, d.pick_month, d.pick_day, d.pick_hour, 0, 0) AS pickup_details,
  DATETIME(d.drop_year, d.drop_month, d.drop_day, d.drop_hour, 0, 0) AS dropoff_details,
  f.passenger_count,
  f.trip_distance,
  r.rate_code_name,
  p.payment_type_name,
  f.fare_amount,
  f.extra,
  f.mta_tax,
  f.tip_amount,
  f.tolls_amount,
  f.improvement_surcharge,
  f.total_amount,
  f.congestion_surcharge,
  f.airport_fee
FROM 
  `henryfirstgcpproject.uber_data_engineering_henry.fact_table` f
JOIN `henryfirstgcpproject.uber_data_engineering_henry.datetime_dim_y` d 
  ON f.datetime_id = d.datetime_id
JOIN `henryfirstgcpproject.uber_data_engineering_henry.rate_code_dim` r 
  ON f.rate_code_id = r.rate_code_id
JOIN `henryfirstgcpproject.uber_data_engineering_henry.payment_type_dim` p 
  ON f.payment_type_id = p.payment_type_id
JOIN `henryfirstgcpproject.uber_data_engineering_henry.taxi_zone_lookup` pu 
  ON f.pulocationid = pu.locationid
JOIN `henryfirstgcpproject.uber_data_engineering_henry.taxi_zone_lookup` do 
  ON f.dolocationid = do.locationid
);
