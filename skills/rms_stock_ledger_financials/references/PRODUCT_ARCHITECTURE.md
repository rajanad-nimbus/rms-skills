# RMS Stock Ledger Financials - RRL 16 Product Architecture (RRA & RSG)

This reference documents the **Oracle Retail Reference Architecture (RRA)** financial accounting product domain mappings, GL integration topology, and **Retail Service Group (RSG)** interface specs for Stock Ledger Financials.

---

## 1. Enterprise Financial Product Architecture

```mermaid
graph TD
    subgraph Operational Systems Domain
        POS[ReSA Sales Audit - saexprms]
        Receiving[PO Receipts - SHIPMENT]
        InvAdj[Inventory Adjustments]
    end

    subgraph Stock Ledger Domain [RMS Financial Engine]
        TranData[TRAN_DATA_HISTORY Audit Log]
        DailyData[DAILY_DATA Rollup Engine]
        MonthData[MONTH_DATA Financial Ledger]
    end

    subgraph Corporate Financials Domain [ERP & General Ledger]
        GLCrossRef[FIF GL Cross Reference]
        OracleGL[Oracle ERP Cloud General Ledger]
    end

    POS & Receiving & InvAdj -->|Tran Codes 01, 20, 22| TranData
    TranData --> DailyData
    DailyData --> MonthData
    MonthData --> GLCrossRef
    GLCrossRef -->|GL Journal Entries - fifgldn| OracleGL
```

---

## 2. RSG Integration Schemas & Interfaces

| Service Interface | Payload Schema | Description |
| :--- | :--- | :--- |
| **`GLPostingOut`** | `GLPostingDesc` | Transmits aggregated financial debits and credits to corporate GL. |
| **`StockLedgerPub`** | `StockLedgerDesc` | Transmits weekly/monthly financial inventory valuation to Retail Insights (RI). |
