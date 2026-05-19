with cte_bike as (
    select distinct
           start_statio_id as start_station_id,
           START_STATIOn_name as station_name,
           start_lat as station_lat,
           start_lng as start_station_lng
    from {{ ref('stg_bike') }}
)
select *
from cte_bike
