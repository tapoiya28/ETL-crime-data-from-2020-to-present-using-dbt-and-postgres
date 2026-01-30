with crime_data as (
    select * from {{ ref('stg_crime_data') }}
)

select distinct(lapd_crime_code), lapd_crime_code_description
from crime_data