with crime_data as (
    select * from {{ ref('stg_crime_data') }}
)

select distinct(case_status), case_status_description
from crime_data