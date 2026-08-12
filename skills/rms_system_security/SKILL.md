---
name: RMS System Security & Permissions Datamodel
description: Physical schema tables for Oracle RMS Security Users, Security Roles, User Group Privileges, and Object Permissions (SEC_*).
---

# RMS System Security & Permissions Datamodel

Physical schema tables for Oracle RMS Security Users, Security Roles, User Group Privileges, and Object Permissions (SEC_*).

Total Tables in Domain: **8** (Core Entities: `SECURITY_CONFIG_OPTIONS`, `SEC_GROUP`, `SEC_GROUP_LOC_MATRIX`, `SEC_USER`, `SEC_USER_GROUP`, `SEC_USER_ROLE`, `USER_ATTRIB`, `USER_DOMAIN`)

## Core Business Entities Summary:
| Core Table Name | Business Description |
| :--- | :--- |
| `SECURITY_CONFIG_OPTIONS` | Table that contains attributes that are used to setup security parameters within RMS. |
| `SEC_GROUP` | This table will be used to store group attributes. |
| `SEC_GROUP_LOC_MATRIX` | This table will be used to store the group location security attributes. |
| `SEC_USER` | This table holds the database user id and the application user id associated with a sec... |
| `SEC_USER_GROUP` | This table holds the security group a security user belongs to. |
| `SEC_USER_ROLE` | This table holds the roles a security user belongs to. |
| `USER_ATTRIB` | This table is used to store user attributes. |
| `USER_DOMAIN` | This table is used to determine which domains, or external databases, users are authori... |

## Skill References Directory:
- [`references/PHYSICAL_DATAMODEL.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_system_security/references/PHYSICAL_DATAMODEL.md): Full DDL column definitions, data types, PKs, FKs, and column comments (8 tables).
- [`references/FUNCTIONAL_USER_GUIDE.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_system_security/references/FUNCTIONAL_USER_GUIDE.md): Functional user guide workflows, operational lifecycles, and role dashboards.
- [`references/OPERATIONS_AND_BATCH_JOBS.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_system_security/references/OPERATIONS_AND_BATCH_JOBS.md): Nightly batch jobs, C/Pro*C programs, restart/recovery logic, and RIB integration messages.
- [`references/SYSTEM_CONFIGURATIONS.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_system_security/references/SYSTEM_CONFIGURATIONS.md): System configuration options (`SYSTEM_OPTIONS`), parameter flags, and setup rules.
