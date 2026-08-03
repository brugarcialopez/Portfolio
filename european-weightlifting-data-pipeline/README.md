# European Weightlifting Results — Scalable Data Pipeline

## Business Question
> **Can a single automated cleaning pipeline reliably scale from a small, clean dataset to a much larger, messier dataset collected independently across multiple years?**

Sports analytics datasets—especially from international federations—are often scattered across legacy HTML tables, varying formats, and inconsistent text encodings. This project builds a production-grade data pipeline capable of parsing and standardizing competition results across multiple seasons without breaking.

---

## Key Results
* **100% Core Logic Reuse:** A pipeline built and validated on 2 initial seasons scaled seamlessly to **6 full seasons (2019–2024)** with zero changes to the core parsing logic.
* **Robust Text Normalization:** Successfully unified athlete names, bodyweight categories, and attempt logs (Snatch, Clean & Jerk, Total) across messy, independently scraped HTML files.
* **Automated Web Scraping:** Automated raw table extraction directly from federation source web pages.

---

## Project Architecture & Methodology
1. **Web Extraction:** Automated HTTP scraping via `requests` and tabular extraction using `pandas.read_html`.
2. **Regex Parsing Engine:** Designed robust regular expressions to extract structured metrics from messy strings (e.g., failed attempts, weight class shifts, national flags).
3. **Reusable Design:** Encapsulated extraction and cleaning steps into modular functions inside `functions.py` for pipeline maintainability and automated execution.

---

## File Structure
* `european_weightlifting_results_pipeline.ipynb`: Pipeline demonstration, validation tests, and multi-year dataset assembly.
* `functions.py`: Modular parsing engine, regex functions, and data cleaning utilities.
* `data/`: Extracted raw and normalized CSV results (2019–2024).

---

## Tech Stack
`Python` | `pandas` | `requests` | `BeautifulSoup4` | `regex (re)`
