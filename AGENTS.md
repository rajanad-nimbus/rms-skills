# Agent Rules & Skills Guide (Mat Pocock Agent Standard)

This workspace uses the Mat Pocock open agent skill architecture. All agent skills are registered in `skills.json` and located under `skills/`.

---

## Agent Behavioral Rules

1. **Skill Discovery & Registration:**
   - Always check `.agents/skills.json` for registered workspace skills before performing independent domain research.
   - Every skill lives under `.agents/skills/<skill_name>/` and features a lightweight `SKILL.md` (YAML frontmatter + core entity summary).

2. **2-Tier Progressive Retrieval:**
   - **Tier 1 (`SKILL.md`):** Load `SKILL.md` first to understand high-level domain concepts and core table mappings (~750 tokens).
   - **Tier 2 (`references/`):** Load specific reference files (`PHYSICAL_DATAMODEL.md`, `FUNCTIONAL_USER_GUIDE.md`, `OPERATIONS_AND_BATCH_JOBS.md`, `SYSTEM_CONFIGURATIONS.md`) on demand when deep technical detail is needed.

3. **Schema Integrity Guarantee:**
   - Preserve 100% physical database table schemas, data types, primary keys, foreign keys, and column comments. Never swallow errors or return fallback dummy data.

---

## Active Skills Registry (`skills.json`)

The following 40 domain skills are registered and available in `.agents/skills.json`:

- `rms_purchase_orders` — Purchase Orders, PO Lines, Revisions, Expenses
- `rms_sales_audit_transactions` — POS Transactions, Headers, Items, Tenders
- `rms_sales_audit_store_days` — Store Day Audit Balances, Cashier Totals
- `rms_sales_audit_rules` — Sales Audit Rules Engine & Validation Errors
- `rms_invoicing_matching` — ReIM 3-Way Invoice Matching, Non-Merchandise Costs
- `rms_transfers_shipments` — Inter-Store Transfers, ASNs, Shipments
- `rms_inventory` — Stock-on-Hand Buckets, Stocktake Counts, Adjustments
- `rms_stock_ledger_financials` — Stock Ledger Financial Rollups, OTB, GL Posting
- `rms_item_master` — Core Items, Styles, SKUs, Item-Suppliers
- `rms_item_attributes_uda` — UDAs, Diffs, Item Lists, Reclassifications
- `rms_item_packs` — Fashion Packs, Simple Packs, Complex Packs
- `rms_item_location` — Item-Location Ranging Matrix, Unit Cost/Retail
- `rms_deals_rebates` — Vendor Deals, Rebates, Fixed Allowances
- `rms_pricing_promotions` — Price Changes, RPM Markdowns, Promotions
- `rms_costing_expenses` — Base Costing, Estimated Landed Cost (ELC), Expenses
- `rms_tariffs_duties` — HTS Tariff Codes, Customs Duties
- `rms_allocations` — Store Allocation Creation, Demand Distribution
- `rms_rtv_returns` — Return to Vendor Shipments, RMAs
- `rms_tax_vat_config` — VAT Codes, Department Tax Rules, GTAX
- `rms_daily_stock_data` — Daily Financial Inventory Rollups (`DAILY_DATA`)
- `rms_future_cost` — Future Cost Timeline Calculation Engine
- `rms_transaction_data` — `TRAN_DATA_HISTORY` Stock Ledger Audit Log
- `rms_organization_hierarchy` — Stores, Warehouses, Channels, Org Units
- `rms_merchandise_hierarchy` — Divisions, Groups, Departments, Classes
- `rms_system_security` — Security User Groups, Object Permissions
- `rms_system_codes_config` — System Codes, Currencies, Parameters
- `rms_batch_control_restart` — Restart/Recovery Control, Async Jobs
- `rms_staging_gtt_temp` — Temporary Work Tables (`GTT_*`, `TEMP_*`)
- `rms_integration_apis` — Core Services `API_*`, RIB Interfaces
- `rms_svc_items` — Item Service Upload Staging
- `rms_svc_orders` — Purchase Order Service Upload Staging
- `rms_svc_inventory` — Inventory & Transfer Service Upload Staging
- `rms_svc_pricing` — Price Change Service Upload Staging
- `rms_svc_organization` — Organization Service Upload Staging
- `rms_svc_suppliers` — Supplier Service Upload Staging
- `rms_svc_foundation` — Foundation Service Upload Staging
- `rms_seasons_work_orders` — Seasons, Phases, Finishing Work Orders
- `rms_customer_crm` — Customer Profiles, Customer Orders
- `rms_forecasting_planning` — Sales Forecasts, Demand Planning
- `rms_data_conversion_staging` — Legacy Data Migration Staging (`DC_*`)
