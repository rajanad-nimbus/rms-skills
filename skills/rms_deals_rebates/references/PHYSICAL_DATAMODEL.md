# RMS Vendor Deals & Rebates Datamodel - Physical Data Model Reference

## Table: DEALFCT_TEMP

**Description:** Temporary table for dealfct batch program

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DAF_ROWID |  |  |  | ROWID | This is the unique rowid of a corresponding deal record in the DEAL_ACTUALS_FORECAST table. |
| 2 | DEAL_ID |  |  | Y | NUMERIC (10) | This contains the unique deal ID number. |
| 3 | DEAL_DETAIL_ID |  |  | Y | NUMERIC (10) | This contains the Deal component ID number. |
| 4 | DH_CURRENCY_CODE |  |  | Y | VARCHAR (3) | Currency code of the deal's currency. All costs on the deal will be held in this currency. |
| 5 | THRESHOLD_LIMIT_TYPE |  |  |  | VARCHAR (6) | Identifies whether thresholds will be set up as quantity values, currency amount values or percentages (growth rebates only). Valid values are Q for quantity, A for currency amount or P for percentage. Deal limit types will be held on the codes table under a code type of DLLT. It can only be NULL for an M-type deal (vendor funded markdown). |
| 6 | REBATE_IND |  |  | Y | VARCHAR (1) | Indicates if the deal component is a rebate. Deal components can only be rebates for bill-back billing types. Valid values are Y for yes or N for no. |
| 7 | TOTAL_ACTUAL_FIXED_IND |  |  |  | VARCHAR (1) | This indicator is set to fix the total actual columns so as not to be recalculated when actual figures are captured. |
| 8 | TOTAL_FORECAST_UNITS |  |  |  | NUMERIC (20,4) | Deal performance forecast units. This will be the forecasted units for the remaining forecasted period for the deal component if the forecast_fixed_ind = N or the initial forecast units if the fixed_ind = Y. |
| 9 | TOTAL_FORECAST_REVENUE |  |  |  | NUMERIC (20,4) | Deal performance forecast revenue. This will be the forecasted revenue for the remaining forecasted period for the deal component if the forecast_fixed_ind = N or the initial forecast units if the fixed_ind = Y. |
| 10 | TOTAL_ACTUAL_FORECAST_TURNOVER |  |  |  | NUMERIC (20,4) | This is the actual/forecast turnover at the deal component level. |
| 11 | REPORTING_DATE |  |  | Y | Date | This is the date for the reporting period for the deal. |
| 12 | LAST_PERIOD_IND |  |  |  | VARCHAR (1) | This indicates if the record is in the last reporting period of the deail. |
| 13 | ACTUAL_FORECAST_TURNOVER |  |  |  | NUMERIC (20,4) | Forecast turnover for the deal component reporting period (forecast periods only). |
| 14 | VLOC_CURRENCY_CODE |  |  |  | VARCHAR (3) | This is the currency code of the location of the deal. |
| 15 | ACTUAL_TURNOVER_UNITS |  |  |  | NUMERIC (20,4) | This is the actuals for the deal component for the item/location for that reporting period in Units. |
| 16 | ACTUAL_TURNOVER_REVENUE |  |  |  | NUMERIC (20,4) | This is the actuals for the deal component for the item/location for that reporting period in revenue. |
| 17 | ACTUAL_INCOME |  |  |  | NUMERIC (20,4) | This is the income for the deal component for the item/location for that period. |

---

## Table: DEAL_ACTUALS_FORECAST

**Description:** This table holds all the deal performance forecasts. There is one row per deal component reporting period. Currency of the income (and turnover if the turnover is in amount) is the deal currency given that invoicing uses these values.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEAL_ID | P | F | Y | NUMERIC (10) | Contains the unique deal ID number. |
| 2 | DEAL_DETAIL_ID | P | F | Y | NUMERIC (10) | Contains the Deal component ID number, uniquely sequenced within each deal. |
| 3 | REPORTING_DATE | P |  | Y | Date | This is the date for the reporting period for the deal |
| 4 | ACTUAL_FORECAST_IND |  |  | Y | VARCHAR (1) | This indicator determines if the actual_forecast_turnover and actual_forecast_trend are based on actuals or turnover. Valid Values are Actuals and Forecast. |
| 5 | BASELINE_TURNOVER |  |  | Y | NUMERIC (20,4) | Baseline turnover for the deal component reporting period (all periods). |
| 6 | BUDGET_TURNOVER |  |  | Y | NUMERIC (20,4) | Budget turnover for the deal component reporting period (all periods). |
| 7 | BUDGET_INCOME |  |  | Y | NUMERIC (20,4) | Budget income (calculated based on the budget turnover) for the deal component reporting period (forecast periods only). |
| 8 | ACTUAL_FORECAST_TURNOVER |  |  | Y | NUMERIC (20,4) | Forecast turnover for the deal component reporting period (forecast periods only). |
| 9 | ACTUAL_FORECAST_INCOME |  |  | Y | NUMERIC (20,4) | Forecast income (calculated from the forecast turnover) for the deal component reporting period (forecast periods only). |
| 10 | ACTUAL_FORECAST_TREND_TURNOVER |  |  | Y | NUMERIC (20,4) | Forecast trend turnover for the deal component reporting period (forecast periods only). |
| 11 | ACTUAL_FORECAST_TREND_INCOME |  |  | Y | NUMERIC (20,4) | Forecast trend income (calculated from the forecast trend turnover) for the deal component reporting period (forecast periods only). |
| 12 | ACTUAL_INCOME |  |  |  | NUMERIC (20,4) | This is the income for the deal component for the item location for that period. |
| 13 | INVC_PROCESSED_IND |  |  |  | VARCHAR (1) | This indicates if the invoice is already processed for the corresponding reporting period. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_DEAL_ACTUALS_FORECAST|PK||||DEAL_ID|ASC|
||||||DEAL_DETAIL_ID|ASC|
||||||REPORTING_DATE|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_DAF_ACTUAL_FORECAST_IND|ACTUAL_FORECAST_IND IN ('F','A')<br>|
||CHK_DAF_INVC_PROCESSED_IND|INVC_PROCESSED_IND in ('Y','N')<br>|
|Column Level|ACTUAL_FORECAST_IND||
||INVC_PROCESSED_IND||

---

## Table: DEAL_ACTUALS_ITEM_LOC

**Description:** This table holds all the deal performance actuals. There is one row per deal component item location reporting period. Currency of the revenue and income is the local currency of the location given that records are written to TRAN_DATA from this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DAI_ID | P |  | Y | NUMERIC (20) | Contains the unique ID for this table . |
| 2 | DEAL_ID |  | F | Y | NUMERIC (10) | Contains the unique deal ID number. |
| 3 | DEAL_DETAIL_ID |  | F | Y | NUMERIC (10) | Contains the Deal component ID number, uniquely sequenced within each deal. |
| 4 | REPORTING_DATE |  |  | Y | Date | The date which identifies each reporting period. |
| 5 | ITEM |  | F | Y | VARCHAR (25) | The unique identifier for the item. |
| 6 | LOCATION |  |  | Y | NUMERIC (10) | The number of the location in which the item is to be found. This field may contain a store or a warehouse. |
| 7 | LOC_TYPE |  |  | Y | VARCHAR (1) | Type of the location in the location field. Valid values are for Store or Warehouse. |
| 8 | ACTUAL_TURNOVER_UNITS |  |  |  | NUMERIC (12,4) | This is the actuals for the deal component for the item location for that reporting period in Units to be returned to the actuals turnover field in the deal performance screen |
| 9 | ACTUAL_TURNOVER_REVENUE |  |  |  | NUMERIC (20,4) | This is the actuals for the deal component for the item location for that reporting period in revenue to be returned to the actuals turnover field in the deal performance screen. |
| 10 | ORDER_NO |  |  |  | NUMERIC (12) | If the deal is a Bill Back then deal income needs to be calculated per order, so the order number is required for these types of deals. |
| 11 | ACTUAL_INCOME |  |  |  | NUMERIC (20,4) | This is the income for the deal component for the item location for that period. |
| 12 | BILL_TO_LOC |  |  |  | NUMERIC (10) | This contains the Import ID of the order associated to the deal if it is an import order. Otherwise, this will be the deal location. |
| 13 | BILL_TO_LOC_TYPE |  |  |  | VARCHAR (1) | This indicates if the invoice is already processed for the corresponding reporting periodThis contains the Importer Type of the order associated to the deal if it is an import order. Otherwise, this will be the deal location type. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_DEAL_ACTUALS_ITEM_LOC|PK||||DAI_ID|ASC|
|UK_DEAL_ACTUALS_ITEM_LOC|UK||||DEAL_ID|ASC|
||||||DEAL_DETAIL_ID|ASC|
||||||REPORTING_DATE|ASC|
||||||ITEM|ASC|
||||||LOCATION|ASC|
||||||LOC_TYPE|ASC|
||||||ORDER_NO|ASC|
||||||BILL_TO_LOC_TYPE|ASC|
||||||BILL_TO_LOC|ASC|
|DEAL_ACTUALS_ITEM_LOC_I1|||||ITEM|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_DEAL_ACTUALS_ITEM_LOC|UN||||DAI_ID|ASC|
|UK_DEAL_ACTUALS_ITEM_LOC|UN||||DEAL_ID|ASC|
||||||DEAL_DETAIL_ID|ASC|
||||||REPORTING_DATE|ASC|
||||||ITEM|ASC|
||||||LOCATION|ASC|
||||||LOC_TYPE|ASC|
||||||ORDER_NO|ASC|
||||||BILL_TO_LOC_TYPE|ASC|
||||||BILL_TO_LOC|ASC|

---

## Table: DEAL_ATTRIB_DEF

**Description:** This table will hold the definitions of various deal attribute types. No user interface is provided for this table. The table is populated with initial values during system set up. Additional values can be added by a DBA.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEAL_ATTRIB_TYPE_ID | P |  | Y | VARCHAR (6) | Deal attribute type id. For ease of use and filtering of values, all deal attributes must be assigned a deal_attrib_type. Valid values for this field can be found in the code_type DACT. Additional values may be added to the code type. This field is required by the database |
| 2 | DEAL_ATTRIB_ID |  |  | Y | NUMERIC (4) | Deal attribute ID. This field will be used to differentiate between the various attributes within a deal attribute type. |
| 3 | DEAL_ATTRIB_DESC |  |  | Y | VARCHAR (250) | Description of the deal attribute. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_DEAL_ATTRIB_DEF|PK||||DEAL_ATTRIB_TYPE_ID|ASC|

---

## Table: DEAL_ATTRIB_DEF_TL

**Description:** This is the translation table for DEAL_ATTRIB_DEF table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | DEAL_ATTRIB_TYPE_ID | P | F | Y | VARCHAR (6) | Deal attribute type id. For ease of use and filtering of values, all deal attributes must be assigned a deal_attrib_type. Valid values for this field can be found in the code_type DACT. Additional values may be added to the code type. This field is required by the database |
| 3 | DEAL_ATTRIB_DESC |  |  | Y | VARCHAR (250) | Description of the deal attribute. |
| 4 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 6 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 7 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_DEAL_ATTRIB_DEF_TL|PK||||LANG|ASC|
||||||DEAL_ATTRIB_TYPE_ID|ASC|

---

## Table: DEAL_BB_NO_REBATE_TEMP

**Description:** This table is used to hold the Billback No Rebate type of deal information in order to calculate the actuals for each reporting period.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ORDER_NO |  |  | Y | NUMERIC (12) | This contains the order number associated to the deal. |
| 2 | DEAL_ID |  |  | Y | NUMERIC (10) | This contains the unique Deal ID Number. |
| 3 | DEAL_DETAIL_ID |  |  | Y | NUMERIC (10) | Deal component ID number, uniquely sequenced within each deal |
| 4 | DAI_ID |  |  |  | NUMERIC (20) | This contains the unique ID for the associated record in the DEAL_ACTUALS_ITEM_LOC table. |
| 5 | ITEM |  |  | Y | VARCHAR (25) | This contains the item in the deal. |
| 6 | LOC_TYPE |  |  | Y | VARCHAR (1) | This contains the location type of the location associated to the deal. |
| 7 | LOCATION |  |  | Y | NUMERIC (10) | This contains the location associated to the deal. |
| 8 | ORDER_CURRENCY_CODE |  |  | Y | VARCHAR (3) | This is the currency code of the order associated to the deal. |
| 9 | LOC_CURRENCY_CODE |  |  | Y | VARCHAR (3) | This contains the currency code of the location associated to the deal. |
| 10 | TOTAL_UNITS |  |  | Y | NUMERIC (12,4) | This is the total actuals for the deal component for the item/location for the given reporting period in Units. |
| 11 | TOTAL_REVENUE |  |  | Y | NUMERIC (20,4) | This is the total actuals for the deal component for the item/location for the given reporting period in Revenue. |
| 12 | REPORTING_DATE |  |  | Y | Date | This is the date for the reporting period of the deal. |

---

## Table: DEAL_BB_REBATE_PO_TEMP

**Description:** This table is used to hold the Billback Rebate Purchase Order type of deal information in order to calculate the actuals for each reporting period.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEAL_ID |  |  | Y | NUMERIC (10) | unique deal number |
| 2 | DEAL_DETAIL_ID |  |  | Y | NUMERIC (10) | Deal component ID number, uniquely sequenced within each deal |
| 3 | DAI_ID |  |  |  | NUMERIC (20) | This contains the uniqe ID number of the associated record in the DEAL_ACTUALS_ITEM_LOC table. |
| 4 | ITEM |  |  | Y | VARCHAR (25) | This contains the item associated to the deal. |
| 5 | LOC_TYPE |  |  | Y | VARCHAR (1) | This contains the location type of the location associated to the deal. |
| 6 | LOCATION |  |  | Y | NUMERIC (10) | This contains the location associated to the deal. |
| 7 | ORDER_CURRENCY_CODE |  |  | Y | VARCHAR (3) | This contains the currency code of the order associated to the deal. |
| 8 | LOC_CURRENCY_CODE |  |  | Y | VARCHAR (3) | This contains the currency code of the location associated to the deal. |
| 9 | TOTAL_UNITS |  |  | Y | NUMERIC (12,4) | This is the total actuals for the deal component for the item/location for the given reporting period in Units. |
| 10 | TOTAL_REVENUE |  |  | Y | NUMERIC (20,4) | This is the total actuals for the deal component for the item/location for the given reporting period in Revenue. |
| 11 | REPORTING_DATE |  |  | Y | Date | This is the date for the reporting period of the deal. |
| 12 | BILL_TO_LOC |  |  |  | NUMERIC (10) | This contains the Import ID of the order associated to the deal if it is an import order. Otherwise, this will be the deal location. |
| 13 | BILL_TO_LOC_TYPE |  |  |  | VARCHAR (1) | This contains the Import Type of the order associated to the deal if it is an import order. Otherwise, this will be the deal location type |

---

## Table: DEAL_BB_RECEIPT_SALES_TEMP

**Description:** This table is used to hold the Billback Rebate Sales and Receipts type of deal information in order to calculate the actuals for each reporting period.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEAL_ID |  |  | Y | NUMERIC (10) | unique deal number |
| 2 | DEAL_DETAIL_ID |  |  | Y | NUMERIC (10) | Deal component ID number, uniquely sequenced within each deal |
| 3 | ITEM |  |  | Y | VARCHAR (25) | This is the item associated to the deal. |
| 4 | LOC_TYPE |  |  | Y | VARCHAR (1) | This is the location type of the location associated to the deal. |
| 5 | LOCATION |  |  | Y | NUMERIC (10) | This is the location associated to the deal. |
| 6 | REBATE_PURCH_SALES_IND |  |  | Y | VARCHAR (6) | Indicates if the rebate should be applied to purchases or sales. Valid values are P for purchases or S for sales. It will be required if the rebate indicator is Y. Rebate purchase/sales indicators will be held on the codes table under a code type of DLRP. |
| 7 | PARTNER_TYPE |  |  | Y | VARCHAR (6) | This is the type of the partner the deal applies to. Valid values are S1 for supplier hierarchy level 1 (e.g. manufacturer), S2 for supplier hierarchy level 2 (e.g. distributor) and S3 for supplier hierarchy level 3 (e.g. wholesaler). Descriptions of these codes will be held on the codes table under a code_type of SUHL. |
| 8 | PARTNER_ID |  |  |  | VARCHAR (10) | This is the level of supplier hierarchy (e.g. manufacturer, distributor or wholesaler), set up as a partner in the PARTNER table, used for assigning rebates by a level other than supplier. Rebates at this level will include all eligible supplier/item/country records assigned to this supplier hierarchy level. |
| 9 | SUPPLIER |  |  |  | NUMERIC (10) | This is the supplier associated to the deal. |
| 10 | REPORTING_DATE_VDATE |  |  |  | Date | This indicates the minimum reporting date that is greater than or equal to vdate. |
| 11 | REPORTING_DATE_NEOM |  |  |  | Date | This indicates the maximum reporting date that is less than or equal to the next end of month date. |
| 12 | MONTH_CLOSED_IND |  |  | Y | VARCHAR (1) | This indicates whether the month is closed or not. If vdate is greater than the next end of month date then month is not closed, value is N. Otherwise, value is Y. |
| 13 | ACTIVE_DATE |  |  | Y | Date | This is the date the deal will become active. This date will determine when deal components begin to be factored into item costs. |
| 14 | CLOSE_DATE |  |  |  | Date | This is the date the deal will end. This date determines when deal components are no longer factored into item costs. It is optional for annual deals, required for promotional deals. It will be left NULL for PO-specific deals. |
| 15 | TRACK_PACK_LEVEL_IND |  |  |  | VARCHAR (1) | Used to indicate whether the packs are to be tracked at pack level or not. |
| 16 | ORIGIN_COUNTRY_ID |  |  |  | VARCHAR (3) | Origin country of the item that the deal component should apply to. |

---

## Table: DEAL_CALC_QUEUE

**Description:** This table will hold all POs that have been approved or have had deal applications requested during the day. This list will be used to drive the process rebuilding the ORDSKU_DISCOUNT table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ORDER_NO | P | F | Y | NUMERIC (12) | Order that needs discounts applied or recalculated in the nightly batch run. |
| 2 | RECALC_ALL_IND |  |  | Y | VARCHAR (1) | Indicates if the order should be recalculated even if it is not affected by deals (this will only happen in case of a supplier cost change for an item on an order). Valid values are Y for yes or N for no. |
| 3 | OVERRIDE_MANUAL_IND |  |  | Y | VARCHAR (1) | Indicates if costs that have been modified manually on the PO should be overwritten when applying discounts. Valid values are Y for yes or N for no. |
| 4 | ORDER_APPR_IND |  |  | Y | VARCHAR (1) | Indicates if the PO was just approved. This will override the suppression of deal recalculation on approved deals, if the deal should not affect approved orders. This makes it so the order can be recalculated one final time on order approval. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_DEAL_CALC_QUEUE|PK||||ORDER_NO|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_DEAL_CALC_QUEUE_ORDER_APPR|order_appr_ind in ('Y','N')<br>|
||CHK_DEAL_CALC_QUEUE_OVERRIDE_M|override_manual_ind in ('Y','N')<br>|
||CHK_DEAL_CALC_QUEUE_RECALC_ALL|recalc_all_ind in ('Y','N')|
|Column Level|RECALC_ALL_IND||
||OVERRIDE_MANUAL_IND||
||ORDER_APPR_IND||

---

## Table: DEAL_CALC_QUEUE_TEMP

**Description:** The table is created to handle the locking problems in the sccext.pc batch when run in multiple threads. The table will be populated from COST_EXTRACT_SQL.UPDATE_APPROVED_ORDERS function and is used to bulk update the deal_calc_queue table in sccext.pc

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ORDER_NO |  |  | Y | NUMERIC (12) | This field contains the purchase order numbers to be updated. |
| 2 | RECALC_ALL_IND |  |  | Y | VARCHAR (1) | Indicates if the order should be recalculated |
| 3 | OVERRIDE_MANUAL_IND |  |  | Y | VARCHAR (1) | Indicates if costs that have been modified manually on the PO should be overwritten when applying discounts. |
| 4 | ORDER_APPR_IND |  |  | Y | VARCHAR (1) | Indicates if the PO was just approved. |

---

## Table: DEAL_COMP_PROM

**Description:** This table will contain records that are associated to multiple Vendor Funded Promotion Components for a single Vendor Funded Deal Component.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEAL_ID | P | F | Y | NUMERIC (10) | Deal identification number |
| 2 | DEAL_DETAIL_ID | P | F | Y | NUMERIC (10) | Deal detail identification number |
| 3 | PROMOTION_ID | P |  | Y | NUMERIC (10) | Promotion identification number |
| 4 | PROMO_COMP_ID | P |  | Y | NUMERIC (10) | Promotion component identification number |
| 5 | CONTRIBUTION_PCT |  |  | Y | NUMERIC (12,4) | Contribution percentage applicable to the promotion component |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_DEAL_COMP_PROM|PK||||DEAL_ID|ASC|
||||||DEAL_DETAIL_ID|ASC|
||||||PROMOTION_ID|ASC|
||||||PROMO_COMP_ID|ASC|

---

## Table: DEAL_COMP_TYPE

**Description:** This table will hold user-defined deal component types. A deal component type will be required on each deal component held on the DEAL_DETAIL table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEAL_COMP_TYPE | P |  | Y | VARCHAR (6) | Code identifying the type of a deal component. These codes are user-defined and assigned to each deal component. |
| 2 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |
| 3 | CREATE_DATETIME |  |  | Y | Date | This column holds the record creation date. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_DEAL_COMP_TYPE|PK||||DEAL_COMP_TYPE|ASC|

---

## Table: DEAL_COMP_TYPE_TL

**Description:** This table holds the translated descriptions of deal component type code in all languages.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEAL_COMP_TYPE | P | F | Y | VARCHAR (6) | Code identifying the type of a deal component. These codes are user-defined and assigned to each deal component. |
| 2 | LANG | P | F | Y | NUMERIC (6) | Contains the number which uniquely identifies a language. |
| 3 | DEAL_COMP_TYPE_DESC |  |  | Y | VARCHAR (250 ) | Holds the description of the deal type code in a given language. |
| 4 | ORIG_LANG_IND |  |  | Y | VARCHAR (1 ) | Indicates if the description is in the original language entered for the cost change reason code. It is set to â€˜Yâ€™ when the first record is written to the table for the cost change reason code. |
| 5 | REVIEWED_IND |  |  | Y | VARCHAR (1 ) | Indicates if the description needs to be reviewed for translation. It is set to â€˜Nâ€™ when the description in the original language is inserted or updated. We assume that clients will regularly run reports on all strings that are not reviewed (i.e. reviewed_ind = â€˜Nâ€™). When translation either provides a new string, or OKs that the existing string is correct, the reviewed_ind should be set to â€˜Yâ€™. |
| 6 | CREATE_ID |  |  | Y | VARCHAR (30 ) | This field contains the user that created the record. |
| 7 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 8 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30 ) | This field contains the user that last updated the record. |
| 9 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_DEAL_COMP_TYPE_TL|PK||||DEAL_COMP_TYPE|ASC|
||||||LANG|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_DEAL_COMP_TYP_TL_ORIG_IND|ORIG_LANG_IND IN ('Y', 'N')<br>|
||CHK_DEAL_COMP_TYP_TL_REV_IND|REVIEWED_IND IN ('Y', 'N')<br>|

---

## Table: DEAL_DETAIL

**Description:** This table will hold deal component information for each deal. Deal component information will share the same supplier and start and end dates. This table holds the main information about each discount or rebate, including calculation methods, rebate information for rebates, billing types and user-defined deal component types.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEAL_ID | P | F | Y | NUMERIC (10) | Unique deal number, generated from a sequence. |
| 2 | DEAL_DETAIL_ID | P |  | Y | NUMERIC (10) | Deal component ID number, uniquely sequenced within each deal. |
| 3 | DEAL_COMP_TYPE |  | F | Y | VARCHAR (6) | Type of the deal component, user-defined and stored on the DEAL_TYPE table. |
| 4 | APPLICATION_ORDER |  |  |  | NUMERIC (10) | Number indicating the order in which the deal component should be applied with respect to any other deal components applicable to the item within the deal. This number will be unique across all deal components within the deal. It can only be NULL for an M-type deal (vendor funded markdown). |
| 5 | COLLECT_START_DATE |  |  |  | Date | Date that collection of the bill-back should begin. |
| 6 | COLLECT_END_DATE |  |  |  | Date | Date that collection of the bill-back should end. |
| 7 | COST_APPL_IND |  |  |  | VARCHAR (6) | Indicates what cost bucket the deal component should affect. Valid values are N for net cost, NN for net net cost and DNN for dead net net cost. These values will be held on the codes tables under a code_type of DLCA. It can only be NULL for an M-type deal (vendor funded markdown). |
| 8 | PRICE_COST_APPL_IND |  |  | Y | VARCHAR (1) | Identifies deal components that should be included when calculating a pricing cost. |
| 9 | DEAL_CLASS |  |  |  | VARCHAR (6) | Identifies the calculation class of the deal component. Valid values are CU for cumulative (discounts are added together and taken off as one lump sum), CS for cascade (discounts are taken one at a time with subsequent discounts taken off the result of the previous discount) and EX for exclusive (overrides all other discounts). EX type deal components are only valid for promotional deals. Deal classes will be held on the codes table under a code type of DLCL. It can only be NULL for an M-type deal (vendor funded markdown). |
| 10 | THRESHOLD_VALUE_TYPE |  |  |  | VARCHAR (6) | Identifies whether the discount values associated with the thresholds will be set up as qty values, currency amount values, percentages or fixed amounts. Valid values are Q for qty, A for currency amount, P for percentage or F for fixed amount. Qty threshold deals are only allowed on off-invoice discounts. Deal threshold value types will be held on the codes table under a code type of DLL2. It can only be NULL for an M-type deal (vendor funded markdown). |
| 11 | QTY_THRESH_BUY_ITEM |  | F |  | VARCHAR (25) | Identifies the item that must be purchased for a quantity threshold-type discount. This value is required for quantity threshold-type discounts. |
| 12 | QTY_THRESH_GET_TYPE |  |  |  | VARCHAR (6) | Identifies the type of the get discount for a quantity threshold-type (buy/get) discount. Valid values include X (free), P (percent), A (amount) and F (fixed amount). They are held on the codes table under a code type of DQGT. This value is required for quantity threshold deals. |
| 13 | QTY_THRESH_GET_VALUE |  |  |  | NUMERIC (20,4) | Identifies the value of the get discount for a quantity threshold-type (buy/get) discount that is not a free goods deal. The type of the value is identified by the get type in the qty_thresh_get_type. This value is required for quantity threshold deals that are not a get type of free. |
| 14 | QTY_THRESH_BUY_QTY |  |  |  | NUMERIC (12,4) | Identifies the quantity of the threshold buy item that must be ordered to qualify for the free item. This value is required for quantity |
| 15 | QTY_THRESH_RECUR_IND |  |  | Y | VARCHAR (1) | For buy/get free discounts, indicates if the quantity threshold discount is only for the first buy amt. purchased (e.g. for the first 10 purchased, get 1 free), or if a free item will be given for every multiple of the buy amt purchased on the order (e.g. for each 10 purchased, get 1 free). This value is required for quantity threshold-type discounts with a get type of free. Valid values are Y for yes or N for no. |
| 16 | QTY_THRESH_BUY_TARGET |  |  |  | NUMERIC (12,4) | Indicates the targeted purchase level for all locs on a purchase order. This is the target level that will be used for future calculation of net cost. |
| 17 | QTY_THRESH_BUY_AVG_LOC |  |  |  | NUMERIC (12,4) | Indicates the average targeted purchase level per location on the deal. This value will be used in future cost calculations. |
| 18 | QTY_THRESH_GET_ITEM |  | F |  | VARCHAR (25) | Identifies the get item for a quantity threshold-type (buy/get) discount. This value is required for quantity threshold deals. |
| 19 | QTY_THRESH_GET_QTY |  |  |  | NUMERIC (12,4) | Identifies the quantity of the identified get item that will be given at the specified get discount if the buy amt of the buy item is purchased. This value is required for quantity threshold-type discounts. |
| 20 | QTY_THRESH_FREE_ITEM_UNIT_COST |  |  |  | NUMERIC (20,4) | For buy/get free discounts, identifies the unit cost of the threshold free item that will be used in calculating the prorated qty. discount. It will default to the item/supplier cost, but can be modified based on the agreement with the supplier. It must be greater than zero as this is the cost that would normally be charged for the goods if no deal applied. |
| 21 | TRAN_DISCOUNT_IND |  |  | Y | VARCHAR (1) | Indicates if the discount is a transaction-level discount (e.g. 10% across an entire PO). |
| 22 | CURRENT_COMP_START_DATE |  |  |  | Date | The first date of the current/future period during which growth will be measured in this growth rebate. Note performance and the rebate amount are not calculated - this field is for informational/reporting purposes only. |
| 23 | CURRENT_COMP_END_DATE |  |  |  | Date | The last date of the current/future period during which growth will be measured in this growth rebate. Note performance and the rebate amount are not calculated - this field is for informational/reporting |
| 24 | COMMENTS |  |  |  | VARCHAR (2000) | Free-form comments entered with the deal component. |
| 25 | CREATE_DATETIME |  |  | Y | Date | Date/time stamp of when the record was created. This date/time can be used for auditing purposes. This value should only be populated on insert - it should never be updated. This field is required by the database. |
| 26 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | Holds the Oracle user-id of the user who most recently updated this record. This date/time can be used for auditing purposes. This field is required by the database. |
| 27 | LAST_UPDATE_DATETIME |  |  | Y | Date | Holds the date time stamp of the most recent update by the last_update_id. This date/time can be used for auditing purposes. This field is required by the database. |
| 28 | CALC_TO_ZERO_IND |  |  |  | VARCHAR (1) | Indicates if the valid values are Y for yes or N for no. In cases where multiple thresholds are created but one does not exist from zero upwards, this additional indicator when checked will apply the income calculation from zero to the upper limit on the lower threshold rather than on just between the lower and upper limit of the lowest threshold. |
| 29 | TOTAL_FORECAST_UNITS |  |  |  | NUMERIC (12,4) | Deal performance forecast units. This will be the forecasted units for the remaining forecasted period for the deal component if the forecast_fixed_ind = N or the initial forecast units if the fixed_ind = Y. |
| 30 | TOTAL_FORECAST_REVENUE |  |  |  | NUMERIC (20,4) | Deal performance forecast revenue. This will be the forecasted revenue for the remaining forecasted period for the deal component if the forecast_fixed_ind = N or the initial forecast units if the fixed_ind = Y. |
| 31 | TOTAL_BUDGET_TURNOVER |  |  |  | NUMERIC (20,4) | Total budget turnover at the deal component level. |
| 32 | VFP_DEFAULT_CONTRIB_PCT |  |  |  | NUMERIC (12,4) | The contribution percentage for each Vendor Funded Promotion,%. |
| 33 | TOTAL_BASELINE_GROWTH_BUDGET |  |  |  | NUMERIC (12,4) | Total baseline % growth rate for budget turnover at the deal component level. |
| 34 | TOTAL_BASELINE_GROWTH_ACT_FOR |  |  |  | NUMERIC (12,4) | Total baseline % growth rate for the actuals/forecast turnover at the deal component level. |
| 35 | TOTAL_BUDGET_FIXED_IND |  |  | Y | VARCHAR (1) | This indicator is set to fix the total budget columns so as not to be recalculated when actual figures are captured. |
| 36 | TOTAL_ACTUAL_FIXED_IND |  |  | Y | VARCHAR (1) | This indicator is set to fix the total actual columns so as not to be recalculated when actual figures are captured. |
| 37 | TOTAL_ACTUAL_FORECAST_TURNOVER |  |  |  | NUMERIC (20,4) | Actual/forecast turnover at the deal component level. |
| 38 | ACTUAL_MONIES_EARNED_TO_DATE |  |  |  | NUMERIC (20,4) | The total monies earned for the deal to date. |
| 39 | GROWTH_RATE_TO_DATE |  |  |  | NUMERIC (12,4) | The budget growth rate percentage for the deal to date. |
| 40 | TURNOVER_TO_DATE |  |  |  | NUMERIC (20,4) | The budget total turnover for the deal to date. |
| 41 | GET_FREE_DISCOUNT |  |  |  | NUMERIC (12,4) | GET_FREE_DISCOUNT column specifies how much percentage of the total discount should be apprtioned from the get items unit cost for off invoice deals where buy item is not same as the get item and QTY_THRESH_GET_TYPE is X. The remaining will be apportioned from the buy item unit cost. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_DEAL_DETAIL|PK||||DEAL_ID|ASC|
||||||DEAL_DETAIL_ID|ASC|
|DEAL_DETAIL_I2|||||QTY_THRESH_BUY_ITEM|ASC|
|DEAL_DETAIL_I6|UN||||DEAL_ID|ASC|
||||||APPLICATION_ORDER|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|DEAL_DETAIL_I3|||||QTY_THRESH_GET_ITEM|ASC|
|DEAL_DETAIL_I4|||||DEAL_COMP_TYPE|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_DEAL_DTL_COST_APPL_IND|cost_appl_ind in ('N','NN','DNN')<br>|
||CHK_DEAL_DTL_DEAL_CLASS|deal_class in ('CU','CS','EX')<br>|
||CHK_DEAL_DTL_QTY_THRESH|((qty_thresh_get_type in ('P','A','F') and qty_thresh_get_item is not NULL and qty_thresh_get_value is not NULL and qty_thresh_get_qty<br>is not NULL and qty_thresh_free_item_unit_cost is NULL) or (qty_thresh_get_type in ('X') and qty_thresh_get_item is not NULL and<br>qty_thresh_buy_item is not NULL and qty_thresh_get_item != qty_thresh_buy_item and get_free_discount is not NULL and<br>qty_thresh_get_value is NULL and qty_thresh_get_qty is not NULL and qty_thresh_free_item_unit_cost is not NULL) or<br>(qty_thresh_get_type in ('X') and qty_thresh_get_item is not NULL and qty_thresh_get_value is NULL and qty_thresh_get_qty is not NULL<br>and qty_thresh_free_item_unit_cost is not NULL) OR (qty_thresh_get_type is null and qty_thresh_get_item is NULL and<br>qty_thresh_get_value is NULL and qty_thresh_get_qty is NULL and qty_thresh_recur_ind = 'N' and qty_thresh_free_item_unit_cost is<br>NULL))<br>|
||CHK_DEAL_DTL_QTY_THRESH_GET_TY|QTY_THRESH_GET_TYPE in ('X','P','A','F')<br>|
||CHK_DEAL_DTL_QTY_THRESH_RECUR|qty_thresh_recur_ind in ('Y','N')<br>|
||CHK_DEAL_DTL_THRESH_VALUE_TYPE|threshold_value_type in ('Q','A','P','F')<br>|
||CHK_DEAL_DTL_TRAN_DISCOUNT_IND|TRAN_DISCOUNT_IND in ('Y','N')<br>|
||CHK_DLD_CALC_TO_ZERO_IND|CALC_TO_ZERO_IND IN ('Y','N')<br>|
||CHK_DLD_TOTAL_ACTUAL_FIXED_IND|TOTAL_ACTUAL_FIXED_IND IN ('Y','N')<br>|
||CHK_DLD_TOTAL_BUDGET_FIXED_IND|TOTAL_BUDGET_FIXED_IND IN ('Y','N')<br>|
|Column Level|COST_APPL_IND||






|Type|Column / Constraint Name|Details|
|---|---|---|
||DEAL_CLASS||
||THRESHOLD_VALUE_TYPE||
||QTY_THRESH_GET_TYPE||
||QTY_THRESH_RECUR_IND||
||TRAN_DISCOUNT_IND||
||CALC_TO_ZERO_IND||
||TOTAL_BUDGET_FIXED_IND||
||TOTAL_ACTUAL_FIXED_IND||

---

## Table: DEAL_DETAIL_TEMP

**Description:** GLOBAL TEMPORARY TABLE ON COMMIT DELETE ROWS

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEAL_ID | P |  | Y | NUMERIC (10) | This contains the unique deal ID number. |
| 2 | DEAL_DETAIL_ID | P |  | Y | NUMERIC (10) | This contains the Deal component ID number, uniquely sequenced within each deal. |

---

## Table: DEAL_HEAD

**Description:** This table will hold deal header information for each deal, including such information as supplier or manufacturer, and start and end dates.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEAL_ID | P |  | Y | NUMERIC (10) | Unique deal number, generated from a sequence. |
| 2 | PARTNER_TYPE |  | F | Y | VARCHAR (6) | Type of the partner the deal applies to. Valid values are S1 for supplier hierarchy level 1 (e.g. manufacturer), S2 for supplier hierarchy level 2 |
| 3 | PARTNER_ID |  | F | Y | VARCHAR (10) | Level of supplier hierarchy (e.g. manufacturer, distributor or wholesaler), set up as a partner in the PARTNER table, used for assigning rebates by a level other than supplier. Rebates at this level will include all eligible supplier/item/country records assigned to this supplier hierarchy level. |
| 4 | SUPPLIER |  | F |  | NUMERIC (10) | Deal suppliers number. This supplier can be at any level of supplier hierarchy. |
| 5 | TYPE |  |  | Y | VARCHAR (6) | Type of the deal. Valid values are A for annual deal, P for promotional deal, O for PO-specific deal or M for vendor-funded markdown. Deal types will be held on the codes table under a code type of DLHT. |
| 6 | STATUS |  |  | Y | VARCHAR (6) | Code for the status of the deal. Valid values are W for worksheet, S for submitted, A for approved, R for rejected and C for closed. Deal statuses will be held on the codes table under a code type of DLHS. |
| 7 | CURRENCY_CODE |  | F | Y | VARCHAR (3) | Currency code of the deals currency. All costs on the deal will be held in this currency. |
| 8 | ACTIVE_DATE |  |  | Y | Date | Date the deal will become active. This date will determine when deal components begin to be factored into item costs. For a PO-specific deal, the active_date will be the orders written date. |
| 9 | CLOSE_DATE |  |  |  | Date | Date the deal will/did end. This date determines when deal components are no longer factored into item costs. It is optional for annual deals, required for promotional deals. It will be left NULL for PO-specific deals. |
| 10 | CLOSE_ID |  |  |  | VARCHAR (30) | Oracle user ID of the user that closed the deal. This will only be populated if the deal has been manually closed using the menu option in the deal header form. |
| 11 | CREATE_DATETIME |  |  | Y | Date | Date/time stamp of when the record was created. This value should only be populated on insert - it should never be updated. This field is required by the database. |
| 12 | CREATE_ID |  |  | Y | VARCHAR (30) | Oracle user ID of the user that entered the deal into the system. |
| 13 | APPROVAL_DATE |  |  |  | Date | Date the deal was approved. |
| 14 | APPROVAL_ID |  |  |  | VARCHAR (30) | Oracle user ID of the user that approved the deal. |
| 15 | REJECT_DATE |  |  |  | Date | Date the deal was rejected. |
| 16 | REJECT_ID |  |  |  | VARCHAR (30) | Oracle user ID of the user that rejected the deal. |
| 17 | EXT_REF_NO |  |  |  | VARCHAR (30) | Any given external reference number associated with the deal. |
| 18 | ORDER_NO |  | F |  | NUMERIC (12) | Order the deal applies to, if the deal is PO-specific. |
| 19 | RECALC_APPROVED_ORDERS |  |  | Y | VARCHAR (1) | Indicates if approved orders should be recalculated based on this deal once the deal is approved. Valid values are Y for yes or N for no. |
| 20 | COMMENTS |  |  |  | VARCHAR (2000) | Free-form comments entered with the deal. |
| 21 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | Holds the Oracle user-id of the user who most recently updated this record. This date/time can be used for auditing purposes. This field is required by the database. |
| 22 | LAST_UPDATE_DATETIME |  |  | Y | Date | Holds the date time stamp of the most recent update by the last_update_id. This date/time can be used for auditing purposes. This field is required by the database. |
| 23 | BILLING_TYPE |  |  | Y | VARCHAR (6) | Billing type of the deal component. Valid values are OI for off-invoice and BB for bill-back Billing types will be held on the codes table under a code type of DLBT. |
| 24 | BILL_BACK_PERIOD |  |  |  | VARCHAR (6) | Code that identifies the bill-back period for the deal component. This field will only be populated for billing types of BB. Valid billing periods will be held on the codes table under a new code type of DLBP. Valid values |
| 25 | DEAL_APPL_TIMING |  |  |  | VARCHAR (6) | Indicates when the deal component should be applied - at PO approval or time of receiving. Valid values are O for PO approval, R for receiving. These values will be held on the codes tables under a code_type of AALC. It can only be NULL for an M-type deal (vendor funded markdown). |
| 26 | THRESHOLD_LIMIT_TYPE |  |  |  | VARCHAR (6) | Identifies whether thresholds will be set up as qty values, currency amount values or percentages (growth rebates only). Valid values are Q for qty, A for currency amount or P for percentage. Deal limit types will be held on the codes table under a code type of DLLT. It can only be NULL for an M-type deal (vendor funded markdown). |
| 27 | THRESHOLD_LIMIT_UOM |  | F |  | VARCHAR (4) | Unit of measure of the threshold limits, if the limit type is quantity. Only UOMs with a UOM class of VOL (volume), MASS or QTY (quantity) can be used in this field. |
| 28 | REBATE_IND |  |  | Y | VARCHAR (1) | Indicates if the deal component is a rebate. Deal components can only be rebates for bill-back billing types. Valid values are Y for yes or N for no. |
| 29 | REBATE_CALC_TYPE |  |  |  | VARCHAR (6) | Indicates if the rebate should be calculated using linear or scalar calculation methods. Valid values are L for linear or S for scalar. This field will be required if the rebate indicator is Y. Rebate calculation types will be held on the codes table under a code type of DLCT. |
| 30 | GROWTH_REBATE_IND |  |  | Y | VARCHAR (1) | Indicates if the rebate is a growth rebate, meaning it is calculated and applied based on an increase in purchases or sales over a specified period of time. Valid values are Y for yes or N for no. This field will be required if the rebate indicator is Y. |
| 31 | HISTORICAL_COMP_START_DATE |  |  |  | Date | The first date of the historical period against which growth will be measured in this growth rebate. Note performance and the rebate amount are not calculated - this field is for informational/reporting purposes only. |
| 32 | HISTORICAL_COMP_END_DATE |  |  |  | Date | The last date of the historical period against which growth will be measured in this growth rebate. Note performance and the rebate amount are not calculated - this field is for informational/reporting |
| 33 | REBATE_PURCH_SALES_IND |  |  |  | VARCHAR (6) | Indicates if the rebate should be applied to purchases or sales. Valid values are P for purchases or S for sales. It will be required if the rebate indicator is Y. Rebate purchase/sales indicators will be held on the codes table under a code type of DLRP. |
| 34 | DEAL_REPORTING_LEVEL |  |  |  | VARCHAR (6) | This will determine periods shown in the deal income screen and the frequency of the deal income accrual reporting. Valid values are W for week, M for month or Q for Quarter - these will be held on the codes table under a new code type of DLRL. |
| 35 | BILL_BACK_METHOD |  |  |  | VARCHAR (6) | This will determine the bill back method. It will be required for bill back deals only. Valid values are Credit note or Debit note - these will be held on the codes table under a new code type of DLBM. |
| 36 | DEAL_INCOME_CALCULATION |  |  |  | VARCHAR (6) | This will determine how the income will be calculated. Valid values are Actuals earned to date or Pro-rated using forecast - these will be held on the codes table under a new code type of DLIC |
| 37 | INVOICE_PROCESSING_LOGIC |  |  |  | VARCHAR (6) | This will determine if the credit notes or debit notes created should be created manually or require manual intervention and also if negative amounts should be included. Valid values are AA for Automatic All values, MA for Manual All Values, AP Automatic Positive values only, MA Manual Positive values only, NO - no invoice processing - these will be held on the codes table under a new code type of DLIP. |
| 38 | STOCK_LEDGER_IND |  |  | Y | VARCHAR (1) | Indicates if the deal income accrual will also be written to the RMS stock ledger. Valid values are Y for yes or N for no. |
| 39 | INCLUDE_VAT_IND |  |  | Y | VARCHAR (1) | Indicates if VAT will be included in the billing information. Valid values are Y for yes or N for no. |
| 40 | BILLING_PARTNER_TYPE |  |  |  | VARCHAR (6) | Type of the partner the deal applies to. Valid values are S1 for supplier hierarchy level 1 (e.g. manufacturer), S2 for supplier hierarchy level 2 (e.g. distributor) and S3 for supplier hierarchy level 3 (e.g. wholesaler). |
| 41 | BILLING_PARTNER_ID |  |  |  | VARCHAR (10) | Level of supplier hierarchy (e.g. manufacturer, distributor or wholesaler), set up as a partner in the PARTNER table, used for |
| 42 | BILLING_SUPPLIER_ID |  |  |  | NUMERIC (10) | Unique identifying number for a supplier within the system. This indicates the supplier that will included on the invoice information. |
| 43 | GROWTH_RATE_TO_DATE |  |  |  | NUMERIC (12,4) | The budget growth rate percentage for the deal to date. |
| 44 | TURNOVER_TO_DATE |  |  |  | NUMERIC (20,4) | The budget total turnover for the deal to date. |
| 45 | ACTUAL_MONIES_EARNED_TO_DATE |  |  |  | NUMERIC (20,4) | The total monies earned for the deal to date. |
| 46 | SECURITY_IND |  |  | Y | VARCHAR (1) | Indicator to determine deal security. If this indicator is checked, then only people with the same or greater access as the user that created the deal will be able to view and edit the deal (similar to fixed deal security for non-merchandise fixed deals see the deals01 functional spec for more details). If the indicator is not checked, a user with one element in common with the deal will be able to view and edit the entire deal. |
| 47 | EST_NEXT_INVOICE_DATE |  |  |  | Date | This is the estimated next invoice date for the deal. |
| 48 | LAST_INVOICE_DATE |  |  |  | Date | This is the last time an invoice was raised for the deal. |
| 49 | TRACK_PACK_LEVEL_IND |  |  |  | VARCHAR (1) | Used to indicate whether the packs are to be tracked at pack level or not. |
| 50 | BBD_ADD_REP_DAYS |  |  |  | NUMERIC (3) | This column will give the number of extra reporting days that should be added to the Deal_actuals_forecast table to cater to the late postings of the transactions after the deal close date. |
| 51 | RPM_DEAL_IND |  |  | Y | VARCHAR (1) |  |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_DEAL_HEAD|PK||||DEAL_ID|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|DEAL_HEAD_I4|||||SUPPLIER|ASC|
|DEAL_HEAD_I3|||||PARTNER_TYPE|ASC|
||||||PARTNER_ID|ASC|
|DEAL_HEAD_I2|||||ORDER_NO|ASC|
|DEAL_HEAD_I5|||||THRESHOLD_LIMIT_UOM|ASC|
|DEAL_HEAD_I1|||||CURRENCY_CODE|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_DEAL_HEAD_CLOSE_DAT_TYPE_S|(type = 'P' and close_date is NOT NULL) OR (type = 'O' and close_date is NULL) OR ((type in ('A','M')) AND ((status in ('W','S','A','R')) OR<br>(status = 'C' and close_date is NOT NULL)))<br>|
||CHK_DEAL_HEAD_CURRENCY_CODE|currency_code is NOT NULL AND type in ('O', 'P', 'A', 'M')<br>|
||CHK_DEAL_HEAD_PARTNR_TYPE_SUPP|(partner_type = 'S' and supplier is NOT NULL and partner_id is NULL) OR (partner_type in ('S1','S2','S3') and supplier is NULL and<br>partner_id is NOT NULL)<br>|
||CHK_DEAL_HEAD_RECALC_APPR_ORDS|recalc_approved_orders in ('Y', 'N')<br>|
||CHK_DLH_GROWTH_REBATE_IND|GROWTH_REBATE_IND IN ('Y','N')<br>|
||CHK_DLH_INCLUDE_VAT_IND|INCLUDE_VAT_IND IN ('Y','N')<br>|
||CHK_DLH_REBATE_IND|REBATE_IND IN ('Y','N')<br>|
||CHK_DLH_SECURITY_IND|SECURITY_IND IN ('Y','N')<br>|
||CHK_DLH_STOCK_LEDGER_IND|STOCK_LEDGER_IND IN ('Y','N')<br>|
||CHK_RPM_DEAL_IND|RPM_DEAL_IND in ('Y','N')|






|Type|Column / Constraint Name|Details|
|---|---|---|
||||
|Column Level|RECALC_APPROVED_ORDERS||
||REBATE_IND||
||STOCK_LEDGER_IND||
||INCLUDE_VAT_IND||
||SECURITY_IND||

---

## Table: DEAL_HEAD_CFA_EXT

**Description:** This is the custom attribute extension table for the entity DEAL_HEAD.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEAL_ID | P | F | Y | NUMERIC (10) | This column holds the Deal ID this extended data is associated with. |
| 2 | GROUP_ID | P |  | Y | NUMERIC (10) | This column holds the attribute group id that this extended data is associated with. The logical business meaning of the VARCHAR_, NUMBER_ and DATE_ columns on this table are determined by the metadata defined for this attribute. |
| 3 | VARCHAR2_1 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_1 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 4 | VARCHAR2_2 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_2 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 5 | VARCHAR2_3 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_3 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 6 | VARCHAR2_4 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_4 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 7 | VARCHAR2_5 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_5 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 8 | VARCHAR2_6 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_6 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 9 | VARCHAR2_7 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_7 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 10 | VARCHAR2_8 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_8 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 11 | VARCHAR2_9 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_9 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 12 | VARCHAR2_10 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_10 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 13 | NUMBER_11 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_11 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 14 | NUMBER_12 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_12 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 15 | NUMBER_13 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_13 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 16 | NUMBER_14 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_14 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 17 | NUMBER_15 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_15 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 18 | NUMBER_16 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_16 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 19 | NUMBER_17 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_17 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 20 | NUMBER_18 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_18 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 21 | NUMBER_19 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_19 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 22 | NUMBER_20 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_20 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 23 | DATE_21 |  |  |  | Date | This column holds data related to the attribute defined on the CFA_ATTRIB table that references DATE_21 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 24 | DATE_22 |  |  |  | Date | This column holds data related to the attribute defined on the CFA_ATTRIB table that references DATE_22 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 25 | DATE_23 |  |  |  | Date | This column holds data related to the attribute defined on the CFA_ATTRIB table that references DATE_23 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 26 | DATE_24 |  |  |  | Date | This column holds data related to the attribute defined on the CFA_ATTRIB table that references DATE_24 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 27 | DATE_25 |  |  |  | Date | This column holds data related to the attribute defined on the CFA_ATTRIB table that references DATE_25 in CFA_ATTRIB.STORAGE_COL_NAME. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_DEAL_HEAD_CFA_EXT|PK||||DEAL_ID|ASC|
||||||GROUP_ID|ASC|

---

## Table: DEAL_ITEMLOC_DCS

**Description:** This table will hold information for the deal_itemloc view at the department, class and subclass levels.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEAL_ID | P |  | Y | NUMERIC (10) | Unique deal number, generated from a sequence. |
| 2 | DEAL_DETAIL_ID | P |  | Y | NUMERIC (10) | Deal component ID number, uniquely sequenced within each deal. |
| 3 | SEQ_NO | P |  | Y | NUMERIC (10) | Sequence number that uniquely identifies each item/location line within the deal component. |
| 4 | MERCH_LEVEL |  |  | Y | VARCHAR (6) | Indicates what level of the merchandise hierarchy the record is at. |
| 5 | DIVISION |  |  |  | NUMERIC (4) | ID of the division included in or excluded from the deal component. |
| 6 | GROUP_NO |  |  |  | NUMERIC (4) | ID of the group included in or excluded from the deal component. |
| 7 | DEPT |  |  |  | NUMERIC (4) | ID of the department included in or excluded from the deal component. |
| 8 | CLASS |  |  |  | NUMERIC (4) | ID of the class included in or excluded from the deal component. |
| 9 | SUBCLASS |  |  |  | NUMERIC (4) | ID of the subclass included in or excluded from the deal component. |
| 10 | ORG_LEVEL |  |  |  | VARCHAR (6) | Indicates what level of the organizational hierarchy the record is at. Valid values include 1 for chain, 2 for area, 3 for region, 4 for district and 5 for location. These level types will be held on the codes table under a code type of DIOL. |
| 11 | CHAIN |  |  |  | NUMERIC (10) | ID of the chain included in or excluded from the deal component. |
| 12 | AREA |  |  |  | NUMERIC (10) | ID of the area included in or excluded from the deal component. |
| 13 | REGION |  |  |  | NUMERIC (10) | ID of the region included in or excluded from the deal component |
| 14 | DISTRICT |  |  |  | NUMERIC (10) | ID of the district included in or excluded from the deal component. |
| 15 | LOCATION |  |  |  | NUMERIC (10) | Any deal that is set up must ensure that the cost remains the same across all virtual warehouses. With this in mind, deals will be setup at the physical warehouse level to maintain the consistancy in cost. |
| 16 | ORIGIN_COUNTRY_ID |  |  |  | VARCHAR (3) | Origin country of the item that the deal component should apply to. |
| 17 | LOC_TYPE |  |  |  | VARCHAR (1) | Type of the location referenced in the location field. Valid values are S and W. Location types will be held on the codes table under the code type LOTP. |
| 18 | EXCL_IND |  |  | Y | VARCHAR (1) | Indicates if the deal component item/location line is included in the deal component or excluded from it. Valid values are Y for yes or N for no. |
| 19 | CREATE_DATETIME |  |  | Y | Date | Date/time stamp of when the record was created. This date/time can be used for auditing purposes. This value should only be populated on insert - it should never be updated. This field is required by the database. |
| 20 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | Holds the Oracle user-id of the user who most recently updated this record. This date/time can be used for auditing purposes. This field is required by the database. |
| 21 | LAST_UPDATE_DATETIME |  |  | Y | Date | Holds the date time stamp of the most recent update by the last_update_id. This date/time can be used for auditing purposes. This field is required by the database. |
| 22 | ACTIVE_IND |  |  | Y | VARCHAR (1) | Active_ind is an indicator that tells whether a deal is active or not. Active deals are defined as deals where the close date is less than the business date. Updated by prepost.pc weekly. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_DEAL_ITEMLOC_DCS|PK||||DEAL_ID|ASC|
||||||DEAL_DETAIL_ID|ASC|
||||||SEQ_NO|ASC|
|DEAL_ITEMLOC_DCS_I1|||||DEPT|ASC|
||||||CLASS|ASC|
||||||SUBCLASS|ASC|
|PK_DEAL_ITEMLOC_DCS|UN||||DEAL_ID|ASC|
||||||DEAL_DETAIL_ID|ASC|
||||||SEQ_NO|ASC|

---

## Table: DEAL_ITEMLOC_DIV_GRP

**Description:** This table will hold information for the deal_itemloc view at the company, division and group levels.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEAL_ID | P |  | Y | NUMERIC (10) | Unique deal number, generated from a sequence. |
| 2 | DEAL_DETAIL_ID | P |  | Y | NUMERIC (10) | Deal component ID number, uniquely sequenced within each deal. |
| 3 | SEQ_NO | P |  | Y | NUMERIC (10) | Sequence number that uniquely identifies each item/location line within the deal component. |
| 4 | MERCH_LEVEL |  |  | Y | VARCHAR (6) | Indicates what level of the merchandise hierarchy the record is at. Valid values include: 1 for company-wide (all items), 2 for division, 3 for group, 4 for dept, 5 for class, 6 for subclass, 7 for item parent, 8 for item parent/diff, 9 for item parent/diff, 10 for item parent/diff, 11 for item parent/diff, 12 for transaction level item |
| 5 | COMPANY_IND |  |  | Y | VARCHAR (1) | Indicates if the deal component is applied company-wide (e.g. all items in the system will be included in the discount or rebate). Valid values are Y for yes and N for no. |
| 6 | DIVISION |  |  |  | NUMERIC (4) | ID of the division included in or excluded from the deal component. |
| 7 | GROUP_NO |  |  |  | NUMERIC (4) | ID of the group included in or excluded from the deal component. |
| 8 | ORG_LEVEL |  |  |  | VARCHAR (6) | Indicates what level of the organizational hierarchy the record is at. Valid values include 1 for chain, 2 for area, 3 for region, 4 for district and 5 for location. These level types will be held on the codes table under a code type of DIOL. |
| 9 | CHAIN |  |  |  | NUMERIC (10) | ID of the chain included in or excluded from the deal component. |
| 10 | AREA |  |  |  | NUMERIC (10) | ID of the area included in or excluded from the deal component. |
| 11 | REGION |  |  |  | NUMERIC (10) | ID of the region included in or excluded from the deal component. |
| 12 | DISTRICT |  |  |  | NUMERIC (10) | ID of the district included in or excluded from the deal component. |
| 13 | LOCATION |  |  |  | NUMERIC (10) | Location for the item Any deal that is set up must ensure that the cost remains the same across all virtual warehouses. With this in mind, deals will be setup at the physical warehouse level to maintain the consistancy in cost. |
| 14 | ORIGIN_COUNTRY_ID |  |  |  | VARCHAR (3) | Origin country of the item that the deal component should apply to. |
| 15 | LOC_TYPE |  |  |  | VARCHAR (1) | Type of the location referenced in the location field. Valid values are S and W. Location types will be held on the codes table under the code type LOTP. |
| 16 | EXCL_IND |  |  | Y | VARCHAR (1) | Indicates if the deal component item/location line is included in the deal component or excluded from it. Valid values are Y for yes or N for no. |
| 17 | CREATE_DATETIME |  |  | Y | Date | Date/time stamp of when the record was created. This date/time can be used for auditing purposes. This value should only be populated on insert - it should never be updated. This field is required by the database. |
| 18 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | Holds the Oracle user-id of the user who most recently updated this record. This date/time can be used for auditing purposes. This field is required by the database. |
| 19 | LAST_UPDATE_DATETIME |  |  | Y | Date | Holds the date time stamp of the most recent update by the last_update_id. This date/time can be used for auditing purposes. This field is required by the database. |
| 20 | ACTIVE_IND |  |  | Y | VARCHAR (1) | Active_ind is an indicator that tells whether a deal is active or not. Active deals are defined as deals where the close date is less than the business date. Updated by prepost.pc weekly. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_DEAL_ITEMLOC_DIV_GRP|PK||||DEAL_ID|ASC|
||||||DEAL_DETAIL_ID|ASC|
||||||SEQ_NO|ASC|
|PK_DEAL_ITEMLOC_DIV_GRP|UN||||DEAL_ID|ASC|
||||||DEAL_DETAIL_ID|ASC|
||||||SEQ_NO|ASC|

---

## Table: DEAL_ITEMLOC_ITEM

**Description:** This table will hold information for the deal_itemloc view at the item level.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEAL_ID | P |  | Y | NUMERIC (10) | This contains the unique deal ID number. |
| 2 | DEAL_DETAIL_ID | P |  | Y | NUMERIC (10) | This contains the Deal component ID number, uniquely sequenced within each deal. |
| 3 | SEQ_NO | P |  | Y | NUMERIC (10) | Sequence number that uniquely identifies each item/location line within the deal component. |
| 4 | MERCH_LEVEL |  |  | Y | VARCHAR (6) | Indicates what level of the merchandise hierarchy the record is at. |
| 5 | DIVISION |  |  |  | NUMERIC (4) | ID of the division included in or excluded from the deal component. |
| 6 | GROUP_NO |  |  |  | NUMERIC (4) | ID of the group included in or excluded from the deal component. |
| 7 | DEPT |  |  |  | NUMERIC (4) | ID of the department included in or excluded from the deal component. |
| 8 | CLASS |  |  |  | NUMERIC (4) | ID of the class included in or excluded from the deal component. |
| 9 | SUBCLASS |  |  |  | NUMERIC (4) | ID of the subclass included in or excluded from the deal component. |
| 10 | ITEM |  |  |  | VARCHAR (25) | This contains the item associated to the deal. |
| 11 | ITEM_PARENT |  |  |  | VARCHAR (25) | Alphanumeric value that uniquely identifies the item/group at the level above the item. This value must exist as an item in another row on the item_master table. |
| 12 | ITEM_GRANDPARENT |  |  |  | VARCHAR (25) | Alphanumeric value that uniquely identifies the item/group two levels above the item. This value must exist as both an item and an item parent in another row on the item_master table. |
| 13 | DIFF_1 |  |  |  | VARCHAR (10) | Diff_group or diff_id that differentiates the current item from its item_parent. |
| 14 | DIFF_2 |  |  |  | VARCHAR (10) | Diff_group or diff_id that differentiates the current item from its item_parent |
| 15 | DIFF_3 |  |  |  | VARCHAR (10) | Diff_group or diff_id that differentiates the current item from its item_parent. |
| 16 | DIFF_4 |  |  |  | VARCHAR (10) | Diff_group or diff_id that differentiates the current item from its item_parent. |
| 17 | ORG_LEVEL |  |  |  | VARCHAR (6) | Indicates what level of the organizational hierarchy the record is at. Valid values include 1 for chain, 2 for area, 3 for region, 4 for district and 5 for location. These level types will be held on the codes table under a code type of DIOL. |
| 18 | CHAIN |  |  |  | NUMERIC (10) | ID of the chain included in or excluded from the deal component. |
| 19 | AREA |  |  |  | NUMERIC (10) | ID of the area included in or excluded from the deal component. |
| 20 | REGION |  |  |  | NUMERIC (10) | ID of the region included in or excluded from the deal component |
| 21 | DISTRICT |  |  |  | NUMERIC (10) | ID of the district included in or excluded from the deal component. |
| 22 | LOCATION |  |  |  | NUMERIC (10) | This contains the location associated to the deal. |
| 23 | ORIGIN_COUNTRY_ID |  |  |  | VARCHAR (3) | This contains the Origin country of the item that the deal component should apply to. |
| 24 | LOC_TYPE |  |  |  | VARCHAR (1) | This contains the location type of the location associated to the deal. |
| 25 | EXCL_IND |  |  | Y | VARCHAR (1) | Indicates if the deal component item/location line is included in the deal component or excluded from it. Valid values are Y for yes or N for no. |
| 26 | CREATE_DATETIME |  |  | Y | Date | Date/time stamp of when the record was created. This date/time can be used for auditing purposes. This value should only be populated on insert - it should never be updated. This field is required by the database |
| 27 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | Holds the Oracle user-id of the user who most recently updated this record. This date/time can be used for auditing purposes. This field is required by the database. |
| 28 | LAST_UPDATE_DATETIME |  |  | Y | Date | Holds the date time stamp of the most recent update by the last_update_id. This date/time can be used for auditing purposes. This field is required by the database. |
| 29 | ACTIVE_IND |  |  | Y | VARCHAR (1) | Active_ind is an indicator that tells whether a deal is active or not. Active deals are defined as deals where the close date is less than the business date. Updated by prepost.pc weekly. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_DEAL_ITEMLOC_ITEM|PK||||DEAL_ID|ASC|
||||||DEAL_DETAIL_ID|ASC|
||||||SEQ_NO|ASC|
|DEAL_ITEMLOC_ITEM_I1|||||ITEM|ASC|
||||||LOCATION|ASC|
|PK_DEAL_ITEMLOC_ITEM|UN||||DEAL_ID|ASC|
||||||DEAL_DETAIL_ID|ASC|
||||||SEQ_NO|ASC|
|DEAL_ITEMLOC_ITEM_I2|||||ITEM|ASC|
||||||ACTIVE_IND|ASC|

---

## Table: DEAL_ITEMLOC_PARENT_DIFF

**Description:** This table will hold information for the deal_itemloc view at the parent, parent/diff1, parent/diff2, parent/diff3 and parent/diff4.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEAL_ID | P |  | Y | NUMERIC (10) | Unique deal number, generated from a sequence. |
| 2 | DEAL_DETAIL_ID | P |  | Y | NUMERIC (10) | Deal component ID number, uniquely sequenced within each deal. |
| 3 | SEQ_NO | P |  | Y | NUMERIC (10) | Deal component ID number, uniquely sequenced within each deal. |
| 4 | MERCH_LEVEL |  |  | Y | VARCHAR (6) | Indicates what level of the merchandise hierarchy the record is at. |
| 5 | DIVISION |  |  |  | NUMERIC (4) | ID of the division included in or excluded from the deal component. |
| 6 | GROUP_NO |  |  |  | NUMERIC (4) | ID of the group included in or excluded from the deal component. |
| 7 | DEPT |  |  |  | NUMERIC (4) | ID of the department included in or excluded from the deal component. |
| 8 | CLASS |  |  |  | NUMERIC (4) | ID of the class included in or excluded from the deal component. |
| 9 | SUBCLASS |  |  |  | NUMERIC (4) | ID of the subclass included in or excluded from the deal component. |
| 10 | ITEM_PARENT |  |  |  | VARCHAR (25) | Alphanumeric value that uniquely identifies the item/group at the level above the item. This value must exist as an item in another row on the item_master table. |
| 11 | ITEM_GRANDPARENT |  |  |  | VARCHAR (25) | Alphanumeric value that uniquely identifies the item/group two levels above the item. This value must exist as both an item and an item parent in another row on the item_master table. |
| 12 | DIFF_1 |  |  |  | VARCHAR (10) | Diff_group or diff_id that differentiates the current item from its item_parent. |
| 13 | DIFF_2 |  |  |  | VARCHAR (10) | Diff_group or diff_id that differentiates the current item from its item_parent. |
| 14 | DIFF_3 |  |  |  | VARCHAR (10) | Diff_group or diff_id that differentiates the current item from its item_parent. |
| 15 | DIFF_4 |  |  |  | VARCHAR (10) | Diff_group or diff_id that differentiates the current item from its item_parent. |
| 16 | ORG_LEVEL |  |  |  | VARCHAR (6) | Indicates what level of the organizational hierarchy the record is at. Valid values include 1 for chain, 2 for area, 3 for region, 4 for district and 5 for location. These level types will be held on the codes table under a code type of DIOL. |
| 17 | CHAIN |  |  |  | NUMERIC (10) | ID of the chain included in or excluded from the deal component. |
| 18 | AREA |  |  |  | NUMERIC (10) | ID of the area included in or excluded from the deal component. |
| 19 | REGION |  |  |  | NUMERIC (10) | ID of the region included in or excluded from the deal component |
| 20 | DISTRICT |  |  |  | NUMERIC (10) | ID of the district included in or excluded from the deal component. |
| 21 | LOCATION |  |  |  | NUMERIC (10) | Any deal that is set up must ensure that the cost remains the same across all virtual warehouses. With this in mind, deals will be setup at the physical warehouse level to maintain the consistancy in cost. |
| 22 | ORIGIN_COUNTRY_ID |  |  |  | VARCHAR (3) | Origin country of the item that the deal component should apply to. |
| 23 | LOC_TYPE |  |  |  | VARCHAR (1) | Type of the location referenced in the location field. Valid values are S and W. Location types will be held on the codes table under the code type LOTP. |
| 24 | EXCL_IND |  |  | Y | VARCHAR (1) | Indicates if the deal component item/location line is included in the deal component or excluded from it. Valid values are Y for yes or N for no. |
| 25 | CREATE_DATETIME |  |  | Y | Date | Date/time stamp of when the record was created. This date/time can be used for auditing purposes. This value should only be populated on insert - it should never be updated. This field is required by the database. |
| 26 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | Holds the Oracle user-id of the user who most recently updated this record. This date/time can be used for auditing purposes. This field is required by the database. |
| 27 | LAST_UPDATE_DATETIME |  |  | Y | Date | Holds the date time stamp of the most recent update by the last_update_id. This date/time can be used for auditing purposes. This field is required by the database. |
| 28 | ACTIVE_IND |  |  | Y | VARCHAR (1) | Active_ind is an indicator that tells whether a deal is active or not. Active deals are defined as deals where the close date is less than the business date. Updated by prepost.pc weekly. |

---

## Table: DEAL_ITEMLOC_TEMP

**Description:** GLOBAL TEMPORARY TABLE ON COMMIT DELETE ROWS

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEAL_ID | P |  | Y | NUMERIC (10) | This contains the unique Deal ID number. |
| 2 | DEAL_DETAIL_ID | P |  | Y | NUMERIC (10) | This contains the Deal component ID number, uniquely sequenced within each deal. |
| 3 | ITEM | P |  | Y | VARCHAR (25) | This contains the item associated to the deal. |
| 4 | LOC_TYPE | P |  | Y | VARCHAR (1) | This contains the location type of the location associated to the deal. |
| 5 | LOCATION | P |  | Y | NUMERIC (10) | This contains the location associated to the deal. |
| 6 | ORIGIN_COUNTRY_ID |  |  |  | VARCHAR (3) | This contains the Origin country of the item that the deal component should apply to. |

---

## Table: DEAL_ITEM_LOC_EXPLODE

**Description:** This tables contains the deals applicable to an item/supplier/country/location combination. Deals defined at the Merch, Org and Supplier Hierarchy are exploded. Used by the future cost engine.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM | P |  | Y | VARCHAR (25) | Unique alphanumeric value that identifies the item. |
| 2 | SUPPLIER | P |  | Y | NUMERIC (10) | Deal suppliers number. |
| 3 | ORIGIN_COUNTRY_ID | P |  | Y | VARCHAR (3) | Origin country of the item that the deal component should apply to. |
| 4 | LOCATION | P |  | Y | NUMERIC (10) | Location for the item on the deal. |
| 5 | LOC_TYPE | P |  | Y | VARCHAR (1 ) | Type of the location referenced in the location field. Valid values are S and W. Location types will be held on the codes table under the code type LOTP. |
| 6 | DEAL_ID | P |  | Y | NUMERIC (10) | Unique deal number. |
| 7 | DEAL_DETAIL_ID | P |  | Y | NUMERIC (10) | Deal component Id number. |
| 8 | ACTIVE_DATE | P |  | Y | Date | Date the deal will become active. This date will determine when deal components begin to be factored into item costs. For a PO-specific deal, the active_date will be the orders written date. |
| 9 | CLOSE_DATE |  |  |  | Date | Date the deal will/did end. This date determines when deal components are no longer factored into item costs. It is optional for annual deals, required for promotional deals. It will be left NULL for PO-specific deals. |
| 10 | COST_APPL_IND |  |  |  | VARCHAR (6) | Indicates what cost bucket the deal component should affect. Valid values are N for net cost, NN for net net cost and DNN for dead net net cost. These values will be held on the codes tables under a code_type of DLCA. It can only be NULL for an M-type deal (vendor funded markdown). |
| 11 | PRICE_COST_APPL_IND |  |  |  | VARCHAR (1) | Identifies deal components that should be included when calculating a pricing cost. |
| 12 | DEAL_CLASS |  |  |  | VARCHAR (6) | Identifies the calculation class of the deal component. Valid values are CU for cumulative (discounts are added together and taken off as one lump sum), CS for cascade (discounts are taken one at a time with subsequent discounts taken off the result of the previous discount), and EX for exclusive (overrides all other discounts). EX type deal components are only valid for promotional deals. Deal classes will be held on the codes table under a code type of DLCL. It can only be NULL for an M-type deal (vendor funded markdown). |
| 13 | THRESHOLD_VALUE_TYPE |  |  |  | VARCHAR (6) | Identifies whether the discount values associated with the thresholds will be set up as qty values, currency amount values, percentages or fixed amounts. Valid values are Q for qty, A for currency amount, P for percentage or F for fixed amount. Qty threshold deals are only allowed on off-invoice discounts. Deal threshold value types will be held on the codes table under a code type of DLL2. It can only be NULL for an M-type |
| 14 | QTY_THRESH_BUY_ITEM |  |  |  | VARCHAR (25) | Identifies the item that must be purchased for a quantity threshold-type discount. This value is required for quantity threshold-type discounts. |
| 15 | QTY_THRESH_GET_TYPE |  |  |  | VARCHAR (6) | Identifies the type of the get discount for a quantity threshold-type (buy/get) discount. Valid values include X (free), P (percent), A (amount) and F (fixed amount). They are held on the codes table under a code type of DQGT. This value is required for quantity threshold deals. |
| 16 | QTY_THRESH_GET_VALUE |  |  |  | NUMERIC (20,4) | Identifies the value of the get discount for a quantity threshold-type (buy/get) discount that is not a free goods deal. The type of the value is identified by the get type in the qty_thresh_get_type. This value is required for quantity threshold deals that are not a get type of free. |
| 17 | QTY_THRESH_BUY_QTY |  |  |  | NUMERIC (12,4) | Identifies the quantity of the threshold buy item that must be ordered to qualify for the free item. This value is required for quantity threshold-type discounts. |
| 18 | QTY_THRESH_RECUR_IND |  |  |  | VARCHAR (1) | For buy/get free discounts, indicates if the quantity threshold discount is only for the first buy amt. purchased (e.g. for the first 10 purchased, get 1 free), or if a free item will be given for every multiple of the buy amt purchased on the order (e.g. for each 10 purchased, get 1 free). This value is required for quantity threshold-type discounts with a get type of free. Valid values are Y for yes or N for no. |
| 19 | QTY_THRESH_BUY_TARGET |  |  |  | NUMERIC (12,4) | Indicates the targeted purchase level for all locs on a purchase order. This is the target level that will be used for future calculation of net cost |
| 20 | QTY_THRESH_BUY_AVG_LOC |  |  |  | NUMERIC (12,4) | Indicates the average targeted purchase level per location on the deal. This value will be used in future cost calculations. |
| 21 | QTY_THRESH_GET_ITEM |  |  |  | VARCHAR (25) | Identifies the get item for a quantity threshold-type (buy/get) discount. This value is required for quantity threshold deals. |
| 22 | QTY_THRESH_GET_QTY |  |  |  | NUMERIC (12,4) | Identifies the quantity of the identified get item that will be given at the specified get discount if the buy amt of the buy item is purchased. This value is required for quantity threshold-type discounts. |
| 23 | QTY_THRESH_FREE_ITEM_UNIT_COST |  |  |  | NUMERIC (20,4) | For buy/get free discounts, identifies the unit cost of the threshold free item that will be used in calculating the prorated qty. discount. It will default to the item/supplier cost, but can be modified based on the agreement with the supplier. It must be greater than zero as this is the cost that would normally be charged for the goods if no deal applied. |
| 24 | SETUP_MERCH_LEVEL |  |  |  | VARCHAR (6) | Indicates what level of the merchandise hierarchy the record is at. Valid values include: 1 for company-wide (all items), 2 for division, 3 for group, 4 for dept, 5 for class, 6 for subclass, 7 for item parent, 8 for item parent/diff, 9 for item parent/diff, 10 for item parent/diff, 11 for item parent/diff, 12 for transaction level item |
| 25 | SETUP_DIVISION |  |  |  | NUMERIC (4) | ID of the division included in or excluded from the deal component. |
| 26 | SETUP_GROUP_NO |  |  |  | NUMERIC (4) | ID of the group included in or excluded from the deal component. |
| 27 | SETUP_DEPT |  |  |  | NUMERIC (4) | ID of the department included in or excluded from the deal component. |
| 28 | SETUP_CLASS |  |  |  | NUMERIC (4) | ID of the class included in or excluded from the deal component. |
| 29 | SETUP_SUBCLASS |  |  |  | NUMERIC (4) | ID of the subclass included in or excluded from the deal component. |
| 30 | SETUP_ITEM_PARENT |  |  |  | VARCHAR (25) | Alphanumeric value that uniquely identifies the item/group at the level above the item. This value must exist as an item in another row on the item_master table. |
| 31 | SETUP_ITEM_GRANDPARENT |  |  |  | VARCHAR (25) | Alphanumeric value that uniquely identifies the item/group two levels above the item. This value must exist as both an item and an item parent in another row on the item_master table. |
| 32 | SETUP_DIFF_1 |  |  |  | VARCHAR (10) | Diff_group or diff_id that differentiates the current item from its item_parent. |
| 33 | SETUP_DIFF_2 |  |  |  | VARCHAR (10) | Diff_group or diff_id that differentiates the current item from its item_parent. |
| 34 | SETUP_DIFF_3 |  |  |  | VARCHAR (10) | Diff_group or diff_id that differentiates the current item from its item_parent. |
| 35 | SETUP_DIFF_4 |  |  |  | VARCHAR (10) | Diff_group or diff_id that differentiates the current item from its item_parent. |
| 36 | SETUP_ORG_LEVEL |  |  |  | VARCHAR (6) | Indicates what level of the organizational hierarchy the record is at. Valid values include 1 for chain, 2 for area, 3 for region, 4 for district and 5 for location. These level types will be held on the codes table under a code type of DIOL. |
| 37 | SETUP_CHAIN |  |  |  | NUMERIC (10) | ID of the chain included in or excluded from the deal component. |
| 38 | SETUP_AREA |  |  |  | NUMERIC (10) | ID of the area included in or excluded from the deal component. |
| 39 | SETUP_REGION |  |  |  | NUMERIC (10) | ID of the region included in or excluded from the deal component. |
| 40 | SETUP_DISTRICT |  |  |  | NUMERIC (10) | ID of the district included in or excluded from the deal component. |
| 41 | SETUP_LOCATION |  |  |  | NUMERIC (10) | Location for the item on the deal. |
| 42 | DEAL_HEAD_TYPE |  |  |  | VARCHAR (6) | Type of the deal. Valid values are A for annual deal, P for promotional deal, O for PO-specific deal or M for vendor-funded markdown. Deal types will be held on the codes table under a code type of DLHT. |
| 43 | PARTNER_TYPE |  |  |  | VARCHAR (6) | Type of the partner the deal applies to. Valid values are S1 for supplier hierarchy level 1 (e.g. manufacturer), S2 for supplier hierarchy level 2 (e.g. distributor) and S3 for supplier hierarchy level 3 (e.g. wholesaler). Descriptions of these codes will be held on the codes table under a code_type of SUHL. |
| 44 | PARTNER_ID |  |  |  | VARCHAR (10) | Level of supplier hierarchy (e.g. manufacturer, distributor or wholesaler), up as a partner in the PARTNER table, used for assigning rebates by a level other than supplier. Rebates at this level will include all eligible supplier/item/country records assigned to this supplier hierarchy level. |
| 45 | CREATE_DATETIME |  |  |  | Date | Time and date the deal_item_loc_explode record was created. |
| 46 | DEAL_DETAIL_APPLICATION_ORDER |  |  |  | NUMERIC (10) | Number indicating the order in which the deal component should be applied with respect to any other deal components applicable to the item within the deal. This number will be unique across all deal components within the deal. It can only be NULL for an M-type deal (vendor funded markdown). |
| 47 | GET_FREE_DISCOUNT |  |  |  | NUMERIC (12,4) | Specify how much percentage of the total discount should be apportioned from the Get Items unit cost. |

---

## Table: DEAL_ITEM_LOC_EXPLODE_GTT

**Description:** this table is used during the processing of cost engine.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM | P |  | Y | VARCHAR (25) | unique alphanumeric value that identifies the item. |
| 2 | SUPPLIER | P |  | Y | NUMERIC (10) | deal suppliers number. |
| 3 | ORIGIN_COUNTRY_ID | P |  | Y | VARCHAR (3) | origin country of the item that the deal component should apply to |
| 4 | LOCATION | P |  | Y | NUMERIC (10) | location for the item on the deal. |
| 5 | LOC_TYPE |  |  |  | VARCHAR (1) | type of the location referenced in the location field. valid values are s and w. location types will be held on the codes table under the code type lotp. |
| 6 | DEAL_ID | P |  | Y | NUMERIC (10) | unique deal number. |
| 7 | DEAL_DETAIL_ID | P |  | Y | NUMERIC (10) | deal component id number. |
| 8 | ACTIVE_DATE | P |  | Y | Date | date the deal will become active. this date will determine when deal components begin to be factored into item costs. for a po-specific deal, the active_date will be the orders written date. |
| 9 | CLOSE_DATE |  |  |  | Date | date the deal will/did end. this date determines when deal components are no longer factored into item costs. it is optional for annual deals, required for promotional deals. it will be left null for po-specific deals. |
| 10 | COST_APPL_IND |  |  |  | VARCHAR (6) | indicates what cost bucket the deal component should affect. valid values are n for net cost, nn for net net cost and dnn for dead net net cost. these values will be held on the codes tables under a code_type of dlca. it can only be null for an m-type deal (vendor funded markdown). |
| 11 | PRICE_COST_APPL_IND |  |  |  | VARCHAR (1) | identifies deal components that should be included when calculating a pricing cost. |
| 12 | DEAL_CLASS |  |  |  | VARCHAR (6) | identifies the calculation class of the deal component. valid values are cu for cumulative (discounts are added together and taken off as one lump sum),cs for cascade (discounts are taken one at a time with subsequent discounts taken off the result of the previous discount) and ex for exclusive (overrides all other discounts). ex type deal components are only valid for promotional deals. deal classes will be held on the codes table under a code type of dlcl. it can only be null for an m-type deal (vendor funded markdown). |
| 13 | THRESHOLD_VALUE_TYPE |  |  |  | VARCHAR (6) | identifies whether the discount values associated with the thresholds will be set up as qty values, currency amount values, percentages or fixed amounts. valid values are q for qty, a for currency amount, p for percentage or f for fixed amount. qty threshold deals are only allowed on off-invoice discounts. deal threshold value types will be held on the |
| 14 | QTY_THRESH_BUY_ITEM |  |  |  | VARCHAR (25) | identifies the item that must be purchased for a quantity threshold-type discount. this value is required for quantity threshold-type discounts. |
| 15 | QTY_THRESH_GET_TYPE |  |  |  | VARCHAR (6) | identifies the type of the get discount for a quantity threshold-type (buy/get) discount. valid values include x (free), p (percent), a (amount) and f (fixed amount). they are held on the codes table under a code type of dqgt. this value is required for quantity threshold deals. |
| 16 | QTY_THRESH_GET_VALUE |  |  |  | NUMERIC (20,4) | identifies the value of the get discount for a quantity threshold-type (buy/get) discount that is not a free goods deal. the type of the value is identified by the get type in the qty_thresh_get_type. this value is required for quantity threshold deals that are not a get type of free. |
| 17 | QTY_THRESH_BUY_QTY |  |  |  | NUMERIC (12,4) | identifies the quantity of the threshold buy item that must be ordered to qualify for the free item. this value is required for quantity threshold-type discounts. |
| 18 | QTY_THRESH_RECUR_IND |  |  |  | VARCHAR (1) | for buy/get free discounts, indicates if the quantity threshold discount is only for the first buy amt. purchased (e.g. for the first 10 purchased, get 1 free), or if a free item will be given for every multiple of the buy amt purchased on the order (e.g. for each 10 purchased, get 1 free). this value is required for quantity threshold-type discounts with a get type of free. valid values are y for yes or n for no. |
| 19 | QTY_THRESH_BUY_TARGET |  |  |  | NUMERIC (12,4) | indicates the targeted purchase level for all locs on a purchase order. this is the target level that will be used for future calculation of net cost. |
| 20 | QTY_THRESH_BUY_AVG_LOC |  |  |  | NUMERIC (12,4) | indicates the average targeted purchase level per location on the deal. this value will be used in future cost calculations. |
| 21 | QTY_THRESH_GET_ITEM |  |  |  | VARCHAR (25) | identifies the get item for a quantity threshold-type (buy/get) discount. this value is required for quantity threshold deals. |
| 22 | QTY_THRESH_GET_QTY |  |  |  | NUMERIC (12,4) | identifies the quantity of the identified get item that will be given at the specified get discount if the buy amt of the buy item is purchased. this value is required for quantity threshold-type discounts. |
| 23 | QTY_THRESH_FREE_ITEM_UNIT_COST |  |  |  | NUMERIC (20,4) | for buy/get free discounts, identifies the unit cost of the threshold free item that will be used in calculating the prorated qty. discount. it will default to the item/supplier cost, but can be modified based on the agreement with the supplier. it must be greater than zero as this is the cost that would normally be charged for the goods if no deal applied. |
| 24 | SETUP_MERCH_LEVEL |  |  |  | VARCHAR (6) | indicates what level of the merchandise hierarchy the record is at. valid values include: 1 for company-wide (all items) 2 for division 3 for group 4 for dept 5 for class 6 for subclass 7 for item parent 8 for item parent/diff 1 9 for item parent/diff 2 10 for item parent/diff 3 11 for item parent/diff 4 12 for transaction level item |
| 25 | SETUP_DIVISION |  |  |  | NUMERIC (4) | id of the division included in or excluded from the deal component. |
| 26 | SETUP_GROUP_NO |  |  |  | NUMERIC (4) | id of the group included in or excluded from the deal component. |
| 27 | SETUP_DEPT |  |  |  | NUMERIC (4) | id of the department included in or excluded from the deal component. |
| 28 | SETUP_CLASS |  |  |  | NUMERIC (4) | id of the class included in or excluded from the deal component. |
| 29 | SETUP_SUBCLASS |  |  |  | NUMERIC (4) | id of the subclass included in or excluded from the deal component. |
| 30 | SETUP_ITEM_PARENT |  |  |  | VARCHAR (25) | alphanumeric value that uniquely identifies the item/group at the level above the item. this value must exist as an item in another row on the item_master table. |
| 31 | SETUP_ITEM_GRANDPARENT |  |  |  | VARCHAR (25) | alphanumeric value that uniquely identifies the item/group two levels above the item. this value must exist as both an item and an item parent in another row on the item_master table. |
| 32 | SETUP_DIFF_1 |  |  |  | VARCHAR (10) | diff_group or diff_id that differentiates the current item from its item_parent. |
| 33 | SETUP_DIFF_2 |  |  |  | VARCHAR (10) | diff_group or diff_id that differentiates the current item from its item_parent. |
| 34 | SETUP_DIFF_3 |  |  |  | VARCHAR (10) | diff_group or diff_id that differentiates the current item from its item_parent. |
| 35 | SETUP_DIFF_4 |  |  |  | VARCHAR (10) | diff_group or diff_id that differentiates the current item from its item_parent |
| 36 | SETUP_ORG_LEVEL |  |  |  | VARCHAR (6) | indicates what level of the organizational hierarchy the record is at. valid values include 1 for chain, 2 for area, 3 for region, 4 for district and 5 for location. these level types will be held on the codes table under a code type of diol. |
| 37 | SETUP_CHAIN |  |  |  | NUMERIC (10) | id of the chain included in or excluded from the deal component. |
| 38 | SETUP_AREA |  |  |  | NUMERIC (10) | id of the area included in or excluded from the deal component. |
| 39 | SETUP_REGION |  |  |  | NUMERIC (10) | id of the region included in or excluded from the deal component. |
| 40 | SETUP_DISTRICT |  |  |  | NUMERIC (10) | id of the district included in or excluded from the deal component. |
| 41 | SETUP_LOCATION |  |  |  | NUMERIC (10) | location for the item on the deal. |
| 42 | DEAL_HEAD_TYPE |  |  |  | VARCHAR (6) | type of the deal. valid values are a for annual deal, p for promotional deal, o for po-specific deal or m for vendor-funded markdown. deal types will be held on the codes table under a code type of dlht. |
| 43 | PARTNER_TYPE |  |  |  | VARCHAR (6) | type of the partner the deal applies to. valid values are s1 for supplier hierarchy level 1 (e.g. manufacturer), s2 for supplier hierarchy level 2 (e.g. distributor) and s3 for supplier hierarchy level 3 (e.g. wholesaler). descriptions of these codes will be held on the codes table under a code_type of suhl. |
| 44 | PARTNER_ID |  |  |  | VARCHAR (10) | level of supplier hierarchy (e.g. manufacturer, distributor or wholesaler), up as a partner in the partner table, used for assigning rebates by a level other than supplier. rebates at this level will include all eligible supplier/item/country records assigned to this supplier hierarchy level. |
| 45 | CREATE_DATETIME |  |  |  | Date | time and date the deal_item_loc_explode record was created. |
| 46 | DEAL_DETAIL_APPLICATION_ORDER |  |  |  | NUMERIC (10) | number indicating the order in which the deal component should be applied with respect to any other deal components applicable to the item within the deal. this number will be unique across all deal components within the deal. it can only be null for an m-type deal (vendor funded markdown). |
| 47 | RETAIN_IND |  |  |  | VARCHAR (1) | indicates if the records should be deleted as it is no longer applicable to the item/supplier/country/location. valid values are y or null. |
| 48 | EXCL_IND | P |  | Y | VARCHAR (1) | excluded from deal indicator. |
| 49 | GET_FREE_DISCOUNT |  |  |  | NUMERIC (12,4) | specify how much percentage of the total discount should be apportioned from the get items unit cost. |

---

## Table: DEAL_PASSTHRU

**Description:** This table holds deal pass-through percentages at the dept/supplier/warehouse/location level. Deal passthru is supported only for franchise stores and is not applicable to company stores.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEPT | P |  | Y | NUMERIC (4) | This field contains the department for which the deal passthru is defined. |
| 2 | SUPPLIER | P |  | Y | NUMERIC (10) | This field contains the Supplier ID of the supplier applicable to the deal passthru. |
| 3 | COSTING_LOC | P |  | Y | NUMERIC (10) | This field contains the location for the franchise store that is used for franchise costing. |
| 4 | LOCATION | P |  | Y | NUMERIC (10) | This field contains the location id of franchise stores applicable to the deal passthru. |
| 5 | LOC_TYPE |  |  | Y | VARCHAR (1) | This field contains the type of location. This will always be S - store. |
| 6 | PASSTHRU_PCT |  |  | Y | NUMERIC (12,4) | This field contains the percentage of the suppliers off-invoice deals that will be passed to the franchise store. |

---

## Table: DEAL_PERF_DATA_TEMP

**Description:** The table hold all the tran data postings for tran code of 20 in the current day. The data will be merged into DEAL_PERF_TRAN_DATA during the nightly batch run.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  |  |  | VARCHAR (25) | Unique identifier for the item. |
| 2 | DEPT |  |  | Y | NUMERIC (4) | Department number associated with the SKU. |
| 3 | CLASS |  |  | Y | NUMERIC (4) | Class number associated with the SKU. |
| 4 | SUBCLASS |  |  | Y | NUMERIC (4) | Subclass number associated with the SKU. |
| 5 | PACK_IND |  |  |  | VARCHAR (1) | Indicates whether or not the item is a pack item. |
| 6 | LOC_TYPE |  |  | Y | VARCHAR (1) | This field contains the Location Type. |
| 7 | LOCATION |  |  | Y | NUMERIC (10) | This field contains the Store if the LOC_TYPE = S. |
| 8 | TRAN_DATE |  |  | Y | Date | Identifies the date the transaction was written. |
| 9 | TRAN_CODE |  |  | Y | NUMERIC (4) | Identifies the transaction type. |
| 10 | ADJ_CODE |  |  |  | VARCHAR (1) | This field indicates the type of adjustment for which this record is written to correct a previous error. |
| 11 | UNITS |  |  | Y | NUMERIC (12,4) | The number of units involved in the transaction. |
| 12 | TOTAL_COST |  |  |  | NUMERIC (20,4) | Contains the total cost associated with the transaction. This field is stored in the local currency. |
| 13 | TOTAL_RETAIL |  |  |  | NUMERIC (20,4) | Contains the retail value of the transaction. This field is stored in the local currency. |
| 14 | REF_NO1 |  |  |  | NUMERIC (12) | Reference number for the transaction. |
| 15 | REF_NO2 |  |  |  | NUMERIC (10) | Reference number for the transaction. |
| 16 | GL_REF_NO |  |  |  | VARCHAR (25) | This field contains the reference number associated with a transaction. It is used for defining the General Ledger account relationship along with dept, class, subclass, location, and tran_code, etc. For example: if tran_code is 22 or 23, then this field contains an Inventory Adjustment Reason Code; if tran_code is 37 or 38, then this field contains From_loc or To_loc for the Intercompany Transfer; if tran_code is 63 or 64, then this field contains Work Order Activity ID; if tran_code is 87 or 88, then this field contains the VAT code associated with the transaction. |
| 17 | OLD_UNIT_RETAIL |  |  |  | NUMERIC (20,4) | Contains the old unit retail before the change for transaction types 11 to 16. Otherwise this field will be empty. This field is stored in the local |
| 18 | NEW_UNIT_RETAIL |  |  |  | NUMERIC (20,4) | Contains the newunit retail before the change for transaction types 11 to 16. Otherwise this field will be empty. This field is stored in the local currency. |
| 19 | PGM_NAME |  |  | Y | VARCHAR (100) | Identifies the Oracle Retail module where the record was written |
| 20 | SALES_TYPE |  |  |  | VARCHAR (1) | This field will contain the type of sale for SKU. |
| 21 | VAT_RATE |  |  |  | NUMERIC (12,4) | This field will contain the VAT rate at the selling store. |
| 22 | AV_COST |  |  |  | NUMERIC (20,4) | This field will contain the VAT rate at the selling store. |
| 23 | REF_PACK_NO |  |  |  | VARCHAR (25) | Used to store pack for a transaction items. |

---

## Table: DEAL_PERF_TRAN_DATA

**Description:** This table holds the deal related transaction data that are generated throughout on-line day as well as from batch processes. Each night, specific deal related transactions on tran_data will be copied to this table in order for deal batch processes to update the Deal performance tables. DEAL_PERF_TRAN_DATA is then truncated. DEAL_PERF_TRAN_DATA can not be viewed on-line until it is added to DEAL_ACTUALS_FORECAST and DEAL_ACTUALS_ITEM_LOC which can then be viewed on-line.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  |  |  | VARCHAR (25) | Unique identifier for the item. |
| 2 | DEPT |  |  | Y | NUMERIC (4) | Deartment number associated with the SKU. |
| 3 | CLASS |  |  | Y | NUMERIC (4) | Class number associated with the SKU. |
| 4 | SUBCLASS |  |  | Y | NUMERIC (4) | Subclass number associated with the SKU. |
| 5 | PACK_IND |  |  |  | VARCHAR (1) | Indicates whether or not the item is a pack item. |
| 6 | LOC_TYPE |  |  | Y | VARCHAR (1) | This field contains the Location Type. |
| 7 | LOCATION |  |  | Y | NUMERIC (10) | This field contains the Store if the LOC_TYPE = S. |
| 8 | TRAN_DATE |  |  | Y | Date | Identifies the date the transaction was written. |
| 9 | TRAN_CODE |  |  | Y | NUMERIC (4) | Identifies the transaction type. |
| 10 | ADJ_CODE |  |  |  | VARCHAR (1) | This field indicates the type of adjustment for which this record is written to correct a previous error. |
| 11 | UNITS |  |  | Y | NUMERIC (12,4) | The number of units involved in the transaction. |
| 12 | TOTAL_COST |  |  |  | NUMERIC (20,4) | Contains the total cost associated with the transaction. This field is stored in the local currency. |
| 13 | TOTAL_RETAIL |  |  |  | NUMERIC (20,4) | Contains the retail value of the transaction. This field is stored in the local currency. |
| 14 | REF_NO1 |  |  |  | NUMERIC (12) | Reference number for the transaction. |
| 15 | REF_NO2 |  |  |  | NUMERIC (10) | Reference number associated with the transaction. |
| 16 | GL_REF_NO |  |  |  | VARCHAR (25) | This field contains the reference number associated with a transaction. It is used for defining the General Ledger account relationship along with dept, class, subclass, location, and tran_code, etc. For example: if tran_code is 22 or 23, then this field contains an Inventory Adjustment Reason Code; if tran_code is 37 or 38, then this field contains From_loc or To_loc for the Intercompany Transfer; if tran_code is 63 or 64, then this field contains Work Order Activity ID; if tran_code is 87 or 88, then this field contains the VAT code associated with the transaction. |
| 17 | OLD_UNIT_RETAIL |  |  |  | NUMERIC (20,4) | Contains the old unit retail before the change for transaction types 11 to 16. Otherwise this field will be empty. This field is stored in the local currency. |
| 18 | NEW_UNIT_RETAIL |  |  |  | NUMERIC (20,4) | Contains the newunit retail before the change for transaction types 11 to 16. Otherwise this field will be empty. This field is stored in the local currency. |
| 19 | PGM_NAME |  |  | Y | VARCHAR (100) | Identifies the Oracle Retail module where the record was written |
| 20 | SALES_TYPE |  |  |  | VARCHAR (1) | This field will contain the type of sale for SKU. |
| 21 | VAT_RATE |  |  |  | NUMERIC (12,4) | This field will contain the VAT rate at the selling store. |
| 22 | AV_COST |  |  |  | NUMERIC (20,4) | This field will contain the VAT rate at the selling store. |
| 23 | REF_PACK_NO |  |  |  | VARCHAR (25) | Used to store pack for a transaction items. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|DEAL_PERF_TRAN_DATA_I1|||||ITEM|ASC|
||||||LOCATION|ASC|

---

## Table: DEAL_PROM

**Description:** This table will hold all promotions attached to a complex/fixed deal.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEAL_PROM_ID | P |  | Y | NUMERIC (10) | Contains a unique Id and is the primary key of this table and will be generated by an oracle sequence. |
| 2 | DEAL_ID |  |  | Y | NUMERIC (10) | Contains the unique deal code number. |
| 3 | PROMOTION |  |  | Y | NUMERIC (10) | This contains the number which uniquely identifies a promotion. |
| 4 | PROM_COMP |  |  |  | NUMERIC (10) | Promotion Component Column |
| 5 | PROMOTION_DESC |  |  |  | VARCHAR (160) | This contains the description of the promotion. |

---

## Table: DEAL_QUEUE

**Description:** This table will hold all deals that have been approved, unapproved or closed during the day. This list will be used to drive the process rebuilding the DEAL_SKU_COST and ORDSKU_DISCOUNT tables.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEAL_ID | P | F | Y | NUMERIC (10) | ID of the deal that was approved, unapproved or closed. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_DEAL_QUEUE|PK||||DEAL_ID|ASC|

---

## Table: DEAL_SUPPLIER_TEMP

**Description:** This table temporarily holds deal items that exist on deal_sku_temp for a specific supplier.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  |  | Y | VARCHAR (25) | Unique alphanumeric value that identifies the item. |
| 2 | SIMPLE_PACK_IND |  |  | Y | VARCHAR (1) | Indicates if pack item is a simple pack or not. This field will only be available if the item is a pack item. A simple pack is an item whose |
| 3 | SUPPLIER |  |  | Y | NUMERIC (10) | Supplier of the item for which the costs need to be recalculated. |
| 4 | SUPP_HIER_LVL_1 |  |  |  | VARCHAR (10) | Highest level of supplier hierarchy (e.g. manufacturer). This will be used for assigning rebates that come from a level in the supply chain that is higher than the supplier. |
| 5 | SUPP_HIER_LVL_2 |  |  |  | VARCHAR (10) | Second highest level of supplier hierarchy. Rebates at the level will include all eligible supplier/item/country/loc records assigned to this supplier hierarchy level. |
| 6 | SUPP_HIER_LVL_3 |  |  |  | VARCHAR (10) | Third highest level of supplier hierarchy, used for assigning rebates by a level other than supplier. Rebates at this level will include all eligible supplier/item/country/loc records assigned to this supplier hierarchy level. |
| 7 | ORIGIN_COUNTRY_ID |  |  | Y | VARCHAR (3) | Origin country of the item that needs its cost recalculated. |
| 8 | START_DATE |  |  | Y | Date | This column is used when we later find what deals are active on this particular date |
| 9 | CURRENCY_CODE |  |  | Y | VARCHAR (3) | Contains a code identifying the currency the supplier uses for business transactions. |
| 10 | UNIT_COST |  |  | Y | NUMERIC (20,4) | The current unit cost of the item for the item/supplier/origin_country combination. This field is stored in the suppliers currency. |
| 11 | DIVISION |  |  | Y | NUMERIC (4) | ID of the items division |
| 12 | GROUP_NO |  |  | Y | NUMERIC (4) | ID of the items group. |
| 13 | DEPT |  |  | Y | NUMERIC (4) | ID of the items department |
| 14 | CLASS |  |  | Y | NUMERIC (4) | ID of the item s class |
| 15 | SUBCLASS |  |  | Y | NUMERIC (4) | ID of the items subclass |
| 16 | ITEM_PARENT |  |  |  | VARCHAR (25) | Alphanumeric value that uniquely identifies the item/group at the level above the item. This value must exist as an item in another row on the item_master table. |
| 17 | ITEM_GRANDPARENT |  |  |  | VARCHAR (25) | Aplhanumeric value that uniquely identifies the item/group two levels above the item. This value must exist both as an item and an item parent in another row on the item_master table. |
| 18 | DIFF_1 |  |  |  | VARCHAR (10) | Diff_group of diff_id that differentiates the current item from its item_parent. |
| 19 | DIFF_2 |  |  |  | VARCHAR (10) | Diff_group of diff_id that differentiates the current item from its item_parent. |
| 20 | DIFF_3 |  |  |  | VARCHAR (10) | Diff_group of diff_id that differentiates the current item from its item_parent. |
| 21 | DIFF_4 |  |  |  | VARCHAR (10) | Diff_group of diff_id that differentiates the current item from its item_parent. |
| 22 | CHAIN |  |  |  | NUMERIC (10) | For location-specific deals, the ID of the locations chain. |
| 23 | AREA |  |  |  | NUMERIC (10) | For location-specific deals, the ID of the locations area. |
| 24 | REGION |  |  |  | NUMERIC (10) | For location-specific deals, the ID of the locations region. |
| 25 | DISTRICT |  |  |  | NUMERIC (10) | For location-specific deals, the ID of the locations district. |
| 26 | LOCATION |  |  |  | NUMERIC (10) | Location for the sku. Any deal that is set up must ensure that the cost remains the same across all virtual warehouses. With this in mind, deals will be set up at the physical warehouse level to maintain the consistency in cost. |
| 27 | PHYSICAL_WH |  |  |  | NUMERIC (10) | Location for the sku. Any deal that is set up must ensure that the cost remains the same across all virtual warehouses. With this in mind, deals will be set up at the physical warehouse level to maintain the consistency in cost. |
| 28 | LOC_TYPE |  |  |  | VARCHAR (1) | Type of location referenced in the location field. Valid values are S and W. Location types will be held on the codes table under the code type LOTP. |

---

## Table: DEAL_THRESHOLD

**Description:** This table will hold threshold values giving the discount/rebate amount for the deal component based on quantities or currency amounts purchased or sold.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEAL_ID | P | F | Y | NUMERIC (10) | Unique deal number, generated from a sequence. |
| 2 | DEAL_DETAIL_ID | P | F | Y | NUMERIC (10) | Deal component ID number, uniquely sequenced within each deal. |
| 3 | LOWER_LIMIT | P |  | Y | NUMERIC (20,4) | Lower limit of the deal component. This is the minimum value that must be met in order to get the specified discount. This value will be either a currency amount or quantity value, depending on the value in the deal_detail.threshold_limit_type field of this deal component. |
| 4 | UPPER_LIMIT | P |  | Y | NUMERIC (20,4) | Upper limit of the deal component. This is the maximum value for which the specified discount will apply. This value will be either a currency amount or quantity value, depending on the value in the deal_detail.threshold_limit_type field of this deal component. |
| 5 | VALUE |  |  | Y | NUMERIC (20,4) | Value of the discount that will be given for meeting the specified thresholds for this deal component. This value will be either a currency amount or quantity value, depending on the value in the deal_detail.threshold_value_type field of this deal component. |
| 6 | TARGET_LEVEL_IND |  |  | Y | VARCHAR (1) | Indicates if a threshold level is the targeted purchase or sales level for a deal component. This indicator will be used for cost calculations. Valid values are Y for yes and N for no. |
| 7 | CREATE_DATETIME |  |  | Y | Date | Date/time stamp of when the record was created. This date/time can be used for auditing purposes. This value should only be populated on insert - it should never be updated. This field is required by the database. |
| 8 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | Holds the Oracle user-id of the user who most recently updated this |
| 9 | LAST_UPDATE_DATETIME |  |  | Y | Date | Holds the date time stamp of the most recent update by the last_update_id. This date/time can be used for auditing purposes. This field is required by the database. |
| 10 | TOTAL_IND |  |  |  | VARCHAR (1) | Indicates if the value for deal components for which the threshold type is amount off is amount off by unit or in total. Valid values are Y (by total) for yes and N for no (by unit). |
| 11 | REASON |  |  |  | VARCHAR (250) | This holds the reason for changing / adding / deleting a threshold for an approved complex deal. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_DEAL_THRESHOLD|PK||||DEAL_ID|ASC|
||||||DEAL_DETAIL_ID|ASC|
||||||LOWER_LIMIT|ASC|
||||||UPPER_LIMIT|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_DEAL_THRESHOLD_TARGET_LVL|target_level_ind in ('Y','N')<br>|
||CHK_DLT_TOTAL_IND|TOTAL_IND IN ('Y','N')|
|Column Level|TARGET_LEVEL_IND||
||TOTAL_IND||

---

## Table: DEAL_THRESHOLD_REV

**Description:** This table will be used to hold the deal threshold revisions.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEAL_ID | P | F | Y | NUMERIC (10) | Contains the unique deal number. |
| 2 | DEAL_DETAIL_ID | P | F | Y | NUMERIC (10) | Contains the deal component ID number, uniquely sequenced with each deal. |
| 3 | LOWER_LIMIT | P |  | Y | NUMERIC (20,4) | Contains the Lower limit of the deal component. This is the minimum value that must be met in order to get the specified discount. This value will be either a currency amount or quantity value, depending on the value in the deal_detail.threshold_limit_type field of this deal component. |
| 4 | UPPER_LIMIT | P |  | Y | NUMERIC (20,4) | Contains the upper limit of the deal component. This is the maximum value that must be met in order to get the specified discount. This value will be either a currency amount or quantity value, depending on the value in the deal_detail.threshold_limit_type field of this deal component. |
| 5 | REV_NO | P |  | Y | NUMERIC (6) | Contains the revision number. |
| 6 | VALUE |  |  | Y | NUMERIC (20,4) | Value of the discount that will be given for meeting the specified thresholds for this deal component. This value will be either a currency amount or quantity value, depending on the value in the deal_detail.threshold_value_type field of this deal component. It will signify the total value if the total_ind = Y or the unit value if the total_ind = N |
| 7 | TARGET_LEVEL_IND |  |  | Y | VARCHAR (1) | Indicates if a threshold level is the targeted purchase or sales level for a deal component. This indicator will be used for cost calculations. Valid |
| 8 | TOTAL_IND |  |  |  | VARCHAR (1) | ndicates if the value for deal components for which the threshold type is amount off is amount off by unit or in total. Valid values are Y (by total) for yes and N for no (by unit). |
| 9 | ACTION |  |  | Y | VARCHAR (6) | Identifies whether thresholds have been updated/added/deleted for an approved complex deal. Valid values are I for insert, U for update and D for deletion. Threshold change types will be held on the codes table under the new code type of DLAT. |
| 10 | REASON |  |  |  | VARCHAR (250) | This holds the reason for changing / adding / deleting a threshold for an approved complex deal. |
| 11 | REVISION_DATE |  |  | Y | Date | Contains the date revision was made |
| 12 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | User id of the user who last updated the entry. |
| 13 | LAST_UPDATE_DATETIME |  |  | Y | Date | Time stamp when the record was last updated. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_DEAL_THRESHOLD_REV|PK||||DEAL_ID|ASC|
||||||DEAL_DETAIL_ID|ASC|
||||||LOWER_LIMIT|ASC|
||||||UPPER_LIMIT|ASC|
||||||REV_NO|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_DTR_ACTION|ACTION IN ('U','D','I')|






|Type|Column / Constraint Name|Details|
|---|---|---|
||||
||CHK_DTR_TARGET_LEVEL_IND|TARGET_LEVEL_IND IN ('Y','N')<br>|
||CHK_DTR_TOTAL_IND|TOTAL_IND IN ('Y','N')<br>|
|Column Level|TARGET_LEVEL_IND||
||TOTAL_IND||
||ACTION||

---

## Table: DEAL_TRAN_DATA_TEMP

**Description:** This is a temporary table used by prepost.pc and dealact.pc.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEAL_ID |  |  | Y | NUMERIC (10) | unique deal number, generated from a sequence |
| 2 | DEAL_DETAIL_ID |  |  | Y | NUMERIC (10) | deal component ID number, uniquely sequenced within each deal |
| 3 | ITEM |  |  | Y | VARCHAR (25) | Alphanumeric value that uniquely identifies the item. |
| 4 | LOC_TYPE |  |  | Y | VARCHAR (1) | Type of location referenced in the location field. |
| 5 | LOCATION |  |  | Y | NUMERIC (10) | Location for the item. |
| 6 | DAI_ID |  |  |  | NUMERIC (20) | Contains the unique ID referenced from the deal_actuals_item_loc table. |
| 7 | TRAN_CODE |  |  | Y | NUMERIC (4) | Identifies the transaction type. |
| 8 | REPORTING_DATE |  |  | Y | Date | This is the date for the reporting period for the deal. |
| 9 | VAT_RATE |  |  | Y | NUMERIC (12,4) | This field contains the vat rate for the selling store. |
| 10 | UNITS |  |  | Y | NUMERIC (12,4) | The number of units involved in the transaction. |
| 11 | TOTAL_REVENUE |  |  | Y | NUMERIC (20,4) | This field containes the total revenue. |
| 12 | BILL_TO_LOC |  |  |  | NUMERIC (10) | This contains the Import ID of the order associated to the deal if it is an import order. Otherwise, this will be the deal location. |
| 13 | BILL_TO_LOC_TYPE |  |  |  | VARCHAR (1) | This contains the Import Type of the order associated to the deal if it is an import order. Otherwise, this will be the deal location type. |

---

## Table: FIXED_DEAL

**Description:** This table will hold the basic fixed deal information to include the amount of money that will be collected from the specified supplier and when to collect that money from the vendor.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEAL_NO | P |  | Y | NUMERIC (10) | Contains the unique fixed deal code number. |
| 2 | SUPPLIER |  | F |  | NUMERIC (10) | Contains the unique number representing the supplier. |
| 3 | DEAL_DESC |  |  | Y | VARCHAR (250) | Contains the description of the fixed deal. |
| 4 | TYPE |  |  | Y | VARCHAR (6) | Type of the fixed deal. Valid values for this field are defined in the code type FXDT. |
| 5 | FIXED_DEAL_AMT |  |  | Y | NUMERIC (20,4) | Represents the amount of the fixed deal to be collected from the supplier. This value is in Primary currency. |
| 6 | STATUS |  |  | Y | VARCHAR (1) | Indicates the status of the fixed deal claim. Valid values are: I - Inactive, A - Active. |
| 7 | COLLECT_BY |  |  | Y | VARCHAR (1) | Indicates how the fixed deal will be collected from the Supplier. Valid values are: D - Date. M - Monthly, Q - Quarterly, A - Annually |
| 8 | COLLECT_START_DATE |  |  | Y | Date | Represents the start date that the Fixed Deal can be claimed from the Supplier. For a collect by of D, this column value would represent the date the collection should be made. For all others it represents the date that the collection period begins. |
| 9 | COLLECT_END_DATE |  |  | Y | Date | Represents the date that the Fixed Deal collection period ends. |
| 10 | COLLECT_PERIODS |  |  | Y | NUMERIC (2) | Indicates the number of collection periods to collect from the vendor. Either the number of months, quarters, or years to collect. |
| 11 | PROMOTION |  |  |  | NUMERIC (10) | Indicates a promotion number if the fixed deal is a part of a promotion. |
| 12 | COMMENTS |  |  |  | VARCHAR (2000) | Contains any comments associated the fixed deal. |
| 13 | EXT_REF_NO |  |  |  | VARCHAR (30) | Any given external reference number associated with the deal. |
| 14 | MERCH_IND |  |  | Y | VARCHAR (1) | Indicates if organisational and merchandise contribution percentages will be captured. Valid values are Y for yes or N for no. |
| 15 | PARTNER_TYPE |  | F | Y | VARCHAR (6) | Type of the partner the deal applies to. Valid values are S1 for supplier hierarchy level 1 (e.g. manufacturer), S2 for supplier hierarchy level 2 (e.g. distributor) and S3 for supplier hierarchy level 3 (e.g. wholesaler). |
| 16 | PARTNER_ID |  | F | Y | VARCHAR (10) | Level of supplier hierarchy (e.g. manufacturer, distributor or wholesaler), set up as a partner in the PARTNER table, used for assigning rebates by a level other than supplier. Rebates at this level will include all eligible supplier/item/country records assigned to this supplier hierarchy level. |
| 17 | VAT_IND |  |  | Y | VARCHAR (1) | Indicates if VAT rate is to be entered for the deal. Valid values are Y for yes or N for no. |
| 18 | INVOICE_PROCESSING_LOGIC |  |  |  | VARCHAR (6) | This will determine if the credit notes or debit notes created should be created manually or require manual intervention and also if negative amounts should be included. Valid values are AA for Automatic All values, MA for Manual All Values, AP Automatic Positive values only, MA Manual Positive values only, NO - no invoice processing - these will be held on the codes table under a new code type of DLIP. |
| 19 | DEB_CRED_IND |  |  |  | VARCHAR (6) | This will determine the bill back method. It will be required for bill back deals only. Valid values are Credit note or Debit note - these will be held on the codes table under a new code type of DLBM. |
| 20 | NON_MERCH_CODE |  | F |  | VARCHAR (6) | This is the non merch code for the fixed deal. It is the code for all non-merchandise lines used within invoice matching. |
| 21 | VAT_RATE |  |  |  | NUMERIC (20,10) | This is the VAT RATE captured at the time of entry of the VAT type and VAT code for the fixed deal. This is required if the VAT_IND =Y |
| 22 | VAT_CODE |  |  |  | VARCHAR (6) | This is the VAT CODE. This is required if the VAT_IND =Y. |
| 23 | USER_ID |  |  | Y | VARCHAR (30) | This contains the unique identifier for the user. |
| 24 | ORG_UNIT_ID |  |  |  | NUMERIC (15) | Org Unit Id |
| 25 | CURRENCY_CODE |  |  | Y | VARCHAR (3) | This column will contain the currency code of the deal. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_FIXED_DEAL|PK||||DEAL_NO|ASC|
|FIXED_DEAL_I2|||||PROMOTION|ASC|
|FIXED_DEAL_I3|||||NON_MERCH_CODE|ASC|
|FIXED_DEAL_I1|||||SUPPLIER|ASC|
|FIXED_DEAL_I4|||||PARTNER_TYPE|ASC|
||||||PARTNER_ID|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_FDL_MERCH_IND|MERCH_IND IN ('Y','N')<br>|
||CHK_FDL_VAT_IND|VAT_IND IN ('Y','N')<br>|
||CHK_FIXED_DEAL_COLLECT_BY|collect_by in ('D','M','Q','A')<br>|
||CHK_FIXED_DEAL_STATUS|status in ('I','A')<br>|
|Column Level|STATUS||
||COLLECT_BY||
||MERCH_IND||
||VAT_IND||

---

## Table: FIXED_DEAL_DATES

**Description:** This table will hold a column for each date of the fixed deal that the amount should be collected from the supplier/partner.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEAL_NO | P | F | Y | NUMERIC (10) | Contains the unique fixed deal code number. |
| 2 | COLLECT_DATE | P |  | Y | Date | Contains each date that the Fixed Deal should be claimed from the Suppplier. For a collect by of D, there would be only one column containing the single collect date. For all other collect by methods there will be a column for each collection period after the start date. |
| 3 | FIXED_DEAL_AMT |  |  | Y | NUMERIC (20,4) | Represents the amount of the fixed deal to be collected from the Supplier. |
| 4 | EXTRACTED_IND |  |  | Y | VARCHAR (1) | This column will indicate whether the fixed deal invoice information has been extracted for a the given date in specified on the fixed_deal_dates table collect_date column. The default value of extracted_ind will be is N and after extraction it will be updated to Y. If the fixed deal is set to inactive, this column will be set to I to avoid duplicate billings. |
| 5 | CURRENCY_CODE |  |  | Y | VARCHAR (3) | This column will contain the currency code of the deal. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_FIXED_DEAL_DATES|PK||||DEAL_NO|ASC|
||||||COLLECT_DATE|ASC|

### Constraints

|Type|Column / Constraint<br>Name|Details|
|---|---|---|
|Table Level|CHK_FDD_EXTRACTED_IND|extracted_ind in ('Y','N','I')<br>|
|Column Level|EXTRACTED_IND||

---

## Table: FIXED_DEAL_GL_REF_DATA

**Description:** This table contains the fixed deal related reference data.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEAL_NO |  |  | Y | NUMERIC (10) | This field will hold the deal_no of the fixed deal record stored in the FIXED_DEAL table. |
| 2 | FIXED_DEAL_AMT |  |  | Y | NUMERIC (20,4) | This field will hold the amount of the fixed deal record. |
| 3 | COLLECT_DATE |  |  | Y | Date | This field will hold the particular collection day information. |
| 4 | DEPT |  |  | Y | NUMERIC (4) | This field will hold the dept number. |
| 5 | CLASS |  |  |  | NUMERIC (4) | This field will hold the class number. |
| 6 | SUBCLASS |  |  |  | NUMERIC (4) | This field will hold the subclass number. |
| 7 | LOC_TYPE |  |  |  | VARCHAR (1) | This field will hold the type of the location (either store or warehouse). |
| 8 | LOCATION |  |  |  | NUMERIC (10) | This field will hold the location number (store/wh). |
| 9 | CONTRIB_RATIO |  |  |  | VARCHAR (6) | Contribution Ratio |
| 10 | CONTRIB_AMOUNT |  |  | Y | NUMERIC (20,4) | Contribution Amount |
| 11 | SET_OF_BOOKS_ID |  |  |  | NUMERIC (15) | This field will hold the MSOB ID linked to the deal data record. |
| 12 | REFERENCE_TRACE_ID |  |  | Y | VARCHAR (32) | This field will hold the Reference trace ID. This is used for drill back and traceability purposes. |

---

## Table: FIXED_DEAL_MERCH

**Description:** This table holds the merchandise levels attached to the fixed deals to be used in stock ledger processing.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEAL_NO | P | F | Y | NUMERIC (10) | Contains the unique fixed deal code number. |
| 2 | SEQ_NO | P |  | Y | NUMERIC (10) | Sequence number that uniquely identifies each merchandise location line within the deal. |
| 3 | MERCH_LEVEL |  |  | Y | VARCHAR (6) | Indicates what level of the merchandise hierarchy the record is at. Valid values include: Department, Class and Subclass. |
| 4 | DEPT |  | F | Y | NUMERIC (4) | Number identifying the department. Valid values for this field are located on the deps table. |
| 5 | CLASS |  |  |  | NUMERIC (4) | Number identifying the class. Valid values for this field are located on the class table. |
| 6 | SUBCLASS |  |  |  | NUMERIC (4) | Number identifying the subclass. Valid values for this field are located on the subclass table. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_FIXED_DEAL_MERCH|PK||||DEAL_NO|ASC|
||||||SEQ_NO|ASC|
|FIXED_DEAL_MERCH_I1|||||DEPT|ASC|

---

## Table: FIXED_DEAL_MERCH_LOC

**Description:** This table holds the merchandise location contribution percentage for fixed deals to be used in stock ledger processing. Multiple organisational records exist here for each fixed deal merch record.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEAL_NO | P | F | Y | NUMERIC (10) | Contains the unique fixed deal code number. |
| 2 | SEQ_NO | P | F | Y | NUMERIC (10) | Sequence number that uniquely identifies each merchandise location line within the deal. |
| 3 | LOC_TYPE | P |  | Y | VARCHAR (6) | Indicates if the location is a Store or a Warehouse. |
| 4 | LOCATION | P |  | Y | NUMERIC (10) | Number of the location in which the item is to be found. This field may contain a store or a warehouse. |
| 5 | CONTRIB_RATIO |  |  | Y | NUMERIC (12,4) | The contribution ratio assigned to the merchandise level. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_FIXED_DEAL_MERCH_LOC|PK||||DEAL_NO|ASC|
||||||SEQ_NO|ASC|
||||||LOC_TYPE|ASC|
||||||LOCATION|ASC|
