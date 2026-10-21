# Championship Year and Source-Version Check

## Correct event year

The supplied CSV filename and its `Año` field say 2020. The championship was postponed to 2021, as recorded by the [International Weightlifting Federation on 31 August 2020](https://iwf.sport/2020/08/31/iwf-events-affected-covid-19-pandemic-iwf-competition-calendar-2020-update-2/). Its results belong to the [2021 championship](https://es.wikipedia.org/wiki/Campeonato_Europeo_de_Halterofilia_de_2021), held in Moscow on 3–11 April 2021.

The notebook loads the unchanged CSV, changes its analytical year to 2021, and stores it under the 2021 edition key. The combined stage skips the already represented 2021 edition when adding scraped tables. This avoids counting the same event twice.

The initial dataset has 120 medal records from 2019 and 2021. The combined dataset has 300 records from **2019, 2021, 2022, 2023, and 2024**, rather than 360 records representing six editions.

## Quantified overlap and retained version

Comparing gender, event/date label, medal, and athlete/result text after removing footnotes and normalizing whitespace gives **57 exact matches among 60 supplied medal records**. The three differing records all belong to the women's 59 kg event:

| Medal | Supplied CSV version | Current page version |
|---|---|---|
| Gold | Boyanka Kostova — 211 kg | Olga Tio — 210 kg |
| Silver | Olga Tio — 210 kg | Dora Tchakounté — 210 kg |
| Bronze | Dora Tchakounté — 210 kg | Alexandra Kozlova — 202 kg |

Both versions represent the same edition. The notebook retains the supplied historical version consistently in both stages, preserving the original records. The current page is not used to silently replace the three results. Rankings must therefore be described as results in the selected source version, rather than the latest official medal allocation. No explanation of the revision is asserted without separately checking the underlying decision.

## Re-execution

The corrected notebook completed a full run, including the original live scraping and parsing approach. It produces 10 distinct observed weight categories for each gender in both scopes, retaining `87`/`+87` and `109`/`+109` separately.

The combined medal table is led by Armenia (44), followed by Bulgaria, Turkey, and Ukraine with 28 each. Bulgaria has the most gold medals (15). These are descriptive counts from the retained source versions.
