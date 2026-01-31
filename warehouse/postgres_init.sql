CREATE DATABASE crime_pipeline;
CREATE SCHEMA raw;
CREATE SCHEMA fact;
CREATE SCHEMA dim;

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