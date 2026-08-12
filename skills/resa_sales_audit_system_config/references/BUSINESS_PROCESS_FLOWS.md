# ReSA System Setup & Security - Business Process Flows (ReSA UG Ch 3)

This reference documents the official **Oracle Retail Sales Audit (ReSA) User Guide (Chapter 3 - Setting up ReSA)** system setup flows, error code definition, parameter initialization, system options configuration, and security role administration.

---

## 1. Process Overview & Key Roles

System Setup & Configuration establishes global operational parameters governing transaction validation, rule execution thresholds, error severity levels, and security access permissions across Sales Auditors, Store Managers, and System Administrators.

### Operational Roles:
- **ReSA Administrator**: Configures system options (`SA_SYSTEM_OPTIONS`), defines error codes (`SA_ERROR_CODES`), manages parameter types (`SA_PARM_TYPE`).
- **Security Administrator**: Assigns ADF Security duty roles (Sales Auditor, Store Auditor, Audit Supervisor) and taskflow permissions.

---

## 2. System Setup Workflow

```mermaid
flowchart TD
    A[Initial System Provisioning] --> B[3.1 Configure System Options - SA_SYSTEM_OPTIONS]
    B --> C[3.2 Define Error Codes & Impact Categories - SA_ERROR_CODES / SA_ERROR_IMPACT]
    C --> D[3.3 Configure Metadata Parameters - SA_PARM]
    D --> E[3.4 Establish Store Days & Audit Lock Timeouts]
    E --> F[3.5 Assign ADF Duty Roles & Security Policies]
    F --> G[ReSA Operational Environment Ready]
```

---

## 3. Sub-Process Breakdown

### Sub-Process 3.1: System Options Configuration
- Configures global audit behavior:
  - `AUDIT_LEVEL`: Store vs Till vs Cashier level auditing.
  - `BALANCING_LEVEL`: Strict balancing vs soft threshold warning.
  - `LOCK_TIMEOUT_MINUTES`: Lock duration for store day editing.

### Sub-Process 3.2: Error Codes & Impact
- Defines system error codes and categorizes them into **Fatal** (blocks audit completion and Stock Ledger export) or **Warning** (informational alert for auditor).
