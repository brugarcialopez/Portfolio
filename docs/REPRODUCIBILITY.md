# Running and Verification

## Python notebooks

All three Python notebooks completed a fresh-kernel, top-to-bottom execution on **21 October 2026**, using an isolated Python **3.14.3** environment on macOS. Their executed outputs are saved in the notebooks. Each project has a `requirements.txt` recording the direct dependency versions used in that check. Other Python versions and operating systems have not been tested. Airbnb uses f-string syntax requiring Python 3.12 or later; the pinned package set was tested on 3.14.3.

From the repository root, create an environment:

```bash
python3 -m venv .venv
source .venv/bin/activate
```

Then enter the chosen project directory and install its dependencies:

```bash
pip install -r requirements.txt
jupyter notebook
```

Open the project's notebook and choose **Restart Kernel and Run All Cells**. Start Jupyter from the project directory so the original relative input paths resolve. Use the notebook's existing cell order. Source field names and source-language data values are retained; narrative, comments, and chart annotations are English.

Weightlifting's second stage needs internet access to Wikipedia. Its existing browser-style request header was necessary for successful access in this check; a plain request received HTTP 403. Page structure and availability can change. The first stage runs from the unchanged local CSVs.

## What was checked

| Project | Check and outcome |
|---|---|
| Churn | Complete notebook execution; ROC-AUC 0.829, average precision 0.469, 124 churners in the top 500, 1.82x at-risk charge capture versus the random expectation |
| Airbnb | Complete notebook execution; 9,027 study listings and the documented median comparisons reproduced |
| Weightlifting | Complete notebook including live scraping; 120 supplied-source records, 300 combined records across five distinct editions, and separate open-ended weight classes |
| SQL | Complete unchanged script executed without errors in a fresh, isolated MySQL 9.7.1 instance on 21 October 2026; four tables loaded 20 rows each; ALOJ010, ALOJ015, and ALOJ018 confirmed. Temporary server shut down afterward |
| Emergency care | Local CSV validation and formula-definition review only; live dashboard access remains blocked and its filters, date parsing, formulas, and appearance are unverified |

The Python runs produced library warnings, including scikit-learn notices about future defaults. They completed without cell errors. Pinned direct dependencies document the tested environment; they do not guarantee identical results on every system.

## SQL execution

Use MySQL and review the database name `ProyectoFinal_SQL` before running the project script. It creates the schema and loads data through embedded `INSERT` statements. Run it once against a fresh database; rerunning the entire script against the same populated database will encounter existing objects or keys. No destructive reset is included.

## Publication

Keep `originals-untouched/` as the local preservation copy; `.gitignore` excludes it and local environments/caches. This workspace is not yet a Git repository. Initialize one local repository before publication, inspect the files selected for tracking, and keep the excluded preservation copy locally. No remote repository has been created from this workspace.

Known dataset provenance and remaining source uncertainties are described in each project README. Undocumented upstream licensing has not been replaced with an invented license.
