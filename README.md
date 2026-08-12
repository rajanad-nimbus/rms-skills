# RMS Skills (Oracle Retail Merchandising System)

An open agent skill library providing comprehensive physical database schemas, functional user guides, batch operations, and architectural reference models for Oracle Retail Merchandising System (RMS).

Built on the Mat Pocock Open Agent Skill Standard.

## Overview

This repository contains structured, 2-tier progressive retrieval agent skills for AI assistants working with Oracle RMS. It covers:

- **40+ Core Physical Datamodels** (Purchase Orders, Sales Audit, Stock Ledger, Inventory, Items, Pricing, Deals, Invoicing, etc.)
- **Service Upload Staging & Integration APIs** (RIB, Core Services, SVC Uploads)
- **Operations, Implementation, & User Guides**

## Structure

```
├── .agents/
│   ├── AGENTS.md
│   └── skills.json
├── skills/
│   ├── rms_purchase_orders/
│   ├── rms_sales_audit_transactions/
│   ├── rms_inventory/
│   ├── rms_stock_ledger_financials/
│   └── ... (80+ skills)
├── AGENTS.md
├── skills.json
└── README.md
```

## Usage with AI Agents

1. Add this repository to your workspace or register `skills.json` in your `.agents/` folder.
2. Agents automatically discover skills registered in `skills.json`.
3. High-level summaries live in `skills/<skill>/SKILL.md` (Tier 1). Detailed schema and guide references are in `skills/<skill>/references/` (Tier 2).

## License

MIT
