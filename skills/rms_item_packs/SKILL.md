---
name: RMS Item Packs & Complex Packs Datamodel
description: Physical schema tables for Oracle RMS Item Packs, Fashion Packs, Simple Packs, and Pack Component Items (PACKHEAD, PACKITEM, FASHPACK, SIMPLE_PACK).
---

# RMS Item Packs & Complex Packs Datamodel

Physical schema tables for Oracle RMS Item Packs, Fashion Packs, Simple Packs, and Pack Component Items (PACKHEAD, PACKITEM, FASHPACK, SIMPLE_PACK).

Total Tables in Domain: **7** (Core Entities: `PACKITEM`, `PACKITEM_BREAKOUT`, `PACK_TMPL_DETAIL`, `PACK_TMPL_HEAD`)

## Core Business Entities Summary:
| Core Table Name | Business Description |
| :--- | :--- |
| `FASHPACK_FILTER_TEMP` | This table will temporary hold information relating to the filtering of the detail bloc... |
| `PACKITEM` | This table contains simple pack and complex packs created in RMS along with the compone... |
| `PACKITEM_BREAKOUT` | This table breaks down a pack s components and their quantities to the lowest level, in... |
| `PACK_TMPL_DETAIL` | This table contains all the differentiator combinations and their associated quantities... |
| `PACK_TMPL_HEAD` | This table contains all the pack templates defined within the system. A pack template i... |
| `PACK_TMPL_HEAD_TL` | This is the translation table for PACK_TMPL_HEAD table. The data in the base table is h... |
| `SIMPLE_PACK_TEMP` | This table is a temporary table that will be used to store information during the Simpl... |

## Skill References Directory:
- [`references/PHYSICAL_DATAMODEL.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_item_packs/references/PHYSICAL_DATAMODEL.md): Full DDL column definitions, data types, PKs, FKs, and column comments (7 tables).
- [`references/FUNCTIONAL_USER_GUIDE.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_item_packs/references/FUNCTIONAL_USER_GUIDE.md): Functional user guide workflows, operational lifecycles, and role dashboards.
- [`references/OPERATIONS_AND_BATCH_JOBS.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_item_packs/references/OPERATIONS_AND_BATCH_JOBS.md): Nightly batch jobs, C/Pro*C programs, restart/recovery logic, and RIB integration messages.
- [`references/SYSTEM_CONFIGURATIONS.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_item_packs/references/SYSTEM_CONFIGURATIONS.md): System configuration options (`SYSTEM_OPTIONS`), parameter flags, and setup rules.
