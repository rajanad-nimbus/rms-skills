---
name: RMS Item Location Ranging & Matrix Datamodel
description: Physical schema tables for Oracle RMS Item-Location Ranging, SOH by Location, Traits, and Tax configurations (ITEM_LOC, ITEM_LOC_SOH, ITEM_LOC_TRAIT, ITEM_LOC_TAX, ITEMLOC_MFQUEUE).
---

# RMS Item Location Ranging & Matrix Datamodel

Physical schema tables for Oracle RMS Item-Location Ranging, SOH by Location, Traits, and Tax configurations (ITEM_LOC, ITEM_LOC_SOH, ITEM_LOC_TRAIT, ITEM_LOC_TAX, ITEMLOC_MFQUEUE).

Total Tables in Domain: **9** (Core Entities: `ITEM_LOC`, `ITEM_LOC_CFA_EXT`, `ITEM_LOC_HIST`, `ITEM_LOC_HIST_MTH`, `ITEM_LOC_L10N_EXT`, `ITEM_LOC_SOH`, `ITEM_LOC_SOH_EOD`, `ITEM_LOC_TRAITS`)

## Core Business Entities Summary:
| Core Table Name | Business Description |
| :--- | :--- |
| `ITEMLOC_MFQUEUE` | This is a staging table for Item Location messages. It contains snapshots of columns on... |
| `ITEM_LOC` | This table contains one row for each item stocked at each location within the company. |
| `ITEM_LOC_CFA_EXT` | This is the custom attribute extension table for the entity ITEM_LOC. |
| `ITEM_LOC_HIST` | This table contains one row for each item/location/week/sales type combination. Sales h... |
| `ITEM_LOC_HIST_MTH` | This table holds item location history by month. |
| `ITEM_LOC_L10N_EXT` | This is the LFAS storage table for the entity ITEM_LOC |
| `ITEM_LOC_SOH` | This table contains one row of stock on hand information for each item stocked at a loc... |
| `ITEM_LOC_SOH_EOD` | This table holds the end-of-day position of inventory buckets at the item-location inte... |
| `ITEM_LOC_TRAITS` | This table contains one row of attributes for each item/location combination in the sys... |

## Skill References Directory:
- [`references/PHYSICAL_DATAMODEL.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_item_location/references/PHYSICAL_DATAMODEL.md): Full DDL column definitions, data types, PKs, FKs, and column comments (9 tables).
- [`references/FUNCTIONAL_USER_GUIDE.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_item_location/references/FUNCTIONAL_USER_GUIDE.md): Functional user guide workflows, operational lifecycles, and role dashboards.
- [`references/OPERATIONS_AND_BATCH_JOBS.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_item_location/references/OPERATIONS_AND_BATCH_JOBS.md): Nightly batch jobs, C/Pro*C programs, restart/recovery logic, and RIB integration messages.
- [`references/SYSTEM_CONFIGURATIONS.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_item_location/references/SYSTEM_CONFIGURATIONS.md): System configuration options (`SYSTEM_OPTIONS`), parameter flags, and setup rules.
