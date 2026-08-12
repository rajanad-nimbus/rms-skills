---
name: ReSA Sales Audit Outbound Exports Datamodel & Batch Integration
description: Physical schema tables, batch extraction designs, and export flows for ReSA outbound financial postings to RMS Stock Ledger, General Ledger, Bank ACH, SIM, and POS (saexprms, saexpgl, saexpach, saexpsim, saexppos).
---

# ReSA Sales Audit Outbound Exports Datamodel & Batch Integration

Physical schema tables, batch extraction designs, and export flows for ReSA outbound financial postings to RMS Stock Ledger, General Ledger, Bank ACH, SIM, and POS (`saexprms`, `saexpgl`, `saexpach`, `saexpsim`, `saexppos`).

Total Tables in Domain: **10** (Core Entities: `SA_EXPORT_LOG`, `SA_FIF_GL_CROSS_REF`, `SA_EXPORT_HEAD`, `SA_EXPORT_DETAIL`, `SA_EXPORT_TEMP`, `SA_EXPORT_LOG_TEMP`)

## Core Business Entities Summary:
| Core Table Name | Business Description |
| :--- | :--- |
| `SA_EXPORT_LOG` | Tracks the status, execution date, store day ID, and thread count for all outbound ReSA batch export programs. |
| `SA_FIF_GL_CROSS_REF` | Maps ReSA transaction tender types and total categories to General Ledger account segments. |
| `SA_EXPORT_HEAD` | Staging header table for outbound interface exports to external systems. |
| `SA_EXPORT_DETAIL` | Staging detail table containing line item amounts and accounts for export execution. |
| `SA_EXPORT_TEMP` | Global temporary table used by export batch processes (`saexprms`, `saexpgl`). |

## Skill References Directory:
- [`references/BUSINESS_PROCESS_FLOWS.md`](file:///Volumes/Cabinet/Projects/RMS%20Skills/skills/resa_sales_audit_exports/references/BUSINESS_PROCESS_FLOWS.md): ReSA User Guide & Operations Guide Ch 8 outbound financial export flows, RMS stock ledger posting, GL mapping, and bank ACH clearing.
- [`references/PRODUCT_ARCHITECTURE.md`](file:///Volumes/Cabinet/Projects/RMS%20Skills/skills/resa_sales_audit_exports/references/PRODUCT_ARCHITECTURE.md): ReSA export topology, financial posting interfaces, RESTful Web Services, and RIB payload contracts.
- [`references/PHYSICAL_DATAMODEL.md`](file:///Volumes/Cabinet/Projects/RMS%20Skills/skills/resa_sales_audit_exports/references/PHYSICAL_DATAMODEL.md): Full DDL column definitions, data types, PKs, FKs, and column comments (10 tables).
- [`references/FUNCTIONAL_USER_GUIDE.md`](file:///Volumes/Cabinet/Projects/RMS%20Skills/skills/resa_sales_audit_exports/references/FUNCTIONAL_USER_GUIDE.md): User guide procedures for reviewing export statuses, resolving posting errors, and triggering manual re-exports.
- [`references/OPERATIONS_AND_BATCH_JOBS.md`](file:///Volumes/Cabinet/Projects/RMS%20Skills/skills/resa_sales_audit_exports/references/OPERATIONS_AND_BATCH_JOBS.md): Complete batch designs and C/Pro*C execution specs for `saexprms`, `saexpgl`, `saexpach`, `saexpsim`, `saexppos`, `saexpesl`.
- [`references/SYSTEM_CONFIGURATIONS.md`](file:///Volumes/Cabinet/Projects/RMS%20Skills/skills/resa_sales_audit_exports/references/SYSTEM_CONFIGURATIONS.md): Export parameter configurations, GL cross-reference setup, and target system flags.
