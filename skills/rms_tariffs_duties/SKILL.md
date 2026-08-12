---
name: RMS Tariffs & Customs Duties (HTS) Datamodel
description: Physical schema tables for Oracle RMS Harmonized Tariff Schedule (HTS), Customs Duties, Tariffs, and Fee Calculations (HTS, HTS_CHAPTER, HTS_TAX).
---

# RMS Tariffs & Customs Duties (HTS) Datamodel

Physical schema tables for Oracle RMS Harmonized Tariff Schedule (HTS), Customs Duties, Tariffs, and Fee Calculations (HTS, HTS_CHAPTER, HTS_TAX).

Total Tables in Domain: **19** (Core Entities: `HTS`, `HTS_AD`, `HTS_CHAPTER`, `HTS_CHAPTER_RESTRAINTS`, `HTS_COMPUTATION`, `HTS_CVD`, `HTS_FEE`, `HTS_FEE_ZONE`)

## Core Business Entities Summary:
| Core Table Name | Business Description |
| :--- | :--- |
| `HTS` | This table holds HTS classification information. |
| `HTS_AD` | This table contains anti-dumping information for a given HTS classification and country... |
| `HTS_CHAPTER` | This table is the parent table to HTS Chapter level information. |
| `HTS_CHAPTER_RESTRAINTS` | This table holds all HTS chapter level restraints to importing goods into a given count... |
| `HTS_CHAPTER_RESTRAINTS_TL` | This is the translation table for HTS_CHAPTER_RESTRAINTS table. The data in the base ta... |
| `HTS_CHAPTER_TL` | This is the translation table for HTS_CHAPTER table. The data in the base table is held... |
| `HTS_COMPUTATION` | Table to handle processing of new duty comp codes (K,J) |
| `HTS_CVD` | This table contains countervailing duty information for a given HTS classification and ... |
| `HTS_FEE` | This table contains all of the information needed to calculate the customs fees for a g... |
| `HTS_FEE_ZONE` | A table that will hold rates for HTS/fee/clearing zone. |
| `HTS_IMPORT_COUNTRY_SETUP` | This table will hold the attributes of HTS by Import country |
| `HTS_OGA` | This table contains all of the codes that identify an agency outside of customs that ar... |
| `HTS_REFERENCE` | This table contains user-defined references. These references are not validated against... |
| `HTS_TARIFF_TREATMENT` | This table contains tariff treatment for a given HTS classification. The tariff treatme... |
| `HTS_TARIFF_TREATMENT_ZONE` | A table that will hold rates for HTS/tariff/clearing zone. |

*... plus 4 additional auxiliary/work tables in `PHYSICAL_DATAMODEL.md`.*

## Skill References Directory:
- [`references/PHYSICAL_DATAMODEL.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_tariffs_duties/references/PHYSICAL_DATAMODEL.md): Full DDL column definitions, data types, PKs, FKs, and column comments (19 tables).
- [`references/FUNCTIONAL_USER_GUIDE.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_tariffs_duties/references/FUNCTIONAL_USER_GUIDE.md): Functional user guide workflows, operational lifecycles, and role dashboards.
- [`references/OPERATIONS_AND_BATCH_JOBS.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_tariffs_duties/references/OPERATIONS_AND_BATCH_JOBS.md): Nightly batch jobs, C/Pro*C programs, restart/recovery logic, and RIB integration messages.
- [`references/SYSTEM_CONFIGURATIONS.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_tariffs_duties/references/SYSTEM_CONFIGURATIONS.md): System configuration options (`SYSTEM_OPTIONS`), parameter flags, and setup rules.
