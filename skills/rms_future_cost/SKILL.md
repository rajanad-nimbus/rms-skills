---
name: RMS Future Cost Engine Datamodel
description: Physical schema tables for Oracle RMS Future Cost Timeline Calculations, Net Cost, and Net-Net Cost Engine (FUTURE_COST, FUTURE_COST_TEMP).
---

# RMS Future Cost Engine Datamodel

Physical schema tables for Oracle RMS Future Cost Timeline Calculations, Net Cost, and Net-Net Cost Engine (FUTURE_COST, FUTURE_COST_TEMP).

Total Tables in Domain: **8** (Core Entities: `FUTURE_COST`, `FUTURE_COST_ROLLFWD_CONTROL`)

## Core Business Entities Summary:
| Core Table Name | Business Description |
| :--- | :--- |
| `FUTURE_COST` | This table holds estimated costs of items on future dates. Applicable deals, pending pr... |
| `FUTURE_COST_BUYGET_HELP_GTT` | this table is used during the processing of cost engine. |
| `FUTURE_COST_COMP_GTT` | this table holds estimated component costs of items on future dates. |
| `FUTURE_COST_GTT` | this table is used during the processing of cost engine |
| `FUTURE_COST_ROLLFWD_CONTROL` | Program control table for the future cost engine roll forward package. List the functio... |
| `FUTURE_COST_WF_HELPER_TEMP` | This is a temporary table to help the future_cost_temp table limit rows for franchise f... |
| `FUTURE_COST_WORKING_GTT` | this table is used during the processing of cost engine. |
| `FUTURE_COST_WORKSPACE` | This table holds estimated costs of items on future dates. It is used by the margin imp... |

## Skill References Directory:
- [`references/PHYSICAL_DATAMODEL.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_future_cost/references/PHYSICAL_DATAMODEL.md): Full DDL column definitions, data types, PKs, FKs, and column comments (8 tables).
- [`references/FUNCTIONAL_USER_GUIDE.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_future_cost/references/FUNCTIONAL_USER_GUIDE.md): Functional user guide workflows, operational lifecycles, and role dashboards.
- [`references/OPERATIONS_AND_BATCH_JOBS.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_future_cost/references/OPERATIONS_AND_BATCH_JOBS.md): Nightly batch jobs, C/Pro*C programs, restart/recovery logic, and RIB integration messages.
- [`references/SYSTEM_CONFIGURATIONS.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_future_cost/references/SYSTEM_CONFIGURATIONS.md): System configuration options (`SYSTEM_OPTIONS`), parameter flags, and setup rules.
