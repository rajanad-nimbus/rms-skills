# ReSA Outbound Exports - System Options & Implementation Configurations

This reference documents the system configuration options, export control parameters, General Ledger cross-referencing rules, and target system flags for ReSA outbound financial postings (`saexprms`, `saexpgl`, `saexpach`).

---

## 1. System Options & Posting Flags (`SA_SYSTEM_OPTIONS`)

| Parameter Name | Default / Values | Config Level | Detailed Business & Functional Impact |
| :--- | :--- | :--- | :--- |
| `RMS_POSTING_IND` | `Y` / `N` | System | Enables direct database insertion of audited sales into RMS Stock Ledger (`TRAN_DATA_HISTORY`). |
| `GL_POSTING_IND` | `Y` / `N` | System | Enables General Ledger account mapping and journal export (`saexpgl`). |
| `ACH_POSTING_IND` | `Y` / `N` | System | Enables automated clearinghouse bank file generation (`saexpach`). |
| `SIM_POSTING_IND` | `Y` / `N` | System | Enables real-time inventory adjustment exports to store SIM/WMS (`saexpsim`). |
| `POS_FEEDBACK_IND` | `Y` / `N` | System | Enables cashier over/short feedback export to POS (`saexppos`). |

---

## 2. General Ledger Cross-Reference Configuration (`SA_FIF_GL_CROSS_REF`)

- Maps store tender types (Cash, Credit Card, Gift Card, Check) and total categories to enterprise ERP General Ledger segment combinations.
- Ensures debits and credits balance cleanly per store day audit.
