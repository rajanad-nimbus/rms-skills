# ReSA Sales Audit Exports - Product Architecture (ReSA OG Ch 2 & 12)

This reference documents the **Oracle Retail Sales Audit (ReSA)** export product architecture, ADF taskflows, RESTful Web Services, and RIB payload contracts for outbound integration.

---

## 1. Export Integration Topology

```mermaid
graph TD
    subgraph Core ReSA Database
        AuditedData[Audited Store Day Transactions - SA_TRAN_HEAD]
        ExportLog[Export Execution Log - SA_EXPORT_LOG]
    end

    subgraph Outbound Batch Engines
        saexprms[saexprms Batch]
        saexpgl[saexpgl Batch]
        saexpach[saexpach Batch]
    end

    subgraph Downstream Targets
        RMS[RMS Stock Ledger - TRAN_DATA_HISTORY]
        GL[General Ledger / ERP]
        Bank[Commercial Bank ACH]
    end

    AuditedData --> saexprms & saexpgl & saexpach
    saexprms --> RMS
    saexpgl --> GL
    saexpach --> Bank
    saexprms & saexpgl & saexpach --> ExportLog
```

---

## 2. Interface Schemas & Web Services

| Batch / Interface | Target System | Data Exchanged |
| :--- | :--- | :--- |
| **`saexprms`** | RMS Stock Ledger | Audited sales, returns, discounts, sales tax, markdowns. |
| **`saexpgl`** | Oracle ERP / GL | Audited tender totals mapped to GL account combinations. |
| **`saexpach`** | Commercial Bank | Bank deposit slips and ACH transmission clearance. |
| **`saexpsim`** | SIM / WMS | Real-time inventory adjustment receipts from POS returns. |
| **`saexppos`** | Xstore POS | Cashier over/short feedback and coupon validation errors. |
