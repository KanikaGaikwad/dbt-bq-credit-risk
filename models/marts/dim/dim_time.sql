with calendar as (
    select 
        date_day
    from unnest(
        generate_date_array(
            date '2007-01-01',
            date '2018-12-31',
            interval 1 day
        )
    ) as date_day
)


select 
    date_day as date,
    extract(year from date_day) as year,
    extract(month from date_day) as month,
    format_date('%B', date_day) as month_name,
    extract(day from date_day) as day,
    extract(quarter from date_day) as quarter,
    format_date('%A', date_day) as weekday_name,
    extract(dayofweek from date_day) as weekday_number,
    format_date('%Y-%m', date_day) as year_month,
    format_date('%Y-%m-%d', date_day) as full_date
from calendar