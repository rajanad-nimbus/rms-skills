---
name: RMS Item Attributes, UDAs & Diffs Datamodel
description: Physical schema tables for Oracle RMS User Defined Attributes (UDA), Item Lists (SKULIST), Diffs/Variations, Traits, Units of Measure (UOM), and Item Reclassifications (UDA, SKULIST, DIFF, RECLASS, UOM).
---

# RMS Item Attributes, UDAs & Diffs Datamodel

Physical schema tables for Oracle RMS User Defined Attributes (UDA), Item Lists (SKULIST), Diffs/Variations, Traits, Units of Measure (UOM), and Item Reclassifications (UDA, SKULIST, DIFF, RECLASS, UOM).

Total Tables in Domain: **123** (Core Entities: `DC_BRAND`, `DC_CLASS`, `DC_COUNTRY_ATTRIB`, `DC_DEPS`, `DC_DIFF_IDS`, `DC_DISTRICT`, `DC_FASHION_SKU`, `DC_FASHION_XREF`)

## Core Business Entities Summary:
| Core Table Name | Business Description |
| :--- | :--- |
| `DC_BRAND` | This table is a staging table for data conversion and will hold to display brand inform... |
| `DC_CLASS` | This table is a staging table for data conversion and will hold data for class table.. |
| `DC_COUNTRY_ATTRIB` | This table is a staging table for data conversion and will hold data for COUNTRY_ATTRIB. |
| `DC_DEPS` | This table is a staging table for data conversion and will hold data for department tab... |
| `DC_DIFF_IDS` | This table is a staging table for data conversion and will holds all the unique differe... |
| `DC_DISTRICT` | This table is a staging table for data conversion and will hold data for DISTRICT. |
| `DC_FASHION_SKU` | This table is a staging table for data conversion and will hold style item data of ITEM... |
| `DC_FASHION_XREF` | This table is a staging table for data conversion and will hold item reference data of ... |
| `DC_FIF_GL_SETUP` | This table is a staging table for data conversion and will hold all the intial set-up i... |
| `DC_FREIGHT_SIZE` | This table is a staging table for data conversion and will hold data for FREIGHT_SIZE w... |
| `DC_FREIGHT_TERMS` | This table is a staging table for data conversion and will hold data for FREIGHT_TERMS ... |
| `DC_FREIGHT_TYPE` | This table is a staging table for data conversion and will hold data for FREIGHT_TYPE w... |
| `DC_GROCERY_VARIANT` | This table is a staging table for data conversion and will hold product line variant da... |
| `DC_HARDLINES` | This table is a staging table for data conversion and will hold hardlines item. |
| `DC_HARDLINES_XREF` | This table is a staging table for data conversion and will hold hardlines reference data. |

*... plus 108 additional auxiliary/work tables in `PHYSICAL_DATAMODEL.md`.*

## Skill References Directory:
- [`references/PHYSICAL_DATAMODEL.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_item_attributes_uda/references/PHYSICAL_DATAMODEL.md): Full DDL column definitions, data types, PKs, FKs, and column comments (123 tables).
- [`references/FUNCTIONAL_USER_GUIDE.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_item_attributes_uda/references/FUNCTIONAL_USER_GUIDE.md): Functional user guide workflows, operational lifecycles, and role dashboards.
- [`references/OPERATIONS_AND_BATCH_JOBS.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_item_attributes_uda/references/OPERATIONS_AND_BATCH_JOBS.md): Nightly batch jobs, C/Pro*C programs, restart/recovery logic, and RIB integration messages.
- [`references/SYSTEM_CONFIGURATIONS.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_item_attributes_uda/references/SYSTEM_CONFIGURATIONS.md): System configuration options (`SYSTEM_OPTIONS`), parameter flags, and setup rules.
