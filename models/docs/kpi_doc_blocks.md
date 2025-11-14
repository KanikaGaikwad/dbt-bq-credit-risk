{% doc client_debt_to_income_proxy %}
Proxy for debt-to-income ratio, calculated as (installment * 12) / annual income.  
Used to assess financial burden and segment clients by risk.
{% enddoc %}

{% doc monthly_capital_exposure_kpi %}
Monthly capital exposure calculated as loan amount divided by term in months.  
Used to flag high-value clients for advisory services.
{% enddoc %}

{% doc months_active %}
Client tenure in months since loan issuance.  
Used to distinguish new vs. long-term clients in segmentation logic.
{% enddoc %}

{% doc dti_band %}
Categorical banding of debt-to-income proxy:  
- High Burden: DTI > 0.5  
- Medium Burden: 0.3 < DTI ≤ 0.5  
- Low Burden: DTI ≤ 0.3  
Used to simplify risk communication and support rule-based segmentation.
{% enddoc %}

{% doc high_value_flag %}
Flags clients with high monthly capital exposure (`monthly_capital_exposure_kpi >= 500`).  
Used to prioritize clients for high-touch advisory services.
{% enddoc %}
