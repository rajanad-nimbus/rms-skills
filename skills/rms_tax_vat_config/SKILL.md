---
name: RMS Tax & VAT Configuration Datamodel
description: Physical schema tables for Oracle RMS Value Added Tax (VAT), Tax Jurisdictions, Tax Codes, Tax Rules, and Tax Calculation Engine.
---

# RMS Tax & VAT Configuration Datamodel

Physical schema tables for Oracle RMS Value Added Tax (VAT), Tax Jurisdictions, Tax Codes, Tax Rules, and Tax Calculation Engine.

Total Tables in Domain: **13** (Core Entities: `GTAX_ITEM_ROLLUP`, `TAX_CALC_EVENT`, `TAX_EVENT_RUN_TYPE`, `VAT_CODES`, `VAT_CODES_CFA_EXT`, `VAT_CODE_RATES`, `VAT_DEPS`, `VAT_EXPORT_STG`)

## Core Business Entities Summary:
| Core Table Name | Business Description |
| :--- | :--- |
| `GTAX_ITEM_ROLLUP` | This table holds the cumulative retail tax of the item locatoin on an effective date. I... |
| `TAX_CALC_EVENT` | This table holds the details of the tax event when the tax event is to be processed in ... |
| `TAX_EVENT_RUN_TYPE` | This table will hold the mode in which the different tax events should be executed. For... |
| `VAT_CODES` | This table contains one row for each VAT code. The VAT code is used to determine which ... |
| `VAT_CODES_CFA_EXT` | This is the custom attribute extension table for the entity VAT_CODES. |
| `VAT_CODES_TL` | This is the translation table for VAT_CODES table. The data in the base table is held i... |
| `VAT_CODE_RATES` | This table will hold VAT rates and active dates for each VAT code in the system. Each V... |
| `VAT_DEPS` | Notes |
| `VAT_EXPORT_STG` | This is table is a staging table for vat records as they wait to be extracted. This tab... |
| `VAT_HISTORY` | Contains VAT dollar history by item/location/day for daily sales. |
| `VAT_ITEM` | Notes |
| `VAT_REGION` | This table contains one row for each VAT region and is maintained by the VAT Region Mai... |
| `VAT_REGION_TL` | This is the translation table for VAT_REGION table. The data in the base table is held ... |

## Skill References Directory:
- [`references/PHYSICAL_DATAMODEL.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_tax_vat_config/references/PHYSICAL_DATAMODEL.md): Full DDL column definitions, data types, PKs, FKs, and column comments (13 tables).
- [`references/FUNCTIONAL_USER_GUIDE.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_tax_vat_config/references/FUNCTIONAL_USER_GUIDE.md): Functional user guide workflows, operational lifecycles, and role dashboards.
- [`references/OPERATIONS_AND_BATCH_JOBS.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_tax_vat_config/references/OPERATIONS_AND_BATCH_JOBS.md): Nightly batch jobs, C/Pro*C programs, restart/recovery logic, and RIB integration messages.
- [`references/SYSTEM_CONFIGURATIONS.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_tax_vat_config/references/SYSTEM_CONFIGURATIONS.md): System configuration options (`SYSTEM_OPTIONS`), parameter flags, and setup rules.
