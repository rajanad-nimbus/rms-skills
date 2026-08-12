# ReIM Invoice Matching - System Options & Implementation Configurations

This reference documents system configuration options, 3-way invoice matching tolerances, non-merchandise cost codes, and General Ledger posting parameters for Oracle Retail Invoice Matching (`INVC_HEAD`, `INVC_DETAIL`, `INVC_MATCH_QUEUE`).

---

## 1. System Options & Matching Parameters (`SYSTEM_OPTIONS`)

| Parameter Name | Default / Values | Config Level | Detailed Business & Functional Impact |
| :--- | :--- | :--- | :--- |
| `MATCH_TOLERANCE_PCT` | `1.0%` | System / Supplier | Cost variance tolerance percentage allowed between PO unit cost and Invoice unit cost. |
| `QTY_TOLERANCE_PCT` | `0.0%` | System | Quantity variance tolerance percentage allowed between Receipt quantity and Invoice quantity. |
| `AUTO_MATCH_IND` | `Y` / `N` | System | Enables automated 3-way matching batch job execution (`imatch`). |
| `DEBIT_MEMO_AUTO_IND` | `Y` / `N` | System | Automatically generates debit memos for cost/quantity invoice overcharges. |

---

## 2. 3-Way Matching Rules & Tolerance Execution

1. **Summary Matching**: Invoice totals are compared against PO receipt totals at header level. If within summary tolerance, invoice is matched automatically.
2. **Detail Matching**: If summary match fails, line-by-line item matching occurs against PO receipt lines (`SHIPSKU`).
3. **Discrepancy Resolution**: Cost discrepancies generate Credit Memo requests; quantity discrepancies generate Debit Memos.
