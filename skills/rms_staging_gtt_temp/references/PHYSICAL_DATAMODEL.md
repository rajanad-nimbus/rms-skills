# RMS Staging, GTT & Temporary Work Tables Datamodel - Physical Data Model Reference

## Table: DATE_DIST_TEMP

**Description:** This temporary table is used by the date distribution object to temporarily store records before writing them back out to the calling form appropriately.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | CONTRACT_NO |  |  | Y | NUMERIC (6) | This field contains a number that uniquely identifies a contract. |
| 2 | DIST_DATE |  |  | Y | Date | This field contains the date specified for distribution. |
| 3 | DIST_PCT |  |  | Y | NUMERIC (12,4) | This field contains the percentage that should be distributed for the specified date. |

---

## Table: GENERIC_GLOBAL_TEMP

**Description:** This table is used to aid processing for various programs

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | COL1_VAR60 |  |  |  | VARCHAR (60) | This column usually contain key values (unique) |
| 2 | COL2_VAR100 |  |  |  | VARCHAR (100) | String value in relation to the key value |
| 3 | COL3_NUM30 |  |  |  | NUMERIC (30) | Numeric value in relation to the key value |
| 4 | COL4_DATE |  |  |  | Date | Date value in relation to the key value |

---

## Table: GTT_10_NUM_10_STR_10_DATE

**Description:** A global temporary table with ten numeric values, string values, and date values.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | NUMBER_1 |  |  |  | NUMERIC (20,4) | numeric value 1 |
| 2 | NUMBER_2 |  |  |  | NUMERIC (20,4) | numeric value 2 |
| 3 | NUMBER_3 |  |  |  | NUMERIC (20,4) | numeric value 3 |
| 4 | NUMBER_4 |  |  |  | NUMERIC (20,4) | numeric value 4 |
| 5 | NUMBER_5 |  |  |  | NUMERIC (20,4) | numeric value 5 |
| 6 | NUMBER_6 |  |  |  | NUMERIC (20,4) | numeric value 6 |
| 7 | NUMBER_7 |  |  |  | NUMERIC (20,4) | numeric value 7 |
| 8 | NUMBER_8 |  |  |  | NUMERIC (20,4) | numeric value 8 |
| 9 | NUMBER_9 |  |  |  | NUMERIC (20,4) | numeric value 9 |
| 10 | NUMBER_10 |  |  |  | NUMERIC (20,4) | numeric value 10 |
| 11 | VARCHAR2_1 |  |  |  | VARCHAR (255 BYTE) | string value 1 |
| 12 | VARCHAR2_2 |  |  |  | VARCHAR (255 BYTE) | string value 2 |
| 13 | VARCHAR2_3 |  |  |  | VARCHAR (255 BYTE) | string value 3 |
| 14 | VARCHAR2_4 |  |  |  | VARCHAR (255 BYTE) | string value 4 |
| 15 | VARCHAR2_5 |  |  |  | VARCHAR (255 BYTE) | string value 5 |
| 16 | VARCHAR2_6 |  |  |  | VARCHAR (255 BYTE) | string value 6 |
| 17 | VARCHAR2_7 |  |  |  | VARCHAR (255 BYTE) | string value 7 |
| 18 | VARCHAR2_8 |  |  |  | VARCHAR (255 BYTE) | string value 8 |
| 19 | VARCHAR2_9 |  |  |  | VARCHAR (255 BYTE) | string value 9 |
| 20 | VARCHAR2_10 |  |  |  | VARCHAR (255 BYTE) | string value 10 |
| 21 | DATE_1 |  |  |  | Date | date value 1 |
| 22 | DATE_2 |  |  |  | Date | date value 2 |
| 23 | DATE_3 |  |  |  | Date | date value 3 |
| 24 | DATE_4 |  |  |  | Date | date value 4 |
| 25 | DATE_5 |  |  |  | Date | date value 5 |
| 26 | DATE_6 |  |  |  | Date | date value 6 |
| 27 | DATE_7 |  |  |  | Date | date value 7 |
| 28 | DATE_8 |  |  |  | Date | date value 8 |
| 29 | DATE_9 |  |  |  | Date | date value 9 |
| 30 | DATE_10 |  |  |  | Date | date value 10 |

---

## Table: GTT_15_NUM_15_STR_15_DATE

**Description:** A global temporary table with 15 numeric values, string values, and date values.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | NUMBER_1 |  |  |  | NUMERIC (20,4) | numeric value 1 |
| 2 | NUMBER_2 |  |  |  | NUMERIC (20,4) | numeric value 2 |
| 3 | NUMBER_3 |  |  |  | NUMERIC (20,4) | numeric value 3 |
| 4 | NUMBER_4 |  |  |  | NUMERIC (20,4) | numeric value 4 |
| 5 | NUMBER_5 |  |  |  | NUMERIC (20,4) | numeric value 5 |
| 6 | NUMBER_6 |  |  |  | NUMERIC (20,4) | numeric value 6 |
| 7 | NUMBER_7 |  |  |  | NUMERIC (20,4) | numeric value 7 |
| 8 | NUMBER_8 |  |  |  | NUMERIC (20,4) | numeric value 8 |
| 9 | NUMBER_9 |  |  |  | NUMERIC (20,4) | numeric value 9 |
| 10 | NUMBER_10 |  |  |  | NUMERIC (20,4) | numeric value 10 |
| 11 | NUMBER_11 |  |  |  | NUMERIC (20,4) | numeric value 11 |
| 12 | NUMBER_12 |  |  |  | NUMERIC (20,4) | numeric value 12 |
| 13 | NUMBER_13 |  |  |  | NUMERIC (20,4) | numeric value 13 |
| 14 | NUMBER_14 |  |  |  | NUMERIC (20,4) | numeric value 14 |
| 15 | NUMBER_15 |  |  |  | NUMERIC (20,4) | numeric value 15 |
| 16 | VARCHAR2_1 |  |  |  | VARCHAR (255 ) | string value 1 |
| 17 | VARCHAR2_2 |  |  |  | VARCHAR (255 ) | string value 2 |
| 18 | VARCHAR2_3 |  |  |  | VARCHAR (255 ) | string value 3 |
| 19 | VARCHAR2_4 |  |  |  | VARCHAR (255 ) | string value 4 |
| 20 | VARCHAR2_5 |  |  |  | VARCHAR (255 ) | string value 5 |
| 21 | VARCHAR2_6 |  |  |  | VARCHAR (255 ) | string value 6 |
| 22 | VARCHAR2_7 |  |  |  | VARCHAR (255 ) | string value 7 |
| 23 | VARCHAR2_8 |  |  |  | VARCHAR (255 ) | string value 8 |
| 24 | VARCHAR2_9 |  |  |  | VARCHAR (255 ) | string value 9 |
| 25 | VARCHAR2_10 |  |  |  | VARCHAR (255 ) | string value 10 |
| 26 | VARCHAR2_11 |  |  |  | VARCHAR (255 ) | string value 11 |
| 27 | VARCHAR2_12 |  |  |  | VARCHAR (255 ) | string value 12 |
| 28 | VARCHAR2_13 |  |  |  | VARCHAR (255 ) | string value 13 |
| 29 | VARCHAR2_14 |  |  |  | VARCHAR (255 ) | string value 14 |
| 30 | VARCHAR2_15 |  |  |  | VARCHAR (255 ) | string value 15 |
| 31 | DATE_1 |  |  |  | Date | date value 1 |
| 32 | DATE_2 |  |  |  | Date | date value 2 |
| 33 | DATE_3 |  |  |  | Date | date value 3 |
| 34 | DATE_4 |  |  |  | Date | date value 4 |
| 35 | DATE_5 |  |  |  | Date | date value 5 |
| 36 | DATE_6 |  |  |  | Date | date value 6 |
| 37 | DATE_7 |  |  |  | Date | date value 7 |
| 38 | DATE_8 |  |  |  | Date | date value 8 |
| 39 | DATE_9 |  |  |  | Date | date value 9 |
| 40 | DATE_10 |  |  |  | Date | date value 10 |
| 41 | DATE_11 |  |  |  | Date | date value 11 |
| 42 | DATE_12 |  |  |  | Date | date value 12 |
| 43 | DATE_13 |  |  |  | Date | date value 13 |
| 44 | DATE_14 |  |  |  | Date | date value 14 |
| 45 | DATE_15 |  |  |  | Date | date value 15 |

---

## Table: GTT_6_NUM_6_STR_6_DATE

**Description:** A global temporary table with six numeric values, string values, and date values.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | NUMBER_1 |  |  |  | NUMERIC (20,4) | numeric value 1 |
| 2 | NUMBER_2 |  |  |  | NUMERIC (20,4) | numeric value 2 |
| 3 | NUMBER_3 |  |  |  | NUMERIC (20,4) | numeric value 3 |
| 4 | NUMBER_4 |  |  |  | NUMERIC (20,4) | numeric value 4 |
| 5 | NUMBER_5 |  |  |  | NUMERIC (20,4) | numeric value 5 |
| 6 | NUMBER_6 |  |  |  | NUMERIC (20,4) | numeric value 6 |
| 7 | VARCHAR2_1 |  |  |  | VARCHAR (255 BYTE) | string value 1 |
| 8 | VARCHAR2_2 |  |  |  | VARCHAR (255 BYTE) | string value 2 |
| 9 | VARCHAR2_3 |  |  |  | VARCHAR (255 BYTE) | string value 3 |
| 10 | VARCHAR2_4 |  |  |  | VARCHAR (255 BYTE) | string value 4 |
| 11 | VARCHAR2_5 |  |  |  | VARCHAR (255 BYTE) | string value 5 |
| 12 | VARCHAR2_6 |  |  |  | VARCHAR (255 BYTE) | string value 6 |
| 13 | DATE_1 |  |  |  | Date | date value 1 |
| 14 | DATE_2 |  |  |  | Date | date value 2 |
| 15 | DATE_3 |  |  |  | Date | date value 3 |
| 16 | DATE_4 |  |  |  | Date | date value 4 |
| 17 | DATE_5 |  |  |  | Date | date value 5 |
| 18 | DATE_6 |  |  |  | Date | date value 6 |

---

## Table: GTT_ALLOC_ORDER_NO

**Description:** GLOBAL TEMPORARY TABLE GTT_ALLOC_ORDER_NO

---

## Table: GTT_ALLOC_ORD_NO

**Description:** This is a global temporary table used to improve performance of tfsprg.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ORDER_NO |  |  |  | NUMERIC (12) | Contains the number that uniquely identifies an order within the system. |

---

## Table: GTT_COST_COMP_UPD

**Description:** This is a new global temporary table that is used to store the costing related table records that could get updated in the cost component procedures. The table is generic for all the cstcmpupdb.pls procedures and is used to do a one-time fetch of all the required records. The data in the table is not persistent, it is deleted after commit.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ROW_ID |  |  | Y | ROWID | Contains the row id of the table record to be updated. |
| 2 | EXP_PROF_KEY |  |  |  | NUMERIC (6) | Contains the unique number that is used to distinguish between the different profiles. |
| 3 | ITEM |  |  |  | VARCHAR (25) | Alphanumeric value that identifies the item. |
| 4 | SUPPLIER |  |  |  | NUMERIC (10) | The unique identifier for the supplier. |
| 5 | ITEM_EXP_TYPE |  |  |  | VARCHAR (1) | Contains the type of expense. |
| 6 | ITEM_EXP_SEQ |  |  |  | NUMERIC (6) | Contains a sequence number that is used to distinguish between the differentItem/Supplier expenses. |
| 7 | ORDER_NO |  |  |  | NUMERIC (12) | Used to store the order number, used in scenarios when the order loc expense or ordsku hts assessments are updated. |
| 8 | PACK_ITEM |  |  |  | VARCHAR (25) | The pack item number. |
| 9 | LOCATION |  |  |  | NUMERIC (10) | The location associated with the order expense |
| 10 | DEPT |  |  |  | NUMERIC (4) | Contains the department number. |
| 11 | FROM_LOC |  |  |  | NUMERIC (10) | Contains the location number of the location from which goods will be transferred. This column can contain either a store or a warehouse. |
| 12 | TO_LOC |  |  |  | NUMERIC (10) | Contains the location number of the location to which goods will be transferred. This column can contain either a store or a warehouse. |
| 13 | TSF_NO |  |  |  | NUMERIC (12) | Contains the transfer number associated with the Transfer that is fetched for update. |
| 14 | TSF_SEQ_NO |  |  |  | NUMERIC (8) | The sequence is directly taken from the TSFDETAIL table. |
| 15 | ALLOC_NO |  |  |  | NUMERIC (10) | Used to store the allocation number when an allocation is fetched for update. |
| 16 | HTS |  |  |  | VARCHAR (10) | This column stores the harmonized tariff number whenever assessments at various levels are fetched for update. |
| 17 | IMPORT_COUNTRY_ID |  |  |  | VARCHAR (3) | The unique identifier for the country that the item will be imported into. |
| 18 | ORIGIN_COUNTRY_ID |  |  |  | VARCHAR (3) | The country where the item was manufactured or significantly altered. |
| 19 | EFFECT_FROM |  |  |  | Date | The date from which the Item/HTS relationship is valid. This field is used to maintain historical information related to the Item/HTS relationship. |
| 20 | EFFECT_TO |  |  |  | Date | The date till which the Item/HTS relationship is valid. This field is used to maintain historical information related to the Item/HTS relationship. |
| 21 | SEQ_NO |  |  |  | NUMERIC (6) | This column is used to store the sequence value associated with hts assessments. |
| 22 | COMP_ID |  |  |  | VARCHAR (10) | Holds the component id associated with the cost component entries at any level. |
| 23 | CURR_COMP_RATE |  |  | Y | NUMERIC (20,4) | Contains the current rate to be charged against the calculation base. |
| 24 | CURR_COMP_CURRENCY |  |  |  | VARCHAR (3) | Contains the current currency the expense or assessment is to be entered in. |
| 25 | CURR_PER_COUNT |  |  |  | NUMERIC (12,4) | Contains the current count indicating the amount of the Per Count Unit of Measure to which the rate applies. |
| 26 | CURR_PER_COUNT_UOM |  |  |  | VARCHAR (4) | Contains the current unit of measure in which the Per Count is specified. |
| 27 | OLD_COMP_RATE |  |  | Y | NUMERIC (20,4) | Contains the old rate which was charged against the calculation base. |
| 28 | OLD_COMP_CURRENCY |  |  |  | VARCHAR (3) | Contains the old currency the expense or assessment was entered in. |
| 29 | OLD_PER_COUNT |  |  |  | NUMERIC (12,4) | Contains the old count indicating the amount of the Per Count Unit of Measure to which the rate applies. |
| 30 | OLD_PER_COUNT_UOM |  |  |  | VARCHAR (4) | Contains the old unit of measure in which the Per Count was specified. |
| 31 | NEW_COMP_RATE |  |  | Y | NUMERIC (20,4) | Contains the new rate to be charged against the calculation base. |
| 32 | NEW_COMP_CURRENCY |  |  |  | VARCHAR (3) | Contains the new currency the expense or assessment is to be entered in. |
| 33 | NEW_PER_COUNT |  |  |  | NUMERIC (12,4) | Contains the new count indicating the amount of the Per Count Unit of Measure to which the rate applies. |
| 34 | NEW_PER_COUNT_UOM |  |  |  | VARCHAR (4) | Contains the new unit of measure in which the Per Count is specified. |
| 35 | SHIPPED_IND |  |  |  | VARCHAR (1) | A flag to indicate whether the order/item holding the expense or assessment has been shipped. |
| 36 | NOM_FLAG_2 |  |  |  | VARCHAR (1) | Contains the value from the table ordloc_exp or ordsku_hts_assess.It indicates the status of the cost component. |
| 37 | CVB_CODE |  |  |  | VARCHAR (10) | Contains the value of the CVB_code taken up from the table cvb_head. |
| 38 | ORDER_STATUS |  |  |  | VARCHAR (1) | A flag to indicate the status of the concerned order/item. |
| 39 | EXCHANGE_RATE |  |  |  | NUMERIC (20,10) | This column will be used to store the exchange rate from the table cost_comp_upd_stg. |
| 40 | ZONE_ID |  |  |  | NUMERIC (10) | This column holds the zone_id of the item expense. |
| 41 | ZONE_GROUP_ID |  |  |  | NUMERIC (4) | This column holds the zone group id of the item expenses zone id. |

---

## Table: GTT_DEALEX_DEALID

**Description:** Global temporary table for deal_head table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEAL_ID |  |  | Y | NUMERIC (10) | Unique deal number, generated from a sequence. |

---

## Table: GTT_DEALEX_EXCLUDE

**Description:** Global temporary table for deal_head, deal_itemloc, and item_master.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEAL_ID |  |  | Y | NUMERIC (10) | Unique deal number, generated from a sequence. |
| 2 | DEAL_DETAIL_ID |  |  | Y | NUMERIC (10) | Deal component ID number, uniquely sequenced within each deal. |
| 3 | ITEM |  |  | Y | VARCHAR (25) | Unique alphanumeric value that identifies the item. |
| 4 | LOC_TYPE |  |  |  | VARCHAR (1) | Type of the location referenced in the location field. |
| 5 | LOCATION |  |  |  | NUMERIC (10) | Location for the item |

---

## Table: GTT_DEALEX_ITEM_MASTER

**Description:** Global temporary table for item_master, deps, and group tables.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DIVISION |  |  | Y | NUMERIC (4) | Contains the number which uniquely identifies the division of the company. |
| 2 | GROUP_NO |  |  | Y | NUMERIC (4) | Contains the number which uniquely identifies the group. |
| 3 | DEPT |  |  | Y | NUMERIC (4) | Number identifying the department to which the item is attached. |
| 4 | CLASS |  |  | Y | NUMERIC (4) | Number identifying the class to which the item is attached. |
| 5 | SUBCLASS |  |  | Y | NUMERIC (4) | Number identifying the subclass to which the item is attached. |
| 6 | ITEM |  |  | Y | VARCHAR (25) | Unique alphanumeric value that identifies the item. |
| 7 | STATUS |  |  | Y | VARCHAR (1) | Status of the item. |
| 8 | PACK_IND |  |  | Y | VARCHAR (1) | Indicates if the item is a pack. |
| 9 | SELLABLE_IND |  |  | Y | VARCHAR (1) | Indicates if pack item may be sold as a unit. |
| 10 | ORDERABLE_IND |  |  | Y | VARCHAR (1) | Indicates if pack item is orderable. |
| 11 | ITEM_PARENT |  |  |  | VARCHAR (25) | Alphanumeric value that uniquely identifies the item/group at the level above the item. |
| 12 | ITEM_GRANDPARENT |  |  |  | VARCHAR (25) | Alphanumeric value that uniquely identifies the item/group two levels above the item. |
| 13 | DIFF_1 |  |  |  | VARCHAR (10) | Diff_group or diff_id that differentiates the current item from its item_parent. |
| 14 | DIFF_2 |  |  |  | VARCHAR (10) | Diff_group or diff_id that differentiates the current item from its item_parent. |
| 15 | DIFF_3 |  |  |  | VARCHAR (10) | Diff_group or diff_id that differentiates the current item from its item_parent. |
| 16 | DIFF_4 |  |  |  | VARCHAR (10) | Diff_group or diff_id that differentiates the current item from its item_parent. |
| 17 | PROCESS_DATE |  |  |  | Date | Holds the date time stamp of the most recent process. |

---

## Table: GTT_DEALEX_MERCH

**Description:** Global temporary table for deal_head, deal_itemloc, and item_master.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEAL_ID |  |  | Y | NUMERIC (10) | Unique deal number, generated from a sequence. |
| 2 | DEAL_DETAIL_ID |  |  | Y | NUMERIC (10) | Deal component ID number, uniquely sequenced within each deal. |
| 3 | ITEM |  |  | Y | VARCHAR (25) | Unique alphanumeric value that identifies the item. |
| 4 | ITEM_PARENT |  |  |  | VARCHAR (25) | Alphanumeric value that uniquely identifies the item/group at the level above the item. |
| 5 | ITEM_GRANDPARENT |  |  |  | VARCHAR (25) | Alphanumeric value that uniquely identifies the item/group two levels above the item. |
| 6 | MERCH_LEVEL |  |  | Y | VARCHAR (6) | Indicates what level of the merchandise hierarchy the record is at |
| 7 | CHAIN |  |  |  | NUMERIC (10) | ID of the chain included in or excluded from the deal component. |
| 8 | AREA |  |  |  | NUMERIC (10) | ID of the area included in or excluded from the deal component. |
| 9 | REGION |  |  |  | NUMERIC (10) | ID of the region included in or excluded from the deal component. |
| 10 | DISTRICT |  |  |  | NUMERIC (10) | ID of the district included in or excluded from the deal component. |
| 11 | LOCATION |  |  |  | NUMERIC (10) | Location for the item |
| 12 | LOC_TYPE |  |  |  | VARCHAR (1) | Type of the location referenced in the location field. |
| 13 | ORIGIN_COUNTRY_ID |  |  |  | VARCHAR (3) | Origin country of the item that the deal component should apply to. |
| 14 | ORG_LEVEL |  |  |  | VARCHAR (6) | Indicates what level of the organizational hierarchy the record is at |
| 15 | EXCL_IND |  |  | Y | VARCHAR (1) | Indicates if the deal component item/location line is included in the deal component or excluded from it. |

---

## Table: GTT_DEALEX_ORGMERCH

**Description:** Global temporary table for store_hierarchy, item_loc, and gtt_dealex_merch tables.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEAL_ID |  |  | Y | NUMERIC (10) | Unique deal number, generated from a sequence. |
| 2 | DEAL_DETAIL_ID |  |  | Y | NUMERIC (10) | Deal component ID number, uniquely sequenced within each deal. |
| 3 | ITEM |  |  | Y | VARCHAR (25) | Unique alphanumeric value that identifies the item. |
| 4 | LOC_TYPE |  |  | Y | VARCHAR (1) | Type of location in the location field. |
| 5 | LOC |  |  | Y | NUMERIC (10) | Number of the location in which the item is to be found. |
| 6 | EXCL_IND |  |  | Y | VARCHAR (1) | Indicates if the deal component item/location line is included in the deal component or excluded from it. |

---

## Table: GTT_DEALINC_DEALS

**Description:** Global temporary table used by the dealinc module.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEAL_ID |  |  | Y | NUMERIC (10) | Contains the unique deal_id number |
| 2 | DEAL_DETAIL_ID |  |  | Y | NUMERIC (10) | Contains the deal component ID number, uniquely sequenced within each deal |
| 3 | STOCK_LEDGER_IND |  |  | Y | VARCHAR (1) | Indicates if the deal income accrual will also be written to the RMS stock ledger |
| 4 | DEAL_INCOME_CALCULATION |  |  |  | VARCHAR (6) | This will determine how the income will be calculated. |
| 5 | THRESHOLD_LIMIT_TYPE |  |  |  | VARCHAR (6) | Identifies whether thresholds will be set up as qty values, currency amount values or percentages (growth rebates only). |
| 6 | THRESHOLD_VALUE_TYPE |  |  |  | VARCHAR (6) | Identifies whether the discount values associated with the thresholds will be set up as qty values, currency amount values, percentages or fixed amounts. |
| 7 | REBATE_CALC_TYPE |  |  |  | VARCHAR (6) | Indicates if the rebate should be calculated using linear or scalar calculation methods. |
| 8 | CURRENCY_CODE |  |  | Y | VARCHAR (3) | Currency code of the deals currency. All costs on the deal will be held in this currency. |
| 9 | GROWTH_RATE_TO_DATE |  |  |  | NUMERIC (12,4) | The budget growth rate percentage for the deal to date. |
| 10 | CALC_TO_ZERO_IND |  |  |  | VARCHAR (1) | In cases where multiple thresholds are created but one does not exist from zero upwards, this additional indicator when checked will apply the income calculation from zero to the upper limit on the lower threshold rather than on just between the lower and upper limit of the lowest threshold. |
| 11 | TOTAL_ACTUAL_FIXED_IND |  |  | Y | VARCHAR (1) | This indicator is set to fix the total actual columns so as not to be recalculated when actual figures are captured. |
| 12 | REBATE_PURCH_SALES_IND |  |  |  | VARCHAR (6) | Indicates if the rebate should be applied to purchases or sales. |
| 13 | REPORTING_DATE |  |  | Y | Date | The date which identifies each reporting period. |
| 14 | REBATE_IND |  |  | Y | VARCHAR (1) | Indicates if the deal component is a rebate. Deal components can only be rebates for bill-back billing types. |
| 15 | LAST_REPORTING_DATE |  |  |  | Date | This is the last date for the reporting period for the deal |
| 16 | ACT_FOR_TURNOVER_TOTAL |  |  |  | NUMERIC (12,4) | Total forecast turnover for the deal component reporting period (forecast periods only). |

---

## Table: GTT_DEAL_ITEMLOC

**Description:** This table will temporarily hold records from the DEAL_HEAD table based on the 4 new DEAL_ITEMLOC tables

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEAL_ID |  |  | Y | NUMERIC (10) | Unique deal number, generated from a sequence |
| 2 | PARTNER_TYPE |  |  | Y | VARCHAR (6) | Type of the partner the deal applies to. |
| 3 | PARTNER_ID |  |  |  | VARCHAR (10) | Level of supplier hierarchy (e.g. manufacturer, distributor or wholesaler), set up as a partner in the PARTNER table, used for assigning rebates by a level other than supplier. |
| 4 | PARTNER_DESC |  |  |  | VARCHAR (240) | Contains the partners description or name. |
| 5 | SUPPLIER |  |  |  | NUMERIC (10) | Unique identifier for the supplier. |
| 6 | SUP_NAME |  |  |  | VARCHAR (240) | Contains the suppliers trading name. |
| 7 | TYPE |  |  | Y | VARCHAR (6) | Type of the deal. |
| 8 | STATUS |  |  | Y | VARCHAR (6) | Code for the status of the deal. |
| 9 | CURRENCY_CODE |  |  | Y | VARCHAR (3) | Currency code of the deals currency. All costs on the deal will be held in this currency. |
| 10 | ACTIVE_DATE |  |  | Y | Date | Date the deal will become active. This date will determine when deal components begin to be factored into item costs. For a PO-specific deal, the active_date will be the orders written date. |
| 11 | CLOSE_DATE |  |  |  | Date | Date the deal will/did end. This date determines when deal components are no longer factored into item costs. |
| 12 | CREATE_DATETIME |  |  | Y | Date | Date/time stamp of when the record was created. |
| 13 | CREATE_ID |  |  | Y | VARCHAR (30) | Oracle user ID of the user that entered the deal into the system. |
| 14 | APPROVAL_DATE |  |  |  | Date | Date the deal was approved. |
| 15 | REJECT_DATE |  |  |  | Date | Date the deal was rejected. |
| 16 | EXT_REF_NO |  |  |  | VARCHAR (30) | Any given external reference number associated with the deal. |
| 17 | ORDER_NO |  |  |  | NUMERIC (12) | Order the deal applies to, if the deal is PO-specific. |
| 18 | COMMENTS |  |  |  | VARCHAR (2000) | Free-form comments entered with the deal. |
| 19 | SECURITY_IND |  |  | Y | VARCHAR (1) | Indicator to determine deal security. If this indicator is checked, then only people with the same or greater access as the user that created the deal will be able to view and edit the deal. |

---

## Table: GTT_DEAL_PASSTHRU

**Description:** This table will temporarily hold all the modifications made to deal passthru values with type of modification (ADD,MOD,REM)

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEPT |  |  | Y | NUMERIC (4) | Department on which the deal is defined |
| 2 | SUPPLIER |  |  | Y | NUMERIC (10) | Supplier ID |
| 3 | COSTING_LOC |  |  | Y | NUMERIC (10) | This field contains the source warehouse for the franchise store applicable for the deal passthru. |
| 4 | LOCATION |  |  | Y | NUMERIC (10) | Franchise Stores |
| 5 | LOC_TYPE |  |  | Y | VARCHAR (1) | Location Type S for store |
| 6 | OLD_PASSTHRU_PCT |  |  | Y | NUMERIC (12,4) | Old passthru percentage |
| 7 | NEW_PASSTHRU_PCT |  |  | Y | NUMERIC (12,4) | New Passthru percentage |
| 8 | ACTION |  |  | Y | VARCHAR (3) | Denotes action performed (ADD,MOD or REM) |

---

## Table: GTT_DLYPRG_ITEM

**Description:** This table holds the items to be purged by the daily purge program.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  |  |  | VARCHAR (25) | This is the item to be purged by the daily purge program. |

---

## Table: GTT_FC_ITEM_EXP_DETAIL

**Description:** A global temporary table that is used to store the expense of an item

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  |  | Y | VARCHAR (25) | Alphanumeric value that identifies the item. |
| 2 | SUPPLIER |  |  | Y | NUMERIC (10) | The unique identifier for the supplier. |
| 3 | ITEM_EXP_TYPE |  |  | Y | VARCHAR (1) | Contains the type of expense. |
| 4 | ITEM_EXP_SEQ |  |  | Y | NUMERIC (6) | Contains a sequence number that is used to distinguish between the differentItem/Supplier expenses. |
| 5 | COMP_ID |  |  | Y | VARCHAR (10) | Holds the component id associated with the cost component entries at any level. |
| 6 | CVB_CODE |  |  |  | VARCHAR (10) | Contains the value of the CVB_code taken up from the table cvb_head. |
| 7 | COMP_RATE |  |  | Y | NUMERIC (20,4) | Contains the rate to be charged against the calculation base. |
| 8 | COMP_CURRENCY |  |  | Y | VARCHAR (3) | Contains the currency of the Up Charge component. |
| 9 | PER_COUNT |  |  |  | NUMERIC (12,4) | Contains a count indicating the amount of the Per Count Unit of Measure to which the rate applies. |
| 10 | PER_COUNT_UOM |  |  |  | VARCHAR (4) | Contains the unit of measure in which the Per Count is specified. |
| 11 | EST_EXP_VALUE |  |  | Y | NUMERIC (20,4) | Contains the estimated value of the expense in the expense's component currency. |
| 12 | NOM_FLAG_1 |  |  | Y | VARCHAR (1) | Contains a flag that is used to indicate the status of this particular nomination flag for a given expense. |
| 13 | NOM_FLAG_2 |  |  | Y | VARCHAR (1) | If ALC is turned on (i.e. system_options.import_ind = 'Y'), nom_flag_2 is used to indicate the status of a component in duty calculation nom_flag_4 is used to indicate the status of a component in ELC calculation nom_flag_5 is used to indicate the status of a component in ALC calculation i.e. these 3 flags can not be used for any other purposes if ALC is turned on. |
| 14 | NOM_FLAG_3 |  |  | Y | VARCHAR (1) | Contains a flag that is used to indicate the status of this particular nomination flag for a given expense. Nomination flags are used in the subsequent formation of Computation Value Bases (CVBs). |
| 15 | NOM_FLAG_4 |  |  | Y | VARCHAR (1) | Contains a flag that is used to indicate the status of this particular nomination flag for a given expense. Nomination flags are used in the subsequent formation of Computation Value Bases (CVBs). |
| 16 | NOM_FLAG_5 |  |  | Y | VARCHAR (1) | Contains a flag that is used to indicate the status of this particular nomination flag for a given expense. Nomination flags are used in the subsequent formation of Computation Value Bases (CVBs). |
| 17 | DISPLAY_ORDER |  |  | Y | NUMERIC (2) | Contains a numeric value that determines the display order of the expense or assessment when used in other modules. |
| 18 | CREATE_DATETIME |  |  | Y | Date | Date/time stamp of when the record was created. |
| 19 | LAST_UPDATE_DATETIME |  |  | Y | Date | Holds the date time stamp of the most recent update by the last_update_id. |
| 20 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | Holds the Oracle user-id of the user who most recently updated this record. |
| 21 | DEFAULTED_FROM |  |  |  | VARCHAR (6) | This field specifies the source from which the expense is been defaulted to the item |
| 22 | KEY_VALUE_1 |  |  |  | VARCHAR (10) | This will hold either the supplier value or Origin_country_id or the partner type, depending on the value of the defaulted_from column |
| 23 | KEY_VALUE_2 |  |  |  | VARCHAR (10) | When the expense is defaulted from a partner, this column will hold the value of the partner id. |
| 24 | ORIGIN_COUNTRY_ID |  |  | Y | VARCHAR (3) | The country where the item was manufactured or significantly altered |
| 25 | ACTIVE_DATE |  |  | Y | Date | Date on which the future cost expense becomes active |
| 26 | LOCATION |  |  | Y | NUMERIC (10) | This is the location number in which the item is to be found. |
| 27 | PACK_NO |  |  |  | VARCHAR (25) | Contains the pack no if the item is buyer pack. This is used for calcuating expenses for buyer packs. |

---

## Table: GTT_FC_ITEM_HTS_ASSESS

**Description:** This is a global temporary table that is used to store the items HTS Assess

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  |  | Y | VARCHAR (25) | Alphanumeric value that identifies the item. |
| 2 | HTS |  |  | Y | VARCHAR (10) | This column stores the harmonized tariff number whenever assessments at various levels are fetched for update. |
| 3 | IMPORT_COUNTRY_ID |  |  | Y | VARCHAR (3) | The unique identifier for the country that the item will be imported into. |
| 4 | ORIGIN_COUNTRY_ID |  |  | Y | VARCHAR (3) | The country where the item was manufactured or significantly altered. |
| 5 | EFFECT_FROM |  |  | Y | Date | The date from which the Item/HTS relationship is valid. This field is used to maintain historical information related to the Item/HTS relationship. |
| 6 | EFFECT_TO |  |  | Y | Date | The date till which the Item/HTS relationship is valid. This field is used to maintain historical information related to the Item/HTS relationship. |
| 7 | COMP_ID |  |  | Y | VARCHAR (10) | Holds the component id associated with the cost component entries at any level. |
| 8 | CVB_CODE |  |  |  | VARCHAR (10) | Contains a code representing the base value for calculating an expense. |
| 9 | COMP_RATE |  |  | Y | NUMERIC (20,4) | Contains the rate to be charged against the calculation base. |
| 10 | PER_COUNT |  |  |  | NUMERIC (12,4) | Contains a count indicating the amount of the Per Count Unit of Measure to which the rate applies. |
| 11 | PER_COUNT_UOM |  |  |  | VARCHAR (10) | Contains the unit of measure in which the Per Count is specified. |
| 12 | EST_ASSESS_VALUE |  |  | Y | NUMERIC (20,4) | Contains the calculated value of the Component |
| 13 | NOM_FLAG_1 |  |  | Y | VARCHAR (1) | Contains a flag that is used to indicate the status of this particular nomination flag for a given expense |
| 14 | NOM_FLAG_2 |  |  | Y | VARCHAR (1) | Contains a flag that is used to indicate the status of this particular nomination flag for a given expense. |
| 15 | NOM_FLAG_3 |  |  | Y | VARCHAR (1) | Contains a flag that is used to indicate the status of this particular nomination flag for a given expense |
| 16 | NOM_FLAG_4 |  |  | Y | VARCHAR (1) | Contains a flag that is used to indicate the status of this particular nomination flag for a given expense. |
| 17 | NOM_FLAG_5 |  |  | Y | VARCHAR (1) | Contains a flag that is used to indicate the status of this particular nomination flag for a given expense. |
| 18 | DISPLAY_ORDER |  |  | Y | NUMERIC (2) | Contains a numeric value that determines the display order of the expense or assessment when used in other modules. |
| 19 | CREATE_DATETIME |  |  | Y | Date | Date/time stamp of when the record was created. |
| 20 | LAST_UPDATE_DATETIME |  |  | Y | Date | Holds the date time stamp of the most recent update by the last_update_id. |
| 21 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | Holds the Oracle user-id of the user who most recently updated this record. |
| 22 | SUPPLIER |  |  | Y | VARCHAR (10) | This field contains the number of the supplier of the item. |
| 23 | ACTIVE_DATE |  |  |  | Date | Contains the date on which the markdown became active in the clearance event. |

---

## Table: GTT_INCOMP_ITEMS

**Description:** This global temporary table is used to populate data for Incomplete Items report.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | REQD_COMPLETION |  |  |  | NUMERIC (3) | Indicates the percentage of completion for the all parameteres configured as 'Required'. |
| 2 | ITEM_PARENT |  |  |  | VARCHAR (25 ) | Parent Item. |
| 3 | ITEM |  |  |  | VARCHAR (25 ) | Item. |
| 4 | ITEM_DESC |  |  |  | VARCHAR (250 ) | Item description. |
| 5 | STATUS |  |  |  | VARCHAR (1 ) | Item status. |
| 6 | ITEM_LEVEL |  |  |  | NUMERIC (1) | Item Level. |
| 7 | TRAN_LEVEL |  |  |  | NUMERIC (1) | Transaction Level. |
| 8 | DISPLAY_IND |  |  |  | VARCHAR (1 ) | Whether the item is to be displayed or not. |
| 9 | DEPT |  |  |  | NUMERIC (4) | Department to which item belongs. |
| 10 | DEPT_NAME |  |  |  | VARCHAR (120 ) | Department name. |
| 11 | CLASS |  |  |  | NUMERIC (4) | Class to which item belongs. |
| 12 | CLASS_NAME |  |  |  | VARCHAR (120 ) | Class name. |
| 13 | SUBCLASS |  |  |  | NUMERIC (4) | Subclass to which item belongs. |
| 14 | SUBCLASS_NAME |  |  |  | VARCHAR (120 ) | Subclass name. |
| 15 | CREATE_DATE |  |  |  | Date | Item Create Date. |
| 16 | CREATE_ID |  |  |  | VARCHAR (30 ) | Item Create ID. |
| 17 | PRIM_SUPPLIER |  |  |  | NUMERIC (10) | Primary Supplier Site of the Item. |
| 18 | PRIM_SUPPLIER_NAME |  |  |  | VARCHAR (240 ) | Primary Supplier Site name. |
| 19 | PRIM_COUNTRY |  |  |  | VARCHAR (3 ) | Primary Country of the item. |
| 20 | UNIT_COST |  |  |  | NUMERIC (20,4) | Unit cost of the item. |
| 21 | SELLING_RETAIL |  |  |  | NUMERIC (20,4) | Selling retail. |
| 22 | SUP_CURRENCY |  |  |  | VARCHAR (3 ) | Supplier Currency. |
| 23 | VPN |  |  |  | VARCHAR (30 ) | VPN. |
| 24 | PACK_IND |  |  |  | VARCHAR (1 ) | Indicates if the Item is a pack. |
| 25 | REF_ITEMS |  |  |  | NUMERIC (3) | Reference Items. |
| 26 | VAT |  |  |  | NUMERIC (3) | Value Added Tax. |
| 27 | SIMPLE_PACK |  |  |  | NUMERIC (3) | Simple Pack. |
| 28 | UDA |  |  |  | NUMERIC (3) | UDA. |
| 29 | LOCATION |  |  |  | NUMERIC (3) | Item Location. |
| 30 | SEASONS |  |  |  | NUMERIC (3) | Seasons/Phases. |
| 31 | REPLENISHMENT |  |  |  | NUMERIC (3) | Replenishment. |
| 32 | SUBS_ITEMS |  |  |  | NUMERIC (3) | Substitute Items. |
| 33 | DIMENSIONS |  |  |  | NUMERIC (3) | Dimensions. |
| 34 | RELATED_ITEMS |  |  |  | NUMERIC (3) | Related Items. |
| 35 | TICKET |  |  |  | NUMERIC (3) | Ticket. |
| 36 | HTS |  |  |  | NUMERIC (3) | HTS. |
| 37 | IMPORT_ATTR |  |  |  | NUMERIC (3) | Import Attributes. |
| 38 | IMAGES |  |  |  | NUMERIC (3) | Item Images. |

---

## Table: GTT_ITEM_EXP_DETAIL

**Description:** Global Temporary Table to hold the details from itemexp screen.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  |  |  | VARCHAR (25) | Item Number |
| 2 | SUPPLIER |  |  |  | NUMERIC (10) | Supplier Identifier |
| 3 | ITEM_EXP_TYPE |  |  |  | VARCHAR (1) | Item Expense Type |
| 4 | ITEM_EXP_SEQ |  |  |  | NUMERIC (6) | Item Expense Sequence |
| 5 | COMP_ID |  |  |  | VARCHAR (10) | Component ID |
| 6 | CVB_CODE |  |  |  | VARCHAR (10) | CVB Code |
| 7 | COMP_CURRENCY |  |  |  | VARCHAR (3) | Component Currency |
| 8 | COMP_RATE |  |  |  | NUMERIC (20,4) | Component Rate |
| 9 | PER_COUNT |  |  |  | NUMERIC (12,4) | Per Count |
| 10 | PER_COUNT_UOM |  |  |  | VARCHAR (4) | Per Count UOM |
| 11 | EST_EXP_VALUE |  |  |  | NUMERIC (20,4) | Estimated Expense Value |
| 12 | NOM_FLAG_1 |  |  |  | VARCHAR (1) | NOM Flag 1 |
| 13 | NOM_FLAG_2 |  |  |  | VARCHAR (1) | NOM Flag 2 |
| 14 | NOM_FLAG_3 |  |  |  | VARCHAR (1) | NOM Flag 3 |
| 15 | NOM_FLAG_4 |  |  |  | VARCHAR (1) | NOM Flag 4 |
| 16 | NOM_FLAG_5 |  |  |  | VARCHAR (1) | NOM Flag 5 |
| 17 | DEFAULTED_FROM |  |  |  | VARCHAR (6) | This field specifies the source from which the expense is been defaulted to the item. Valid values are, P - defaulted from a partner expense profile, S - defaulted from a supplier expense profile, C - defaulted from a country expense profile, M - manually added expenses. |
| 18 | KEY_VALUE_1 |  |  |  | VARCHAR (10) | This will hold either the supplier value or Origin_country_id or the partner type, depending on the value of the defaulted_from column. |
| 19 | KEY_VALUE_2 |  |  |  | VARCHAR (10) | When the expense is defaulted from a partner, this column will hold the value of the partner id. |

---

## Table: GTT_ITEM_HTS_ASSESS

**Description:** This table is a Global temporary table that will hold the original ITEM_HTS_ASSESS records for a given item/hts code. This temporary table will be used to determine if a cost event will have to be created due to changes related to the HTS of an item.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  |  |  | VARCHAR (25) | The Alphanumeric identifier for the item. |
| 2 | HTS |  |  |  | VARCHAR (25) | The unique identifier for the Harmonized Tariff Schedule code attached to the Item. |
| 3 | IMPORT_COUNTRY_ID |  |  |  | VARCHAR (3) | The unique identifier for the country that the item will be imported into. |
| 4 | ORIGIN_COUNTRY_ID |  |  |  | VARCHAR (3) | The country where the item was manufactured or significantly altered. |
| 5 | EFFECT_FROM_DATE |  |  |  | Date | The date from which the Item/HTS relationship is valid. This field is used to maintain historical information related to the Item/HTS relationship. |
| 6 | EFFECT_TO_DATE |  |  |  | Date | The date from which the Item/HTS relationship is valid. This field is used to maintain historical information related to the Item/HTS relationship. |
| 7 | COMP_ID |  |  |  | VARCHAR (10) | The code representing the specific assessment component. |
| 8 | CVB_CODE |  |  |  | VARCHAR (10) | The Computation Value Base representing the base value for calculating the assessment. |
| 9 | COMP_RATE |  |  |  | NUMERIC (20,4) | The rate to be charged against the calculation base. This field will hold a percentage value if the Calculation Basis of the Component is Value or a monetary amount if the Calculation Basis is Specific. |
| 10 | PER_COUNT |  |  |  | NUMERIC (12,4) | A count indicating the amount of the Per Count Unit of Measure to which the rate applies. This column is only used for specific (per-unit) assessments. |
| 11 | PER_COUNT_UOM |  |  |  | VARCHAR (4) | The unit of measure in which the Per Count is specified. This column is only used from specific (per-unit) assessments. |
| 12 | EST_ASSESS_VALUE |  |  |  | NUMERIC (20,4) | This is the calculated value of the Component. |
| 13 | NOM_FLAG_1 |  |  |  | VARCHAR (1) | This is a flag that is used to indicate the status of this particular nomination flag for a given expense. Valid values are N, +, and -. |
| 14 | NOM_FLAG_2 |  |  |  | VARCHAR (1) | This is a flag that is used to indicate the status of this particular nomination flag for a given expense. Valid values are N, +, and -. |
| 15 | NOM_FLAG_3 |  |  |  | VARCHAR (1) | This is a flag that is used to indicate the status of this particular nomination flag for a given expense. Valid values are N, +, and -. |
| 16 | NOM_FLAG_4 |  |  |  | VARCHAR (1) | This is a flag that is used to indicate the status of this particular nomination flag for a given expense. Valid values are N, +, and -. |
| 17 | NOM_FLAG_5 |  |  |  | VARCHAR (1) | This is a flag that is used to indicate the status of this particular nomination flag for a given expense. Valid values are N, +, and -. |
| 18 | DISPLAY_ORDER |  |  |  | NUMERIC (2) | This is a numeric value that determines the display order of the expense or assessment when used in other modules. |
| 19 | CREATE_DATETIME |  |  |  | Date | The Date/time stamp of when the record was created. This date/time will be used in export processing. This value should only be populated on insert - it should never be updated. |
| 20 | LAST_UPDATE_DATETIME |  |  |  | Date | This holds the date time stamp of the most recent update by the last_update_id. This field is required by the database. |
| 21 | LAST_UPDATE_ID |  |  |  | VARCHAR (30) | The Oracle user-id of the user who most recently updated this record. This field is required by the database. |

---

## Table: GTT_ITEM_LOC_FUTURE_AVAIL

**Description:** This table contains item/locations for calculation of future available quantity.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  |  |  | VARCHAR (25) | Unique alphanumeric value that identifies the item. |
| 2 | LOC |  |  |  | NUMERIC (10) | Numeric identifier of the location in which the item is to be found. This field may contain a store, warehouse, or external finisher. |
| 3 | PACK_IND |  |  |  | VARCHAR (1) | Indicate if the item is a pack item. |
| 4 | ITEM_LEVEL |  |  |  | NUMERIC (1) | Number indicating which of the three levels the item resides. |
| 5 | TRAN_LEVEL |  |  |  | NUMERIC (1) | Indicates the level on which transactions are done. |
| 6 | ON_ORDER_QTY |  |  |  | NUMERIC (13,4) | This field contains the total number of items ordered for the franchise location. |
| 7 | ALLOC_IN |  |  |  | NUMERIC (13,4) | Indicates the total number of items allocated. |
| 8 | PL_TSF_ITEM_QTY |  |  |  | NUMERIC (13,4) | Indicates the total quantity of the item reserved at the location for the transfer. |
| 9 | PL_TSF_PACK_QTY |  |  |  | NUMERIC (13,4) | Indicates the total quantity of the Pack Item reserved at the location for the transfer. |
| 10 | CURR_AVAIL |  |  |  | NUMERIC (13,4) | Indicates the current available quantity. |
| 11 | FUTURE_AVAIL |  |  |  | NUMERIC (13,4) | Indicates the future available quantity. |

---

## Table: GTT_ITEM_SUPP_COUNTRY_LOC

**Description:** This table will temporarily hold the information for the updates on the Item Supplier Country Location form. The values will be used to track changes between manufacturer, distributor or wholesaler. The columns for this table will be the same as that of the ITEM_SUPP_COUNTRY_LOC table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  |  | Y | VARCHAR (25) | Unique alphanumeric value that identifies the item. |
| 2 | SUPPLIER |  |  | Y | NUMERIC (10) | Unique identifier for the supplier. |
| 3 | ORIGIN_COUNTRY_ID |  |  | Y | VARCHAR (3) | The country where the item was manufactured or significantly altered. |
| 4 | LOC |  |  | Y | NUMERIC (10) | Number of the location in which the item is to be found. This field may contain a store or a warehouse. |
| 5 | LOC_TYPE |  |  | Y | VARCHAR (1) | Type of location in the location field. |
| 6 | STORE_TYPE |  |  |  | VARCHAR (1) | This field will have a value if the location type is a store. This will represent whether the store is Franchise or Company. |
| 7 | PRIMARY_LOC_IND |  |  | Y | VARCHAR (1) | Indicates if this is the primary country for the item/supplier. |
| 8 | UNIT_COST |  |  | Y | NUMERIC (20,4) | The current unit cost of the item for the item/supplier/origin_country combination. This field is stored in the suppliers currency. |
| 9 | SUPP_HIER_TYPE_1 |  |  |  | VARCHAR (6) | Identifies partner type of supplier hierarchy level 1 for the foreign key to the partner table. This field will always be hard coded with the value S1. |
| 10 | SUPP_HIER_LVL_1 |  |  |  | VARCHAR (10) | Highest level of supplier hierarchy (e.g. manufacturer). This will be used for assigning rebates that come from a level in the supply chain that is higher than the supplier. |
| 11 | SUPP_HIER_TYPE_2 |  |  |  | VARCHAR (6) | Identifies partner type of supplier hierarchy level 2 for the foreign key to the partner table. This field will always be hard coded with the value S2. |
| 12 | SUPP_HIER_LVL_2 |  |  |  | VARCHAR (10) | Second highest level of supplier hierarchy. Rebates at this level will include all eligible supplier/item/country/loc records assigned to this supplier hierarchy level. |
| 13 | SUPP_HIER_TYPE_3 |  |  |  | VARCHAR (6) | Identifies partner type of supplier hierarchy level 3 for the foreign key to the partner table. This field will always be hard coded with the value S3. |
| 14 | SUPP_HIER_LVL_3 |  |  |  | VARCHAR (10) | Third highest level of supplier hierarchy, used for assigning rebates by a level other than supplier. |

---

## Table: GTT_ORDHEAD_ORDER_NO

**Description:** GLOBAL TEMPORARY TABLE GTT_ORDHEAD_ORDER_NO

---

## Table: GTT_ORDITEM_SUM

**Description:** This temporary table is used to summarize order/item parent-grandparent information. It is populated and used by the ordfash.fmb form and should never have data committed to the table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ORDER_NO | P |  | Y | NUMERIC (12) | This field contains the order number. |
| 2 | ITEM | P |  | Y | VARCHAR (25 BYTE) | This field contains the item on the order. |
| 3 | ITEM_PARENT |  |  | Y | VARCHAR (25 BYTE) | This field contains the parent for the item being ordered. |
| 4 | ITEM_GRANDPARENT |  |  |  | VARCHAR (25 BYTE) | This field contains the grandparent for the item being ordered. |
| 5 | DIFF_1 |  |  | Y | VARCHAR (10 BYTE) | This field contains the first differentiator value for the item being ordered. |
| 6 | DIFF1_SEQ |  |  |  | NUMERIC (4) | This field contains the display sequence number for the item being ordered. |
| 7 | DIFF_2 |  |  |  | VARCHAR (10 BYTE) | This field contains the second differentiator value for the item being ordered. |
| 8 | DIFF2_SEQ |  |  |  | NUMERIC (4) | This field contains the display sequence number for the item being ordered. |
| 9 | DIFF_3 |  |  |  | VARCHAR (10 BYTE) | This field contains the third differentiator value for the item being ordered. |
| 10 | DIFF3_SEQ |  |  |  | NUMERIC (4) | This field contains the display sequence number for the item being ordered. |
| 11 | DIFF_4 |  |  |  | VARCHAR (10 BYTE) | This field contains the fourth differentiator value for the item being ordered. |
| 12 | DIFF4_SEQ |  |  |  | NUMERIC (4) | This field contains the display sequence number for the item being ordered. |
| 13 | LOCATION | P |  | Y | NUMERIC (10) | This field contains the orders location. |
| 14 | LOC_TYPE |  |  | Y | VARCHAR (1 BYTE) | This field contains the orders location type. |
| 15 | QTY_ORDERED |  |  | Y | NUMERIC (12,4) | This field contains the quantity of the item ordered. |
| 16 | UNIT_RETAIL |  |  | Y | NUMERIC (20,4) | This field contains the unit retail for the ordered item. |
| 17 | SUPPLIER_COST |  |  | Y | NUMERIC (20,4) | This field contains the suppliers cost for the item. |
| 18 | QTY_RECEIVED |  |  | Y | NUMERIC (12,4) | This field contains the quantity of the item received from the order. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_GTT_ORDITM_SUM|PK||||ORDER_NO|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
||||||ITEM|ASC|
||||||LOCATION|ASC|
|GTT_ORDITEM_SUM_I1|||||LOCATION|ASC|
||||||DIFF_1|ASC|
||||||DIFF1_SEQ|ASC|
||||||DIFF2_SEQ|ASC|

---

## Table: GTT_PRICE_HIST_MGN

**Description:** This table will hold the information for the new price history and margin form. It will contain all of the fields currently maintained on the existing price history table in addition to all of the currency conversion fields maintained on the price history form (as non-base table fields). It will also have a pricing cost field maintained on it.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ACTION_DATE |  |  |  | Date | Contains the date on which the price change went effect |
| 2 | ITEM |  |  |  | VARCHAR (25) | Unique alphanumeric value that identifies the item. |
| 3 | ITEM_DESC |  |  |  | VARCHAR (250) | Long description of the item. This description is used through out the system to help online users identify the item. For items that have parents, this description will default to the parents description plus any differentiators. For items without parents, this description will default to null. |
| 4 | TRAN_TYPE |  |  |  | NUMERIC (2) | Contains a code number which indicates the type of transaction which caused the price change. |
| 5 | TRAN_TYPE_DESC |  |  |  | VARCHAR (250) | This field contains the tran type description that uniquely identifies the transaction type |
| 6 | LOC_TYPE |  |  |  | VARCHAR (1) | Identifies the location as a Store or a Warehouse. |
| 7 | STORE_TYPE |  |  |  | VARCHAR (1) | This field will have a value if the location type is a store. This will represent whether the store is Franchise or Company. |
| 8 | LOC |  |  |  | NUMERIC (10) | Contains the number that uniquely identifies the location. |
| 9 | PRICING_COST |  |  |  | NUMERIC (20,4) | Cost to be used to in pricing reviews. This field is stored in the local currency. |
| 10 | PRICING_COST_PRIM |  |  |  | NUMERIC (20,4) | Cost to be used to in pricing reviews. This field is stored in the primary currency. |
| 11 | UNIT_RETAIL |  |  |  | NUMERIC (20,4) | Contains the current single unit retail in the standard unit of measure. If the record is being written as a result of a change in the single unit retail, then this field contains the new single unit retail. This field is stored in the local currency. |
| 12 | UNIT_RETAIL_PRIM |  |  |  | NUMERIC (20,4) | Contains the current single unit retail in the standard unit of measure. If the record is being written as a result of a change in the single unit retail, then this field contains the new single unit retail. This field is stored in the primary currency. |
| 13 | SELLING_UNIT_RETAIL |  |  |  | NUMERIC (20,4) | Contains the current single unit retail in the selling unit of measure. If the record is being written as a result of a change in the single unit retail, then this field contains the new single unit retail. This field is stored in the local currency |
| 14 | SELLING_UNIT_RETAIL_PRIM |  |  |  | NUMERIC (20,4) | Contains the current single unit retail in the selling unit of measure. If the record is being written as a result of a change in the single unit retail, then this field contains the new single unit retail. This field is stored in the primary currency |
| 15 | SELLING_UOM |  |  |  | VARCHAR (4) | Contains the selling unit of measure for an items single-unit retail. |
| 16 | MULTI_UNITS |  |  |  | NUMERIC (12,4) | Contains the current multi-units. If the record is being written as a result of a change in the multi-unit retail, then this field contains the new multiunits. |
| 17 | MULTI_UNIT_RETAIL |  |  |  | NUMERIC (20,4) | Contains the current multi-unit retail in the selling unit of measure. If the record is being written as a result of a change in the multi-unit retail, then this field contains the new multi-unit retail. This field is stored in the local currency. |
| 18 | MULTI_UNIT_RETAIL_PRIM |  |  |  | NUMERIC (20,4) | Contains the current multi-unit retail in the selling unit of measure. If the record is being written as a result of a change in the multi-unit retail, then this field contains the new multi-unit retail. This field is stored in the primary currency. |
| 19 | MULTI_SELLING_UOM |  |  |  | VARCHAR (4) | Contains the selling unit of measure for an items multi-unit retail. |
| 20 | LOCAL_CURR |  |  |  | VARCHAR (3) | Local Currency |
| 21 | PRIMARY_CURR |  |  |  | VARCHAR (3) | Primary Currency |
| 22 | REASON |  |  |  | NUMERIC (6) | Contains the reason for the price change. If the record is written as a result of the creation of a new item, then the reason code is zero. Otherwise, the values come from the mkd_reason table and are the same as the reason code used on the price change event. |
| 23 | REASON_DESC |  |  |  | VARCHAR (250) | Contains the description which, along with the reason number, identifies the cost change reason |
| 24 | REF_ITEM |  |  |  | VARCHAR (25) | Reference Item |
| 25 | VPN |  |  |  | VARCHAR (30) | Vendor Product Number |
| 26 | UNIT_RETAIL_EURO |  |  |  | NUMERIC (20,4) | Contains the current single unit retail in the standard unit of measure. If the record is being written as a result of a change in the single unit retail, then this field contains the new single unit retail. This field is stored in the european currency. |
| 27 | SELLING_UNIT_RETAIL_EURO |  |  |  | NUMERIC (20,4) | Contains the current single unit retail in the selling unit of measure. If the record is being written as a result of a change in the single unit retail, then this field contains the new single unit retail. This field is stored in the european currency |
| 28 | MULTI_UNIT_RETAIL_EURO |  |  |  | NUMERIC (20,4) | Contains the current multi-unit retail in the selling unit of measure. If the record is being written as a result of a change in the multi-unit retail, then this field contains the new multi-unit retail. This field is stored in the european currency. |
| 29 | MARGIN_PCT |  |  |  | NUMERIC (20,4) | Margin Percentage |
| 30 | WH_MARGIN_PCT |  |  |  | NUMERIC (20,4) | Margin Percentage for Franchise Stores. |
| 31 | PRICING_COST_EURO |  |  |  | NUMERIC (20,4) | Cost to be used in pricing reviews. This field is stored in european currency. |

---

## Table: GTT_PRICE_HIST_MGN_BACKUP

**Description:** This is a temporary table that serves as a backup of GTT_PRICE_HIST_MGN to assist the display of price history and margin information.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  |  |  | VARCHAR (25) | This is the item associated with the price change. |
| 2 | REF_ITEM |  |  |  | VARCHAR (25) | This is the reference item associated with the price change. |
| 3 | VPN |  |  |  | VARCHAR (30) | This is the vpn associated with the price change. |
| 4 | ITEM_DESC |  |  |  | VARCHAR (250) | This is the description of the item associated with the price change. |
| 5 | TL_ITEM_DESC |  |  |  | VARCHAR (250) | This is the translated description of the item associated with the price change. |
| 6 | DEPT |  |  |  | NUMERIC (4) | Holds the department of the item on the price change. |
| 7 | CLASS |  |  |  | NUMERIC (4) | Holds the class of the item on the price change. |
| 8 | SUBCLASS |  |  |  | NUMERIC (4) | Holds the subclass of the item on the price change. |
| 9 | PACK_IND |  |  |  | VARCHAR (1) | Indicates if the item on the price change is a pack. |

---

## Table: GTT_ROWID_TEMP

**Description:** The table holds rowids.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ROW_ID |  |  | Y | ROWID | Rowid of any row of a table |

---

## Table: GTT_STAGE_EXT_TRAN_DATA

**Description:** This is the temporary table for STAGE_EXT_TRAN_DATA to aid in processing of the batch.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TRAN_ID |  |  |  | NUMERIC (10) | The RMS id for the transaction record. |
| 2 | ITEM |  |  |  | VARCHAR (25 ) | This contains the unique identifier for the item. |
| 3 | DEPT |  |  | Y | NUMERIC (4) | This contains the department associated with the SKU. |
| 4 | CLASS |  |  | Y | NUMERIC (4) | This contains the class associated with the SKU. |
| 5 | SUBCLASS |  |  | Y | NUMERIC (4) | This contains the subclass associated with the SKU. |
| 6 | LOC_TYPE |  |  | Y | VARCHAR (1 ) | This holds the location type of the location. |
| 7 | LOCATION |  |  | Y | NUMERIC (10) | This holds the location associated with the transaction. |
| 8 | TRAN_DATE |  |  | Y | Date | This identifies the date the transaction was written. |
| 9 | TRAN_CODE |  |  | Y | NUMERIC (2) | This identifies the transaction type. |
| 10 | ADJ_CODE |  |  |  | VARCHAR (1 ) | This indicates the type of adjustment for which the record is written to correct a previous error. |
| 11 | UNITS |  |  | Y | NUMERIC (12,4) | This contains the number of units involved in the transaction. |
| 12 | TOTAL_COST |  |  |  | NUMERIC (20,4) | This contains the total cost associated with the transaction. |
| 13 | TOTAL_RETAIL |  |  |  | NUMERIC (20,4) | This contains the retail value of the transaction. |
| 14 | REF_NO_1 |  |  |  | NUMERIC (10) | This holds the reference number for the transaction. |
| 15 | REF_NO_2 |  |  |  | NUMERIC (10) | This holds the reference number associated with the transaction. |
| 16 | GL_REF_NO |  |  |  | NUMERIC (10) | This contains the reference number associated with transactions, and is used for defining the General Ledger account relationship, along with dept, class, subclass, location and tran_code. |
| 17 | OLD_UNIT_RETAIL |  |  |  | NUMERIC (20,4) | This contains the old unit retail. |
| 18 | NEW_UNIT_RETAIL |  |  |  | NUMERIC (20,4) | This contains the new unit retail. |
| 19 | PGM_NAME |  |  |  | VARCHAR (100 ) | This identifies the Oracle Retail module where the record was written. |
| 20 | SALES_TYPE |  |  |  | VARCHAR (1 ) | This contains the type of sale for the SKU. |
| 21 | VAT_RATE |  |  |  | NUMERIC (12,4) | This contains the VAT rate at the selling store. |
| 22 | AV_COST |  |  |  | NUMERIC (20,4) | This contains the average cost for the SKU from the SKU/Location table. |
| 23 | REF_PACK_NO |  |  |  | VARCHAR (25 ) | This identifies the pack number for the transaction item. |
| 24 | TOTAL_COST_EXCL_ELC |  |  |  | NUMERIC (20,4) | This contains the cost exclusive for ELC. |
| 25 | WAC_RECALC_IND |  |  | Y | VARCHAR (1 ) | This indicates if the WAC should be recalculated. |
| 26 | STATUS |  |  | Y | VARCHAR (1 ) | This holds the status of the transaction. |
| 27 | ERR_MSG |  |  |  | VARCHAR (2500 ) | This contains the message describing the error that has occured during validation. |

---

## Table: GTT_STAGE_EXT_TRAN_DATA_CALC

**Description:** This is the temporary table to aid in WAC recalculation.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  |  |  | VARCHAR (25 ) | This holds the unique identifier for the item. |
| 2 | LOCATION |  |  |  | NUMERIC (10) | This contains the location associated with the transaction. |
| 3 | SUM_UNITS |  |  |  | NUMERIC (12,4) | This contains the sum of units associated with the transaction. |
| 4 | SUM_TOTAL_COST |  |  |  | NUMERIC (20,4) | This contains the sum of the total cost associated with the transaction. |
| 5 | WAC_CALC |  |  |  | NUMERIC (20,4) | This contains the calculated WAC value for the transaction. |

---

## Table: GTT_WF_COST_RELATIONSHIP

**Description:** This table will hold all the modifications made to Cost Relationship with type of modification (ADD,MOD,REM)

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEPT |  |  | Y | NUMERIC (4) | Department ID |
| 2 | CLASS |  |  | Y | NUMERIC (4) | Class ID |
| 3 | SUBCLASS |  |  | Y | NUMERIC (4) | Subclass ID |
| 4 | LOCATION |  |  | Y | NUMERIC (10) | Franchise store. |
| 5 | TEMPL_ID |  |  | Y | NUMERIC (10) | Template ID Number |
| 6 | OLD_START_DATE |  |  | Y | Date | Old Start Date of the cost relationship |
| 7 | OLD_END_DATE |  |  | Y | Date | Old End Date of the cost relationship |
| 8 | NEW_START_DATE |  |  | Y | Date | New Start Date of the cost relationship |
| 9 | NEW_END_DATE |  |  | Y | Date | New End Date of the cost relationship |
| 10 | ACTION |  |  | Y | VARCHAR (3) | Type of change performed (ADD,MOD,REM) |
| 11 | WF_ROWID |  |  | Y | ROWID | Row ID of the corresponding row in WF_COST_RELATIONSHIP |
| 12 | ITEM |  |  |  | VARCHAR (25) | Identifies the item for the cost relationship. |

---

## Table: GTT_ZONE_INFO

**Description:** This table will hold the RPM zone information

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ZONE_GROUP_ID |  |  |  | NUMERIC (10) | this column contains RPMs zone group id |
| 2 | ZONE_ID | P |  | Y | NUMERIC (10) | this column contains RPMs zone_id value. This value is used as the behind the scenes primary key value |
| 3 | ZONE_DISPLAY_ID |  |  |  | NUMERIC (10) | this column contains RPMs display zone id. (this is the value that will be displayed to the user) |
| 4 | ZONE_DESC |  |  |  | VARCHAR (120) | this column contains the zones description |
| 5 | CURRENCY_CODE |  |  |  | VARCHAR (3) | this column contains the zones currency code |
| 6 | BASE_ZONE_IND |  |  |  | NUMERIC (6) | this column indicates (by a value of 1) if the current zone is the base zone. |

---

## Table: LOAD_ERR

**Description:** This table contains unit sales records from the Point of Sale system for any items that could not be found in the database but have been loaded from the transaction file. No index is associated with this table because all rows on the table are always selected.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TRAN_DATE |  |  | Y | Date | Contains the date of the transaction. |
| 2 | STORE |  |  | Y | NUMERIC (10) | Contains the identifying number of the store where the transaction was processed. |
| 3 | ITEM |  |  | Y | VARCHAR (25) | Contains either a transaction level Item or a ref. item number involved in the transaction. |
| 4 | QTY |  |  |  | NUMERIC (12,4) | Contains the number of items involved in the transaction. If both sales and returns are sent up for the item, this field is sales - returns (net sales). |
| 5 | SALES_VAL |  |  |  | NUMERIC (20,4) | Contains the sales dollars involved in the transaction. This field is stored in the local currency. |
| 6 | DEPT |  |  |  | NUMERIC (4) | Contains the department number associated with the SKU. |
| 7 | CLASS |  |  |  | NUMERIC (4) | Contains the class number associated with the SKU. |
| 8 | SUBCLASS |  |  |  | NUMERIC (4) | Contains the subclass number associated with the SKU. |
| 9 | ITEM_STATUS |  |  | Y | NUMERIC (2) | Identifies the type of error that occurred. Examples of valid error types include SKUs that do not exist within the system, a SKU of invalid length, or a SKU that does not exist at the location where the transaction took place. |

---

## Table: NIL_INPUT_WORKING

**Description:** This a working table to be used by NEW_ITEM_LOC_SQL package to speed bulk processing of new item location ranging.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID |  |  | Y | NUMERIC (20) | the unique identifier of the records processed in a single transaction |
| 2 | ITEM |  |  |  | VARCHAR (25) | unique alphanumeric value that identifies the item. |
| 3 | ITEM_PARENT |  |  |  | VARCHAR (25) | alphanumeric value that uniquely identifies the item/group at the level above the item. |
| 4 | ITEM_GRANDPARENT |  |  |  | VARCHAR (25) | alphanumeric value that uniquely identifies the item/group two levels above the item. |
| 5 | ITEM_DESC |  |  |  | VARCHAR (250) | long description of the item. |
| 6 | ITEM_SHORT_DESC |  |  |  | VARCHAR (120) | shortened description of the item. |
| 7 | ITEM_NUMBER_TYPE |  |  |  | VARCHAR (6) | code specifying what type the item is. valid values for this field are in the code type upct on the code_head and code_detail tables. |
| 8 | FORMAT_ID |  |  |  | VARCHAR (1) | this field will hold the format id that corresponds to the items variable upc. |
| 9 | PREFIX |  |  |  | NUMERIC (2) | this column holds the prefix for variable weight upcs. the prefix determines the format of the eventual upc and will be used to decode variable weight upcs that are uploaded from the pos. |
| 10 | DEPT |  |  |  | NUMERIC (4) | NUMBER identifying the department to which the item is attached. the items department will be the same as that of its parent (and, by transitivity, to that of its grandparent). |
| 11 | CLASS |  |  |  | NUMERIC (4) | NUMBER identifying the class to which the item is attached. the items class will be the same as that of its parent (and, by transitivity, to that of its grandparent). |
| 12 | SUBCLASS |  |  |  | NUMERIC (4) | NUMBER identifying the subclass to which the item is attached. the items subclass will be the same as that of its parent (and, by transitivity, to that of its grandparent). |
| 13 | ITEM_LEVEL |  |  |  | NUMERIC (1) | NUMBER indicating which of the three levels the item resides. the item level determines if the item stands alone or if it is part of a family of related items. the item level also determines how the item may be used throughout the system. |
| 14 | TRAN_LEVEL |  |  |  | NUMERIC (1) | NUMBER indicating which of the three levels transactions occur for the items group. the transaction level is the level at which the items inventory is tracked in the system. the transaction level item will be counted, transferred, shipped, etc. the transaction level may be at the current item or up to 2 levels above or below the current item. only one level of the hierarchy of an item family may contain transaction level items. |
| 15 | ITEM_STATUS |  |  |  | VARCHAR (1) | status of the item. valid values are: w = worksheet: item setup in progress, cannot be used in system s = submitted: item setup complete and awaiting approval, cannot be use in system a = approved: item is approved and can now be used throughout the system |
| 16 | WASTE_TYPE |  |  |  | VARCHAR (6) | identifies the wastage type as either sales or spoilage wastage. sales wastage occurs during processes that make an item saleable (i.e. fat is trimmed off at customer request). spoilage wastage occurs during the products shelf life (i.e. evaporation causes the product to weigh less after a period of time). valid values are: sp = spoilage sl = sales wastage is not applicable to pack items. |
| 17 | WASTE_PCT |  |  |  | NUMERIC (12,4) | average percent of wastage for the item over its shelf life. used in inflating the retail price for wastage items. |
| 18 | DEFAULT_WASTE_PCT |  |  |  | NUMERIC (12,4) | default daily wastage percent for spoilage type wastage items. this value will default to all item locations and represents the average amount of wastage that occurs on a daily basis. |
| 19 | SELLABLE_IND |  |  |  | VARCHAR (1) | indicates if pack item may be sold as a unit. if it is y then the pack will have its own unique unit retail. if it is n then the packs unit retail is the sum of each individual items total retail within the pack. this field will only be available if the item is a pack item. valid values are: y = yes, this pack may be sold as a unit, n = no, this pack may not be sold as a unit |
| 20 | ORDERABLE_IND |  |  |  | VARCHAR (1) | indicates if pack item is orderable. if it is y then the suppliers of the pack must supply all components in the pack. if it is n then the components may have different suppliers. this field will only be available if the item is |
| 21 | PACK_IND |  |  |  | VARCHAR (1) | indicates if the item is a pack. a pack item is a collection of items that may be either ordered or sold as a unit. packs require details (i.e. component items and qtys, etc.) that other items do not. this field is required by the database. |
| 22 | PACK_TYPE |  |  |  | VARCHAR (1) | indicates if pack item is a vendor pack or a buyer pack. a vendor pack is a pack that the vendor or supplier recognizes and sells to the retailer. if the pack item is a vendor pack, communication with the supplier will use the vendor pack number. a buyer pack is a pack that a buyer has created for internal ease of use. if the pack item is a buyer pack, communication with the supplier will explode the pack out to its component items. this field will only be available if the item is a pack item. if the pack item is not orderable this field must be null. valid values are: v = vendor, b = buyer. |
| 23 | SIMPLE_PACK_IND |  |  |  | VARCHAR (1) | indicates if pack item is a simple pack or not. this field will only be available if the item is a pack item. a simple pack is an item whose components are all the same item (i.e. a six pack of cola, etc). valid values are: y = yes, this item is a simple pack n = no, this item is not a simple pack |
| 24 | DIFF_1 |  |  |  | VARCHAR (10) | diff_group or diff_id that differentiates the current item from its item_parent. for an item that is a parent, this field may be either a group (i.e. mens pant sizes) or a value (6 oz). for an item that is not a parent, this field may contain a value (34x34, red, etc.) valid values are found on the diff_group and diff_id tables. |
| 25 | DIFF_2 |  |  |  | VARCHAR (10) | diff_group or diff_id that differentiates the current item from its item_parent. for an item that is a parent, this field may be either a group (i.e. mens pant sizes) or a value (6 oz). for an item that is not a parent, this field may contain a value (34x34, red, etc.) valid values are found on the diff_group and diff_id tables. |
| 26 | DIFF_3 |  |  |  | VARCHAR (10) | diff_group or diff_id that differentiates the current item from its item_parent. for an item that is a parent, this field may be either a group (i.e. mens pant sizes) or a value (6 oz). for an item that is not a parent, this field may contain a value (34x34, red, etc.) valid values are found on the diff_group and diff_id tables. |
| 27 | DIFF_4 |  |  |  | VARCHAR (10) | diff_group or diff_id that differentiates the current item from its item_parent. for an item that is a parent, this field may be either a group (i.e. mens pant sizes) or a value (6 oz). for an item that is not a parent, this field may contain a value (34x34, red, etc.) valid values are found on the diff_group and diff_id tables. |
| 28 | ORDER_AS_TYPE |  |  |  | VARCHAR (1) | indicates if pack item is receivable at the component level or at the pack level (for a buyer pack only). this field is required if pack item is an orderable buyer pack. this field must be null if the pack is sellable only or a vendor pack. this field will only be available if the item is a pack item. valid values are: e = eaches (component level) p = pack (buyer pack only) |
| 29 | CONTAINS_INNER_IND |  |  |  | VARCHAR (1) | indicates if pack item contains inner packs. vendor packs will never contain inner packs and this field will be defaulted to n. this field will only be available if the item is a pack item. valid values are: y = yes, this pack contains inner packs n = no, this pack does not contain inner packs |
| 30 | STORE_ORD_MULT |  |  |  | VARCHAR (1) | merchandise shipped from the warehouses to the stores must be specified in this unit type. valid values are: c = cases i = inner e = eaches |
| 31 | LOC |  |  |  | NUMERIC (10) | numeric identifier of the location in which the item is to be found. this field may contain a store, warehouse, or external finisher. |
| 32 | LOC_TYPE |  |  |  | VARCHAR (1) | type of location in the location field. valid values are s (store), w (warehouse), and e (external finisher). |
| 33 | DAILY_WASTE_PCT |  |  |  | NUMERIC (12,4) | average percentage lost from inventory on a daily basis due to natural wastage. |
| 34 | UNIT_COST_LOC |  |  |  | NUMERIC (20,4) | if system_options.std_av_ind = a and elc_ind = y then this field holds the estimated landed cost when item is initially set up. it is then updated with pos estimated landed cost each time this item is received at this location. otherwise, this field holds the primary supplier cost. this field is stored in the local currency. pack items will not have a unit cost stored on item_loc. stock of a pack item is valued at the component level and therefore a unit cost is not applicable for pack |
| 35 | UNIT_RETAIL_LOC |  |  |  | NUMERIC (20,4) | contains the unit retail price in the standard unit of measure for the item/location combination. this field is stored in the local currency. stores retail should match the retail on item_zone_price unless the item is on clearance. warehouse retails should match the retail on item_zone_price for the base zone. pack items will not have a unit cost stored on item_loc. stock of a pack item is valued at the component level and therefore a unit cost is not applicable for pack items. |
| 36 | SELLING_UNIT_RETAIL |  |  |  | NUMERIC (20,4) | contains the unit retail price in the selling unit of measure for the item/location combination. this field is stored in the local currency. store retails should match the retail on item_zone_price unless the item is on clearance. warehouse retails should match the retail on item_zone_price for the base zone. pack items will not have a unit cost stored on item_loc. stock of a pack item is valued at the component level and therefore a unit cost is not applicable for pack items. |
| 37 | SELLING_UOM |  |  |  | VARCHAR (4) | contains the selling unit of measure for an items single-unit retail. |
| 38 | ITEM_LOC_STATUS |  |  |  | VARCHAR (1) | current status of item at the store. valid values are: a = active, item is valid and can be ordered and sold i = inactive, item is valid but cannot be ordered or sold c = discontinued, item is valid and sellable but no longer orderable d = delete, item is invalid and cannot be ordered or sold |
| 39 | TAXABLE_IND |  |  |  | VARCHAR (1) | indicates if item is taxable at the store. valid values are: y = yes, the item is taxable n = no, the item is not taxable |
| 40 | TI |  |  |  | NUMERIC (12,4) | NUMBER of shipping units (cases) that make up one tier of a pallet. multiply ti x hi to get total NUMBER of cases for a pallet. |
| 41 | HI |  |  |  | NUMERIC (12,4) | NUMBER of tiers that make up a complete pallet (height). multiply ti x hi to get total NUMBER of cases for a pallet. |
| 42 | MEAS_OF_EACH |  |  |  | NUMERIC (12,4) | size of an each in terms of the uom_of_price. for example 12 oz. used in ticketing. |
| 43 | MEAS_OF_PRICE |  |  |  | NUMERIC (12,4) | size to be used on the ticket in terms of the uom_of_price. for example, if the user wants the ticket to have the label print the price per ounce, this value would be 1. if the user wanted the price per 100 grams this |
| 44 | UOM_OF_PRICE |  |  |  | VARCHAR (4) | unit of measure that will be used on the ticket for this item. |
| 45 | PRIMARY_VARIANT |  |  |  | VARCHAR (25) | this field is used to address sales of plus (i.e. above transaction level items) when inventory is tracked at a lower level (i.e. upc). this field will only contain a value for items one level higher than the transaction level. valid choices will be any transaction level item that is a child of this item. in order to select a transaction level item as the primary variant, the item/location relationship must exist at the transaction level. when a transaction level item is specified as a primary variant for an item higher than the transaction level, an extra pos_mods record will be written. both the transaction level item (i.e. upc) and the higher than transcation level item (i.e. plu) will be sent to the pos to allow the store to sell the plu. the information sent for the plu will be the same information sent for the transaction level item (i.e. upc). |
| 46 | PRIMARY_SUPP |  |  |  | NUMERIC (10) | numeric identifier of the supplier who will be considered the primary supplier for the specified item/loc. the supplier/origin country combination will determine the value of the unit cost field on item_loc. if the supplier is changed and elc = n, the unit cost field on item_loc will be updated with the new suppliers cost. |
| 47 | PRIMARY_CNTRY |  |  |  | VARCHAR (3) | contains the identifier of the origin country which will be considered the primary country for the specified item/location. |
| 48 | PRIMARY_COST_PACK |  |  |  | VARCHAR (25) | this field contains an item NUMBER that is a simple pack containing the item in the item column for this record. if populated, the cost of the future cost table will be driven from the simple pack and the deals and cost changes for the simple pack. |
| 49 | LOCAL_ITEM_DESC |  |  |  | VARCHAR (250) | contains the local description of the item. this field will default to the items description but will be over-ridable. this value will be downloaded to the pos. |
| 50 | LOCAL_SHORT_DESC |  |  |  | VARCHAR (120) | contains the local short description of the item. this field will default to the items short description but will be over-ridable. this value will be downloaded to the pos. |
| 51 | RECEIVE_AS_TYPE |  |  |  | VARCHAR (1) | this column determines whether the stock on hand for a pack component item or the buyer pack itself will be updated when a buyer pack is received at a warehouse. valid values are each or pack. |
| 52 | STORE_PRICE_IND |  |  |  | VARCHAR (1) | this field indicates if an item at a particular store location can have the unit retail marked down by the store. |
| 53 | UIN_TYPE |  |  |  | VARCHAR (6) | this column will contain the unique identification NUMBER (uin) used to identify the instances of the item at the location. |
| 54 | UIN_LABEL |  |  |  | VARCHAR (6) | this column will contain the label for the uin when displayed in sim. |
| 55 | EXT_UIN_IND |  |  |  | VARCHAR (1) | this yes/no indicator indicates if uin is being generated in the external system. |
| 56 | CAPTURE_TIME |  |  |  | VARCHAR (6) | this column will indicate when the uin should be captured for an item during transaction processing. |
| 57 | SOURCE_METHOD |  |  |  | VARCHAR (1) | this value will be used to specify how the ad-hoc po/tsf creation process should source the item/stores request. if the value is warehouse, the process will attempt to fill the request by creating a transfer from the item/locations primary sourcing warehouse. if this warehouse doesnt have enough inventory to fill the request a purchase order will be created for the item/locations primary supplier. |
| 58 | SOURCE_WH |  |  |  | NUMERIC (10) | this value will be used by the ad-hoc po/transfer creation process to determine which warehouse to fill the stores request from. a value will be required in this field if the sourcing method is warehouse. |
| 59 | INBOUND_HANDLING_DAYS |  |  |  | NUMERIC (2) | this field indicates the NUMBER of inbound handling days for an item at a warehouse type location. |
| 60 | CURRENCY_CODE |  |  |  | VARCHAR (3) | Location currency code |
| 61 | LIKE_STORE |  |  |  | NUMERIC (10) | contains the store in which to copy items to the new store. |
| 62 | DEFAULT_TO_CHILDREN_IND |  |  |  | VARCHAR (1) | This indicates to copy the item/loc to the input item children. |
| 63 | LANG |  |  |  | NUMERIC (6) | this column identifies the language to be used for the given store. |
| 64 | CLASS_VAT_IND |  |  |  | VARCHAR (1) | this field determines if retail is displayed and held with or with out vat. this field is only editable when vat is turned on in the system and defined at the class level, when that is the case the field can vary between y and n by class. when vat is turned on in the system and not defined at the class level, this field defaults to y. when vat is turned off in the system, this field defaults to n. |
| 65 | HIER_LEVEL |  |  |  | VARCHAR (6) | The organizational hierarchy level to which to range the item to. |
| 66 | HIER_NUM_VALUE |  |  |  | NUMERIC (20) | The NUMBER value of the organizational hierarchy level to which to range the item to. |
| 67 | HIER_CHAR_VALUE |  |  |  | VARCHAR (6) | The char value of the organizational hierarchy level to which to range the item to. |
| 68 | STORE_TYPE |  |  |  | VARCHAR (6) | this will indicate whether a particular store is a wholesale, franchise or company store. |
| 69 | ORG_UNIT_ID |  |  |  | NUMERIC (15) | column will contain the organizational unit id value. |
| 70 | SOURCE_WH_SUPP |  |  |  | NUMERIC (10) | numeric identifier of the supplier who is the supplier for the source wh. |
| 71 | SOURCE_WH_ORG_UNIT_ID |  |  |  | NUMERIC (15) | The organizational unit id value for the source wh. |
| 72 | UNIT_COST_SUP |  |  |  | NUMERIC (20,4) | The supplier unit cost |
| 73 | CHILD_FROM_INPUT |  |  |  | VARCHAR (1) | This indicates if the records is a child of an input item |
| 74 | ITEM_FROM_INPUT_PACK |  |  |  | VARCHAR (1) | This indicates if the item is a component of an input pack item |
| 75 | VAT_CODE |  |  |  | VARCHAR (6) | this field contains the alphanumeric identification for the vat code. valid values include: s - standard c - composite z - zero e - exempt other values may also be entered. these are the default vat rates that are set-up upon installation of the rms. |
| 76 | VAT_RATE |  |  |  | NUMERIC (20,4) | vat rate associated with a given vat code. |
| 77 | VAT_REGION |  |  |  | NUMERIC (4) | contains the unique identifying NUMBER for the vat region in the system. |
| 78 | CATCH_WEIGHT_IND |  |  |  | VARCHAR (1) | indiactes whether the item should be weighed when it arives at a location. valid values for this field are y and n. |
| 79 | SALE_TYPE |  |  |  | VARCHAR (6) | this indicates the method of how catch weight items are sold in store locations. valid values are: v - variable weight each l - loose weight valid values are held on the code_detail table with a code type = stpe |
| 80 | CONTAINER_ITEM |  |  |  | VARCHAR (25) | this holds the container item NUMBER for a contents item. this field is only populated and required if the deposit_item_type = e. |
| 81 | IMPORT_COUNTRY_ID |  |  |  | VARCHAR (3) | The import country ID |
| 82 | SUPP_CURRENCY_CODE |  |  |  | VARCHAR (3) | Supplier currency code. |
| 83 | AV_COST |  |  |  | NUMERIC (20,4) | calculated using pos estimated landed cost during po receiving process if elc_ind = y. this field is stored in the local currency. pack items will not have a average cost stored on item_loc. stock of a pack item is valued at the component level and therefore an average cost is not applicable for pack items. |
| 84 | ITEM_XFORM_IND |  |  |  | VARCHAR (1) | this indicator will show that an item is associated an item transformation. the item will be either the sellable item or orderable item in the transformation process. |
| 85 | MULTI_UNITS |  |  |  | NUMERIC (12,4) | this field contains the multi-units for the item/location (zone) combination. |
| 86 | MULTI_UNIT_RETAIL |  |  |  | NUMERIC (20,4) | this field holds the multi-unit retail in the multi-selling unit of measure for the item/location (zone) combination. this field is stored in teh local currency. |
| 87 | MULTI_SELLING_UOM |  |  |  | VARCHAR (4) | this field holds the selling unit of measure for this item/location (zone) combinations multi-unit retail. |
| 88 | STANDARD_UOM |  |  |  | VARCHAR (4) | unit of measure in which stock of the item is tracked at a corporate level. |
| 89 | UOM_CONV_FACTOR |  |  |  | NUMERIC (20,10) | conversion factor between an each and the standard_uom when the standard_uom is not in the quantity class (e.g. if standard_uom = lb and 1 lb = 10 eaches, this factor will be 10). this factor will be used to convert sales and stock data when an item is retailed in eaches but does not have eaches as its standard unit of measure. |
| 90 | CATCH_WEIGHT_UOM |  |  |  | VARCHAR (4) | uom for catchweight items. |
| 91 | AV_WEIGHT |  |  |  | NUMERIC (12,4) | a new field to hold the average simple pack weight for a catch weight simple pack. |
| 92 | UOM_ISCD |  |  |  | VARCHAR (4) | Item supplier country weight UOM |
| 93 | WH_UNIT_COST |  |  |  | NUMERIC (20,4) | Wh unit cost |
| 94 | DELIVERY_COUNTRY_ID |  |  |  | VARCHAR (3) | country to which the item will be delivered to. |
| 95 | DELIVERY_COUNTRY_LOCALIZED_IND |  |  |  | VARCHAR (1) | this indicate if the country is localized or not. this will determine if localized attributes will be required. valid values are yes or no. default value is no. |
| 96 | DEFAULT_LOC_IND |  |  |  | VARCHAR (1) | default location, whose fiscal attributes would be used to to set the initial item retail when no locations have been ranged for the item. the location should belong to the given country. this can either be a store or a warehouse. |
| 97 | DEFAULT_PO_COST |  |  |  | VARCHAR (6) | this will indicate at which cost the purchasing would be done in a country. this is the cost at which the purchase orders would be raised. |
| 98 | COSTING_LOC |  |  |  | NUMERIC (10) | this will hold the costing location at which Franchise locations will base their costs. |
| 99 | COSTING_LOC_TYPE |  |  |  | VARCHAR (1) | this will hold the location type of the costing location. |
| 100 | RANGED_IND |  |  |  | VARCHAR (1) | this will indicate if the location is ranged intentionally by the user for replenishment/selling or incidentally ranged by the RMS programs when item is not ranged to a specific location on the transaction. |
| 101 | DEFAULT_WH |  |  |  | NUMERIC (10) | this will hold the default WH for a store. This can come from the input source wh, store default wh or default wh from system options. |
| 102 | ITEM_LOC_IND |  |  |  | VARCHAR (1) | this will indicate if item loc is initiated from the item location form. |
| 103 | DEPOSIT_ITEM_TYPE |  |  |  | VARCHAR (1) | this will indicate if the item is a content or container for deposit items. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|NIL_INPUT_WORKING_I2|||||ITEM|ASC|
||||||PROCESS_ID|ASC|
||||||LOC|ASC|
|NIL_INPUT_WORKING_I1|||||PROCESS_ID|ASC|
||||||LOC|ASC|
||||||LOC_TYPE|ASC|
||||||DEPT|ASC|
||||||CLASS|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
||||||SUBCLASS|ASC|

---

## Table: STAGE_COMPLEX_DEAL_DETAIL

**Description:** This table is used to stage the details of complex deal invoicing information to Oracle Retail Invoice Matching.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEAL_ID | P | F | Y | NUMERIC (10) | The RMS id of the deal for which the invoice is being raised. |
| 2 | DEAL_DETAIL_ID | P | F | Y | NUMERIC (10) | The RMS component id of the deal for which the invoice is being raised. |
| 3 | SEQ_NO | P |  | Y | NUMERIC (10) | Unique sequence that identifies the income row. |
| 4 | LOCATION |  | F | Y | NUMERIC (10) | Location corresponding to the fixed deal income |
| 5 | LOC_TYPE |  |  | Y | VARCHAR (1) | Location type of the fixed deal income. |
| 6 | ITEM |  |  | Y | VARCHAR (25) | The item corresponding to this portion of the income. |
| 7 | ORDER_NO |  |  |  | NUMERIC (12) | The order_no corresponding to this portion of the income. |
| 8 | VAT_CODE |  |  |  | VARCHAR (6) | The VAT code. |
| 9 | LOCAL_CURRENCY |  |  | Y | VARCHAR (3) | The location currency. |
| 10 | INCOME_LOCAL_CURRENCY |  |  | Y | NUMERIC (20,4) | The sum of the incomes for an item/location for the periods for which the deal is invoiced in the local currency. |
| 11 | INCOME_DEAL_CURRENCY |  |  | Y | NUMERIC (20,4) | The sum of the incomes for an item/location for the periods for which the deal is invoiced in the deal currency. |
| 12 | ACTUAL_TURNOVER_UNITS |  |  |  | NUMERIC (20,4) | The sum of the units for the item/location for the periods being invoiced. |
| 13 | ACTUAL_TURNOVER_REVENUE |  |  |  | NUMERIC (20,4) | The sum of all the revenue for the item/location for all the periods that are being invoiced. |
| 14 | VAT_RATE |  |  |  | NUMERIC (20,4) | The VAT rate for the item/location. |
| 15 | TAX_AMT_DEAL_CURRENCY |  |  | Y | NUMERIC (20,4) | The total tax amount of the item/location in the deals currency. |
| 16 | TSF_ENTITY_ID |  | F | Y | NUMERIC (10) | This column contains the Transfer Entity ID the deal income is rolled up to when the credit memo level is at the Transfer Entity Level. |
| 17 | SET_OF_BOOKS_ID |  | F | Y | NUMERIC (15) | This column contains the Set of Books ID the deal income is rolled up to when the credit memo level is at the Set of Books Level. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_STAGE_COMPLEX_DEAL_DETAIL|PK||||DEAL_ID|ASC|
||||||DEAL_DETAIL_ID|ASC|
||||||SEQ_NO|ASC|
|STAGE_COMPLEX_DEAL_DETAIL_U1|UK||||SEQ_NO|ASC|

---

## Table: STAGE_COMPLEX_DEAL_HEAD

**Description:** This table is used to stage complex deal invoicing information to Oracle Retail Invoice Matching.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEAL_ID |  |  | Y | NUMERIC (10) | The RMS id for the complex deal for which the income is being invoiced. |
| 2 | DEAL_DETAIL_ID |  |  | Y | NUMERIC (10) | The RMS component id for the complex deal for which the income is being invoiced. |
| 3 | VENDOR_TYPE |  |  | Y | VARCHAR (6) | This column contains the type of vendor offering the deal. |
| 4 | VENDOR |  |  | Y | VARCHAR (10) | The vendor associated with the deal, the vendor may be either an RMS supplier of partner. |
| 5 | CURRENCY |  |  | Y | VARCHAR (3) | The currency that the complex deal is being invoiced in. |
| 6 | INCOME |  |  | Y | NUMERIC (20,4) | The total income for this component of the complex deal. |
| 7 | START_INVOICE_DATE |  |  | Y | Date | The first day of the first period that is being invoiced. |
| 8 | END_INVOICE_DATE |  |  | Y | Date | The last day of the last period that is being invoiced. |
| 9 | DEB_CRED_IND |  |  | Y | VARCHAR (6) | Describes whether the invoice should be Debt or Credit. |
| 10 | INVOICE_PROCESSING_LOGIC |  |  | Y | VARCHAR (6) | Determines whether the credit notes or debt notes should be created automatically or require manual intervention, also should negative amounts be included. AA - Automatic All MA - Manual All AP - Automatic Positive MP - Manual Positive NO - NO invoice processing |
| 11 | TSF_ENTITY_ID |  |  |  | NUMERIC (10) | This column contains the Transfer Entity ID the deal income is rolled up to when the credit memo level is at the Transfer Entity Level. |
| 12 | SET_OF_BOOKS_ID |  |  |  | NUMERIC (15) | This column contains the Set of Books ID the deal income is rolled up to when the credit memo level is at the Set of Books Level. |
| 13 | LOCATION |  |  |  | NUMERIC (10) | This column contains the Location number the deal income is rolled up to when the credit memo level is at the Location Level. |
| 14 | UPLOAD_IND |  |  | Y | VARCHAR (1 ) | Reim Upload Indicator |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|UK_STAGE_COMPLEX_DEAL_HEAD|UK||||DEAL_ID|ASC|
||||||DEAL_DETAIL_ID|ASC|
||||||LOCATION|ASC|
||||||SET_OF_BOOKS_ID|ASC|
||||||TSF_ENTITY_ID|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_SCDH_DEB_CRED_IND|DEB_CRED_IND IN ('C','D')<br>|
||CHK_SCDH_INVOICE_PROC_LOG|INVOICE_PROCESSING_LOGIC IN ('AA','MA','AP','MP')<br>|
||CHK_SCDH_VENDOR_TYPE|VENDOR_TYPE IN ('S','S1','S2','S3')<br>|
|Column Level|DEB_CRED_IND||






|Type|Column / Constraint Name|Details|
|---|---|---|
||INVOICE_PROCESSING_LOGIC||

---

## Table: STAGE_EXT_TRAN_DATA

**Description:** This table holds the staged transaction data records from a flat file. The records are inserted by an external transaction data upload batch program.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TRAN_ID |  |  |  | NUMERIC (10) | The RMS id for the transaction record. |
| 2 | ITEM |  |  |  | VARCHAR (25 ) | This contains the unique identifier for the item. |
| 3 | DEPT |  |  | Y | NUMERIC (4) | This contains the department associated with the SKU. |
| 4 | CLASS |  |  | Y | NUMERIC (4) | This contains the class associated with the SKU. |
| 5 | SUBCLASS |  |  | Y | NUMERIC (4) | This contains the subclass associated with the SKU. |
| 6 | LOC_TYPE |  |  | Y | VARCHAR (1 ) | This holds the location type of the location. |
| 7 | LOCATION |  |  | Y | NUMERIC (10) | This holds the location associated with the transaction. |
| 8 | TRAN_DATE |  |  | Y | Date | This identifies the date the transaction was written. |
| 9 | TRAN_CODE |  |  | Y | NUMERIC (2) | This identifies the transaction type. |
| 10 | ADJ_CODE |  |  |  | VARCHAR (1 ) | This indicates the type of adjustment for which the record is written to correct a previous error. |
| 11 | UNITS |  |  | Y | NUMERIC (12,4) | This contains the number of units involved in the transaction. |
| 12 | TOTAL_COST |  |  |  | NUMERIC (20,4) | This contains the total cost associated with the transaction. |
| 13 | TOTAL_RETAIL |  |  |  | NUMERIC (20,4) | This contains the retail value of the transaction. |
| 14 | REF_NO_1 |  |  |  | NUMERIC (10) | This holds the reference number for the transaction. |
| 15 | REF_NO_2 |  |  |  | NUMERIC (10) | This holds the reference number associated with the transaction. |
| 16 | GL_REF_NO |  |  |  | NUMERIC (10) | This contains the reference number associated with transactions, and is used for defining the General Ledger account relationship, along with |
| 17 | OLD_UNIT_RETAIL |  |  |  | NUMERIC (20,4) | This contains the old unit retail. |
| 18 | NEW_UNIT_RETAIL |  |  |  | NUMERIC (20,4) | This contains the new unit retail. |
| 19 | PGM_NAME |  |  |  | VARCHAR (100 ) | This identifies the Oracle Retail module where the record was written. |
| 20 | SALES_TYPE |  |  |  | VARCHAR (1 ) | This contains the type of sale for the SKU. |
| 21 | VAT_RATE |  |  |  | NUMERIC (12,4) | This contains the VAT rate at the selling store. |
| 22 | AV_COST |  |  |  | NUMERIC (20,4) | This contains the average cost for the SKU from the SKU/Location table. |
| 23 | REF_PACK_NO |  |  |  | VARCHAR (25 ) | This identifies the pack number for the transaction item. |
| 24 | TOTAL_COST_EXCL_ELC |  |  |  | NUMERIC (20,4) | This contains the cost exclusive for ELC. |
| 25 | WAC_RECALC_IND |  |  | Y | VARCHAR (1 ) | This indicates if the WAC should be recalculated. |
| 26 | STATUS |  |  | Y | VARCHAR (1 ) | This holds the status of the transaction. |
| 27 | ERR_MSG |  |  |  | VARCHAR (2500 ) | This contains the message describing the error that has occured during validation. |
| 28 | CREATE_TIMESTAMP |  |  | Y | Date | This holds the timestamp the transaction record was created. |
| 29 | LAST_UPDATED_TIMESTAMP |  |  | Y | Date | This holds the Oracle user-id of the user who most recently updated the record. |

---

## Table: STAGE_EXT_TRAN_DATA_CHUNK

**Description:** This table holds the chunking information for STAGE_EXT_TRAN_DATA table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEPT |  |  |  | NUMERIC (4) | This contains the department number associated with the SKU. |
| 2 | CLASS |  |  |  | NUMERIC (4) | This contains the class number associated with the SKU. |
| 3 | SUBCLASS |  |  |  | NUMERIC (4) | This contains the subclass number associated with the SKU. |
| 4 | ITEM |  |  |  | VARCHAR (25 ) | This holds the unique identifier for the item. |
| 5 | LOC_TYPE |  |  |  | VARCHAR (1 ) | This contains the location type of the location. |
| 6 | LOCATION |  |  |  | NUMERIC (10) | This contains the location associated with the transaction. |
| 7 | CHUNK_ID |  |  |  | NUMERIC (10) | Identifies the chunk ID of the transaction. |
| 8 | CHUNK_STATUS |  |  |  | VARCHAR (1 ) | Identifies the status of the chunk ID of the transaction. |

---

## Table: STAGE_FIXED_DEAL_DETAIL

**Description:** This table is used to stage the details of fixed deal invoicing information to Oracle Retail Invoice Matching.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEAL_NO | P | F | Y | NUMERIC (10) | The RMS id for the fixed deal being invoiced. |
| 2 | SEQ_NO | P |  | Y | NUMERIC (10) | Unique sequence that identifies the income row. |
| 3 | LOCATION |  | F | Y | NUMERIC (10) | Location corresponding to the fixed deal income. |
| 4 | LOC_TYPE |  |  | Y | VARCHAR (1) | Location type of the fixed deal income. |
| 5 | DEPT |  |  | Y | NUMERIC (4) | The dept corresponding to this portion of the income. |
| 6 | CLASS |  |  |  | NUMERIC (4) | The class corresponding to this portion of the income. |
| 7 | SUBCLASS |  |  |  | NUMERIC (4) | The subclass corresponding to this portion of the income. |
| 8 | INCOME |  |  | Y | NUMERIC (20,4) | The income for this dept / location / (class / subclass) for this deal.. |
| 9 | TSF_ENTITY_ID |  | F | Y | NUMERIC (10) | This column contains the Transfer Entity ID the deal income is rolled up to when the credit memo level is at the Transfer Entity Level. |
| 10 | SET_OF_BOOKS_ID |  | F | Y | NUMERIC (15) | This column contains the Set of Books ID the deal income is rolled up to when the credit memo level is at the Set of Books Level. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_STAGE_FIXED_DEAL_DETAIL|PK||||DEAL_NO|ASC|
||||||SEQ_NO|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|STAGE_FIXED_DEAL_DETAIL_I1|||||DEAL_NO|ASC|
||||||LOCATION|ASC|
||||||SET_OF_BOOKS_ID|ASC|
||||||TSF_ENTITY_ID|ASC|

---

## Table: STAGE_FIXED_DEAL_HEAD

**Description:** This table is used to stage fixed deal invoicing information to Oracle Retail Invoice Matching.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEAL_NO |  |  | Y | NUMERIC (10) | Holds the RMS id for the fixed deal that is being invoiced. |
| 2 | VENDOR_TYPE |  |  | Y | VARCHAR (6) | The type of vendor that we be invoice for this deal. Valid values are levels of RMS hierarchy, supplier, Manufacturer, Distributor, Wholesaler. |
| 3 | VENDOR |  |  | Y | VARCHAR (10) | The vendor associated with the deal, the vendor may be either an RMS supplier of partner.. |
| 4 | CURRENCY |  |  | Y | VARCHAR (3) | The currency that the deal income is in. |
| 5 | INCOME |  |  | Y | NUMERIC (20,4) | The current income generated by the deal. |
| 6 | COLLECTION_DATE |  |  | Y | Date | The date that the income is collected. |
| 7 | DEB_CRED_IND |  |  | Y | VARCHAR (6) | Describes whether the invoice should be Debt or Credit. |
| 8 | INVOICE_PROCESSING_LOGIC |  |  | Y | VARCHAR (6) | Determines whether the credit notesor debt notes should be created automatically or require manual intervention, also should negative amounts be included. AA - Automatic All MA - Manual All AP - Automatic Positive MP - Manual Positve NO - no invoice processing |
| 9 | NON_MERCH_IND |  |  |  | VARCHAR (1) | Indicates if organisational and merchandise contribution percentages will be captured. |
| 10 | NON_MERCH_CODE |  |  |  | VARCHAR (6) | Non merchandise code for fixed deals, the code for all non-merchandise lines used within invoice matching. |
| 11 | VAT_CODE |  |  |  | VARCHAR (6) | The vat code for the deal. |
| 12 | VAT_RATE |  |  |  | NUMERIC (20,10) | The vat rate of the deal. |
| 13 | ORG_UNIT_ID |  |  |  | NUMERIC (15) | Org Unit Id |
| 14 | TSF_ENTITY_ID |  |  |  | NUMERIC (10) | This column contains the Transfer Entity ID the deal income is rolled up to when the credit memo level is at the Transfer Entity Level. |
| 15 | SET_OF_BOOKS_ID |  |  |  | NUMERIC (15) | This column contains the Set of Books ID the deal income is rolled up to when the credit memo level is at the Set of Books Level. |
| 16 | LOCATION |  |  |  | NUMERIC (10) | This column contains the Location number the deal income is rolled up to when the credit memo level is at the Location Level. |
| 17 | UPLOAD_IND |  |  | Y | VARCHAR (1 ) | Reim Upload Indicator |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|UK_STAGE_FIXED_DEAL_HEAD|UK||||DEAL_NO|ASC|
||||||LOCATION|ASC|
||||||SET_OF_BOOKS_ID|ASC|
||||||TSF_ENTITY_ID|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_SFDH_DEB_CRED_IND|DEB_CRED_IND IN ('C','D')<br>|
||CHK_SFDH_INVOICE_PROC_LOG|INVOICE_PROCESSING_LOGIC IN ('AA','MA','NO')<br>|
||CHK_SFDH_VENDOR_TYPE|VENDOR_TYPE IN ('S','S1','S2','S3')<br>|
|Column Level|DEB_CRED_IND||
||INVOICE_PROCESSING_LOGIC||

---

## Table: STAGE_PURGED_SHIPMENTS

**Description:** This table holds a record for each shipment that has been purged within RMS. External systems will use this table to know which shipments have been purged.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SHIPMENT | P |  | Y | NUMERIC (12) | Contains the unique number identifying a specific shipment of goods within the system. |
| 2 | ORDER_NO |  |  |  | NUMERIC (12) | Identifies the order number which relates to the goods delivered in the shipment. |
| 3 | STATUS_CODE |  |  | Y | VARCHAR (1) | Indicates the current status of the shipment. The valid values are: R - Received I - Input C - Cancelled E - Extracted V - Invoice Entered U - Unmatched (indicates a shipment w/ origin_code = 4 created in receipts upload process which has not been matched to either an electronically sent ASN or manually keyed ASN. |
| 4 | INVC_MATCH_STATUS |  |  |  | VARCHAR (1) | Status of the shipments invoice matching. Valid values are U for unmatched, P for partially matched, M for matched and C for closed (posted to AP or closed out by batch). This column will only be populated for PO shipments. |
| 5 | ORDER_SUPPLIER |  |  |  | NUMERIC (10) | This column contains the supplier for the order that the shipment is for if the shipment is for an order. |
| 6 | ORDER_CURRENCY_CODE |  |  |  | VARCHAR (3) | Contains the currency code for the order associated with the shipment if the shipment is for an order. |
| 7 | RECEIVE_DATE |  |  |  | Date | This field contains the date the transfer or PO is received. |
| 8 | TO_LOC |  |  | Y | NUMERIC (10) | This field contains the location that the shipment will be delivered to. |
| 9 | LOC_TYPE |  |  |  | VARCHAR (1) | This field contains the type of location. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_STAGE_PURGED_SHIPMENTS|PK||||SHIPMENT|ASC|

---

## Table: STAGE_PURGED_SHIPSKUS

**Description:** This table stages shipskus that are purged by RMS. External systems will use this table to determine which shipsku records have been purged.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SHIPMENT | P |  | Y | NUMERIC (12) | Contains the unique number identifying a specific shipment of goods within the system. |
| 2 | SEQ_NO | P |  | Y | NUMERIC (10) | This field contains the sequence umber used along with the shipment number and item to make the shipment item records unique. |
| 3 | ITEM | P |  | Y | VARCHAR (25) | Unique identifier for the item. |
| 4 | QTY_RECEIVED |  |  |  | NUMERIC (12,4) | Contains the number of items already received for the SKU / Shipment combination. |
| 5 | UNIT_COST |  |  | Y | NUMERIC (20,4) | If the shipment is associated with a purchase order, UNIT_COST contains the cost of the SKU for this Shipment / Location combination based on the purchase order cost for the item and is stored in the order currency. The cost does not include landed cost components. If the shipment is associated with a transfer or allocation, UNIT_COST contains the average cost of the item at the sending location plus any up-charges. If it is for a transfer of type EG (externally generated) and has multiple inventory flows, UNIT_COST contains the average of the flows sending locations average costs plus any up-charges. For transfers or allocations UNIT_COST is stored in the from locations currency. |
| 6 | WEIGHT_RECEIVED |  |  |  | NUMERIC (12,4) | This column contains the actual weight of the item received on the shipment before the shipsku record is deleted. |
| 7 | WEIGHT_RECEIVED_UOM |  |  |  | VARCHAR (4) | This column contains the unit of measure of the received weight before the shipsku record is deleted. |

---

## Table: TEMP_DIFF1

**Description:** This temporary table will be used in the item creation process as a means to combine diffs with parent items to create differentiated children. This table will be used if the parent item has one or more differentiators. Data will be posted to this table for use in a single session, but data should never be committed to this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DIFF_1 |  |  | Y | VARCHAR (10) | Diff_id that differentiates the current item from its item_parent. For an item that is not a parent, this field may contain a value (34X34, Red, etc.) Valid values are found on the diff_id tables. |
| 2 | DISPLAY_SEQ |  |  |  | NUMERIC (4) | This field contains the display sequence for the differentiator. This field is used to determine the display order when multiple differentiators in a group are displayed. This is an optional field. |
| 3 | DIFF_DESC |  |  | Y | VARCHAR (120) | Description of the differential number. (for example, Blueberry, Shower Fresh, Red, etc.) |
| 4 | SELECTED_IND |  |  | Y | VARCHAR (1) | Determines whether the diff is to be added to the item. Valid values are Y and N. |

---

## Table: TEMP_DIFF2

**Description:** This temporary table will be used in the item creation process as a means to combine diffs with parent items to create differentiated children. This table will be used if the parent item has two or more differentiators. Data will be posted to this table for use in a single session, but data should never be committed to this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DIFF_2 |  |  | Y | VARCHAR (10) | Diff_id that differentiates the current item from its item_parent. For an item that is not a parent, this field may contain a value (34X34, Red, etc.) Valid values are found on the diff_id tables. |
| 2 | DISPLAY_SEQ |  |  |  | NUMERIC (4) | This field contains the display sequence for the differentiator. This field is used to determine the display order when multiple differentiators in a group are displayed. This is an optional field. |
| 3 | DIFF_DESC |  |  | Y | VARCHAR (120) | Description of the differential number. (for example, Blueberry, Shower Fresh, Red, etc.) |
| 4 | SELECTED_IND |  |  | Y | VARCHAR (1) | Determines whether the diff is available to be added to the item. Valid values are Y and N. |

---

## Table: TEMP_DIFF3

**Description:** This temporary table will be used in the item creation process as a means to combine diffs with parent items to create differentiated children. This table will be used if the parent item has three or more diferentiators. Data will be posted to this table for use in a single session, but data should never be committed to this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DIFF_3 |  |  | Y | VARCHAR (10) | Diff_id that differentiates the current item from its item_parent. For an item that is not a parent, this field may contain a value (34X34, Red, etc.) Valid values are found on the diff_id tables. |
| 2 | DISPLAY_SEQ |  |  |  | NUMERIC (4) | This field contains the display sequence for the differentiator. This field is used to determine the display order when multiple differentiators in a group are displayed. This is an optional field. |
| 3 | DIFF_DESC |  |  | Y | VARCHAR (120) | Description of the diff number. (for example, Blueberry, Shower Fresh, Red, etc.) |
| 4 | SELECTED_IND |  |  | Y | VARCHAR (1) | Determines whether the diff is to be added to the item. Valid values are Y and N. |

---

## Table: TEMP_DIFF4

**Description:** This temporary table will be used in the item creation process as a means to combine diffs with parent items to create differentiated children. This table will be used if the parent item has four differentiators. Data will be posted to this table for use in a single session, but data should never be committed to this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DIFF_4 |  |  | Y | VARCHAR (10) | Diff_id that differentiates the current item from its item_parent. For an item that is not a parent, this field may contain a value (34X34, Red, etc.) Valid values are found on the diff_id tables. |
| 2 | DISPLAY_SEQ |  |  |  | NUMERIC (4) | This field contains the display sequence for the differentiator. This field is used to determine the display order when multiple differentiators in a group are displayed. This is an optional field. |
| 3 | DIFF_DESC |  |  | Y | VARCHAR (120) | Description of the diff number. (for example, Blueberry, Shower Fresh, Red, etc.) |
| 4 | SELECTED_IND |  |  | Y | VARCHAR (1) | Determines whether the diff is to be added to the item. Valid values are Y and N. |

---

## Table: TEMP_DIFF_DUPLICATE

**Description:** This table will hold any combinations of diff that duplicate those that already exist for the item. Data will be posted to this table for use in a single session, but data should never be committed to this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DIFF_1 |  |  |  | VARCHAR (10) | First diff_id that differentiates the current item from its item_parent. For an item that is not a parent, this field may contain a value (34X34, Red, etc.) Valid values are found on the diff_id tables. |
| 2 | DIFF_2 |  |  |  | VARCHAR (10) | Second diff_id that differentiates the current item from its item_parent. For an item that is not a parent, this field may contain a value (34X34, Red, etc.) Valid values are found on the diff_id tables. |
| 3 | DIFF_3 |  |  |  | VARCHAR (10) | Third diff_id that differentiates the current item from its item_parent. For an item that is not a parent, this field may contain a value (34, Red, etc.) |
| 4 | DIFF_4 |  |  |  | VARCHAR (10) | Fourth diff_id that differentiates the current item from its item_parent. For an item that is not a parent, this field may contain a value (34, Red, etc.) |

---

## Table: TEMP_INTRANSIT_ORDER_QTY

**Description:** This table will hold in-transit qty of an item for an order to be reflected in AIP.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ORDER_NO | P |  | Y | NUMERIC (12) | Contains the number that uniquely identifies an order within the system. |
| 2 | ITEM | P |  | Y | VARCHAR (25) | Unique alphanumeric value that identifies the item. |
| 3 | LOCATION | P |  | Y | VARCHAR (10) | Numeric identifier of the location in which the item is to be found. |
| 4 | QTY_INTRANSIT |  |  |  | NUMERIC (12,4) | Contains the quantity of the item that is currently in transit to the location. |

---

## Table: TEMP_PACK_TMPL

**Description:** This table is used during the creation of pack templates. It temporarily stores the color and size combinations as well as quantities for each pack. This table is cleared when the user is finished creating the pack template.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PACK_TMPL_ID |  |  |  | NUMERIC (8) | This field contains the unique identifier for the pack template. |
| 2 | DIFF1 |  |  |  | VARCHAR (10) | This field contains the first differential for the item(s) that will be added to the pack template. |
| 3 | DIFF1_SEQ |  |  |  | NUMERIC (4) | This field contains a sequence number for the first differential. |
| 4 | DIFF2 |  |  |  | VARCHAR (10) | This field contains the second differential for the item(s) that will be added to the pack template. |
| 5 | DIFF2_SEQ |  |  |  | NUMERIC (4) | This field contains a sequence number for the second differential. |
| 6 | DIFF3 |  |  |  | VARCHAR (10) | This field contains the third differential for the item(s) that will be added to the pack template. |
| 7 | DIFF3_SEQ |  |  |  | NUMERIC (4) | This field contains a sequence number for the third differential. |
| 8 | DIFF4 |  |  |  | VARCHAR (10) | This field contains the fourth differential for the item(s) that will be added to the pack template. |
| 9 | DIFF4_SEQ |  |  |  | NUMERIC (4) | This field contains a sequence number for the fourth differential. |
| 10 | QTY |  |  |  | NUMERIC (12) | This field contains the quantity of the item that will be added to the pack template. |
| 11 | BUILT_IND |  |  | Y | VARCHAR (1) | This field indicates whether the record has been successfully processed and can be built onto the pack_template tables. This is used for internal processing only. |
| 12 | SELECTED_IND |  |  | Y | VARCHAR (1) | This field indicates whether the record has been selected for processing or not. This is used with the multi-select feature within Oracle Retail. |
| 13 | DELETE_IND |  |  |  | VARCHAR (1) | Indicates whether a column should be deleted after a diff or diff range has been applied. |

---

## Table: TEMP_TRAN_DATA

**Description:** This table is used in deal income processing. It holds a temporary copy of the tran data for the items and locations that are accruing income through a bill back deal.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  |  |  | VARCHAR (25) | Unique identifier for the item |
| 2 | DEPT |  |  |  | NUMERIC (4) | Department number associated with the SKU |
| 3 | CLASS |  |  |  | NUMERIC (4) | Class number associated with the SKU |
| 4 | SUBCLASS |  |  |  | NUMERIC (4) | Subclass number associated with the SKU |
| 5 | PACK_IND |  |  |  | VARCHAR (1) | Indicates whether or not the item is a pack item |
| 6 | LOC_TYPE |  |  |  | VARCHAR (1) | This field contains the Location Type |
| 7 | LOCATION |  |  |  | NUMERIC (10) | This field contains the Store if the LOC_TYPE = S |
| 8 | TRAN_DATE |  |  |  | Date | Identifies the date the transaction was written |
| 9 | TRAN_CODE |  |  |  | NUMERIC (4) | Identifies the transaction type |
| 10 | ADJ_CODE |  |  |  | VARCHAR (1) | This field indicates the type of adjustment for which this record is written to correct a previous error |
| 11 | UNITS |  |  | Y | NUMERIC (12,4) | The number of units involved in the transaction |
| 12 | TOTAL_COST |  |  |  | NUMERIC (20,4) | Contains the total cost associated with the transaction. This field is stored in the local currency. |
| 13 | TOTAL_RETAIL |  |  |  | NUMERIC (20,4) | Contains the retail value of the transaction. This field is stored in the local currency. |
| 14 | REF_NO_1 |  |  |  | NUMERIC (12) | Reference number for the transaction. |
| 15 | REF_NO_2 |  |  |  | NUMERIC (12) | Reference number associated with the transaction |
| 16 | GL_REF_NO |  |  |  | VARCHAR (25) | This field contains the reference number associated with a transaction. It is used for defining the General Ledger account relationship along with dept, class, subclass, location, and tran_code, etc. For example: if tran_code is 22 or 23, then this field contains an Inventory Adjustment Reason Code; if tran_code is 37 or 38, then this field contains From_loc or To_loc for the Intercompany Transfer; if tran_code is 63 or 64, then this field contains Work Order Activity ID; if tran_code is 87 or 88, then this field contains the VAT code associated with the transaction. |
| 17 | OLD_UNIT_RETAIL |  |  |  | NUMERIC (20,4) | Contains the old unit retail before the change for transaction types 11 to 16. Otherwise this field will be empty. This field is stored in the local |
| 18 | NEW_UNIT_RETAIL |  |  |  | NUMERIC (20,4) | Contains the newunit retail before the change for transaction types 11 to 16. Otherwise this field will be empty. This field is stored in the local currency. |
| 19 | PGM_NAME |  |  |  | VARCHAR (100) | Identifies the Oracle Retail module where the record was written |
| 20 | SALES_TYPE |  |  |  | VARCHAR (1) | This field will contain the type of sale for SKU |
| 21 | VAT_RATE |  |  |  | NUMERIC (12,4) | This field will contain the VAT rate at the selling store |
| 22 | AV_COST |  |  |  | NUMERIC (20,4) | This field will contain the average cost for the SKU from the SKU/Location table |
| 23 | TIMESTAMP |  |  | Y | Date | System generated Timestamp |

---

## Table: TEMP_TRAN_DATA_SUM

**Description:** This table summarizes the tran data information for items and locations that are accruing income through a bill back deal.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEPT |  |  | Y | NUMERIC (4) | Department number associated with the SKU. |
| 2 | CLASS |  |  | Y | NUMERIC (4) | Class number associated with the SKU. |
| 3 | SUBCLASS |  |  | Y | NUMERIC (4) | Subclass number associated with the SKU. |
| 4 | LOC_TYPE |  |  | Y | VARCHAR (1) | This field contains Location Type. Valid Values are : S = Store W = Warehouse E = External Finisher |
| 5 | LOCATION |  |  | Y | VARCHAR (10) | This field contains the Store if Loc_type = S the Warehouse or Internal Finisher if Loc_type = W the External Finisher if Loc_type = E. |
| 6 | TRAN_DATE |  |  | Y | Date | Identifies the date the transaction was written. |
| 7 | SALES_TOTAL |  |  | Y | NUMERIC (20,4) | Summed up total_retail for tran_code 6 |
| 8 | PURCHASE_TOTAL |  |  |  | NUMERIC (20,4) | Summed up total_retail for tran_code 7 |

---

## Table: WORK_STKUPLD_EXT_FIN_RTL_GTT

**Description:** This table is a helper table used in retrieving the average retail for items with external finisher locations with no records or NULL values on the item_loc_soh table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | EXTERNAL_FINISHER |  |  |  | NUMERIC (10) | Contains the external finisher location. |
| 2 | ITEM |  |  |  | VARCHAR (25) | Unique identifier for the item that was counted. This is the transaction-level item for the item in the stockcount_item field. |
| 3 | FINISHER_AV_RETAIL |  |  |  | NUMERIC (20,4) | Contains the transformed sellable only item in the stock count. |

---

## Table: WORK_STKUPLD_ITEM_LOC_GTT

**Description:** This table is an helper table used in the stock upload process. Information required in the stock upload process from multiple RMS tables are retrieved and stored in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID |  |  |  | NUMERIC (15) | Unique id that identifies a stock upload process. It can either be manually provided or automatically generated. |
| 2 | CHUNK_ID |  |  |  | NUMERIC (10) | This is used to divide data associated with the same process_id into multiple chunks to facilitate parallel processing. For the same process_id, chunk_id starts with 1 and increment by 1 for each new chunk. |
| 3 | CYCLE_COUNT |  |  |  | NUMERIC (8) | Contains the number which uniquely identifies the stock or cycle count in RMS. |
| 4 | STOCKTAKE_TYPE |  |  |  | VARCHAR (1) | Contains a value which indicates the type of stock count. Valid values are: B = both unit and value and U = unit only. |
| 5 | PRODUCT_LEVEL_IND |  |  |  | VARCHAR (1) | Contains the product level (department, class, or subclass) at which the stock count was requested at. |
| 6 | LOCATION_TYPE |  |  |  | VARCHAR (1) | Contains location type where the stock count was requested for. Valid values are: S = store, W = warehouse(including internal finisher) or E = external finisher. |
| 7 | PHYSICAL_LOCATION |  |  |  | NUMERIC (10) | The actual physical store or warehouse where the stock count was taken. This value would differ from the location if the location is a warehouse. |
| 8 | LOCATION |  |  |  | NUMERIC (10) | Contains the location where the stock count occured. |
| 9 | STOCKCOUNT_QUANTITY |  |  |  | NUMERIC (12,4) | Contains the quantity counted for a item location combination. |
| 10 | ITEM |  |  |  | VARCHAR (25) | Unique identifier for the item that was counted. This is the transaction-level item for the item in the stockcount_item field. |
| 11 | PACK_ITEM |  |  |  | VARCHAR (25) | Unique identifier for the pack item under which the item belongs to. Pack items are exploded into their components as part of the stock count process. |
| 12 | STOCKCOUNT_ITEM |  |  |  | VARCHAR (25) | Unique identifier for the item that was counted. |
| 13 | ITEM_TYPE |  |  |  | VARCHAR (3) | Type of item contained in the stockcount_item field. Valid values are: ITM = transaction level item and REF = below transaction level item. |
| 14 | DEPT |  |  |  | NUMERIC (4) | Contains the department of the item in the stock count. Sourced from the item_master table. |
| 15 | CLASS |  |  |  | NUMERIC (4) | Contains the class of the item in the stock count. Sourced from the item_master table. |
| 16 | SUBCLASS |  |  |  | NUMERIC (4) | Contains the subclass of the item in the stock count. Sourced from the item_master table. |
| 17 | ITEM_LEVEL |  |  |  | NUMERIC (1) | Number indicating which of the three levels the item resides. Valid values are the numbers 1 through 3. The item level determines if the item stands alone or if it is part of a family of related items. Sourced from the item_master table. |
| 18 | TRAN_LEVEL |  |  |  | NUMERIC (1) | Number indicating which of the three levels transactions occur for the items group. Valid values are the numbers 1 through 3. The transaction level is the level at which the items inventory is tracked in the system. Sourced from the item_master table. |
| 19 | ITEM_STATUS |  |  |  | VARCHAR (1) | Contains the status of the item. Valid values are: W = worksheet, S = submitted, A = approved. Sourced from the item_master table. |
| 20 | PACK_IND |  |  |  | VARCHAR (1) | Indicates if the item is a pack. Valid values are: Y = yes and N = no. Sourced from the item_master table. |
| 21 | SIMPLE_PACK_IND |  |  |  | VARCHAR (1) | Indicates if pack item is a simple pack or not. This field will only have a value if the item is a pack item. Valid values are: Y = yes and N = No. Sourced from the item_master table. |
| 22 | ITEM_XFORM_IND |  |  |  | VARCHAR (1) | Indicates if the item is associated to an item transformation. Valid values are: Y = yes and N = no. The item will be either the sellable item or orderable item in the transformation process. Sourced from the item_master table. |
| 23 | SELLABLE_IND |  |  |  | VARCHAR (1) | Indicates if pack item may be sold as a unit. Valid values are: Y = yes, this pack may be sold as a unit and N = no, this pack may not be sold as a unit. Sourced from the item_master table. |
| 24 | ORDERABLE_IND |  |  |  | VARCHAR (1) | Indicates if pack item is orderable. If it is Y then the suppliers of the pack must supply all components in the pack. Valid values are: Y = yes, this pack may be ordered N = no, this pack may not be ordered. Sourced from the item_master table. |
| 25 | INVENTORY_IND |  |  |  | VARCHAR (1) | Indicates if an item holds inventory or not for item transformations. Valid values are: Y = yes and N = no. Sourced from the item_master table. |
| 26 | LOCATION_DESCRIPTION |  |  |  | VARCHAR (150) | Contains the description of the location where the stock count was done. This is usually entered by whoever set up the stock count and does not reflect the actual location name in RMS. |
| 27 | XFORM_ITEM_TYPE |  |  |  | VARCHAR (1) | This field holds the item transformation type. This is determined during the stock count upload process. Valid values are: S - transformed sellable, O = transformed orderable. |
| 28 | SSL_SNAPSHOT_ON_HAND_QUANTITY |  |  |  | NUMERIC (12,4) | Contains the current system value for stock on hand for the stock take location at the end of the day when the physical count is to be taken. Sourced from the stake_sku_loc table. |
| 29 | SSL_PHYSICAL_COUNT_QUANTITY |  |  |  | NUMERIC (12,4) | Contains the total quantity counted for the item at the stock count location. Sourced from the stake_sku_loc table. |
| 30 | SSL_PACK_COMP_QUANTITY |  |  |  | NUMERIC (12,4) | Contains the quantity of a component item existing in the pack items that were counted. Sourced from the stake_sku_loc table. |
| 31 | SSL_PROCESSED_IND |  |  |  | VARCHAR (1) | Indicates whether or not the record has been processed in the stock count process. The value will be N when the record is first created and will be updated to a P for processed when an inventory adjustment is created. This adjustment will reflect the difference between the physical count and the stock on hand in the system. Sourced from the stake_sku_loc table. |
| 32 | ILS_STOCK_ON_HAND |  |  |  | NUMERIC (12,4) | Contains the current inventory of the item location. This is retrieved from the item_loc_soh.stock_on_hand field. It is only used for warehouse location stock counts. |
| 33 | STAKE_QUANTITY |  |  |  | NUMERIC (12,4) | Contains the quantity counted for the item ast the stock count location. |
| 34 | NEW_ITEMLOC_IND |  |  |  | VARCHAR (1) | Indicates if the item on the stock count has not yet been ranged in the system. Records with a value of Y will will undergo the new item location ranging process. |
| 35 | STATUS |  |  |  | VARCHAR (1) | Contains the status of the record in the stock count process. |
| 36 | ERROR_MSG |  |  |  | VARCHAR (255) | Contains the error message for this record. Error messages are stored as the output the SQL_LIB.CREATE_MSG function. Multiple error messages are possible for a single record if the error is non-fatal. Multiple error messages are concatenated together. |

---

## Table: WORK_STKUPLD_PWH_NO_DIST_GTT

**Description:** This is a helper table used when the stock count location is a warehouse. It is used to assist in the distribution logic. The records on this table are the item/physical warehouse records that do not need to undergo the RMS distribution logic.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | CYCLE_COUNT |  |  |  | NUMERIC (8) | Contains the number which uniquely identifies the stock or cycle count in RMS. |
| 2 | PHYSICAL_WH |  |  |  | NUMERIC (10) | Contains the number of the physical warehouse location where the stock count was done. |
| 3 | ITEM |  |  |  | VARCHAR (25) | Unique identifier for the item that was counted. This is the transaction-level item for the item in the stockcount_item field. |
| 4 | PACK_ITEM |  |  |  | VARCHAR (25) | Unique identifier of the pack item under which the item belongs to. |
| 5 | ITEM_XFORM_IND |  |  |  | VARCHAR (1) | Indicates if the item is a transformed item or not. This is sourced from the item_master table. |
| 6 | STOCKCOUNT_ITEM |  |  |  | VARCHAR (25) | Unique identifier for the item that was counted. |

---

## Table: WORK_STKUPLD_STAKE_QTY_GTT

**Description:** This table is an helper table used in the stock upload process. Information required in the stock upload process from multiple RMS tables are retrieved and stored in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID |  |  |  | NUMERIC (15) | Unique id that identifies a stock upload process. It can either be manually provided or automatically generated. |
| 2 | CHUNK_ID |  |  |  | NUMERIC (10) | This is used to divide data associated with the same process_id into multiple chunks to facilitate parallel processing. For the same process_id, chunk_id starts with 1 and increment by 1 for each new chunk. |
| 3 | CYCLE_COUNT |  |  |  | NUMERIC (8) | Contains the number which uniquely identifies the stock or cycle count in RMS. |
| 4 | LOCATION_TYPE |  |  |  | VARCHAR (1) | Contains location type where the stock count was requested for. Valid values are: S = store, W = warehouse(including internal finisher) or E = external finisher. |
| 5 | PHYSICAL_LOCATION |  |  |  | NUMERIC (10) | The actual physical store or warehouse where the stock count was taken. This value would differ from the location if the location is a warehouse. |
| 6 | LOCATION |  |  |  | NUMERIC (10) | Contains the location where the stock count occured. |
| 7 | STOCKCOUNT_QUANTITY |  |  |  | NUMERIC (12,4) | Contains the quantity counted for a item location combination. |
| 8 | ITEM |  |  |  | VARCHAR (25) | Unique identifier for the item that was counted. This is the transaction-level item for the item in the stockcount_item field. |
| 9 | PACK_ITEM |  |  |  | VARCHAR (25) | Unique identifier for the pack item under which the item belongs to. Pack items are exploded into their components as part of the stock count process. |
| 10 | STOCKCOUNT_ITEM |  |  |  | VARCHAR (25) | Unique identifier for the item that was counted. |
| 11 | PACK_IND |  |  |  | VARCHAR (1) | Indicates if the item is a pack. Valid values are: Y = yes and N = no. Sourced from the item_master table. |
| 12 | ITEM_XFORM_IND |  |  |  | VARCHAR (1) | Indicates if the item is associated to an item transformation. Valid values are: Y = yes and N = no. The item will be either the sellable item or orderable item in the transformation process. Sourced from the item_master table. |
| 13 | LOCATION_DESCRIPTION |  |  |  | VARCHAR (150) | Contains the description of the location where the stock count was done. This is usually entered by whoever set up the stock count and does not reflect the actual location name in RMS. |
| 14 | STAKE_QUANTITY |  |  |  | NUMERIC (12,4) | Contains the quantity counted for the item ast the stock count location. |
| 15 | UOM_CLASS |  |  |  | VARCHAR (6) | Contains the unit of measure type used as a grouping mechanism for the many UOM options. |
| 16 | STATUS |  |  |  | VARCHAR (1) | Contains the status of the record in the stock count process. |
| 17 | ERROR_MSG |  |  |  | VARCHAR (255) | Contains the error message for this record. Error messages are stored as the output the SQL_LIB.CREATE_MSG function. Multiple error messages are possible for a single record if the error is non-fatal. Multiple error messages are concatenated together. |

---

## Table: WORK_STKUPLD_VWH_DIST_QTY_GTT

**Description:** This is a helper table used when the stock count location is a warehouse. It is used to assist in the distribution logic. The records on this table contain the distributed quantities at the virtual warehouses as determined by the RMS distribution logic.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | CYCLE_COUNT |  |  |  | NUMERIC (8) | Contains the number which uniquely identifies the stock or cycle count in RMS. |
| 2 | PHYSICAL_WH |  |  |  | NUMERIC (10) | Contains the number of the physical warehouse location where the stock count was done. |
| 3 | VIRTUAL_WH |  |  |  | NUMERIC (10) | Contains the number of the virtual warehouse belonging to the physical warehouse. |
| 4 | ITEM |  |  |  | VARCHAR (25) | Unique identifier for the item that was counted. This is the transaction-level item for the item in the stockcount_item field. |
| 5 | PACK_ITEM |  |  |  | VARCHAR (25) | Unique identifier of the pack item under which the item belongs to. |
| 6 | ITEM_XFORM_IND |  |  |  | VARCHAR (1) | Indicates if the item is a transformed item or not. This is sourced from the item_master table. |
| 7 | DIST_QTY |  |  |  | NUMERIC (12,4) | The quantity to distribute or allocate to the virtual warehouse as determined by the RMS distribution logic. |
| 8 | STOCKCOUNT_ITEM |  |  |  | VARCHAR (25) | Unique identifier for the item that was counted. |

---

## Table: WORK_STKUPLD_XFORM_GTT

**Description:** This table is a helper table used in the stock upload process. Item transformation information for the items in the stock count and their related transform items are retrieved from the item_xform_head and item_xform_detail tables and stored here.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | CYCLE_COUNT |  |  |  | NUMERIC (8) | Contains the number which uniquely identifies the stock or cycle count. |
| 2 | LOCATION_TYPE |  |  |  | VARCHAR (1) | Contains location type where the stock count was requested for. Valid values are: S = store, W = warehouse(including internal finisher) or E = external finisher. |
| 3 | PHYSICAL_LOCATION |  |  |  | NUMERIC (10) | The actual physical store or warehouse where the stock count was taken. This value would differ from the location if the location is a warehouse. |
| 4 | LOCATION |  |  |  | NUMERIC (10) | Contains the location where the stock count occured. |
| 5 | LOCATION_DESCRIPTION |  |  |  | VARCHAR (150) | Contains the description of the location where the stock count was done. This is usually entered by whoever set up the stock count and does not reflect the actual location name in RMS. |
| 6 | XFORM_SELLABLE_ITEM |  |  |  | VARCHAR (25) | Contains the sellable only item transformed from the orderable only item in an item transformation. This is sourced from the detail_item field in the item_xform_detail table. |
| 7 | XFORM_YIELD_PCT |  |  |  | NUMERIC (12,4) | Contains the percentage of the yield of sellable only item item from the orderable item associated with it. This is sourced from the yield_from_head_item_pct field in the item_xform_detail table. |
| 8 | XFORM_ORDERABLE_ITEM |  |  |  | VARCHAR (25) | Contains the orderable only item in the item transformation. This is sourced from the head_item field in the item_xform_head table. |
| 9 | XFORM_ORDERABLE_DEPT |  |  |  | NUMERIC (4) | Contains the department of the orderable only item. Sourced from the item_master table. |
| 10 | XFORM_ORDERABLE_CLASS |  |  |  | NUMERIC (4) | Contains the class of the orderable only item. Sourced from the item_master table. |
| 11 | XFORM_ORDERABLE_SUBCLASS |  |  |  | NUMERIC (4) | Contains the subclass of the orderable only item. Sourced from the item_master table. |
| 12 | XFORM_ORDERABLE_ITEM_LEVEL |  |  |  | VARCHAR (1) | Number indicating which of the three levels the orderable only item resides at. Valid values are the numbers 1 through 3. Sourced from the item_master table. |
| 13 | XFORM_ORDERABLE_TRAN_LEVEL |  |  |  | VARCHAR (1) | Number indicating which of the three levels transactions occur for the orderable only item. Valid values are the numbers 1 through 3. Sourced from the item_master table. |
| 14 | XFORM_ORDERABLE_ITEM_STATUS |  |  |  | VARCHAR (1) | Status of the transformed orderable item from the item_master table. |
| 15 | XFORM_ORDERABLE_PACK_IND |  |  |  | VARCHAR (1) | Indicates if the transformed orderable item is a pack item or not. This is sourced from the item_master table. |
| 16 | XFORM_ORDERABLE_SMPL_PACK_IND |  |  |  | VARCHAR (1) | Indicates if the transformed orderable item is a simple pack or not. This is sourced from the item_master table. |
| 17 | XFORM_ORDERABLE_ITEM_XFORM_IND |  |  |  | VARCHAR (1) | Indicates if the transformed orderable item is a transformed item or not. This is sourced from the item_master table. |
| 18 | XFORM_ORDERABLE_SELLABLE_IND |  |  |  | VARCHAR (1) | Indicates if the transformed orderable item is a sellable item or not. This is sourced from the item_master table. |
| 19 | XFORM_ORDERABLE_ORDERABLE_IND |  |  |  | VARCHAR (1) | Indicates if the transformed orderable item is an orderable item or not. This is sourced from the item_master table. |
| 20 | XFORM_ORDERABLE_INVENTORY_IND |  |  |  | VARCHAR (1) | Indicates if the transformed orderable item is an inventory item or not. This is sourced from the item_master table. |

---

## Table: WORK_STKUPLD_XFORM_ORD_GTT

**Description:** This table is a helper table used in the stock upload process. This table contains transformed orderable only item for sellable only items in the stock count. These orderable only items are not included in the stock count.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | CYCLE_COUNT |  |  |  | NUMERIC (8) | Contains the number which uniquely identifies the stock or cycle count. |
| 2 | XFORM_ORDERABLE_ITEM |  |  |  | VARCHAR (25) | Contains the transformed orderable item for the sellable only item in the stock count. The orderable only item is not part of the store count. |
| 3 | XFORM_SELLABLE_ITEM |  |  |  | VARCHAR (25) | Contains the transformed sellable only item in the stock count. |

---

## Table: XY_DIFF_RATIO_TEMP

**Description:** This table is used only for Apply diff ratio functionality.It will be populated based on historical data presents in diff_ratio_detail table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DIFF_TYPE | P |  | Y | VARCHAR (1) | This field contains value 'X' or 'Y'.'X' incase of row contains diff_x value and 'Y' incase of row contains diff_y value |
| 2 | DIFF_ID | P |  | Y | VARCHAR (10) | This field contains diff_x ids or diff_y ids |
| 3 | VALUE |  |  |  | NUMERIC (12,4) | This field holds historical data on diff distribution value corresponds to diff_x ids or diff_y ids |
