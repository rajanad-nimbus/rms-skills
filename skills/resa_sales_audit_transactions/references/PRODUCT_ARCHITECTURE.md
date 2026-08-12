# ReSA Sales Audit - RRL 16 Product Architecture (RRA & RSG)

This reference documents the **Oracle Retail Reference Architecture (RRA)** product domain mappings, store transaction topologies, and **Retail Service Group (RSG)** interface specifications for Oracle Retail Sales Audit (ReSA).

---

## 1. Enterprise Store & Audit Product Architecture

```mermaid
graph TD
    subgraph Store Systems Domain [POS & Channels]
        Xstore[Oracle Xstore POS]
        ECom[e-Commerce Storefront]
        OMS[Order Management System]
    end

    subgraph Sales Audit Domain [Oracle ReSA Engine]
        RTLog[RTLog Ingest / Staging]
        ReSAEngine[ReSA Audit Rules Engine]
        ReSAUI[Auditor Error Revision UI]
    end

    subgraph Merchandising & Analytics Domain [MOM & Retail Insights]
        RMS[RMS Stock Ledger & SOH]
        RI[Oracle Retail Insights]
        RPM[RPM Promotions Audit]
    end

    Xstore & ECom & OMS -->|Raw Sales Data (RTLog)| RTLog
    RTLog --> ReSAEngine
    ReSAEngine <-->|Error Correction| ReSAUI
    ReSAEngine -->|Audited Sales - saexprms| RMS
    ReSAEngine -->|Sales Totals - saexgri| RI
    ReSAEngine -->|Promo Usage| RPM
```

---

## 2. RSG Integration Schemas & Interface Services

| Service Name | RSG Business Payload | Description |
| :--- | :--- | :--- |
| **`SalesTransactionIn`** | `RTLogDesc` / `PosTransaction` | Real-time / Batch RTLog ingestion of POS sales, returns, and void transactions. |
| **`AuditedSalesOut`** | `AuditedSalesDesc` | Publishes audited item-level sales to RMS, WMS, and Planning. |
| **`TenderTotalsOut`** | `TenderTotalsDesc` | Exports audited cashier and tender totals to General Ledger (GL). |

---

## 3. Data Integrity & Audit Principles

1. **Immutable Original Data**: ReSA preserves raw imported POS data (`SA_TRAN_HEAD_ORIG`) alongside audited modified data (`SA_TRAN_HEAD`) for 100% forensic auditability.
2. **Synchronized Stock Ledger Postings**: Item returns without receipts are automatically flagged and tracked in `TRAN_DATA_HISTORY` with specialized return transaction codes.
