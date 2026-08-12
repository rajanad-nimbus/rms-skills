# Stock Ledger & Financial Accounting Functional Workflows & Reports

The **Stock Ledger & Financial Accounting** module maintains historical inventory valuation, gross margin tracking, retail accounting rollups, Open-to-Buy (OTB) financial budgets, and General Ledger (GL) posting interfaces.

---

## 1. Core Business Concepts & Roles

### Primary User Persona: Finance Analyst / Retail Controller
The **Finance Analyst** is responsible for validating monthly inventory valuation, monitoring gross margin variance, analyzing retail shrinkage trends, tracking Weighted Average Cost (WAC), and overseeing General Ledger posting accuracy.

---

## 2. Stock Ledger Valuation Methods

Oracle RMS supports dual valuation methods for tracking inventory asset values:

```
[POS Sales / Receipts] ──> Transaction Processing (TRAN_DATA) ──> Daily Stock Ledger (DAILY_DATA)
                                                                       │
                       ┌───────────────────────────────────────────────┴───────────────────────────────┐
                       ▼                                                                               ▼
         Retail Accounting Method (RAM)                                                Cost Accounting Method
(Valued at current retail selling price & cumulative markon %)                       (Valued at Weighted Average Cost - WAC)
```

### Key Valuation Components:
1. **Weighted Average Cost (WAC):** Recalculates item/location unit cost automatically upon warehouse or store receipt.
2. **Cumulative Markon Percent (CM%):** Tracks historical markup percentages to convert total retail inventory value to cost basis under the Retail Accounting Method.
3. **Shrinkage Provision:** Applies estimated monthly shrinkage percentages to inventory balances prior to physical stocktake reconciliations.

---

## 3. Financial Operational Insights & Dashboards

### 3.1 Gross Margin & Cumulative Markon Variance
- **Business Goal:** Detects unexpected drops in gross margin or sudden shifts in cumulative markon percent across departments.
- **Finance Workflow:** Identifies unauthorized price markdowns, poor vendor cost negotiations, or high cost variance.

### 3.2 Open-to-Buy (OTB) Budgeting
- **Business Goal:** Tracks approved purchase order commitments (`ORDHEAD`) against allocated department buying budgets (`OTB`).
- **Finance Workflow:** Prevents over-committing corporate capital and ensures adequate budget remains for seasonal replenishment.

### 3.3 General Ledger Cross-Reference & Integration (FIF)
- **Business Goal:** Maps retail merchandise transactions (`TRAN_DATA`) to corporate Chart of Accounts (COA) general ledger accounts (`FIF_GL_CROSS_REF`).
- **Finance Workflow:** Resolves unposted or late-posted financial transactions before month-end financial book closing.

---

## 4. Stock Ledger & Financials Data Model Mapping

| Functional Area | Business Entity | Primary Physical Schema Tables |
| :--- | :--- | :--- |
| Stock Ledger Rollup | Monthly/Weekly Valuation | [STKLEDGR](file:///Volumes/Cabinet/Projects/NiDM%20-%20Retail%20Logical%20Schema%20Design/.agents/skills/rms_stock_ledger_financials/references/STKLEDGR.md) |
| Daily Stock Data | Daily Sales, Receipts, Adjustments | `DAILY_DATA`, `WEEK_DATA` |
| Transaction Audit | Raw Financial Transactions | `TRAN_DATA_A`, `TRAN_DATA_B` |
| Open to Buy (OTB) | Monthly Department Budgets | `OTB` |
| GL Integration (FIF) | Chart of Accounts Cross-Ref | `FIF_GL_CROSS_REF`, `FIF_GL_ACCT` |
| Wholesale Financials | Franchise Billing & Margins | `WF_BILLING_SALES`, `WF_COST_BUILDUP_TMPL_DETAIL` |
