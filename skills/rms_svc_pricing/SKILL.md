---
name: RMS Service Uploads - Pricing & Promotions Datamodel
description: Physical schema tables for Oracle RMS Service Upload Staging for Price Changes, Promotions, and Clearances (SVC_PRICE_*, SVC_RPM_*, SVC_PROM_*).
---

# RMS Service Uploads - Pricing & Promotions Datamodel

Physical schema tables for Oracle RMS Service Upload Staging for Price Changes, Promotions, and Clearances (SVC_PRICE_*, SVC_RPM_*, SVC_PROM_*).

Total Tables in Domain: **9** (Core Entities: `SVC_COST_COMP_UPD_STG`, `SVC_COST_SUSP_SUP_DETAIL`, `SVC_COST_SUSP_SUP_DETAIL_LOC`, `SVC_COST_SUSP_SUP_HEAD`, `SVC_COST_SUSP_SUP_HEAD_CFA_EXT`, `SVC_RPM_ITEM_ZONE_PRICE`)

## Core Business Entities Summary:
| Core Table Name | Business Description |
| :--- | :--- |
| `SVC_COST_CHG_REASON_TL` | This is a staging table used for Admin API spreadsheet upload process.It is used to tem... |
| `SVC_COST_CHG_RSN_TL` | This is a staging table used for Admin API spreadsheet upload process.It is used to tem... |
| `SVC_COST_CHG_SEARCH_TEMP` | This table temporarily stores the cost changes searched by the user using item inductio... |
| `SVC_COST_COMP_UPD_STG` | This is a staging table used for Admin API spreadsheet upload process.It is used to tem... |
| `SVC_COST_SUSP_SUP_DETAIL` | This is the staging table for Item Induction moduleâ€™s cost change functionality. It i... |
| `SVC_COST_SUSP_SUP_DETAIL_LOC` | This table holds data coming from Item Induction, to be inserted to COST_SUSP_SUP_DETAI... |
| `SVC_COST_SUSP_SUP_HEAD` | This table holds data coming from Item Induction, to be inserted to COST_SUSP_SUP_HEAD ... |
| `SVC_COST_SUSP_SUP_HEAD_CFA_EXT` | This is the staging table for Item Induction module. It is used to temporarily hold dat... |
| `SVC_RPM_ITEM_ZONE_PRICE` | This is the staging table for Item Induction module. It is used to temporarily hold dat... |

## Skill References Directory:
- [`references/PHYSICAL_DATAMODEL.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_svc_pricing/references/PHYSICAL_DATAMODEL.md): Full DDL column definitions, data types, PKs, FKs, and column comments (9 tables).
- [`references/FUNCTIONAL_USER_GUIDE.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_svc_pricing/references/FUNCTIONAL_USER_GUIDE.md): Functional user guide workflows, operational lifecycles, and role dashboards.
- [`references/OPERATIONS_AND_BATCH_JOBS.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_svc_pricing/references/OPERATIONS_AND_BATCH_JOBS.md): Nightly batch jobs, C/Pro*C programs, restart/recovery logic, and RIB integration messages.
- [`references/SYSTEM_CONFIGURATIONS.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_svc_pricing/references/SYSTEM_CONFIGURATIONS.md): System configuration options (`SYSTEM_OPTIONS`), parameter flags, and setup rules.
