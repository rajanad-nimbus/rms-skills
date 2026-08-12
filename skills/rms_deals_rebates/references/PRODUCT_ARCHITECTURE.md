# RMS Vendor Deals & Rebates - RRL 16 Product Architecture (RRA & RSG)

This reference documents the **Oracle Retail Reference Architecture (RRA)** deal management product domain mappings, financial accrual topology, and **Retail Service Group (RSG)** interface specs for Vendor Deals & Rebates.

---

## 1. Enterprise Deal Product Architecture

```mermaid
graph TD
    subgraph Sourcing & Procurement Domain
        Supplier[Supplier Master & Agreements]
        PO[Purchase Order Engine - ORDHEAD]
    end

    subgraph Deal Management Domain [RMS Core Deals]
        DealEngine[Deal Calculation Engine - DEAL_HEAD]
        Actuals[Volume & Income Tracking - DEAL_ACTUALS]
    end

    subgraph Financials Domain [ReIM & General Ledger]
        ReIM[Oracle ReIM Invoice Matching]
        GL[General Ledger Accruals]
    end

    Supplier --> DealEngine
    PO -->|Receiving Volumes| Actuals
    DealEngine --> Actuals
    Actuals -->|Earned Income Accrual| GL
    Actuals -->|Vendor Credit Invoices| ReIM
```

---

## 2. RSG Integration Schemas & Interfaces

| Service Interface | Payload Schema | Description |
| :--- | :--- | :--- |
| **`VendorDealPub`** | `VendorDealDesc` | Transmits approved deal structures to external planning systems. |
| **`DealIncomeOut`** | `DealIncomeDesc` | Exports earned deal income and vendor billbacks to Financials/GL. |
