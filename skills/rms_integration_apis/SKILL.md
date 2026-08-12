---
name: RMS Integration APIs & RIB Interfaces Datamodel
description: Physical schema tables for Oracle RMS API Interfaces, Core Services, RIB Staging, and Data Exports (API, CORESVC, RIB, DATA_EXPORT).
---

# RMS Integration APIs & RIB Interfaces Datamodel

Physical schema tables for Oracle RMS API Interfaces, Core Services, RIB Staging, and Data Exports (API, CORESVC, RIB, DATA_EXPORT).

Total Tables in Domain: **32** (Core Entities: `API_ISCL`, `API_ITEM`, `API_PRICE_HIST`, `CORESVC_COSTCHG_CHUNKS`, `CORESVC_COSTCHG_CONFIG`, `CORESVC_COSTCHG_ERR`, `CORESVC_ERROR_MAPPING`, `CORESVC_ITEM_CONFIG`)

## Core Business Entities Summary:
| Core Table Name | Business Description |
| :--- | :--- |
| `API_ALLOC_INFO_TEMP` | This table temporarily holds allocation information to improve performance. |
| `API_ISCL` | This table will aid in API processing of item_supplier_country and item_supplier_countr... |
| `API_ITEM` | This table is used to store queried items instead of using the ITEM_MASTER table to joi... |
| `API_ITEM_LOC_TEMP` | This is a global temporary table that contains item/location information for API proces... |
| `API_ITEM_TEMP` | This temporary table is used to store queried items instead of using the ITEM_MASTER ta... |
| `API_LOC_TEMP` | This temporary table holds all the locations that result from the organization hierarch... |
| `API_ORIG_RETAIL_TEMP` | This is a global temporary table that stores original unit retail for item/loc. The dat... |
| `API_PC_TEMP` | This is a global temporary table. The data is deleted upon commit. |
| `API_PRICE_CHANGE_TEMP` | This global temporary table is used for storing item location information for price cha... |
| `API_PRICE_HIST` | A table to contain price history details to aid processing updates and inserts to the p... |
| `API_PRICE_HIST_TEMP` | This is a temporary table that contains price history details to aid processing updates... |
| `API_VAT_TEMP` | This is a global temporary table for storing vat_rates for an item/location. The record... |
| `CORESVC_COSTCHG_CHUNKS` | This table is used to contain information about chunks that are used to process costcha... |
| `CORESVC_COSTCHG_CONFIG` | This is the configuration table for cost change service. This table always contains one... |
| `CORESVC_COSTCHG_ERR` | This table contains errors encountered while processing cost changes through item induc... |

*... plus 17 additional auxiliary/work tables in `PHYSICAL_DATAMODEL.md`.*

## Skill References Directory:
- [`references/PHYSICAL_DATAMODEL.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_integration_apis/references/PHYSICAL_DATAMODEL.md): Full DDL column definitions, data types, PKs, FKs, and column comments (32 tables).
- [`references/FUNCTIONAL_USER_GUIDE.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_integration_apis/references/FUNCTIONAL_USER_GUIDE.md): Functional user guide workflows, operational lifecycles, and role dashboards.
- [`references/OPERATIONS_AND_BATCH_JOBS.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_integration_apis/references/OPERATIONS_AND_BATCH_JOBS.md): Nightly batch jobs, C/Pro*C programs, restart/recovery logic, and RIB integration messages.
- [`references/SYSTEM_CONFIGURATIONS.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_integration_apis/references/SYSTEM_CONFIGURATIONS.md): System configuration options (`SYSTEM_OPTIONS`), parameter flags, and setup rules.
