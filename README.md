# Wealth Analytics Architecture

## 🚀 Project Overview
This project simulates an enterprise-grade data architecture for wealth development services. It uses Lending Club data (2.5M+ records) to model financial KPIs such as risk, exposure, and tenure—critical for AI-driven decision-making in investment and advisory platforms.

## 🧱 Architecture
- **ELT Pipeline**: Built using dbt for governed transformations
- **Feature Store**: Final mart table with strategic KPIs
- **Distributed Processing**: PySpark for clustering and scale
- **Orchestration**: Airflow/Snowpark for automated deployment

## 🧠 Business Alignment
The architecture supports four strategic tracks:
- **Enterprise Builder**: Behavioral segmentation for acquisition targeting
- **Strategic Investor**: Risk-adjusted deal scoring
- **Portfolio Expansion**: Sector/geography diversification modeling
- **Visionary Legacy Planner**: Tenure and lifecycle analytics for wealth transfer

## 🛠️ Technologies Used
- dbt (data transformation and testing)
- PySpark (distributed clustering)
- BigQuery + GCS (data storage and movement)
- Airflow / Snowpark (orchestration)
- SQL, Jinja, YAML

## 📊 KPIs Engineered
- Debt-to-Income Proxy
- Monthly Capital Exposure
- Client Tenure (Account Age)
- Behavioral Segment Score

See [`docs/kpi_mapping.md`](docs/kpi_mapping.md) for full mapping to business tracks.

## 📈 Next Steps
- Finalize orchestration with Airflow/Snowpark
- Normalize schema for multi-source ingestion
- Extend dbt models for CRM and financial system simulation
- Build dashboards and ML models for investor segmentation

## 📂 Repo Structure
See folder layout for dbt models, orchestration scripts, PySpark jobs, and documentation.

## 🙋 About Me
I'm a Project Manager transitioning into data architecture and analytics. This project reflects my initiative to build scalable, governed, and business-aligned data systems.
