# RMS Purchase Orders - RRL 16 Product Architecture (RRA & RSG)

This reference details the **Oracle Retail Reference Architecture (RRA)** product domain mappings, system interaction topologies, enterprise integration boundaries, and **Retail Service Group (RSG)** message contracts for Purchase Orders.

---

## 1. Enterprise Product Domain Mapping

Purchase Order Management spans multiple product domains within the Oracle Retail Reference Architecture:

```mermaid
graph LR
    subgraph Planning Domain [Planning & Financials]
        MFP[Merchandising Financial Planning]
        AP[Assortment Planning]
        OTB[Open To Buy Engine]
    end

    subgraph Merchandising Domain [Merchandising Operations (MOM)]
        RMS[Oracle RMS Core Engine]
        CE[Costing Engine / ELC]
        SUPP[Supplier Master & Ranging]
    end

    subgraph Logistics Domain [Logistics & Supply Chain]
        WMS[Warehouse Management System]
        SIM[Store Inventory Management]
    end

    subgraph Integration Bus [Retail Integration Bus (RIB)]
        POSub[POSub / VendorOrder API]
        Receiving[Receiving / ASN API]
    end

    MFP & AP -->|Budgets & Plans| OTB
    OTB -->|OTB Checks| RMS
    RMS <-->|Costing & Expenses| CE
    RMS <-->|Supplier Rules| SUPP
    RMS -->|PO Publish (POSub)| Integration Bus
    Integration Bus -->|Purchase Orders| WMS & SIM
    WMS & SIM -->|Receipt / ASN Data| Receiving
    Receiving -->|Inventory Receipts| RMS
```

---

## 2. Retail Integration Bus (RIB) & RSG Service Contracts

| Message Type / Service | RSG Business Object | Triggering Event | Primary RIB Topic |
| :--- | :--- | :--- | :--- |
| **`POSub`** | `VendorOrder` / `POCreation` | PO Status changed to `A` (Approved) | `etPOSub` |
| **`POMod`** | `VendorOrderMod` / `PORevision` | PO Header/Detail edited (`STATUS='A'`) | `etPOMod` |
| **`PODel`** | `VendorOrderDel` / `POCancel` | PO Lines or Header cancelled | `etPODel` |
| **`Receiving`** | `Receipt` / `ASNIn` | Store/DC receives goods against PO | `etReceiving` |

---

## 3. Data Integration Boundaries & Architecture Rules

1. **Master System of Record**:
   - RMS is the sole system of record for Purchase Order Header (`ORDHEAD`), Line Items (`ORDSKU`), and Location Allocation (`ORDLOC`).
2. **Open-to-Buy (OTB) Real-time Synchronization**:
   - Upon PO Approval (`STATUS='A'`), `ORDHEAD.APPROVED_DATE` is stamped, and OTB tables are instantly updated to reserve open purchasing budget.
3. **External Order Induction API**:
   - External systems (e.g., AIP, MFP, 3rd Party Planning) induct orders into RMS staging tables (`SVC_ORD_HEAD`, `SVC_ORD_DETAIL`).
   - The batch service program `ordindct` processes induction records, executes business validation, and promotes records into core `ORDHEAD` tables.
