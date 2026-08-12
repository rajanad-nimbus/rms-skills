---
name: RMS Vendor Deals & Rebates Datamodel
description: Physical schema tables for Oracle RMS Vendor Deals, Rebates, Complex Deals, and Fixed Deals (DEAL_HEAD, DEAL_DETAIL, DEAL_ACTUALS).
---

# RMS Vendor Deals & Rebates Datamodel

Physical schema tables for Oracle RMS Vendor Deals, Rebates, Complex Deals, and Fixed Deals (DEAL_HEAD, DEAL_DETAIL, DEAL_ACTUALS).

Total Tables in Domain: **38** (Core Entities: `DEAL_ACTUALS_FORECAST`, `DEAL_ACTUALS_ITEM_LOC`, `DEAL_ATTRIB_DEF`, `DEAL_CALC_QUEUE`, `DEAL_COMP_PROM`, `DEAL_COMP_TYPE`, `DEAL_DETAIL`, `DEAL_HEAD`)

## Core Business Entities Summary:
| Core Table Name | Business Description |
| :--- | :--- |
| `DEALFCT_TEMP` | Temporary table for dealfct batch program |
| `DEAL_ACTUALS_FORECAST` | This table holds all the deal performance forecasts. There is one row per deal componen... |
| `DEAL_ACTUALS_ITEM_LOC` | This table holds all the deal performance actuals. There is one row per deal component ... |
| `DEAL_ATTRIB_DEF` | This table will hold the definitions of various deal attribute types. No user interface... |
| `DEAL_ATTRIB_DEF_TL` | This is the translation table for DEAL_ATTRIB_DEF table. The data in the base table is ... |
| `DEAL_BB_NO_REBATE_TEMP` | This table is used to hold the Billback No Rebate type of deal information in order to ... |
| `DEAL_BB_REBATE_PO_TEMP` | This table is used to hold the Billback Rebate Purchase Order type of deal information ... |
| `DEAL_BB_RECEIPT_SALES_TEMP` | This table is used to hold the Billback Rebate Sales and Receipts type of deal informat... |
| `DEAL_CALC_QUEUE` | This table will hold all POs that have been approved or have had deal applications requ... |
| `DEAL_CALC_QUEUE_TEMP` | The table is created to handle the locking problems in the sccext.pc batch when run in ... |
| `DEAL_COMP_PROM` | This table will contain records that are associated to multiple Vendor Funded Promotion... |
| `DEAL_COMP_TYPE` | This table will hold user-defined deal component types. A deal component type will be r... |
| `DEAL_COMP_TYPE_TL` | This table holds the translated descriptions of deal component type code in all languages. |
| `DEAL_DETAIL` | This table will hold deal component information for each deal. Deal component informati... |
| `DEAL_DETAIL_TEMP` | GLOBAL TEMPORARY TABLE ON COMMIT DELETE ROWS |

*... plus 23 additional auxiliary/work tables in `PHYSICAL_DATAMODEL.md`.*

## Skill References Directory:
- [`references/BUSINESS_PROCESS_FLOWS.md`](file:///Volumes/Cabinet/Projects/RMS%20Skills/skills/rms_deals_rebates/references/BUSINESS_PROCESS_FLOWS.md): Official Oracle RRL 16 RRM 08 Vendor & Deal Management process flows, threshold rebate calculations, and billback accruals.
- [`references/PRODUCT_ARCHITECTURE.md`](file:///Volumes/Cabinet/Projects/RMS%20Skills/skills/rms_deals_rebates/references/PRODUCT_ARCHITECTURE.md): RRA deals product domain architecture, ReIM billback integration topology, and RSG deal payload specs.
- [`references/PHYSICAL_DATAMODEL.md`](file:///Volumes/Cabinet/Projects/RMS%20Skills/skills/rms_deals_rebates/references/PHYSICAL_DATAMODEL.md): Full DDL column definitions, data types, PKs, FKs, and column comments (38 tables).
- [`references/FUNCTIONAL_USER_GUIDE.md`](file:///Volumes/Cabinet/Projects/RMS%20Skills/skills/rms_deals_rebates/references/FUNCTIONAL_USER_GUIDE.md): Functional user guide workflows, operational lifecycles, and role dashboards.
- [`references/OPERATIONS_AND_BATCH_JOBS.md`](file:///Volumes/Cabinet/Projects/RMS%20Skills/skills/rms_deals_rebates/references/OPERATIONS_AND_BATCH_JOBS.md): Nightly batch jobs, C/Pro*C programs, restart/recovery logic, and RIB integration messages.
- [`references/SYSTEM_CONFIGURATIONS.md`](file:///Volumes/Cabinet/Projects/RMS%20Skills/skills/rms_deals_rebates/references/SYSTEM_CONFIGURATIONS.md): System configuration options (`SYSTEM_OPTIONS`), parameter flags, and setup rules.
