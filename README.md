# Data Analytics Portfolio — Bruno García López

Five projects explore customer prioritization, property pricing, competition results, accommodation selection, and emergency-care activity. Each project README explains its question, evidence, analytical choices, and limits before linking to the underlying work.

## Explore the projects

| Project | What it demonstrates | Start here |
|---|---|---|
| Telecom churn | Customer exploration, logistic regression, evaluation, and value-weighted ranking | [Why prioritize these 500 customers?](telecom-churn-priorization/README.md) |
| Airbnb Madrid | Joining data, defining a study group, and interpreting descriptive price comparisons | [Which listing features are associated with price?](airbnb-madrid-pricing/README.md) |
| European weightlifting | Preparing semi-structured records, scraping tables, and comparing competition outcomes | [From medal tables to athlete records](european-weightlifting-analysis/README.md) |
| Accommodation selection | SQL constraints, joins, filters, aggregations, and a supported recommendation | [From client requirements to a shortlist](accommodation-selection-sql/README.md) |
| Emergency care | Dashboard questions, calculated fields, and selectable time indicators | [Understand workload and waiting-time measures](emergency-care-dashboard/README.md) · [Open dashboard](https://datastudio.google.com/s/qPny32nWdI4) |

The three Python project READMEs include visual evidence from their notebooks. SQL presents its candidate comparison directly, while emergency care links to the interactive dashboard and explains its indicator definitions. [Figure sources and checks](docs/FIGURE_SOURCES.md).

## Reviewing and running the work

Start with a project README, then follow its notebook, SQL, or dashboard link. Inspection and execution instructions are specific to each project. Raw inputs retain their original fields and values.

All three Python notebooks completed fresh-kernel runs, including weightlifting’s live scraping, with outputs and direct dependency versions recorded. Its source year and duplicate-edition issues are resolved. The complete SQL script also passed execution in a fresh MySQL 9.7.1 instance. Live dashboard verification remains open. [Setup and verification](docs/REPRODUCIBILITY.md).

## Background

Four projects originated at Nuclio Digital School, and telecom churn began as a personal project. Their original analytical work is preserved, with presentation improvements and explicitly approved corrections. Academic context and original briefs remain linked from the individual projects.
