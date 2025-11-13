with base as (
    select distinct purpose
    from {{ ref('int_kpis2') }}
)

select
    purpose,
    case
        when purpose in ('credit_card', 'debt_consolidation') then 'Debt Management'
        when purpose in ('home_improvement', 'major_purchase') then 'Home & Lifestyle'
        when purpose in ('small_business', 'business') then 'Business'
        when purpose in ('medical', 'vacation', 'moving') then 'Personal'
        else 'Other'
    end as purpose_category
from base
