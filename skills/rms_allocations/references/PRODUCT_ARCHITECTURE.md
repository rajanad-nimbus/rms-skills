# RMS Allocations - RRL 16 Product Architecture (RRA & RSG)

This reference documents the **Oracle Retail Reference Architecture (RRA)** product domain mappings, supply chain allocation topologies, and **Retail Service Group (RSG)** service payload interfaces for Oracle Retail Allocation.

---

## 1. Enterprise Allocation Product Architecture

```mermaid
graph LR
    subgraph Planning & Forecasting Domain
        RDF[Demand Forecasting System]
        AP[Assortment Planning]
    end

    subgraph Merchandising Domain [RMS Foundation]
        RMSItem[Item Master & Loc Ranging]
        RMSInventory[SOH & PO Available In-Stock]
    end

    subgraph Allocation Engine [Oracle Retail Allocation]
        AllocCalc[Demand Calculation Engine]
        WhatIf[What-If PO Generation]
    end

    subgraph Logistics Domain [WMS & Store Operations]
        WMS[Warehouse Management System]
        SIM[Store Inventory Management]
    end

    RDF & AP -->|Sales Forecasts & Model Stocks| AllocCalc
    RMSItem & RMSInventory -->|Inventory Availability| AllocCalc
    AllocCalc -->|What-If PO Request| RMSInventory
    AllocCalc -->|Approved Allocations (AllocPub)| WMS
    WMS -->|Pick & Ship Confirmation| SIM
```

---

## 2. RSG Integration Schemas & Interfaces

| Service Name | RSG Business Payload | Description |
| :--- | :--- | :--- |
| **`AllocPub`** | `AllocDesc` | Publishes approved store allocations to WMS for picking and shipping. |
| **`AllocMod`** | `AllocModDesc` | Publishes allocation modifications and store quantity changes. |
| **`AllocDel`** | `AllocDelDesc` | Publishes allocation cancellation notices to WMS. |

---

## 3. Architecture Rules

1. **Integrated Allocation Management**: Oracle Retail Allocation shares physical database tables (`ALLOC_HEADER`, `ALLOC_DETAIL`) directly with RMS to ensure real-time inventory reservation.
2. **What-If Purchase Order Generation**: When allocated demand exceeds current DC stock, Allocation triggers a What-If engine that creates a recommended PO in RMS (`ORDHEAD`) directly linked to the store allocation requirements.
