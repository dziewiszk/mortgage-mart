select
    "LEI" as lei,
    try_cast("YEAR" as integer) as activity_year,
    "NAMET" as lender_name,
    "PLACET" as lender_city,
    "STATET" as lender_state_code,
    "RSSD" as rssd_id,
    "NAMEP" as parent_name,
    "RSSDP" as parent_rssd_id,
    "NAMEHH" as high_holder_name,
    "RSSDHH" as high_holder_rssd_id,
    try_cast("ASSETS" as double) as assets,
    "TYPE" as institution_type_code
from {{ source('raw', 'hmda_lenders') }}
where try_cast("YEAR" as integer) = 2025
