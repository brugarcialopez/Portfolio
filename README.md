# Data Analytics & Data Science Portfolio
## Bruno Garcia Lopez — Master's student in Data Analytics
This repository contains three end-to-end data projects, each built to answer a concrete business question — not just to demonstrate a technique in isolation. Every project follows the same approach: understand the problem, explore and clean the data, build a model or analysis fit for that specific purpose, and translate the result into a recommendation a non-technical stakeholder could act on

### Projects
| Project | Business Question | Key Result | Skills |
| :--- | :--- | :--- | :--- |
| **Churn Prediction — Telecom** | Which customers should a telecom company contact first to prevent revenue loss from churn? | Value-weighted targeting captures **2.01x** more at-risk revenue than random outreach (ROC-AUC 0.83, validated via nested cross-validation). | Python, scikit-learn, Logistic Regression, feature engineering, model evaluation under class imbalance |
| **Airbnb Madrid — Price Drivers** | What can a host actually do to justify a higher nightly price? | Physical amenities (TV, WiFi, heating) show a consistent **+14–16%** price effect; host-behavior metrics show none — a clear, actionable prioritization for hosts. | Python, pandas, hypothesis-driven EDA, statistical reasoning, data storytelling |
| **European Weightlifting Results — Data Pipeline** | Can a single cleaning pipeline reliably scale from a small, clean dataset to a larger, messier one collected independently? | Pipeline built and validated on 2 seasons scaled cleanly to 6 (2019–2024) via web scraping, with no changes to the core parsing logic. | Python, web scraping (`requests`, `pandas.read_html`), regex-based text parsing, reusable pipeline design |

### Tech stack
**Languages / core libraries:** Python, pandas, NumPy \
**Machine learning:** scikit-learn (pipelines, ColumnTransformer, LogisticRegressionCV, cross-validation) \
**Visualization:** Matplotlib, Seaborn, Plotly \
**Data acquisition:** requests, pandas.read_html (web scraping) \
**Environment:** Jupyter Notebook 

### Contact
**Email:** brugarcialopez@gmail.com\
**LinkedIn:** https://www.linkedin.com/in/brunogarlop/ \
**GitHub:** https://github.com/brugarcialopez
