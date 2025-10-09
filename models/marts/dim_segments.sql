with kpis as (
    select *
    from {{ ref('int_kpis')}}
)

select
    loan_id,
    addr_state,
    purpose,
    dti_band,
    case 
        when loan_to_income_ratio > 0.5 or dti_band = 'High Band' then 'High Risk'
        when loan_to_income_ratio between 0.3 and 0.5 or dti_band = "Medium Band" then "Medium Risk"
        else 'Low Risk'
    end as risk_category,
    est_monthly_payment,
    months_active,
    loan_status

from kpis