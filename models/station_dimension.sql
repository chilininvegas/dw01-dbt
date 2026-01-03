{{config(materialized='table')}}

WITH BIKE as (
    SELECT DISTINCT
        START_STATION_ID as STATION_ID,
        START_STATION_NAME as STATION_NAME,
        START_LAT as STATION_LAT,
        START_LNG as STATION_LNG
    FROM {{source('demo', 'bike')}}
    where RIDE_ID != 'ride_id'  -- filter out header row
)

select * FROM BIKE