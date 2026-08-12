---
name: RMS Service Uploads - Inventory & Transfers Datamodel
description: Physical schema tables for Oracle RMS Service Upload Staging for Inventory, Transfers, Allocations, and Shipments (SVC_INV_*, SVC_TSF_*, SVC_ALLOC_*).
---

# RMS Service Uploads - Inventory & Transfers Datamodel

Physical schema tables for Oracle RMS Service Upload Staging for Inventory, Transfers, Allocations, and Shipments (SVC_INV_*, SVC_TSF_*, SVC_ALLOC_*).

Total Tables in Domain: **9** (Core Entities: `SVC_INV_ADJ_REASON`, `SVC_TSF_ENTITY`, `SVC_TSF_ENTITY_ORG_UNIT_SOB`)

## Core Business Entities Summary:
| Core Table Name | Business Description |
| :--- | :--- |
| `SVC_INV_ADJ_REASON` | This is a staging table used for Admin API spreadsheet upload process.It is used to tem... |
| `SVC_INV_ADJ_REASON_TL` | This is a staging table used for Admin API spreadsheet upload process.It is used to tem... |
| `SVC_INV_STATUS_CODES_LANG_TL` | This is a staging table used for Admin API spreadsheet upload process.It is used to tem... |
| `SVC_INV_STATUS_CODES_TL` | This is a staging table used for Admin API spreadsheet upload process.It is used to tem... |
| `SVC_INV_STATUS_TYPES_TL` | This is a staging table used for Admin API spreadsheet upload process.It is used to tem... |
| `SVC_INV_ST_TYPS_TL` | This is a staging table used for Admin API spreadsheet upload process.It is used to tem... |
| `SVC_TSF_ENTITY` | This is a staging table used for Admin API spreadsheet upload process.It is used to tem... |
| `SVC_TSF_ENTITY_ORG_UNIT_SOB` | This is a staging table used for Admin API spreadsheet upload process.It is used to tem... |
| `SVC_TSF_ENTITY_TL` | This is a staging table used for Admin API spreadsheet upload process.It is used to tem... |

## Skill References Directory:
- [`references/PHYSICAL_DATAMODEL.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_svc_inventory/references/PHYSICAL_DATAMODEL.md): Full DDL column definitions, data types, PKs, FKs, and column comments (9 tables).
- [`references/FUNCTIONAL_USER_GUIDE.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_svc_inventory/references/FUNCTIONAL_USER_GUIDE.md): Functional user guide workflows, operational lifecycles, and role dashboards.
- [`references/OPERATIONS_AND_BATCH_JOBS.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_svc_inventory/references/OPERATIONS_AND_BATCH_JOBS.md): Nightly batch jobs, C/Pro*C programs, restart/recovery logic, and RIB integration messages.
- [`references/SYSTEM_CONFIGURATIONS.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_svc_inventory/references/SYSTEM_CONFIGURATIONS.md): System configuration options (`SYSTEM_OPTIONS`), parameter flags, and setup rules.
