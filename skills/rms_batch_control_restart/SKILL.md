---
name: RMS Batch Control & Restart Recovery Datamodel
description: Physical schema tables for Oracle RMS Restart/Recovery Control, Async Jobs, and Batch Threading (RESTART_CONTROL, RMS_ASYNC).
---

# RMS Batch Control & Restart Recovery Datamodel

Physical schema tables for Oracle RMS Restart/Recovery Control, Async Jobs, and Batch Threading (RESTART_CONTROL, RMS_ASYNC).

Total Tables in Domain: **9** (Core Entities: `RESTART_BOOKMARK`, `RESTART_CONTROL`, `RESTART_PROGRAM_HISTORY`, `RESTART_PROGRAM_STATUS`, `RETL_EXTRACT_DATES`, `RMS_ASYNC_JOB`, `RMS_ASYNC_RETRY`, `RMS_ASYNC_STATUS`)

## Core Business Entities Summary:
| Core Table Name | Business Description |
| :--- | :--- |
| `RESTART_BOOKMARK` | When a restart/recovery program thread is currently active, its state is started or abo... |
| `RESTART_CONTROL` | This table is the master table in the restart/recovery table set. One record will exist... |
| `RESTART_PROGRAM_HISTORY` | The restart_program_history table will contain one record for every successfully comple... |
| `RESTART_PROGRAM_STATUS` | This table holds record keeping information about current program processes. The number... |
| `RETL_EXTRACT_DATES` | This table will hold the dates of various RETL extractions. The date listed will be the... |
| `RMS_ASYNC_JOB` | This table holds a list of asynchronous jobs supported in RMS. Oracle Advanced Queuing ... |
| `RMS_ASYNC_RETRY` | Table that tracks each attempt to complete an asynchronous call. If the initial call is... |
| `RMS_ASYNC_STATUS` | Table that tracks each asynchronous call made in RMS. |
| `SEEDOBJ_MFQUEUE` | This table is needed to publish out Country and Currency data. |

## Skill References Directory:
- [`references/PHYSICAL_DATAMODEL.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_batch_control_restart/references/PHYSICAL_DATAMODEL.md): Full DDL column definitions, data types, PKs, FKs, and column comments (9 tables).
- [`references/FUNCTIONAL_USER_GUIDE.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_batch_control_restart/references/FUNCTIONAL_USER_GUIDE.md): Functional user guide workflows, operational lifecycles, and role dashboards.
- [`references/OPERATIONS_AND_BATCH_JOBS.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_batch_control_restart/references/OPERATIONS_AND_BATCH_JOBS.md): Nightly batch jobs, C/Pro*C programs, restart/recovery logic, and RIB integration messages.
- [`references/SYSTEM_CONFIGURATIONS.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_batch_control_restart/references/SYSTEM_CONFIGURATIONS.md): System configuration options (`SYSTEM_OPTIONS`), parameter flags, and setup rules.
