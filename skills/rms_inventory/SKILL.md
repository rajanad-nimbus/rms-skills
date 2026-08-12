---
name: RMS Inventory & Stocktake Datamodel
description: Physical schema tables for Oracle RMS Inventory positions, SOH (Stock on Hand), Stocktake (STAKE), Stock In-Transit (SIT), RTV Inventory (MRT), Unavailable Inventory, and Adjustments.
---

# RMS Inventory & Stocktake Datamodel

Physical schema tables for Oracle RMS Inventory positions, SOH (Stock on Hand), Stocktake (STAKE), Stock In-Transit (SIT), RTV Inventory (MRT), Unavailable Inventory, and Adjustments.

Total Tables in Domain: **35** (Core Entities: `CARTON`, `INV_ADJ`, `INV_ADJ_REASON`, `INV_MOVE_UNIT_OPTIONS`, `INV_STATUS_CODES`, `INV_STATUS_QTY`, `INV_STATUS_TYPES`, `INV_TRACK_UNIT_OPTIONS`)

## Core Business Entities Summary:
| Core Table Name | Business Description |
| :--- | :--- |
| `CARTON` | This table will hold a record for each carton to the destination location. A carton can... |
| `INV_ADJ` | This table will contain and audit trail for inventory adjustment. |
| `INV_ADJ_REASON` | This table will hold reasons for inventory adjustments. |
| `INV_ADJ_REASON_TL` | This table holds the translated descriptions of inventory adjustment reason codes in al... |
| `INV_MOVE_UNIT_OPTIONS` | This table contains parameters used to control the behavior of RMS related to inventory... |
| `INV_RESV_UPDATE_TEMP` | This temporary table is used for inventory feed to AIP. This holds the location which h... |
| `INV_STATUS_CODES` | This table will contain valid inventory status codes |
| `INV_STATUS_CODES_TL` | This table holds the translated descriptions of inventory status codes in all languages. |
| `INV_STATUS_QTY` | For any non-salable merchandise at a specific location, this table will hold the item, ... |
| `INV_STATUS_TYPES` | This table will contain valid inventory types for non-salable merchandise. |
| `INV_STATUS_TYPES_TL` | This table holds the translated descriptions of inventory status types in all languages. |
| `INV_TRACK_UNIT_OPTIONS` | This table contains parameters used to control the behavior of RMS related to inventory... |
| `MRT` | This table supports the concept of a Mass Return Transfer Number and other attributes t... |
| `MRT_ITEM` | This table supports the concept of a Mass Return Transfer Number and other attributes t... |
| `MRT_ITEM_LOC` | This table supports the concept of a Mass Return Transfer Number and other attributes t... |

*... plus 20 additional auxiliary/work tables in `PHYSICAL_DATAMODEL.md`.*

## Skill References Directory:
- [`references/PHYSICAL_DATAMODEL.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_inventory/references/PHYSICAL_DATAMODEL.md): Full DDL column definitions, data types, PKs, FKs, and column comments (35 tables).
- [`references/FUNCTIONAL_USER_GUIDE.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_inventory/references/FUNCTIONAL_USER_GUIDE.md): Functional user guide workflows, operational lifecycles, and role dashboards.
- [`references/OPERATIONS_AND_BATCH_JOBS.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_inventory/references/OPERATIONS_AND_BATCH_JOBS.md): Nightly batch jobs, C/Pro*C programs, restart/recovery logic, and RIB integration messages.
- [`references/SYSTEM_CONFIGURATIONS.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_inventory/references/SYSTEM_CONFIGURATIONS.md): System configuration options (`SYSTEM_OPTIONS`), parameter flags, and setup rules.
