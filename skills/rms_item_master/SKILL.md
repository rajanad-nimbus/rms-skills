---
name: RMS Item Master & Core Items Datamodel
description: Physical schema tables for Oracle RMS Item Master, Styles, SKUs, Item-Suppliers, Country Sourcing, and Item Tickets (ITEM_MASTER, ITEM_SUPPLIER, ITEM_SUPP_COUNTRY, ITEM_SEASONS).
---

# RMS Item Master & Core Items Datamodel

Physical schema tables for Oracle RMS Item Master, Styles, SKUs, Item-Suppliers, Country Sourcing, and Item Tickets (ITEM_MASTER, ITEM_SUPPLIER, ITEM_SUPP_COUNTRY, ITEM_SEASONS).

Total Tables in Domain: **18** (Core Entities: `BRAND`, `ITEM_MASTER`, `ITEM_MASTER_CFA_EXT`, `ITEM_SEASONS`, `ITEM_SUPP_COUNTRY`, `ITEM_SUPP_COUNTRY_BRACKET_COST`, `ITEM_SUPP_COUNTRY_CFA_EXT`, `ITEM_SUPP_COUNTRY_DIM`)

## Core Business Entities Summary:
| Core Table Name | Business Description |
| :--- | :--- |
| `BRAND` | With Cross channel integration, online order capture systems will like to display brand... |
| `BRAND_TL` | This is the translation table for BRAND table. The data in the base table is held in da... |
| `ITEM_MASTER` | This table holds all the main attributes and records for all items and pack items in RM... |
| `ITEM_MASTER_CFA_EXT` | This is the custom attribute extension table for the entity ITEM_MASTER. |
| `ITEM_MASTER_TL` | This is the translation table for ITEM_MASTER table. The data in the base table is held... |
| `ITEM_SEASONS` | This table will contain all seasons/phases for a given item. Any given item may have mu... |
| `ITEM_SUPP_COUNTRY` | This table holds all item supplier origin country relationships. |
| `ITEM_SUPP_COUNTRY_BRACKET_COST` | This table will contain the costs at the item/supplier/country/location level for each ... |
| `ITEM_SUPP_COUNTRY_CFA_EXT` | This is the custom attribute extension table for the entity ITEM_SUPP_COUNTRY. |
| `ITEM_SUPP_COUNTRY_DIM` | This table will hold dimensions of inner/case/pallet for each item/supplier/country com... |
| `ITEM_SUPP_COUNTRY_LOC` | This table will hold one record for each location associated with a given item/supplier... |
| `ITEM_SUPP_COUNTRY_LOC_CFA_EXT` | This is the custom attribute extension table for the entity ITEM_SUPP_COUNTRY. |
| `ITEM_SUPP_MANU_COUNTRY` | This table holds all item supplier country of manufacture relationships. |
| `ITEM_SUPP_UOM` | This table will be used to store the conversion value of an Item/Suppliers shipping car... |
| `ITEM_TICKET` | This table will hold all the valid ticket types associated with an item |

*... plus 3 additional auxiliary/work tables in `PHYSICAL_DATAMODEL.md`.*

## Skill References Directory:
- [`references/BUSINESS_PROCESS_FLOWS.md`](file:///Volumes/Cabinet/Projects/RMS%20Skills/skills/rms_item_master/references/BUSINESS_PROCESS_FLOWS.md): Official Oracle RRL 16 RRM 03 Item Foundation process flows, style-color matrix, supplier sourcing ranging, and item induction lifecycles.
- [`references/PRODUCT_ARCHITECTURE.md`](file:///Volumes/Cabinet/Projects/RMS%20Skills/skills/rms_item_master/references/PRODUCT_ARCHITECTURE.md): RRA merchandise foundation architecture, MDM PIM integration topology, and RSG RIB `ItemPub` message schemas.
- [`references/PHYSICAL_DATAMODEL.md`](file:///Volumes/Cabinet/Projects/RMS%20Skills/skills/rms_item_master/references/PHYSICAL_DATAMODEL.md): Full DDL column definitions, data types, PKs, FKs, and column comments (18 tables).
- [`references/FUNCTIONAL_USER_GUIDE.md`](file:///Volumes/Cabinet/Projects/RMS%20Skills/skills/rms_item_master/references/FUNCTIONAL_USER_GUIDE.md): Functional user guide workflows, operational lifecycles, and role dashboards.
- [`references/OPERATIONS_AND_BATCH_JOBS.md`](file:///Volumes/Cabinet/Projects/RMS%20Skills/skills/rms_item_master/references/OPERATIONS_AND_BATCH_JOBS.md): Nightly batch jobs, C/Pro*C programs, restart/recovery logic, and RIB integration messages.
- [`references/SYSTEM_CONFIGURATIONS.md`](file:///Volumes/Cabinet/Projects/RMS%20Skills/skills/rms_item_master/references/SYSTEM_CONFIGURATIONS.md): System configuration options (`SYSTEM_OPTIONS`), parameter flags, and setup rules.
