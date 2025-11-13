with base as (
    select * 
    from {{ ref('int_kpis2') }}
)

select distinct
    client_id,
    borrower_job_title,
    employment_length,
    home_ownership_status,
    verification_status,
    addr_state,
    annual_income,
    debt_to_income_ratio
from base
where client_id is not null