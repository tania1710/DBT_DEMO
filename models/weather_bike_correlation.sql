with cte_trip as (
    select t.*,
        w.*
    from {{ ref('trip_fact') }} t
        left join {{ ref('daily_weather') }} w on w.daily_weather = t.trip_date
    limit 10

)
select *
from cte_trip 