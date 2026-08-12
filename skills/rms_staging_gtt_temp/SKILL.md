---
name: RMS Staging, GTT & Temporary Work Tables Datamodel
description: Physical schema tables for Oracle RMS Temporary Work Tables (GTT, TEMP), Global Staging (STAGE, WORK), and Interface Staging.
---

# RMS Staging, GTT & Temporary Work Tables Datamodel

Physical schema tables for Oracle RMS Temporary Work Tables (GTT, TEMP), Global Staging (STAGE, WORK), and Interface Staging.

Total Tables in Domain: **60** (Core Entities: `LOAD_ERR`)

## Core Business Entities Summary:
| Core Table Name | Business Description |
| :--- | :--- |
| `DATE_DIST_TEMP` | This temporary table is used by the date distribution object to temporarily store recor... |
| `GENERIC_GLOBAL_TEMP` | This table is used to aid processing for various programs |
| `GTT_10_NUM_10_STR_10_DATE` | A global temporary table with ten numeric values, string values, and date values. |
| `GTT_15_NUM_15_STR_15_DATE` | A global temporary table with 15 numeric values, string values, and date values. |
| `GTT_6_NUM_6_STR_6_DATE` | A global temporary table with six numeric values, string values, and date values. |
| `GTT_ALLOC_ORDER_NO` | GLOBAL TEMPORARY TABLE GTT_ALLOC_ORDER_NO |
| `GTT_ALLOC_ORD_NO` | This is a global temporary table used to improve performance of tfsprg. |
| `GTT_COST_COMP_UPD` | This is a new global temporary table that is used to store the costing related table re... |
| `GTT_DEALEX_DEALID` | Global temporary table for deal_head table. |
| `GTT_DEALEX_EXCLUDE` | Global temporary table for deal_head, deal_itemloc, and item_master. |
| `GTT_DEALEX_ITEM_MASTER` | Global temporary table for item_master, deps, and group tables. |
| `GTT_DEALEX_MERCH` | Global temporary table for deal_head, deal_itemloc, and item_master. |
| `GTT_DEALEX_ORGMERCH` | Global temporary table for store_hierarchy, item_loc, and gtt_dealex_merch tables. |
| `GTT_DEALINC_DEALS` | Global temporary table used by the dealinc module. |
| `GTT_DEAL_ITEMLOC` | This table will temporarily hold records from the DEAL_HEAD table based on the 4 new DE... |

*... plus 45 additional auxiliary/work tables in `PHYSICAL_DATAMODEL.md`.*

## Skill References Directory:
- [`references/PHYSICAL_DATAMODEL.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_staging_gtt_temp/references/PHYSICAL_DATAMODEL.md): Full DDL column definitions, data types, PKs, FKs, and column comments (60 tables).
- [`references/FUNCTIONAL_USER_GUIDE.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_staging_gtt_temp/references/FUNCTIONAL_USER_GUIDE.md): Functional user guide workflows, operational lifecycles, and role dashboards.
- [`references/OPERATIONS_AND_BATCH_JOBS.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_staging_gtt_temp/references/OPERATIONS_AND_BATCH_JOBS.md): Nightly batch jobs, C/Pro*C programs, restart/recovery logic, and RIB integration messages.
- [`references/SYSTEM_CONFIGURATIONS.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_staging_gtt_temp/references/SYSTEM_CONFIGURATIONS.md): System configuration options (`SYSTEM_OPTIONS`), parameter flags, and setup rules.
