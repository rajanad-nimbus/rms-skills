# RMS Purchase Orders - System Options & Implementation Configurations

This reference documents the system configuration parameters, PO approval rules, tolerance limits, cost calculation flags, and operational parameters for Oracle RMS Procurement (`ORDHEAD`, `ORDLOC`, `ORDSKU`).

---

## 1. System Options & PO Parameters (`SYSTEM_OPTIONS`)

| Parameter Name | Default / Values | Config Level | Detailed Business & Functional Impact |
| :--- | :--- | :--- | :--- |
| `AUTO_APPROVE_PO_IND` | `Y` / `N` | System | Controls whether EDI / RIB generated purchase orders auto-approve or remain in Unapproved status. |
| `OVER_RECEIVE_TOLERANCE` | `5%` | System / Supplier | Percentage over order quantity allowed during PO warehouse/store receiving. |
| `ELC_IND` | `Y` / `N` | System | Enables Estimated Landed Cost (ELC) calculation engine across PO lines. |
| `BRACKET_COST_IND` | `Y` / `N` | System / Supplier | Enables volume bracket cost adjustments based on total PO unit quantity or weight. |
| `CANCEL_DEVIATION_DAYS` | `7` Days | System | Number of days past PO cancel date before automated PO purge occurs. |

---

## 2. PO Approval Rules & Lifecycle Constraints

1. **Supplier Ranging**: POs can only be placed with active suppliers (`SUPS.SUPP_STATUS = 'A'`) who source the requested items (`ITEM_SUPP_COUNTRY`).
2. **Cost Validation**: Base unit cost defaults from primary supplier country cost (`ITEM_SUPP_COUNTRY.UNIT_COST`) unless overridden by active Vendor Deals (`DEAL_HEAD`).
3. **Multi-Location Scaling**: Scaling POs proportionally distributes quantities across target store locations (`ORDLOC`) based on min/max stock rules.
