---
name: RMS System Codes, Currencies & Options Configuration Datamodel
description: Physical schema tables for Oracle RMS System Codes, Code Details, Currencies, Languages, and System Options (CODE_HEAD, CODE_DETAIL, CURRENCIES, SYSTEM_OPTIONS).
---

# RMS System Codes, Currencies & Options Configuration Datamodel

Physical schema tables for Oracle RMS System Codes, Code Details, Currencies, Languages, and System Options (CODE_HEAD, CODE_DETAIL, CURRENCIES, SYSTEM_OPTIONS).

Total Tables in Domain: **180** (Core Entities: `ARI_INTERFACE_TEST`, `BATCH_ERROR`, `CALENDAR`, `CODE_DETAIL`, `CODE_HEAD`, `CONCESSION_DATA`, `CONTEXT_HELP`, `CURRENCIES`)

## Core Business Entities Summary:
| Core Table Name | Business Description |
| :--- | :--- |
| `ARI_INTERFACE_TEST` | This table is used for testing the ARI API and for controling the interface behavior wh... |
| `BATCH_ERROR` | This table contains one row each error that occurs during the running of the Oracle Ret... |
| `CALENDAR` | This table contains one row for each 4_5_4 month. This table is populated by a UNIX scr... |
| `CODES_MFQUEUE` | This table tracks changes in RMS that need to be published to the RIB. |
| `CODE_DETAIL` | This table will contain code and decoded descriptions for each code type as defined in ... |
| `CODE_DETAIL_TL` | This is the translation table for CODE_DETAIL table. The data in the base table is held... |
| `CODE_HEAD` | This table contains one row for each different set of codes that is being defined. The ... |
| `CONCESSION_DATA` | This table holds the rolled up sales history for concession items along with the outsta... |
| `CONTEXT_HELP` | This table contains mappings between the context strings and context numbers required b... |
| `CURRENCIES` | This table contains one row for each currency used in the system. Whenever a currency d... |
| `CURRENCIES_TL` | This is the translation table for CURRENCIES table. The data in the base table is held ... |
| `CURRENCY_RATES` | This table contains the exchange rates for every currency used in the system. A currenc... |
| `CUSTOM_PKG_CONFIG` | This table holds the list of custom packages that should be executed dynamically for ea... |
| `DAY_LEVEL_CALENDAR` | Table used as reference to help with determining where a transaction fits into the fisc... |
| `DEBUG_CFG` | This table is used to set the debug process for the CFAS UI and related packages and li... |

*... plus 165 additional auxiliary/work tables in `PHYSICAL_DATAMODEL.md`.*

## Skill References Directory:
- [`references/PHYSICAL_DATAMODEL.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_system_codes_config/references/PHYSICAL_DATAMODEL.md): Full DDL column definitions, data types, PKs, FKs, and column comments (180 tables).
- [`references/FUNCTIONAL_USER_GUIDE.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_system_codes_config/references/FUNCTIONAL_USER_GUIDE.md): Functional user guide workflows, operational lifecycles, and role dashboards.
- [`references/OPERATIONS_AND_BATCH_JOBS.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_system_codes_config/references/OPERATIONS_AND_BATCH_JOBS.md): Nightly batch jobs, C/Pro*C programs, restart/recovery logic, and RIB integration messages.
- [`references/SYSTEM_CONFIGURATIONS.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_system_codes_config/references/SYSTEM_CONFIGURATIONS.md): System configuration options (`SYSTEM_OPTIONS`), parameter flags, and setup rules.
