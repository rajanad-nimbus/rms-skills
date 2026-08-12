---
name: ReSA System Setup, Options & Security Datamodel
description: Physical schema tables, system option configurations, parameter definitions, error code setup, and ADF security role hierarchies for Oracle Sales Audit (SA_PARM, SA_ERROR_CODES, SA_CONSTANTS, RESA_OI_SYSTEM_OPTIONS).
---

# ReSA System Setup, Options & Security Datamodel

Physical schema tables, system option configurations, parameter definitions, error code setup, and ADF security role hierarchies for Oracle Sales Audit (`SA_PARM`, `SA_ERROR_CODES`, `SA_CONSTANTS`, `RESA_OI_SYSTEM_OPTIONS`).

Total Tables in Domain: **12** (Core Entities: `SA_PARM`, `SA_PARM_TYPE`, `SA_ERROR_CODES`, `SA_CONSTANTS`, `SA_SYSTEM_OPTIONS`, `RESA_OI_SYSTEM_OPTIONS`, `SA_STORE_DAY_READ_LOCK`)

## Core Business Entities Summary:
| Core Table Name | Business Description |
| :--- | :--- |
| `SA_SYSTEM_OPTIONS` | Core system parameters governing audit rules execution, lock timeouts, and posting flags. |
| `SA_PARM` | Metadata parameters used by audit rules engine for formula calculations. |
| `SA_ERROR_CODES` | System error codes, descriptions, and impact classifications (Fatal vs Warning). |
| `SA_CONSTANTS` | System constants used across rules calculations and validator functions. |
| `RESA_OI_SYSTEM_OPTIONS` | Configuration options for ReSA ADF dashboards and taskflows. |

## Skill References Directory:
- [`references/BUSINESS_PROCESS_FLOWS.md`](file:///Volumes/Cabinet/Projects/RMS%20Skills/skills/resa_sales_audit_system_config/references/BUSINESS_PROCESS_FLOWS.md): ReSA User Guide & Operations Guide Ch 3 system setup, error code creation, parameter configuration, and security workflows.
- [`references/PRODUCT_ARCHITECTURE.md`](file:///Volumes/Cabinet/Projects/RMS%20Skills/skills/resa_sales_audit_system_config/references/PRODUCT_ARCHITECTURE.md): ReSA ADF architecture, role-based security hierarchy, taskflow navigation, and MDS customization topology.
- [`references/PHYSICAL_DATAMODEL.md`](file:///Volumes/Cabinet/Projects/RMS%20Skills/skills/resa_sales_audit_system_config/references/PHYSICAL_DATAMODEL.md): Full DDL column definitions, data types, PKs, FKs, and column comments (12 tables).
- [`references/FUNCTIONAL_USER_GUIDE.md`](file:///Volumes/Cabinet/Projects/RMS%20Skills/skills/resa_sales_audit_system_config/references/FUNCTIONAL_USER_GUIDE.md): System administration user workflows, role assignment, and system option maintenance.
- [`references/OPERATIONS_AND_BATCH_JOBS.md`](file:///Volumes/Cabinet/Projects/RMS%20Skills/skills/resa_sales_audit_system_config/references/OPERATIONS_AND_BATCH_JOBS.md): System setup maintenance jobs, sequence purges, and configuration sync tasks.
- [`references/SYSTEM_CONFIGURATIONS.md`](file:///Volumes/Cabinet/Projects/RMS%20Skills/skills/resa_sales_audit_system_config/references/SYSTEM_CONFIGURATIONS.md): Comprehensive system options parameter catalog (`SYSTEM_OPTIONS`).
