from pathlib import Path

import pandas as pd
import pyarrow as pa
import pyarrow.parquet as pq

from sqlalchemy import create_engine

DTYPE_MAP = {
    "DR_NO": "Int64",
    "Date Rptd": "string",
    "DATE OCC": "string",
    "TIME OCC": "Int64",
    "AREA": "Int64",
    "AREA NAME": "string",
    "Rpt Dist No": "Int64",
    "Part 1-2": "Int64",
    "Crm Cd": "Int64",
    "Crm Cd Desc": "string",
    "Mocodes": "string",
    "Vict Age": "Int64",
    "Vict Sex": "string",
    "Vict Descent": "string",
    "Premis Cd": "Int64",
    "Premis Desc": "string",
    "Weapon Used Cd": "float64",
    "Weapon Desc": "string",
    "Status": "string",
    "Status Desc": "string",
    "Crm Cd 1": "float64",
    "Crm Cd 2": "float64",
    "Crm Cd 3": "float64",
    "Crm Cd 4": "float64",
    "LOCATION": "string",
    "Cross Street": "string",
    "LAT": "float64",
    "LON": "float64",
}

engine = create_engine("postgresql://root:root@localhost:5433/crime_pipeline")

def ingest_data(filename: str):
    try:
        df = pd.read_csv(
            filename,
            dtype=DTYPE_MAP,
            iterator=True,
            chunksize=100_000,
        )

        for i, chunk in enumerate(df):
            chunk.to_sql(
                "crime_data", # table name
                engine, # connection
                if_exists="append", # append to existing table
                index=False, # don't write index
            )
    except Exception as e:
        print(e)
    finally:
        engine.dispose()

if __name__ == "__main__":
    src_file = "data/Crime_Data_from_2020_to_Present.csv"
    ingest_data(src_file)
        

