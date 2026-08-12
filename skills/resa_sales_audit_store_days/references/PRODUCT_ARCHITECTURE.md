# ReSA Store Day Balances - RRL 16 Product Architecture (RRA & RSG)

This reference documents the **Oracle Retail Reference Architecture (RRA)** store day audit product domain mappings, cashier balancing topology, and **Retail Service Group (RSG)** interface specs for ReSA Store Day Balances.

---

## 1. Enterprise Store Day Product Architecture

```mermaid
graph TD
    subgraph Store POS Systems
        Xstore[Xstore POS Till Declaration]
        CashMaster[Cash Management Systems]
    end

    subgraph ReSA Totals Domain [ReSA Store Day Engine]
        StoreDay[Store Day Master - SA_STORE_DAY]
        TotalsEngine[Totals Calculation Engine - satotals]
        BankReconcile[Bank Deposit Reconciler - SA_BANK]
    end

    subgraph Enterprise Accounting Domain [General Ledger & Banking]
        Bank[Corporate Commercial Bank]
        GL[General Ledger - saexpgl]
    end

    Xstore & CashMaster -->|Declared Tender Totals| StoreDay
    StoreDay --> TotalsEngine
    TotalsEngine <--> BankReconcile
    Bank -->|Electronic Bank ACH Feed| BankReconcile
    TotalsEngine -->|Audited Tender Totals| GL
```

---

## 2. RSG Integration Schemas & Interfaces

| Service Interface | Payload Schema | Description |
| :--- | :--- | :--- |
| **`TenderTotalsOut`** | `TenderTotalsDesc` | Exports audited tender totals to General Ledger for bank account reconciliation. |
| **`StoreDayStatusOut`** | `StoreDayStatusDesc` | Transmits store day audit status updates (Unedited, In-Progress, Closed). |
