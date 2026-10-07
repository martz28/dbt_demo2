SELECT
*
FROM {{ source('demo', 'BIKE') }}

LIMIT 10
;


