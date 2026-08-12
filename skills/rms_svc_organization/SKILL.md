---
name: RMS Service Uploads - Organization & Store Datamodel
description: Physical schema tables for Oracle RMS Service Upload Staging for Stores, Warehouses, Channels, Banners, and Org Hierarchy (SVC_STORE_*, SVC_WH_*, SVC_BANNER_*).
---

# RMS Service Uploads - Organization & Store Datamodel

Physical schema tables for Oracle RMS Service Upload Staging for Stores, Warehouses, Channels, Banners, and Org Hierarchy (SVC_STORE_*, SVC_WH_*, SVC_BANNER_*).

Total Tables in Domain: **14** (Core Entities: `SVC_BANNER`, `SVC_CHANNELS`, `SVC_LOC_TRAITS`, `SVC_ORG_UNIT`, `SVC_STORE_FORMAT`, `SVC_STORE_GRADE`, `SVC_STORE_GRADE_GROUP`, `SVC_STORE_GRADE_STORE`)

## Core Business Entities Summary:
| Core Table Name | Business Description |
| :--- | :--- |
| `SVC_BANNER` | This is a staging table used for Admin API spreadsheet upload process.It is used to tem... |
| `SVC_BANNER_TL` | This is a staging table used for Admin API spreadsheet upload process.It is used to tem... |
| `SVC_CHANNELS` | This is a staging table used for Admin API spreadsheet upload process.It is used to tem... |
| `SVC_CHANNELS_TL` | This is a staging table used for Admin API spreadsheet upload process.It is used to tem... |
| `SVC_LOC_TRAITS` | This is a staging table used for Admin API spreadsheet upload process.It is used to tem... |
| `SVC_LOC_TRAITS_TL` | This is a staging table used for Admin API spreadsheet upload process.It is used to tem... |
| `SVC_ORG_UNIT` | This is a staging table used for Admin API spreadsheet upload process.It is used to tem... |
| `SVC_ORG_UNIT_TL` | This is a staging table used for Admin API spreadsheet upload process.It is used to tem... |
| `SVC_STORE_FORMAT` | This is a staging table used for Admin API spreadsheet upload process.It is used to tem... |
| `SVC_STORE_FORMAT_TL` | This is a staging table used for Admin API spreadsheet upload process.It is used to tem... |
| `SVC_STORE_GRADE` | This is a staging table used for Admin API spreadsheet upload process.It is used to tem... |
| `SVC_STORE_GRADE_GROUP` | This is a staging table used for Admin API spreadsheet upload process.It is used to tem... |
| `SVC_STORE_GRADE_GROUP_TL` | This is a staging table used for Admin API spreadsheet upload process.It is used to tem... |
| `SVC_STORE_GRADE_STORE` | This is a staging table used for Admin API spreadsheet upload process.It is used to tem... |

## Skill References Directory:
- [`references/PHYSICAL_DATAMODEL.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_svc_organization/references/PHYSICAL_DATAMODEL.md): Full DDL column definitions, data types, PKs, FKs, and column comments (14 tables).
- [`references/FUNCTIONAL_USER_GUIDE.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_svc_organization/references/FUNCTIONAL_USER_GUIDE.md): Functional user guide workflows, operational lifecycles, and role dashboards.
- [`references/OPERATIONS_AND_BATCH_JOBS.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_svc_organization/references/OPERATIONS_AND_BATCH_JOBS.md): Nightly batch jobs, C/Pro*C programs, restart/recovery logic, and RIB integration messages.
- [`references/SYSTEM_CONFIGURATIONS.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_svc_organization/references/SYSTEM_CONFIGURATIONS.md): System configuration options (`SYSTEM_OPTIONS`), parameter flags, and setup rules.
