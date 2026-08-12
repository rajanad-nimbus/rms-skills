---
name: RMS Organization & Location Hierarchy Datamodel
description: Physical schema tables for Oracle RMS Store, Warehouse, Location Lists, Channels, Banners, Regions, Districts, Areas, Chains, Companies, and Org Units.
---

# RMS Organization & Location Hierarchy Datamodel

Physical schema tables for Oracle RMS Store, Warehouse, Location Lists, Channels, Banners, Regions, Districts, Areas, Chains, Companies, and Org Units.

Total Tables in Domain: **76** (Core Entities: `ADDR`, `ADDR_CFA_EXT`, `ADD_TYPE`, `ADD_TYPE_MODULE`, `AREA`, `BANNER`, `CHAIN`, `CHANNELS`)

## Core Business Entities Summary:
| Core Table Name | Business Description |
| :--- | :--- |
| `ADDR` | The ADDR table stores the address of the store, ware house, supplier, and partner. Seq_... |
| `ADDR_CFA_EXT` | This is the custom attribute extension table for the entity ADDR. |
| `ADDR_TL` | This is the translation table for ADDR table. The data in the base table is held in dat... |
| `ADD_TYPE` | The ADD_TYPE table contains one row for each address type within the company. It is pop... |
| `ADD_TYPE_MODULE` | The data that is inserted/updated/deleted in the table should be very carefully managed... |
| `ADD_TYPE_TL` | This table holds the translated description of the Address Types in all languages. |
| `AREA` | This table contains one row for each geographic area within a chain. An area belongs to... |
| `AREA_TL` | This is the translation table for AREA table. The data in the base table is held in dat... |
| `BANNER` | This table will hold the Banner Id and Name for a Banner. A banner is the name for a ch... |
| `BANNER_MFQUEUE` | This table holds banner and channel publication messages in sequence until they are pub... |
| `BANNER_TL` | This is the translation table for BANNER table. The data in the base table is held in d... |
| `CHAIN` | Contains one row for each chain and/or format of a store within a company. It is the fi... |
| `CHAIN_TL` | This is the translation table for CHAIN table. The data in the base table is held in da... |
| `CHANNELS` | This table contains one row for every channel operated within the company. This table w... |
| `CHANNELS_TL` | This is the translation table for CHANNELS table. The data in the base table is held in... |

*... plus 61 additional auxiliary/work tables in `PHYSICAL_DATAMODEL.md`.*

## Skill References Directory:
- [`references/PHYSICAL_DATAMODEL.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_organization_hierarchy/references/PHYSICAL_DATAMODEL.md): Full DDL column definitions, data types, PKs, FKs, and column comments (76 tables).
- [`references/FUNCTIONAL_USER_GUIDE.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_organization_hierarchy/references/FUNCTIONAL_USER_GUIDE.md): Functional user guide workflows, operational lifecycles, and role dashboards.
- [`references/OPERATIONS_AND_BATCH_JOBS.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_organization_hierarchy/references/OPERATIONS_AND_BATCH_JOBS.md): Nightly batch jobs, C/Pro*C programs, restart/recovery logic, and RIB integration messages.
- [`references/SYSTEM_CONFIGURATIONS.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_organization_hierarchy/references/SYSTEM_CONFIGURATIONS.md): System configuration options (`SYSTEM_OPTIONS`), parameter flags, and setup rules.
