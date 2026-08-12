# Item Master & Product Attributes Functional Workflows & Reports

The **Item Master & Product Attributes** module governs product definitions, item hierarchies (Styles, SKUs, Packs, UPCs), item-supplier-location relationships, User Defined Attributes (UDAs), and mass item update lifecycle processes across Oracle RMS.

---

## 1. Core Business Concepts & Roles

### Primary User Persona: Data Steward / Merchandising Manager
The **Data Steward** ensures product master data integrity, creates new item hierarchies, sets up item-location relationships, configures User Defined Attributes (UDAs), and resolves bulk item update exceptions.

---

## 2. Item Master Hierarchy & Structure

Oracle RMS uses a 3-level flexible item structure to model products from high-level styles down to scannable barcodes:

```
Level 1: Item Header / Style (e.g., Denim Jeans - Style #1001)
  └── Level 2: Transaction Level SKU (e.g., Denim Jeans - Size 32 / Blue)
        └── Level 3: Barcode / UPC / EAN (e.g., Scannable UPC #123456789012)
```

### Key Item Types:
1. **Standard Items:** Single SKUs sold at retail locations.
2. **Fashion Items / Diffs:** Style-level items with color/size variations (`DIFF_GROUP`).
3. **Packs:** Simple packs, complex packs, or fashion buyer packs (`PACKITEM`) containing multiple SKUs.
4. **Deposit Items:** Reusable containers, bottles, or pallets linked to base items.

---

## 3. Operational Workflows & Data Steward Monitoring

### 3.1 Incomplete Items Resolution (Data Steward Dashboard)
- **Business Problem:** New items created in draft state missing critical operational attributes (e.g., primary supplier, cost, department, tax code, or location ranged) cannot be ordered or sold.
- **Data Steward Workflow:** Identifies incomplete items daily and completes missing attributes to transition items to *Approved* status (`ITEM_MASTER.STATUS = 'A'`).

### 3.2 Mass Item Change Processing & Rejection Handling
- **Business Goal:** Executes bulk updates across thousands of items (e.g., mass department reclassification, supplier cost updates, or UDA changes).
- **Exception Resolution:** Items failing validation (e.g., item locked by active purchase order or conflicting replenishment method) are logged to the Mass Item Change Rejection Report for steward remediation.

---

## 4. Item Master Data Model Mapping

| Functional Area | Business Entity | Primary Physical Schema Tables |
| :--- | :--- | :--- |
| Item Master | Style, SKU, Status, UOM | [ITEM_MASTER](file:///Volumes/Cabinet/Projects/NiDM%20-%20Retail%20Logical%20Schema%20Design/.agents/skills/rms_item_master/references/ITEM.md) |
| Item Locations | Ranged Locations, Retail Price | `ITEM_LOC` |
| Item Suppliers | Supplier Cost, Primary Vendor | `ITEM_SUPPLIER`, `ITEM_SUPP_COUNTRY` |
| Item Diffs / Variations | Color, Size, Flavor Diffs | `DIFF_GROUP`, `DIFF_IDS` |
| User Defined Attributes | UDAs, Dates, Free Forms | `UDA`, `UDA_ITEM_FF` |
| Item Lists | Dynamic SKU Lists | `SKULIST_HEAD`, `SKULIST_DETAIL` |
