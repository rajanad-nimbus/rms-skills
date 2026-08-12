# RMS Vendor Deals & Rebates - Functional User Guide Workflows

Comprehensive functional user guide covering vendor deal setup, complex rebate calculations, fixed allowances, and deal income billing (`DEAL_HEAD`, `DEAL_DETAIL`, `DEAL_ACTUALS`).

---

## 1. Key User Roles & Responsibilities

| User Role | Primary UI Tasks | Key Approvals & Overrides |
| :--- | :--- | :--- |
| **Vendor Deal Coordinator** | Configures deal headers, defines rebate brackets, assigns eligible merchandise. | Submits deals for manager sign-off. |
| **Financial Accountant** | Audits deal accruals, generates vendor debit memos, reconciles deal income. | Approves deal billing statements (`DEAL_ACTUALS`). |

---

## 2. Step-by-Step UI Operational Workflows

### 2.1 Setting Up a Vendor Deal
1. Navigate to **Tasks -> Deals -> Create Deal**.
2. Select **Deal Type** (Off-Invoice, Turnover Rebate, Fixed Allowance, Promotional Rebate).
3. Define the active date range, billing frequency (Monthly/Quarterly), and target supplier.
4. Specify merchandise eligibility (Department / Class / Item List) and billing calculation tiers (e.g. 2% rebate over $100k sales, 4% over $250k).
5. Click **Approve**. System initiates daily turnover accumulation (`DEAL_ACTUALS`).
