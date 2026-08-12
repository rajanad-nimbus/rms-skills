# RMS Store Allocations - System Options & Implementation Configurations

This reference documents the system configuration parameters, allocation calculation rules, foundation dependencies, and operational constraints governing Oracle Retail Store Allocations (`SYSTEM_OPTIONS`, `ALLOC_HEADER`, `ALC_ITEM_LOC`).

---

## 1. System Options & Allocation Parameters (`SYSTEM_OPTIONS`)

| Parameter Name | Default / Values | Config Level | Detailed Business & Functional Impact |
| :--- | :--- | :--- | :--- |
| `ALLOC_MODE` | `AUTO` / `MANUAL` | System | Determines whether demand allocation suggestions are automatically generated or require user confirmation. |
| `DEFAULT_MIN_WOS` | `4` Weeks | System / Dept | Default minimum Weeks of Supply (WOS) threshold used for inventory replenishment allocations. |
| `AUTO_RECEIVE_IND` | `Y` / `N` | Store | Determines if store allocations automatically receive upon shipment dispatch from DC. |
| `ALLOC_LEAD_TIME` | `2` Days | System | Transfer lead time window added to allocation demand forecasting calculations. |
| `ALLOC_CROSS_DOCK_IND` | `Y` / `N` | Warehouse | Enables PO cross-dock allocation routing directly from receipt dock to store shipment. |

---

## 2. Allocation Calculation Rules & Methods

1. **Plan Demand Method**: Allocates stock based on merchandise sales plans, receipt plans, and top-down targets from financial planning.
2. **Forecast Demand Method**: Allocates stock according to statistical item-store demand forecasts (`FORECAST` table).
3. **History Sales Method**: Allocates stock using historical sales trend averages across specified historical date ranges.
4. **Corporate Rule Method**: Allocates stock using pre-configured store weighting profiles (e.g. A-Store gets 40%, B-Store gets 30%).

---

## 3. Operational Rules & System Constraints

- **Location Ranging Validation**: Items can only be allocated to stores where the item-location ranging matrix (`ITEM_LOC`) is active.
- **Stock-On-Hand Check**: Outbound allocations validate source warehouse sellable stock on hand (`ITEM_LOC_SOH.STOCK_ON_HAND - TSF_RESERVED_QTY`).
- **PO-to-Allocation Reservation**: Allocations tied to open POs automatically reserve quantities upon PO receipt.
