# RMS Merchandise Hierarchy - Functional User Guide Workflows

Comprehensive functional user guide covering Merchandise Hierarchy maintenance, Division/Group/Department structure, and reclassification workflows (`GROUPS`, `DEPS`, `CLASS`, `SUBCLASS`).

---

## 1. Key User Roles & Responsibilities

| User Role | Primary UI Tasks | Key Approvals & Overrides |
| :--- | :--- | :--- |
| **Merchandise Data Administrator** | Defines merchandise hierarchy levels, creates departments, classes, subclasses. | Approves department structure changes. |
| **Category Manager** | Assigns buyer and merchandise planner responsibilities to departments. | Approves item reclassification requests. |

---

## 2. Step-by-Step UI Operational Workflows

### 2.1 Hierarchy Level Maintenance & Item Reclassification
1. Navigate to **Tasks -> Foundation Data -> Merchandise Hierarchy Maintenance**.
2. Select target level (Division -> Group -> Department -> Class -> Subclass) to create or edit node descriptions and markup formulas.
3. For item reclassifications, go to **Tasks -> Items -> Item Reclassification**. Select item SKUs and define the target department/class.
4. Submit reclassification. System schedules the batch process (`reclass.pc`) to execute historical stock ledger rollups.
