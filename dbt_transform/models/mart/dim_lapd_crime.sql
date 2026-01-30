with crime_data as (
    select * from {{ ref('stg_crime_data') }}
)

select 
    lapd_crime_code
    max(lapd_crime_code_description) as lapd_crime_code_description
from crime_data
where lapd_crime_code is not null
group by lapd_crime_code