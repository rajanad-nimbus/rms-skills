---
name: ReIM Invoice Matching & Invoicing Datamodel
description: Physical schema tables for Oracle Retail Invoice Matching (ReIM) and Invoicing (INVC_HEAD, INVC_DETAIL, INVC_MATCH_QUEUE, INVC_NON_MERCH).
---

# ReIM Invoice Matching & Invoicing Datamodel

Physical schema tables for Oracle Retail Invoice Matching (ReIM) and Invoicing (INVC_HEAD, INVC_DETAIL, INVC_MATCH_QUEUE, INVC_NON_MERCH).

Total Tables in Domain: **37** (Core Entities: `DOC`, `DOC_CLOSE_QUEUE`, `DOC_LINK`, `DOC_PURGE_QUEUE`, `IIF_DETAIL`, `IIF_DISCOUNT`, `IIF_HEAD`, `IIF_MATCH_DETAIL`)

## Core Business Entities Summary:
| Core Table Name | Business Description |
| :--- | :--- |
| `DOC` | This table is used to store strings of pre-written text to be attached to a given item ... |
| `DOC_CLOSE_QUEUE` | This table records unappointed receipts (POs, Transfer or Allocation). These records ha... |
| `DOC_CLOSE_QUEUE_TEMP` | This is a global temporary table used to hold filtered data from DOC_CLOSE_QUEUE. |
| `DOC_LINK` | This table is used to store the module and type of document that should be displayed in... |
| `DOC_PURGE_QUEUE` | This table contains the details of the transfers to be purged from the system. This tab... |
| `DOC_TL` | This is the translation table for DOC table. The data in the base table is held in data... |
| `IIF_DETAIL` | This table will hold one record for every SKU/receipt matched in the system, to be tran... |
| `IIF_DISCOUNT` | This staging table will hold any transaction-level discounts associated with the invoic... |
| `IIF_HEAD` | This table will hold a row for each invoice in the system that is to be transmitted to ... |
| `IIF_MATCH_DETAIL` | This table will hold match shipment information for each matched invoice line item. |
| `IIF_MERCH_VAT` | This table will hold the VAT cost codes and total amount that VAT code is applied to fo... |
| `IIF_NON_MERCH` | This table will hold all non-merchandise costs associated with each invoice, to be tran... |
| `INVC_DETAIL` | This table contains one row for each SKU on an invoice. When an invoice header is purge... |
| `INVC_DETAIL_TEMP` | This table contains one row for each SKU on an invoice. This table is written by the po... |
| `INVC_DETAIL_TEMP2` | This table is created to insert the data INVC_DETAIL data in posupld.pc batch to avoid ... |

*... plus 22 additional auxiliary/work tables in `PHYSICAL_DATAMODEL.md`.*

## Skill References Directory:
- [`references/BUSINESS_PROCESS_FLOWS.md`](file:///Volumes/Cabinet/Projects/RMS%20Skills/skills/reim_invoicing_matching/references/BUSINESS_PROCESS_FLOWS.md): Official Oracle RRL 16 RRM 17 Financial Control (ReIM) 3-way invoice matching rules and discrepancy resolution flows.
- [`references/PRODUCT_ARCHITECTURE.md`](file:///Volumes/Cabinet/Projects/RMS%20Skills/skills/reim_invoicing_matching/references/PRODUCT_ARCHITECTURE.md): RRA enterprise financial architecture, Payables AP integration topology, and RSG service schemas.
- [`references/PHYSICAL_DATAMODEL.md`](file:///Volumes/Cabinet/Projects/RMS%20Skills/skills/reim_invoicing_matching/references/PHYSICAL_DATAMODEL.md): Full DDL column definitions, data types, PKs, FKs, and column comments (37 tables).
- [`references/FUNCTIONAL_USER_GUIDE.md`](file:///Volumes/Cabinet/Projects/RMS%20Skills/skills/reim_invoicing_matching/references/FUNCTIONAL_USER_GUIDE.md): Functional user guide workflows, operational lifecycles, and role dashboards.
- [`references/OPERATIONS_AND_BATCH_JOBS.md`](file:///Volumes/Cabinet/Projects/RMS%20Skills/skills/reim_invoicing_matching/references/OPERATIONS_AND_BATCH_JOBS.md): Nightly batch jobs, C/Pro*C programs, restart/recovery logic, and RIB integration messages.
- [`references/SYSTEM_CONFIGURATIONS.md`](file:///Volumes/Cabinet/Projects/RMS%20Skills/skills/reim_invoicing_matching/references/SYSTEM_CONFIGURATIONS.md): System configuration options (`SYSTEM_OPTIONS`), parameter flags, and setup rules.
