WITH BIKE AS (

select
RIDE_ID,
REPLACE(STARTED_AT,'"','') AS STARTED_AT,
REPLACE(ENDED_AT,'"','') AS ENDED_AT,
START_STATION_NAME,
START_STATIO_ID,
END_STATION_NAME,
END_STATION_ID,
START_LAT,
START_LNG,
END_LAT,
END_LNG,
MEMBER_CSUAL

from {{ source('demo', 'BIKE') }}

where RIDE_ID not in (
--     -- 'ride_id', -- this for the old data
    '"bikeid"', '""bikeid""')  -- this is for the new data which isn't loaded yet
  and STARTED_AT not in ('"starttime"', 'starttime', '""starttime""')
)

select
*
from BIKE