select
    cast(id as string) as loan_id,
    cast(replace(term, ' months', '') as INT64) as term_months,

    cast(int_rate as NUMERIC) as interest_rate_pct,
    cast(revol_util as NUMERIC) as revolving_util_pct,

    parse_date('%b-%Y', issue_d) as loan_issue_date,
    parse_date('%b-%Y', last_pymnt_d) as last_payment_date,

    cast(loan_amnt as BIGNUMERIC) as loan_amount,
    cast(annual_inc as BIGNUMERIC) as annual_income,
    cast(dti as NUMERIC) as debt_to_income_ratio,

    loan_status,
    purpose,
    addr_state,

    * except(id, term, int_rate, revol_util, issue_d, last_pymnt_d, loan_amnt, annual_inc, dti, loan_status, purpose, addr_state)

from `dbt-sandbox-project`.`raw_data`.`credit_risk_raw`

