{{config(materialized='table')}}

WITH BIKE AS (
    SELECT
        RIDE_ID,
        REPLACE(STARTED_AT,'"','') AS STARTED_AT,
        REPLACE(ENDED_AT,'"','') AS ENDED_AT,
        START_STATION_NAME,
        START_STATION_ID,
        END_STATION_NAME,
        END_STATION_ID,
        START_LAT,
        START_LNG,
        END_LAT,
        END_LNG,
        MEMBER_CASUAL
    FROM {{ source('demo', 'bike') }}
    WHERE RIDE_ID not in ('"bikeid"', '""bikeid""') 
    and STARTED_AT not in ('"starttime"', 'starttime', '""starttime""')
)

SELECT * FROM BIKE