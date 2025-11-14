# KPI Mapping: Wealth Risk KPI Warehouse

This document outlines the strategic mapping of engineered KPIs to core wealth development tracks. Each KPI was designed to support operational decision-making in financial coaching, capital planning, and client risk segmentation.

---

## 📊 KPI 1: `client_debt_to_income_proxy`
{% doc client_debt_to_income_proxy %}
- **Definition**: Ratio of monthly installment to annual income (proxy for DTI)
- **Formula**: `installment * 12 / annual_inc`
- **Track**: **Risk**
- **Business Use**: Identifies clients with high repayment burden relative to income; used to flag financial instability risk
{% enddoc %}
---

## 💰 KPI 2: `monthly_capital_exposure_kpi`
{% doc monthly_capital_exposure_kpi %}
- **Definition**: Monthly exposure based on loan amount and term
- **Formula**: `loan_amnt / term_months`
- **Track**: **Capital**
- **Business Use**: Helps assess the monthly capital at risk per client; used to flag high-value clients for advisory services
{% enddoc %}
---

## ⏳ KPI 3: `months_active`
{% doc months_active %}
- **Definition**: Tenure of the client since loan issuance
- **Formula**: `DATEDIFF(current_date, issue_d) / 30`
- **Track**: **Behavior**
- **Business Use**: Indicates client maturity; used in segmentation logic (e.g., distinguishing new vs. long-term high-risk clients)
{% enddoc %}
---

## 🧮 KPI 4: `dti_band`
{% doc dti_band %}
- **Definition**: Categorical banding of DTI proxy
- **Logic**:
  - High Burden: DTI > 0.5
  - Medium Burden: 0.3 < DTI ≤ 0.5
  - Low Burden: DTI ≤ 0.3
- **Track**: **Risk**
- **Business Use**: Simplifies risk communication and supports rule-based segmentation
{% enddoc %}
---

## 🧠 KPI 5: `client_risk_segment` (Derived)
{% doc client_risk_segment %}
- **Definition**: Combines DTI band and tenure to classify client risk
- **Logic**:
  - High Risk – New: High Burden + <12 months
  - High Risk – Long Term: High Burden + ≥12 months
  - Medium Risk: Medium Burden
  - Low Risk: Low Burden
- **Track**: **Risk + Behavior**
- **Business Use**: Enables targeted interventions for unstable or high-risk clients
{% enddoc %}
---

## 💎 KPI 6: `high_value_flag` (Derived)
{% doc high_value_flag%}
- **Definition**: Flags clients with high monthly capital exposure
- **Logic**: `monthly_capital_exposure_kpi >= 500`
- **Track**: **Capital**
- **Business Use**: Prioritizes clients for high-touch advisory services
{% enddoc %}
---

## 🧭 Summary Table

| KPI Name                        | Track(s)         | Purpose                                      |
|--------------------------------|------------------|----------------------------------------------|
| client_debt_to_income_proxy    | Risk             | Assess repayment burden                      |
| monthly_capital_exposure_kpi   | Capital          | Quantify monthly capital at risk             |
| months_active                  | Behavior         | Measure client tenure                        |
| dti_band                       | Risk             | Categorize clients by DTI level              |
| client_risk_segment            | Risk + Behavior  | Segment clients for risk-based interventions |
| high_value_flag                | Capital          | Flag clients for premium services            |

