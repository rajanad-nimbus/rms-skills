---
name: RMS Import Management, Customs & Letters of Credit Datamodel
description: Physical schema tables for Oracle RMS Import Management, Letters of Credit (LC), Customs Entry, Freight Terms, and Country Attributes.
---

# RMS Import Management, Customs & Letters of Credit Datamodel

Physical schema tables for Oracle RMS Import Management, Letters of Credit (LC), Customs Entry, Freight Terms, and Country Attributes.

Total Tables in Domain: **39** (Core Entities: `COND_TARIFF_TREATMENT`, `COUNTRY`, `COUNTRY_ATTRIB`, `COUNTRY_L10N_EXT`, `COUNTRY_TARIFF_TREATMENT`, `COUNTRY_TAX_JURISDICTION`, `CVB_DETAIL`, `CVB_HEAD`)

## Core Business Entities Summary:
| Core Table Name | Business Description |
| :--- | :--- |
| `COND_TARIFF_TREATMENT` | This table is used to store the list of conditional tariff treatments that relate to a ... |
| `COUNTRY` | This table contains one row for each country defined within Oracle Retail. |
| `COUNTRY_ATTRIB` | This table will be created to hold the country level attributes. |
| `COUNTRY_L10N_EXT` | This is the LFAS storage table for the entity COUNTRY |
| `COUNTRY_TARIFF_TREATMENT` | Contains a number that uniquely identifies the country. |
| `COUNTRY_TAX_JURISDICTION` | This table will hold tax jurisdiction information for a country-state relationship. |
| `COUNTRY_TL` | This is the translation table for COUNTRY table. The data in the base table is held in ... |
| `CVB_DETAIL` | This table holds the Computation Value Base header information. |
| `CVB_HEAD` | This table holds the Computation Value Base detail information. This information indica... |
| `CVB_HEAD_TL` | This is the translation table for CVB_HEAD table. The data in the base table is held in... |
| `ENTRY_STATUS` | This table will hold the possible entry status for any import country. |
| `ENTRY_STATUS_TL` | This is the translation table for ENTRY_STATUS table. The data in the base table is hel... |
| `ENTRY_TYPE` | This table will hold the possible entry types for any import country. |
| `ENTRY_TYPE_TL` | This is the translation table for ENTRY_TYPE table. The data in the base table is held ... |
| `FREIGHT_SIZE` | This table is used to store freight sizes that will be attached to Transportation records. |

*... plus 24 additional auxiliary/work tables in `PHYSICAL_DATAMODEL.md`.*

## Skill References Directory:
- [`references/PHYSICAL_DATAMODEL.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_import_customs/references/PHYSICAL_DATAMODEL.md): Full DDL column definitions, data types, PKs, FKs, and column comments (39 tables).
- [`references/FUNCTIONAL_USER_GUIDE.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_import_customs/references/FUNCTIONAL_USER_GUIDE.md): Functional user guide workflows, operational lifecycles, and role dashboards.
- [`references/OPERATIONS_AND_BATCH_JOBS.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_import_customs/references/OPERATIONS_AND_BATCH_JOBS.md): Nightly batch jobs, C/Pro*C programs, restart/recovery logic, and RIB integration messages.
- [`references/SYSTEM_CONFIGURATIONS.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_import_customs/references/SYSTEM_CONFIGURATIONS.md): System configuration options (`SYSTEM_OPTIONS`), parameter flags, and setup rules.
