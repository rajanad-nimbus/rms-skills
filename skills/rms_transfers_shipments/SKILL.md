---
name: RMS Transfers, ASNs & Shipments Datamodel
description: Physical schema tables for Oracle RMS Inventory Transfers (TSF), Shipments (SHIP, SHIPSKU), ASNs, and Bills of Lading (BOL).
---

# RMS Transfers, ASNs & Shipments Datamodel

Physical schema tables for Oracle RMS Inventory Transfers (TSF), Shipments (SHIP, SHIPSKU), ASNs, and Bills of Lading (BOL).

Total Tables in Domain: **54** (Core Entities: `APPT_DETAIL`, `APPT_HEAD`, `BOL_SHIPMENT`, `BOL_SHIPSKU`, `RECEIVING`, `RECEIVING_LOG`, `SHIPITEM_INV_FLOW`, `SHIPMENT`)

## Core Business Entities Summary:
| Core Table Name | Business Description |
| :--- | :--- |
| `APPT_DETAIL` | This table contains detail-level information for warehouse generated appointments. It i... |
| `APPT_HEAD` | This table contains header-level information for warehouse-generated appointments. It i... |
| `BOL_DISTRO_ITEMS_TEMP` | This global temporary table is used to aid setting up items for the bolshipment form. T... |
| `BOL_SHIPMENT` | This table will serve as a staging table for BOL shipments prior to shipping. |
| `BOL_SHIPSKU` | This table will serve as staging table for BOL shipments prior to shipping. This will c... |
| `RECEIVE_ITEMS_GTT` | This global temporary table is used to support the Receive By Item screen. It holds the... |
| `RECEIVING` | This table is used for recording details of receiving for a shipment for each order loc... |
| `RECEIVING_LOG` | This table contains duplicate carton information when RMS receives a duplicate allocati... |
| `SHIPITEM_INV_FLOW` | This table will hold the details of how the shipment line item flows (i.e. maps) betwee... |
| `SHIPMENT` | This table contains one row for each shipment within the system. Base information about... |
| `SHIPMENT_PUB_INFO` | This table is used for publishing shipments for Tranfers and Allocations created in RMS... |
| `SHIPMENT_PUB_TEMP` | This is a session specific global temporary table that will assist the publishing of sh... |
| `SHIPMENT_PURGE_TEMP` | This table is used to hold shipments for the transfers picked by batch tsfprg.pc for pu... |
| `SHIPMENT_TMP` | This table is used to assist the V_SHIPMENT view in returning shipment information on t... |
| `SHIPSKU` | This table contains one row for each shipment/SKU combination in the system. When a shi... |

*... plus 39 additional auxiliary/work tables in `PHYSICAL_DATAMODEL.md`.*

## Skill References Directory:
- [`references/PHYSICAL_DATAMODEL.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_transfers_shipments/references/PHYSICAL_DATAMODEL.md): Full DDL column definitions, data types, PKs, FKs, and column comments (54 tables).
- [`references/FUNCTIONAL_USER_GUIDE.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_transfers_shipments/references/FUNCTIONAL_USER_GUIDE.md): Functional user guide workflows, operational lifecycles, and role dashboards.
- [`references/OPERATIONS_AND_BATCH_JOBS.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_transfers_shipments/references/OPERATIONS_AND_BATCH_JOBS.md): Nightly batch jobs, C/Pro*C programs, restart/recovery logic, and RIB integration messages.
- [`references/SYSTEM_CONFIGURATIONS.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_transfers_shipments/references/SYSTEM_CONFIGURATIONS.md): System configuration options (`SYSTEM_OPTIONS`), parameter flags, and setup rules.
