---
name: RMS Suppliers, Procurement & Partners Datamodel
description: Physical schema tables for Oracle RMS Supplier master data, Supplier Traits, Contracts, and Business Partners (SUPS, CONTRACT, PARTNER).
---

# RMS Suppliers, Procurement & Partners Datamodel

Physical schema tables for Oracle RMS Supplier master data, Supplier Traits, Contracts, and Business Partners (SUPS, CONTRACT, PARTNER).

Total Tables in Domain: **41** (Core Entities: `BUYER_WKSHT_MANUAL`, `CONTRACT_COST`, `CONTRACT_COST_HIST`, `CONTRACT_DETAIL`, `CONTRACT_HEADER`, `CONTRACT_ORDHEAD`, `CONTRACT_ORDLOC`, `CONTRACT_ORDSKU`)

## Core Business Entities Summary:
| Core Table Name | Business Description |
| :--- | :--- |
| `BUYER_WKSHT_MANUAL` | This table is used to store line items that were manually added through the Buyer Works... |
| `BUYER_WKSHT_PO_LIST_GTT` | Notes |
| `CONTRACT_COST` | This table will hold contract cost information for parent items(for all contract types)... |
| `CONTRACT_COST_HIST` | This table will hold the cost history of the items on contracts. |
| `CONTRACT_DETAIL` | This table will hold item-level contract information for contract type A and B. The cos... |
| `CONTRACT_HEADER` | This table contains one row for each contract placed within Oracle Retail. A contract i... |
| `CONTRACT_MATRIX_TEMP` | This table is a temporary table used by the Contract Distribution forms. This table con... |
| `CONTRACT_ORDHEAD` | This table is a temporary table used in the manual creation of orders against contracts... |
| `CONTRACT_ORDLOC` | This table is a temporary table used in the manual creation of orders against contracts... |
| `CONTRACT_ORDSKU` | This table is a temporary table used in the manual creation of orders against contracts... |
| `PARTNER` | This table is used to store partner detail information. Partners can include any outsid... |
| `PARTNER_CFA_EXT` | This is the custom attribute extension table for the entity PARTNER. |
| `PARTNER_L10N_EXT` | This is the LFAS storage table for the entity PARTNER |
| `PARTNER_MFQUEUE` | This table tracks changes in RMS that need to be published to the RIB. It is populated ... |
| `PARTNER_ORG_UNIT` | PARTNER_ORG_UNIT table will be the master table for Supplier/Supplier Site and Org Unit... |

*... plus 26 additional auxiliary/work tables in `PHYSICAL_DATAMODEL.md`.*

## Skill References Directory:
- [`references/PHYSICAL_DATAMODEL.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_suppliers_procurement/references/PHYSICAL_DATAMODEL.md): Full DDL column definitions, data types, PKs, FKs, and column comments (41 tables).
- [`references/FUNCTIONAL_USER_GUIDE.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_suppliers_procurement/references/FUNCTIONAL_USER_GUIDE.md): Functional user guide workflows, operational lifecycles, and role dashboards.
- [`references/OPERATIONS_AND_BATCH_JOBS.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_suppliers_procurement/references/OPERATIONS_AND_BATCH_JOBS.md): Nightly batch jobs, C/Pro*C programs, restart/recovery logic, and RIB integration messages.
- [`references/SYSTEM_CONFIGURATIONS.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_suppliers_procurement/references/SYSTEM_CONFIGURATIONS.md): System configuration options (`SYSTEM_OPTIONS`), parameter flags, and setup rules.
