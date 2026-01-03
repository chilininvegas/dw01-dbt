{{config(materialized='table')}}

WITH CTE AS (
    SELECT
        TO_TIMESTAMP(STARTED_AT) AS TIMESTAMP_STARTED_AT,
        DATE(TIMESTAMP_STARTED_AT) AS DATE_STARTED_AT,
        HOUR(TIMESTAMP_STARTED_AT) AS HOUR_STARTED_AT,
        DAYNAME(TIMESTAMP_STARTED_AT) AS DAY_NAME,
        {{day_type('DAY_NAME')}} AS DAY_TYPE,
        MONTHNAME(TIMESTAMP_STARTED_AT) AS MONTH_NAME,
        {{get_season('MONTH_NAME')}} AS SEASON
    FROM {{ref('stg_bike')}}
    where STARTED_AT != 'started_at' and STARTED_AT != '"started_at"'  -- filter out header row
)

SELECT * FROM CTE


