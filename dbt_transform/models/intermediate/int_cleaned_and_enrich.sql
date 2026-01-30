with crime_data as (
    SELECT * FROM {{ ref('stg_crime_data') }}
), clean_and_enrich as (
    select 
        {{ dbt_utils.generate_surrogate_key(
            ['report_code', 'report_date', 'occur_date', 'occur_time', 'latitude', 'longitude']
            ) 
        }} as report_id,

        -- report info
        report_code,
        report_date,
        occur_date,
        make_time(occur_time / 100, occur_time % 100, 0) as occur_time,

        -- area info
        area_code,
        reporting_district_number,
    
        -- category crime
        crime_part,
        lapd_crime_code,
        mo_codes,

        -- victim info
        victim_age,
        victim_gender,
        victim_descent,
        
        -- case detail
        premis_code,
        weapon_code,
        case_status,

        primary_crime_code,
        secondary_crime_code_1,
        secondary_crime_code_2,
        secondary_crime_code_3,

        address,
        cross_street,
        latitude,
        longitude,

        row_number() over (
            partition by report_code, report_date, occur_date, occur_time, latitude, longitude
            order by occur_date, occur_time
        ) as rn

    from crime_data
)

select * from clean_and_enrich
where rn = 1