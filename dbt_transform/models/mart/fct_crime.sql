select
    crime.report_id,
    -- report info
    crime.report_code,
    crime.report_date,
    crime.occur_date,
    crime.occur_time,

    -- area info
    crime.area_code,
    area.area_name,
    crime.reporting_district_number,

    -- category crime
    crime.crime_part,
    {{ get_crime_serverity('crime.crime_part') }} as crime_serverity,
    crime.lapd_crime_code,
    lapd.lapd_crime_code_description,
    crime.mo_codes,

    -- victim info
    crime.victim_age,
    {{ get_age_group('crime.victim_age') }} as age_group,
    {{ get_gender('crime.victim_gender') }} as victim_gender,
    crime.victim_descent,
    d.description,
    
    -- case detail
    crime.premis_code,
    premis.premis_description,

    crime.weapon_code,
    weapon.weapon_description,

    crime.case_status,
    status.case_status_description,

    crime.primary_crime_code,
    crime.secondary_crime_code_1,
    crime.secondary_crime_code_2,
    crime.secondary_crime_code_3,

    crime.address,
    crime.cross_street,
    crime.latitude,
    crime.longitude

from {{ ref('int_cleaned_and_enrich') }} as crime
left join {{ ref('dim_area') }} as area
    on crime.area_code = area.area_code
left join  {{ ref('dim_lapd_crime') }} as lapd
    on crime.lapd_crime_code = lapd.lapd_crime_code
left join {{ ref('dim_premis') }} as premis
    on crime.premis_code = premis.premis_code
left join {{ ref('dim_status') }} as status
    on crime.case_status = status.case_status
left join {{ ref('dim_weapon') }} as weapon
    on crime.weapon_code = weapon.weapon_code
left join {{ ref('descent_lookup') }} d
    on crime.victim_descent = d.code