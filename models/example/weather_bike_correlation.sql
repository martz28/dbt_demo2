WITH CTE01 AS (

SELECT 
    t.*,
    w.*
FROM {{ ref('trip_fact') }} t

LEFT JOIN {{ ref('daily_weather') }} w
    ON t.TRIP_DATE = w.DAILY_WEATHER



)


SELECT
    *
FROM CTE01