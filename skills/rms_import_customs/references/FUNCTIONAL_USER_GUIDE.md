# RMS Import Management & Customs - Functional User Guide Workflows

Comprehensive functional user guide covering customs entry tracking, commercial invoices, Letters of Credit (LC), and HTS tariff classification (`CE_HEAD`, `LC_HEAD`, `HTS`).

---

## 1. Key User Roles & Responsibilities

| User Role | Primary UI Tasks | Key Approvals & Overrides |
| :--- | :--- | :--- |
| **Import Manager** | Tracks shipment customs entry forms, manages import documentation, opens LCs. | Authorizes Letter of Credit drawdowns. |
| **Customs Broker** | Inputs customs clearance assessment details, duty payments, and vessel manifests. | Submits cleared Customs Entry records (`CE_HEAD`). |

---

## 2. Step-by-Step UI Operational Workflows

### 2.1 Managing Customs Entries & Letters of Credit
1. Navigate to **Tasks -> Import Management -> Customs Entry**.
2. Link the import shipment to the target Purchase Order and Commercial Invoice number.
3. Input port of entry, clearing customs broker ID, and duty fee breakdowns (`CE_CHARGES`).
4. Link active Letter of Credit (`LC_HEAD`) to guarantee vendor payment upon Bill of Lading (`BOL`) presentation.
5. Click **Clear Entry** upon customs release.
