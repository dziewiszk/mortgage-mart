import duckdb

con = duckdb.connect("dev.duckdb")
con.execute("create schema if not exists raw")

con.execute("""
    create or replace table raw.hmda_ohio as
    select * from read_csv_auto('data/state_OH.csv', all_varchar=true)
""")
con.execute("""
    create or replace table raw.mortgage_rates as
    select * from read_csv_auto('data/MORTGAGE30US.csv', all_varchar=true)
""")

print("hmda rows:", con.execute("select count(*) from raw.hmda_ohio").fetchone()[0])
print("rate rows:", con.execute("select count(*) from raw.mortgage_rates").fetchone()[0])