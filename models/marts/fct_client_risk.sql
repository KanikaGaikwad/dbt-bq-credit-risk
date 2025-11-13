WITH kpis AS (
    SELECT * 
    FROM {{ ref('int_kpis2') }}
)

SELECT
    loan_id,
    loan_issue_date,
    addr_state,
    purpose,
    loan_status,
    client_debt_to_income_proxy,
    monthly_capital_exposure_kpi,
    months_active,
    dti_band,

    -- Risk Segment: combine dti band and tenure
    CASE
        WHEN dti_band = 'High Burden' AND months_active < 12 THEN 'High Risk - New'
        WHEN dti_band = 'High Burden' THEN 'High Risk - Long Term'
        WHEN dti_band = 'Medium Burden' THEN 'Medium Risk'
        ELSE 'Low Risk'
    END AS client_risk_segment,

    -- High Value Flag: Monthly exposure above $500
    CASE
        WHEN monthly_capital_exposure_kpi >= 500 THEN TRUE 
        ELSE FALSE
    END AS high_value_flag

FROM kpis










-- with client_kpis as (
--     -- Reference the clean, fixed intermediate model
--     select *
--     from {{ ref('int_kpis2')}}  
-- ),

-- -- Define the final segmentation logic
-- segmentation as (
--     select
--         loan_id,
--         -- Use the strategic KPIs for segmentation logic
--         case 
--             when client_debt_to_income_proxy > 0.5 or dti_band = 'High Burden' then 'High Instability Risk'
--             when client_debt_to_income_proxy between 0.3 and 0.5 or dti_band = 'Medium Burden' then 'Moderate Instability Risk'
--             else 'Low Instability Risk'
--         end as client_stability_segment
--     from client_kpis
-- )

-- select
--     -- Primary Key
--     k.loan_id,

--     -- Dimensional Keys (for joining to a dim_client/dim_geography)
--     k.addr_state, 
--     k.purpose,
--     k.dti_band, 

--     -- Segment Key (The core outcome of the analysis)
--     s.client_stability_segment,

--     -- Final Metrics/Measures (The Facts)
--     k.loan_status as service_outcome_status, -- Renamed for sophistication
--     k.client_debt_to_income_proxy,
--     k.monthly_capital_exposure_kpi,
--     k.months_active

-- from client_kpis k
-- inner join segmentation s on k.loan_id = s.loan_id
