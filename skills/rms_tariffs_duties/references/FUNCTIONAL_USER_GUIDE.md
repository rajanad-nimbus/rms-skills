# RMS Tariffs & Customs Duties (HTS) - Functional User Guide Workflows

Comprehensive functional user guide covering Harmonized Tariff Schedule (HTS) codes, customs duty calculations, tax rates, and trade country fee structures (`HTS`, `HTS_CHAPTER`, `HTS_TAX`).

---

## 1. Key User Roles & Responsibilities

| User Role | Primary UI Tasks | Key Approvals & Overrides |
| :--- | :--- | :--- |
| **Trade Compliance Specialist** | Maintains HTS tariff classification tables, duty rate percentages, trade agreements. | Approves HTS tariff schedule updates. |
| **Customs Auditor** | Verifies duty calculations on import purchase orders and customs entry files. | Authorizes duty assessment overrides. |

---

## 2. Step-by-Step UI Operational Workflows

### 2.1 Maintaining HTS Codes & Duty Rates
1. Navigate to **Tasks -> Foundation Data -> HTS Maintenance**.
2. Search by 10-digit HTS code number or chapter description (`HTS_CHAPTER`).
3. Define applicable ad valorem duty rates (%), specific duty rates per unit, and preferential trade agreement discounts (e.g. USMCA).
4. Link HTS codes to imported item master records (`ITEM_SUPP_COUNTRY.HTS`).
