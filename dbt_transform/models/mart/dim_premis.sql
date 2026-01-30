with crime_data as (
    select * from {{ ref('stg_crime_data') }}
)

select 
    premis_code
    max(premis_description) as premis_description
from crime_data
where premis_description is not null
group by premis_description