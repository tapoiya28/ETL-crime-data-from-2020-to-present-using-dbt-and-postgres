with crime_data as (
    select * from {{ ref('stg_crime_data') }}
)

select 
    weapon_code
    max(weapon_description) as weapon_description
from crime_data
where weapon_code is not null
group by weapon_code