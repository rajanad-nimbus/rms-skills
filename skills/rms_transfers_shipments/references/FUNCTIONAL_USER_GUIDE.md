# RMS Transfers & Shipments - Functional User Guide Workflows

Comprehensive functional user guide covering inter-store transfers, warehouse shipment dispatch, ASN tracking, and receiving reconciliation (`TSFHEAD`, `SHIPMENT`, `BOL_SHIPMENT`).

---

## 1. Key User Roles & Responsibilities

| User Role | Primary UI Tasks | Key Approvals & Overrides |
| :--- | :--- | :--- |
| **Logistics Coordinator** | Creates inter-store transfer requests, monitors warehouse pick schedules. | Approves transfer requests (`TSFHEAD.STATUS = 'A'`). |
| **Store Receiving Clerk** | Receives inbound store shipments, records carton count variances, logs damage tickets. | Confirms shipment receipt (`SHIPMENT.STATUS = 'R'`). |

---

## 2. Step-by-Step UI Operational Workflows

### 2.1 Transfer Creation & Dispatch Lifecycle
1. Navigate to **Tasks -> Inventory -> Create Transfer**.
2. Select **Transfer Type** (Store to Store, DC to Store, Store to DC) and enter source/destination locations.
3. Add item SKUs and requested quantities.
4. Click **Approve**. System reserves stock at source location (`ITEM_LOC_SOH.TSF_RESERVED_QTY`).
5. Upon warehouse dispatch, system generates a Bill of Lading (`BOL_SHIPMENT`) and publishes outbound ASN RIB messages (`ShipmentPub`). In-transit quantities update automatically (`IN_TRANSIT_QTY`).
