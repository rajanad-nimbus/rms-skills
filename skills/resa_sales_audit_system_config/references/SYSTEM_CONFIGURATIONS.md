# ReSA System Setup & Security - System Options & Implementation Configurations

This reference documents global ReSA system options, error code impact levels, metadata parameter types, and ADF security duty roles (`SA_SYSTEM_OPTIONS`, `SA_ERROR_CODES`, `SA_PARM`).

---

## 1. Global System Options (`SA_SYSTEM_OPTIONS`)

| Parameter Name | Values | Config Level | Detailed Business & Functional Impact |
| :--- | :--- | :--- | :--- |
| `AUDIT_LEVEL` | `S` (Store) / `T` (Till) / `C` (Cashier) | System | Granularity level at which transaction audit and cashier balancing occurs. |
| `BALANCING_LEVEL` | `STRICT` / `SOFT` | System | Controls whether store day audit completion requires exact tender balancing or permits soft warnings. |
| `LOCK_TIMEOUT_MINUTES` | `30` Minutes | System | Duration of store day editing lock before lock automatically expires. |
| `RETAIN_DAYS` | `45` Days | System | Retention days for audited POS transactions before purging batch runs (`sapurge`). |

---

## 2. Error Code Impact Classifications (`SA_ERROR_CODES`)

| Impact Category | Severity Level | Operational Impact |
| :--- | :--- | :--- |
| **FATAL** | High | Blocks Store Day from reaching Audited status; prevents Stock Ledger export (`saexprms`). |
| **WARNING** | Medium | Informational alert for auditor; allows Store Day audit completion. |
