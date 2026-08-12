# RMS Inventory & Stocktake - Functional User Guide Workflows

Comprehensive functional user guide covering daily inventory tracking, stock adjustments, physical stocktake count lifecycles, and Operational Insights (OI) inventory dashboards (`ITEM_LOC_SOH`, `INV_ADJ`, `STAKE_HEAD`).

---

## 1. Key User Roles & Responsibilities

| User Role | Primary UI Tasks | Key Approvals & Overrides |
| :--- | :--- | :--- |
| **Inventory Control Manager** | Oversees perpetual stock positions, schedules stock counts, approves count variances. | Approves stock count adjustments (`INV_ADJ`) exceeding cost variance limits. |
| **Store Inventory Clerk** | Performs physical stock counts, inputs count tickets, records inventory adjustments. | Enters damaged / non-sellable stock status changes. |
| **Logistics Coordinator** | Monitors in-transit stock positions, resolves transfer receiving discrepancies. | Approves stock transfer status changes. |

---

## 2. Step-by-Step UI Operational Workflows

### 2.1 Performing Inventory Adjustments
1. Navigate to **Tasks -> Inventory -> Inventory Adjustments**.
2. Search for the target item SKU and location (Store or Warehouse).
3. Select the appropriate **Adjustment Reason Code** (e.g., Damaged, Shrinkage, Promotional Sample, Store Use).
4. Enter the adjustment quantity and select the target **Inventory Status** (e.g. Sellable to Non-Sellable).
5. Click **Submit**. The system updates `ITEM_LOC_SOH` in real-time and logs audit records in `INV_ADJ`.

### 2.2 Physical Stock Count (Stocktake) Lifecycle
1. **Schedule Count**: Go to **Tasks -> Inventory -> Physical Inventory -> Schedule Count**. Define count date, location, and merchandise hierarchy filters (Department / Class).
2. **Generate Snapshot**: System creates count snapshot records in `STAKE_HEAD` and `STAKE_CONT`.
3. **Enter Count Quantities**: Input physical store counts via mobile scanner RIB ingestion or manually on the **Count Entry** screen.
4. **Variance Reconciliation**: Review the **Stock Count Variance Report**. Items exceeding variance thresholds (`STK_RECON_IND`) require manager review.
5. **Finalize Count**: Click **Apply Adjustments** to update perpetual stock-on-hand balances (`ITEM_LOC_SOH`) and post stock loss/gain to the Stock Ledger.

---

## 3. Operational Insights (OI) Reports & Dashboard Widgets

- **Inventory Adjustments Report**: Displays stock adjustment transactions exceeding pre-configured unit, cost, or retail variance limits.
- **Missing Stocktake Results Alert Widget**: Identifies locations where scheduled stock counts have passed without submitted count data.
- **Stock-On-Hand Variance Dashboard Widget**: Displays top 10 items with highest inventory shrink value per department.
