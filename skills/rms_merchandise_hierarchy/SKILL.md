---
name: RMS Merchandise Hierarchy Datamodel
description: Physical schema tables for Oracle RMS Merchandise Hierarchy levels (Division, Group, Department, Class, Subclass, Domain).
---

# RMS Merchandise Hierarchy Datamodel

Physical schema tables for Oracle RMS Merchandise Hierarchy levels (Division, Group, Department, Class, Subclass, Domain).

Total Tables in Domain: **36** (Core Entities: `CLASS`, `CLASS_CFA_EXT`, `CLASS_SALES_FORECAST`, `CLASS_SALES_HIST`, `CLASS_SALES_HIST_MTH`, `DEPS`, `DEPS_CFA_EXT`, `DEPT_CHRG_DETAIL`)

## Core Business Entities Summary:
| Core Table Name | Business Description |
| :--- | :--- |
| `CLASS` | Contains one row for each class within the company. Whenever a class name is used by Or... |
| `CLASS_CFA_EXT` | This is the custom attribute extension table for the entity CLASS. |
| `CLASS_SALES_FORECAST` | Holds the forecast information summed to the class/location/eow_date. Should be partiti... |
| `CLASS_SALES_HIST` | This table contains one row for each class/location/week/sales type combination. Sales ... |
| `CLASS_SALES_HIST_MTH` | This table contains one row for each class/location/month/sales type combination. Sales... |
| `CLASS_TL` | This is the translation table for CLASS table. The data in the base table is held in da... |
| `DEPS` | This table contains one row for each department within the company. Whenever a departme... |
| `DEPS_CFA_EXT` | This is the custom attribute extension table for the entity DEPS |
| `DEPS_TL` | This is the translation table for DEPS table. The data in the base table is held in dat... |
| `DEPT_CHRG_DETAIL` | This table holds Up Charge components and their associated information for a given depa... |
| `DEPT_CHRG_HEAD` | This table holds from/to location combinations for a given department. Up charge compon... |
| `DEPT_SALES_FORECAST` | Holds the forecast information summed to the department/location/eow_date. If the Oracl... |
| `DEPT_SALES_HIST` | This table is used to record sales history for each dept/location/week/sales type combi... |
| `DEPT_SALES_HIST_MTH` | This table is used to record sales history for each dept/location/month/sales type comb... |
| `DIVISION` | This table contains one row for each division within the company. Whenever a division n... |

*... plus 21 additional auxiliary/work tables in `PHYSICAL_DATAMODEL.md`.*

## Skill References Directory:
- [`references/PHYSICAL_DATAMODEL.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_merchandise_hierarchy/references/PHYSICAL_DATAMODEL.md): Full DDL column definitions, data types, PKs, FKs, and column comments (36 tables).
- [`references/FUNCTIONAL_USER_GUIDE.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_merchandise_hierarchy/references/FUNCTIONAL_USER_GUIDE.md): Functional user guide workflows, operational lifecycles, and role dashboards.
- [`references/OPERATIONS_AND_BATCH_JOBS.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_merchandise_hierarchy/references/OPERATIONS_AND_BATCH_JOBS.md): Nightly batch jobs, C/Pro*C programs, restart/recovery logic, and RIB integration messages.
- [`references/SYSTEM_CONFIGURATIONS.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_merchandise_hierarchy/references/SYSTEM_CONFIGURATIONS.md): System configuration options (`SYSTEM_OPTIONS`), parameter flags, and setup rules.
