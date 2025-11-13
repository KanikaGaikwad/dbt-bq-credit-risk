with loans as (
    -- Reference from the cleaned staging model
    select *
    from {{ ref('stg_loan_risk')}}
)

select
    -- Primary keys and Core Dimensions
    loan_id,
    loan_issue_date,
    addr_state,
    purpose,

    -- Raw financial metrics
    loan_amount,
    annual_income,
    debt_to_income_ratio,

    -- Outcome variable (for ML or segmentation) 
    loan_status,

    -- Strategic KPI 1: Client Financial Burden Proxy
    -- Measure how leveraged the client is relative to their income
    Round(
        coalesce(safe_divide(loan_amount, annual_income),0),
        3
    ) as client_debt_to_income_proxy,

    -- Strategic KPI 2: Monthly Capital Exposure
    -- Estimates how much capital the firm earns monthly from this loan
    Round(
        coalesce(safe_divide((loan_amount*(interest_rate_pct/100)), term_months),0),
        2
    ) as monthly_capital_exposure_kpi,

    -- Strategic KPI 3: Client Tenure
    -- Duration of Loan activity in months
    Date_diff(last_payment_date, loan_issue_date, month) as months_active,

    -- Strategic KPI 4: Debt-to-Income Band
    case
        when debt_to_income_ratio >40 then 'High Burden'
        when debt_to_income_ratio between 20 and 40 then 'Medium Burden'
        else 'Low Burden'
    end as dti_band

from loans; 


-- with loans as (
--     -- Architectural Best Practice: Use ref() for dependency management
--     select *
--     from {{ ref('stg_loan_risk') }} 
-- )

-- select
--     -- Primary Keys and Core Dimensions (Keep)
--     loan_id,
--     loan_issue_date, 
--     addr_state, 
--     purpose,

--     -- Raw Metrics (Keep for downstream calculation/segmentation)
--     loan_amount,
--     annual_income,
--     debt_to_income_ratio,

--     -- Status/Outcome (Crucial for ML target variable)
--     loan_status, 

--     -- Strategic KPI 1: Client Financial Stability Proxy (Renamed)
--     -- Fixed logic for reliability.
--     round(
--         COALESCE(SAFE_DIVIDE(loan_amount, annual_income), 0),
--         3
--     ) as client_debt_to_income_proxy,  -- Renamed from loan_to_income_ratio

--     -- Strategic KPI 2: Firm's Capital Exposure (Renamed)
--     -- Robust calculation logic.
--     round(
--         COALESCE(SAFE_DIVIDE((loan_amount * (interest_rate_pct / 100)), term_months), 0),
--         2
--     ) as monthly_capital_exposure_kpi,

--     -- KPI 3: Duration/Time Series Metric
--     date_diff(last_payment_date, loan_issue_date, month) as months_active,

--     -- KPI 4: Derived Categorical Feature (ML input)
--     case
--         when debt_to_income_ratio > 40 then 'High Burden'
--         when debt_to_income_ratio between 20 and 40 then 'Medium Burden'
--         else 'Low Burden'
--     end as dti_band

-- from loans