# RMS Suppliers & Procurement Master - Functional User Guide Workflows

Comprehensive functional user guide covering Supplier Master data, supplier sites, payment terms, freight terms, and business partner setup (`SUPS`, `CONTRACT`, `PARTNER`).

---

## 1. Key User Roles & Responsibilities

| User Role | Primary UI Tasks | Key Approvals & Overrides |
| :--- | :--- | :--- |
| **Supplier Data Administrator** | Creates supplier master records, site addresses, banking details, payment terms. | Approves supplier site activation (`SUPS.SUPP_STATUS = 'A'`). |
| **Procurement Specialist** | Assigns freight terms, minimum order thresholds, and lead time profiles. | Authorizes supplier status changes. |

---

## 2. Step-by-Step UI Operational Workflows

### 2.1 Supplier Master & Site Setup
1. Navigate to **Tasks -> Foundation Data -> Supplier Maintenance**.
2. Enter corporate supplier name, tax identification number, primary currency, and payment terms (e.g. Net 30).
3. Create ordering and check-paying **Supplier Sites** (`SUPS` child records).
4. Assign country sourcing capabilities and primary freight terms.
5. Click **Activate Supplier**.
