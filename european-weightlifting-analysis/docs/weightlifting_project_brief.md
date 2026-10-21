# European Weightlifting Analysis Project Brief

## Business case

Lift & Lead is considering opening specialist weightlifting training centres. Its founders believe the growing popularity of CrossFit, which incorporates weightlifting techniques, may make this a good time to invest. The company wants to understand the sport and its athletes and initially asks the analyst to assess whether CrossFit's growth is increasing interest in weightlifting in Europe.

The analysis has two phases:

### Phase 1: Championship data for 2019 and 2020

The supplied data were collected from the European Weightlifting Championships pages for [2019](https://es.wikipedia.org/wiki/Campeonato_Europeo_de_Halterofilia_de_2019) and [2020](https://es.wikipedia.org/wiki/Campeonato_Europeo_de_Halterofilia_de_2020).

1. Import and explore both datasets.
2. Combine them and reshape the medal columns into event, year, gender, medal, and athlete fields.
3. Extract date, name, surname, country, weight category, snatch, clean and jerk, and total result.
4. Clean, type, and sort the data by gender, category, and medal.
5. Explore the results and answer:
   - How many medals of each type did each country win?
   - Which country had the most balanced medal success across female and male athletes?
   - Which country had the smallest gender difference in mean total weight lifted?

### Phase 2: Web scraping and expanded analysis for 2019–2024

Scrape championship results for 2021, 2022, 2023, and 2024 from the linked [2021](https://es.wikipedia.org/wiki/Campeonato_Europeo_de_Halterofilia_de_2021), [2022](https://es.wikipedia.org/wiki/Campeonato_Europeo_de_Halterofilia_de_2022), [2023](https://es.wikipedia.org/wiki/Campeonato_Europeo_de_Halterofilia_de_2023), and [2024](https://es.wikipedia.org/wiki/Campeonato_Europeo_de_Halterofilia_de_2024) pages. Integrate these results with Phase 1 and answer the same questions for the expanded period. The minimum requirement is to include at least one additional year.

## Deliverables

The notebook should document the data transformations, answer the questions with evidence, and include supporting tables or charts. A presentation summarizing the main results is optional.

## Source-year correction in the portfolio

The headings above preserve the original assignment. The supplied 2020-labelled file actually represents the postponed 2021 edition. The portfolio corrects its analytical year in memory and counts the edition once. See the [source check](source_validation.md).

## Scope note

Championship results can describe competitive performance and medal outcomes. They do not directly measure public interest in weightlifting, CrossFit participation, or demand for training centres; conclusions about those outcomes require separate evidence.
