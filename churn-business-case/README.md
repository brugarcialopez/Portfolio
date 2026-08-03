# Churn Prediction & Retention Optimization — Telecom

## Business Question
> **Which customers should a telecom company contact first to prevent revenue loss from churn, and how can we optimize outreach under limited capacity?**

Customer acquisition in telecom is significantly more expensive than retention. Rather than predicting churn in isolation, this project addresses the financial trade-off between **unnecessary retention spending** (False Positives) and **lost customer lifetime value** (False Negatives) under severe class imbalance.

---

## Key Results
* **2.01x Revenue Capture:** Value-weighted targeting captures **2.01x more at-risk revenue** compared to standard random outreach strategies.
* **Model Performance:** Achieved an **ROC-AUC of 0.83** (validated using Nested Cross-Validation to prevent data leakage and hyperparameter overfitting).
* **Actionable Segmentation:** Established a risk-tiered threshold that prioritizes high-LTV customers who show early churn indicators.

---

## Project Architecture & Methodology
1. **Data Cleaning & Preprocessing:** Handled missing values, encoded categorical demographic/contract features, and scaled numerical attributes.
2. **Feature Engineering:** Developed composite indicators reflecting customer tenure stability, contract type risks, and monthly spend variations.
3. **Imbalance Handling & Validation:** Evaluated performance under class imbalance using `StratifiedKFold` and Precision-Recall metrics alongside ROC-AUC.
4. **Model Architecture:** Logistic Regression with probability calibration to align outputs directly with expected monetary loss.

---

## File Structure
* `churn_business_case.ipynb`: Main analysis, model training, cross-validation, and business value calculations.
* `functions.py`: Reusable custom functions for data transformation, metric evaluation, and plotting.
* `data/`: Raw and processed dataset files.

---

## Tech Stack
`Python` | `scikit-learn` | `pandas` | `numpy` | `seaborn` | `matplotlib`
