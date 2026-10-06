{%  macro get_season(datestring) %}

CASE
    WHEN MONTH( try_to_timestamp({{datestring}}) ) in (12,1,2) THEN 'WINTER'
    WHEN MONTH( try_to_timestamp({{datestring}})  ) in (3,4,5) THEN 'SPRING'
    WHEN MONTH( try_to_timestamp({{datestring}})  ) in (6,7,8) THEN 'SUMMER'
    ELSE 'AUTUMN'
END

{% endmacro %}

{% macro get_type_of_day(datestring) %}

CASE 
    WHEN dayname( try_to_timestamp({{datestring}}) ) IN ('Sat', 'Sun') THEN 'WEEKEND'
    ELSE 'BUSINESSDAY'
END


{% endmacro %}
