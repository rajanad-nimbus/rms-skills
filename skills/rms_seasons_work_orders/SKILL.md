---
name: RMS Seasons & Work Orders Datamodel
description: Physical schema tables for Oracle RMS Seasons, Phases, Work Orders, and Delivery Slots (SEASONS, PHASES, WO, WORK_ORDER).
---

# RMS Seasons & Work Orders Datamodel

Physical schema tables for Oracle RMS Seasons, Phases, Work Orders, and Delivery Slots (SEASONS, PHASES, WO, WORK_ORDER).

Total Tables in Domain: **20** (Core Entities: `DELIVERY_SLOT`, `PHASES`, `SEASONS`, `WOOUT_PUB_INFO`, `WO_ACTIVITY`, `WO_DETAIL`, `WO_HEAD`, `WO_SKU_LOC`)

## Core Business Entities Summary:
| Core Table Name | Business Description |
| :--- | :--- |
| `DELIVERY_SLOT` | This table will contain generic delivery slots to be used by stores for a given day. |
| `DELIVERY_SLOT_MFQUEUE` | This table is used to store the the Delivery slot id that needs to published to externa... |
| `PHASES` | This table holds the description of the phases (sub-seasons) defined in RMS. |
| `PHASES_TL` | This is the translation table for PHASES table. The data in the base table is held in d... |
| `SEASONS` | This table holds the description of all the seasons defined in RMS. Seasons are specifi... |
| `SEASONS_TL` | This is the translation table for SEASONS table. The data in the base table is held in ... |
| `WOIN_MFQUEUE` | The message queue that keeps track of all of the events that occur on the WO_DETAIL table. |
| `WOOUT_MFQUEUE` | This table will be the queue where integration messages await publication. |
| `WOOUT_PUB_INFO` | This table helps in publication of the business transacation. It does this by tracking ... |
| `WO_ACTIVITY` | This table holds information for the work orders that can be attached to a transfer for... |
| `WO_ACTIVITY_TL` | This is the translation table for WO_ACTIVITY table. The data in the base table is held... |
| `WO_DETAIL` | This table holds the details for a work order associated with a PO. It will hold all it... |
| `WO_DETAIL_TEMP` | This is a temporary table which holds the details for a work order associated with a PO... |
| `WO_HEAD` | This table contains all work orders, both inbound and outbound, associated to an order ... |
| `WO_HEAD_TEMP` | This is a temporary table that contains all work orders, both inbound and outbound, ass... |

*... plus 5 additional auxiliary/work tables in `PHYSICAL_DATAMODEL.md`.*

## Skill References Directory:
- [`references/PHYSICAL_DATAMODEL.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_seasons_work_orders/references/PHYSICAL_DATAMODEL.md): Full DDL column definitions, data types, PKs, FKs, and column comments (20 tables).
- [`references/FUNCTIONAL_USER_GUIDE.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_seasons_work_orders/references/FUNCTIONAL_USER_GUIDE.md): Functional user guide workflows, operational lifecycles, and role dashboards.
- [`references/OPERATIONS_AND_BATCH_JOBS.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_seasons_work_orders/references/OPERATIONS_AND_BATCH_JOBS.md): Nightly batch jobs, C/Pro*C programs, restart/recovery logic, and RIB integration messages.
- [`references/SYSTEM_CONFIGURATIONS.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_seasons_work_orders/references/SYSTEM_CONFIGURATIONS.md): System configuration options (`SYSTEM_OPTIONS`), parameter flags, and setup rules.
