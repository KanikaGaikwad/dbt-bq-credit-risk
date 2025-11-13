# Wealth Risk KPI Warehouse

This project simulates a client segmentation pipeline inspired by real-world wealth development services. It was designed to reflect the analytics needs of nonprofit financial programs, using dbt and BigQuery to model strategic KPIs and segment clients by financial burden, tenure, and capital exposure.

## 📊 Project Goals

- Normalize raw loan data into a dimensional warehouse
- Engineer strategic KPIs for client risk and value segmentation
- Simulate enterprise-ready modeling using dbt best practices

## 🏗️ Architecture

- **Source:** Public Lending Club loan data
- **Warehouse:** BigQuery
- **Transformation:** dbt (modular, documented, tested)

## 🧱 Key Models

| Model | Type | Description |
|-------|------|-------------|
| `int_kpis2` | Intermediate | Enriches raw data with KPIs and client attributes |
| `dim_client` | Dimension | Contains client-level attributes for segmentation |
| `dim_time` | Dimension | Calendar spine for time-based joins |
| `fct_client_risk` | Fact | Segments clients by risk and value using KPI logic |

## 🧠 Segmentation Logic

- **Risk Segment**: Based on `dti_band` and `months_active`
- **High Value Flag**: Clients with monthly capital exposure ≥ $500

## 🧪 Testing & Documentation

- All models tested for `not_null`, `unique`, and `relationships`
- Schema documentation available via `dbt docs`

## 🚀 Tools Used

- dbt Core
- BigQuery
- GitHub (version control)
