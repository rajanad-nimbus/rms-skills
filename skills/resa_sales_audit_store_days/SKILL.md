---
name: ReSA Sales Audit Store Day Balances Datamodel
description: Physical schema tables for Oracle RMS Sales Audit Store Day Totals, Cashier Balancing, Bank Deposits, and Store Day Audits (SA_STORE_DAY, SA_TOTAL_HEAD, SA_TOTAL_ITEM, SA_BANK_*).
---

# ReSA Sales Audit Store Day Balances Datamodel

Physical schema tables for Oracle RMS Sales Audit Store Day Totals, Cashier Balancing, Bank Deposits, and Store Day Audits (SA_STORE_DAY, SA_TOTAL_HEAD, SA_TOTAL_ITEM, SA_BANK_*).

Total Tables in Domain: **15** (Core Entities: `SA_BALANCE_GROUP`, `SA_BANK_ACH`, `SA_BANK_STORE`, `SA_COMB_TOTAL`, `SA_POS_VALUE`, `SA_POS_VALUE_WKSHT`, `SA_STORE_DAY`, `SA_STORE_DAY_READ_LOCK`)

## Core Business Entities Summary:
| Core Table Name | Business Description |
| :--- | :--- |
| `SA_BALANCE_GROUP` | This table will hold the high-level information for transactions grouped at the defined... |
| `SA_BANK_ACH` | This table will contain totals for each PARTNER combination that has an entry in SA_STO... |
| `SA_BANK_STORE` | This table contains detail information about the bank. |
| `SA_COMB_TOTAL` | This table contains the details about the totals that are combined to create a combined... |
| `SA_POS_VALUE` | This table contains the pos value for a given total_value_seq_no and value_rev_no. |
| `SA_POS_VALUE_WKSHT` | The table will hold the pos uploaded values produced by totals that have not been appro... |
| `SA_STORE_DAY` | This table holds the status and details for each store/day combination. Store_day_ids a... |
| `SA_STORE_DAY_READ_LOCK` | This table contains records for all locks on store/days currently held in Sales Audit. ... |
| `SA_STORE_DAY_WRITE_LOCK` | This table contains records for all write locks on store/days currently held in Sales A... |
| `SA_TOTAL` | This table contains the the specific information for a total on a given store/day or st... |
| `SA_TOTAL_HEAD` | This table contains the header level information for totals calculations in the system. |
| `SA_TOTAL_HEAD_TL` | This is the translation table for SA_TOTAL_HEAD table. The data in the base table is he... |
| `SA_TOTAL_LOC_TRAIT` | This table contains the location traits associated with a given total. |
| `SA_TOTAL_RESTRICTIONS` | This table contains the restrictions that limit the application of totals calculations ... |
| `SA_TOTAL_USAGE` | This table contains the usages defined for a given total. |

## Skill References Directory:
- [`references/BUSINESS_PROCESS_FLOWS.md`](file:///Volumes/Cabinet/Projects/RMS%20Skills/skills/resa_sales_audit_store_days/references/BUSINESS_PROCESS_FLOWS.md): Official Oracle RRL 16 RRM 17 ReSA Store Day Audit process flows, cashier over/short balancing, and bank ACH reconciliation.
- [`references/PRODUCT_ARCHITECTURE.md`](file:///Volumes/Cabinet/Projects/RMS%20Skills/skills/resa_sales_audit_store_days/references/PRODUCT_ARCHITECTURE.md): RRA store day audit product domain architecture, General Ledger tender export topology, and RSG schemas.
- [`references/PHYSICAL_DATAMODEL.md`](file:///Volumes/Cabinet/Projects/RMS%20Skills/skills/resa_sales_audit_store_days/references/PHYSICAL_DATAMODEL.md): Full DDL column definitions, data types, PKs, FKs, and column comments (15 tables).
- [`references/FUNCTIONAL_USER_GUIDE.md`](file:///Volumes/Cabinet/Projects/RMS%20Skills/skills/resa_sales_audit_store_days/references/FUNCTIONAL_USER_GUIDE.md): Functional user guide workflows, operational lifecycles, and role dashboards.
- [`references/OPERATIONS_AND_BATCH_JOBS.md`](file:///Volumes/Cabinet/Projects/RMS%20Skills/skills/resa_sales_audit_store_days/references/OPERATIONS_AND_BATCH_JOBS.md): Nightly batch jobs, C/Pro*C programs, restart/recovery logic, and RIB integration messages.
- [`references/SYSTEM_CONFIGURATIONS.md`](file:///Volumes/Cabinet/Projects/RMS%20Skills/skills/resa_sales_audit_store_days/references/SYSTEM_CONFIGURATIONS.md): System configuration options (`SYSTEM_OPTIONS`), parameter flags, and setup rules.
