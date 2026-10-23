select
    rowid as source_row_id,
    cast(activity_year as integer) as activity_year,
    lei,
    "derived_msa-md" as msa_md_code,
    state_code,
    county_code,
    census_tract,
    cast(action_taken as integer) as action_taken_code,
    case cast(action_taken as integer)
        when 1 then 'Originated'
        when 2 then 'Approved, not accepted'
        when 3 then 'Denied'
        when 4 then 'Withdrawn'
        when 5 then 'File closed incomplete'
        when 6 then 'Purchased loan'
        when 7 then 'Preapproval denied'
        when 8 then 'Preapproval approved, not accepted'
    end as action_taken_desc,
    loan_type,
    loan_purpose,
    lien_status,
    occupancy_type,
    try_cast(loan_amount as double) as loan_amount,
    try_cast(interest_rate as double) as interest_rate,
    try_cast(rate_spread as double) as rate_spread,
    try_cast(loan_term as integer) as loan_term_months,
    try_cast(property_value as double) as property_value,
    try_cast(income as double) as income_thousands,
    debt_to_income_ratio,
    "denial_reason-1" as denial_reason_1
from {{ source('raw', 'hmda_ohio') }}