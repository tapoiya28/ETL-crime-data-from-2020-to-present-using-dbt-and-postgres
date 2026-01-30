with crime_data as (
    select * from {{ ref('stg_crime_data') }}
)

select distinct(premis_code), premis_description
from crime_data