CREATE TABLE IF NOT EXISTS staging.stg_crime_data (
    report_code BIGINT,
    report_date DATE,
    occur_date DATE,
    occur_time INTEGER,
    area_code SMALLINT,
    area_name TEXT,
    reporting_district_number INTEGER,
    crime_part SMALLINT,
    lapd_crime_code INTEGER,
    lapd_crime_code_description TEXT,
    mo_codes TEXT,
    victim_age SMALLINT,
    victim_gender CHAR,
    victim_descent CHAR,
    premis_code INTEGER,
    premis_description TEXT,
    weapon_code INTEGER,
    weapon_description TEXT,
    case_status TEXT,
    case_status_description TEXT,
    primary_crime_code INTEGER,
    secondary_crime_code_1 INTEGER,
    secondary_crime_code_2 INTEGER,
    secondary_crime_code_3 INTEGER,
    address TEXT,
    cross_street TEXT,
    latitude NUMERIC,
    longitude NUMERIC
)

CREATE TABLE IF NOT EXISTS dim.area (
    area_key TEXT PRIMARY KEY,
    area_code INTEGER,
    area_name TEXT
);
CREATE TABLE IF NOT EXISTS dim.weapon (
    weapon_key TEXT PRIMARY KEY,
    weapon_code INTEGER,
    weapon_description TEXT
);
CREATE TABLE IF NOT EXISTS dim.premis (
    premis_key TEXT PRIMARY KEY,
    premis_code INTEGER,
    premis_description TEXT
);
CREATE TABLE IF NOT EXISTS dim.lapd (
    lapd_key TEXT PRIMARY KEY,
    lapd_crime_code INTEGER,
    lapd_crime_code_description TEXT
);
CREATE TABLE IF NOT EXISTS dim.status (
    case_status_key TEXT PRIMARY KEY,
    case_status CHAR(2),
    case_status_description TEXT
);