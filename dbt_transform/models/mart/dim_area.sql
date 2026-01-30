with crime_data as (
    select * from {{ ref('stg_crime_data') }}
)

select distinct(area_code), area_name
from crime_data