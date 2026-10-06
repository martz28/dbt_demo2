SELECT
*
FROM {{ source('demo', 'BIKE') }}

LIMIT 10
;


-- SELECT
-- *
-- FROM {{ ref('my_first_dbt_model') }}

-- LIMIT 10
-- ;