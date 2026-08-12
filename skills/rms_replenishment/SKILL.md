---
name: RMS Replenishment & Delivery Schedules Datamodel
description: Physical schema tables for Oracle RMS Replenishment attributes, schedules, methods, delivery schedules, and min/max stock requirements.
---

# RMS Replenishment & Delivery Schedules Datamodel

Physical schema tables for Oracle RMS Replenishment attributes, schedules, methods, delivery schedules, and min/max stock requirements.

Total Tables in Domain: **20** (Core Entities: `MASTER_REPL_ATTR`, `REPL_APPRV_GTAX_QUEUE`, `REPL_ATTR_UPDATE_EXCLUDE`, `REPL_ATTR_UPDATE_HEAD`, `REPL_ATTR_UPDATE_ITEM`, `REPL_ATTR_UPDATE_LOC`, `REPL_ATTR_UPD_HIST`, `REPL_DAY`)

## Core Business Entities Summary:
| Core Table Name | Business Description |
| :--- | :--- |
| `MASTER_REPL_ATTR` | Table for Master Replenishment Attribute (MRA) records. This table holds MRA records fo... |
| `REPL_APPRV_GTAX_QUEUE` | Contains approved replenishment purchase order numbers. The batch rplapprv.pc insert re... |
| `REPL_ATTR_UPDATE_EXCLUDE` | New Table that holds excluded update replenishment attributes. |
| `REPL_ATTR_UPDATE_HEAD` | This Table encompasses new replenishment functionality. |
| `REPL_ATTR_UPDATE_ITEM` | This table is used to temporarily store item replenishment attribute information. This ... |
| `REPL_ATTR_UPDATE_LOC` | This table is used to temporarily store item location replenishment attribute informati... |
| `REPL_ATTR_UPD_HIST` | This table stores data that is captured whenever a change occurs on the replenishment f... |
| `REPL_DAY` | This new table indicates what days of the week an item location should be reviewed for ... |
| `REPL_DAY_UPDATE` | This table will be a global temporary table used during the rplatupd batch program. It ... |
| `REPL_ITEM_LOC` | This table is used to store item location level replenishment attributes. |
| `REPL_ITEM_LOC_SUPP_DIST` | This table will contain the supplier distribution ratio for an item/location that is se... |
| `REPL_ITEM_LOC_UPDATES` | This table is used as a staging table for the Replenishment Attribute Update batch proc... |
| `REPL_RESULTS` | This table is used to store item location level replenishment results information and t... |
| `REPL_RESULTS_TEMP` | Temp table that is used to store item location level replenishment results information ... |
| `RPL_ALLOC_IN_TMP` | This is a temporary table being created to improve the performance of reqext.pc batch p... |

*... plus 5 additional auxiliary/work tables in `PHYSICAL_DATAMODEL.md`.*

## Skill References Directory:
- [`references/PHYSICAL_DATAMODEL.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_replenishment/references/PHYSICAL_DATAMODEL.md): Full DDL column definitions, data types, PKs, FKs, and column comments (20 tables).
- [`references/FUNCTIONAL_USER_GUIDE.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_replenishment/references/FUNCTIONAL_USER_GUIDE.md): Functional user guide workflows, operational lifecycles, and role dashboards.
- [`references/OPERATIONS_AND_BATCH_JOBS.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_replenishment/references/OPERATIONS_AND_BATCH_JOBS.md): Nightly batch jobs, C/Pro*C programs, restart/recovery logic, and RIB integration messages.
- [`references/SYSTEM_CONFIGURATIONS.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_replenishment/references/SYSTEM_CONFIGURATIONS.md): System configuration options (`SYSTEM_OPTIONS`), parameter flags, and setup rules.
