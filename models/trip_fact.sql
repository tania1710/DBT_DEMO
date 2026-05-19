with cte_trip as (
    select ride_id,
           --rideable_type,
           date(to_timestamp(started_at)) as trip_date,
           START_STATIO_ID as START_STATION_ID,
           end_STATIOn_name as end_STATION_name,
           MEMBER_CSUAL AS MEMBER_CASUAL,
           TIMESTAMPDIFF(SECOND, to_timestamp(started_at), to_timestamp(ENDED_at)) as trip_duration_seconds
    from {{ ref('stg_bike') }}
)
select *
from cte_trip
