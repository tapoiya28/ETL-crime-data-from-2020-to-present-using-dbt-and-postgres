select 
    CAST("DR_NO" AS BIGINT) AS report_code,
    CAST("Date Rptd" AS DATE) AS report_date,
    CAST("DATE OCC" AS DATE) AS occur_date,
    CAST("TIME OCC" AS INTEGER) AS occur_time,

    CAST("AREA" AS SMALLINT) AS area_code,
    LOWER(TRIM(CAST("AREA NAME" AS TEXT))) AS area_name,

    CAST("Rpt Dist No" AS INTEGER) AS reporting_district_number,

    CAST("Part 1-2" AS SMALLINT) AS crime_part,
    CAST("Crm Cd" AS INTEGER) AS lapd_crime_code,
    CAST("Crm Cd Desc" AS TEXT) AS lapd_crime_code_description,
    CAST("Mocodes" AS TEXT) AS mo_codes,

    CAST("Vict Age" AS SMALLINT) AS victim_age,
    CAST("Vict Sex" AS CHAR) AS victim_gender,
    CAST("Vict Descent" AS CHAR) AS victim_descent,

    COALESCE(CAST("Premis Cd" AS INTEGER), 0) AS premis_code,
    COALESCE(CAST("Premis Desc" AS TEXT), 'Unknown') AS premis_description,

    COALESCE(CAST("Weapon Used Cd" AS INTEGER), 0) AS weapon_code,
    COALESCE(CAST("Weapon Desc" AS TEXT), 'Unknown') AS weapon_description,

    CAST("Status" AS TEXT) AS case_status,
    CAST("Status Desc" AS TEXT) AS  case_status_description,

    CAST("Crm Cd 1" AS INTEGER) AS primary_crime_code,
    CAST("Crm Cd 2" AS INTEGER) AS secondary_crime_code_1,
    CAST("Crm Cd 3" AS INTEGER) AS secondary_crime_code_2,
    CAST("Crm Cd 4" AS INTEGER) AS secondary_crime_code_3,

    CAST("LOCATION" AS TEXT) AS address,
    CAST("Cross Street" AS TEXT) AS cross_street,
    CAST("LAT" AS NUMERIC) AS latitude,
    CAST("LON" AS NUMERIC) AS longitude
from {{ source('raw_data', 'crime_data') }}

-- enrich area