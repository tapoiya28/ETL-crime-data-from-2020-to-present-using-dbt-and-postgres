with crime_data as (
    select * from {{ ref('stg_crime_data') }}
)

select 
    {{ dbt_utils.dbt_utils.generate_surrogate_key(area_code) }} as area_key,
    area_code,
    max(area_name) as area_name
from crime_data
where area_code is not null
group by area_code