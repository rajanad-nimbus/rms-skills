---
name: RMS Store Allocations Datamodel
description: Physical schema tables for Oracle RMS Store Allocations and Demand Distribution (ALLOC_HEADER, ALLOC_DETAIL, ALC_ITEM_LOC).
---

# RMS Store Allocations Datamodel

Physical schema tables for Oracle RMS Store Allocations and Demand Distribution (ALLOC_HEADER, ALLOC_DETAIL, ALC_ITEM_LOC).

Total Tables in Domain: **14** (Core Entities: `ALC_COMP_LOC`, `ALC_HEAD`, `ALLOC_CHRG`, `ALLOC_DETAIL`, `ALLOC_DETAILS_PUBLISHED`, `ALLOC_HEADER`, `ALLOC_PUB_INFO`, `ALLOC_PURGE_QUEUE`)

## Core Business Entities Summary:
| Core Table Name | Business Description |
| :--- | :--- |
| `ALC_COMP_LOC` | The ALC_COMP_LOC table contains the location-level information for the actual landed co... |
| `ALC_HEAD` | The ACL_HEAD table contains the header-level information of the actual landed cost (ALC... |
| `ALC_HEAD_TEMP` | The ALC_HEAD_TEMP table temporarily holds selected records from the alc_head table and ... |
| `ALLOC_CHRG` | The ALLOC_CHRG table contains Up Charge components and their associated information for... |
| `ALLOC_CHRG_TEMP` | The ALLOC_CHRG_TEMP table holds the same information as the alloc_chrg table and will s... |
| `ALLOC_DETAIL` | This table contains one row for every allocation store/warehouse combination. Allocatio... |
| `ALLOC_DETAILS_PUBLISHED` | This table helps in publication of the business transacation. It is done by recording w... |
| `ALLOC_DETAIL_TEMP` | This table contains the same information as that of the alloc_detail table. It also ser... |
| `ALLOC_HEADER` | This table contains header level information for the allocation of a SKU from a warehou... |
| `ALLOC_HEADER_TEMP` | This table holds the same information as that of the alloc_header table. It also serves... |
| `ALLOC_MFQUEUE` | This table is a staging table for allocation messages as they wait to be sent over the ... |
| `ALLOC_PUB_INFO` | This table helps in publication of the business transacation. It is done by tracking th... |
| `ALLOC_PURGE_QUEUE` | This table contains the details of the allocation based on inventory existing in a ware... |
| `ALLOC_REV` | This table contains the allocation revision history. |

## Skill References Directory:
- [`references/PHYSICAL_DATAMODEL.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_allocations/references/PHYSICAL_DATAMODEL.md): Full DDL column definitions, data types, PKs, FKs, and column comments (14 tables).
- [`references/FUNCTIONAL_USER_GUIDE.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_allocations/references/FUNCTIONAL_USER_GUIDE.md): Functional user guide workflows, operational lifecycles, and role dashboards.
- [`references/OPERATIONS_AND_BATCH_JOBS.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_allocations/references/OPERATIONS_AND_BATCH_JOBS.md): Nightly batch jobs, C/Pro*C programs, restart/recovery logic, and RIB integration messages.
- [`references/SYSTEM_CONFIGURATIONS.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_allocations/references/SYSTEM_CONFIGURATIONS.md): System configuration options (`SYSTEM_OPTIONS`), parameter flags, and setup rules.
