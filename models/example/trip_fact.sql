WITH CTE01_BIKE AS (


SELECT

    RIDE_ID,
    -- RIDEABLE_TYPE,
    DATE( try_to_timestamp(STARTED_AT) ) AS TRIP_DATE,
    START_STATIO_ID AS START_STATION_ID,
    END_STATION_NAME,
    MEMBER_CSUAL AS MEMBER_CASUAL,
    TIMESTAMPDIFF(SECOND, try_to_timestamp(STARTED_AT), try_to_timestamp(ENDED_AT) ) AS RIDE_TIME

FROM {{ ref('stg_bike') }} -- for new loaded data

WHERE RIDE_ID != 'ride_id'


)

SELECT 
    *
FROM CTE01_BIKE