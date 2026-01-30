with crime_data as (
    select * from {{ ref('stg_crime_data') }}
)

select distinct(weapon_code), weapon_description
from crime_data