---
name: RMS Customer & CRM Datamodel
description: Physical schema tables for Oracle RMS Customer Segments, Customer Orders, and POS Customer Staging (CUSTOMER, ORDCUST).
---

# RMS Customer & CRM Datamodel

Physical schema tables for Oracle RMS Customer Segments, Customer Orders, and POS Customer Staging (CUSTOMER, ORDCUST).

Total Tables in Domain: **10** (Core Entities: `CUSTOMER_SEGMENTS`, `CUSTOMER_SEGMENT_POS_STG`, `CUSTOMER_SEGMENT_TYPES`, `ORDCUST`, `ORDCUST_DETAIL`, `ORDCUST_L10N_EXT`, `ORDCUST_PUB_INFO`)

## Core Business Entities Summary:
| Core Table Name | Business Description |
| :--- | :--- |
| `CUSTOMER_SEGMENTS` | This new table will contain the customer segment id of a given customer segment type. T... |
| `CUSTOMER_SEGMENTS_TL` | This is the translation table for CUSTOMER_SEGMENTS table. The data in the base table i... |
| `CUSTOMER_SEGMENT_POS_STG` | This table records the changes for customer segement ids. A new record is entered whene... |
| `CUSTOMER_SEGMENT_TYPES` | This table will contain the customer segment types of a given customer segment. The cus... |
| `CUSTOMER_SEGMENT_TYPES_TL` | This is the translation table for CUSTOMER_SEGMENT_TYPES table. The data in the base ta... |
| `ORDCUST` | This table contains the customer order information associated to with a Customer Order ... |
| `ORDCUST_DETAIL` | This table contains customer order details for each customer order that has been placed. |
| `ORDCUST_L10N_EXT` | This extension table will hold the customer order localization extension attributes. |
| `ORDCUST_PUB_INFO` | This table is used to publish confirmation of customer order fulfillment requests to an... |
| `ORDCUST_PUB_TEMP` | This table is used to assist the publishing of customer order fulfillment requests on O... |

## Skill References Directory:
- [`references/PHYSICAL_DATAMODEL.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_customer_crm/references/PHYSICAL_DATAMODEL.md): Full DDL column definitions, data types, PKs, FKs, and column comments (10 tables).
- [`references/FUNCTIONAL_USER_GUIDE.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_customer_crm/references/FUNCTIONAL_USER_GUIDE.md): Functional user guide workflows, operational lifecycles, and role dashboards.
- [`references/OPERATIONS_AND_BATCH_JOBS.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_customer_crm/references/OPERATIONS_AND_BATCH_JOBS.md): Nightly batch jobs, C/Pro*C programs, restart/recovery logic, and RIB integration messages.
- [`references/SYSTEM_CONFIGURATIONS.md`](file:///Volumes/Cabinet/Projects/NiDM - Retail Logical Schema Design/.agents/skills/rms_customer_crm/references/SYSTEM_CONFIGURATIONS.md): System configuration options (`SYSTEM_OPTIONS`), parameter flags, and setup rules.
