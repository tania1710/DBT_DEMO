with cte as (
    select  to_timestamp(started_at) as started_at,
            date(to_timestamp(started_at)) as date_started_at,
            hour(to_timestamp(started_at)) as hour_started_at,
            case when dayname(to_timestamp(started_at)) in ('Sat', 'Sum') then 'WEEKEND'
            ELSE 'BUSINESS' END as day_type,
            case 
                when month(to_timestamp(started_at)) in (12, 1, 2)  then 'winter'
                when month(to_timestamp(started_at)) in (3, 4, 5)   then 'spring'
                when month(to_timestamp(started_at)) in (6, 7, 8)   then 'summer'
                when month(to_timestamp(started_at)) in (9, 10, 11) then 'autumn'
            end as STATION_OF_YEAR
            
    from {{ source('demo', 'bike') }}   
    where started_at <> 'started_at'
)
select *
from cte 