{{config(materialized='table')}}

WITH TRIPS AS (
    SELECT
        RIDE_ID,
        DATE(TO_TIMESTAMP(STARTED_AT)) AS TRIP_DATE,
        START_STATION_ID,
        END_STATION_ID,
        REPLACE(MEMBER_CASUAL, '"', '') AS MEMBER_CASUAL,
        TIMESTAMPDIFF(SECOND, TO_TIMESTAMP(STARTED_AT), TO_TIMESTAMP(ENDED_AT)) AS TRIP_DURATION_SECONDS
    FROM {{ref('stg_bike')}}
    WHERE RIDE_ID != '"bikeid"' and RIDE_ID != 'bikeid'  -- filter out header row
)

SELECT * FROM TRIPS