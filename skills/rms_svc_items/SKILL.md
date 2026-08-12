---
name: RMS Service Uploads - Item Master Datamodel
description: Physical schema tables for Oracle RMS Service Upload Staging for Items, Diffs, UDAs, and Packs (SVC_ITEM_*, SVC_DIFF_*, SVC_UDA_*).
---

# RMS Service Uploads - Item Master Datamodel

Physical schema tables for Oracle RMS Service Upload Staging for Items, Diffs, UDAs, and Packs (SVC_ITEM_*, SVC_DIFF_*, SVC_UDA_*).

Total Tables in Domain: **39** (Core Entities: `SVC_DIFF_IDS`, `SVC_DIFF_TYPE`, `SVC_ITEM_COST_DETAIL`, `SVC_ITEM_COST_HEAD`, `SVC_ITEM_COUNTRY`, `SVC_ITEM_COUNTRY_L10N_EXT`, `SVC_ITEM_IMAGE`, `SVC_ITEM_INDUCT_CONFIG`)

## Core Business Entities Summary:
| Core Table Name | Business Description |
| :--- | :--- |
| `SVC_DIFF_IDS` | This is a staging table used for Admin API spreadsheet upload process.It is used to tem... |
| `SVC_DIFF_IDS_TL` | This is a staging table used for Admin API spreadsheet upload process.It is used to tem... |
| `SVC_DIFF_TYPE` | This is a staging table used for Admin API spreadsheet upload process.It is used to tem... |
| `SVC_DIFF_TYPE_TL` | This is a staging table used for Admin API spreadsheet upload process.It is used to tem... |
| `SVC_ITEM_COST_DETAIL` | This is the staging table for Item Induction module. It is used to temporarily hold dat... |
| `SVC_ITEM_COST_HEAD` | This is the staging table for Item Induction module. It is used to temporarily hold dat... |
| `SVC_ITEM_COUNTRY` | This is the staging table for Item Induction module. It is used to temporarily hold dat... |
| `SVC_ITEM_COUNTRY_L10N_EXT` | This is the staging table for Item Induction module. It is used to temporarily hold dat... |
| `SVC_ITEM_IMAGE` | This is the staging table for Item Induction module. It is used to temporarily hold dat... |
| `SVC_ITEM_IMAGE_TL` | This is a staging table used for item induction spreadsheet upload process. It is used ... |
| `SVC_ITEM_INDUCT_CONFIG` | This is a staging table used for Admin API spreadsheet upload process.It is used to tem... |
| `SVC_ITEM_LOC_RANGING` | This is the parameter table used the by RMS asynchronous item location ranging function... |
| `SVC_ITEM_LOC_RANGING_LOCS` | This tables contains the list of valid locations for ranging or for updating. It is use... |
| `SVC_ITEM_MASTER` | This is the staging table for Item Induction module. It is used to temporarily hold dat... |
| `SVC_ITEM_MASTER_CFA_EXT` | This is the staging table for Item Induction module. It is used to temporarily hold dat... |

*... plus 24 additional auxiliary/work tables in `PHYSICAL_DATAMODEL.md`.*

## Skill References Directory:
- [`references/PHYSICAL_DATAMODEL.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_svc_items/references/PHYSICAL_DATAMODEL.md): Full DDL column definitions, data types, PKs, FKs, and column comments (39 tables).
- [`references/FUNCTIONAL_USER_GUIDE.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_svc_items/references/FUNCTIONAL_USER_GUIDE.md): Functional user guide workflows, operational lifecycles, and role dashboards.
- [`references/OPERATIONS_AND_BATCH_JOBS.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_svc_items/references/OPERATIONS_AND_BATCH_JOBS.md): Nightly batch jobs, C/Pro*C programs, restart/recovery logic, and RIB integration messages.
- [`references/SYSTEM_CONFIGURATIONS.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_svc_items/references/SYSTEM_CONFIGURATIONS.md): System configuration options (`SYSTEM_OPTIONS`), parameter flags, and setup rules.
