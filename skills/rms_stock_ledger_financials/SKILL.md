---
name: RMS Stock Ledger & Financial Accounting Datamodel
description: Physical schema tables for Oracle RMS Stock Ledger, Open to Buy (OTB), Financial GL Integration (FIF), and Wholesale Financials.
---

# RMS Stock Ledger & Financial Accounting Datamodel

Physical schema tables for Oracle RMS Stock Ledger, Open to Buy (OTB), Financial GL Integration (FIF), and Wholesale Financials.

Total Tables in Domain: **47** (Core Entities: `DISC_OTB_APPLY`, `FIF_CLASS`, `FIF_CURRENCY_XREF`, `FIF_DEPS`, `FIF_GL_ACCT`, `FIF_GL_CROSS_REF`, `FIF_GL_DATA`, `FIF_GL_SETUP`)

## Core Business Entities Summary:
| Core Table Name | Business Description |
| :--- | :--- |
| `DISC_OTB_APPLY` | This table contains the original and new values applied against open to buy (OTB) budge... |
| `FIF_CLASS` | This table contains one row for each class for which an insert, update, or delete to th... |
| `FIF_CURRENCY_XREF` | This table is used to cross reference exchange rate type defined by RMS and external fi... |
| `FIF_DEPS` | This table contains one row for each department for which an insert, update, or delete ... |
| `FIF_GL_ACCT` | This table will hold all the account related information which will be bridged across f... |
| `FIF_GL_CROSS_REF` | Will be populated by the form glcrossr.fmt. It maps Oracle Retail mapping fields (dept,... |
| `FIF_GL_DATA` | This table is used for staging data from MONTH_DATA and TRAN_DATA to a General Ledger i... |
| `FIF_GL_SETUP` | This table is used to hold all the intial set-up information pertaining to Financial Ap... |
| `FIF_GL_SETUP_L10N_EXT` | This table will store the fiscal attributes at the Set of Books level. This table will ... |
| `FIF_INVC_DETAILS_EXPORT` | This table will hold a row of each SKU or type of non_merchandise cost associated on an... |
| `FIF_INVC_HEADERS_EXPORT` | This table will hold a row of each ready to paid invoice in the system that is to be tr... |
| `FIF_LINE_TYPE_XREF` | Description of the table: A cross reference table used to map the Line type of the Fina... |
| `FIF_SUBCLASS` | This table contains one row for each subclass for which an insert, update, or delete to... |
| `FINANCIAL_UNIT_OPTIONS` | This table contains attributes that affect how financial data is captured for both stoc... |
| `KEY_MAP_GL` | This table contains the reference key details of the GL records that are written to stg... |

*... plus 32 additional auxiliary/work tables in `PHYSICAL_DATAMODEL.md`.*

## Skill References Directory:
- [`references/BUSINESS_PROCESS_FLOWS.md`](file:///Volumes/Cabinet/Projects/RMS%20Skills/skills/rms_stock_ledger_financials/references/BUSINESS_PROCESS_FLOWS.md): Official Oracle RRL 16 RRM 17 Stock Ledger process flows, retail vs cost accounting methods, and GL journal posting rules.
- [`references/PRODUCT_ARCHITECTURE.md`](file:///Volumes/Cabinet/Projects/RMS%20Skills/skills/rms_stock_ledger_financials/references/PRODUCT_ARCHITECTURE.md): RRA financial accounting architecture, GL cross-reference topology (`FIF_GL_CROSS_REF`), and RSG GL schemas.
- [`references/PHYSICAL_DATAMODEL.md`](file:///Volumes/Cabinet/Projects/RMS%20Skills/skills/rms_stock_ledger_financials/references/PHYSICAL_DATAMODEL.md): Full DDL column definitions, data types, PKs, FKs, and column comments (47 tables).
- [`references/FUNCTIONAL_USER_GUIDE.md`](file:///Volumes/Cabinet/Projects/RMS%20Skills/skills/rms_stock_ledger_financials/references/FUNCTIONAL_USER_GUIDE.md): Functional user guide workflows, operational lifecycles, and role dashboards.
- [`references/OPERATIONS_AND_BATCH_JOBS.md`](file:///Volumes/Cabinet/Projects/RMS%20Skills/skills/rms_stock_ledger_financials/references/OPERATIONS_AND_BATCH_JOBS.md): Nightly batch jobs, C/Pro*C programs, restart/recovery logic, and RIB integration messages.
- [`references/SYSTEM_CONFIGURATIONS.md`](file:///Volumes/Cabinet/Projects/RMS%20Skills/skills/rms_stock_ledger_financials/references/SYSTEM_CONFIGURATIONS.md): System configuration options (`SYSTEM_OPTIONS`), parameter flags, and setup rules.
