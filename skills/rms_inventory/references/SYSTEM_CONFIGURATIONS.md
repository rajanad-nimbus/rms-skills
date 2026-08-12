# RMS Inventory & Stocktake - System Options & Implementation Configurations

This reference documents the system options, stock-on-hand tracking parameters, stocktake reconciliation modes, and inventory status codes (`ITEM_LOC_SOH`, `INV_ADJ`, `STAKE_HEAD`).

---

## 1. System Options & Inventory Parameters (`SYSTEM_OPTIONS`)

| Parameter Name | Default / Values | Config Level | Detailed Business & Functional Impact |
| :--- | :--- | :--- | :--- |
| `STK_RECON_IND` | `Y` / `N` | System | Enables automated physical stock count reconciliation processing (`stkrec`). |
| `NEG_SOH_IND` | `Y` / `N` | System | Controls whether sellable Stock-On-Hand (`ITEM_LOC_SOH.STOCK_ON_HAND`) is permitted to go negative. |
| `INV_VALUATION_METHOD` | `WAC` / `FIFO` | System | Inventory valuation calculation mode (Weighted Average Cost vs First-In First-Out). |
| `DEFAULT_INV_STATUS` | `1` (Sellable) | System | Default inventory status assigned upon receipt at store/warehouse. |

---

## 2. Inventory Status Codes & Adjustment Types

| Status Code | Description | Sellable Flag | Stock Ledger Impact |
| :--- | :--- | :--- | :--- |
| `1` | **Sellable** | `Y` | Included in active stock on hand. |
| `2` | **Damaged** | `N` | Moved to `NON_SELLABLE_QTY`. |
| `3` | **Hold / Quarantine** | `N` | Moved to `NON_SELLABLE_QTY` awaiting inspection. |
| `4` | **RTV Hold** | `N` | Reserved for Return-to-Vendor shipment (`RTV_QTY`). |
