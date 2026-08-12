---
name: RMS Return to Vendor (RTV) Datamodel
description: Physical schema tables for Oracle RMS Return to Vendor (RTV), RTV Requests, and RTV Item Holds (RTV_HEAD, RTV_DETAIL, RTVREQ_HEAD).
---

# RMS Return to Vendor (RTV) Datamodel

Physical schema tables for Oracle RMS Return to Vendor (RTV), RTV Requests, and RTV Item Holds (RTV_HEAD, RTV_DETAIL, RTVREQ_HEAD).

Total Tables in Domain: **6** (Core Entities: `RTVITEM_INV_FLOW`, `RTVREQ_PUB_INFO`, `RTV_DETAIL`, `RTV_HEAD`, `RTV_HEAD_CFA_EXT`)

## Core Business Entities Summary:
| Core Table Name | Business Description |
| :--- | :--- |
| `RTVITEM_INV_FLOW` | This table records the distribution detail of an RTV line item requested quantity at th... |
| `RTVREQ_MFQUEUE` | This table will be the queue where RTV Request integration messages await publication. |
| `RTVREQ_PUB_INFO` | This table helps in publication of the business transacation. It does this by tracking ... |
| `RTV_DETAIL` | This table contains item level details for items on the RTV order. |
| `RTV_HEAD` | This table contains header level information for all the Return to Vendor (RTV) orders. |
| `RTV_HEAD_CFA_EXT` | This is the custom flex attribute extension table for the entity RTV_HEAD. |

## Skill References Directory:
- [`references/BUSINESS_PROCESS_FLOWS.md`](file:///Volumes/Cabinet/Projects/RMS%20Skills/skills/rms_rtv_returns/references/BUSINESS_PROCESS_FLOWS.md): Official Oracle RRL 16 RRM 10 & 08 Return to Vendor (RTV) process flows, RMA authorization, stock holds, and credit claims.
- [`references/PRODUCT_ARCHITECTURE.md`](file:///Volumes/Cabinet/Projects/RMS%20Skills/skills/rms_rtv_returns/references/PRODUCT_ARCHITECTURE.md): RRA vendor return product domain architecture, SIM/WMS shipping topology, and RSG `RTVPub` message schemas.
- [`references/PHYSICAL_DATAMODEL.md`](file:///Volumes/Cabinet/Projects/RMS%20Skills/skills/rms_rtv_returns/references/PHYSICAL_DATAMODEL.md): Full DDL column definitions, data types, PKs, FKs, and column comments (6 tables).
- [`references/FUNCTIONAL_USER_GUIDE.md`](file:///Volumes/Cabinet/Projects/RMS%20Skills/skills/rms_rtv_returns/references/FUNCTIONAL_USER_GUIDE.md): Functional user guide workflows, operational lifecycles, and role dashboards.
- [`references/OPERATIONS_AND_BATCH_JOBS.md`](file:///Volumes/Cabinet/Projects/RMS%20Skills/skills/rms_rtv_returns/references/OPERATIONS_AND_BATCH_JOBS.md): Nightly batch jobs, C/Pro*C programs, restart/recovery logic, and RIB integration messages.
- [`references/SYSTEM_CONFIGURATIONS.md`](file:///Volumes/Cabinet/Projects/RMS%20Skills/skills/rms_rtv_returns/references/SYSTEM_CONFIGURATIONS.md): System configuration options (`SYSTEM_OPTIONS`), parameter flags, and setup rules.
