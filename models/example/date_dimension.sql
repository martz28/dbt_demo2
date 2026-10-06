WITH CTE1 AS (
    SELECT
        STARTED_AT

    FROM {{ source('demo', 'BIKE') }}
    WHERE LOWER(STARTED_AT) != 'start_at'
),

CTE2 AS (
    SELECT
        -- to_timestamp(STARTED_AT) AS STARTED_AT,
        try_to_timestamp(STARTED_AT) AS STARTED_AT,
        date( try_to_timestamp(STARTED_AT) ) AS STARTED_AT_DATE,
        hour( try_to_timestamp(STARTED_AT) ) AS STARTED_AT_HOUR,
        -- CASE 
        --     WHEN dayname( try_to_timestamp(STARTED_AT) ) IN ('Sat', 'Sun') THEN 'WEEKEND'
        --     ELSE 'BUSINESSDAY'
        -- END AS DAY_TYPE,

        {{ get_type_of_day('STARTED_AT') }} AS DAY_TYPE,

        MONTH( try_to_timestamp(STARTED_AT) ) AS STARTED_AT_MONTH,
        -- CASE
        --     WHEN MONTH( try_to_timestamp(STARTED_AT) ) in (12,1,2) THEN 'WINTER'
        --     WHEN MONTH( try_to_timestamp(STARTED_AT) ) in (3,4,5) THEN 'SPRING'
        --     WHEN MONTH( try_to_timestamp(STARTED_AT) ) in (6,7,8) THEN 'SUMMER'
        --     ELSE 'AUTUMN'
        -- END AS SEASON_OF_YEAR

         {{ get_season('STARTED_AT') }} AS SEASON_OF_YEAR

    FROM CTE1

)

SELECT 
*
FROM CTE2

