# RMS Costing & Expenses - RRL 16 Product Architecture (RRA & RSG)

This reference documents the **Oracle Retail Reference Architecture (RRA)** costing product domain mappings, Future Cost engine integration topology, and **Retail Service Group (RSG)** interface specs for Costing & Expenses.

---

## 1. Enterprise Costing Product Architecture

```mermaid
graph LR
    subgraph Sourcing & Customs Domain
        Supplier[Supplier Sourcing - ITEM_SUPP_COUNTRY]
        HTS[Customs & Duty Engine - HTS]
    end

    subgraph Costing Domain [RMS Cost Engine]
        CostChange[Cost Change Engine]
        ELC[ELC Calculation Component]
        FutureCost[Future Cost Timeline Engine]
    end

    subgraph Operations & Financials
        PO[Purchase Order Engine]
        StockLedger[Stock Ledger - WAC]
    end

    Supplier & HTS --> CostChange
    CostChange --> ELC
    ELC --> FutureCost
    FutureCost -->|Active Cost| PO & StockLedger
```

---

## 2. RSG Integration Schemas & Interfaces

| Service Interface | Payload Schema | Description |
| :--- | :--- | :--- |
| **`CostChangePub`** | `CostChangeDesc` | Publishes approved cost changes to planning, WMS, and ReIM systems. |
| **`ELCUpd`** | `ELCDesc` | Transmits updated Estimated Landed Cost (ELC) components. |
