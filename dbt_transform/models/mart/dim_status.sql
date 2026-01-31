with crime_data as (
    select * from {{ ref('stg_crime_data') }}
)

select 
    {{ dbt_utils.dbt_utils.generate_surrogate_key(case_status) }} as case_status_key,
    case_status,
    max(case_status_description) as case_status_description
from crime_data
where case_status is not null
group by case_status