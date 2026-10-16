# Airbnb Madrid — Price Drivers Analysis

## Business Question
> **What can a host do to increase the nightly price of an apartment in Madrid: invest in physical amenities, or in host behavior and reputation?**

The project is framed as a small consulting case: a host with several Madrid listings asks how to optimize pricing. The vague question is scoped into a testable problem, 11 hypotheses are prioritized, and each one is checked against market data.

---

## Scope
- **Data:** 5 Parquet files (host, location, property, conditions, reviews) merged on listing `id`. **[add dataset source and license]**
- **Cleaning:** listings above €200/night were removed as non-representative outliers (prices reach €9,999), leaving 21,020 listings (median €65; half between €40 and €102).
- **Study set (≈9,000 listings):** entire apartments with 1–3 bedrooms and a kitchen.

---

## Key Results
Median nightly price, compared across groups (descriptive, no controls):

| Factor | Without | With | Difference |
|---|---|---|---|
| Wi-Fi | €70 (n=347) | €80 | +14.3% |
| TV | €69 (n=605) | €80 | +15.9% |
| Air conditioning | €70 (n=1,819) | €80 | +14.3% |
| Heating | €70 (n=460) | €80 | +14.3% |
| Superhost | €75.5 (n=6,850) | €85 (n=2,177) | +12.6% |

- **Physical amenities show the clearest association with price:** listings with TV, Wi-Fi, A/C or heating have a median price about €10 (14–16%) higher.
- **Host responsiveness and review scores show no meaningful relationship with price:** response rate (Spearman −0.01), communication score (0.07), check-in score (0.08), cleanliness score (0.14). Response time shows only a small difference (+€3, +3.9%, and the "within a day" group is the highest, not the fastest).
- **Cancellation policy** shows the largest gap (€80 flexible vs. €52 super strict 60, +54%), but the strictest categories have only 51–69 listings and the direction is probably reversed (price profile influencing the policy). Not used for recommendations.

**Takeaway:** among the factors tested, physical amenities are the strongest candidate lever for price, followed by Superhost status. Response and review metrics are not effective pricing levers, though they may still matter for guest satisfaction.

---

## Methodology
1. **Context:** market exploration of price, neighborhoods (66), property types (30) and room types (4).
2. **Problem definition:** scoped with four criteria (specific, scope, value, actionable).
3. **Hypotheses:** 11 hypotheses across property amenities, reviews, host behavior and booking conditions.
4. **Validation:** median comparisons with group sizes for binary and categorical factors, Spearman correlation for continuous scores (the scores are concentrated between 8 and 10), and violin and density plots.
5. **Recommendations:** prioritized by effect size and investment cost.

---

## Limitations
- **Observational and descriptive:** differences are not controlled for size (bedrooms, capacity), neighborhood or distance to the city center, so they are associations, not causal effects.
- **Prices are clustered in €10 steps,** so several amenities show the same +14.3% (€70 vs. €80); this is not a stable estimate.
- **Groups without an amenity are small and may differ systematically** from the rest (for example, incomplete or inactive listings).
- **Amenities overlap:** listings with one tend to have the others, so the effects cannot be added up.
- **The €200 cutoff is a business-logic choice,** and the analysis covers price, not revenue or occupancy.

## Next Steps
- Regression on log(price) controlling for bedrooms, capacity, neighborhood and distance to Puerta del Sol.
- Statistical tests with confidence intervals for each effect.
- Add occupancy or reviews-per-month to approximate revenue.

---

## Repository Structure
* `airbnb_madrid_price_drivers.ipynb`: full analysis, from context to recommendations.
* `data/`: Parquet files (host, location, property, conditions, reviews).
* `requirements.txt`: dependencies.

## How to Run
```bash
git clone <repo-url>
cd <repo-folder>
pip install -r requirements.txt
jupyter notebook airbnb_madrid_price_drivers.ipynb
```

## Tech Stack
`Python` | `pandas` | `numpy` | `seaborn` | `matplotlib`
