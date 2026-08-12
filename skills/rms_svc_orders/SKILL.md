---
name: RMS Service Uploads - Orders & Procurement Datamodel
description: Physical schema tables for Oracle RMS Service Upload Staging for Purchase Orders and Procurement (SVC_ORD_*, SVC_PO_*).
---

# RMS Service Uploads - Orders & Procurement Datamodel

Physical schema tables for Oracle RMS Service Upload Staging for Purchase Orders and Procurement (SVC_ORD_*, SVC_PO_*).

Total Tables in Domain: **5** (Core Entities: `SVC_PO_DEL`, `SVC_PO_INDUCT_CONFIG`, `SVC_PO_TYPE`)

## Core Business Entities Summary:
| Core Table Name | Business Description |
| :--- | :--- |
| `SVC_PO_DEL` | This is a temporary table for PO Induction module which is used to track PO numbers tha... |
| `SVC_PO_INDUCT_CONFIG` | This is a staging table used for Admin API spreadsheet upload process.It is used to tem... |
| `SVC_PO_SEARCH_TEMP` | This table is used to temporarily store searched orders (based on user criteria) that a... |
| `SVC_PO_TYPE` | This is a staging table used for Admin API spreadsheet upload process.It is used to tem... |
| `SVC_PO_TYPE_TL` | This is a staging table used for Admin API spreadsheet upload process.It is used to tem... |

## Skill References Directory:
- [`references/PHYSICAL_DATAMODEL.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_svc_orders/references/PHYSICAL_DATAMODEL.md): Full DDL column definitions, data types, PKs, FKs, and column comments (5 tables).
- [`references/FUNCTIONAL_USER_GUIDE.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_svc_orders/references/FUNCTIONAL_USER_GUIDE.md): Functional user guide workflows, operational lifecycles, and role dashboards.
- [`references/OPERATIONS_AND_BATCH_JOBS.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_svc_orders/references/OPERATIONS_AND_BATCH_JOBS.md): Nightly batch jobs, C/Pro*C programs, restart/recovery logic, and RIB integration messages.
- [`references/SYSTEM_CONFIGURATIONS.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_svc_orders/references/SYSTEM_CONFIGURATIONS.md): System configuration options (`SYSTEM_OPTIONS`), parameter flags, and setup rules.
