# RMS Purchase Orders - Functional User Guide Workflows

Comprehensive functional user guide covering PO creation, supplier deal application, multi-location distribution scaling, order approval, and revision lifecycles (`ORDHEAD`, `ORDLOC`, `ORDSKU`).

---

## 1. Key User Roles & Responsibilities

| User Role | Primary UI Tasks | Key Approvals & Overrides |
| :--- | :--- | :--- |
| **Buyer** | Creates purchase orders, negotiates vendor costs, assigns delivery schedules. | Submits POs for approval; requests cost overrides. |
| **Merchandising Manager** | Reviews buyer order commitments, monitors Open-To-Buy (OTB) budgets. | Approves purchase orders (`ORDHEAD.STATUS = 'A'`). |
| **EDI / Order Administrator** | Manages electronic PO transmission, resolves RIB ingestion errors. | Re-transmits EDI 850 order payloads. |

---

## 2. Step-by-Step UI Operational Workflows

### 2.1 Creating a Purchase Order
1. Navigate to **Tasks -> Orders -> Create Order**.
2. Select the **Supplier Site**, **Department**, and **Order Type** (N/B - Normal Buyer, Cross Dock, Emergency).
3. Add item SKUs to the order grid. Base unit cost defaults automatically from `ITEM_SUPP_COUNTRY`.
4. Enter target delivery locations (Stores / DCs) and allocate line quantities (`ORDLOC`).
5. Verify order scaling metrics (Truckload weight / cube constraints).
6. Click **Submit for Approval**.

### 2.2 PO Approval & Revision Lifecycle
1. The Merchandising Manager opens **Tasks -> Orders -> Approve Orders**.
2. System validates OTB budget availability (`DISC_OTB_APPLY`) and supplier ranging.
3. Upon approval (`STATUS = 'A'`), the system locks order header details, publishes the PO RIB message (`POPub`), and reserves open receiving capacity at destination locations.
4. Subsequent modifications generate a new PO revision number (`REV_ORDHEAD`).

---

## 3. Operational Insights (OI) Reports & Dashboard Widgets

- **Open PO Exception Widget**: Highlights unapproved POs past their target ship date.
- **Supplier Delivery Performance Scorecard**: Displays supplier On-Time In-Full (OTIF) receipt compliance percentages.
- **PO Cost Variance Report**: Flags items where PO unit cost deviates from master cost timeline (`FUTURE_COST`).
