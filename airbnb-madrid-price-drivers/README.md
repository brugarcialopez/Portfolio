# Airbnb Madrid — Price Drivers & Revenue Optimization

## Business Question
> **What physical amenities or hosting behaviors actually drive higher nightly prices in Madrid's short-term rental market?**

When launching or managing an Airbnb, hosts face a critical investment decision: Should they invest capital in physical upgrades (like TVs, AC, or premium amenities) or invest time in host-behavior metrics (such as Superhost status or fast response rates)? This project identifies the true statistical drivers of listing prices.

---

## Key Results
* **Physical Amenities Matter Most:** Installing key physical amenities (TV, Wi-Fi, Heating, AC) yields a consistent **+14% to +16% price premium** per night.
* **Host Behavior Has Minimal Price Impact:** Badges such as *Superhost* status or instantaneous response times showed **no statistically significant effect** on nightly listing prices.
* **Strategic Takeaway:** Clear prioritization framework for hosts — allocate capital toward property upgrades rather than spending effort chasing operational badges for pricing power.

---

## Project Architecture & Methodology
1. **Hypothesis-Driven EDA:** Formulated specific business hypotheses regarding price distributions across Madrid neighborhoods and amenity presence.
2. **Data Wrangling:** Cleaned unstructured text fields, parsed nested amenity lists, and handled price outliers.
3. **Statistical Reasoning:** Applied log-transformed price analysis, hypothesis testing, and multi-variable impact isolation to avoid spurious correlations.
4. **Data Storytelling:** Visualized key findings using Seaborn/Matplotlib for intuitive stakeholder interpretation.

---

## File Structure
* `airbnb_madrid_price_drivers.ipynb`: Complete exploratory analysis, statistical testing, and visualization pipeline.
* `data/`: Madrid Airbnb listing dataset.

---

## Tech Stack
`Python` | `pandas` | `numpy` | `seaborn` | `matplotlib` | `scipy`
