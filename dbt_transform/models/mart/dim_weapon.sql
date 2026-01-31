with crime_data as (
    select * from {{ ref('stg_crime_data') }}
)

select
    {{ dbt_utils.dbt_utils.generate_surrogate_key(weapon_code) }} as weapon_key,
    weapon_code,
    max(weapon_description) as weapon_description
from crime_data
where weapon_code is not null
group by weapon_code