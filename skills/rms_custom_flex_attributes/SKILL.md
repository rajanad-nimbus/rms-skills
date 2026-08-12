---
name: RMS Custom Flex Attributes Datamodel
description: Physical schema tables for Oracle RMS Custom Flex Attributes (CFA) and Localization Descriptors (L10N).
---

# RMS Custom Flex Attributes Datamodel

Physical schema tables for Oracle RMS Custom Flex Attributes (CFA) and Localization Descriptors (L10N).

Total Tables in Domain: **32** (Core Entities: `CFA_ATTRIB`, `CFA_ATTRIB_GROUP`, `CFA_ATTRIB_GROUP_LABELS`, `CFA_ATTRIB_GROUP_SET`, `CFA_ATTRIB_GROUP_SET_LABELS`, `CFA_ATTRIB_LABELS`, `CFA_EXT_ENTITY`, `CFA_EXT_ENTITY_KEY`)

## Core Business Entities Summary:
| Core Table Name | Business Description |
| :--- | :--- |
| `CFA_ATTRIB` | This table holds the metadata that defines custom attributes for all extended entities.... |
| `CFA_ATTRIB_GROUP` | This table holds the metadata that defines attributes groups for group sets for all ext... |
| `CFA_ATTRIB_GROUP_LABELS` | This holds the attribute group labels as displayed on the CFAS UI |
| `CFA_ATTRIB_GROUP_SET` | This table holds the metadata definitions for the attribute group set. The group set is... |
| `CFA_ATTRIB_GROUP_SET_LABELS` | This table contains the labels displayed in the options menu representing the attribute... |
| `CFA_ATTRIB_LABELS` | This table will hold the prompt labels for each flexible attribute and its correspondin... |
| `CFA_EXT_ENTITY` | This table contains the RMS entitys base table and custom extension table relationship |
| `CFA_EXT_ENTITY_KEY` | This table holds the entitys primary reference keys used to link the entitys base RMS t... |
| `CFA_EXT_ENTITY_KEY_LABELS` | This table holds the prompt labels for each of the entity key columns and corresponding... |
| `CFA_REC_GROUP` | This table will hold the queries used by LOVs in the CFA UI. |
| `CFA_REC_GROUP_LABELS` | This will contain the labels and corresponding transalated values displayed at the LOV ... |
| `L10N_ATTRIB` | This table holds the metadata that defines country specific localization attributes for... |
| `L10N_ATTRIB_DESCS` | This table holds descriptions that will be used to label the attribute on the LFAS UI W... |
| `L10N_ATTRIB_GROUP` | This table holds the metadata that defines country specific localization attributes gro... |
| `L10N_ATTRIB_GROUP_DESCS` | This table holds the language specific descriptions that will be used to depict each sp... |

*... plus 17 additional auxiliary/work tables in `PHYSICAL_DATAMODEL.md`.*

## Skill References Directory:
- [`references/PHYSICAL_DATAMODEL.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_custom_flex_attributes/references/PHYSICAL_DATAMODEL.md): Full DDL column definitions, data types, PKs, FKs, and column comments (32 tables).
- [`references/FUNCTIONAL_USER_GUIDE.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_custom_flex_attributes/references/FUNCTIONAL_USER_GUIDE.md): Functional user guide workflows, operational lifecycles, and role dashboards.
- [`references/OPERATIONS_AND_BATCH_JOBS.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_custom_flex_attributes/references/OPERATIONS_AND_BATCH_JOBS.md): Nightly batch jobs, C/Pro*C programs, restart/recovery logic, and RIB integration messages.
- [`references/SYSTEM_CONFIGURATIONS.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_custom_flex_attributes/references/SYSTEM_CONFIGURATIONS.md): System configuration options (`SYSTEM_OPTIONS`), parameter flags, and setup rules.
