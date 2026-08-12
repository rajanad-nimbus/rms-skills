# RMS Sales Audit POS Transactions Datamodel - Physical Data Model Reference

## Table: POS_CONFIG_ITEMS

**Description:** This table holds any new or reclassified items that now fit into a merchandise criteria definition or deleted or reclassified items that did meet a merchandise criteria definition, but no longer do.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | POS_CONFIG_TYPE | P |  | Y | VARCHAR (4) | This attribute indicates the type of configuration, either coupons or product restrictions. |
| 2 | POS_CONFIG_ID | P |  | Y | NUMERIC (6) | Contains the number that uniquely identifies the configuration. |
| 3 | ITEM | P |  | Y | VARCHAR (25) | Contains the item identifier. |
| 4 | STATUS | P |  | Y | VARCHAR (1) | Indicates changes related to the addition or deletion of an item to a merchandise criteria definition. |
| 5 | STORE | P | F | Y | NUMERIC (10) | Identifies store where item has been added/deleted or had a retail price change. If a store is not entered, use -1. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_POS_CONFIG_ITEMS|PK||||POS_CONFIG_TYPE|ASC|
||||||POS_CONFIG_ID|ASC|
||||||ITEM|ASC|
||||||STATUS|ASC|
||||||STORE|ASC|
|POS_CONFIG_ITEMS_I2|||||STORE|ASC|
|POS_CONFIG_ITEMS_I1|||||ITEM|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_POS_CONFIG_ITEMS_P_CFG_TYP|POS_CONFIG_TYPE IN ('COUP', 'PRES')<br>|
||CHK_POS_CONFIG_ITEMS_STATUS|STATUS IN ('A', 'D')<br>|
|Column Level|POS_CONFIG_TYPE||






|Type|Column / Constraint Name|Details|
|---|---|---|
||STATUS||

---

## Table: POS_COUPON_HEAD

**Description:** This table holds the detailed coupon information such as accounting classifications (profit center, tax class), and start and end dates for the coupon.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | COUPON_ID | P |  | Y | NUMERIC (6) | Contains the number that uniquely identifies the coupon. |
| 2 | COUPON_DESC |  |  | Y | VARCHAR (250) | Contains the description of the coupon associated with the coupon number. |
| 3 | COUPON_SEQ_NO |  |  | Y | NUMERIC (8) | Contains the sequence number of the coupon. |
| 4 | PROFIT_CENTER |  |  |  | VARCHAR (6) | Contains information to export data to a back office accounting system. |
| 5 | TAX_CLASS |  |  | Y | VARCHAR (6) | Contains the tax class for the coupon. |
| 6 | EFFECTIVE_DATE |  |  | Y | Date | Indicates the first day the coupon can be used. |
| 7 | EXPIRATION_DATE |  |  | Y | Date | Indicates the day the coupon becomes invalid. |
| 8 | EXPORT_CODE |  |  |  | VARCHAR (6) | Contains a specific code to export data to a back office accounting system. |
| 9 | CURRENCY_CODE |  | F | Y | VARCHAR (3) | Contains the currency that is associated with the Coupon. |
| 10 | MAX_DISCOUNT_AMT |  |  | Y | NUMERIC (20,4) | Contains the Maximum Discount value that can be gained from the coupon. |
| 11 | COUPON_AMT |  |  | Y | NUMERIC (20,4) | Contains the percent or dollar value of the coupon. |
| 12 | PERCENT_IND |  |  | Y | VARCHAR (1) | Specifies whether the coupon amount is a percent or a dollar value. |
| 13 | DISPLAY_IND |  |  | Y | VARCHAR (1) | This indicator specifies whether the coupon is displayed in the list of valid coupons on the register. |
| 14 | PROMPTED_IND |  |  | Y | VARCHAR (1) | This indicator identifies if the cashier should be prompted to ask for a coupon. |
| 15 | CREATE_ID |  |  | Y | VARCHAR (30) | Contains the user identification of the user who created the coupon. |
| 16 | CREATE_DATE |  |  | Y | Date | Contains the date the coupon was created. |
| 17 | MODIFY_ID |  |  |  | VARCHAR (30) | Contains the user identification of the user who last modified the coupon. |
| 18 | MODIFY_DATE |  |  |  | Date | Contains the date the coupon was last modified. |
| 19 | EXTRACT_REQ_IND |  |  | Y | VARCHAR (1) | Indicates whether configuration data must be sent to the POS due to modifications of the coupon configuration, store, merchandise criteria, or item. |
| 20 | POS_CONFIG_STATUS |  |  |  | VARCHAR (1) | Indicates the status of the coupon configuration. |
| 21 | MERCH_CRIT_CHG_IND |  |  | Y | VARCHAR (1) | Indicates whether the merchandise criteria that are used to determine what items are associated with the coupon configuration have changed. |
| 22 | VENDOR_TYPE |  |  |  | VARCHAR (6) | Holds the partner type including the supplier type to identify which suppliers/partners are available for selection. Valid values are: AG - Agent AP - Applicant BK - Bank BR - Broker CN - Coonsignee CO - Consolidator FA - Factory FF - Freight Forwarder IM - Importer SU - Supplier |
| 23 | VENDOR |  |  |  | VARCHAR (10) | Holds the supplier or partner for which the coupon is related to. The user will be only able to select active suppliers or partners |
| 24 | PROMOTION |  |  |  | NUMERIC (10) | Holds the promotion ID. Any open promotion can be selected to be associated with coupons (i.e. status of the promotion is not in completed, cancelled or deleted). |
| 25 | BARCODE_TYPE |  |  |  | VARCHAR (1) | Holds the type of barcode for which the coupon is related to. This will be used to control the type of entry into the coupon_barcode field. Valid values: E - EAN13 F - Free Text |
| 26 | COUPON_BARCODE |  |  |  | VARCHAR (20) | Holds the coupon barcode - only an EAN13 or free text can be entered. |
| 27 | COUPON_MAX_QTY |  |  |  | NUMERIC (6) | Holds the maximum number of coupons the customer can use to buy one product. |
| 28 | PROMOTION_COMPONENT_ID |  |  |  | NUMERIC (20) | Promotion Component ID field required for RPM. Will be required if a promotion has been selected. |
| 29 | SUPPLIER |  | F |  | NUMERIC (10) | Supplier number |
| 30 | TRAN_LVL_IND |  |  | Y | VARCHAR (1) | Indicates if this is a transaction level coupon. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_POS_COUPON_HEAD|PK||||COUPON_ID|ASC|
|UK_POS_COUPON_HEAD|UK||||COUPON_SEQ_NO|ASC|
|POS_COUPON_HEAD_I2|||||SUPPLIER|ASC|
|POS_COUPON_HEAD_I1|||||CURRENCY_CODE|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_POS_COUPON_HEAD_BARCODE_TY|BARCODE_TYPE in ('E','F')<br>|
||CHK_POS_COUPON_HEAD_DISPLY_IND|DISPLAY_IND IN ('Y', 'N')<br>|
||CHK_POS_COUPON_HEAD_EXTR_REQ|EXTRACT_REQ_IND IN ('Y', 'N')<br>|
||CHK_POS_COUPON_HEAD_MERCH_CRIT|merch_crit_chg_ind in ('Y','N')<br>|
||CHK_POS_COUPON_HEAD_PCT_IND|PERCENT_IND IN ('Y', 'N')<br>|






|Type|Column / Constraint Name|Details|
|---|---|---|
||CHK_POS_COUPON_HEAD_POS_CFG_ST|POS_CONFIG_STATUS IN ('A', 'C', 'D')<br>|
||CHK_POS_COUPON_HEAD_PRMPTD_IND|PROMPTED_IND IN ('Y', 'N')<br>|
||CHK_POS_TRAN_LVL_IND|TRAN_LVL_IND IN ('Y', 'N')<br>|
|Column Level|PERCENT_IND||
||DISPLAY_IND||
||PROMPTED_IND||
||EXTRACT_REQ_IND||
||POS_CONFIG_STATUS||
||MERCH_CRIT_CHG_IND||
||BARCODE_TYPE||
||TRAN_LVL_IND||

---

## Table: POS_COUPON_HEAD_TL

**Description:** This is the translation table for POS_COUPON_HEAD table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG |  | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | COUPON_ID |  | F | Y | NUMERIC (6) | Contains the number that uniquely identifies the coupon. |
| 3 | COUPON_DESC |  |  | Y | VARCHAR (250) | Contains the description of the coupon associated with the coupon number. |
| 4 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 6 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 7 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_POS_COUPON_HEAD_TL|UK||||LANG|ASC|
||||||COUPON_ID|ASC|

---

## Table: POS_DAY_TIME_DATE

**Description:** This table holds the day, time and date information that is associated to a Day/Time/Date product restriction.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | POS_PROD_REST_ID | P | F | Y | NUMERIC (6) | Contains the number that uniquely identifies the product restriction. |
| 2 | SEQ_NO | P |  | Y | NUMERIC (4) | Contains the sequence number associated to the Day/Time/Date POS_PROD_REST_ID. |
| 3 | DAY |  |  |  | VARCHAR (6) | Contains the day of the week of the product restriction is valid. Valid values where day = DAYS include: 1 - Sunday 2 - Monday 3 - Tuesday 4 - Wednesday 5 - Thursday 6 - Friday 7 - Saturday |
| 4 | BEFORE_TIME |  |  |  | VARCHAR (6) | Contains the time of day that the product restriction is lifted. For example, alcoholic beverages may not be sold before 10:00am. Valid values where before_time = TIME include: 1 - 1:00 2 - 2:00 3 - 3:00 4 - 4:00 5 - 5:00 6 - 6:00 7 - 7:00 8 - 8:00 9 - 9:00 10 - 10:00 11 - 11:00 12 - 12:00 13 - 13:00 14 - 14:00 15 - 15:00 16 - 16:00 17 - 17:00 18 - 18:00 19 - 19:00 20 - 20:00 21 - 21:00 22 - 22:00 23 - 23:00 24 - 24:00 |
| 5 | AFTER_TIME |  |  |  | VARCHAR (6) | Contains the time of the day that the product restriction is activated. For example, alcoholic beverages may not be able to be sold after 11:59pm. Valid values where before_time = TIME include: 1 - 1:00 2 - 2:00 3 - 3:00 4 - 4:00 5 - 5:00 6 - 6:00 7 - 7:00 8 - 8:00 9 - 9:00 10 - 10:00 11 - 11:00 12 - 12:00 13 - 13:00 14 - 14:00 15 - 15:00 16 - 16:00 17 - 17:00 18 - 18:00 19 - 19:00 20 - 20:00 21 - 21:00 22 - 22:00 23 - 23:00 24 - 24:00 |
| 6 | POS_RESTRICT_DATE |  |  |  | Date | Contains a date on which a specified product restriction is applied. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_POS_DAY_TIME_DATE|PK||||POS_PROD_REST_ID|ASC|
||||||SEQ_NO|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_POS_DAY_TIME_DATE_AFTER_TM|AFTER_TIME in ('1', '2','3', '4', '5','6', '7','8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24')|






|Type|Column / Constraint Name|Details|
|---|---|---|
||CHK_POS_DAY_TIME_DATE_BEFR_TM|BEFORE_TIME in ('1', '2','3', '4', '5','6', '7','8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24')<br>|
||CHK_POS_DAY_TIME_DATE_DAY|day in ('1', '2','3', '4', '5','6', '7')<br>|
|Column Level|DAY||
||BEFORE_TIME||
||AFTER_TIME||

---

## Table: POS_MERCH_CRITERIA

**Description:** This table holds the merchandise criteria used to select items that are associated with the coupons and product restrictions.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | POS_CONFIG_TYPE | P |  | Y | VARCHAR (6) | This attribute indicates the type of configuration, either coupons or product restrictions. |
| 2 | POS_CONFIG_ID | P |  | Y | NUMERIC (6) | Contains the number that uniquely identifies the configuration. |
| 3 | SEQ_NO | P |  | Y | NUMERIC | The sequence number identifies the unique configuration/location/group/criteria combination. |
| 4 | STATUS |  |  |  | VARCHAR (1) | Indicates if the merchandise criteria for item selection has been added/changed/deleted |
| 5 | GROUP_NO |  | F | Y | NUMERIC (4) | Contains the number of the group in which the SKU is located. |
| 6 | DEPT |  | F |  | NUMERIC (4) | Contains the number of the department in which the SKU is located. |
| 7 | CLASS |  | F |  | NUMERIC (4) | Contains the number of the class in which the SKU is located. |
| 8 | SUBCLASS |  | F |  | NUMERIC (4) | Contains the number of the subclass in which the SKU is located. |
| 9 | ITEM |  | F |  | VARCHAR (25) | Contains the number that uniquely identifies the Stock Keep Unit. |
| 10 | EXCLUDE_IND |  |  | Y | VARCHAR (1) | Indicates whether the SKU should be excluded from the POS configuration. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_POS_MERCH_CRITERIA|PK||||POS_CONFIG_TYPE|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
||||||POS_CONFIG_ID|ASC|
||||||SEQ_NO|ASC|
|POS_MERCH_CRITERIA_I2|||||ITEM|ASC|
|POS_MERCH_CRITERIA_I3|||||GROUP_NO|ASC|
|POS_MERCH_CRITERIA_I1|||||DEPT|ASC|
||||||CLASS|ASC|
||||||SUBCLASS|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_POS_MERCH_CRITERIA_EXCLUDE|exclude_ind in ('Y', 'N')<br>|
||CHK_POS_MERCH_CRITERIA_P_CFGTY|POS_CONFIG_TYPE IN ('COUP', 'PRES')<br>|
||CHK_POS_MERCH_CRITERIA_STATUS|STATUS IN ('A','D')<br>|
|Column Level|POS_CONFIG_TYPE||
||STATUS||
||EXCLUDE_IND||

---

## Table: POS_MODS_TAX_INFO

**Description:** This table will hold the Tax details of items when the default tax type of the system is GTAX.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  |  | Y | VARCHAR (25) | This field holds the item number |
| 2 | STORE |  |  | Y | VARCHAR (10) | This field holds the store number |
| 3 | TAX_TYPE |  |  | Y | VARCHAR (1) | This field holds the tax types - 'R' for retail and 'C' for cost |
| 4 | EFFECTIVE_FROM |  |  | Y | Date | Date the tax on this table becomes effective. |
| 5 | TAX_CODE |  |  | Y | VARCHAR (10) | Tax code returned by the external tax engine. |
| 6 | CALCULATION_BASIS |  |  |  | VARCHAR (1) | This field will specify whether the Tax Rate value is a percent or a flat value. For flat value this will have 'S' and for percent it will hold 'V'. |
| 7 | TAX_RATE |  |  |  | NUMERIC (20,10) | Rate or the Specific value returned by the external engine. |
| 8 | ESTIMATED_TAX_VALUE |  |  |  | NUMERIC (20,4) | Estimated value of the tax. For a specific type of tax code this will be equal to the tax rate. |
| 9 | CREATE_DATETIME |  |  |  | Date | Date and time when tax details were created. |
| 10 | CREATE_ID |  |  |  | VARCHAR (30) | User id created the tax details. |
| 11 | CST_CODE |  |  |  | VARCHAR (3) | This column denotes CST code for a particular tax code. |
| 12 | NCM_CODE |  |  |  | VARCHAR (25) | This column denotes NCM code of the item. |

---

## Table: POS_PROD_REST_HEAD

**Description:** pos_prod_rest_head - This table holds the product restriction details for all types of product restrictions. The product restriction types include:? food stamp? minimum age? container deposit? container redemption value? date restriction? time restriction? day restriction? tender type? non-discountable? returnable? quantity limit

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | POS_PROD_REST_ID | P |  | Y | NUMERIC (6) | Contains the number which uniquely identifies the product restriction. |
| 2 | POS_PROD_REST_DESC |  |  | Y | VARCHAR (120) | Contains the description of the product restriction. |
| 3 | POS_PROD_REST_TYPE |  |  | Y | VARCHAR (6) | Contains the type of product restriction. Valid values where code_type = PPRT include: STMP - Food Stamp MNAG - Minimum Age CNDP Container Deposit CNVL - Container Redemption Value DTDR - Day/Time/Date Restriction TENT - Tender Type NDSC - Non-Discountable RTRN - Returnable QLMT - Quantity Limit |
| 4 | EFFECTIVE_DATE |  |  | Y | Date | Contains the date the product restriction is first effective. |
| 5 | AGE_MIN |  |  |  | NUMERIC (2) | Contains the minimum age of the customer that can purchase a specific item. |
| 6 | MAX_QTY |  |  |  | NUMERIC (12,4) | Contains the maximum quantity of items that can be purchased. |
| 7 | TENDER_TYPE_GROUP |  |  |  | VARCHAR (6) | Contains the tender type group. Valid values where code_type = TENT include: CASH - Cash, CHECK - Check, CCARD - Credit, COUPON - Coupon, LOTTRY - Lottery, FSTAMP - Food Stamp, DCARD - Debit Card, MORDER - Money Order VOUCH - Voucher ERR - Error, SOCASS - Social Assistance, TERM - Termination Record, DRIVEO - Drive Off, EBS - Electronic Benefits ( Food Stamps) |
| 8 | CURRENCY_CODE |  | F |  | VARCHAR (3) | Contains the currency that is associated with the Product Restriction. |
| 9 | PROD_REST_AMT |  |  |  | NUMERIC (20,4) | Contains either the container deposit amount or the container redemption amount for a product restriction depending on the product restriction type selected. |
| 10 | CREATE_ID |  |  | Y | VARCHAR (30) | Contains the user identification of the user who created the product restriction. |
| 11 | CREATE_DATE |  |  | Y | Date | Contains the date the product restriction was created. |
| 12 | MODIFY_ID |  |  |  | VARCHAR (30) | Contains the user identification of the user who last modified the product restriction. |
| 13 | MODIFY_DATE |  |  |  | Date | Contains the date the product restriction was last modified. |
| 14 | MERCH_CRIT_CHG_IND |  |  | Y | VARCHAR (1) | Indicates whether the merchandise criteria that are used to determine what items are associated with the product restriction configuration have changed. |
| 15 | EXTRACT_REQ_IND |  |  | Y | VARCHAR (1) | Indicates whether configuration data must be sent to the POS due to modifications of the product restriction configuration, store, merchandise criteria, or item. |
| 16 | POS_CONFIG_STATUS |  |  |  | VARCHAR (1) | Indicates the status of the product restriction configuration. |
| 17 | EXTRACTED_IND |  |  |  | VARCHAR (1) | Indicates whether the POS Restriction has been extracted to POS or not. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_POS_PROD_REST_HEAD|PK||||POS_PROD_REST_ID|ASC|
|POS_PROD_REST_HEAD_I1|||||CURRENCY_CODE|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_POS_PROD_REST_H_EXTR_REQ|EXTRACT_REQ_IND IN ('Y', 'N')<br>|
||CHK_POS_PROD_REST_H_MERCH_CRIT|merch_crit_chg_ind in ('Y', 'N')<br>|
||CHK_POS_PROD_REST_H_POS_CFG_ST|POS_CONFIG_STATUS IN ('A', 'C', 'D')<br>|
||CHK_POS_PROD_REST_H_PP_REST_TY|((TENDER_TYPE_GROUP IS NOT NULL AND POS_PROD_REST_TYPE = 'TENT') OR (MAX_QTY IS NOT NULL AND<br>POS_PROD_REST_TYPE = 'QLMT') OR (AGE_MIN IS NOT NULL AND POS_PROD_REST_TYPE = 'MNAG') OR ((PROD_REST_AMT IS NOT<br>NULL AND POS_PROD_REST_TYPE IN ('CNDP', 'CNVL')) AND (CURRENCY_CODE IS NOT NULL AND POS_PROD_REST_TYPE IN ('CNDP',<br>'CNVL'))) OR (POS_PROD_REST_TYPE IN ('STMP','NDSC','RTRN','DTDR')))<br>|
||CHK_POS_PROD_REST_H_TNDR_TYPE|TENDER_TYPE_GROUP IN ('CASH','CHECK','CCARD', 'COUPON', 'DCARD', 'ERR','TERM','VOUCH','MORDER','DRIVEO','SOCASS')<br>|
||CHK_POS_PROD_REST_H_TNDR_TYPEv1|TENDER_TYPE_GROUP IN ('CASH','CHECK','CCARD', 'COUPON', 'DCARD', 'ERR','TERM','VOUCH','MORDER','DRIVEO','SOCASS', 'PAYPAL',<br>'FONCOT')<br>|
|Column Level|TENDER_TYPE_GROUP||
||MERCH_CRIT_CHG_IND||
||EXTRACT_REQ_IND||
||POS_CONFIG_STATUS||

---

## Table: POS_STORE

**Description:** This table holds the specific stores associated with a POS configuration. In addition, the status of the information for that store will be traced, so that if any of the configurations for that store have changed, the information pertaining to that change can be downloaded to the store.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | POS_CONFIG_TYPE | P |  | Y | VARCHAR (6) | This attribute indicates the type of configuration. |
| 2 | POS_CONFIG_ID | P |  | Y | NUMERIC (6) | Contains the number that uniquely identifies the configuration. |
| 3 | STORE | P | F | Y | NUMERIC (10) | Contains the store associated with the POS configuration. |
| 4 | STATUS |  |  |  | VARCHAR (1) | Indicates changes related to the addition or deletion of a configuration for the store. Valid values are A and D . |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_POS_STORE|PK||||POS_CONFIG_TYPE|ASC|
||||||POS_CONFIG_ID|ASC|
||||||STORE|ASC|
|POS_STORE_I1|||||STORE|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_POS_STORE_STATUS|STATUS IN ('A', 'D', 'C')<br>|
||CHK_POS_STORE_POS_CONFIG_TYPE|POS_CONFIG_TYPE IN ('COUP', 'PRES')<br>|
|Column Level|POS_CONFIG_TYPE||
||STATUS||

---

## Table: POS_TENDER_TYPE_HEAD

**Description:** This table holds the tender type details for all tender payment types. Tender type groups are high-level classifications for the tender types. For example, a tender type group of credit card will have different tender types for each type of credit card (Visa, Master Card, Discover, etc.). Tender type details include values such as whether the register drawer must be opened, whether exact change is required and whether the cashier should ask for an invoice at time of payment.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TENDER_TYPE_ID | P |  | Y | NUMERIC (6) | Contains the code which uniquely identifies the tender type. |
| 2 | TENDER_TYPE_DESC |  |  | Y | VARCHAR (120) | Contains the description of the tender type. |
| 3 | TENDER_TYPE_GROUP |  |  | Y | VARCHAR (6) | Contains the tender type classification. Valid values where code_type = TENT include: CASH - Cash, CHECK - Check, CCARD - Credit, COUPON - Coupon, LOTTRY - Lottery, FSTAMP - Food Stamp, DCARD - Debit Card, VOUCH - Voucher, MORDER - Money Order, ERR - Error, SOCASS - Social Assistance, TERM - Termination Record, DRIVEO - Drive Off, EBS - Electronic Benefits (Food Stamps) |
| 4 | EFFECTIVE_DATE |  |  | Y | Date | Contains the date the tender type is first effective. |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | Contains the date the tender type was created. |
| 6 | CREATE_DATE |  |  | Y | Date | Contains the user identification of the user who created the tender type. |
| 7 | MODIFY_ID |  |  |  | VARCHAR (30) | Contains the date the tender type was last modified. |
| 8 | MODIFY_DATE |  |  |  | Date | Contains the user identification of the user who last modified the tender type. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_POS_TENDER_TYPE_HEAD|PK||||TENDER_TYPE_ID|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_POS_TEND_TY_HD_TEND_TY_GRP|TENDER_TYPE_GROUP IN ('CASH', 'CHECK', 'CCARD', 'COUPON', 'LOTTRY', 'FSTAMP', 'DCARD', 'VOUCH', 'MORDER', 'ERR', 'SOCASS',<br>'TERM', 'EBS', 'DRIVEO','FONCOT', 'PAYPAL', 'OTHERS')<br>|
|Column Level|TENDER_TYPE_GROUP||

---

## Table: POS_TENDER_TYPE_HEAD_TL

**Description:** This is the translation table for POS_TENDER_TYPE_HEAD table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | TENDER_TYPE_ID | P | F | Y | NUMERIC (6) | This field contains the code which uniquely identifies the tender type. |
| 3 | TENDER_TYPE_DESC |  |  | Y | VARCHAR (120) | This field contains the description of the tender type. |
| 4 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 6 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 7 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_POS_TENDER_TYPE_HEAD_TL|PK||||LANG|ASC|
||||||TENDER_TYPE_ID|ASC|

---

## Table: SA_CUSTOMER

**Description:** This is a new table that contains customer details.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | STORE | P | F | Y | NUMERIC (10) | Store number to be used for table partitioning. |
| 2 | DAY | P | F | Y | NUMERIC (3) | Day number to be used for table partitioning. This is derived from the sa_store_day.business_date column by calling the function SA_DATE_HASH. |
| 3 | TRAN_SEQ_NO | P | F | Y | NUMERIC (20) | This field holds the unique transaction number the customer is associated with. |
| 4 | CUST_ID |  |  | Y | VARCHAR (16) | The unique identifier for a customer. |
| 5 | CUST_ID_TYPE |  |  | Y | VARCHAR (6) | The type of value used in the cust_no field, such as credit card number, telephone number, bank card number, etc. Valid values stored in the codes table. |
| 6 | NAME |  |  |  | VARCHAR (120) | Customers name. |
| 7 | ADDR1 |  |  |  | VARCHAR (240) | Customers address. |
| 8 | ADDR2 |  |  |  | VARCHAR (240) | Second line of the customers address, if needed. |
| 9 | CITY |  |  |  | VARCHAR (120) | City customer resides in. |
| 10 | STATE |  |  |  | VARCHAR (3) | State customer resides in. |
| 11 | POSTAL_CODE |  |  |  | VARCHAR (30) | Zip Code of customer. |
| 12 | COUNTRY |  |  |  | VARCHAR (3) | Country. |
| 13 | HOME_PHONE |  |  |  | VARCHAR (20) | Telephone number at home. |
| 14 | WORK_PHONE |  |  |  | VARCHAR (20) | Telephone number at work. |
| 15 | E_MAIL |  |  |  | VARCHAR (100) | E-mail address. |
| 16 | BIRTHDATE |  |  |  | Date | Date of birth. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SA_CUSTOMER|PK||||TRAN_SEQ_NO|ASC|
||||||STORE|ASC|
||||||DAY|ASC|
|PK_SA_CUSTOMER|UN||||TRAN_SEQ_NO|ASC|
||||||STORE|ASC|
||||||DAY|ASC|

---

## Table: SA_CUST_ATTRIB

**Description:** This table contains user-defined attributes of a given customer.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | STORE | P | F | Y | NUMERIC (10) | Store number to be used for table partitioning. |
| 2 | DAY | P | F | Y | NUMERIC (3) | Store number to be used for table partitioning. |
| 3 | TRAN_SEQ_NO | P | F | Y | NUMERIC (20) | Contains a unique system generated identifier of the customer. |
| 4 | ATTRIB_SEQ_NO | P |  | Y | NUMERIC (4) | Identifies the sequence of customer attribute records within a transaction. |
| 5 | ATTRIB_TYPE | P |  | Y | VARCHAR (6) | Contains the type of customer attribute. |
| 6 | ATTRIB_VALUE |  |  | Y | VARCHAR (120) | Contains the value of the customer attribute. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SA_CUST_ATTRIB|PK||||TRAN_SEQ_NO|ASC|
||||||ATTRIB_SEQ_NO|ASC|
||||||ATTRIB_TYPE|ASC|
||||||STORE|ASC|
||||||DAY|ASC|
|SA_CUST_ATTRIB_I1|||||TRAN_SEQ_NO|ASC|
||||||STORE|ASC|
||||||DAY|ASC|
|PK_SA_CUST_ATTRIB|UN||||TRAN_SEQ_NO|ASC|
||||||ATTRIB_SEQ_NO|ASC|
||||||ATTRIB_TYPE|ASC|
||||||STORE|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
||||||DAY|ASC|

### Constraints

|Type|Column /<br>Constraint Name|Details|
|---|---|---|
|Column Level|ATTRIB_SEQ_NO||

---

## Table: SA_TRAN_DISC

**Description:** This table contains all taxes associated with a transaction.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | STORE | P | F | Y | NUMERIC (10) | Store number to be used for table partitioning. |
| 2 | DAY | P | F | Y | NUMERIC (3) | Day number to be used for table partitioning. This is derived from the sa_store_day.business_date column by calling the function SA_DATE_HASH. |
| 3 | TRAN_SEQ_NO | P | F | Y | NUMERIC (20) | The sales audit systems transaction identifier. Foreign key for SA_TRAN_HEAD. |
| 4 | ITEM_SEQ_NO | P | F | Y | NUMERIC (4) | Sequence number of items within a transaction. |
| 5 | DISCOUNT_SEQ_NO | P |  | Y | NUMERIC (4) | Sequence number of discounts for an item within a transaction. |
| 6 | RMS_PROMO_TYPE | P |  | Y | VARCHAR (6 BYTE) | Type of discount given to the customer for these item(s). Valid values stored on the codes table. *** |
| 7 | PROMOTION |  |  |  | NUMERIC (10) | This field contains the number of the promotion which defines the discount. |
| 8 | DISC_TYPE |  |  |  | VARCHAR (6 BYTE) | Type of discount, for example an RMS promo, a coupon, etc. |
| 9 | COUPON_NO |  |  |  | VARCHAR (40 BYTE) | Coupon number for a store coupon. |
| 10 | COUPON_REF_NO |  |  |  | VARCHAR (16 BYTE) | Holds any additional reference numbers associated with a coupon. Examples of these reference numbers might be advertising source codes, publication codes, etc. |
| 11 | QTY |  |  |  | NUMERIC (12,4) | The number of these items purchased at this discount price. |
| 12 | UNIT_DISCOUNT_AMT |  |  |  | NUMERIC (20,4) | Discount per unit of the item. Held in the local currency. |
| 13 | STANDARD_QTY |  |  |  | NUMERIC (12,4) | Contains the units of this item discounted as if the item were discounted in the standard unit of measure. |
| 14 | STANDARD_UNIT_DISC_AMT |  |  |  | NUMERIC (20,4) | Contains the unit discount amount of the item as if the item were discounted in the standard unit of measure. |
| 15 | REF_NO13 |  |  |  | VARCHAR (30 BYTE) | This field contains any additional information about the discount that the retailer chooses to store. |
| 16 | REF_NO14 |  |  |  | VARCHAR (30 BYTE) | This field contains any additional information about the discount that the retailer chooses to store. |
| 17 | REF_NO15 |  |  |  | VARCHAR (30 BYTE) | This field contains any additional information about the discount that the retailer chooses to store. |
| 18 | REF_NO16 |  |  |  | VARCHAR (30 BYTE) | This field contains any additional information about the discount that the retailer chooses to store. |
| 19 | ERROR_IND |  |  | Y | VARCHAR (1 BYTE) | This column is used to determine if functional errors exist for this record. |
| 20 | UOM_QUANTITY |  |  | Y | NUMERIC (12,4) | Contains the weight of the item sold. If the item doesnt have a weight then this column will contain the quantity sold. |
| 21 | CATCHWEIGHT_IND |  |  |  | VARCHAR (1 BYTE) | Indicates that the value in UOM_QUANTITY is a catchweight and not a quantity. |
| 22 | PROMO_COMP |  |  |  | NUMERIC (10) | Contains the promotion component type or ID. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SA_TRAN_DISC|PK||||TRAN_SEQ_NO|ASC|
||||||ITEM_SEQ_NO|ASC|
||||||DISCOUNT_SEQ_NO|ASC|
||||||RMS_PROMO_TYPE|ASC|
||||||STORE|ASC|
||||||DAY|ASC|
|PK_SA_TRAN_DISC|UN||||TRAN_SEQ_NO|ASC|
||||||ITEM_SEQ_NO|ASC|
||||||DISCOUNT_SEQ_NO|ASC|
||||||RMS_PROMO_TYPE|ASC|
||||||STORE|ASC|
||||||DAY|ASC|






|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|SA_TRAN_DISC_I2|||||TRAN_SEQ_NO|ASC|
||||||ITEM_SEQ_NO|ASC|
||||||STORE|ASC|
||||||DAY|ASC|
|SA_TRAN_DISC_I1|||||PROMOTION|ASC|
|SA_TRAN_DISC_I3|||||ERROR_IND|ASC|

---

## Table: SA_TRAN_DISC_REV

**Description:** This table contains all revisions to discount values associated with an item.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | STORE | P | F | Y | NUMERIC (10) | Store number to be used for table partitioning. |
| 2 | DAY | P | F | Y | NUMERIC (3) | Day number to be used for table partitioning. This is derived from the sa_store_day.business_date column by calling the function SA_DATE_HASH. |
| 3 | TRAN_SEQ_NO | P | F | Y | NUMERIC (20) | The sales audit systems transaction identifier. Foreign key for SA_TRAN_HEAD. |
| 4 | ITEM_SEQ_NO | P | F | Y | NUMERIC (4) | Sequence number of items within a transaction. |
| 5 | DISCOUNT_SEQ_NO | P |  | Y | NUMERIC (4) | Sequence number of discounts for an item within a transaction. |
| 6 | RMS_PROMO_TYPE | P |  | Y | VARCHAR (6 BYTE) | Type of discount given to the customer for these item(s). Valid values stored on the codes table. |
| 7 | PROMOTION |  |  |  | NUMERIC (10) | This field contains the number of the promotion which defines the discount. |
| 8 | DISC_TYPE |  |  |  | VARCHAR (6 BYTE) | Type of discount, for example an RMS promo, a coupon, etc. |
| 9 | COUPON_NO |  |  |  | VARCHAR (40 BYTE) | Coupon number for a store coupon. |
| 10 | COUPON_REF_NO |  |  |  | VARCHAR (16 BYTE) | Holds any additional reference numbers associated with a coupon. Examples of these reference numbers might be advertising source codes, publication codes, etc. |
| 11 | REV_NO | P | F | Y | NUMERIC (3) | This is an incremental counter unique to each version of a transaction stored on the database. |
| 12 | QTY |  |  |  | NUMERIC (12,4) | The number of these items purchased at this discount price. |
| 13 | UNIT_DISCOUNT_AMT |  |  |  | NUMERIC (20,4) | Discount per unit of the item. Held in the local currency. |
| 14 | STANDARD_QTY |  |  |  | NUMERIC (12,4) | Contains the units of this item discounted as if the item were discounted in the standard unit of measure. |
| 15 | STANDARD_UNIT_DISC_AMT |  |  |  | NUMERIC (20,4) | Contains the unit discount amount of the item as if the item were discounted in the standard unit of measure. |
| 16 | REF_NO13 |  |  |  | VARCHAR (30 BYTE) | This field contains any additional information about the discount that the retailer chooses to store. |
| 17 | REF_NO14 |  |  |  | VARCHAR (30 BYTE) | This field contains any additional information about the discount that the retailer chooses to store. |
| 18 | REF_NO15 |  |  |  | VARCHAR (30 BYTE) | This field contains any additional information about the discount that the retailer chooses to store. |
| 19 | REF_NO16 |  |  |  | VARCHAR (30 BYTE) | This field contains any additional information about the discount that the retailer chooses to store. |
| 20 | ERROR_IND |  |  | Y | VARCHAR (1 BYTE) | This column is used to determine if functional errors exist for this record. |
| 21 | UOM_QUANTITY |  |  | Y | NUMERIC (12,4) | Contains the weight of an item sold. If the tiem doesnt have a weight the this field will contain the quantity sold. |
| 22 | CATCHWEIGHT_IND |  |  |  | VARCHAR (1 BYTE) | Indicates that the value in UOM_QUANTITY is a catchweight. |
| 23 | PROMO_COMP |  |  |  | NUMERIC (10) | Contains the promotion component type or ID. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SA_TRAN_DISC_REV|PK||||TRAN_SEQ_NO|ASC|
||||||ITEM_SEQ_NO|ASC|
||||||DISCOUNT_SEQ_NO|ASC|
||||||RMS_PROMO_TYPE|ASC|
||||||REV_NO|ASC|
||||||STORE|ASC|
||||||DAY|ASC|
|SA_TRAN_DISC_REV_I2|||||PROMOTION|ASC|
|SA_TRAN_DISC_REV_I1|||||TRAN_SEQ_NO|ASC|
||||||ITEM_SEQ_NO|ASC|
||||||REV_NO|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
||||||STORE|ASC|
||||||DAY|ASC|
|SA_TRAN_DISC_REV_I3|||||TRAN_SEQ_NO|ASC|
||||||STORE|ASC|
||||||DAY|ASC|
|PK_SA_TRAN_DISC_REV|UN||||TRAN_SEQ_NO|ASC|
||||||ITEM_SEQ_NO|ASC|
||||||DISCOUNT_SEQ_NO|ASC|
||||||RMS_PROMO_TYPE|ASC|
||||||REV_NO|ASC|
||||||STORE|ASC|
||||||DAY|ASC|

---

## Table: SA_TRAN_HEAD

**Description:** This table will hold base level information about each transaction processed in the Oracle Retail sales audit system.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | STORE | P |  | Y | NUMERIC (10) | Store number to be used for table partitioning. |
| 2 | DAY | P |  | Y | NUMERIC (3) | Day number to be used for table partitioning. This is derived from the sa_store_day.business_date column by calling the function SA_DATE_HASH. |
| 3 | TRAN_SEQ_NO | P |  | Y | NUMERIC (20) | The sales audit systems transaction identifier. |
| 4 | REV_NO |  |  | Y | NUMERIC (3) | This is an incremental counter used to identify the version of the transaction. |
| 5 | STORE_DAY_SEQ_NO |  | F | Y | NUMERIC (20) | Contains a system generated identification number for a unique store/business date combination. |
| 6 | TRAN_DATETIME |  |  | Y | Date (7) | Contains the date and time stamp of the transaction. |
| 7 | REGISTER |  |  |  | VARCHAR (5 BYTE) | The register used to process this transaction. |
| 8 | TRAN_NO |  |  |  | NUMERIC (10) | Point of sale system defined transaction number associated with the transaction. It is unique to a register within a store. |
| 9 | CASHIER |  |  |  | VARCHAR (10 BYTE) | The POS id of the cashier who entered this transaction at the register. |
| 10 | SALESPERSON |  |  |  | VARCHAR (10 BYTE) | Salesperson number of the salesperson who sold the item(s). |
| 11 | TRAN_TYPE |  |  | Y | VARCHAR (6 BYTE) | Identifies the type of transaction. Valid values stored on the codes table. |
| 12 | SUB_TRAN_TYPE |  |  |  | VARCHAR (6 BYTE) | Additional identification information for defining the type of transaction. Valid values are found in the code_detail table under code_type TRAS. |
| 13 | ORIG_TRAN_NO |  |  |  | NUMERIC (10) | Original transaction number for a post-void transaction. column pos 13. |
| 14 | ORIG_TRAN_TYPE |  |  |  | VARCHAR (6 BYTE) | Used when post voiding a transaction to store the original transaction type. Valid values are in code_type TRAT. |
| 15 | ORIG_REG_NO |  |  |  | VARCHAR (5 BYTE) | Original register number for a post-void transaction. Column pos 14. |
| 16 | REF_NO1 |  |  |  | VARCHAR (30 BYTE) | Reference Number (e. g. Layaway number, original transaction number in the case of a post-void, etc). |
| 17 | REF_NO2 |  |  |  | VARCHAR (30 BYTE) | Reference number 2 (e.g. original register number in case of a post-void). |
| 18 | REF_NO3 |  |  |  | VARCHAR (30 BYTE) | Reference number 3 (e.g. polling-id sent from the POS system). |
| 19 | REF_NO4 |  |  |  | VARCHAR (30 BYTE) | Reference number 4 (e.g. miscellaneous data sent from POS system). |
| 20 | REASON_CODE |  |  |  | VARCHAR (6 BYTE) | Reason code for certain transactions types (e.g. void, return, etc.). |
| 21 | VENDOR_NO |  |  |  | VARCHAR (10 BYTE) | The vendor (supplier or partner) of a paid invoice. This field is populated for a vendor paid-out transaction. |
| 22 | VENDOR_INVC_NO |  |  |  | VARCHAR (30 BYTE) | The vendors invoice number. This field is populated for a vendor paid-out transaction. |
| 23 | PAYMENT_REF_NO |  |  |  | VARCHAR (16 BYTE) | The reference number attached to an invoice payment (money order no, check no, etc.). This field is populated for a vendor paid-out transaction. |
| 24 | PROOF_OF_DELIVERY_NO |  |  |  | VARCHAR (30 BYTE) | The proof that merchandise was received, given at the time of receipt at the store. This field is populated for a vendor paid-out transaction. |
| 25 | STATUS |  |  | Y | VARCHAR (6 BYTE) | This field holds the status of the transaction. Valid values can be found in the code type SAST. |
| 26 | VALUE |  |  |  | NUMERIC (20,4) | This column will store the transactions value. For sales and returns, the items minus discounts plus tax; for declared totals, the total value. |
| 27 | POS_TRAN_IND |  |  | Y | VARCHAR (1 BYTE) | Indicates if transaction was received from POS or manually created. Y=POS, N=Manual |
| 28 | UPDATE_DATETIME |  |  | Y | Date (7) | Date of modification. Used for the audit trail. |
| 29 | UPDATE_ID |  |  | Y | VARCHAR (30 BYTE) | User name. Used for the audit trail. |
| 30 | ERROR_IND |  |  | Y | VARCHAR (1 BYTE) | This column is used to determine if functional errors exist for this record. |
| 31 | BANNER_NO |  |  |  | NUMERIC (4) | This field holds the banner number for the locations where the sale has occurred. |
| 32 | ROUNDED_AMT |  |  |  | NUMERIC (20,4) | Rounded tender amount paid by the customer if paying by cash in case of total retail value is in decimals. At present, this column should not be used. |
| 33 | ROUNDED_OFF_AMT |  |  |  | NUMERIC (20,4) | This contains the difference between the total retail value and the tender amount. At present, this column should not be used. |
| 34 | CREDIT_PROMOTION_ID |  |  |  | NUMERIC (10) | This field will hold the credit promotion id associated with the transaction. |
| 35 | REF_NO25 |  |  |  | VARCHAR (30 BYTE) | This field holds the fiscal document number (i.e NF number). This document is issued during the sale process for letting the customers to |
| 36 | REF_NO26 |  |  |  | VARCHAR (30 BYTE) | Generic reference number for storing information at tran head level. |
| 37 | REF_NO27 |  |  |  | VARCHAR (30 BYTE) | Generic reference number for storing information at tran head level. |
| 38 | RTLOG_ORIG_SYS |  |  | Y | VARCHAR (3 BYTE) | This column contains the RTLOG files originating/source system. Expected values for this column are POS for ORPOS and OMS for other Order Management Systems. |
| 39 | TRAN_PROCESS_SYS |  |  |  | VARCHAR (3 BYTE) | This column holds the name of the system that processed the transaction. This will be used for filtering duplicate transactions coming from the different systems for export to downstream systems. Expected values are POS - Point of Sale, OMS - Order Management System and SIM - Store Inventory Management. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SA_TRAN_HEAD|PK||||TRAN_SEQ_NO|ASC|
||||||STORE|ASC|
||||||DAY|ASC|
|PK_SA_TRAN_HEAD|UN||||TRAN_SEQ_NO|ASC|
||||||STORE|ASC|
||||||DAY|ASC|
|SA_TRAN_HEAD_I4|||||REGISTER|ASC|
|SA_TRAN_HEAD_I3|||||TRAN_TYPE|ASC|
|SA_TRAN_HEAD_I1|||||STORE_DAY_SEQ_NO|ASC|
||||||TRAN_TYPE|ASC|
|SA_TRAN_HEAD_I2|||||TRAN_DATETIME|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|SA_TRAN_HEAD_I5|||||CASHIER|ASC|
|SA_TRAN_HEAD_I6|||||STORE_DAY_SEQ_NO|ASC|
||||||TRAN_NO|ASC|
||||||REGISTER|ASC|

### Constraints

|Type|Column /<br>Constraint Name|Details|Col4|
|---|---|---|---|
|Column Level|RTLOG_ORIG_SYS|Value List<br>Value<br>Description<br>'OMS'<br> <br>'POS'<br>|Value List<br>Value<br>Description<br>'OMS'<br> <br>'POS'<br>|
|Column Level|RTLOG_ORIG_SYS|Value List|Value List|
|Column Level|RTLOG_ORIG_SYS|Value|Description|
|Column Level|RTLOG_ORIG_SYS|'OMS'||
|Column Level|RTLOG_ORIG_SYS|'POS'||
||TRAN_PROCESS_SYS|Value List<br>Value<br>Description<br>'OMS'<br> <br>'POS'<br> <br>'SIM'<br>|Value List<br>Value<br>Description<br>'OMS'<br> <br>'POS'<br> <br>'SIM'<br>|
||TRAN_PROCESS_SYS|Value List|Value List|
||TRAN_PROCESS_SYS|Value|Description|
||TRAN_PROCESS_SYS|'OMS'||
||TRAN_PROCESS_SYS|'POS'||
||TRAN_PROCESS_SYS|'SIM'||

---

## Table: SA_TRAN_HEAD_REV

**Description:** This table will hold all revisions to the base level information for each transaction processed in the Oracle Retail sales audit system.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | STORE | P |  | Y | NUMERIC (10) | Store number to be used for table partitioning. |
| 2 | DAY | P |  | Y | NUMERIC (3) | Day number to be used for table partitioning. This is derived from the sa_store_day.business_date column by calling the function SA_DATE_HASH. |
| 3 | TRAN_SEQ_NO | P |  | Y | NUMERIC (20) | The sales audit systems transaction identifier. |
| 4 | REV_NO | P |  | Y | NUMERIC (3) | This is an incremental counter unique to each version of a transaction stored on the database. |
| 5 | STORE_DAY_SEQ_NO |  | F | Y | NUMERIC (20) | Contains a system generated identification number for a unique store/business date combination. |
| 6 | TRAN_DATETIME |  |  | Y | Date (7) | Contains the date and time stamp of the transaction. |
| 7 | REGISTER |  |  |  | VARCHAR (5 BYTE) | Register number for the transaction. |
| 8 | TRAN_NO |  |  |  | NUMERIC (10) | Point of sale system defined transaction number associated with the transaction. It is unique to a register within a store. |
| 9 | CASHIER |  |  |  | VARCHAR (10 BYTE) | Cashier number of the cashier who entered the transaction. |
| 10 | SALESPERSON |  |  |  | VARCHAR (10 BYTE) | Salesperson number of the salesperson who sold the item(s). |
| 11 | TRAN_TYPE |  |  | Y | VARCHAR (6 BYTE) | Identifies the type of transaction. Valid values stored on the codes table. *** |
| 12 | SUB_TRAN_TYPE |  |  |  | VARCHAR (6 BYTE) | Additional identification information for defining the type of transaction. Valid values are found in the code_detail table under code_type TRAS. |
| 13 | ORIG_TRAN_NO |  |  |  | NUMERIC (10) | Original transaction number in the case of a post-void transaction. |
| 14 | ORIG_TRAN_TYPE |  |  |  | VARCHAR (6 BYTE) | Used when post voiding a transaction to store the original transaction type. Valid values are in code_type TRAT. |
| 15 | ORIG_REG_NO |  |  |  | VARCHAR (5 BYTE) | Original register number in the case of a post-void transaction. |
| 16 | REF_NO1 |  |  |  | VARCHAR (30 BYTE) | Generic reference number for storing information at the tran head level. |
| 17 | REF_NO2 |  |  |  | VARCHAR (30 BYTE) | Generic reference number 2. |
| 18 | REF_NO3 |  |  |  | VARCHAR (30 BYTE) | Generic reference number 3. |
| 19 | REF_NO4 |  |  |  | VARCHAR (30 BYTE) | Generic reference number 4. |
| 20 | REASON_CODE |  |  |  | VARCHAR (6 BYTE) | Reason code for certain transactions types (e.g. void, return, etc.). |
| 21 | VENDOR_NO |  |  |  | VARCHAR (10 BYTE) | The vendor (supplier or partner) of a paid invoice. This field is populated for a vendor paid-out transaction. |
| 22 | VENDOR_INVC_NO |  |  |  | VARCHAR (30 BYTE) | The vendors invoice number. This field is populated for a vendor paid-out transaction. |
| 23 | PAYMENT_REF_NO |  |  |  | VARCHAR (16 BYTE) | The reference number attached to an invoice payment (money order no, check no, etc.). This field is populated for a vendor paid-out transaction. |
| 24 | PROOF_OF_DELIVERY_NO |  |  |  | VARCHAR (30 BYTE) | The proof that merchandise was received, given at the time of receipt at the store. This field is populated for a vendor paid-out transaction. |
| 25 | STATUS |  |  | Y | VARCHAR (6 BYTE) | This field holds the status of the transaction. Valid values can be found in the code type SAST. |
| 26 | VALUE |  |  |  | NUMERIC (20,4) | This column will store the transactions value. For sales and returns, the items minus discounts plus tax; for declared totals, the total value. |
| 27 | POS_TRAN_IND |  |  | Y | VARCHAR (1 BYTE) | Indicates if transaction was received from POS or manually created. Y=POS, N=Manual |
| 28 | UPDATE_DATETIME |  |  | Y | Date (7) | Date of modification. Used for the audit trail. |
| 29 | UPDATE_ID |  |  | Y | VARCHAR (30 BYTE) | User name. Used for the audit trail. |
| 30 | ERROR_IND |  |  | Y | VARCHAR (1 BYTE) | This column is used to determine if functional errors exist for this record. |
| 31 | BANNER_NO |  |  |  | NUMERIC (4) | This field holds the banner number for the locations where the sale occurred. |
| 32 | ROUNDED_AMT |  |  |  | NUMERIC (20,4) | Rounded tender amount paid by the customer if paying by cash in case of total retail value is in decimals. At present, this column should not be used. |
| 33 | ROUNDED_OFF_AMT |  |  |  | NUMERIC (20,4) | This contains the difference between the total retail value and the tender amount. At present, this column should not be used. |
| 34 | CREDIT_PROMOTION_ID |  |  |  | NUMERIC (10) | This field will hold the credit promotion id associated with the transaction. |
| 35 | REF_NO25 |  |  |  | VARCHAR (30 BYTE) | This field holds the fiscal document number (i.e NF number). This document is issued during the sale process for letting the customers to claim tax rebate. |
| 36 | REF_NO26 |  |  |  | VARCHAR (30 BYTE) | Generic reference number for storing information at tran head level. |
| 37 | REF_NO27 |  |  |  | VARCHAR (30 BYTE) | Generic reference number for storing information at tran head level. |
| 38 | RTLOG_ORIG_SYS |  |  | Y | VARCHAR (3 BYTE) | This column contains the RTLOG file's originating/source system. Expected values for this column are 'POS' for ORPOS and 'OMS' for other Order Management Systems. |
| 39 | TRAN_PROCESS_SYS |  |  |  | VARCHAR (3 BYTE) | This column holds the name of the system that processed the transaction. This will be used for filtering duplicate transactions coming from the different systems for export to downstream systems. Expected values are POS - Point of Sale, OMS - Order Management System and SIM - Store Inventory Management. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SA_TRAN_HEAD_REV|PK||||TRAN_SEQ_NO|ASC|
||||||REV_NO|ASC|
||||||STORE|ASC|
||||||DAY|ASC|
|PK_SA_TRAN_HEAD_REV|UN||||TRAN_SEQ_NO|ASC|
||||||REV_NO|ASC|
||||||STORE|ASC|
||||||DAY|ASC|
|SA_TRAN_HEAD_REV_I1|||||STORE_DAY_SEQ_NO|ASC|

---

## Table: SA_TRAN_HEAD_TEMP

**Description:** Global temporary table which holds the details of the store/day to be deleted

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | STORE |  |  | Y | NUMERIC (10) | Store number to be deleted. |
| 2 | DAY |  |  | Y | NUMERIC (3) | Day number to be deleted. |
| 3 | TRAN_SEQ_NO |  |  | Y | NUMERIC (20) | The sales audit systems transaction identifier. |

---

## Table: SA_TRAN_IGTAX

**Description:** This table contains all taxes associated with the item in a transaction.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | STORE | P | F | Y | NUMERIC (10) | Store Number |
| 2 | DAY | P | F | Y | NUMERIC (3) | The day number at which the transaction happens. |
| 3 | TRAN_SEQ_NO | P | F | Y | NUMERIC (20) | The transaction identifier in Sales Audit system. |
| 4 | ITEM_SEQ_NO | P | F | Y | NUMERIC (4) | Sequence number of item within a transaction. |
| 5 | IGTAX_SEQ_NO | P |  | Y | NUMERIC (4) | Sequence number of IGTAX within a transaction. |
| 6 | TAX_AUTHORITY |  |  | Y | VARCHAR (10 ) | Tax authority for taxation. |
| 7 | IGTAX_CODE |  |  | Y | VARCHAR (6) | The IGTAX code associated with the given transaction. This code is same as VAT_CODE in VAT_CODES table. |
| 8 | IGTAX_RATE |  |  |  | NUMERIC (20,4) | The IGTAX rate associated with an item in a given transaction. |
| 9 | TOTAL_IGTAX_AMT |  |  | Y | NUMERIC (20,4) | Total IGTAX amount of an item per tax authority. |
| 10 | STANDARD_QTY |  |  |  | NUMERIC (12,4) | Item qty in standard unit of measure. |
| 11 | STANDARD_UNIT_IGTAX_AMT |  |  |  | NUMERIC (20,4) | Unit IGTAX amount of an item in standard unit of measure. |
| 12 | ERROR_IND |  |  | Y | VARCHAR (1) | This column is used to determine if functional errors exist for this record. |
| 13 | REF_NO21 |  |  |  | VARCHAR (30) | Reference Number 21 (e.g. component item number incase the item in TITEM is a pack item). |
| 14 | REF_NO22 |  |  |  | VARCHAR (30) | Reference Number 22 (e.g. Contains the POS populated component item description incase the item in TITEM is a pack item). |
| 15 | REF_NO23 |  |  |  | VARCHAR (30) | Generic reference number field. This field can be configured by user. |
| 16 | REF_NO24 |  |  |  | VARCHAR (30) | Generic reference number field. This field can be configured by user. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SA_TRAN_IGTAX|PK||||STORE|ASC|
||||||DAY|ASC|
||||||TRAN_SEQ_NO|ASC|
||||||ITEM_SEQ_NO|ASC|
||||||IGTAX_SEQ_NO|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_SA_TRAN_IGTAX_ERROR_IND|ERROR_IND in ('Y','N')<br>|
|Column Level|ERROR_IND||

---

## Table: SA_TRAN_IGTAX_REV

**Description:** This table contains the revision records for item taxes associated with each items in a transaction.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | STORE | P | F | Y | NUMERIC (10) | Store Number |
| 2 | DAY | P | F | Y | NUMERIC (3) | The day number at which the particular transaction happens. |
| 3 | TRAN_SEQ_NO | P | F | Y | NUMERIC (20) | The transaction identifier in Sales Audit |
| 4 | ITEM_SEQ_NO | P | F | Y | NUMERIC (4) | Sequence number of item within a transaction. |
| 5 | IGTAX_SEQ_NO | P |  | Y | NUMERIC (4) | Sequence number of IGTAX within a transaction. |
| 6 | REV_NO | P | F | Y | NUMERIC (3) | The revision number to identify the number of revision made on the particular IGTAX amount. |
| 7 | TAX_AUTHORITY |  |  | Y | VARCHAR (10 ) | Tax authority for taxation. |
| 8 | IGTAX_CODE |  |  | Y | VARCHAR (6) | The IGTAX code associated with the given tax amount for an item. This is same as VAT_CODE from VAT_CODES table. |
| 9 | IGTAX_RATE |  |  |  | NUMERIC (20,4) | The IGTAX rate associated with an item tax in a transaction. |
| 10 | TOTAL_IGTAX_AMT |  |  | Y | NUMERIC (20,4) | Total IGTAX amount of an item per tax authority. |
| 11 | STANDARD_QTY |  |  |  | NUMERIC (12,4) | Item qty in standard unit of measure. |
| 12 | STANDARD_UNIT_IGTAX_AMT |  |  |  | NUMERIC (20,4) | Unit IGTAX amount of an item in standard unit of measure. |
| 13 | ERROR_IND |  |  | Y | VARCHAR (1) | This column is used to determine if functional errors exist for this record. |
| 14 | REF_NO21 |  |  |  | VARCHAR (30) | Reference Number 21 (e.g. component item number incase the item in TITEM is a pack item). |
| 15 | REF_NO22 |  |  |  | VARCHAR (30) | Reference Number 22 (e.g. Contains the POS populated component item description incase the item in TITEM is a pack item). |
| 16 | REF_NO23 |  |  |  | VARCHAR (30) | Generic reference number field. This field can be configured by user. |
| 17 | REF_NO24 |  |  |  | VARCHAR (30) | Generic reference number field. This field can be configured by user. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SA_TRAN_IGTAX_REV|PK||||STORE|ASC|
||||||DAY|ASC|
||||||TRAN_SEQ_NO|ASC|
||||||ITEM_SEQ_NO|ASC|
||||||IGTAX_SEQ_NO|ASC|
||||||REV_NO|ASC|

### Constraints

|Type|Column / Constraint<br>Name|Details|
|---|---|---|
|Table Level|CHK_STIR_ERROR_IND|ERROR_IND in ('Y','N')<br>|
|Column Level|ERROR_IND||

---

## Table: SA_TRAN_ITEM

**Description:** This table is used to hold the details about each item contained in a transaction.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | STORE | P | F | Y | NUMERIC (10) | Store number to be used for table partitioning. |
| 2 | DAY | P | F | Y | NUMERIC (3) | Day number to be used for table partitioning. This is derived from the sa_store_day.business_date column by calling the function SA_DATE_HASH. |
| 3 | TRAN_SEQ_NO | P | F | Y | NUMERIC (20) | The sales audit systems transaction identifier. Foreign key for SA_TRAN_HEAD. |
| 4 | ITEM_SEQ_NO | P |  | Y | NUMERIC (4) | Sequence number of items within a transaction. |
| 5 | ITEM_STATUS |  |  | Y | VARCHAR (6 BYTE) | The status of the item, required for voided or exchanged items. Valid values are found in the code_detail table under code_type SASI. |
| 6 | ITEM_TYPE |  |  | Y | VARCHAR (6 BYTE) | Code specifying what type the item is. Valid values for this field are in the code type SAIT on the code_head and code_detail tables. |
| 7 | ITEM |  |  |  | VARCHAR (25 BYTE) | Unique identifier for the item. |
| 8 | REF_ITEM |  |  |  | VARCHAR (25 BYTE) | Contains a reference item to the item field. |
| 9 | NON_MERCH_ITEM |  |  |  | VARCHAR (25 BYTE) | Contains a non-merchandise item (not a part of RMS). |
| 10 | VOUCHER_NO |  |  |  | VARCHAR (25 BYTE) | Contains the Gift Certificate or Voucher number. |
| 11 | DEPT |  |  |  | NUMERIC (4) | Department number associated with the item. |
| 12 | CLASS |  |  |  | NUMERIC (4) | Class number associated with the item. |
| 13 | SUBCLASS |  |  |  | NUMERIC (4) | Subclass number associated with the item. |
| 14 | QTY |  |  |  | NUMERIC (12,4) | Units sold of this item. |
| 15 | UNIT_RETAIL |  |  |  | NUMERIC (20,4) | Retail price of the item. |
| 16 | SELLING_UOM |  |  |  | VARCHAR (4 BYTE) | Contains the selling unit of measure for the item. |
| 17 | OVERRIDE_REASON |  |  |  | VARCHAR (6 BYTE) | This column will be populated when an items price has been overridden at the POS to define why it was overridden. |
| 18 | ORIG_UNIT_RETAIL |  |  |  | NUMERIC (20,4) | This column will be populated when the items price was overridden at the POS and the items original unit retail is known. |
| 19 | STANDARD_ORIG_UNIT_RETAIL |  |  |  | NUMERIC (20,4) | This column will be populated when the items price was overridden at the POS and the items original unit retail is known. The value stored in this column will be held in the standard unit of measure. |
| 20 | TAX_IND |  |  | Y | VARCHAR (1 BYTE) | Indicates if the item was taxed in this transaction. |
| 21 | ITEM_SWIPED_IND |  |  | Y | VARCHAR (1 BYTE) | Indicator showing whether the item was scanned in at the register or manually keyed. Valid values are Yes (swiped/scanned) and No (keyed). |
| 22 | ERROR_IND |  |  | Y | VARCHAR (1 BYTE) | This column is used to determine if functional errors exist for this record. |
| 23 | DROP_SHIP_IND |  |  | Y | VARCHAR (1 BYTE) | Indicates if the item is handled by drop shipment inventory adjustment. |
| 24 | WASTE_TYPE |  |  |  | VARCHAR (6 BYTE) | This column will hold the waste_type associated with a given item. Valid values for this field are SL - sales wastage, SP, spoilage wastage and NULL. This information is not used in any Sales Audit processing, but will be passed through Sales Audit to RMS. |
| 25 | WASTE_PCT |  |  |  | NUMERIC (12,4) | This column will hold the waste_pct associated with a given item. This information will not be used in any Sales Audit processing, but will be passed through the Sales Audit to RMS. |
| 26 | PUMP |  |  |  | VARCHAR (8 BYTE) | Contains the identifying code of the pump that the gas was sold from. |
| 27 | RETURN_REASON_CODE |  |  |  | VARCHAR (6 BYTE) | The reason an item was returned. Valid values are found in the code_detail table under code_type SARR. |
| 28 | SALESPERSON |  |  |  | VARCHAR (10 BYTE) | The salesperson credited with the item sale. |
| 29 | EXPIRATION_DATE |  |  |  | Date (7) | The expiration date of a gift certificate. |
| 30 | STANDARD_QTY |  |  |  | NUMERIC (12,4) | Contains the selling unit of measure for the item. |
| 31 | STANDARD_UNIT_RETAIL |  |  |  | NUMERIC (20,4) | Contains the unit retail price of the item as if the item were sold in the standard unit of measure. |
| 32 | STANDARD_UOM |  |  |  | VARCHAR (4 BYTE) | Contains the standard unit of measure for the item. |
| 33 | REF_NO5 |  |  |  | VARCHAR (30 BYTE) | Generic reference number field for storing information at the item level. |
| 34 | REF_NO6 |  |  |  | VARCHAR (30 BYTE) | Generic reference number field for storing information at the item level. |
| 35 | REF_NO7 |  |  |  | VARCHAR (30 BYTE) | Generic reference number field for storing information at the item level. |
| 36 | REF_NO8 |  |  |  | VARCHAR (30 BYTE) | Generic reference number field for storing information at the item level. |
| 37 | UOM_QUANTITY |  |  | Y | NUMERIC (12,4) | Contains the weight of an item sold. If the item doesnt have a weight then this column will contain the quantity that was sold. |
| 38 | CATCHWEIGHT_IND |  |  |  | VARCHAR (1 BYTE) | Valid values are Y, N and Null. This field indicates that the value in UOM Quantity is a catchweight |
| 39 | SELLING_ITEM |  |  |  | VARCHAR (25 BYTE) | This field holds the selling item as used by a catalogue or website. In RCOM the selling Item and Media ID are combined as one selling item. NB - in the RDWT fils spec this number should only be the varchar(25) selling item number, which often equates in RMS style (level 1 item). RDWT file does not want the selling item concatenated with the media identifier as RCOm uses and refers to as their selling item. |
| 40 | CUSTOMER_ORDER_LINE_NO |  |  |  | NUMERIC (6) | This field holds the line number on the customer order for the item on the transaction. |
| 41 | MEDIA_ID |  |  |  | NUMERIC (10) | This field holds the number associated with the type of media that created the transaction (e.g. catalogue number). NB - In the RDWT file spec this should specifically be the customer order line media ID |
| 42 | UNIT_RETAIL_VAT_INCL |  |  | Y | VARCHAR (1 BYTE) | Unit Retail Vat Inclusive? |
| 43 | TOTAL_IGTAX_AMT |  |  |  | NUMERIC (20,4) | This will indicate total of all IGTAX amount for the item. |
| 44 | UNIQUE_ID |  |  |  | VARCHAR (128 BYTE) | Unique Identification Number. This field identifies the serial number of the item. |
| 45 | CUST_ORDER_NO |  |  |  | VARCHAR (48 BYTE) | This column holds the master customer number from OMS or ORPOS. |
| 46 | CUST_ORDER_DATE |  |  |  | Date (7) | This column holds the date the customer order was created. |
| 47 | FULFILL_ORDER_NO |  |  |  | VARCHAR (48 BYTE) | This column holds the order number from OMS that is related to the fulfillment details. One or more fulfillment order numbers could be related back to a single customer order in OMS. This column is required if the order is an external customer order (i.e. Sales Type = E) and the item status is ORD. |
| 48 | NO_INV_RET_IND |  |  |  | VARCHAR (1 BYTE) | This column contains an indicator that identifies a return without inventory. This is generally a non-required column, but in case of Returns, this column is required. Expected values are Y - Yes, N -No. |
| 49 | RETURN_WH |  |  |  | NUMERIC (10) | This column contains the physical warehouse ID for the warehouse identifier where the item was returned. This is generally not required, but in cases of external customer order returns (i.e. Sales Type= E) it is required. |
| 50 | SALES_TYPE |  |  |  | VARCHAR (1 BYTE) | This column indicates whether the line item is a Regular Sale, a customer order serviced by OMS (External CO) or a customer order serviced by a store (In Store CO). This is a required column. Expected values are stored in the CODE_DETAIL table, under the SASY code type. |
| 51 | RETURN_DISPOSITION |  |  |  | VARCHAR (10 BYTE) | This column will contain the disposition code published by RWMS as part of the Returns upload to OMS. This will contain a value in case of returns with inventory to a warehouse. OMS will include this disposition code in the RTLOG while creating return transactions for processing by ReSA. When these returns are uploaded in RMS, the specific inventory buckets |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SA_TRAN_ITEM|PK||||TRAN_SEQ_NO|ASC|
||||||ITEM_SEQ_NO|ASC|
||||||STORE|ASC|
||||||DAY|ASC|
|PK_SA_TRAN_ITEM|UN||||TRAN_SEQ_NO|ASC|
||||||ITEM_SEQ_NO|ASC|
||||||STORE|ASC|
||||||DAY|ASC|
|SA_TRAN_ITEM_I4|||||CLASS|ASC|
||||||SUBCLASS|ASC|
|SA_TRAN_ITEM_I1|||||TRAN_SEQ_NO|ASC|
||||||STORE|ASC|
||||||DAY|ASC|
|SA_TRAN_ITEM_I2|||||ITEM|ASC|
|SA_TRAN_ITEM_I3|||||DEPT|ASC|
|SA_TRAN_ITEM_I5|||||ERROR_IND|ASC|

---

## Table: SA_TRAN_ITEM_REV

**Description:** This table will hold all revisions to the details for each item contained in a transaction

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | STORE | P | F | Y | NUMERIC (10) | Store number to be used for table partitioning. |
| 2 | DAY | P | F | Y | NUMERIC (3) | Day number to be used for table partitioning. This is derived from the sa_store_day.business_date column by calling the function |
| 3 | TRAN_SEQ_NO | P | F | Y | NUMERIC (20) | The sales audit systems transaction identifier. Foreign key for SA_TRAN_HEAD. |
| 4 | ITEM_SEQ_NO | P |  | Y | NUMERIC (4) | Sequence number of items within a transaction. |
| 5 | REV_NO | P | F | Y | NUMERIC (3) | This is an incremental counter unique to each version of a transaction stored on the database. |
| 6 | ITEM_STATUS |  |  | Y | VARCHAR (6 BYTE) | The status of the item, required for voided or exchanged items. Valid values are found in the code_detail table under code_type SASI. |
| 7 | ITEM_TYPE |  |  | Y | VARCHAR (6 BYTE) | Code specifying what type the item is. Valid values for this field are in the code type SAIT on the code_head and code_detail tables. |
| 8 | ITEM |  |  |  | VARCHAR (25 BYTE) | Unique identifier for the item. |
| 9 | REF_ITEM |  |  |  | VARCHAR (25 BYTE) | Contains a reference item to the item field. |
| 10 | NON_MERCH_ITEM |  |  |  | VARCHAR (25 BYTE) | Contains a non-merchandise item (not a part of RMS). |
| 11 | VOUCHER_NO |  |  |  | VARCHAR (25 BYTE) | Contains the Gift Certificate or Voucher number. |
| 12 | DEPT |  |  |  | NUMERIC (4) | Department number associated with the item. |
| 13 | CLASS |  |  |  | NUMERIC (4) | Class number associated with the item. |
| 14 | SUBCLASS |  |  |  | NUMERIC (4) | Subclass number associated with the item. |
| 15 | QTY |  |  |  | NUMERIC (12,4) | Units sold of this item. |
| 16 | UNIT_RETAIL |  |  |  | NUMERIC (20,4) | Retail price of the item. |
| 17 | SELLING_UOM |  |  |  | VARCHAR (4 BYTE) | Contains the selling unit of measure for the item. |
| 18 | OVERRIDE_REASON |  |  |  | VARCHAR (6 BYTE) | This column will be populated when an items price has been overridden at the POS to define why it was over |
| 19 | ORIG_UNIT_RETAIL |  |  |  | NUMERIC (20,4) | This column will be populated when the items price was overridden at the POS and the items original unit retail is known. |
| 20 | STANDARD_ORIG_UNIT_RETAIL |  |  |  | NUMERIC (20,4) | This column will be populated when the items price was overridden at the POS and the items original unit retail is known. The value stored in this column will be held in the standard unit of measure. |
| 21 | TAX_IND |  |  | Y | VARCHAR (1 BYTE) | Indicates if the item was taxed in this transaction. |
| 22 | ITEM_SWIPED_IND |  |  | Y | VARCHAR (1 BYTE) | Indicator showing whether the item was scanned in at the register or manually keyed. Valid values are Yes (swiped/scanned) and No (keyed). |
| 23 | ERROR_IND |  |  | Y | VARCHAR (1 BYTE) | This column is used to determine if functional errors exist for this record. |
| 24 | DROP_SHIP_IND |  |  | Y | VARCHAR (1 BYTE) | Indicates if the item is handled by drop shipment inventory adjustment. |
| 25 | WASTE_TYPE |  |  |  | VARCHAR (6 BYTE) | This column will hold the waste_type associated with a given item. Valid values for this field are SL - sales wastage, SP, spoilage wastage and NULL. This information is not used in any Sales Audit processing, but will be passed through Sales Audit to RMS. |
| 26 | WASTE_PCT |  |  |  | NUMERIC (12,4) | This column will hold the waste_pct associated with a given item. This information will not be used in any Sales Audit processing, but will be passed through the Sales Audit to RMS. |
| 27 | PUMP |  |  |  | VARCHAR (8 BYTE) | Contains the identifying code of the pump that the gas was sold from. |
| 28 | RETURN_REASON_CODE |  |  |  | VARCHAR (6 BYTE) | The reason an item was returned. Valid values are found in the code_detail table under code_type SARR. |
| 29 | SALESPERSON |  |  |  | VARCHAR (10 BYTE) | The salesperson credited with the item sale. |
| 30 | EXPIRATION_DATE |  |  |  | Date (7) | The expiration date of a gift certificate. |
| 31 | STANDARD_QTY |  |  |  | NUMERIC (12,4) | Contains the units sold of this item as if the item were sold in the standard unit of measure. |
| 32 | STANDARD_UNIT_RETAIL |  |  |  | NUMERIC (20,4) | Contains the unit retail price of the item as if the item were sold in the standard unit of measure. |
| 33 | STANDARD_UOM |  |  |  | VARCHAR (4 BYTE) | Contains the standard unit of measure for the item. |
| 34 | REF_NO5 |  |  |  | VARCHAR (30 BYTE) | Generic reference number field for storing information at the item level. |
| 35 | REF_NO6 |  |  |  | VARCHAR (30 BYTE) | Generic reference number field for storing information at the item level. |
| 36 | REF_NO7 |  |  |  | VARCHAR (30 BYTE) | Generic reference number field for storing information at the item level. |
| 37 | REF_NO8 |  |  |  | VARCHAR (30 BYTE) | Generic reference number field for storing information at the item level. |
| 38 | UOM_QUANTITY |  |  | Y | NUMERIC (12) | Contains the weight of the item sold. If the item doesnt have a weight then this field will contain the quantity sold. |
| 39 | CATCHWEIGHT_IND |  |  |  | VARCHAR (1 BYTE) | This field indicates that the value in UOM_Quantity is a catchweight rather than quantity. Valid values = Y, N and Null |
| 40 | SELLING_ITEM |  |  |  | VARCHAR (25 BYTE) | This field holds the selling item as used by a catalogue or website. In RCOM the selling Item and Media ID are combined as one selling item. NB - in the RDWT fils spec this number should only be the varchar(25) selling item number, which often equates in RMS style (level 1 item). RDWT file does not want the selling item concatenated with the media identifier as RCOm uses and refers to as their selling item. |
| 41 | CUSTOMER_ORDER_LINE_NO |  |  |  | NUMERIC (6) | This field holds the line number on the customer order for the item on the transaction. |
| 42 | MEDIA_ID |  |  |  | VARCHAR (10 BYTE) | This field holds the number associated with the type of media that created the transaction (e.g. catalogue number). NB - In the RDWT file spec this should specifically be the customer order line media ID (customer orders can contain a different cust order header media ID). |
| 43 | UNIT_RETAIL_VAT_INCL |  |  | Y | VARCHAR (1 BYTE) | Unit Retail Vat Inclusive? |
| 44 | TOTAL_IGTAX_AMT |  |  |  | NUMERIC (20,4) | This will indicate total of all IGTAX amount for the item. |
| 45 | UNIQUE_ID |  |  |  | VARCHAR (128 BYTE) | Unique Identification Number. This field identifies the serial number of the item. |
| 46 | CUST_ORDER_NO |  |  |  | VARCHAR (48 BYTE) | This column holds the master customer order number from OMS or ORPOS. |
| 47 | CUST_ORDER_DATE |  |  |  | Date (7) | This column holds the date the customer order was created. |
| 48 | FULFILL_ORDER_NO |  |  |  | VARCHAR (48 BYTE) | This column holds the order number from OMS that is related to the fulfillment details. One or more fulfillment order numbers could be related back to a single customer order in OMS. This column is required if the order is an external customer order (i.e. Sales Type = E) and the item status is ORD. |
| 49 | NO_INV_RET_IND |  |  |  | VARCHAR (1 BYTE) | This column contains an indicator that identifies a return without inventory. This is generally a non-required column, but in case of Returns, this is required. Expected values are Y -Yes, N - No |
| 50 | RETURN_WH |  |  |  | NUMERIC (10) | This column contains the physical warehouse ID for the warehouse identifier where the item was returned. This is generally not required, but in cases of external customer order returns (i.e. Sales Type= E) it is required. |
| 51 | SALES_TYPE |  |  |  | VARCHAR (1 BYTE) | This column indicates whether the line item is a Regular Sale, a customer order serviced by OMS (External CO) or a customer order serviced by a store (In Store CO). This is a required column. Expected values are |
| 52 | RETURN_DISPOSITION |  |  |  | VARCHAR (10 BYTE) | This column will contain the disposition code published by RWMS as part of the Returns upload to OMS. This will contain a value in case of returns with inventory to a warehouse. OMS will include this disposition code in the RTLOG while creating return transactions for processing by ReSA. When these returns are uploaded in RMS, the specific inventory buckets will be updated based on this value. This is a generally non-required column, but in case of an external customer order return serviced by OMS (i.e. Sales Type = E) and return with inventory (i.e. Return Without Inventory = N) in the virtual store RTLOG, it is required. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SA_TRAN_ITEM_REV|PK||||TRAN_SEQ_NO|ASC|
||||||ITEM_SEQ_NO|ASC|
||||||REV_NO|ASC|
||||||STORE|ASC|
||||||DAY|ASC|
|PK_SA_TRAN_ITEM_REV|UN||||TRAN_SEQ_NO|ASC|
||||||ITEM_SEQ_NO|ASC|
||||||REV_NO|ASC|
||||||STORE|ASC|
||||||DAY|ASC|
|SA_TRAN_ITEM_REV_I1|||||TRAN_SEQ_NO|ASC|
||||||REV_NO|ASC|
||||||STORE|ASC|
||||||DAY|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|SA_TRAN_ITEM_REV_I2|||||TRAN_SEQ_NO|ASC|
||||||STORE|ASC|
||||||DAY|ASC|

### Constraints

|Type|Column /<br>Constraint Name|Details|Col4|
|---|---|---|---|
|Column Level|DROP_SHIP_IND|Value List<br>Value<br>Description<br>'N'<br> <br>'Y'<br>|Value List<br>Value<br>Description<br>'N'<br> <br>'Y'<br>|
|Column Level|DROP_SHIP_IND|Value List|Value List|
|Column Level|DROP_SHIP_IND|Value|Description|
|Column Level|DROP_SHIP_IND|'N'||
|Column Level|DROP_SHIP_IND|'Y'||

---

## Table: SA_TRAN_ITEM_TEMP

**Description:** Global temporary table which holds the store/day transaction item details to be deleted from ReSA tables.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | STORE |  |  | Y | NUMERIC (10) | Store number to be deleted |
| 2 | DAY |  |  | Y | NUMERIC (3) | Day number to be deleted |
| 3 | TRAN_SEQ_NO |  |  | Y | NUMERIC (20) | The Sales Audit systems transaction identifier. |
| 4 | ITEM_SEQ_NO |  |  | Y | NUMERIC (4) | Sequence number of an item with in a transaction. |
| 5 | ITEM_STATUS |  |  | Y | VARCHAR (6) | The status of the item. Valid values are found in the code_detail table under code_type SASI. |
| 6 | ITEM |  |  |  | VARCHAR (25) | Unique identifier for the item. |

---

## Table: SA_TRAN_PAYMENT

**Description:** This table holds the deposit amount paid for a POS transaction.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | STORE | P | F | Y | NUMERIC (10) | Store Number |
| 2 | DAY | P | F | Y | NUMERIC (3) | The day at which the transaction happens. |
| 3 | TRAN_SEQ_NO | P | F | Y | NUMERIC (20) | Transaction sequence number to identify each transaction uniquely in Sales Audit. |
| 4 | PAYMENT_SEQ_NO | P |  | Y | NUMERIC (4) | This is the seqence number associated with the payment made for the current transaction. |
| 5 | PAYMENT_AMT |  |  | Y | NUMERIC (20,4) | The actual deposit amount made for the transaction. |
| 6 | ERROR_IND |  |  | Y | VARCHAR (1) | Indicates if an error occured while uploading the transaction. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SA_TRAN_PAYMENT|PK||||STORE|ASC|
||||||DAY|ASC|
||||||TRAN_SEQ_NO|ASC|
||||||PAYMENT_SEQ_NO|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_SA_TRAN_PAYMENT_ERROR_IND|ERROR_IND in ('Y','N')<br>|
|Column Level|ERROR_IND||

---

## Table: SA_TRAN_PAYMENT_REV

**Description:** This table holds the revision records for the changes made in the existing payment records in each POS transaction.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | STORE | P | F | Y | NUMERIC (10) | Store Number |
| 2 | DAY | P | F | Y | NUMERIC (3) | the day at which the transaction happens. |
| 3 | TRAN_SEQ_NO | P | F | Y | NUMERIC (20) | Transaction sequence number to identify each transaction uniquely in Sales Audit. |
| 4 | PAYMENT_SEQ_NO | P |  | Y | NUMERIC (4) | This is the seqence number associated with the payment made for the transaction. |
| 5 | REV_NO | P | F | Y | NUMERIC (3) | The revision number to identify number of revision made on the particular transaction payment. |
| 6 | PAYMENT_AMT |  |  | Y | NUMERIC (20,4) | The actual deposit amount made for the transaction. |
| 7 | ERROR_IND |  |  | Y | VARCHAR (1) | Error indicator if any while uploading the transaction. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SA_TRAN_PAYMENT_REV|PK||||STORE|ASC|
||||||DAY|ASC|
||||||TRAN_SEQ_NO|ASC|
||||||PAYMENT_SEQ_NO|ASC|
||||||REV_NO|ASC|

### Constraints

|Type|Column / Constraint<br>Name|Details|
|---|---|---|
|Table Level|CHK_STPR_ERROR_IND|error_ind in ('Y','N')<br>|






|Type|Column / Constraint<br>Name|Details|
|---|---|---|
|Column Level|ERROR_IND||

---

## Table: SA_TRAN_SEQ_TEMP

**Description:** Temporary table to hold tran_seq_no when running saexprms

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | STORE |  |  | Y | NUMERIC (10) | Store number to be used for table partitioning. |
| 2 | DAY |  |  | Y | NUMERIC (3) | Day number to be used for table partitioning. This is derived from the sa_store_day.business_date column by calling the function |
| 3 | TRAN_SEQ_NO |  |  | Y | NUMERIC (20) | The sales audit systems transaction identifier. |
| 4 | STORE_DAY_SEQ_NO |  |  | Y | NUMERIC (20) | Contains a system generated identification number for a unique store/business date combination. |

---

## Table: SA_TRAN_TAX

**Description:** This is a new table that contains all taxes associated with a transaction.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | STORE | P | F | Y | NUMERIC (10) | Store number to be used for table partitioning. |
| 2 | DAY | P | F | Y | NUMERIC (3) | Day number to be used for table partitioning. This is derived from the sa_store_day.business_date column by calling the function SA_DATE_HASH. |
| 3 | TRAN_SEQ_NO | P | F | Y | NUMERIC (20) | The sales audit systems transaction identifier. Foreign key for SA_TRAN_HEAD. |
| 4 | TAX_CODE |  |  | Y | VARCHAR (6 BYTE) | Tax type charged in this transaction. Valid values stored on the codes table. *** |
| 5 | TAX_SEQ_NO | P |  | Y | NUMERIC (4) | Sequence number of taxes within the transaction. |
| 6 | TAX_AMT |  |  | Y | NUMERIC (20,4) | Amount of tax charged in this transaction. |
| 7 | ERROR_IND |  |  | Y | VARCHAR (1 BYTE) | This column is used to determine if functional errors exist for this record. |
| 8 | REF_NO17 |  |  |  | VARCHAR (30 BYTE) | This field contains any additional information about the tax that the retailer chooses to store. |
| 9 | REF_NO18 |  |  |  | VARCHAR (30 BYTE) | This field contains any additional information about the tax that the retailer chooses to store. |
| 10 | REF_NO19 |  |  |  | VARCHAR (30 BYTE) | This field contains any additional information about the tax that the retailer chooses to store. |
| 11 | REF_NO20 |  |  |  | VARCHAR (30 BYTE) | This field contains any additional information about the tax that the retailer chooses to store. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SA_TRAN_TAX|PK||||TRAN_SEQ_NO|ASC|
||||||TAX_SEQ_NO|ASC|
||||||STORE|ASC|
||||||DAY|ASC|
|SAX_UK|UK||||TRAN_SEQ_NO|ASC|
||||||TAX_CODE|ASC|
||||||STORE|ASC|
||||||DAY|ASC|
|PK_SA_TRAN_TAX|UN||||TRAN_SEQ_NO|ASC|
||||||TAX_SEQ_NO|ASC|
||||||STORE|ASC|
||||||DAY|ASC|
|SA_TRAN_TAX_I1|||||TRAN_SEQ_NO|ASC|
||||||STORE|ASC|
||||||DAY|ASC|
|SAX_UK|UN||||TRAN_SEQ_NO|ASC|
||||||TAX_CODE|ASC|
||||||STORE|ASC|
||||||DAY|ASC|

---

## Table: SA_TRAN_TAX_REV

**Description:** This table contains all revisions to taxes associated with a transaction.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | STORE | P | F | Y | NUMERIC (10) | Store number to be used for table partitioning. |
| 2 | DAY | P | F | Y | NUMERIC (3) | Day number to be used for table partitioning. This is derived from the sa_store_day.business_date column by calling the function SA_DATE_HASH. |
| 3 | TRAN_SEQ_NO | P | F | Y | NUMERIC (20) | The sales audit systems transaction identifier. Foreign key for SA_TRAN_HEAD. |
| 4 | TAX_CODE |  |  | Y | VARCHAR (6 BYTE) | Tax type charged in this transaction. Valid values stored on the codes table. *** |
| 5 | TAX_SEQ_NO | P |  | Y | NUMERIC (4) | Sequence number of taxes within the transaction. |
| 6 | REV_NO | P | F | Y | NUMERIC (3) | This is an incremental counter unique to each version of a transaction stored on the database. |
| 7 | TAX_AMT |  |  | Y | NUMERIC (20,4) | Amount of tax charged in this transaction. |
| 8 | ERROR_IND |  |  | Y | VARCHAR (1 BYTE) | This column is used to determine if functional errors exist for this record. |
| 9 | REF_NO17 |  |  |  | VARCHAR (30 BYTE) | This field contains any additional information about the tax that the retailer chooses to store. |
| 10 | REF_NO18 |  |  |  | VARCHAR (30 BYTE) | This field contains any additional information about the tax that the retailer chooses to store. |
| 11 | REF_NO19 |  |  |  | VARCHAR (30 BYTE) | This field contains any additional information about the tax that the retailer chooses to store. |
| 12 | REF_NO20 |  |  |  | VARCHAR (30 BYTE) | This field contains any additional information about the tax that the retailer chooses to store. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SA_TRAN_TAX_REV|PK||||TRAN_SEQ_NO|ASC|
||||||TAX_SEQ_NO|ASC|
||||||REV_NO|ASC|
||||||STORE|ASC|
||||||DAY|ASC|
|STV_UK|UK||||TRAN_SEQ_NO|ASC|
||||||TAX_CODE|ASC|
||||||REV_NO|ASC|
||||||STORE|ASC|
||||||DAY|ASC|
|PK_SA_TRAN_TAX_REV|UN||||TRAN_SEQ_NO|ASC|
||||||TAX_SEQ_NO|ASC|
||||||REV_NO|ASC|
||||||STORE|ASC|
||||||DAY|ASC|
|SA_TRAN_TAX_REV_I1|||||TRAN_SEQ_NO|ASC|
||||||REV_NO|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
||||||STORE|ASC|
||||||DAY|ASC|
|SA_TRAN_TAX_REV_I2|||||TRAN_SEQ_NO|ASC|
||||||STORE|ASC|
||||||DAY|ASC|
|STV_UK|UN||||TRAN_SEQ_NO|ASC|
||||||TAX_CODE|ASC|
||||||REV_NO|ASC|
||||||STORE|ASC|
||||||DAY|ASC|

---

## Table: SA_TRAN_TENDER

**Description:** This table that contains a record for each type of monetary instrument used by a customer in payment of store purchases (e.g., cash, gift certificate, personal check, Visa, American Express, etc.).

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | STORE | P | F | Y | NUMERIC (10) | Store number to be used for table partitioning. |
| 2 | DAY | P | F | Y | NUMERIC (3) | Day number to be used for table partitioning. This is derived from the sa_store_day.business_date column by calling the function SA_DATE_HASH. |
| 3 | TRAN_SEQ_NO | P | F | Y | NUMERIC (20) | The sales audit systems transaction identifier. Foreign key for SA_TRAN_HEAD. |
| 4 | TENDER_SEQ_NO | P |  | Y | NUMERIC (4) | The unique sequence number used to identify a tender type record for a specific transaction. |
| 5 | TENDER_TYPE_GROUP |  |  | Y | VARCHAR (6 BYTE) | Monetary instrument used to pay for this transaction. Valid values stored on the codes table. |
| 6 | TENDER_TYPE_ID |  |  | Y | NUMERIC (6) | The specific ID for the type of tender used in the transaction. |
| 7 | TENDER_AMT |  |  | Y | NUMERIC (20,4) | Amount paid with this tender type in this transaction. |
| 8 | CC_NO |  |  |  | VARCHAR (40 BYTE) | Credit card number. |
| 9 | CC_EXP_DATE |  |  |  | Date (7) | Credit card expiration date. |
| 10 | CC_AUTH_NO |  |  |  | VARCHAR (16 BYTE) | Credit card authorization number. |
| 11 | CC_AUTH_SRC |  |  |  | VARCHAR (6 BYTE) | Contains whether the authorization number was electronically transmitted or manually keyed in after obtaining it via a telephone call. The code type for this field is CCAS. |
| 12 | CC_ENTRY_MODE |  |  |  | VARCHAR (6 BYTE) | Contains the method in which the transaction was entered at the POS. Possible entry modes could include: Terminal Used, Magnetic Strip Track One Read, Magnetic Strip Two Read, Magnetic Strip One Transmitted, or Magnetic Strip Two Transmitted. The code type for this field is CCEM. |
| 13 | CC_CARDHOLDER_VERF |  |  |  | VARCHAR (6 BYTE) | Contains the method of identification that was used by the cardholder to verify their identity. Possible values include: Signature Verified (S), Card |
| 14 | CC_TERM_ID |  |  |  | VARCHAR (5 BYTE) | Contains the identification code of the terminal within the store that the transaction was transmitted. |
| 15 | CC_SPEC_COND |  |  |  | VARCHAR (6 BYTE) | Contains the special condition of the transaction (i.e. mail, phone or electronic-secured or non-secured authentication). The code type for this field is CCSC. |
| 16 | VOUCHER_NO |  |  |  | VARCHAR (25 BYTE) | Voucher serial number for the tender types of gift certificate or credit voucher, etc. |
| 17 | COUPON_NO |  |  |  | VARCHAR (40 BYTE) | Coupon number for a manufacturers coupon. |
| 18 | COUPON_REF_NO |  |  |  | VARCHAR (16 BYTE) | Holds any additional reference numbers associated with a coupon. Examples of these reference numbers might be advertising source codes, publication codes, etc. |
| 19 | REF_NO9 |  |  |  | VARCHAR (30 BYTE) | Generic field used to store information on the tender level. |
| 20 | REF_NO10 |  |  |  | VARCHAR (30 BYTE) | Generic field used to store information at the tender level. |
| 21 | REF_NO11 |  |  |  | VARCHAR (30 BYTE) | Contains any additional tender-related information that the retailer chooses to store. |
| 22 | REF_NO12 |  |  |  | VARCHAR (30 BYTE) | Contains any additional tender-related information that the retailer chooses to store. |
| 23 | ERROR_IND |  |  | Y | VARCHAR (1 BYTE) | This column is used to determine if functional errors exist for this record. |
| 24 | CHECK_ACCT_NO |  |  |  | VARCHAR (30 BYTE) | Check account number. |
| 25 | CHECK_NO |  |  |  | NUMERIC (10) | Check number. |
| 26 | IDENTI_METHOD |  |  |  | VARCHAR (6 BYTE) | Identification Method, for example Driver Licence number. The valid values can be found in CODE_DETAIL table with code_type IDMH. |
| 27 | IDENTI_ID |  |  |  | VARCHAR (40 BYTE) | Identification Id associated with the Identification method. For example, Passport no., Driver License no. etc. |
| 28 | ORIG_CURRENCY |  |  |  | VARCHAR (3 BYTE) | Original Currency code. Valid currency codes are from CURRENCIES table. |
| 29 | ORIG_CURR_AMT |  |  |  | NUMERIC (20,4) | Tender amount in original currency. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SA_TRAN_TENDER|PK||||TRAN_SEQ_NO|ASC|
||||||TENDER_SEQ_NO|ASC|
||||||STORE|ASC|
||||||DAY|ASC|
|PK_SA_TRAN_TENDER|UN||||TRAN_SEQ_NO|ASC|
||||||TENDER_SEQ_NO|ASC|
||||||STORE|ASC|
||||||DAY|ASC|
|SA_TRAN_TENDER_I2|||||TENDER_TYPE_GROUP|ASC|
||||||TENDER_TYPE_ID|ASC|
|SA_TRAN_TENDER_I3|||||ERROR_IND|ASC|
|SA_TRAN_TENDER_I1|||||TRAN_SEQ_NO|ASC|
||||||STORE|ASC|
||||||DAY|ASC|

---

## Table: SA_TRAN_TENDER_REV

**Description:** This table contains a record for each revision to the form of payment records associated with a transaction.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | STORE | P | F | Y | NUMERIC (10) | Store number to be used for table partitioning. |
| 2 | DAY | P | F | Y | NUMERIC (3) | Day number to be used for table partitioning. This is derived from the sa_store_day.business_date column by calling the function SA_DATE_HASH. |
| 3 | TRAN_SEQ_NO | P | F | Y | NUMERIC (20) | The sales audit systems transaction identifier. Foreign key for SA_TRAN_HEAD. |
| 4 | TENDER_SEQ_NO | P |  | Y | NUMERIC (4) | Unique sequence number. |
| 5 | REV_NO | P | F | Y | NUMERIC (3) | Contains an incremental counter unique to each version of a transaction stored on the database. |
| 6 | TENDER_TYPE_GROUP |  |  | Y | VARCHAR (6 BYTE) | Form of payment used in this transaction. Valid values stored on the codes table.*** |
| 7 | TENDER_TYPE_ID |  |  | Y | NUMERIC (6) | The specific ID for the type of tender used in the transaction. |
| 8 | TENDER_AMT |  |  | Y | NUMERIC (20,4) | Amount paid with this tender type in this transaction. |
| 9 | CC_NO |  |  |  | VARCHAR (40 BYTE) | Credit card number |
| 10 | CC_EXP_DATE |  |  |  | Date (7) | Credit card expiration date. |
| 11 | CC_AUTH_NO |  |  |  | VARCHAR (16 BYTE) | Credit card authorization number |
| 12 | CC_AUTH_SRC |  |  |  | VARCHAR (6 BYTE) | Contains whether the authorization number was electronically transmitted or manually keyed in after obtaining it via a telephone call. The code type for this field is CCAS. |
| 13 | CC_ENTRY_MODE |  |  |  | VARCHAR (6 BYTE) | Contains the method in which the transaction was entered at the POS. Possible entry modes could include: Terminal Used, Magnetic Strip Track One Read, Magnetic Strip Two Read, Magnetic Strip One Transmitted, or Magnetic Strip Two Transmitted. The code type for this field is CCEM. |
| 14 | CC_CARDHOLDER_VERF |  |  |  | VARCHAR (6 BYTE) | Contains the method of identification that was used by the cardholder to verify their identity. Possible values include: Signature Verified (S), Card Shown (C), PIN Entered (P), Mail Order / Phone (M). The code type for this field is CCVF. |
| 15 | CC_TERM_ID |  |  |  | VARCHAR (5 BYTE) | Contains the identification code of the terminal within the store that the transaction was transmitted. |
| 16 | CC_SPEC_COND |  |  |  | VARCHAR (6 BYTE) | Contains the special condition of the transaction (i.e. mail, phone or electronic-secured or non-secured authentication). The code type for this field is CCSC. |
| 17 | VOUCHER_NO |  |  |  | VARCHAR (25 BYTE) | Voucher serial number for tender types of gift certificate or credit voucher, etc. |
| 18 | COUPON_NO |  |  |  | VARCHAR (40 BYTE) | Coupon number for a manufacturers coupon. |
| 19 | COUPON_REF_NO |  |  |  | VARCHAR (16 BYTE) | Holds any additional reference numbers associated with a coupon. Examples of these reference numbers might be advertising source codes, publication codes, etc. |
| 20 | REF_NO9 |  |  |  | VARCHAR (30 BYTE) | Generic field used to store information on the tender level. |
| 21 | REF_NO10 |  |  |  | VARCHAR (30 BYTE) | Second generic field. |
| 22 | REF_NO11 |  |  |  | VARCHAR (30 BYTE) | Contains any additional tender-related information that the retailer chooses to store. |
| 23 | REF_NO12 |  |  |  | VARCHAR (30 BYTE) | Contains any additional tender-related information that the retailer chooses to store. |
| 24 | ERROR_IND |  |  | Y | VARCHAR (1 BYTE) | This column is used to determine if functional errors exist for this record. |
| 25 | CHECK_ACCT_NO |  |  |  | VARCHAR (30 BYTE) | Check account number. |
| 26 | CHECK_NO |  |  |  | NUMERIC (10) | Check number. |
| 27 | IDENTI_METHOD |  |  |  | VARCHAR (6 BYTE) | Identification Method, for example Driver Licence number. The valid values can be found in CODE_DETAIL table with code_type IDMH. |
| 28 | IDENTI_ID |  |  |  | VARCHAR (40 BYTE) | Identification Id associated with the Identification method. For example, Passport no., Driver License no. etc. |
| 29 | ORIG_CURRENCY |  |  |  | VARCHAR (3 BYTE) | Original Currency code. Valid currency codes are from CURRENCIES table. |
| 30 | ORIG_CURR_AMT |  |  |  | NUMERIC (20,4) | Tender amount in original currency. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SA_TRAN_TENDER_REV|PK||||TRAN_SEQ_NO|ASC|
||||||TENDER_SEQ_NO|ASC|
||||||REV_NO|ASC|
||||||STORE|ASC|
||||||DAY|ASC|
|PK_SA_TRAN_TENDER_REV|UN||||TRAN_SEQ_NO|ASC|
||||||TENDER_SEQ_NO|ASC|
||||||REV_NO|ASC|
||||||STORE|ASC|
||||||DAY|ASC|
|SA_TRAN_TENDER_REV_I2|||||TRAN_SEQ_NO|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
||||||STORE|ASC|
||||||DAY|ASC|
|SA_TRAN_TENDER_REV_I1|||||TRAN_SEQ_NO|ASC|
||||||REV_NO|ASC|
||||||STORE|ASC|
||||||DAY|ASC|
