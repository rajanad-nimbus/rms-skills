---
name: RMS Service Uploads - Foundation & Security Datamodel
description: Physical schema tables for Oracle RMS Service Upload Staging for Foundation Codes, Attributes, and Security (SVC_CODE_*, SVC_SEC_*, S9T_*).
---

# RMS Service Uploads - Foundation & Security Datamodel

Physical schema tables for Oracle RMS Service Upload Staging for Foundation Codes, Attributes, and Security (SVC_CODE_*, SVC_SEC_*, S9T_*).

Total Tables in Domain: **250** (Core Entities: `S9T_CONFIG`, `S9T_ERRORS`, `S9T_FOLDER`, `S9T_LIST_VALS`, `S9T_TMPL_COLS_DEF`, `S9T_TMPL_WKSHT_DEF`, `SVC_ADMIN_UPLD_ER`, `SVC_ATTRIB_GROUP`)

## Core Business Entities Summary:
| Core Table Name | Business Description |
| :--- | :--- |
| `S9T_CONFIG` | This table holds the specific configurations used while creating and processing spreads... |
| `S9T_ERRORS` | This table contains the error messages while processing spreadsheet data into staging t... |
| `S9T_FOLDER` | This is a generic table to hold spreadsheets being uploaded and downloaded through RMS. |
| `S9T_LIST_VALS` | This table contains mapping of spreadsheet columns in S9T_TMPL_COLS_DEF and code-detail... |
| `S9T_TEMPLATE` | This is header table for all spreadsheet upload/download templates used by the system. |
| `S9T_TEMPLATE_TL` | This table contains translations by language for the template definition contained in t... |
| `S9T_TMPL_COLS_DEF` | This table contains column definition for spreadsheet templates used by RMS. E.g. sprea... |
| `S9T_TMPL_COLS_DEF_TL` | This table contains translations by language for template column definition contained i... |
| `S9T_TMPL_WKSHT_DEF` | This table contains worksheet definitions for spreadsheet templates used by system for ... |
| `S9T_TMPL_WKSHT_DEF_TL` | This table contains translations by language for worksheet definition contained in S9T_... |
| `SVC_ADMIN_UPLD_ER` | This table contains errors encountered while uploading data to core tables from Admin API. |
| `SVC_ATTRIB_GROUP` | This is the staging table for CFAS attribute group information.It is used to temporaril... |
| `SVC_ATTRIB_GROUP_LABELS` | This is the staging table for CFAS attrib group labels information.It is used to tempor... |
| `SVC_ATTRIB_GROUP_SET` | This is the staging table for CFAS attribute group set setup information.It is used to ... |
| `SVC_ATTRIB_GROUP_SET_LABELS` | This is the staging table for CFAS attribute group set labels information.It is used to... |

*... plus 235 additional auxiliary/work tables in `PHYSICAL_DATAMODEL.md`.*

## Skill References Directory:
- [`references/PHYSICAL_DATAMODEL.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_svc_foundation/references/PHYSICAL_DATAMODEL.md): Full DDL column definitions, data types, PKs, FKs, and column comments (250 tables).
- [`references/FUNCTIONAL_USER_GUIDE.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_svc_foundation/references/FUNCTIONAL_USER_GUIDE.md): Functional user guide workflows, operational lifecycles, and role dashboards.
- [`references/OPERATIONS_AND_BATCH_JOBS.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_svc_foundation/references/OPERATIONS_AND_BATCH_JOBS.md): Nightly batch jobs, C/Pro*C programs, restart/recovery logic, and RIB integration messages.
- [`references/SYSTEM_CONFIGURATIONS.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_svc_foundation/references/SYSTEM_CONFIGURATIONS.md): System configuration options (`SYSTEM_OPTIONS`), parameter flags, and setup rules.
