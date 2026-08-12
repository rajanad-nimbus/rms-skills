---
name: RMS Item Location Ranging & Matrix Datamodel
description: Physical schema tables for Oracle RMS Item-Location Ranging matrix, Traits, and Location Ranging configurations (ITEM_LOC, ITEM_LOC_TRAITS, ITEMLOC_MFQUEUE).
---

# RMS Item Location Ranging & Matrix Datamodel

Physical schema tables for Oracle RMS Item-Location Ranging matrix, Traits, and Location Ranging configurations (ITEM_LOC, ITEM_LOC_TRAITS, ITEMLOC_MFQUEUE). Perpetual Stock-on-Hand inventory positions (`ITEM_LOC_SOH`) are managed in **[`rms_inventory`](file:///Volumes/Cabinet/Projects/RMS%20Skills/skills/rms_inventory/SKILL.md)**.

Total Tables in Domain: **7** (Core Entities: `ITEM_LOC`, `ITEM_LOC_CFA_EXT`, `ITEM_LOC_HIST`, `ITEM_LOC_HIST_MTH`, `ITEM_LOC_L10N_EXT`, `ITEM_LOC_TRAITS`, `ITEMLOC_MFQUEUE`)

## Core Business Entities Summary:
| Core Table Name | Business Description |
| :--- | :--- |
| `ITEM_LOC` | Master item-location ranging matrix table containing one row for each item ranged at a location. |
| `ITEMLOC_MFQUEUE` | This is a staging table for Item Location ranging messages. It contains snapshots of columns on... |
| `ITEM_LOC_CFA_EXT` | This is the custom attribute extension table for the entity ITEM_LOC. |
| `ITEM_LOC_HIST` | This table contains one row for each item/location/week/sales type combination. |
| `ITEM_LOC_HIST_MTH` | This table holds item location history by month. |
| `ITEM_LOC_L10N_EXT` | This is the LFAS storage table for the entity ITEM_LOC |
| `ITEM_LOC_TRAITS` | This table contains one row of attributes for each item/location combination in the system. |

## Skill References Directory:
- [`references/PHYSICAL_DATAMODEL.md`](file:///Volumes/Cabinet/Projects/RMS%20Skills/skills/rms_item_location/references/PHYSICAL_DATAMODEL.md): Full DDL column definitions, data types, PKs, FKs, and column comments (7 tables).
- [`references/FUNCTIONAL_USER_GUIDE.md`](file:///Volumes/Cabinet/Projects/RMS%20Skills/skills/rms_item_location/references/FUNCTIONAL_USER_GUIDE.md): Functional user guide workflows, operational lifecycles, and role dashboards.
- [`references/OPERATIONS_AND_BATCH_JOBS.md`](file:///Volumes/Cabinet/Projects/RMS%20Skills/skills/rms_item_location/references/OPERATIONS_AND_BATCH_JOBS.md): Nightly batch jobs, C/Pro*C programs, restart/recovery logic, and RIB integration messages.
- [`references/SYSTEM_CONFIGURATIONS.md`](file:///Volumes/Cabinet/Projects/RMS%20Skills/skills/rms_item_location/references/SYSTEM_CONFIGURATIONS.md): System configuration options (`SYSTEM_OPTIONS`), parameter flags, and setup rules.
