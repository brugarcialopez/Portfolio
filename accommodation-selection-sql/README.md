# Accommodation Selection: Turning Client Requirements into a SQL Shortlist

**Which property best meets the requirements of a group of eight travelling in Spain?** This case study translates the client's requirements into SQL filters, joins four tables, and compares the eligible properties before recommending one.

[Explore the SQL script](accommodation-selection.sql) · [Back to the portfolio](../README.md)

## Recommendation and supporting comparison

**Dúplex Las Rocas (`ALOJ015`)** is the recommended property. All three candidates meet the required filters; the recommendation is based on the differences remaining within that shortlist.

| Property | Nightly price | Area | Bedrooms | Bathrooms | Property score / 5 |
|---|---:|---:|---:|---:|---:|
| Ático del Sol — `ALOJ010` | €1,750 | 88 m² | 3 | 3 | 4.8 |
| **Dúplex Las Rocas — `ALOJ015`** | **€1,800** | **120 m²** | **4** | **3** | **4.9** |
| Piso Parque Central — `ALOJ018` | €1,900 | 100 m² | 4 | 2 | 4.7 |

Dúplex Las Rocas offers the most floor space and the highest property score. It matches the alternatives' best bedroom and bathroom counts. Ático del Sol is €50 cheaper and has a higher agency score (4.9 versus 4.7); the original recommendation prioritizes space and facilities for the group over those advantages.

## From requirements to selection

The combined query requires every condition to hold:

- Spain; terrace and air conditioning; no swimming pool.
- A living room, more than one bathroom, and at least 80 m².
- At least 1 km from a metro station and 2 km from the city centre.
- A nightly price of €1,500–€2,000 inclusive, with a 25% deposit.
- A property score above 4.5 and an agency score above 4.

Individual queries make each condition inspectable. The final query joins the tables on the accommodation code and applies all requirements together. The candidate comparison then supports the recommendation, rather than treating the first matching row as the answer.

## Data model and SQL evidence

The supplied dataset contains four tables with 20 records each. `ALOJAMIENTO` describes facilities, rooms, and floor area; `UBICACION` holds location and distances; `PRECIO` holds price and deposit information; and `PUNTUACION` holds property and agency scores. They share `CODIGO_ALOJAMIENTO`, which is defined as a primary key in each table, with foreign keys linking the supporting tables to the accommodation table.

The script demonstrates MySQL table creation and constraints, inserts, joins, subqueries, filters, conditional aggregation, and grouped summaries. Additional queries examine property sizes, facilities, countries, average prices, and top-scoring agencies.

## Data-quality observation and limitations

The source assignment expects four eligible properties, but the supplied records and stated filters produce **three**. The selection was checked against the four CSV tables without relaxing a requirement to force another match. The SQL logic is preserved.

This is a small educational dataset and a case-study recommendation, not a current market search. Results depend on the provided records and requirements. Upstream data provenance and licensing are not documented beyond the academic materials.

## Inspect or run

The [SQL script](accommodation-selection.sql) contains schema creation, input records, the selection queries, and the written recommendation. The unchanged CSV files are in `datos/`; the [English brief](docs/sql_project_brief.md) includes a data dictionary.

Use MySQL in an environment where the script can create `ProyectoFinal_SQL`. Review that database name before execution. The embedded `INSERT` statements load the data, so a separate CSV import is unnecessary for that route. The complete, unchanged script ran without errors in a fresh, isolated MySQL 9.7.1 instance on 21 October 2026. Each of the four tables loaded 20 records, and the combined shortlist returned ALOJ010, ALOJ015, and ALOJ018. The temporary server was shut down after verification.

## Background

Adapted from the original Nuclio Digital School SQL project, retaining the requirements, queries, and recommendation.
