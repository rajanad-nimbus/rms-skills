---
name: RMS Daily & Weekly Stock Ledger Summaries Datamodel
description: Physical schema tables for Oracle RMS Daily and Weekly Stock Ledger Rollups (DAILY_DATA, WEEK_DATA, MONTH_DATA, HALF_DATA).
---

# RMS Daily & Weekly Stock Ledger Summaries Datamodel

Physical schema tables for Oracle RMS Daily and Weekly Stock Ledger Rollups (DAILY_DATA, WEEK_DATA, MONTH_DATA, HALF_DATA).

Total Tables in Domain: **13** (Core Entities: `DAILY_DATA`, `DAILY_DATA_BACKPOST`, `DAILY_PURGE`, `DAILY_PURGE_ERROR_LOG`, `DAILY_SALES_DISCOUNT`, `HALF`, `HALF_DATA`, `HALF_DATA_BUDGET`)

## Core Business Entities Summary:
| Core Table Name | Business Description |
| :--- | :--- |
| `DAILY_DATA` | This table provides a history, bcomcocom |
| `DAILY_DATA_BACKPOST` | This table holds the rolled up data for all back posted transactions. |
| `DAILY_DATA_TEMP` | This table will hold back_posted transactions that are processed by the salweek.pc batc... |
| `DAILY_PURGE` | This table is used to hold the table name and a key value for a record that needs to be... |
| `DAILY_PURGE_ERROR_LOG` | This table holds a log of errors that were found when running the dlypurge.pc program. ... |
| `DAILY_SALES_DISCOUNT` | This table contains one record for each Item/Store which had a sales transaction with a... |
| `HALF` | In addition to weekly and monthly calendars, RMS also facilitates 'Half Yearly' time pe... |
| `HALF_DATA` | This table provides a history, by half, of shrinkage amounts that are maintained by RMS... |
| `HALF_DATA_BUDGET` | This table is used for holding data required for budgeting and gross margin forecasting... |
| `HALF_TL` | This is the translation table for HALF table. The data in the base table is held in dat... |
| `MONTH_DATA` | This table provides a history, by month, of all dollar figures that are maintained by O... |
| `MONTH_DATA_BUDGET` | This table holds the month-by-month data for budget forecasting. This table contains on... |
| `WEEK_DATA` | This table provides a history, by week, of all dollar figures that are maintained by st... |

## Skill References Directory:
- [`references/PHYSICAL_DATAMODEL.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_daily_stock_data/references/PHYSICAL_DATAMODEL.md): Full DDL column definitions, data types, PKs, FKs, and column comments (13 tables).
- [`references/FUNCTIONAL_USER_GUIDE.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_daily_stock_data/references/FUNCTIONAL_USER_GUIDE.md): Functional user guide workflows, operational lifecycles, and role dashboards.
- [`references/OPERATIONS_AND_BATCH_JOBS.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_daily_stock_data/references/OPERATIONS_AND_BATCH_JOBS.md): Nightly batch jobs, C/Pro*C programs, restart/recovery logic, and RIB integration messages.
- [`references/SYSTEM_CONFIGURATIONS.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_daily_stock_data/references/SYSTEM_CONFIGURATIONS.md): System configuration options (`SYSTEM_OPTIONS`), parameter flags, and setup rules.
