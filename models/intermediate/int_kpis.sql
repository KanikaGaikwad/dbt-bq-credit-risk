with loans as (
    select *
    from {{ ref('stg_loan_risk') }}
)

select
    loan_id,
    term_months,
    loan_amount,
    annual_income,
    interest_rate_pct,
    debt_to_income_ratio,
    loan_status,
    loan_issue_date,
    last_payment_date,
    addr_state,
    purpose,

    -- KPI 1: Loan-to-Income ratio
    round(loan_amount / annual_income, 3) as loan_to_income_ratio,

    -- KPI 2: Monthly installment (approximation)
    round((loan_amount * (interest_rate_pct / 100)) / term_months, 2) as est_monthly_payment,

    -- KPI 3: Loan duration (in months)
    date_diff(last_payment_date, loan_issue_date, month) as months_active,

    -- KPI 4: Debt burden level
    case
        when debt_to_income_ratio > 40 then 'High Burden'
        when debt_to_income_ratio between 20 and 40 then 'Medium Burden'
        else 'Low Burden'
    end as dti_band

from loans
