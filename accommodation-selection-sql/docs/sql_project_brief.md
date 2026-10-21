# SQL Project Brief

## Travel accommodation selection

You work as a data analyst in the VIP customer team of a travel agency. A well-known Spanish singer is planning a summer holiday in Spain in late July 2025, ahead of a September tour. The group consists of the client and seven family members. The client has no preferred destination but wants to rest, enjoy sunny weather, and avoid unwanted attention.

Your task is to identify a suitable property from the supplied accommodation data and recommend one option.

## Part One: Filter and recommend properties

Write one query for each requirement, then combine all requirements into one query:

1. The property must have a terrace and air conditioning, and must not have a swimming pool.
2. Exclude studios without a living room and properties with only one bathroom.
3. Require a floor area of at least 80 square metres.
4. To avoid noise, require a distance of at least 1 km from a metro station and at least 2 km from the city centre.
5. The nightly price must be between €1,500 and €2,000, inclusive.
6. The deposit percentage must be 25%.
7. The property trust score must exceed 4.5 and the managing agency score must exceed 4.

The combined query should return the properties that meet every requirement. The assignment states that four properties meet the criteria. Compare the candidates and explain which one you would recommend, using the client's stated needs and the available data. Rechecking the supplied tables with all stated filters returns three properties; the query is left unchanged because the criteria are internally consistent and the data supports three matches.

## Part Two: Answer additional questions with SQL

- What is the combined floor area of properties with a swimming pool?
- Which property has the largest floor area? Which has the smallest?
- How many properties have a living room, and how many have a terrace?
- How many properties are listed in each country?
- What is the average nightly rental price?
- Which agency or agencies have the highest agency score?

## Data dictionary

The source files are `ALOJAMIENTO`, `UBICACION`, `PRECIO`, and `PUNTUACION`. Each contains 20 accommodation records keyed by `CODIGO_ALOJAMIENTO`.

- **ALOJAMIENTO:** `CODIGO_ALOJAMIENTO` (unique code), `NOMBRE`, `CANT_BANYOS` (bathrooms), `CANT_HAB` (bedrooms), `SALON` (living room), `TERRAZA` (terrace), `AIREC_ACOND` (air conditioning), `PISCINA` (pool), and `SUPERFICIE` (floor area in square metres).
- **UBICACION:** `CODIGO_ALOJAMIENTO`, `PAIS` (country), `CIUDAD` (city), `DIST_METRO` (distance to metro in kilometres), and `DIST_CENTRO` (distance to city centre in kilometres).
- **PRECIO:** `CODIGO_ALOJAMIENTO`, `PRECIO_ALQUILER` (nightly rental price in euros), `RESERVA` (whether a deposit is required), and `%_RESERVA` (deposit percentage).
- **PUNTUACION:** `CODIGO_ALOJAMIENTO`, `PUNTOS` (property trust and comfort score), `AGENCIA` (agency name), and `PUNTOS_AGENCIA` (agency score).

Original schema and field names are retained so the brief matches the SQL and supplied files.
