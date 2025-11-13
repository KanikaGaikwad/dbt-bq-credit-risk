with base as (
    select *,
        dense_rank() over (
            partition by emp_title, annual_inc, emp_length
            order by loan_issue_date
        ) as client_id
    from {{ source('raw_lending_club','credit_risk_raw') }}
)
select * from base