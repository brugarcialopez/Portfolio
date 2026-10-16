# Churn Prediction & Retention Targeting — Telecom

## Business Question
> **Which 500 customers should a telecom company contact first to protect the most revenue from churn, and how much better is that than contacting 500 customers at random?**

Retaining a customer is cheaper than acquiring a new one, but outreach capacity is limited. Instead of only predicting who will churn, this project ranks customers by **expected revenue at risk** (churn probability × customer value), so the contact list protects the most revenue.

---

## Key Results
Evaluated on a held-out test set of 1,000 customers (14.1% churners):

| Metric | Result |
|---|---|
| At-risk revenue captured by contacting the top 500 (value-weighted) | **$8,392 of $9,207 (91%)** |
| Expected at-risk revenue captured by 500 random contacts | $4,169 |
| **Revenue lift vs. random outreach** | **2.01x** |
| Churners captured in the top 500 | 124 of 141 (random: ~70) |
| ROC-AUC (test / 5-fold CV) | 0.829 / 0.829 ± 0.022 |
| PR-AUC vs. naive baseline | 0.469 vs. 0.141 (>3x) |
| Recall / precision on churn at a 0.5 cutoff | 0.70 / 0.34 |

**Main churn drivers:** having an international plan, not having a voice mail plan (~16% churn vs. ~8% with one), more customer service calls (churn jumps from ~11% to ~44% from the 4th call), and higher daytime charges.

---

## Methodology
1. **Data:** 5,000 customers, 19 features. No missing values and no duplicate customers were found.
2. **Feature selection:** dropped identifiers (`phone_number`, `area_code`), `state` (~98 customers per state; including it did not improve ROC-AUC: 0.826 vs. 0.829) and the `minutes` columns (correlation ≈ 1.0 with the matching `charge` columns, which would add unstable coefficients).
3. **Preprocessing:** one-hot encoding of plan variables and standard scaling, wrapped in a scikit-learn `Pipeline` together with the model, so no information from the validation folds leaks into training.
4. **Model:** Logistic Regression with `class_weight='balanced'`. The regularization strength `C` is tuned with `LogisticRegressionCV` optimizing **average precision** (accuracy is misleading at 14% churn). This tuning runs inside a 5-fold stratified cross-validation, so the performance estimate is not biased by hyperparameter selection.
5. **Customer prioritization:** customers are ranked by `churn probability × monthly charges` (day + evening + night + international) and the top 500 are compared with the expected result of contacting 500 customers at random.

---

## Limitations
- **Customer value is a proxy:** monthly usage charges, not margin or lifetime value.
- **The top 500 is half of the test sample.** The maximum possible lift under this budget is ≈2.2x, so 2.01x is close to the ceiling; results at smaller contact budgets are not evaluated yet.
- **Probabilities are used for ranking only.** `class_weight='balanced'` shifts predicted probabilities, so they are not calibrated estimates of churn risk.
- No explicit cost matrix for false positives vs. false negatives; the precision/recall trade-off is argued qualitatively.
- One dataset and a single train/test split for the business-value calculation.

## Next Steps
- Calibrate probabilities and compare the ranking with the current model.
- Plot captured revenue as a function of contact budget (5%, 10%, 20%, …).
- Replace the revenue proxy with margin/CLV and add contact costs.

---

## Repository Structure
* `churn_business_case.ipynb`: EDA, modeling, cross-validation and business-value calculation.
* `functions.py`: helper functions for data exploration.
* `data/`: dataset (`churn_all.csv`). Source: **[add dataset origin and license]**.
* `requirements.txt`: dependencies.

## How to Run
```bash
git clone <repo-url>
cd <repo-folder>
pip install -r requirements.txt
jupyter notebook churn_business_case.ipynb
```

## Tech Stack
`Python` | `pandas` | `numpy` | `scikit-learn` | `seaborn` | `matplotlib` | `missingno`
