with base as (
    select * 
    from {{ ref('int_kpis2') }}
)

select loan_id,              -- primary key,
        client_id,           -- foreign key,
        loan_issue_date,     -- FK for dim_time
        loan_amount,
        loan_status,
        client_debt_to_income_proxy,
        monthly_capital_exposure_kpi,
        months_active,
        dti_band
from base