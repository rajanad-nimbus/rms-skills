# Suppliers, Procurement & RTV Functional Workflows & Reports

The **Suppliers, Procurement & RTV** module manages supplier master definitions, vendor performance scorecards, return to vendor (RTV) shipments, and procurement contract terms across Oracle RMS.

---

## 1. Core Business Concepts & Roles

### Primary User Persona: Vendor Manager / Procurement Specialist
The **Vendor Manager** is responsible for onboarding suppliers, configuring supplier ordering traits (minimum order value, lead times, payment terms), negotiating procurement contracts, and evaluating vendor fill-rate performance.

---

## 2. Supplier Lifecycle & Procurement Setup

Suppliers (`SUPS`) represent primary merchandise vendors, manufacturer agents, or import partners:

```
[Supplier Onboarding] ──> Configure Ordering Traits ──> Negotiate Procurement Contracts ──> Monitor Fill Rate & RTV
```

### Key Configuration Elements:
1. **Supplier Traits:** Defines supplier classifications, minority status, compliance traits, and EDI capabilities.
2. **Order Management Controls:** Specifies minimum order quantities (`MIN_ORDER_QTY`), bracket costing parameters, and lead time days (`SUP_LEAD_TIME`).
3. **Payment & Freight Terms:** Links standard freight terms (`FREIGHT_TERMS`) and cash discount payment terms (`TERMS_HEAD`) to purchase orders.

---

## 3. Return to Vendor (RTV) Workflows

### 3.1 Return to Vendor Lifecycle (`RTV_HEAD`)
- **Business Cause:** Damaged inventory, expired merchandise, overstocked items, or recalled goods returned to the supplier.
- **Workflow Stages:**
  1. *RTV Request:* Store/warehouse initiates an RTV request for specific items and quantities (`RTV_DETAIL`).
  2. *Vendor Authorization:* Vendor issues a Return Merchandise Authorization (RMA) number.
  3. *Physical Shipment:* Inventory is picked from Unavailable SOH (`MRT`) and shipped to vendor.
  4. *Credit Memo Match:* ReIM matches the RTV shipment against the vendor's credit memo.

### 3.2 Supplier Performance Scorecarding
- **Business Goal:** Tracks vendor delivery performance (On-Time Delivery %, Order Fill Rate %, Shortage Rates).
- **Procurement Workflow:** Used during contract renewals to negotiate vendor rebates, cost discounts, or vendor penalties for missed delivery windows.

---

## 4. Suppliers & Procurement Data Model Mapping

| Functional Area | Business Entity | Primary Physical Schema Tables |
| :--- | :--- | :--- |
| Supplier Master | Vendor Header & Address | [SUPS](file:///Volumes/Cabinet/Projects/NiDM%20-%20Retail%20Logical%20Schema%20Design/.agents/skills/rms_suppliers_procurement/references/SUPS.md) |
| Supplier Inventory Mgmt | Lead Times & Min Order Qty | `SUP_INV_MGMT`, `SUP_BRACKET_COST` |
| Return to Vendor (RTV) | RTV Headers & Lines | `RTV_HEAD`, `RTV_DETAIL` |
| Procurement Contracts | Annual Vendor Contracts | `CONTRACT_HEADER`, `CONTRACT_DETAIL` |
| Business Partners | Import Partners & Freight Co | `PARTNER` |
