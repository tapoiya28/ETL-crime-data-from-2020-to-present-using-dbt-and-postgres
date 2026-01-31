with crime_data as (
    select * from {{ ref('stg_crime_data') }}
)

select 
    {{ dbt_utils.dbt_utils.generate_surrogate_key(lapd_crime_code) }} as lapd_crime_key,    
    lapd_crime_code,
    max(lapd_crime_code_description) as lapd_crime_code_description
from crime_data
where lapd_crime_code is not null
group by lapd_crime_code