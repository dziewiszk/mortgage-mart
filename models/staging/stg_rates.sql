select
    cast(observation_date as date) as observation_date,
    try_cast("MORTGAGE30US" as double) as rate_30yr_fixed_pct
from {{ source('raw', 'mortgage_rates') }}
where try_cast("MORTGAGE30US" as double) is not null
