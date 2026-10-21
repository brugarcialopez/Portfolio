# Figure Sources and Verification

These figures support the project READMEs. They come from the original notebook analyses; no new analytical method or dataset was introduced. Source positions below use zero-based cell and image indexes in the current notebooks.

## Telecom churn

- **Figure:** [model ranking curves](../telecom-churn-priorization/assets/model-ranking-curves.png).
- **Source:** [churn notebook](../telecom-churn-priorization/telecom-churn-priorization.ipynb), evaluation cell 48, image 1.
- **Handling:** exact PNG export from the output of the successful full notebook run on 21 October 2026. The model and its evaluation method are unchanged.
- **Meaning:** ROC and precision–recall curves for held-out model ranking. The saved metrics are ROC-AUC 0.829 and average precision 0.469; the churn-rate baseline is 0.141. These are not calibration or retention-impact results.

## Airbnb Madrid

- **Figure:** [listing price comparisons](../airbnb-madrid-pricing/assets/listing-price-comparisons.png).
- **Source:** [Airbnb notebook](../airbnb-madrid-pricing/airbnb-madrid-pricing-analysis.ipynb), Wi-Fi violin panel in cell 34 and Superhost violin panel in cell 45.
- **Handling:** re-rendered using the original five-table join, €200 price filter, and apartment/room/bedroom/kitchen study filters. The same violin comparisons are combined into two panels with English labels and a compact layout. The default density smoothing is retained, including outlines that can extend outside the observed price range.
- **Checks:** 9,027 study rows. Wi-Fi medians €70/€80 for groups of 347/8,680; other-host/Superhost medians €75.50/€85 for groups of 6,850/2,177. These reproduce the notebook's reported comparisons.

## European weightlifting

- **Figure:** [supplied-file medal counts](../european-weightlifting-analysis/assets/supplied-file-medal-counts.png).
- **Source:** [weightlifting notebook](../european-weightlifting-analysis/european-weightlifting-analysis.ipynb), country medal count comparison in cell 70.
- **Handling:** reran the original supplied-CSV preparation and existing extraction helpers, then the same `groupby('Pais')['Medalla'].count()` aggregation. The original descending country order is retained. Bars are horizontal and display labels are English for readability; source country values are unchanged.
- **Checks:** 120 records; leading counts Russia 20, Armenia 14, Bulgaria 10. No scraped-source or category-dependent chart is used in the README.
- **Scope limit:** the inputs retain their 2019/2020 source labels. The source-year check identifies the second supplied file as the postponed 2021 edition. The count chart uses the supplied historical 2019/2021 results; three 2021 medal records differ from the current page, as documented in the project source check.

## Scope of these checks

During the initial figure export, only the required preparation and comparisons were executed. On 21 October 2026, all three notebooks subsequently completed full fresh-kernel executions; see [verification](REPRODUCIBILITY.md). The untouched preservation copy remains available locally. The subsequent batch refreshed notebook outputs, corrected the weightlifting analytical year and duplicate edition, and clarified approved interpretations. Raw datasets and SQL statements remain unchanged. The complete unchanged SQL script subsequently passed execution in a fresh MySQL 9.7.1 instance on 21 October 2026; live dashboard inspection remains unverified.

SQL's README comparison was independently checked by joining the four supplied CSV tables on the unique accommodation code and reapplying the existing filters. Emergency care uses a diagram of the documented timestamp definitions, not a purported dashboard screenshot or an unverified numerical result.
