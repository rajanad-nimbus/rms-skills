---
name: RMS Sales Forecasting & Planning Datamodel
description: Physical schema tables for Oracle RMS Sales Forecasts, Smoothed Historical Averages, and Forecast Rebuilds (FORECAST, DAILY_ITEM_FORECAST).
---

# RMS Sales Forecasting & Planning Datamodel

Physical schema tables for Oracle RMS Sales Forecasts, Smoothed Historical Averages, and Forecast Rebuilds (FORECAST, DAILY_ITEM_FORECAST).

Total Tables in Domain: **3** (Core Entities: `DAILY_ITEM_FORECAST`, `FORECAST_REBUILD`, `IF_RPM_SMOOTHED_AVG`)

## Core Business Entities Summary:
| Core Table Name | Business Description |
| :--- | :--- |
| `DAILY_ITEM_FORECAST` | Holds the day/item level forecasted information from the RDF extractions. This table wi... |
| `FORECAST_REBUILD` | This table contains one record for each forecasted SKU/store relationship that was sent... |
| `IF_RPM_SMOOTHED_AVG` | This table is used by the Oracle Retail Price Management module (RPM) to assist in the ... |

## Skill References Directory:
- [`references/PHYSICAL_DATAMODEL.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_forecasting_planning/references/PHYSICAL_DATAMODEL.md): Full DDL column definitions, data types, PKs, FKs, and column comments (3 tables).
- [`references/FUNCTIONAL_USER_GUIDE.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_forecasting_planning/references/FUNCTIONAL_USER_GUIDE.md): Functional user guide workflows, operational lifecycles, and role dashboards.
- [`references/OPERATIONS_AND_BATCH_JOBS.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_forecasting_planning/references/OPERATIONS_AND_BATCH_JOBS.md): Nightly batch jobs, C/Pro*C programs, restart/recovery logic, and RIB integration messages.
- [`references/SYSTEM_CONFIGURATIONS.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_forecasting_planning/references/SYSTEM_CONFIGURATIONS.md): System configuration options (`SYSTEM_OPTIONS`), parameter flags, and setup rules.
