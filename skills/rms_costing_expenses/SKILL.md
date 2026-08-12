---
name: RMS Costing, Landed Cost & Expenses Datamodel
description: Physical schema tables for Oracle RMS Costing, Estimated Landed Cost (ELC), and Expenses (COST, CE, MC).
---

# RMS Costing, Landed Cost & Expenses Datamodel

Physical schema tables for Oracle RMS Costing, Estimated Landed Cost (ELC), and Expenses (COST, CE, MC).

Total Tables in Domain: **69** (Core Entities: `CE_CHARGES`, `CE_COMP_MIN_MAX`, `CE_FORMS`, `CE_HEAD`, `CE_LIC_VISA`, `CE_ORD_ITEM`, `CE_PROTEST`, `CE_SHIPMENT`)

## Core Business Entities Summary:
| Core Table Name | Business Description |
| :--- | :--- |
| `CE_CHARGES` | This table will hold the charges associated with an assigned Entry Number. |
| `CE_COMP_MIN_MAX` | This table should only contain assessment components for which a minimum and maximum ra... |
| `CE_FORMS` | This table will hold the forms associated with an assigned Entry Number. |
| `CE_HEAD` | This table will hold the header level information in the Customs Entry dialog. The CE_I... |
| `CE_LIC_VISA` | This table is used to store license and visa information for the Customs Entry item. |
| `CE_ORD_ITEM` | This table contains all Item level information need in clearing customs. |
| `CE_PROTEST` | This table will hold the protests associated with an assigned Entry Number. |
| `CE_SHIPMENT` | This table contains the Vessel/Voyage/Est. Depart Date level information for the Custom... |
| `CE_TEMP` | This table temporarily holds new ce_ids created in TRANS_FINALIZE_SQL. |
| `COMPHEAD` | This table contains one row for the company name. No index is associated with this tabl... |
| `COMPHEAD_TL` | This is the translation table for COMPHEAD table. The data in the base table is held in... |
| `COST_CHANGE_ACTIVE_DATE_TEMP` | RMS_COL_CPH_ACTIVE_DATE_AUR trigger will populate this table. This will hold records fo... |
| `COST_CHANGE_LOC_TEMP` | This temporary table holds the data retrieved for the data used by the SUPPSKU_LOC form... |
| `COST_CHANGE_TEMP` | This temporary table holds the data retrieved for the data used by the SUPPSKU form onl... |
| `COST_CHANGE_TEMP2` | Staging table for supplier cost change extract batch (sccext.pc) containing cost change... |

*... plus 54 additional auxiliary/work tables in `PHYSICAL_DATAMODEL.md`.*

## Skill References Directory:
- [`references/BUSINESS_PROCESS_FLOWS.md`](file:///Volumes/Cabinet/Projects/RMS%20Skills/skills/rms_costing_expenses/references/BUSINESS_PROCESS_FLOWS.md): Official Oracle RRL 16 RRM 06 & 09 Costing process flows, Estimated Landed Cost (ELC) formulas, and expense allocation rules.
- [`references/PRODUCT_ARCHITECTURE.md`](file:///Volumes/Cabinet/Projects/RMS%20Skills/skills/rms_costing_expenses/references/PRODUCT_ARCHITECTURE.md): RRA costing product domain architecture, Future Cost engine integration topology, and RSG RIB `CostChangePub` schemas.
- [`references/PHYSICAL_DATAMODEL.md`](file:///Volumes/Cabinet/Projects/RMS%20Skills/skills/rms_costing_expenses/references/PHYSICAL_DATAMODEL.md): Full DDL column definitions, data types, PKs, FKs, and column comments (69 tables).
- [`references/FUNCTIONAL_USER_GUIDE.md`](file:///Volumes/Cabinet/Projects/RMS%20Skills/skills/rms_costing_expenses/references/FUNCTIONAL_USER_GUIDE.md): Functional user guide workflows, operational lifecycles, and role dashboards.
- [`references/OPERATIONS_AND_BATCH_JOBS.md`](file:///Volumes/Cabinet/Projects/RMS%20Skills/skills/rms_costing_expenses/references/OPERATIONS_AND_BATCH_JOBS.md): Nightly batch jobs, C/Pro*C programs, restart/recovery logic, and RIB integration messages.
- [`references/SYSTEM_CONFIGURATIONS.md`](file:///Volumes/Cabinet/Projects/RMS%20Skills/skills/rms_costing_expenses/references/SYSTEM_CONFIGURATIONS.md): System configuration options (`SYSTEM_OPTIONS`), parameter flags, and setup rules.
