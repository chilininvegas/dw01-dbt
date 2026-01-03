{% macro get_season(x) %}
-- x is result of MONTHNAME()

CASE
    WHEN {{x}} IN ('Dec', 'Jan', 'Feb') THEN 'winter'
    WHEN {{x}} IN ('Mar', 'Apr', 'May') THEN 'spring'
    WHEN {{x}} IN ('Jun', 'Jul', 'Aug') THEN 'summer'
    WHEN {{x}} IN ('Sep', 'Oct', 'Nov') THEN 'autumn'
END

{% endmacro %}

{% macro day_type(x) %}
-- x is result of DAYNAME()

CASE
    WHEN {{x}} in ('Sat', 'Sun') THEN 'weekend'
    ELSE 'weekday'
END

{% endmacro %}