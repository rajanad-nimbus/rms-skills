---
name: RPM Pricing, Promotions & Competitor Price Datamodel
description: Physical schema tables for Oracle RMS Pricing, Retail Price Changes, Clearance, Promotions, and Competitor Price Tracking (RPM, PRICE, PROM).
---

# RPM Pricing, Promotions & Competitor Price Datamodel

Physical schema tables for Oracle RMS Pricing, Retail Price Changes, Clearance, Promotions, and Competitor Price Tracking (RPM, PRICE, PROM).

Total Tables in Domain: **17** (Core Entities: `COMPETITOR`, `COMP_PRICE_HIST`, `COMP_SHOPPER`, `COMP_SHOP_LIST`, `COMP_STORE`, `COMP_STORE_LINK`, `EMER_PRICE_HIST`, `PCCEXT_C_CLEAR`)

## Core Business Entities Summary:
| Core Table Name | Business Description |
| :--- | :--- |
| `COMPETITOR` | This table is used to store all competitors. |
| `COMP_ITEM_ELC_TEMP` | Temporary table for the component items of a pack item. |
| `COMP_LIST_TEMP` | This is a temporary table for the creation of competitive shopping lists. |
| `COMP_PRICE_HIST` | This table holds competitor price information at the item/competitor/competitor store/d... |
| `COMP_SHOPPER` | This table holds the competitive shoppers in the system. |
| `COMP_SHOP_LIST` | This table holds competitor shopping lists at the item/competitor/competitor store/day ... |
| `COMP_SHOP_LIST_TEMP` | This temporary table holds competitor shopping lists at the item/competitor/competitor ... |
| `COMP_STORE` | This table holds competitor store information. |
| `COMP_STORE_LINK` | This table holds the association of Merchandising stores to competitor stores. |
| `EMER_PRICE_HIST` | This table will hold all the emergency price changes. |
| `PCCEXT_C_CLEAR` | Temporary table used by prepost and pccext |
| `PRICE_BATCH_TRAN` | The table contains transactions for price changes created when a store is moved from on... |
| `PRICE_HIST` | This table contains a history of all price changes that have ever been applied within t... |
| `TICKET_REQUEST` | This table will be used to communicate to the batch program which prints tickets. This ... |
| `TICKET_TYPE_DETAIL` | This field contains one row for each item which will be on the ticket (i.e. SKU number,... |

*... plus 2 additional auxiliary/work tables in `PHYSICAL_DATAMODEL.md`.*

## Skill References Directory:
- [`references/BUSINESS_PROCESS_FLOWS.md`](file:///Volumes/Cabinet/Projects/RMS%20Skills/skills/rpm_pricing_promotions/references/BUSINESS_PROCESS_FLOWS.md): Official Oracle RRL 16 RRM 03 Retail Price Management (RPM) process flows, pricing strategy rules, pricing worksheets, promotion lifecycles, and clearance markdown rules.
- [`references/PRODUCT_ARCHITECTURE.md`](file:///Volumes/Cabinet/Projects/RMS%20Skills/skills/rpm_pricing_promotions/references/PRODUCT_ARCHITECTURE.md): RRA pricing science optimization architecture, price zone topology, and RSG `PriceChangePub` payload specs.
- [`references/PHYSICAL_DATAMODEL.md`](file:///Volumes/Cabinet/Projects/RMS%20Skills/skills/rpm_pricing_promotions/references/PHYSICAL_DATAMODEL.md): Full DDL column definitions, data types, PKs, FKs, and column comments (17 tables).
- [`references/FUNCTIONAL_USER_GUIDE.md`](file:///Volumes/Cabinet/Projects/RMS%20Skills/skills/rpm_pricing_promotions/references/FUNCTIONAL_USER_GUIDE.md): Functional user guide workflows, operational lifecycles, and role dashboards.
- [`references/OPERATIONS_AND_BATCH_JOBS.md`](file:///Volumes/Cabinet/Projects/RMS%20Skills/skills/rpm_pricing_promotions/references/OPERATIONS_AND_BATCH_JOBS.md): Nightly batch jobs, C/Pro*C programs, restart/recovery logic, and RIB integration messages.
- [`references/SYSTEM_CONFIGURATIONS.md`](file:///Volumes/Cabinet/Projects/RMS%20Skills/skills/rpm_pricing_promotions/references/SYSTEM_CONFIGURATIONS.md): System configuration options (`SYSTEM_OPTIONS`), parameter flags, and setup rules.
