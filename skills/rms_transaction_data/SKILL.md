---
name: RMS Transaction Data & Financial Postings Datamodel
description: Physical schema tables for Oracle RMS Stock Ledger Transaction Postings, Historical Financial Transactions, and Transaction Codes.
---

# RMS Transaction Data & Financial Postings Datamodel

Physical schema tables for Oracle RMS Stock Ledger Transaction Postings, Historical Financial Transactions, and Transaction Codes.

Total Tables in Domain: **9** (Core Entities: `IF_TRAN_DATA`, `TRAN_DATA_A`, `TRAN_DATA_B`, `TRAN_DATA_CODES`, `TRAN_DATA_CODES_REF`, `TRAN_DATA_HISTORY`)

## Core Business Entities Summary:
| Core Table Name | Business Description |
| :--- | :--- |
| `IF_TRAN_DATA` | This table is a staging table for financial interface and mirrors tran_data. |
| `IF_TRAN_DATA_TEMP` | Temporary table used by AIP RETL extract scripts. Contains locations that had transacti... |
| `TRAN_DATA_A` | This table holds the stock ledger financial transaction data that are generated through... |
| `TRAN_DATA_B` | This table holds the stock ledger financial transaction data that are generated through... |
| `TRAN_DATA_CODES` | This table holds unique numeric values identifying different transactions posted in the... |
| `TRAN_DATA_CODES_REF` | This table is used to define the values for reference fields (REF_NO_1, REF_NO_2 and GL... |
| `TRAN_DATA_CODES_REF_TL` | This is the translation table for TRAN_DATA_CODES_REF table. The data in the base table... |
| `TRAN_DATA_CODES_TL` | This is the translation table for TRAN_DATA_CODES table. The data in the base table is ... |
| `TRAN_DATA_HISTORY` | PARTITIONED BY RANGE(POST_DATE) |

## Skill References Directory:
- [`references/PHYSICAL_DATAMODEL.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_transaction_data/references/PHYSICAL_DATAMODEL.md): Full DDL column definitions, data types, PKs, FKs, and column comments (9 tables).
- [`references/FUNCTIONAL_USER_GUIDE.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_transaction_data/references/FUNCTIONAL_USER_GUIDE.md): Functional user guide workflows, operational lifecycles, and role dashboards.
- [`references/OPERATIONS_AND_BATCH_JOBS.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_transaction_data/references/OPERATIONS_AND_BATCH_JOBS.md): Nightly batch jobs, C/Pro*C programs, restart/recovery logic, and RIB integration messages.
- [`references/SYSTEM_CONFIGURATIONS.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_transaction_data/references/SYSTEM_CONFIGURATIONS.md): System configuration options (`SYSTEM_OPTIONS`), parameter flags, and setup rules.
