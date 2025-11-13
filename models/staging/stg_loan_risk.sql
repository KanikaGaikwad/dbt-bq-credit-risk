with base as (
    select *,
        dense_rank() over (
            partition by emp_title, CAST(annual_inc AS STRING), emp_length
            order by parse_date('%b-%Y', issue_d)
        ) as client_id
    from {{ source('raw_lending_club','credit_risk_raw') }}
)

select
    cast(id as STRING) as loan_id,
    -- Parse loan term from string to integer
    CAST(REPLACE(term, ' months', '') AS INT64) AS term_months,
    cast(int_rate as numeric) as interest_rate_pct,
    cast(revol_util as numeric) as revolving_util_pct,
    parse_date('%b-%Y', issue_d) as loan_issue_date,
    parse_date('%b-%Y', last_pymnt_d) as last_payment_date,
    CURRENT_DATE() AS record_created_at,
    cast(loan_amnt as BIGNUMERIC) as loan_amount,
    cast(annual_inc as BIGNUMERIC) as annual_income,
    cast(dti as numeric) as debt_to_income_ratio,
    emp_title as borrower_job_title,
    emp_length as employment_length,
    home_ownership as home_ownership_status,
    verification_status,
    purpose,
    application_type,
    addr_state,
    fico_range_low,
    fico_range_high,
    open_acc,
    delinq_2yrs,
    pub_rec as public_records,
    loan_status,
    client_id
from base
where id is not null
  and parse_date('%b-%Y', issue_d) is not null













-- select
--     cast(id as string) as loan_id,
--     cast(replace(term, ' months', '') as INT64) as term_months,

--     cast(int_rate as NUMERIC) as interest_rate_pct,
--     cast(revol_util as NUMERIC) as revolving_util_pct,

--     parse_date('%b-%Y', issue_d) as loan_issue_date,
--     parse_date('%b-%Y', last_pymnt_d) as last_payment_date,

--     cast(loan_amnt as BIGNUMERIC) as loan_amount,
--     cast(annual_inc as BIGNUMERIC) as annual_income,
--     cast(dti as NUMERIC) as debt_to_income_ratio,

--     loan_status,
--     purpose,
--     addr_state,

--     * except(id, term, int_rate, revol_util, issue_d, last_pymnt_d, loan_amnt, annual_inc, dti, loan_status, purpose, addr_state)

-- from `dbt-sandbox-project`.`raw_data`.`credit_risk_raw`

