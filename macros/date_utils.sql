{% macro get_season(x) %}

    case 
        when month(to_timestamp({{x}})) in (12, 1, 2)  then 'WINTER'
        when month(to_timestamp({{x}})) in (3, 4, 5)   then 'SPRING'
        when month(to_timestamp({{x}})) in (6, 7, 8)   then 'SUMMER'
        when month(to_timestamp({{x}})) in (9, 10, 11) then 'AUTUMN'
    end

{% endmacro %}

{% macro day_type(x) %}

    case
        when dayname(to_timestamp({{x}})) in ('Sat', 'Sum') then 'WEEKEND'
        else 'BUSINESSDAY'
    end

{% endmacro %}            