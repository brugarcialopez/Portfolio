# Local Data Validation and Dashboard Review

## Visit records and dates

The file contains **65,420 records with unique visit identifiers**. It uses month/day/year timestamp text, for example `2/15/2025`. All timestamp strings other than literal `[NULL]` values parse using `%m/%d/%Y %H:%M`. Arrival dates span 30 December 2024 to 15 February 2025, so a dashboard described as early-2025 activity should make its selected period explicit.

| Field | Literal `[NULL]` values | Records with a timestamp |
|---|---:|---:|
| Arrival | 0 | 65,420 |
| Triage | 3,581 | 61,839 |
| First assessment | 7,515 | 57,905 |
| Departure | 327 | 65,093 |
| Admission order | 55,869 | 9,551 |

Literal `[NULL]` strings require explicit recognition when validating missing values; a default pandas missing-value count alone does not detect them. Live date parsing remains unverified. Denominators for time averages must reflect available timestamps, rather than treating missing times as zero.

There are four triage timestamps, one first-assessment timestamp, and one admission-order timestamp earlier than arrival. These records have not been deleted, replaced, or excluded. Their treatment needs an explicit decision before changing any time calculation.

The proposal flag has 9,551 `Si` and 55,869 `No` values. The existing local calculation checks the exact string `Si`; a proposed admission and an independently verified completed admission should not be conflated.

## Triage labels

There are 3,520 literal `[NULL]` triage values, 315 `VI - Blanco` values, and 19 colour/other labels in addition to the main level labels. These include `amarillo`, `AMARILLO`, `Amarilla`, `naranja`, `Naranja.`, `verde`, `VERDE`, `Verde.`, and one `Moderado`.

The original assignment suggests combining Level VI with V and mapping colour labels to their corresponding levels. Whether the live dashboard already does this is unverified. `Moderado` should not be assigned a level without confirmation. Keep missing or unconfirmed labels visibly unclassified rather than silently forcing a level.

## Live review still required

The browser's saved permission policy blocked dashboard access through the Google account redirect. No screenshot, formula change, or filter test was completed in the live report.

When access is available, check the selected period, date parsing, triage grouping, missing-time denominators, the exact `Si` formula, and the time parameter. Then add a real screenshot and only findings verified in the report. No Python-derived chart is presented as a dashboard screenshot.
