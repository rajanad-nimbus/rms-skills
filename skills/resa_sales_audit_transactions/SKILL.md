---
name: ReSA Sales Audit POS Transactions Datamodel
description: Physical schema tables for Oracle RMS Sales Audit POS Transactions, Headers, Line Items, Customer Data, and POS Coupons (SA_TRAN_HEAD, SA_TRAN_ITEM, SA_TRAN_TENDER, POS_*).
---

# ReSA Sales Audit POS Transactions Datamodel

Physical schema tables for Oracle RMS Sales Audit POS Transactions, Headers, Line Items, Customer Data, and POS Coupons (SA_TRAN_HEAD, SA_TRAN_ITEM, SA_TRAN_TENDER, POS_*).

Total Tables in Domain: **29** (Core Entities: `POS_CONFIG_ITEMS`, `POS_COUPON_HEAD`, `POS_DAY_TIME_DATE`, `POS_MERCH_CRITERIA`, `POS_MODS_TAX_INFO`, `POS_PROD_REST_HEAD`, `POS_STORE`, `POS_TENDER_TYPE_HEAD`)

## Core Business Entities Summary:
| Core Table Name | Business Description |
| :--- | :--- |
| `POS_CONFIG_ITEMS` | This table holds any new or reclassified items that now fit into a merchandise criteria... |
| `POS_COUPON_HEAD` | This table holds the detailed coupon information such as accounting classifications (pr... |
| `POS_COUPON_HEAD_TL` | This is the translation table for POS_COUPON_HEAD table. The data in the base table is ... |
| `POS_DAY_TIME_DATE` | This table holds the day, time and date information that is associated to a Day/Time/Da... |
| `POS_MERCH_CRITERIA` | This table holds the merchandise criteria used to select items that are associated with... |
| `POS_MODS_TAX_INFO` | This table will hold the Tax details of items when the default tax type of the system i... |
| `POS_PROD_REST_HEAD` | pos_prod_rest_head - This table holds the product restriction details for all types of ... |
| `POS_STORE` | This table holds the specific stores associated with a POS configuration. In addition, ... |
| `POS_TENDER_TYPE_HEAD` | This table holds the tender type details for all tender payment types. Tender type grou... |
| `POS_TENDER_TYPE_HEAD_TL` | This is the translation table for POS_TENDER_TYPE_HEAD table. The data in the base tabl... |
| `SA_CUSTOMER` | This is a new table that contains customer details. |
| `SA_CUST_ATTRIB` | This table contains user-defined attributes of a given customer. |
| `SA_TRAN_DISC` | This table contains all taxes associated with a transaction. |
| `SA_TRAN_DISC_REV` | This table contains all revisions to discount values associated with an item. |
| `SA_TRAN_HEAD` | This table will hold base level information about each transaction processed in the Ora... |

*... plus 14 additional auxiliary/work tables in `PHYSICAL_DATAMODEL.md`.*

## Skill References Directory:
- [`references/BUSINESS_PROCESS_FLOWS.md`](file:///Volumes/Cabinet/Projects/RMS%20Skills/skills/resa_sales_audit_transactions/references/BUSINESS_PROCESS_FLOWS.md): Official Oracle RRL 16 RRM 13 Store Operations & RRM 17 ReSA auditing process flows and error revision rules.
- [`references/PRODUCT_ARCHITECTURE.md`](file:///Volumes/Cabinet/Projects/RMS%20Skills/skills/resa_sales_audit_transactions/references/PRODUCT_ARCHITECTURE.md): RRA POS store transaction architecture, Stock Ledger integration topology, and RSG RTLog schemas.
- [`references/PHYSICAL_DATAMODEL.md`](file:///Volumes/Cabinet/Projects/RMS%20Skills/skills/resa_sales_audit_transactions/references/PHYSICAL_DATAMODEL.md): Full DDL column definitions, data types, PKs, FKs, and column comments (29 tables).
- [`references/FUNCTIONAL_USER_GUIDE.md`](file:///Volumes/Cabinet/Projects/RMS%20Skills/skills/resa_sales_audit_transactions/references/FUNCTIONAL_USER_GUIDE.md): Functional user guide workflows, operational lifecycles, and role dashboards.
- [`references/OPERATIONS_AND_BATCH_JOBS.md`](file:///Volumes/Cabinet/Projects/RMS%20Skills/skills/resa_sales_audit_transactions/references/OPERATIONS_AND_BATCH_JOBS.md): Nightly batch jobs, C/Pro*C programs, restart/recovery logic, and RIB integration messages.
- [`references/SYSTEM_CONFIGURATIONS.md`](file:///Volumes/Cabinet/Projects/RMS%20Skills/skills/resa_sales_audit_transactions/references/SYSTEM_CONFIGURATIONS.md): System configuration options (`SYSTEM_OPTIONS`), parameter flags, and setup rules.
