select
    lei,
    lender_name,
    lender_city,
    lender_state_code,
    parent_name,
    parent_rssd_id,
    high_holder_name,
    assets,
    institution_type_code
from {{ ref('stg_lenders') }}
