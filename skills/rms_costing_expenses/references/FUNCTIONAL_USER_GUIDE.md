# RMS Costing & Landed Cost - Functional User Guide Workflows

Comprehensive functional user guide covering base cost maintenance, Estimated Landed Cost (ELC) calculation components, expenses, and tariffs (`COST_ZONE_GROUP`, `CE_HEAD`, `COMPHEAD`).

---

## 1. Key User Roles & Responsibilities

| User Role | Primary UI Tasks | Key Approvals & Overrides |
| :--- | :--- | :--- |
| **Costing Specialist** | Maintains cost zone groups, manages base costs, defines expense components. | Submits cost changes for approval. |
| **Import / Freight Controller** | Configures landed cost components (freight, insurance, customs duty, agent fees). | Approves ELC component updates (`COMPHEAD`). |

---

## 2. Step-by-Step UI Operational Workflows

### 2.1 Managing Base Cost & Cost Zones
1. Navigate to **Tasks -> Costing -> Cost Change Maintenance**.
2. Select the target Item, Supplier, and Cost Zone Group.
3. Enter the new base unit cost and effective date.
4. Click **Apply**. System recalculates the future cost timeline (`FUTURE_COST`).

### 2.2 Defining Estimated Landed Cost (ELC)
1. Go to **Tasks -> Costing -> Expenses & Landed Cost**.
2. Associate landed cost components (Customs Duty %, Ocean Freight per UOM, Handling Fee) with the item-supplier country record.
3. The calculation engine aggregates base cost + ELC expenses to compute the total Estimated Landed Cost used for PO margin evaluation.
