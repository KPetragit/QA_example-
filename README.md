# QA_example
This repository contains **representative code samples** from data quality assurance in household survey data workflows I have developed in R. The code demonstrates skills in data processing, quality assurance (high-frequency checks), data cleaning, and automation.  
> Note: The data required to run these scripts cannot be shared due to confidentiality. The examples are provided to illustrate coding practices, documentation, and workflow design. The scripts have been adapted to remove sensitive references while retaining their technical structure.

The code has been used to develop of QA monitoring dashboard used to monitor a household survey data collection. Dashboard was created in Shiny and tracks 93 data quality indicators. 
Dashboard also produced QA flags, which the data collection firm used to rectify and data quality shortfalls. Dashboard is interactive, and data cleaning can be entered into the dashboard directly from by the data collection company. Upon each daily data refresh, the dashboard take the 
entered information, and cleans the data. This monitoring tool enabled a smooth QA process, daily data updates and the ability of daily monitoring. Upon the completion of the data collection, the cleaning logs were already created which 
substantial saved time in the data preparation for analysis. 

## Workflow Overview

The scripts are organised sequentially:

1. **Workflow preparation**
The first three files of the script are preparatory files which enable the onward steps. 

- **1_params.R**
Central configuration for survey QA and monitoring. Defines asset names, targets, thresholds (response rates, outliers, skips, DK/RF patterns), anthropometric variables, and interview timing for consistent use across all QA and analysis scripts.

- **2_funs.R**
Utility functions for Kobo data ingestion and preparation. Includes retrieval of assets by name, flattening/merging of repeat groups, harmonising household roster structures, adding key variables for interview outcomes, and dynamically merging multi-asset datasets. Provides a single data_import() entry point that loads, processes, and caches Kobo survey data for downstream cleaning and QA.

- **3_functions**
  A folder, containing two scripts:

  - **flat_functions_qa_qmd**
  Collection of functions to flag and summarise interview quality issues (completeness, eligibility, refusals, response/contact/cooperation/replacement rates, missing/skipped modules, duplicates, outliers, anthropometry z-scores, module timing). Supports both enumerator- and weekly-level QC, with outputs structured for review tables and QA logs.

  - **flat_functions_qa_dashboard.qmd**
  Functions powering the FDS QA dashboard. Includes UI helpers (date slider), progress and distribution plots, checks for duplicates/outliers, and routines to build team- and enumerator-level QA summaries. Provides visual and tabular outputs for monitoring productivity and data quality in real time.

2. **Data Improt**
The second part is the data import directly from KoboToolBox. 
- **4_dataimport.qmd**
Imports raw Kobo assets, merges multi-language datasets, selects relevant variables, and optimises performance for QA. Saves processed objects locally and publishes them as pins to Posit Connect for downstream analysis and dashboards.

3. **Data preparation and construction of dashboard**
The third part is the preparation of data. Functions prepared in step 1 are applied to the imported data. Following the actual QA shiny dashboard is created. 

- **5_dataprep.qmd**
Prepares data for the QA dashboard. Loads merged survey data, applies corrections (general + anthropometrics), integrates sample information, derives key indicators (response, refusal, replacement, cooperation), and generates QA outputs (summaries, duplicates, outliers, skips, working hours, anthropometrics, module durations). Produces the qa object, which is pinned to Posit Connect for dashboard use.
This script also calls on corrections_setup.R, Observations_setup.R and anthro_corrections_setup.R. These separate scripts prepare a workflow which takes the data corrections 
entered directly into the dashboard, runs the so called corrections through the raw data before a new data preparation cycle starts. This ensure the QA flags that are produced on the dashboard
contain only non-corrected elements. 

- **6_qa_dashboard.qmd**
Creates the interactive Shiny dashboard for survey QA and monitoring. Displays daily updates on sample progress, interview outcomes, data quality, anthropometrics, enumerator performance, and logged corrections. Integrates secure login, Posit Connect pins, and interactive visualisations (Plotly, Mapboxer, DT).

4. **Other**
Other elements in the project contain the needed information for the dashboard design aspects, as well as other supporting materials needed for the QA process. 

## Quick Navigation  

| Script/File                     | Purpose                                    |
|---------------------------------|--------------------------------------------|
| `1_params.R`                    | Global parameters & thresholds             |
| `2_funs.R`                      | Data import & harmonisation functions      |
| `3_functions/flat_functions_qa.qmd`         | QA checks (outcomes, skips, duplicates, outliers) |
| `3_functions/flat_functions_qa_dashboard.qmd` | Dashboard-specific functions (plots, UI, summaries) |
| `4_dataimport.qmd`              | Import & merge Kobo assets, publish pins   |
| `5_dataprep.qmd`                | Apply corrections, derive QA indicators    |
| `corrections_setup.R`           | Workflow for logged corrections            |
| `observations_setup.R`          | Workflow for logged observations           |
| `anthro_corrections_setup.R`    | Workflow for anthropometric corrections    |
| `6_qa_dashboard.qmd`            | Shiny dashboard with 93 QA indicators      |
