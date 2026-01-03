{{config(materialized='table')}}

WITH CTE AS (
    SELECT
        t.*,
        w.*
    FROM {{ref('trip_fact')}} t
    LEFT JOIN {{ref('daily_weather')}} w
    ON t.TRIP_DATE = w.DT
    ORDER BY TRIP_DATE DESC
)

SELECT * FROM CTE