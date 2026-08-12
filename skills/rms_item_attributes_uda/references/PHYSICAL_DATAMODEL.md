# RMS Item Attributes, UDAs & Diffs Datamodel - Physical Data Model Reference

## Table: DC_BRAND

**Description:** This table is a staging table for data conversion and will hold to display brand information of an item.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | BRAND_NAME |  |  |  | VARCHAR (30 BYTE) | This column holds the Brand name. |
| 2 | BRAND_DESCRIPTION |  |  |  | VARCHAR (120 BYTE) | This column holds the description of the Brand. |

---

## Table: DC_CLASS

**Description:** This table is a staging table for data conversion and will hold data for class table..

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEPT |  |  |  | NUMERIC (4) | Contains the number which uniquely identifies the department. |
| 2 | CLASS |  |  |  | NUMERIC (4) | Contains the number which uniquely identifies the class within the system. |
| 3 | CLASS_NAME |  |  |  | VARCHAR (120 BYTE) | Contains the name of the class which, along with the class number, identifies the class. |
| 4 | CLASS_VAT_IND |  |  |  | VARCHAR (1 BYTE) | This field determines if retail is displayed and held with or with out vat. This field is only editable when vat is turned on in the system and defined at the class level. |

---

## Table: DC_COUNTRY_ATTRIB

**Description:** This table is a staging table for data conversion and will hold data for COUNTRY_ATTRIB.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | COUNTRY_ID |  |  |  | VARCHAR (3 BYTE) | Contains a number which uniquely identifies the country. |

---

## Table: DC_DEPS

**Description:** This table is a staging table for data conversion and will hold data for department table..

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEPT |  |  |  | NUMERIC (4) | Contains the number which uniquely identifies the department. |
| 2 | DEPT_NAME |  |  |  | VARCHAR (120 BYTE) | Contains the name of the department. |
| 3 | BUYER |  |  |  | NUMERIC (4) | Contains the number which uniquely identifies the buyer for that department. |
| 4 | MERCH |  |  |  | NUMERIC (4) | Contains the number which uniquely describes the merchandiser for that department. |
| 5 | PROFIT_CALC_TYPE |  |  |  | NUMERIC (1) | Contains a number which indicates whether profit will be calculated by Direct Cost or by Retail Inventory. |
| 6 | PURCHASE_TYPE |  |  |  | NUMERIC (1) | Contains a code which indicates whether items in this department are normal merchandise, consignment stock or concession items. |
| 7 | GROUP_NO |  |  |  | NUMERIC (4) | Contains the number of the group in which the department exists. |
| 8 | MRKUP_PCT |  |  |  | NUMERIC (12,4) | Contains the default markup percentage. |
| 9 | TOTAL_MARKET_AMT |  |  |  | NUMERIC (24,4) | Contains the total market amount that is expected for the department. The field can be used for analytics or reporting. |
| 10 | MARKUP_CALC_TYPE |  |  |  | VARCHAR (2 BYTE) | Contains the code letter which determines how markup is calculated in this department. |
| 11 | OTB_CALC_TYPE |  |  |  | VARCHAR (1 BYTE) | Contains the code letter which determines how OTB is calculated in this department. |
| 12 | MAX_AVG_COUNTER |  |  |  | NUMERIC (5) | A maximum average counter will hold the maximum count of days with acceptable data to include in an Average for items within the department. |
| 13 | AVG_TOLERANCE_PCT |  |  |  | NUMERIC (12,4) | A tolerance percentage value used in averaging for items within this value. This value will set up a range for appropriate data and constrain outliers. |
| 14 | DEPT_VAT_INCL_IND |  |  |  | VARCHAR (1 BYTE) | This indicator will be be used only to default to the class level indicator when classes are initially set up for the department and will only be available when the system level class vat option is on. |
| 15 | LOWEST_STRATEGY_LEVEL |  |  |  | NUMERIC (6) | The lowest level at which a strategy may be defined. |
| 16 | WORKSHEET_LEVEL |  |  |  | NUMERIC (6) | The value in this field identifies what merchandise level should be used to build the default worksheet. This level will be either at or above the value in the lowest_strategy_level. |
| 17 | HISTORICAL_SALES_LEVEL |  |  |  | NUMERIC (6) | Determines what period should be used by the merchandise extract when extracting historical sales. |
| 18 | REGULAR_SALES_IND |  |  |  | NUMERIC (6) | The value in this field indicates if regular price sales should be included as part of the historical sales extracted by the merchandise extract. |
| 19 | CLEARANCE_SALES_IND |  |  |  | NUMERIC (6) | The value in this field indicates if clearance price sales should be included as part of the historical sales extracted by the merchandise extract. |
| 20 | PROMOTIONAL_SALES_IND |  |  |  | NUMERIC (6) | The value in this field indicates if promotional price sales should be included as part of the historical sales extracted by the merchandise extract. |
| 21 | INCLUDE_WH_ON_HAND |  |  |  | NUMERIC (6) | This indicator will be used by the merchandise extract to determine whether or not to include the warehouse on hand when calculating sell thru and price change impact. |
| 22 | INCLUDE_WH_ON_ORDER |  |  |  | NUMERIC (6) | This indicator will be used by the merchandise extract to determine whether or not to include the warehouse on order when calculating the total on order quantity. |
| 23 | PRICE_CHANGE_AMOUNT_CALC_TYPE |  |  |  | NUMERIC (6) | The value in this field determines the calculation method for the price change amount column on the worksheet and worksheet status screens. |
| 24 | RETAIL_CHG_HIGHLIGHT_DAYS |  |  |  | NUMERIC (4) | Defines a window of recent price changes the worksheet will highlight past price changes that fall within this window. |
| 25 | COST_CHG_HIGHLIGHT_DAYS |  |  |  | NUMERIC (4) | Defines a window of recent cost changes the worksheet will highlight past cost changes that fall within this window. |
| 26 | PEND_COST_CHG_WINDOW_DAYS |  |  |  | NUMERIC (4) | Defines how many days forward the worksheet will look to find upcoming cost changes. |
| 27 | PEND_COST_CHG_HIGHLIGHT_DAYS |  |  |  | NUMERIC (4) | Defines a window of upcoming cost changes the worksheet will highlight upcoming cost changes that fall within this window |

---

## Table: DC_DIFF_IDS

**Description:** This table is a staging table for data conversion and will holds all the unique differentiators defined for a differentiator type.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DIFF_ID |  |  |  | VARCHAR (10 BYTE) | Contains the code to uniquely identify a differentiator. |
| 2 | DIFF_TYPE |  |  |  | VARCHAR (6 BYTE) | This field will hold a value of the types of differentiators contained in this differentiator group. |
| 3 | DIFF_DESC |  |  |  | VARCHAR (120 BYTE) | Description of the differentiator. |
| 4 | INDUSTRY_CODE |  |  |  | VARCHAR (10 BYTE) | Can be used to hold the unique code used by industry standards to identify the differentiator. |
| 5 | INDUSTRY_SUBGROUP |  |  |  | VARCHAR (10 BYTE) | Can be used to hold a sub-grouping code used by industry standards to further identify the differentiator. |

---

## Table: DC_DISTRICT

**Description:** This table is a staging table for data conversion and will hold data for DISTRICT.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DISTRICT |  |  |  | NUMERIC (10) | Contains the number which uniquely identifies the district. |
| 2 | DISTRICT_NAME |  |  |  | VARCHAR (120 BYTE) | Contains the name of the district which, along with the district number, identifies the district. |
| 3 | REGION |  |  |  | NUMERIC (10) | Contains the number of the region of which the district is a member. |
| 4 | MGR_NAME |  |  |  | VARCHAR (120 BYTE) | Contains the name of the manager of the district. |
| 5 | CURRENCY_CODE |  |  |  | VARCHAR (3 BYTE) | This field contains the currency code under which the district operates. |

---

## Table: DC_FASHION_SKU

**Description:** This table is a staging table for data conversion and will hold style item data of ITEM_MASTER table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  |  |  | VARCHAR (25 BYTE) | Unique alphanumeric value that identifies the item. |
| 2 | PRIMARY_SKU_IND |  |  |  | VARCHAR (1 BYTE) | Identify primary sku item. |
| 3 | ITEM_PARENT |  |  |  | VARCHAR (25 BYTE) | Alphanumeric value that uniquely identifies the item/group at the level above the item. This value must exist as an item in another row on the item_master table. |
| 4 | ITEM_DESC |  |  |  | VARCHAR (250 BYTE) | Long description of the item. |
| 5 | SHORT_DESC |  |  |  | VARCHAR (120 BYTE) | Shortened description of the item. |
| 6 | ITEM_DESC_SECONDARY |  |  |  | VARCHAR (250 BYTE) | Secondary descriptions of the item. |
| 7 | COST_ZONE_GROUP_ID |  |  |  | NUMERIC (4) | Cost zone group associated with the item. This field is only required when elc_ind (landed cost indicator) is set to Y on the system_options table. |
| 8 | STANDARD_UOM |  |  |  | VARCHAR (4 BYTE) | Unit of measure in which stock of the item is tracked at a corporate level. |
| 9 | UOM_CONV_FACTOR |  |  |  | NUMERIC (20,10) | Conversion factor between an Each and the standard_uom when the standard_uom is not in the quantity class. |
| 10 | STORE_ORD_MULT |  |  |  | VARCHAR (1 BYTE) | Merchandise shipped from the warehouses to the stores must be specified in this unit type. Valid values are: C = Cases I = Inner E = Eaches. |
| 11 | COMMENTS |  |  |  | VARCHAR (2000 BYTE) | Holds any comments associated with the item. |
| 12 | MERCHANDISE_IND |  |  |  | VARCHAR (1 BYTE) | Indicates if the item is a merchandise item (Y, N). |
| 13 | FORECAST_IND |  |  |  | VARCHAR (1 BYTE) | Indicates if this item will be interfaced to an external forecasting system (Y, N). |
| 14 | DIFF_1 |  |  |  | VARCHAR (10 BYTE) | Diff_group or diff_id that differentiates the current item from its item_parent. |
| 15 | DIFF_2 |  |  |  | VARCHAR (10 BYTE) | Diff_group or diff_id that differentiates the current item from its item_parent. |
| 16 | DIFF_3 |  |  |  | VARCHAR (10 BYTE) | Diff_group or diff_id that differentiates the current item from its item_parent. |
| 17 | DIFF_4 |  |  |  | VARCHAR (10 BYTE) | Diff_group or diff_id that differentiates the current item from its item_parent. |
| 18 | AIP_CASE_TYPE |  |  |  | VARCHAR (6 BYTE) | Only used if AIP is integrated. Determines which case sizes to extract against an item in the AIP interface. |
| 19 | PERISHABLE_IND |  |  |  | VARCHAR (1 BYTE) | A grocery item attribute used to indicate whether an item is perishable or not. |
| 20 | PRODUCT_CLASSIFICATION |  |  |  | VARCHAR (6 BYTE) | Product classification is informational only in RMS, but is used by RWMS to determine how to pack customer orders : such as to determine products that may not be able to be packaged together. |
| 21 | BRAND_NAME |  |  |  | VARCHAR (30 BYTE) | This field contains the brand associated to an item. |

---

## Table: DC_FASHION_XREF

**Description:** This table is a staging table for data conversion and will hold item reference data of ITEM_MASTER table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  |  |  | VARCHAR (25 BYTE) | Unique alphanumeric value that identifies the item. |
| 2 | ITEM_DESC |  |  |  | VARCHAR (250 BYTE) | Long description of the item. |
| 3 | SHORT_DESC |  |  |  | VARCHAR (120 BYTE) | Shortened description of the item. |
| 4 | ITEM_DESC_SECONDARY |  |  |  | VARCHAR (250 BYTE) | Secondary descriptions of the item. |
| 5 | ITEM_PARENT |  |  |  | VARCHAR (25 BYTE) | Alphanumeric value that uniquely identifies the item/group at the level above the item. This value must exist as an item in another row on the item_master table. |
| 6 | ITEM_GRANDPARENT |  |  |  | VARCHAR (25 BYTE) | Alphanumeric value that uniquely identifies the item/group at the level above the item. This value must exist as both an item and an item parent inanother row on the item_master table. |
| 7 | COMMENTS |  |  |  | VARCHAR (2000 BYTE) | Holds any comments associated with the item. |
| 8 | PRIMARY_REF_ITEM_IND |  |  |  | VARCHAR (1 BYTE) | Indicates if the sub-transation level item is designated as the primary sub-transaction level item. For transaction level items and above the value in this field will be No. |
| 9 | ITEM_NUMBER_TYPE |  |  |  | VARCHAR (6 BYTE) | Code specifying what type the item is. Valid values for this field are in the code type UPCT on the code_head and code_detail tables. |
| 10 | AIP_CASE_TYPE |  |  |  | VARCHAR (6 BYTE) | Only used if AIP is integrated. Determines which case sizes to extract against an item in the AIP interface. |
| 11 | PERISHABLE_IND |  |  |  | VARCHAR (1 BYTE) | A grocery item attribute used to indicate whether an item is perishable or not. |
| 12 | PRODUCT_CLASSIFICATION |  |  |  | VARCHAR (6 BYTE) | Product classification is informational only in RMS, but is used by RWMS to determine how to pack customer orders : such as to determine products that may not be able to be packaged together. |
| 13 | BRAND_NAME |  |  |  | VARCHAR (30 BYTE) | This field contains the brand associated to an item. |

---

## Table: DC_FIF_GL_SETUP

**Description:** This table is a staging table for data conversion and will hold all the intial set-up information pertaining to Financial Application.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SET_OF_BOOKS_ID |  |  |  | NUMERIC (15) | Oracle set of books for Oracle Retail transactions. |
| 2 | LAST_UPDATE_ID |  |  |  | NUMERIC (15) | Oracle last update ID, default for all Oracle Retail transactions. |
| 3 | SEQUENCE1_DESC |  |  |  | VARCHAR (20 BYTE) | Contains description for sequence columns on the interface cross reference form. |
| 4 | SEQUENCE2_DESC |  |  |  | VARCHAR (20 BYTE) | Contains description for sequence columns on the interface cross reference form. |
| 5 | SEQUENCE3_DESC |  |  |  | VARCHAR (20 BYTE) | Contains description for sequence columns on the interface cross reference form. |
| 6 | SEQUENCE4_DESC |  |  |  | VARCHAR (20 BYTE) | Contains description for sequence columns on the interface cross reference form. |
| 7 | SEQUENCE5_DESC |  |  |  | VARCHAR (20 BYTE) | Contains description for sequence columns on the interface cross reference form. |
| 8 | SEQUENCE6_DESC |  |  |  | VARCHAR (20 BYTE) | Contains description for sequence columns on the interface cross reference form. |
| 9 | SEQUENCE7_DESC |  |  |  | VARCHAR (20 BYTE) | Contains description for sequence columns on the interface cross reference form. |
| 10 | SEQUENCE8_DESC |  |  |  | VARCHAR (20 BYTE) | Contains description for sequence columns on the interface cross reference form. |
| 11 | SEQUENCE9_DESC |  |  |  | VARCHAR (20 BYTE) | Contains description for sequence columns on the interface cross reference form. |
| 12 | SEQUENCE10_DESC |  |  |  | VARCHAR (20 BYTE) | Contains description for sequence columns on the interface cross reference form. |
| 13 | CATEGORY_ID |  |  |  | NUMERIC (38) | Oracle category ID, default for Oracle Retail purchase order feed. |
| 14 | DELIVER_TO_LOCATION_ID |  |  |  | NUMERIC (15) | Oracle location_id, default for Oracle Retail purchase order feed. |
| 15 | DESTINATION_ORGANIZATION_ID |  |  |  | NUMERIC (38) | Oracle organization_id, default for Oracle Retail purchase order feed. |
| 16 | PERIOD_NAME |  |  |  | VARCHAR (15 BYTE) | This denotes the user entered accounting period name as defined in Financial Applications |
| 17 | SET_OF_BOOKS_DESC |  |  |  | VARCHAR (120 BYTE) | Set Of Books Description. |
| 18 | CURRENCY_CODE |  |  |  | VARCHAR (3 BYTE) | Currency code for the Set Of Book ID. |

---

## Table: DC_FREIGHT_SIZE

**Description:** This table is a staging table for data conversion and will hold data for FREIGHT_SIZE which is attached to transportation records.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | FREIGHT_SIZE |  |  |  | VARCHAR (6 BYTE) | Contains the unique key that identifies the freight size record. |
| 2 | FREIGHT_SIZE_DESC |  |  |  | VARCHAR (250 BYTE) | Contains the description of the freight size. |

---

## Table: DC_FREIGHT_TERMS

**Description:** This table is a staging table for data conversion and will hold data for FREIGHT_TERMS table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | FREIGHT_TERMS |  |  |  | VARCHAR (30 BYTE) | Contains a number that uniquely identifies the freight terms. |
| 2 | TERM_DESC |  |  |  | VARCHAR (240 BYTE) | Contains a description of the freight terms used in the system. |
| 3 | START_DATE_ACTIVE |  |  |  | Date (7) | Indicates the date for assigning an active date to the Freight Terms. |
| 4 | END_DATE_ACTIVE |  |  |  | Date (7) | Indicates the date for assigning an inactive date to the Freight Terms. |
| 5 | ENABLED_FLAG |  |  |  | VARCHAR (1 BYTE) | Indicates whether the freight terms are valid or invalid within the respective application. The values would be either (Y)es or (N)o. |

---

## Table: DC_FREIGHT_TYPE

**Description:** This table is a staging table for data conversion and will hold data for FREIGHT_TYPE which is attached to transportation records.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | FREIGHT_TYPE |  |  |  | VARCHAR (6 BYTE) | Contains the unique key that identifies the freight type record. |
| 2 | FREIGHT_TYPE_DESC |  |  |  | VARCHAR (250 BYTE) | Contains the description of the freight type. |

---

## Table: DC_GROCERY_VARIANT

**Description:** This table is a staging table for data conversion and will hold product line variant data of ITEM_MASTER table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  |  |  | VARCHAR (25 BYTE) | Unique alphanumeric value that identifies the item. |
| 2 | ITEM_NUMBER_TYPE |  |  |  | VARCHAR (6 BYTE) | Code specifying what type the item is. Valid values for this field are in the code type UPCT on the code_head and code_detail tables. |
| 3 | FORMAT_ID |  |  |  | VARCHAR (1 BYTE) | This field will hold the format ID that corresponds to the items variable UPC. |
| 4 | PREFIX |  |  |  | NUMERIC (2) | This column holds the prefix for variable weight UPCs. |
| 5 | ITEM_DESC |  |  |  | VARCHAR (250 BYTE) | Long description of the item. |
| 6 | SHORT_DESC |  |  |  | VARCHAR (120 BYTE) | Shortened description of the item. |
| 7 | ITEM_DESC_SECONDARY |  |  |  | VARCHAR (250 BYTE) | Secondary descriptions of the item. |
| 8 | ITEM_PARENT |  |  |  | VARCHAR (25 BYTE) | Alphanumeric value that uniquely identifies the item/group at the level above the item. This value must exist as an item in another row on the item_master table. |
| 9 | ITEM_GRANDPARENT |  |  |  | VARCHAR (25 BYTE) | Alphanumeric value that uniquely identifies the item/group at the level above the item. This value must exist as both an item and an item parent inanother row on the item_master table. |
| 10 | PRIMARY_REF_ITEM_IND |  |  |  | VARCHAR (1 BYTE) | Indicates if the sub-transation level item is designated as the primary sub-transaction level item. For transaction level items and above the value in this field will be No. |
| 11 | AIP_CASE_TYPE |  |  |  | VARCHAR (6 BYTE) | Only used if AIP is integrated. Determines which case sizes to extract against an item in the AIP interface. |
| 12 | COMMENTS |  |  |  | VARCHAR (2000 BYTE) | Holds any comments associated with the item. |
| 13 | PRODUCT_CLASSIFICATION |  |  |  | VARCHAR (6 BYTE) | Product classification is informational only in RMS, but is used by RWMS to determine how to pack customer orders : such as to determine products that may not be able to be packaged together. |
| 14 | BRAND_NAME |  |  |  | VARCHAR (30 BYTE) | This field contains the brand associated to an item. |

---

## Table: DC_HARDLINES

**Description:** This table is a staging table for data conversion and will hold hardlines item.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  |  |  | VARCHAR (25 BYTE) | Unique alphanumeric value that identifies the item. |
| 2 | ITEM_DESC |  |  |  | VARCHAR (250 BYTE) | Long description of the item. |
| 3 | SHORT_DESC |  |  |  | VARCHAR (120 BYTE) | Shortened description of the item. |
| 4 | ITEM_DESC_SECONDARY |  |  |  | VARCHAR (250 BYTE) | Secondary descriptions of the item. |
| 5 | DEPT |  |  |  | NUMERIC (4) | Number identifying the department to which the item is attached. |
| 6 | CLASS |  |  |  | NUMERIC (4) | Number identifying the class to which the item is attached. |
| 7 | SUBCLASS |  |  |  | NUMERIC (4) | Number identifying the subclass to which the item is attached. |
| 8 | COST_ZONE_GROUP_ID |  |  |  | NUMERIC (4) | Cost zone group associated with the item. This field is only required when elc_ind (landed cost indicator) is set to Y on the system_options table. |
| 9 | UOM_CONV_FACTOR |  |  |  | NUMERIC (20,10) | Conversion factor between an Each and the standard_uom when the standard_uom is not in the quantity class. |
| 10 | STANDARD_UOM |  |  |  | VARCHAR (4 BYTE) | Unit of measure in which stock of the item is tracked at a corporate level. |
| 11 | STORE_ORD_MULT |  |  |  | VARCHAR (1 BYTE) | Merchandise shipped from the warehouses to the stores must be specified in this unit type. Valid values are: C = Cases I = Inner E = Eaches. |
| 12 | COMMENTS |  |  |  | VARCHAR (2000 BYTE) | Holds any comments associated with the item. |
| 13 | MERCHANDISE_IND |  |  |  | VARCHAR (1 BYTE) | Indicates if the item is a merchandise item (Y, N). |
| 14 | FORECAST_IND |  |  |  | VARCHAR (1 BYTE) | Indicates if this item will be interfaced to an external forecasting system (Y, N). |
| 15 | AIP_CASE_TYPE |  |  |  | VARCHAR (6 BYTE) | Only used if AIP is integrated. Determines which case sizes to extract against an item in the AIP interface. |
| 16 | PRODUCT_CLASSIFICATION |  |  |  | VARCHAR (6 BYTE) | Product classification is informational only in RMS, but is used by RWMS to determine how to pack customer orders : such as to determine products that may not be able to be packaged together. |
| 17 | BRAND_NAME |  |  |  | VARCHAR (30 BYTE) | This field contains the brand associated to an item. |

---

## Table: DC_HARDLINES_XREF

**Description:** This table is a staging table for data conversion and will hold hardlines reference data.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  |  |  | VARCHAR (25) | Unique alphanumeric value that identifies the item. |
| 2 | ITEM_DESC |  |  |  | VARCHAR (250) | Long description of the item. |
| 3 | SHORT_DESC |  |  |  | VARCHAR (120) | Shortened description of the item. |
| 4 | ITEM_DESC_SECONDARY |  |  |  | VARCHAR (250) | Secondary descriptions of the item. |
| 5 | ITEM_PARENT |  |  |  | VARCHAR (25) | Alphanumeric value that uniquely identifies the item/group at the level above the item. This value must exist as an item in another row on the item_master table. |
| 6 | COMMENTS |  |  |  | VARCHAR (2000) | Holds any comments associated with the item. |
| 7 | PRIMARY_REF_ITEM_IND |  |  |  | VARCHAR (1) | Indicates if the sub-transation level item is designated as the primary sub-transaction level item. For transaction level items and above the value in this field will be No. |
| 8 | ITEM_NUMBER_TYPE |  |  |  | VARCHAR (6) | Code specifying what type the item is. Valid values for this field are in the code type UPCT on the code_head and code_detail tables. |
| 9 | AIP_CASE_TYPE |  |  |  | VARCHAR (6) | Only used if AIP is integrated. Determines which case sizes to extract against an item in the AIP interface. |
| 10 | PRODUCT_CLASSIFICATION |  |  |  | VARCHAR (6) | Product classification is informational only in RMS, but is used by RWMS to determine how to pack customer orders : such as to determine products that may not be able to be packaged together. |
| 11 | BRAND_NAME |  |  |  | VARCHAR (30) | This field contains the brand associated to an item. |

---

## Table: DC_ITEM_COST_DETAIL

**Description:** This table is a staging table for data conversion and will hold data of ITEM_COST_DETAIL table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  |  |  | VARCHAR (25) | Unique alphanumeric value that identifies the item. |
| 2 | SUPPLIER |  |  |  | NUMERIC (10) | The unique identifier for the supplier. |
| 3 | ORIGIN_COUNTRY_ID |  |  |  | VARCHAR (3) | The country where the item was manufactured or significantly altered. |
| 4 | DELIVERY_COUNTRY_ID |  |  |  | VARCHAR (3) | Country to which the item will be delivered to. |
| 5 | COND_TYPE |  |  |  | VARCHAR (10) | This will hold the condition type applicable on the items cost. |
| 6 | COND_VALUE |  |  |  | NUMERIC (20,4) | This will hold the condition value or tax amount per of the corresponding condition. |
| 7 | APPLIED_ON |  |  |  | NUMERIC (20,4) | This will hold the cost on which a particular condition should be applied. |
| 8 | COMP_RATE |  |  |  | NUMERIC (20,10) | This will hold the rate of the condition applied. |
| 9 | CALCULATION_BASIS |  |  |  | VARCHAR (1) | Indicates if the comp_rate is a percentage or an amount value. Valid values are: P - percent, V - amount value. |
| 10 | RECOVERABLE_AMOUNT |  |  |  | NUMERIC (20,4) | Hold the recoverable amount of tax applied on the item. |
| 11 | MODIFIED_TAXABLE_BASE |  |  |  | NUMERIC (20,4) | This column will hold the cost on which the taxes were applied. |

---

## Table: DC_ITEM_COST_HEAD

**Description:** This table is a staging table for data conversion and will hold data of ITEM_COST_HEAD table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  |  |  | VARCHAR (25) | Unique alphanumeric value that identifies the item. |
| 2 | SUPPLIER |  |  |  | NUMERIC (10) | The unique identifier for the supplier. |
| 3 | ORIGIN_COUNTRY_ID |  |  |  | VARCHAR (3) | The country where the item was manufactured or significantly altered. |
| 4 | DELIVERY_COUNTRY_ID |  |  |  | VARCHAR (3) | Country to which the item will be delivered to. |
| 5 | PRIM_DLVY_CTRY_IND |  |  |  | VARCHAR (1) | Indicates if the country is the primary delivery country of the item. |
| 6 | NIC_STATIC_IND |  |  |  | VARCHAR (1) | Indicates if the Negotiated Item Cost (NIC) is static or not. |
| 7 | BASE_COST |  |  |  | NUMERIC (20,4) | This will hold the tax exclusive cost of the item. |
| 8 | NEGOTIATED_ITEM_COST |  |  |  | NUMERIC (20,4) | This will hold the supplier negotiated item cost. |
| 9 | EXTENDED_BASE_COST |  |  |  | NUMERIC (20,4) | This will hold the extended base cost of the item. |
| 10 | INCLUSIVE_COST |  |  |  | NUMERIC (20,4) | This will hold the inclusive cost of the item. |

---

## Table: DC_ITEM_COUNTRY

**Description:** This table is a staging table for data conversion and will hold data of ITEM_COUNTRY.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  |  |  | VARCHAR (25) | Alphanumeric value that identifies either the item or item parent. |
| 2 | COUNTRY_ID |  |  |  | VARCHAR (3) | This column contains the unique code that identifies the country, which is associated with the item. |

---

## Table: DC_ITEM_LOC

**Description:** This table is a staging table for data conversion and will hold data of item_loc table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  |  |  | VARCHAR (25) | Unique alphanumeric value that identifies the item. |
| 2 | LOCATION |  |  |  | NUMERIC (10) | Numeric identifier of the location in which the item is to be found. |
| 3 | LOC_TYPE |  |  |  | VARCHAR (1) | Type of location in the location field. Valid values are S (store), W (warehouse), and E (external finisher). |
| 4 | PRIMARY_LOC_IND |  |  |  | VARCHAR (1) | Store/Warehouse locations of the retailer in a country where a given supplier is the primary or main supplier of an item. |
| 5 | SELLING_UNIT_RETAIL |  |  |  | NUMERIC (20,4) | Contains the unit retail price in the selling unit of measure for the item/location combination. This field is stored in the local currency. |
| 6 | SELLING_UOM |  |  |  | VARCHAR (4) | Contains the selling unit of measure for an items single-unit retail. |
| 7 | TAXABLE_IND |  |  |  | VARCHAR (1) | Indicates if item is taxable at the store(Y/N). |
| 8 | LOCAL_ITEM_DESC |  |  |  | VARCHAR (250) | Contains the local description of the item. |
| 9 | LOCAL_SHORT_DESC |  |  |  | VARCHAR (120) | Contains the local short description of the item. |
| 10 | TI |  |  |  | NUMERIC (12,4) | Number of shipping units (cases) that make up one tier of a pallet. |
| 11 | HI |  |  |  | NUMERIC (12,4) | Number of tiers that make up a complete pallet (height). |
| 12 | STORE_ORD_MULT |  |  |  | VARCHAR (1) | This column contains the multiple in which the item needs to be shipped from a warehouse to the location. |
| 13 | MEAS_OF_EACH |  |  |  | NUMERIC (12,4) | Size of an each in terms of the uom_of_price. |
| 14 | MEAS_OF_PRICE |  |  |  | NUMERIC (12,4) | Size to be used on the ticket in terms of the uom_of_price. |
| 15 | UOM_OF_PRICE |  |  |  | VARCHAR (4) | Unit of measure that will be used on the ticket for this item. |
| 16 | PRIMARY_COST_PACK |  |  |  | VARCHAR (25) | This field contains an item number that is a simple pack containing the item in the item column for this record. |
| 17 | INBOUND_HANDLING_DAYS |  |  |  | NUMERIC (2) | This field indicates the number of inbound handling days for an item at a warehouse type location. |
| 18 | SOURCE_WH |  |  |  | NUMERIC (10) | This value will be used by the ad-hoc PO/Transfer creation process to determine which warehouse to fill the stores request from. |
| 19 | SOURCE_METHOD |  |  |  | VARCHAR (1) | This value will be used to specify how the adhoc PO/TSF creation process should source the item/location request. |
| 20 | MULTI_UNITS |  |  |  | NUMERIC (12,4) | This field contains the multi-units for the item/location (zone) combination. |
| 21 | MULTI_UNIT_RETAIL |  |  |  | NUMERIC (20,4) | This field holds the multi-unit retail in the multi-selling unit of measure for the item/location (zone) combination. |
| 22 | MULTI_SELLING_UOM |  |  |  | VARCHAR (4) | This field holds the selling unit of measure for this item/location (zone) combinations multiunit retail. |
| 23 | AVERAGE_WEIGHT |  |  |  | NUMERIC (12,4) | A new field to hold the average simple pack weight for a catch weight simple pack. |
| 24 | UIN_TYPE |  |  |  | VARCHAR (6) | This column will contain the unique identification number (UIN) used to identify the instances of the item at the location. |
| 25 | UIN_LABEL |  |  |  | VARCHAR (6) | This column will contain the label for the UIN when displayed in SIM. |
| 26 | CAPTURE_TIME |  |  |  | VARCHAR (6) | This column will indicate when the UIN should be captured for an item during transaction processing. |
| 27 | EXT_UIN_IND |  |  |  | VARCHAR (1) | This Yes/No indicator indicates if UIN is being generated in the external system. |

---

## Table: DC_ITEM_SEASONS

**Description:** This table is a staging table for data conversion and will hold data of ITEM_SEASONS.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  |  |  | VARCHAR (25) | Unique alphanumeric value that identifies the item. |
| 2 | SEASON_ID |  |  |  | NUMERIC (3) | The season identifier. |
| 3 | PHASE_ID |  |  |  | NUMERIC (3) | The phase identifier. |

---

## Table: DC_ITEM_SUPPLIER

**Description:** This table is a staging table for data conversion and will hold data of ITEM_SUPPLIER.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  |  |  | VARCHAR (25) | Unique alphanumeric value that identifies the item. |
| 2 | SUPPLIER |  |  |  | NUMERIC (10) | This field contains the number of the supplier of the item. |
| 3 | PALLET_NAME |  |  |  | VARCHAR (6) | Code referencing the name used by supplier to refer to the pallet. Valid codes are defined in the PALN code type. |
| 4 | CASE_NAME |  |  |  | VARCHAR (6) | Code referencing the name used by supplier to refer to the case. Valid codes are defined in the CASN code type. |
| 5 | INNER_NAME |  |  |  | VARCHAR (6) | Code referencing the name used by supplier to refer to the inner. Valid codes are defined in the INRN code type. |
| 6 | DIRECT_SHIP_IND |  |  |  | VARCHAR (1) | This field will contain a value of Yes to indicate that any item asssociated with this supplier is eligible for a direct shipment from the supplier to the customer. |
| 7 | VPN |  |  |  | VARCHAR (30) | This field contains the Vendor Product Number associated with this item. |
| 8 | CONCESSION_RATE |  |  |  | NUMERIC (12,4) | The concession rate is the margin that a particular supplier receives for the sale of a concession item. |
| 9 | SUPP_LABEL |  |  |  | VARCHAR (15) | This field will hold the supplier label for an item. |
| 10 | CONSIGNMENT_RATE |  |  |  | NUMERIC (12,4) | This field contains the consignment rate for this item for the supplier. |
| 11 | PRIMARY_SUPP_IND |  |  |  | VARCHAR (1) | This field Indicates whether this supplier is the primary supplier for the item. |

---

## Table: DC_ITEM_SUPP_COUNTRY

**Description:** This table is a staging table for data conversion and will hold data of ITEM_SUPP_COUNTRY table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  |  |  | VARCHAR (25) | Unique alphanumeric value that identifies the item. |
| 2 | SUPPLIER |  |  |  | NUMERIC (10) | The unique identifier for the supplier. |
| 3 | ORIGIN_COUNTRY_ID |  |  |  | VARCHAR (3) | The country where the item was manufactured or significantly altered. |
| 4 | UNIT_COST |  |  |  | NUMERIC (20,4) | This field contains the current corporate unit cost for the SKU from the supplier/origin country. This field is stored in the suppliers currency. |
| 5 | SUPP_PACK_SIZE |  |  |  | NUMERIC (12,4) | This field contains the quantity that orders must be placed in multiples of for the supplier for the item. |
| 6 | INNER_PACK_SIZE |  |  |  | NUMERIC (12,4) | This field contains the units of an item contained in an inner pack supplied by the supplier. |
| 7 | ROUND_LVL |  |  |  | VARCHAR (6) | This column will be used to determine how order quantities will be rounded to Case, Layer and Pallet. |
| 8 | ROUND_TO_INNER_PCT |  |  |  | NUMERIC (12,4) | This column will hold the Inner Rounding Threshold value. |
| 9 | ROUND_TO_CASE_PCT |  |  |  | NUMERIC (12,4) | This column will hold the Case Rounding Threshold value. |
| 10 | ROUND_TO_LAYER_PCT |  |  |  | NUMERIC (12,4) | This column will hold the Layer Rounding Threshold value. |
| 11 | ROUND_TO_PALLET_PCT |  |  |  | NUMERIC (12,4) | This column will hold the Pallet Rounding Threshold value. |
| 12 | MIN_ORDER_QTY |  |  |  | NUMERIC (12,4) | This field contains the minimum quantity that can be ordered at one time from the supplier for the item. |
| 13 | MAX_ORDER_QTY |  |  |  | NUMERIC (12,4) | This field contains the maximum quantity that can be ordered at one time from the supplier for the item. |
| 14 | PRIMARY_COUNTRY_IND |  |  |  | VARCHAR (1) | This field indicates whether this country is the primary country for the item/supplier. |
| 15 | TI |  |  |  | NUMERIC (12,4) | Number of shipping units (cases) that make up one tier of a pallet. |
| 16 | HI |  |  |  | NUMERIC (12,4) | Number of tiers that make up a complete pallet (height). |
| 17 | COST_UOM |  |  |  | VARCHAR (4) | A cost UOM is held to allow costs to be managed in a separate UOM to the standard UOM. |
| 18 | LEAD_TIME |  |  |  | NUMERIC (4) | This field indicates the number of days that will elapse between the date an order is written for the item and the date it is ready for shipment from |
| 19 | PACKING_METHOD |  |  |  | VARCHAR (6) | This field indicates whether the packing method of the item in the container is Flat or Hanging. |
| 20 | DEFAULT_UOP |  |  |  | VARCHAR (6) | Contains the default unit of purchase for the item/supplier/country. |
| 21 | NEGOTIATED_ITEM_COST |  |  |  | NUMERIC (20,4) | This will hold the supplier negotiated item cost for the primary delivery country of the item. |
| 22 | EXTENDED_BASE_COST |  |  |  | NUMERIC (20,4) | This will hold the extended base cost for the primary delivery country of the item. |
| 23 | INCLUSIVE_COST |  |  |  | NUMERIC (20,4) | This will hold the inclusive cost for the primary delivery country of the item. |
| 24 | BASE_COST |  |  |  | NUMERIC (20,4) | This field will hold the tax exclusive cost of the item. |

---

## Table: DC_ITEM_SUPP_COUNTRY_DIM

**Description:** This table is a staging table for data conversion and will hold data of ITEM_SUPP_COUNTRY_DIM table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  |  |  | VARCHAR (25) | Unique alphanumeric value that identifies the item. |
| 2 | SUPPLIER |  |  |  | NUMERIC (10) | The unique identifier for the supplier. |
| 3 | ORIGIN_COUNTRY_ID |  |  |  | VARCHAR (3) | The country where the item was manufactured or significantly altered. |
| 4 | DIM_OBJECT |  |  |  | VARCHAR (6) | Specific object whose dimensions are specified in this record (e.g. case, pallet, each). |
| 5 | PRESENTATION_METHOD |  |  |  | VARCHAR (6) | Describes the packaging (if any) being taken into consideration in the specified dimensions. |
| 6 | LENGTH |  |  |  | NUMERIC (12,4) | Length of dim_object measured in units specified in lwh_uom. |
| 7 | WIDTH |  |  |  | NUMERIC (12,4) | Width of dim_object measured in units specified in lwh_uom. |
| 8 | HEIGHT |  |  |  | NUMERIC (12,4) | Height of dim_object measured in units specified in lwh_uom. |
| 9 | LWH_UOM |  |  |  | VARCHAR (4) | Unit of measurement for length, width, and height (e.g. inches, centimeters, feet). |
| 10 | WEIGHT |  |  |  | NUMERIC (12,4) | Weight of dim_object measured in units specified in weight_uom. |
| 11 | NET_WEIGHT |  |  |  | NUMERIC (12,4) | Net weight of the dim_object (weight without packaging) measured in units specified in weight_uom. |
| 12 | WEIGHT_UOM |  |  |  | VARCHAR (4) | Unit of measurement for weight (e.g. pounds, kilograms). |
| 13 | LIQUID_VOLUME |  |  |  | NUMERIC (12,4) | Liquid volume, or capacity, of dim_object measured in units specified in volume_uom. |
| 14 | LIQUID_VOLUME_UOM |  |  |  | VARCHAR (4) | Unit of measurement for liquid_volume (e.g. ounces, liters). Liquid volumes are only convertible to other liquid volumes. |
| 15 | STAT_CUBE |  |  |  | NUMERIC (12,4) | Statistical value of the dim_objects dimensions to be used for loading purposes. |
| 16 | TARE_WEIGHT |  |  |  | NUMERIC (12,4) | Amount of weight to be subtracted for packaging materials. |
| 17 | TARE_TYPE |  |  |  | VARCHAR (6) | Indicates if tare weight for this dim_object is wet or dry. |

---

## Table: DC_ITEM_SUPP_MANU_COUNTRY

**Description:** This table is a staging table for data conversion and will hold data of ITEM_SUPP_MANU_COUNTRY.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  |  |  | VARCHAR (25) | Alphanumeric value that identifies either the item or item parent. |
| 2 | SUPPLIER |  |  |  | NUMERIC (10) | The unique identifier for the supplier. |
| 3 | MANU_COUNTRY_ID |  |  |  | VARCHAR (3) | The country where the item was manufactured. |
| 4 | PRIMARY_MANU_CTRY_IND |  |  |  | VARCHAR (1) | This field indicates whether this country is the primary country of manufacture for the item/supplier. |

---

## Table: DC_ITEM_TICKET

**Description:** This table is a staging table for data conversion and will hold style item data of ITEM_MASTER table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  |  |  | VARCHAR (25) | Unique alphanumeric value that identifies the item. |
| 2 | TICKET_TYPE_ID |  |  |  | VARCHAR (4) | Long description of the item. |
| 3 | PRINT_ON_PC_IND |  |  |  | VARCHAR (1) | Shortened description of the item. |
| 4 | PO_PRINT_TYPE |  |  |  | VARCHAR (1) | Secondary descriptions of the item. |
| 5 | TICKET_OVER_PCT |  |  |  | NUMERIC (12,4) | Number identifying the department to which the item is attached. |

---

## Table: DC_MERCH_DEFAULTS

**Description:** This table is a staging table for data conversion and will hold default data for merchandising details..

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEFAULT_CLASS |  |  |  | VARCHAR (1) | Default class indicator either Y or N |
| 2 | DEFAULT_SUBCLASS |  |  |  | VARCHAR (1) | Default sub class indicator either Y or N |
| 3 | DEPT_PROFIT_CALC_TYPE |  |  |  | NUMERIC (1) | Contains a number which indicates whether profit will be calculated by Direct Cost or by Retail Inventory. |
| 4 | DEPT_PURCHASE_TYPE |  |  |  | NUMERIC (1) | Contains a code which indicates whether items in this department are normal merchandise, consignment stock or concession items. |
| 5 | DEPT_MRKUP_PCT |  |  |  | NUMERIC (12,4) | Contains the default markup percentage. |
| 6 | DEPT_MARKUP_CALC_TYPE |  |  |  | VARCHAR (2) | Contains the code letter which determines how markup is calculated in this department. |
| 7 | DEPT_OTB_CALC_TYPE |  |  |  | VARCHAR (1) | Contains the code letter which determines how OTB is calculated in this department. |
| 8 | DEPT_VAT_INCL_IND |  |  |  | VARCHAR (1) | This indicator will be be used only to default to the class level indicator when classes are initially set up for the department and will only be available when the system level class vat option is on. When vat is turned on in the system and not defined at the class level, this field defaults to Y. When vat is turned off in the system, this field defaults to N. |
| 9 | CLASS_VAT_INCL_IND |  |  |  | VARCHAR (1) | This field determines if retail is displayed and held with or without vat. This field is only editable when vat is turned on in the system and defined at the class level, when that is the case the field can vary between Y and N by class. When vat is turned on in the system and not defined at the class level, this field defaults to Y. When vat is turned off in the system, this field defaults to N. |

---

## Table: DC_ORDERABLE_PACK

**Description:** This table is a staging table for data conversion and will hold the orderable pack item information.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  |  |  | VARCHAR (25) | Unique alphanumeric value that identifies the item. |
| 2 | DIFF_1 |  |  |  | VARCHAR (10) | Diff_group or diff_id that differentiates the current item from its item_parent. |
| 3 | DIFF_2 |  |  |  | VARCHAR (10) | Diff_group or diff_id that differentiates the current item from its item_parent. |
| 4 | DIFF_3 |  |  |  | VARCHAR (10) | Diff_group or diff_id that differentiates the current item from its item_parent. |
| 5 | DIFF_4 |  |  |  | VARCHAR (10) | Diff_group or diff_id that differentiates the current item from its item_parent. |
| 6 | DEPT |  |  |  | NUMERIC (4) | Number identifying the department to which the item is attached. |
| 7 | CLASS |  |  |  | NUMERIC (4) | Number identifying the class to which the item is attached. |
| 8 | SUBCLASS |  |  |  | NUMERIC (4) | Number identifying the subclass to which the item is attached. |
| 9 | ITEM_DESC |  |  |  | VARCHAR (250) | Long description of the item. |
| 10 | SHORT_DESC |  |  |  | VARCHAR (120) | Shortened description of the item. |
| 11 | ITEM_DESC_SECONDARY |  |  |  | VARCHAR (250) | Secondary descriptions of the item. |
| 12 | COST_ZONE_GROUP_ID |  |  |  | NUMERIC (4) | Cost zone group associated with the item. |
| 13 | PACKAGE_SIZE |  |  |  | NUMERIC (12,4) | Holds the size of the product printed on any packaging. |
| 14 | PACKAGE_UOM |  |  |  | VARCHAR (4) | Holds the unit of measure associated with the package size. |
| 15 | STORE_ORD_MULT |  |  |  | VARCHAR (1) | Merchandise shipped from the warehouses to the stores must be specified in this unit type. |
| 16 | MFG_REC_RETAIL |  |  |  | NUMERIC (20,4) | Manufacturers recommended retail price for the item. |
| 17 | RETAIL_LABEL_TYPE |  |  |  | VARCHAR (6) | This field indicates any special lable type associated with an item |
| 18 | RETAIL_LABEL_VALUE |  |  |  | NUMERIC (20,4) | This field represents the value associated with the retail label type. |
| 19 | HANDLING_TEMP |  |  |  | VARCHAR (6) | Holds the temperature information associated with the item. |
| 20 | HANDLING_SENSITIVITY |  |  |  | VARCHAR (6) | Holds the sensitivity information associated with the item. |
| 21 | CATCH_WEIGHT_IND |  |  |  | VARCHAR (1) | Indiactes whether the item should be weighed when it arrives at a location. |
| 22 | SIMPLE_PACK_IND |  |  |  | VARCHAR (1) | Indicates if pack item is a simple pack or not. |
| 23 | SELLABLE_IND |  |  |  | VARCHAR (1) | Indicates if pack item may be sold as a unit. |
| 24 | PACK_TYPE |  |  |  | VARCHAR (1) | Indicates if pack item is a vendor pack or a buyer pack. |
| 25 | ORDER_AS_TYPE |  |  |  | VARCHAR (1) | Indicates if pack item is receivable at the component level or at the pack level. |
| 26 | COMMENTS |  |  |  | VARCHAR (2000) | Holds any comments associated with the item. |
| 27 | ORDER_TYPE |  |  |  | VARCHAR (6) | This determines how catch weight items are ordered. |
| 28 | SALE_TYPE |  |  |  | VARCHAR (6) | This indicates the method of how catch weight items are sold in store locations. |
| 29 | PERISHABLE_IND |  |  |  | VARCHAR (1) | A grocery item attribute used to indicate whether an item is perishable or not. |
| 30 | NOTIONAL_PACK_IND |  |  |  | VARCHAR (1) | This is to indicate that the pack item should post the transaction at pack level in SIM. |
| 31 | SOH_INQUIRY_AT_PACK_IND |  |  |  | VARCHAR (1) | This indicates to show the stock on hand at pack level in downstream applications when it is called in POS from SIM. |
| 32 | PRODUCT_CLASSIFICATION |  |  |  | VARCHAR (6) | Product classification is informational only in RMS, but is used by RWMS to determine how to pack customer orders |
| 33 | BRAND_NAME |  |  |  | VARCHAR (30) | This field contains the brand associated to an item |

---

## Table: DC_ORG_UNIT

**Description:** This table is a staging table for data conversion and will hold the oracle organizational unit values.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ORG_UNIT_ID |  |  |  | NUMERIC (15) | holds the oracle organizational unit ID. |
| 2 | DESCRIPTION |  |  |  | VARCHAR (120) | holds the organizational unit description. |
| 3 | SET_OF_BOOKS_ID |  |  |  | NUMERIC (15) | Set of Books Id. |

---

## Table: DC_PACK_COMPONENT

**Description:** This table is a staging table for data conversion and will holds the pack and its component.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PACK_NO |  |  |  | VARCHAR (25) | Alphanumeric value that uniquely identifies the pack for which details are held in this table. |
| 2 | ITEM |  |  |  | VARCHAR (25) | Alphanumeric value that identifies the component item within the pack. |
| 3 | PACK_ITEM_QTY |  |  |  | NUMERIC (12,4) | Contains the quantity of component items within the pack. |

---

## Table: DC_PACK_XREF

**Description:** This table is a staging table for data conversion and will hold the pack xref information

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  |  |  | VARCHAR (25) | Unique alphanumeric value that identifies the item. |
| 2 | ITEM_DESC |  |  |  | VARCHAR (250) | Long description of the item. |
| 3 | SHORT_DESC |  |  |  | VARCHAR (120) | Shortened description of the item. |
| 4 | ITEM_DESC_SECONDARY |  |  |  | VARCHAR (250) | Secondary descriptions of the item. |
| 5 | ITEM_PARENT |  |  |  | VARCHAR (25) | Alphanumeric value that uniquely identifies the item/group at the level above the item. |
| 6 | COMMENTS |  |  |  | VARCHAR (2000) | Holds any comments associated with the item. |
| 7 | PRIMARY_REF_ITEM_IND |  |  |  | VARCHAR (1) | Indicates if the sub-transation level item is designated as the primary sub-transaction level item. |
| 8 | ITEM_NUMBER_TYPE |  |  |  | VARCHAR (6) | Code specifying what type the item is. |
| 9 | FORMAT_ID |  |  |  | VARCHAR (1) | This field will hold the format ID that corresponds to the items variable UPC. |
| 10 | PREFIX |  |  |  | NUMERIC (2) | This column holds the prefix for variable weight UPCs. |
| 11 | PERISHABLE_IND |  |  |  | VARCHAR (1) | A grocery item attribute used to indicate whether an item is perishable or not. |
| 12 | NOTIONAL_PACK_IND |  |  |  | VARCHAR (1) | This is to indicate that the pack item should post the transaction at pack level in SIM. |
| 13 | SOH_INQUIRY_AT_PACK_IND |  |  |  | VARCHAR (1) | This indicates to show the stock on hand at pack level in downstream applications when it is called in POS from SIM. |

---

## Table: DC_PARTNER

**Description:** This table is a staging table for data conversion and will hold the partner information.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PARTNER_TYPE |  |  |  | VARCHAR (6) | Specifies the type of partner. |
| 2 | PARTNER_ID |  |  |  | VARCHAR (10) | Unique identifying number for a partner within the system. |
| 3 | PARTNER_DESC |  |  |  | VARCHAR (240) | Contains the partners description or name. |
| 4 | CURRENCY_CODE |  |  |  | VARCHAR (3) | Contains a code identifying the currency the partner uses for business transactions. |
| 5 | LANG |  |  |  | NUMERIC (6) | This field contains the partners preferred language. |
| 6 | STATUS |  |  |  | VARCHAR (1) | Determines whether the partner is currently active. |
| 7 | CONTACT_NAME |  |  |  | VARCHAR (120) | Contains the name of the partners representative contract. |
| 8 | CONTACT_PHONE |  |  |  | VARCHAR (20) | Contains the phone number of the partners representative contact. |
| 9 | CONTACT_FAX |  |  |  | VARCHAR (20) | Contains the fax number of the partners representative contact. |
| 10 | CONTACT_TELEX |  |  |  | VARCHAR (20) | Contains the telex number of the partners representative contact. |
| 11 | CONTACT_EMAIL |  |  |  | VARCHAR (100) | Contains the e-mail address of the partners representative contact. |
| 12 | MFG_ID |  |  |  | VARCHAR (18) | Contains the manufacturers tax identification number. |
| 13 | PRINCIPLE_COUNTRY_ID |  |  |  | VARCHAR (3) | Contains the country id to which the partner is assigned. |
| 14 | LINE_OF_CREDIT |  |  |  | NUMERIC (20,4) | Contains the line of credit the company has at the Bank in the Partners currency. |
| 15 | OUTSTAND_CREDIT |  |  |  | NUMERIC (20,4) | Contains the total amount of credit that the company has used or has charged against in the Partners currency. |
| 16 | OPEN_CREDIT |  |  |  | NUMERIC (20,4) | Contains the total amount that the company can still charge against in the Partners currency. |
| 17 | YTD_CREDIT |  |  |  | NUMERIC (20,4) | Contains the total amount of credit the company has used this year to date in the Partners currency. |
| 18 | YTD_DRAWDOWNS |  |  |  | NUMERIC (20,4) | Contains the year to date payments the bank has made on behalf of the company in the Partners currency. |
| 19 | TAX_ID |  |  |  | VARCHAR (18) | Contains the unique tax identification number of the partner. |
| 20 | TERMS |  |  |  | VARCHAR (15) | Payment terms for the partner. |
| 21 | SERVICE_PERF_REQ_IND |  |  |  | VARCHAR (1) | Indicates if the expense vendors services (e.g. snowplowing, window washing) must be confirmed as performed before paying an invoice from that expense vendor. |
| 22 | INVC_PAY_LOC |  |  |  | VARCHAR (6) | Indicates where invoices from this expense vendor are paid - at the store or centrally through corporate accounting. |
| 23 | INVC_RECEIVE_LOC |  |  |  | VARCHAR (6) | Indicates where invoices from this expense vendor are received - at the store or centrally through corporate accounting. |
| 24 | IMPORT_COUNTRY_ID |  |  |  | VARCHAR (3) | Import country of the Import Authority. |
| 25 | PRIMARY_IA_IND |  |  |  | VARCHAR (1) | Indicates if an Import Authority is the primary Import Authority for an import country. |
| 26 | COMMENT_DESC |  |  |  | VARCHAR (2000) | Contains any comments associated with the Partner. |
| 27 | TSF_ENTITY_ID |  |  |  | NUMERIC (10) | ID of the transfer entity with which an external finisher (partner_type = E) is associated. |
| 28 | VAT_REGION |  |  |  | NUMERIC (4) | VAT (value added tax) region with which a partner is associated. Valid values will be found on the VAT_REGION table. |
| 29 | ORG_UNIT_ID |  |  |  | NUMERIC (15) | Org Unit Id |
| 30 | PARTNER_NAME_SECONDARY |  |  |  | VARCHAR (240) | This wil hold the secondary name of the partner. |
| 31 | AUTO_RECEIVE_IND |  |  |  | VARCHAR (1) | This will indicate whether the system will update the stock for the external finisher when the 1st leg of the transfer is shipped. |

---

## Table: DC_PARTNER_ADDR

**Description:** This table is a staging table for data conversion and will hold the partner address information.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | KEY_VALUE_1 |  |  |  | VARCHAR (20) | This column contains specific ID or type that the address is attached to. |
| 2 | KEY_VALUE_2 |  |  |  | VARCHAR (20) | If the module is Partner (PTNR), then this field will contain the partners ID, else this field will be null. |
| 3 | ADDR_TYPE |  |  |  | VARCHAR (2) | This column indicates the type for the address. |
| 4 | PRIMARY_ADDR_IND |  |  |  | VARCHAR (1) | This column indicates whether the address is the primary address for the address type. |
| 5 | CONTACT_NAME |  |  |  | VARCHAR (120) | Contains the name of the partners representative contract. |
| 6 | CONTACT_PHONE |  |  |  | VARCHAR (20) | Contains the phone number of the partners representative contact. |
| 7 | CONTACT_FAX |  |  |  | VARCHAR (20) | Contains the fax number of the partners representative contact. |
| 8 | CONTACT_EMAIL |  |  |  | VARCHAR (100) | Contains the e-mail address of the partners representative contact. |
| 9 | CONTACT_TELEX |  |  |  | VARCHAR (20) | Contains the telex number of the partners representative contact. |
| 10 | ADD_1 |  |  |  | VARCHAR (240) | This column contains the first line of the address. |
| 11 | ADD_2 |  |  |  | VARCHAR (240) | This column contains the second line of the address. |
| 12 | ADD_3 |  |  |  | VARCHAR (240) | This column contains the third line of the address. |
| 13 | CITY |  |  |  | VARCHAR (120) | This column contains the name of the city that is associated with the address. |
| 14 | COUNTY |  |  |  | VARCHAR (250) | This column holds the county name for the location. |
| 15 | STATE |  |  |  | VARCHAR (3) | This column contains the state abbreviation for the address. |
| 16 | POST |  |  |  | VARCHAR (30) | This column contains the zip code for the address. |
| 17 | COUNTRY_ID |  |  |  | VARCHAR (3) | This column contains the country where the address exists. |
| 18 | JURISDICTION_CODE |  |  |  | VARCHAR (10) | Identifies the jurisdiction code for the country-state relationship. |

---

## Table: DC_PARTNER_ORG_UNIT

**Description:** This table is a staging table for data conversion and will hold data for PARTNER_ORG_UNIT.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PARTNER |  |  |  | NUMERIC (10) | contains either Suppler or Supplier Site. |
| 2 | ORG_UNIT_ID |  |  |  | NUMERIC (15) | Contains org_unit_id |
| 3 | PARTNER_TYPE |  |  |  | VARCHAR (1) | Identifies the type of the partner. S for Supplier and U for Supplier Site. |
| 4 | PRIMARY_PAY_SITE |  |  |  | VARCHAR (1) | Primary payment site indicator. |

---

## Table: DC_PRICE_HIST

**Description:** This table is a staging table for data conversion and will hold data of PRICE_HIST.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  |  |  | VARCHAR (25) | Alphanumeric value that identifies either the item or item parent. |
| 2 | UNIT_RETAIL |  |  |  | NUMERIC (20,4) | Contains the current single unit retail in the standard unit of measure. |
| 3 | SELLING_UOM |  |  |  | VARCHAR (4) | Contains the selling unit of measure for an items single-unit retail. |

---

## Table: DC_PRODUCT

**Description:** This table is a staging table for data conversion and will hold style item data of ITEM_MASTER table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  |  |  | VARCHAR (25) | Unique alphanumeric value that identifies the item. |
| 2 | PRIMARY_PRODUCT_IND |  |  |  | VARCHAR (1) | Identify primary product item. |
| 3 | ITEM_PARENT |  |  |  | VARCHAR (25) | Alphanumeric value that uniquely identifies the item/group at the level above the item. This value must exist as an item in another row on the item_master table. |
| 4 | ITEM_DESC |  |  |  | VARCHAR (250) | Long description of the item. |
| 5 | SHORT_DESC |  |  |  | VARCHAR (120) | Shortened description of the item. |
| 6 | ITEM_DESC_SECONDARY |  |  |  | VARCHAR (250) | Secondary descriptions of the item. |
| 7 | COST_ZONE_GROUP_ID |  |  |  | NUMERIC (4) | Cost zone group associated with the item. This field is only required when elc_ind (landed cost indicator) is set to Y on the system_options table. |
| 8 | UOM_CONV_FACTOR |  |  |  | NUMERIC (20,10) | Conversion factor between an Each and the standard_uom when the standard_uom is not in the quantity class. |
| 9 | STANDARD_UOM |  |  |  | VARCHAR (4) | Unit of measure in which stock of the item is tracked at a corporate level. |
| 10 | STORE_ORD_MULT |  |  |  | VARCHAR (1) | Merchandise shipped from the warehouses to the stores must be specified in this unit type. Valid values are: C = Cases I = Inner E = Eaches. |
| 11 | MERCHANDISE_IND |  |  |  | VARCHAR (1) | Indicates if the item is a merchandise item (Y, N). |
| 12 | FORECAST_IND |  |  |  | VARCHAR (1) | Indicates if this item will be interfaced to an external forecasting system (Y, N). |
| 13 | DIFF_1 |  |  |  | VARCHAR (10) | Diff_group or diff_id that differentiates the current item from its item_parent. |
| 14 | DIFF_2 |  |  |  | VARCHAR (10) | Diff_group or diff_id that differentiates the current item from its item_parent. |
| 15 | DIFF_3 |  |  |  | VARCHAR (10) | Diff_group or diff_id that differentiates the current item from its item_parent. |
| 16 | DIFF_4 |  |  |  | VARCHAR (10) | Diff_group or diff_id that differentiates the current item from its item_parent. |
| 17 | CATCH_WEIGHT_IND |  |  |  | VARCHAR (1) | Indiactes whether the item should be weighed when it verage at a location. Valid values for this field are Y and N. |
| 18 | HANDLING_TEMP |  |  |  | VARCHAR (6) | Holds the temperature information associated with the item. Valid values for this field are in the code type HTMP on the code_head and code_detail tables. |
| 19 | HANDLING_SENSITIVITY |  |  |  | VARCHAR (6) | Holds the sensitivity information associated with the item. |
| 20 | WASTE_TYPE |  |  |  | VARCHAR (6) | Identifies the wastage type as either sales or spoilage wastage. Sales wastage occurs during processes that make an item saleable |
| 21 | WASTE_PCT |  |  |  | NUMERIC (12,4) | Average percent of wastage for the item over its shelf life. Used in inflating the retail price for wastage items. |
| 22 | DEFAULT_WASTE_PCT |  |  |  | NUMERIC (12,4) | Default daily wastage percent for spoilage type wastage items. |
| 23 | PACKAGE_SIZE |  |  |  | NUMERIC (12,4) | Holds the size of the product printed on any packaging. |
| 24 | PACKAGE_UOM |  |  |  | VARCHAR (4) | Holds the unit of measure associated with the package size. |
| 25 | DEPOSIT_ITEM_TYPE |  |  |  | VARCHAR (6) | This is the deposit item component type. A NULL value in this field indicates that this item is not part of a deposit item relationship. |
| 26 | CONTAINER_ITEM |  |  |  | VARCHAR (25) | This holds the container item number for a contents item. This field is only populated and required if the DEPOSIT_ITEM_TYPE = E. |
| 27 | DEPOSIT_IN_PRICE_PER_UOM |  |  |  | VARCHAR (6) | This field indicates if the deposit amount is included in the price per UOM calculation for a contents item ticket. |
| 28 | RETAIL_LABEL_TYPE |  |  |  | VARCHAR (6) | This field indicates any special lable type assoctiated with an item. |
| 29 | RETAIL_LABEL_VALUE |  |  |  | NUMERIC (20,4) | This field represents the value associated with the retail label type. |
| 30 | COMMENTS |  |  |  | VARCHAR (2000) | Holds any comments associated with the item. |
| 31 | AIP_CASE_TYPE |  |  |  | VARCHAR (6) | Only used if AIP is integrated. Determines which case sizes to extract against an item in the AIP interface. |
| 32 | PERISHABLE_IND |  |  |  | VARCHAR (1) | A grocery item attribute used to indicate whether an item is perishable or not. |
| 33 | PRODUCT_CLASSIFICATION |  |  |  | VARCHAR (6) | Product classification is informational only in RMS, but is used by RWMS to determine how to pack customer orders : such as to determine products that may not be able to be packaged together. |
| 34 | BRAND_NAME |  |  |  | VARCHAR (30) | This field contains the brand associated to an item. |

---

## Table: DC_PRODUCT_LINE

**Description:** This table is a staging table for data conversion and will hold style item data of ITEM_MASTER table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  |  |  | VARCHAR (25) | Unique alphanumeric value that identifies the item. |
| 2 | ITEM_DESC |  |  |  | VARCHAR (250) | Long description of the item. |
| 3 | SHORT_DESC |  |  |  | VARCHAR (120) | Shortened description of the item. |
| 4 | ITEM_DESC_SECONDARY |  |  |  | VARCHAR (250) | Secondary descriptions of the item. |
| 5 | DEPT |  |  |  | NUMERIC (4) | Number identifying the department to which the item is attached. |
| 6 | CLASS |  |  |  | NUMERIC (4) | Number identifying the class to which the item is attached. |
| 7 | SUBCLASS |  |  |  | NUMERIC (4) | Number identifying the subclass to which the item is attached. |
| 8 | DIFF_1 |  |  |  | VARCHAR (10) | Diff_group or diff_id that differentiates the current item from its item_parent. |
| 9 | DIFF_2 |  |  |  | VARCHAR (10) | Diff_group or diff_id that differentiates the current item from its item_parent. |
| 10 | DIFF_3 |  |  |  | VARCHAR (10) | Diff_group or diff_id that differentiates the current item from its item_parent. |
| 11 | DIFF_4 |  |  |  | VARCHAR (10) | Diff_group or diff_id that differentiates the current item from its item_parent. |
| 12 | ITEM_AGGREGATE_IND |  |  |  | VARCHAR (1) | Indicator to aggregate inventory and sales for the item. |
| 13 | DIFF_1_AGGREGATE_IND |  |  |  | VARCHAR (1) | Indicator for the corresponding diff. Indicator to aggregate inventory and sales for an item at Parent/Diff level (e.g Style/Color or Style/Size ). This indicator is currently used by allocation and MFP. |
| 14 | DIFF_2_AGGREGATE_IND |  |  |  | VARCHAR (1) | Indicator for the corresponding diff. Indicator to aggregate inventory and sales for an item at Parent/Diff level (e.g Style/Color or Style/Size ). This indicator is currently used by allocation and MFP. |
| 15 | DIFF_3_AGGREGATE_IND |  |  |  | VARCHAR (1) | Indicator for the corresponding diff. Indicator to aggregate inventory and sales for an item at Parent/Diff level (e.g Style/Color or Style/Size ). This indicator is currently used by allocation and MFP. |
| 16 | DIFF_4_AGGREGATE_IND |  |  |  | VARCHAR (1) | Indicator for the corresponding diff. Indicator to aggregate inventory and sales for an item at Parent/Diff level (e.g Style/Color or Style/Size ). This indicator is currently used by allocation and MFP. |
| 17 | AIP_CASE_TYPE |  |  |  | VARCHAR (6) | Only used if AIP is integrated. Determines which case sizes to extract against an item in the AIP interface. |
| 18 | COMMENTS |  |  |  | VARCHAR (2000) | Holds any comments associated with the item. |
| 19 | PRODUCT_CLASSIFICATION |  |  |  | VARCHAR (6) | Product classification is informational only in RMS, but is used by RWMS to determine how to pack customer orders : such as to determine |
| 20 | BRAND_NAME |  |  |  | VARCHAR (30) | This field contains the brand associated to an item. |

---

## Table: DC_PWH

**Description:** This table is a staging table for data conversion and will hold the physical warehouse information.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | WH |  |  |  | NUMERIC (10) | Contains the number which uniquely identifies the warehouse. |
| 2 | WH_NAME |  |  |  | VARCHAR (150) | Contains the name of the warehouse which, along with the warehouse number, identifies the warehouse. |
| 3 | PRIMARY_VWH |  |  |  | NUMERIC (10) | This field holds the virtual warehouse that will be used as the basis for all transactions for which only a physical warehouse and not a virtual warehouse has not been specified. |
| 4 | CURRENCY_CODE |  |  |  | VARCHAR (3) | This field contains the currency code under which the warehouse operates. |
| 5 | BREAK_PACK_IND |  |  |  | VARCHAR (1) | Indicates whether or not the warehouse is capable of distributing less than the supplier case quantity. |
| 6 | REDIST_WH_IND |  |  |  | VARCHAR (1) | Indicates that the warehouse is a Re- Distribution warehouse. |
| 7 | DELIVERY_POLICY |  |  |  | VARCHAR (6) | Contains the delivery policy of the warehouse. Next Day indicates that if a location is closed, the warehouse will deliver on the next day. |
| 8 | FORECAST_WH_IND |  |  |  | VARCHAR (1) | This indicator determines if a warehouse is forecastable. |
| 9 | REPL_IND |  |  |  | VARCHAR (1) | This indicator determines if a warehouse is replenishable. |
| 10 | REPL_WH_LINK |  |  |  | NUMERIC (10) | This field holds the replenishable warehouse that is linked to this virtual warehouse. |
| 11 | IB_IND |  |  |  | VARCHAR (1) | This field indicates if the warehouse is an investment buy warehouse. |
| 12 | IB_WH_LINK |  |  |  | NUMERIC (10) | This field contains the investment buy warehouse that is linked to the virtual warehouse. |
| 13 | AUTO_IB_CLEAR |  |  |  | VARCHAR (1) | This indicator determines if the investment buys inventory should be automatically transferred to the turn (replenishable) warehouse when an order is received by the turn warehouse. |
| 14 | INBOUND_HANDLING_DAYS |  |  |  | NUMERIC (2) | Warehouse inbound handling days are defined as the number of days that the warehouse requires to receive any item and get it to the shelf so that it is ready to pick. |
| 15 | WH_NAME_SECONDARY |  |  |  | VARCHAR (150) | Secondary name of the warehouse. |
| 16 | EMAIL |  |  |  | VARCHAR (100) | Holds the email address for the location. |
| 17 | VAT_REGION |  |  |  | NUMERIC (4) | Contains the number of the Value Added Tax region in which this warehouse is located. |
| 18 | ORG_HIER_TYPE |  |  |  | NUMERIC (4) | Contains the organization type that will be used in reporting purposes for the warehouse. The type comes from the organizational hierarchy. |
| 19 | ORG_HIER_VALUE |  |  |  | NUMERIC (10) | Contains the code associated with the specific organizational hierarchy type. |
| 20 | DUNS_LOC |  |  |  | VARCHAR (4) | This field holds the Dun and Bradstreet number to identify the location. |
| 21 | DUNS_NUMBER |  |  |  | VARCHAR (9) | This field holds the Dun and Bradstreet number to identify the warehouse |
| 22 | ORG_UNIT_ID |  |  |  | NUMERIC (15) | This column will hold the oracle organizational unit id value. |
| 23 | ORG_ENTITY_TYPE |  |  |  | VARCHAR (1) | This is the new column that will specify if the warehouse is a legal entity (Importer, Exporter) or a regular warehouse. |

---

## Table: DC_REGION

**Description:** This table is a staging table for data conversion and will hold data for REGION.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | REGION |  |  |  | NUMERIC (10) | Contains the number which uniquely identifies the region. |
| 2 | REGION_NAME |  |  |  | VARCHAR (120) | Contains the name of the region which, along with the region number, identifies the region. |
| 3 | AREA |  |  |  | NUMERIC (10) | Contains the number of the area of which the region is a member. |
| 4 | MGR_NAME |  |  |  | VARCHAR (120) | Contains the name of the manager of the region. |
| 5 | CURRENCY_CODE |  |  |  | VARCHAR (3) | This field contains the currency code under which the region operates. |

---

## Table: DC_RELATED_ITEM_DETAIL

**Description:** This table is a staging table for data conversion and will hold related item information which needs to be passed to ORPOS.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | RELATIONSHIP_ID |  |  |  | NUMERIC (20) | The relationship id for the item. |
| 2 | RELATED_ITEM |  |  |  | VARCHAR (25) | Item id of the related item. |
| 3 | PRIORITY |  |  |  | NUMERIC (4) | In case of multiple related substitute items, this column could be used (optional) to define relative priority. |
| 4 | START_DATE |  |  |  | Date | From this date related item can be used on transactions. |
| 5 | END_DATE |  |  |  | Date | Till this date related item can be used on transactions. |

---

## Table: DC_RELATED_ITEM_HEAD

**Description:** This table is a staging table for data conversion and will contain one row for each item and relationship type (Cross Sell, Sub Sell, Substitute etc).

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | RELATIONSHIP_ID |  |  |  | NUMERIC (20) | Unique identifier for each relationship header. |
| 2 | ITEM |  |  |  | VARCHAR (25) | Unique alphanumeric value that identifies the item. |
| 3 | RELATIONSHIP_NAME |  |  |  | VARCHAR (255) | Name given to the relationship. |
| 4 | RELATIONSHIP_TYPE |  |  |  | VARCHAR (6) | Describes the type of relationship. Values are configured in code_detail table under code_type IREL. |
| 5 | MANDATORY_IND |  |  |  | VARCHAR (1) | Indicates whether the relationship is mandatory. |

---

## Table: DC_SELLABLE_PACK

**Description:** This table is a staging table for data conversion and will hold the sellable pack item information.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  |  |  | VARCHAR (25) | Unique alphanumeric value that identifies the item. |
| 2 | DIFF_1 |  |  |  | VARCHAR (10) | Diff_group or diff_id that differentiates the current item from its item_parent. |
| 3 | DIFF_2 |  |  |  | VARCHAR (10) | Diff_group or diff_id that differentiates the current item from its item_parent. |
| 4 | DIFF_3 |  |  |  | VARCHAR (10) | Diff_group or diff_id that differentiates the current item from its item_parent. |
| 5 | DIFF_4 |  |  |  | VARCHAR (10) | Diff_group or diff_id that differentiates the current item from its item_parent. |
| 6 | DEPT |  |  |  | NUMERIC (4) | Number identifying the department to which the item is attached. |
| 7 | CLASS |  |  |  | NUMERIC (4) | Number identifying the class to which the item is attached. |
| 8 | SUBCLASS |  |  |  | NUMERIC (4) | Number identifying the subclass to which the item is attached. |
| 9 | ITEM_DESC |  |  |  | VARCHAR (250) | Long description of the item. |
| 10 | SHORT_DESC |  |  |  | VARCHAR (120) | Shortened description of the item. |
| 11 | ITEM_DESC_SECONDARY |  |  |  | VARCHAR (250) | Secondary descriptions of the item. |
| 12 | PACKAGE_SIZE |  |  |  | NUMERIC (12,4) | Holds the size of the product printed on any packaging. |
| 13 | PACKAGE_UOM |  |  |  | VARCHAR (4) | Holds the unit of measure associated with the package size. |
| 14 | MFG_REC_RETAIL |  |  |  | NUMERIC (20,4) | Manufacturers recommended retail price for the item. |
| 15 | RETAIL_LABEL_TYPE |  |  |  | VARCHAR (6) | This field indicates any special lable type associated with an item |
| 16 | RETAIL_LABEL_VALUE |  |  |  | NUMERIC (20,4) | This field represents the value associated with the retail label type. |
| 17 | HANDLING_TEMP |  |  |  | VARCHAR (6) | Holds the temperature information associated with the item. |
| 18 | HANDLING_SENSITIVITY |  |  |  | VARCHAR (6) | Holds the sensitivity information associated with the item. |
| 19 | UNIT_RETAIL |  |  |  | NUMERIC (20,4) | Indicates if pack item is receivable at the component level or at the pack level. |
| 20 | COMMENTS |  |  |  | VARCHAR (2000) | Holds any comments associated with the item. |
| 21 | PERISHABLE_IND |  |  |  | VARCHAR (1) | A grocery item attribute used to indicate whether an item is perishable or not. |
| 22 | NOTIONAL_PACK_IND |  |  |  | VARCHAR (1) | This is to indicate that the pack item should post the transaction at pack level in SIM. |
| 23 | SOH_INQUIRY_AT_PACK_IND |  |  |  | VARCHAR (1) | This indicates to show the stock on hand at pack level in downstream applications when it is called in POS from SIM. |
| 24 | PRODUCT_CLASSIFICATION |  |  |  | VARCHAR (6) | Product classification is informational only in RMS, but is used by RWMS to determine how to pack customer orders |
| 25 | BRAND_NAME |  |  |  | VARCHAR (30) | This field contains the brand associated to an item |

---

## Table: DC_STORE_ADD

**Description:** This table is a staging table for data conversion and will hold one row for each new store to be created in the merchandising system.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | STORE |  |  |  | NUMERIC (10) | Contains the number which uniquely identifies the store. |
| 2 | STORE_NAME |  |  |  | VARCHAR (150) | Contains the name of the store which, along with the store number, identifies the store. |
| 3 | STORE_NAME10 |  |  |  | VARCHAR (10) | Contains a ten character abbreviation of the store name. |
| 4 | STORE_NAME3 |  |  |  | VARCHAR (3) | Contains a three character abbreviation of the store name. |
| 5 | STORE_CLASS |  |  |  | VARCHAR (1) | Contains the code letter indicating the class of which the store is a member. |
| 6 | STORE_MGR_NAME |  |  |  | VARCHAR (120) | Contains the name of the store manager. |
| 7 | STORE_OPEN_DATE |  |  |  | Date | Contains the date on which the store opened. |
| 8 | STOCKHOLDING_IND |  |  |  | VARCHAR (1) | This column indicates whether the store can hold stock. |
| 9 | DISTRICT |  |  |  | NUMERIC (10) | Contains the number of the district in which the store is a member. |
| 10 | START_ORDER_DAYS |  |  |  | NUMERIC (3) | Contains the number of days before the store_open_date that the store will begin accepting orders. |
| 11 | CURRENCY_CODE |  |  |  | VARCHAR (3) | This field contains the currency code under which the store operates. |
| 12 | LANG |  |  |  | NUMERIC (6) | This column identifies the language to be used for the given store. |
| 13 | COPY_REPL_IND |  |  |  | VARCHAR (1) | Indicator to determine if replenishment info should be copied to the new store. |
| 14 | TRAN_NO_GENERATED |  |  |  | VARCHAR (6) | Contains the level at which unique POS transaction numbers are generated. |
| 15 | INTEGRATED_POS_IND |  |  |  | VARCHAR (1) | Indicates whether or not the POS system at the Store is integrated. |
| 16 | COPY_ACTIVITY_IND |  |  |  | VARCHAR (1) | This field indicates if the like stores closing date schedule should be copied in the creation of a new store based on a like store. |
| 17 | COPY_DLVRY_IND |  |  |  | VARCHAR (1) | This field indicates if the like stores delivery schedule should be copied in the creation of a new store based on a like store. |
| 18 | STORE_NAME_SECONDARY |  |  |  | VARCHAR (150) | Secondary name of the store. |
| 19 | STORE_CLOSE_DATE |  |  |  | Date | Contains the date on which the store closed. |
| 20 | ACQUIRED_DATE |  |  |  | Date | Contains the date on which the store was acquired. |
| 21 | REMODEL_DATE |  |  |  | Date | Contains the date on which the store was last remodeled. |
| 22 | FAX_NUMBER |  |  |  | VARCHAR (20) | Contains the fax number for the store. |
| 23 | PHONE_NUMBER |  |  |  | VARCHAR (20) | Contains the phone number for the store. |
| 24 | EMAIL |  |  |  | VARCHAR (100) | Holds the email address for the location |
| 25 | TOTAL_SQUARE_FT |  |  |  | NUMERIC (8) | Contains the total square footage of the store. |
| 26 | SELLING_SQUARE_FT |  |  |  | NUMERIC (8) | Contains the total square footage of the stores selling area. |
| 27 | LINEAR_DISTANCE |  |  |  | NUMERIC (8) | Holds the total merchandisable space of the location. |
| 28 | VAT_REGION |  |  |  | NUMERIC (4) | Contains the number of the Value Added Tax region in which this store is contained. |
| 29 | VAT_INCLUDE_IND |  |  |  | VARCHAR (1) | Indicates whether or not Value Added Tax will be included in the retail prices for the store. |
| 30 | CHANNEL_ID |  |  |  | NUMERIC (4) | In a multichannel environment this will contain the channel with which the store is associated. |
| 31 | STORE_FORMAT |  |  |  | NUMERIC (4) | Contains the number indicating the format of the store. |
| 32 | MALL_NAME |  |  |  | VARCHAR (120) | Contains the name of the mall in which the store is located. |
| 33 | TRANSFER_ZONE |  |  |  | NUMERIC (4) | Contains the transfer zone in which the store is located. |
| 34 | DEFAULT_WH |  |  |  | NUMERIC (10) | Contains the number of the warehouse that may be used as the default for creating crossdock masks. |
| 35 | STOP_ORDER_DAYS |  |  |  | NUMERIC (3) | Contains the number of days before a store closing that the store will stop accepting orders. |
| 36 | DUNS_NUMBER |  |  |  | VARCHAR (9) | This field holds the Dun and Bradstreet number to identify the store. |
| 37 | DUNS_LOC |  |  |  | VARCHAR (4) | This field holds the Dun and Bradstreet number to identify the location |
| 38 | SISTER_STORE |  |  |  | NUMERIC (10) | This field will hold a store number which will be used to relate the current store to the historical data of an existing store. |
| 39 | TSF_ENTITY_ID |  |  |  | NUMERIC (10) | Transfer Entity ID |
| 40 | ORG_UNIT_ID |  |  |  | NUMERIC (15) | Column will contain the organizational unit ID value. |
| 41 | STORE_TYPE |  |  |  | VARCHAR (6) | This will indicate whether a particular store is a franchise or company store. |
| 42 | WF_CUSTOMER_ID |  |  |  | NUMERIC (10) | Numeric Id of the customer. |
| 43 | AUTO_APPROVE_ORDERS_IND |  |  |  | VARCHAR (1) | This column will indicate whether the client is allowing automatic receipt for the store. Valid values are Y (Yes), N (No), D (System Default). Default value is D. |
| 44 | TIMEZONE_NAME |  |  |  | VARCHAR (64) | Indicates the time zone of the store. |
| 45 | CUSTOMER_ORDER_LOC_IND |  |  |  | VARCHAR (1) | This Column determines whether the location is customer order location or not. |
| 46 | PROCESS_MODE |  |  |  | VARCHAR (5) | The mode (ASYNC or BATCH) in which the like-store part of this store needs to be processed. |
| 47 | PROCESS_STATUS |  |  |  | VARCHAR (25) | The status of this store add process. |

---

## Table: DC_STORE_ADDR

**Description:** This table is a staging table for data conversion and will hold the store address information.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | KEY_VALUE_1 |  |  |  | VARCHAR (20) | This column contains specific ID or type that the address is attached to. |
| 2 | ADDR_TYPE |  |  |  | VARCHAR (2) | This column indicates the type for the address. |
| 3 | PRIMARY_ADDR_IND |  |  |  | VARCHAR (1) | This column indicates whether the address is the primary address for the address type. |
| 4 | CONTACT_NAME |  |  |  | VARCHAR (120) | Contains the name of the partners representative contract. |
| 5 | CONTACT_PHONE |  |  |  | VARCHAR (20) | Contains the phone number of the partners representative contact. |
| 6 | CONTACT_FAX |  |  |  | VARCHAR (20) | Contains the fax number of the partners representative contact. |
| 7 | CONTACT_EMAIL |  |  |  | VARCHAR (100) | Contains the e-mail address of the partners representative contact. |
| 8 | CONTACT_TELEX |  |  |  | VARCHAR (20) | Contains the telex number of the partners representative contact. |
| 9 | ADD_1 |  |  |  | VARCHAR (240) | This column contains the first line of the address. |
| 10 | ADD_2 |  |  |  | VARCHAR (240) | This column contains the second line of the address. |
| 11 | ADD_3 |  |  |  | VARCHAR (240) | This column contains the third line of the address. |
| 12 | CITY |  |  |  | VARCHAR (120) | This column contains the name of the city that is associated with the address. |
| 13 | COUNTY |  |  |  | VARCHAR (250) | This column holds the county name for the location. |
| 14 | STATE |  |  |  | VARCHAR (3) | This column contains the state abbreviation for the address. |
| 15 | POST |  |  |  | VARCHAR (30) | This column contains the zip code for the address. |
| 16 | COUNTRY_ID |  |  |  | VARCHAR (3) | This column contains the country where the address exists. |
| 17 | JURISDICTION_CODE |  |  |  | VARCHAR (10) | Identifies the jurisdiction code for the country-state relationship. |

---

## Table: DC_STYLE

**Description:** This table is a staging table for data conversion and will hold style item data of ITEM_MASTER table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  |  |  | VARCHAR (25) | Unique alphanumeric value that identifies the item. |
| 2 | ITEM_DESC |  |  |  | VARCHAR (250) | Long description of the item. |
| 3 | SHORT_DESC |  |  |  | VARCHAR (120) | Shortened description of the item. |
| 4 | ITEM_DESC_SECONDARY |  |  |  | VARCHAR (250) | Secondary descriptions of the item. |
| 5 | DEPT |  |  |  | NUMERIC (4) | Number identifying the department to which the item is attached. |
| 6 | CLASS |  |  |  | NUMERIC (4) | Number identifying the class to which the item is attached. |
| 7 | SUBCLASS |  |  |  | NUMERIC (4) | Number identifying the subclass to which the item is attached. |
| 8 | DIFF_1 |  |  |  | VARCHAR (10) | Diff_group or diff_id that differentiates the current item from its item_parent. |
| 9 | DIFF_2 |  |  |  | VARCHAR (10) | Diff_group or diff_id that differentiates the current item from its item_parent. |
| 10 | DIFF_3 |  |  |  | VARCHAR (10) | Diff_group or diff_id that differentiates the current item from its item_parent. |
| 11 | DIFF_4 |  |  |  | VARCHAR (10) | Diff_group or diff_id that differentiates the current item from its item_parent. |
| 12 | ITEM_AGGREGATE_IND |  |  |  | VARCHAR (1) | Indicator to aggregate inventory and sales for the item. |
| 13 | DIFF_1_AGGREGATE_IND |  |  |  | VARCHAR (1) | Indicator for the corresponding diff. Indicator to aggregate inventory and sales for an item at Parent/Diff level (e.g Style/Color or Style/Size ). This indicator is currently used by allocation and MFP. |
| 14 | DIFF_2_AGGREGATE_IND |  |  |  | VARCHAR (1) | Indicator for the corresponding diff. Indicator to aggregate inventory and sales for an item at Parent/Diff level (e.g Style/Color or Style/Size ). This indicator is currently used by allocation and MFP. |
| 15 | DIFF_3_AGGREGATE_IND |  |  |  | VARCHAR (1) | Indicator for the corresponding diff. Indicator to aggregate inventory and sales for an item at Parent/Diff level (e.g Style/Color or Style/Size ). This indicator is currently used by allocation and MFP. |
| 16 | DIFF_4_AGGREGATE_IND |  |  |  | VARCHAR (1) | Indicator for the corresponding diff. Indicator to aggregate inventory and sales for an item at Parent/Diff level (e.g Style/Color or Style/Size ). This indicator is currently used by allocation and MFP. |
| 17 | AIP_CASE_TYPE |  |  |  | VARCHAR (6) | Only used if AIP is integrated. Determines which case sizes to extract against an item in the AIP interface. |
| 18 | COMMENTS |  |  |  | VARCHAR (2000) | Holds any comments associated with the item. |
| 19 | PERISHABLE_IND |  |  |  | VARCHAR (1) | A grocery item attribute used to indicate whether an item is perishable or not. |
| 20 | PRODUCT_CLASSIFICATION |  |  |  | VARCHAR (6) | Product classification is informational only in RMS, but is used by RWMS to determine how to pack customer orders : such as to determine products that may not be able to be packaged together. |
| 21 | BRAND_NAME |  |  |  | VARCHAR (30) | This field contains the brand associated to an item. |

---

## Table: DC_SUBCLASS

**Description:** This table is a staging table for data conversion and will hold data for subclass table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEPT |  |  |  | NUMERIC (4) | Contains the number which uniquely identifies the department. |
| 2 | CLASS |  |  |  | NUMERIC (4) | Contains the number which uniquely identifies the class within the system. |
| 3 | SUBCLASS |  |  |  | NUMERIC (4) | Contains the name of the class which, along with the class number, identifies the subclass. |
| 4 | SUB_NAME |  |  |  | VARCHAR (120) | Contains the name of the subclass which, along with the subclass number, uniquely identifies the subclass. |

---

## Table: DC_SUPS

**Description:** This table is a staging table for data conversion and will hold the supplier information.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SUPPLIER |  |  |  | NUMERIC (10) | Unique identifying number for a supplier within the system. |
| 2 | SUP_NAME |  |  |  | VARCHAR (240) | Contains the suppliers trading name. |
| 3 | SUP_NAME_SECONDARY |  |  |  | VARCHAR (240) | Secondary name of the supplier. |
| 4 | CONTACT_NAME |  |  |  | VARCHAR (120) | Contains the name of the suppliers representative contact. |
| 5 | CONTACT_PHONE |  |  |  | VARCHAR (20) | Contains a telephone number for the suppliers representative contact. |
| 6 | CONTACT_FAX |  |  |  | VARCHAR (20) | Contains a fax number for the suppliers representative contact. |
| 7 | CONTACT_PAGER |  |  |  | VARCHAR (20) | Contains the number for the pager of the supplierâ€™s representative contact. |
| 8 | QC_IND |  |  |  | VARCHAR (1) | Determines whether orders from this supplier will default as requiring quality control. |
| 9 | QC_PCT |  |  |  | NUMERIC (12,4) | Indicates the percentage of items per receipt that will be marked for quality checking. |
| 10 | QC_FREQ |  |  |  | NUMERIC (2) | Indicates the frequency in which items per receipt will be marked for quality checking. |
| 11 | VC_IND |  |  |  | VARCHAR (1) | Determines whether orders from this supplier will default as requiring vendor control. |
| 12 | VC_PCT |  |  |  | NUMERIC (12,4) | Indicates the percentage of items per receipt that will be marked for vendor checking. |
| 13 | VC_FREQ |  |  |  | NUMERIC (2) | Indicates the frequency in which items per receipt will be marked for vendor checking. |
| 14 | CURRENCY_CODE |  |  |  | VARCHAR (3) | Contains a code identifying the currency the supplier uses for business transactions. |
| 15 | LANG |  |  |  | NUMERIC (6) | This field contains the suppliers preferred language. |
| 16 | TERMS |  |  |  | VARCHAR (15) | Indicator identifying the sales terms that will default when an order is created for the supplier. |
| 17 | FREIGHT_TERMS |  |  |  | VARCHAR (30) | Indicator that references what freight terms will default when a order is created for the supplier. |
| 18 | RET_ALLOW_IND |  |  |  | VARCHAR (1) | Indicates whether or not the supplier will accept returns. |
| 19 | RET_AUTH_REQ |  |  |  | VARCHAR (1) | Indicates if returns must be accompanied by an authorization number when sent back to the vendors. |
| 20 | RET_MIN_DOL_AMT |  |  |  | NUMERIC (20,4) | Contains a value if the supplier requires a minimum dollar amount to be returned in order to accept the return. |
| 21 | RET_COURIER |  |  |  | VARCHAR (250) | Contains the name of the courier that should be used for all returns to the supplier. |
| 22 | HANDLING_PCT |  |  |  | NUMERIC (12,4) | Percentage multiplied by the total order cost to determine the handling cost for the return. |
| 23 | EDI_PO_IND |  |  |  | VARCHAR (1) | Indicates whether purchase orders will be sent to the supplier via Electronic Data Interchange. |
| 24 | EDI_PO_CHG |  |  |  | VARCHAR (1) | Indicates whether purchase order changes will be sent to the supplier via Electronic Data Interchange. |
| 25 | EDI_PO_CONFIRM |  |  |  | VARCHAR (1) | Indicates whether this supplier will send acknowledgment of a purchase orders sent via Electronic Data Interchange. |
| 26 | EDI_ASN |  |  |  | VARCHAR (1) | Indicates whether this supplier will send Advance Shipment Notifications electronically. |
| 27 | EDI_SALES_RPT_FREQ |  |  |  | VARCHAR (1) | This field contains the EDI sales report frequency for this supplier. |
| 28 | EDI_SUPP_AVAILABLE_IND |  |  |  | VARCHAR (1) | This field indicates whether the supplier will send availability via EDI. |
| 29 | EDI_CONTRACT_IND |  |  |  | VARCHAR (1) | This field indicates whether contracts will be sent to the supplier via EDI. |
| 30 | EDI_CHANNEL_ID |  |  |  | NUMERIC (4) | The supplier is an EDI supplier and supports vendor initiated ordering, this field will contain the channel ID for the channel to which all inventory for these types of orders will flow. |
| 31 | REPLEN_APPROVAL_IND |  |  |  | VARCHAR (1) | Indicates whether contract orders for the supplier should be created in Approved status. |
| 32 | SHIP_METHOD |  |  |  | VARCHAR (6) | The method used to ship the items on the purchase order from the country of origin to the country of import. |
| 33 | PAYMENT_METHOD |  |  |  | VARCHAR (6) | LC(Letter of Credit) |
| 34 | CONTACT_TELEX |  |  |  | VARCHAR (20) | This field contains the telex number of the partner or suppliers representative contact. |
| 35 | CONTACT_EMAIL |  |  |  | VARCHAR (100) | This field contains the email address of the partner or suppliers representative contact. |
| 36 | SETTLEMENT_CODE |  |  |  | VARCHAR (1) | This field indicates which payment process method is used for this supplier. |
| 37 | PRE_MARK_IND |  |  |  | VARCHAR (1) | This field indicates whether or not the supplier has agreed to break an order into separate boxes (and mark them) that can be shipped directly to the stores. |
| 38 | AUTO_APPR_INVC_IND |  |  |  | VARCHAR (1) | Indicates whether or not the suppliers invoice matches can be automatically approved for payment. |
| 39 | FREIGHT_CHARGE_IND |  |  |  | VARCHAR (1) | Indicates if a supplier is allowed to charge freight costs to the client. This field will only be populated if invoice matching is installed. |
| 40 | BACKORDER_IND |  |  |  | VARCHAR (1) | Indicates if backorders or partial shipments will be accepted. |
| 41 | VAT_REGION |  |  |  | NUMERIC (4) | Contains the unique identifying number for the VAT region in the system. |
| 42 | INV_MGMT_LVL |  |  |  | VARCHAR (6) | Indicator that determines whether supplier inventory management information can be set up at the supplier/department level or just at the supplier level. |
| 43 | SERVICE_PERF_REQ_IND |  |  |  | VARCHAR (1) | Indicates if the suppliers services (e.g. shelf stocking) must be confirmed as performed before paying an invoice from that supplier. |
| 44 | DELIVERY_POLICY |  |  |  | VARCHAR (6) | Contains the delivery policy of the supplier. Next Day indicates that the if a location is closed, the supplier will deliver on the next day. |
| 45 | COMMENT_DESC |  |  |  | VARCHAR (2000) | Any miscellaneous comments associated with the supplier. |
| 46 | DEFAULT_ITEM_LEAD_TIME |  |  |  | NUMERIC (4) | Holds the default lead time for the supplier. The lead time is the time the supplier needs between receiving an order and having the order ready to ship. |
| 47 | DUNS_NUMBER |  |  |  | VARCHAR (9) | This field holds the Dun and Bradstreet number to identify the supplier. |
| 48 | DUNS_LOC |  |  |  | VARCHAR (4) | This field holds the Dun and Bradstreet number to identify the location of the supplier. |
| 49 | VMI_ORDER_STATUS |  |  |  | VARCHAR (6) | This column determines the status in which any inbound POs from this supplier are created. |
| 50 | DSD_IND |  |  |  | VARCHAR (1) | Indicates whether the supplier can ship direct to store. |
| 51 | SUPPLIER_PARENT |  |  |  | NUMERIC (10) | PARENT_SUPPLIER field will store supplier number for the supplier sites. |
| 52 | SUP_QTY_LEVEL |  |  |  | VARCHAR (6) | This will hold the level at which quantity is ordered at. |

---

## Table: DC_SUP_ADDR

**Description:** This table is a staging table for data conversion and will hold the supplier address information.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | KEY_VALUE_1 |  |  |  | NUMERIC (10) | This column contains specific ID or type that the address is attached to. |
| 2 | ADDR_TYPE |  |  |  | VARCHAR (2) | This column indicates the type for the address. |
| 3 | PRIMARY_ADDR_IND |  |  |  | VARCHAR (1) | This column indicates whether the address is the primary address for the address type. |
| 4 | CONTACT_NAME |  |  |  | VARCHAR (120) | Contains the name of the partnerâ€™s representative contract. |
| 5 | CONTACT_PHONE |  |  |  | VARCHAR (20) | Contains the phone number of the partners representative contact. |
| 6 | CONTACT_TELEX |  |  |  | VARCHAR (20) | Contains the telex number of the partners representative contact. |
| 7 | CONTACT_FAX |  |  |  | VARCHAR (20) | Contains the fax number of the partners representative contact. |
| 8 | CONTACT_EMAIL |  |  |  | VARCHAR (100) | Contains the e-mail address of the partners representative contact. |
| 9 | ADD_1 |  |  |  | VARCHAR (240) | This column contains the first line of the address. |
| 10 | ADD_2 |  |  |  | VARCHAR (240) | This column contains the second line of the address. |
| 11 | ADD_3 |  |  |  | VARCHAR (240) | This column contains the third line of the address. |
| 12 | CITY |  |  |  | VARCHAR (120) | This column contains the name of the city that is associated with the address. |
| 13 | COUNTY |  |  |  | VARCHAR (250) | This column holds the county name for the location. |
| 14 | STATE |  |  |  | VARCHAR (3) | This column contains the state abbreviation for the address. |
| 15 | POST |  |  |  | VARCHAR (30) | This column contains the zip code for the address. |
| 16 | COUNTRY_ID |  |  |  | VARCHAR (3) | This column contains the country where the address exists. |
| 17 | JURISDICTION_CODE |  |  |  | VARCHAR (10) | Identifies the jurisdiction code for the country-state relationship. |

---

## Table: DC_SUP_IMPORT_ATTR

**Description:** This table is a staging table for data conversion and will hold to import specific attributes associated with a supplier.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SUPPLIER |  |  |  | NUMERIC (10) | Unique identifying number for a supplier within the system. |
| 2 | AGENT |  |  |  | VARCHAR (10) | The agent associated with the supplier. |
| 3 | ADVISING_BANK |  |  |  | VARCHAR (10) | Code for the bank advising the Letter of Credit. |
| 4 | ISSUING_BANK |  |  |  | VARCHAR (10) | issuing_bank |
| 5 | LADING_PORT |  |  |  | VARCHAR (5) | Contains the identification number of the suppliers Lading Port. |
| 6 | DISCHARGE_PORT |  |  |  | VARCHAR (5) | Contains the identification number of the suppliers Discharge Port. |
| 7 | MFG_ID |  |  |  | VARCHAR (18) | Contains the manufacturers tax identification number. |
| 8 | RELATED_IND |  |  |  | VARCHAR (1) | This field will indicate if the Supplier is related to the company or not. |
| 9 | BENEFICIARY_IND |  |  |  | VARCHAR (1) | This field will indicate whether this supplier can be a beneficiary or not. |
| 10 | WITH_RECOURSE_IND |  |  |  | VARCHAR (1) | Indicates conditional payment on the part of the bank as instructed by the buyer. |
| 11 | REVOCABLE_IND |  |  |  | VARCHAR (1) | Indicates if the Letter of Credit is revocable or not. |
| 12 | VARIANCE_PCT |  |  |  | NUMERIC (12,4) | Allowed currency variance percentage for the Letter of Credit. |
| 13 | LC_NEG_DAYS |  |  |  | NUMERIC (3) | The number of days to negotiate documents. |
| 14 | PLACE_OF_EXPIRY |  |  |  | VARCHAR (6) | Contains the place where the Letter of Credit will expire. |
| 15 | DRAFTS_AT |  |  |  | VARCHAR (6) | This field specifies the terms of draft (or when payment is to be made) for the Letter of Credit. |
| 16 | PRESENTATION_TERMS |  |  |  | VARCHAR (6) | Presentation terms in (P,A,N) |
| 17 | FACTORY |  |  |  | VARCHAR (10) | Contains the factory partner id for the factory partner type. |
| 18 | PARTNER_TYPE_1 |  |  |  | VARCHAR (6) | Contains the partner type of the first additional partner. |
| 19 | PARTNER_1 |  |  |  | VARCHAR (10) | Contains the partner id of the first additional partner. |
| 20 | PARTNER_TYPE_2 |  |  |  | VARCHAR (6) | Contains the partner type of the second additional partner. |
| 21 | PARTNER_2 |  |  |  | VARCHAR (10) | Contains the partner id of the second additional partner. |
| 22 | PARTNER_TYPE_3 |  |  |  | VARCHAR (6) | Contains the partner type of the third additional partner. |
| 23 | PARTNER_3 |  |  |  | VARCHAR (10) | Contains the partner id of the third additional partner. |

---

## Table: DC_TERMS_DETAIL

**Description:** This table is a staging table for data conversion and will hold data for TERM_DETAIL table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TERMS |  |  |  | VARCHAR (15) | Contains a number uniquely identifying the supplier terms. |
| 2 | TERMS_SEQ |  |  |  | NUMERIC (10) | Order sequence in which to apply the discount percent. |
| 3 | DUEDAYS |  |  |  | NUMERIC (3) | Contains the number of days until payment is due. |
| 4 | DUE_MAX_AMOUNT |  |  |  | NUMERIC (12,4) | Maximum payment amound due by a certain date. |
| 5 | DUE_DOM |  |  |  | NUMERIC (2) | Day of month used to calculate due date of invoice payment line. |
| 6 | DUE_MM_FWD |  |  |  | NUMERIC (3) | Number of months ahead used to calculate due date of invoice payment line. |
| 7 | DISCDAYS |  |  |  | NUMERIC (3) | Contains the number of days in which payment must be made in order to receive the discount. |
| 8 | PERCENT |  |  |  | NUMERIC (12,4) | Contains the percent of discount if payment is made within the specified time frame. |
| 9 | DISC_DOM |  |  |  | NUMERIC (2) | Day of month used to calculate discount date for invoice payment line. |
| 10 | DISC_MM_FWD |  |  |  | NUMERIC (3) | Number of months ahead to calculate discount date for invoice payment line. |
| 11 | ENABLED_FLAG |  |  |  | VARCHAR (1) | Indicates whether the Payment terms are valid or invalid within the respective application. The values would be either (Y)es or (N)o. |
| 12 | CUTOFF_DAY |  |  |  | NUMERIC (2) | Day of the month after which Oracle Payables schedules payment using the day after the current month. |
| 13 | FIXED_DATE |  |  |  | Date | Fixed due date. |
| 14 | START_DATE_ACTIVE |  |  |  | Date | Indicates the date for assigning an active date to the Payment Terms. |
| 15 | END_DATE_ACTIVE |  |  |  | Date | Indicates the date for assigning an inactive date to the Payment Terms. |

---

## Table: DC_TERMS_HEAD

**Description:** This table is a staging table for data conversion and will hold data for TERM_HEAD table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TERMS |  |  |  | VARCHAR (15) | Contains a number uniquely identifying the supplier terms. |
| 2 | TERMS_CODE |  |  |  | VARCHAR (50) | Indicates the Alphanumeric representation of Term Name which acts as the Term code in Oracle Financials. |
| 3 | TERMS_DESC |  |  |  | VARCHAR (240) | Contains a description of the supplier terms. For example: 2.5% 30 days. |
| 4 | RANK |  |  |  | NUMERIC (10) | Unique rank to rate invoice payment terms against purchase order terms. |

---

## Table: DC_TICKET_TYPE_DETAIL

**Description:** This table is a staging table for data conversion and will hold one row for each item which will be on the ticket.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TICKET_TYPE_ID |  |  |  | VARCHAR (4) | This field contains a character string which uniquely identifies the ticket type. |
| 2 | TICKET_ITEM_ID |  |  |  | VARCHAR (4) | This field contains a character string which uniquely identifies an attribute which will appear on a ticket or label such as retail price or price per unit of measure. |
| 3 | UDA_ID |  |  |  | NUMERIC (5) | This field contains a number which uniquely defines a user-defined attribute which is to be printed on this ticket type. |

---

## Table: DC_TICKET_TYPE_HEAD

**Description:** This table is a staging table for data conversion and will hold data for each ticket type that exists in the system.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TICKET_TYPE_ID |  |  |  | VARCHAR (4) | This field contains a character string which uniquely identifies the ticket or label type. |
| 2 | TICKET_TYPE_DESC |  |  |  | VARCHAR (120) | This field contains a description of the ticketor label type. |
| 3 | SEL_IND |  |  |  | VARCHAR (1) | Indicates if the ticket type is a shelf edge label. |

---

## Table: DC_TRANSIT_TIMES

**Description:** This table is a staging table for data conversion and holds transit time in number of days between an origin and destination location.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TRANSIT_TIMES_ID |  |  |  | NUMERIC (10) | This field holds the unique id for the origin and destination location transit time combination. |
| 2 | DEPT |  |  |  | NUMERIC (4) | The field holds the unique identifier for the department for which the transit time is defined. |
| 3 | ORIGIN |  |  |  | NUMERIC (10) | This field holds the unique identifier for the origin location for which transit time is defined. |
| 4 | DESTINATION |  |  |  | NUMERIC (10) | This field holds the unique identifier for the destination location for which transit time is defined. |
| 5 | ORIGIN_TYPE |  |  |  | VARCHAR (2) | This field holds the type of origin location for which transit time is defined. |
| 6 | DESTINATION_TYPE |  |  |  | VARCHAR (2) | This field holds the type of destination location for which transit time is defined. |
| 7 | TRANSIT_TIME |  |  |  | NUMERIC (4) | This field holds the transit time in days. |
| 8 | CLASS |  |  |  | NUMERIC (4) | The field holds the unique identifier for the class for which the transit time is defined. |
| 9 | SUBCLASS |  |  |  | NUMERIC (4) | The field holds the unique identifier for the subclass for which the transit time is defined. |

---

## Table: DC_TSF_ENTITY

**Description:** This table is a staging table for data conversion and will holds all the transfer entities created within the company.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TSF_ENTITY_ID |  |  |  | NUMERIC (10) | This field contains the number which uniquely identifies the transfer entity. |
| 2 | TSF_ENTITY_DESC |  |  |  | VARCHAR (120) | This field contains the name of the transfer entity. |

---

## Table: DC_TSF_ENTITY_ORG_UNIT_SOB

**Description:** This table is a staging table for data conversion and will hold data for TSF_ENTITY_ORG_UNIT_SOB.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TSF_ENTITY_ID |  |  |  | NUMERIC (10) | This field contains the number which uniquely identifies a transfer entity. |
| 2 | ORG_UNIT_ID |  |  |  | NUMERIC (15) | This field contains the number which uniquely identifies a org unit. |
| 3 | SET_OF_BOOKS_ID |  |  |  | NUMERIC (15) | This field contains the number which uniquely identifies a set of books. One set of books can be shared among multiple transfer entities and org units however each transfer entity and org unit can be associated with only one set of books. |

---

## Table: DC_UDA

**Description:** This table is a staging table for data conversion and will hold data for UDA table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | UDA_ID |  |  |  | NUMERIC (5) | This field contains a unique number identifying the User Defined Attribute. |
| 2 | UDA_DESC |  |  |  | VARCHAR (120 BYTE) | This field contains a description of the User-Defined Attribute. |
| 3 | DISPLAY_TYPE |  |  |  | VARCHAR (2 BYTE) | This field is used to store the display type (how the UDA values will be displayed to the user) for the given UDA. |
| 4 | DATA_TYPE |  |  |  | VARCHAR (12 BYTE) | This field contains the data type of any valid values for the UDA. |
| 5 | DATA_LENGTH |  |  |  | NUMERIC (3) | This field contains the data length of any valid values for the UDA. |
| 6 | SINGLE_VALUE_IND |  |  |  | VARCHAR (1 BYTE) | This field indicates whether or not the UDA should be constrained to having at most one value when assigned to a specific module. |

---

## Table: DC_UDA_ITEM_DATE

**Description:** This table is a staging table for data conversion and will hold one row for each item/attribute combination for UDAs with display type of date (DT) and contains the information about item attribute relationship, create date, update date, etc.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  |  |  | VARCHAR (25 BYTE) | Unique alphanumeric value that identifies the item. |
| 2 | UDA_ID |  |  |  | NUMERIC (5) | This field contains a number uniquely identifying the User-Defined Attribute. |
| 3 | UDA_DATE |  |  |  | Date (7) | This field contains the date of the Used Defined attribute for the item. |

---

## Table: DC_UDA_ITEM_DEFAULTS

**Description:** This table is a staging table for data conversion and will hold data for an item attribute

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | UDA_ID |  |  |  | NUMERIC (5) | Contains the number which uniquely identifies the department. |
| 2 | DEPT |  |  |  | NUMERIC (4) | This field contains the department for which the default is being set-up. |
| 3 | CLASS |  |  |  | NUMERIC (4) | This field contains the class for which the default is being set-up. |
| 4 | SUBCLASS |  |  |  | NUMERIC (4) | This field contains the subclass for which the default is being set-up. |
| 5 | UDA_VALUE |  |  |  | NUMERIC (5) | This is an optional field in which a default value can be assigned, such that all items created in the hierarchy level will be assigned this UDA value initially. |

---

## Table: DC_UDA_ITEM_FF

**Description:** This table is a staging table for data conversion and will hold one row for each item/attribute combination for UDAs with display type of Free Form (FF) and contains the information about item attribute relationship, create date, update date, etc.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  |  |  | VARCHAR (25 BYTE) | Unique alphanumeric value that identifies the item. |
| 2 | UDA_ID |  |  |  | NUMERIC (5) | This field contains a number uniquely identifying the User-Defined Attribute. |
| 3 | UDA_TEXT |  |  |  | VARCHAR (250 BYTE) | This field contains the text value of the Used Defined attribute for the item. |

---

## Table: DC_UDA_ITEM_LOV

**Description:** This table is a staging table for data conversion and will hold sone row for each item/attribute combination for UDAs with display type of List of Values (LV) and contains the information about item attribute relationship, create date, update date, etc.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  |  |  | VARCHAR (25 BYTE) | This field contains unique alphanumeric identifier for the item. |
| 2 | UDA_ID |  |  |  | NUMERIC (5) | This field contains a number uniquely identifying the User-Defined Attribute. |
| 3 | UDA_VALUE |  |  |  | NUMERIC (5) | This field contains value of the Used Defined attribute for the item. |

---

## Table: DC_UDA_VALUES

**Description:** This table is a staging table for data conversion and will hold data for UDA_VALUES.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | UDA_ID |  |  |  | NUMERIC (5) | This field contains a unique number identifying the User Defined Attribute. |
| 2 | UDA_VALUE_DESC |  |  |  | VARCHAR (250 BYTE) | This field contains a description of the UDA value. |

---

## Table: DC_VAT_CODES

**Description:** This table is a staging table for data conversion which will hold one row for each VAT code. The VAT code is used to determine which items are subject to VAT tax.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | VAT_CODE |  |  |  | VARCHAR (6 BYTE) | This field contains the alphanumeric identification for the VAT code. |
| 2 | VAT_CODE_DESC |  |  |  | VARCHAR (120 BYTE) | Contains a description identifying the VAT code. |

---

## Table: DC_VAT_CODE_RATES

**Description:** This table is a staging table for data conversion and will hold VAT rates and active dates for each VAT code in the system.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | VAT_CODE |  |  |  | VARCHAR (6 BYTE) | Code to uniquely identify a VAT rate. |
| 2 | ACTIVE_DATE |  |  |  | Date (7) | Date on which the VAT rate becomes active. |
| 3 | VAT_RATE |  |  |  | NUMERIC (20,10) | VAT rate associated with a given VAT code. |

---

## Table: DC_VAT_DEPS

**Description:** This table is a staging table for data conversion and will hold data for vat region and department.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEPT |  |  |  | NUMERIC (4) | Contains the number which uniquely identifies the department. |
| 2 | VAT_REGION |  |  |  | NUMERIC (4) | Contains the number of the Value Added Tax region in which this store is contained. |
| 3 | VAT_TYPE |  |  |  | VARCHAR (1 BYTE) | Refer to VAT_ITEM.VAT_TYPE. |
| 4 | VAT_CODE |  |  |  | VARCHAR (6 BYTE) | The VAT code. |
| 5 | REVERSE_VAT_IND |  |  |  | VARCHAR (1 BYTE) | Indicates if items in the department are subject to reverse charge VAT at the vat region. It is used to default the value to VAT_ITEM only. |

---

## Table: DC_VAT_ITEM

**Description:** This table is a staging table for data conversion and will hold item vat relationship.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  |  |  | VARCHAR (25 BYTE) | Unique alphanumeric value that identifies the item. |
| 2 | VAT_REGION |  |  |  | NUMERIC (4) | Contains the number of the Value Added Tax region in which this store is contained. |
| 3 | VAT_TYPE |  |  |  | VARCHAR (1 BYTE) | Holds the type of vat either Retail or Cost or Both. |
| 4 | VAT_CODE |  |  |  | VARCHAR (6 BYTE) | This field contains the alphanumeric identification for the VAT code. |
| 5 | VAT_RATE |  |  |  | NUMERIC (20,10) | VAT rate associated with a given VAT code. |
| 6 | ACTIVE_DATE |  |  |  | Date (7) | Holds the active date of vat. |
| 7 | REVERSE_VAT_IND |  |  |  | VARCHAR (1 BYTE) | Indicates if the item is subject to reverse charge VAT at the vat region. |

---

## Table: DC_VAT_REGION

**Description:** This table is a staging table for data conversion and will hold one row for each VAT region and is maintained by the VAT Region Maintenance.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | VAT_REGION |  |  |  | NUMERIC (4) | Contains the unique identifying number for the VAT region in the system. |
| 2 | VAT_REGION_NAME |  |  |  | VARCHAR (120 BYTE) | Contains the name associated with the VAT region. |
| 3 | VAT_REGION_TYPE |  |  |  | VARCHAR (6 BYTE) | Will hold the type of VAT region. |
| 4 | ACQUISITION_VAT_IND |  |  |  | VARCHAR (1 BYTE) | Indicates if acquisition VAT is applicable to the vat region. Valid values are Y and N. |
| 5 | REVERSE_VAT_THRESHOLD |  |  |  | NUMERIC (20,4) | This holds the invoice-level total value limit. |
| 6 | VAT_CALC_TYPE |  |  |  | VARCHAR (6 BYTE) | This column holds the tax calculation type and can be 'S'imple, 'E'xempt or 'C'ustom. |

---

## Table: DC_VWH

**Description:** This table is a staging table for data conversion and will hold the virtual warehouse information.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | WH |  |  |  | NUMERIC (10) | Contains the number which uniquely identifies the warehouse. |
| 2 | WH_NAME |  |  |  | VARCHAR (150 BYTE) | Contains the name of the warehouse which, along with the warehouse number, identifies the warehouse. |
| 3 | PHYSICAL_WH |  |  |  | NUMERIC (10) | This column will contain the number of the physical warehouse that is assigned to the virtual warehouse. |
| 4 | RESTRICTED_IND |  |  |  | VARCHAR (1 BYTE) | Indicator used to restrict virtual warehouses from receiving stock during an inbound type transaction when stock needs to be prorated across virtual warehouses within a physical warehouse because a virtual warehouse in the physical warehouse has not been identified for the transaction. |
| 5 | PROTECTED_IND |  |  |  | VARCHAR (1 BYTE) | Indicator used to determine if the virtual warehouse is affected last in transactions where inventory is removed or affected first in short-shipment type transactions where inventory is being added. |
| 6 | FORECAST_WH_IND |  |  |  | VARCHAR (1 BYTE) | This indicator determines if a warehouse is forecastable. |
| 7 | REPL_IND |  |  |  | VARCHAR (1 BYTE) | This indicator determines if a warehouse is replenishable. |
| 8 | REPL_WH_LINK |  |  |  | NUMERIC (10) | This field holds the replenishable warehouse that is linked to this virtual warehouse. |
| 9 | IB_IND |  |  |  | VARCHAR (1 BYTE) | This field indicates if the warehouse is an investment buy warehouse. |
| 10 | IB_WH_LINK |  |  |  | NUMERIC (10) | This field contains the investment buy warehouse that is linked to the virtual warehouse. |
| 11 | AUTO_IB_CLEAR |  |  |  | VARCHAR (1 BYTE) | This indicator determines if the investment buys inventory should be automatically transferred to the turn (replenishable) warehouse when an order is received by the turn warehouse. |
| 12 | FINISHER_IND |  |  |  | VARCHAR (1 BYTE) | Yes/No value which indicates if this virtual warehouse is an internal finisher. |
| 13 | WH_NAME_SECONDARY |  |  |  | VARCHAR (150 BYTE) | Secondary name of the warehouse. |
| 14 | CHANNEL_ID |  |  |  | NUMERIC (4) | This column will contain the channel for which the virtual warehouse will be assigned. |
| 15 | TSF_ENTITY_ID |  |  |  | NUMERIC (10) | ID of the transfer entity with which this warehouse is associated. |
| 16 | ORG_UNIT_ID |  |  |  | NUMERIC (15) | This column will hold the oracle organizational unit id value. |
| 17 | ORG_ENTITY_TYPE |  |  |  | VARCHAR (1 BYTE) | This is the new column that will specify if the warehouse is a legal entity (Importer, Exporter) or a regular warehouse. |
| 18 | CUSTOMER_ORDER_LOC_IND |  |  |  | VARCHAR (1 BYTE) | This column determines if the location is customer order location or not, i.e. if the indicator is checked then the location can be used by OMS for sourcing/ fulfillment or both else it cannot be used. |
| 19 | DEFAULT_WH |  |  |  | NUMERIC (10) | This field contains the default warehouse linked to the virtual warehouse. |

---

## Table: DC_WF_CUSTOMER

**Description:** This table is a staging table for data conversion and will hold data for WF_CUSTOMER.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | WF_CUSTOMER_ID |  |  |  | NUMERIC (10) | This field will hold the unique identifier for the customer. |
| 2 | WF_CUSTOMER_NAME |  |  |  | VARCHAR (120 BYTE) | This field will hold the customer description. |
| 3 | CREDIT_IND |  |  |  | VARCHAR (1 BYTE) | This field will determine if the customer has good credit. |
| 4 | WF_CUSTOMER_GROUP_ID |  |  |  | NUMERIC (10) | This field will indicate which customer group this customer belongs to. |
| 5 | AUTO_APPROVE_IND |  |  |  | VARCHAR (1 BYTE) | This indicator is used to auto approve the externally uploaded orders and returns if all the validations are passed. Valid values are Y and N |

---

## Table: DC_WF_CUSTOMER_GROUP

**Description:** This table is a staging table for data conversion and will hold data for WF_CUSTOMER_GROUP.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | WF_CUSTOMER_GROUP_ID |  |  |  | NUMERIC (10) | This field will hold the unique identifier for the customer group. |
| 2 | WF_CUSTOMER_GROUP_NAME |  |  |  | VARCHAR (120 BYTE) | This field will hold the customer group description |

---

## Table: DC_WH_ADDR

**Description:** This table is a staging table for data conversion and will hold the warehouse address information.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | KEY_VALUE_1 |  |  |  | VARCHAR (20 BYTE) | This column contains specific ID or type that the address is attached to. |
| 2 | ADDR_TYPE |  |  |  | VARCHAR (2 BYTE) | This column indicates the type for the address. |
| 3 | PRIMARY_ADDR_IND |  |  |  | VARCHAR (1 BYTE) | This column indicates whether the address is the primary address for the address type. |
| 4 | CONTACT_NAME |  |  |  | VARCHAR (120 BYTE) | Contains the name of the partners representative contact. |
| 5 | CONTACT_PHONE |  |  |  | VARCHAR (20 BYTE) | Contains the phone number of the partners representative contact. |
| 6 | CONTACT_FAX |  |  |  | VARCHAR (20 BYTE) | Contains the fax number of the partners representative contact. |
| 7 | CONTACT_EMAIL |  |  |  | VARCHAR (100 BYTE) | Contains the e-mail address of the partners representative contact. |
| 8 | CONTACT_TELEX |  |  |  | VARCHAR (20 BYTE) | Contains the telex number of the partners representative contact. |
| 9 | ADD_1 |  |  |  | VARCHAR (240 BYTE) | This column contains the first line of the address. |
| 10 | ADD_2 |  |  |  | VARCHAR (240 BYTE) | This column contains the second line of the address. |
| 11 | ADD_3 |  |  |  | VARCHAR (240 BYTE) | This column contains the third line of the address. |
| 12 | CITY |  |  |  | VARCHAR (120 BYTE) | This column contains the name of the city that is associated with the address. |
| 13 | COUNTY |  |  |  | VARCHAR (250 BYTE) | This column holds the county name for the location. |
| 14 | STATE |  |  |  | VARCHAR (3 BYTE) | This column contains the state abbreviation for the address. |
| 15 | POST |  |  |  | VARCHAR (30 BYTE) | This column contains the zip code for the address. |
| 16 | COUNTRY_ID |  |  |  | VARCHAR (3 BYTE) | This column contains the country where the address exists. |
| 17 | JURISDICTION_CODE |  |  |  | VARCHAR (10 BYTE) | Identifies the jurisdiction code for the country-state relationship. |

---

## Table: DIFFGRP_EXPORT_STG

**Description:** This is table is a staging table for differentiator group records as they wait to be extracted. This table is automatically inserted into, as records are processed by Oracle Retail. This table will be scanned by a daily batch job to extract new, updated and deleted RMS differentiator group information.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SEQ_NO | P |  | Y | NUMERIC (15) | The sequence in which the records are placed in the table. |
| 2 | DIFF_GROUP_ID |  |  | Y | VARCHAR (10 ) | Contains the code that uniquely identifies the diff group. |
| 3 | DIFF_ID |  |  |  | VARCHAR (10 ) | Contains the differentiator which is associated with a differentiator group. |
| 4 | ACTION_TYPE |  |  | Y | VARCHAR (15 ) | Indicates if the differentiator group header or detail have been added, changed or deleted. Valid values are 'diffgrphdrcre', 'diffgrphdrmod', 'diffgrphdrdel', 'diffgrpdtlcre', 'diffgrpdtlmod' and 'diffgrpdtldel'. |
| 5 | BASE_EXTRACTED_IND |  |  | Y | VARCHAR (1 ) | Indicates whether the record has been extracted or not. Upon record insert, this will be set to â€˜Nâ€™. After running the batch job, this will then be set to â€˜Yâ€™. |
| 6 | CUSTOM1_EXTRACTED_IND |  |  |  | VARCHAR (1 ) | Indicates whether the record has been extracted or not for a custom extraction. |
| 7 | CUSTOM2_EXTRACTED_IND |  |  |  | VARCHAR (1 ) | Indicates whether the record has been extracted or not for a custom extraction. |
| 8 | CUSTOM3_EXTRACTED_IND |  |  |  | VARCHAR (1 ) | Indicates whether the record has been extracted or not for a custom extraction. |
| 9 | CUSTOM4_EXTRACTED_IND |  |  |  | VARCHAR (1 ) | Indicates whether the record has been extracted or not for a custom extraction. |
| 10 | PROCESS_ID |  |  |  | NUMERIC (15) | Process ID where the record belongs to. |
| 11 | TRANSACTION_DATETIME |  |  | Y | Date | Time of record creation. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_DIFFGRP_EXPORT_STG|PK||||SEQ_NO|ASC|

---

## Table: DIFFGRP_MFQUEUE

**Description:** Differentiator Groups Publication API uses this table to publish differentiator group details to external system. Any differentiator group which is newly created, updated or deleted will be recorded in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SEQ_NO | P |  | Y | NUMERIC (15) | This column keeps the sequence in which the messages were created. This column will ensure that messages are published in the same order. |
| 2 | PUB_STATUS |  |  | Y | VARCHAR (1) | This column holds the publication status of the message. Right now the only status for diff group messages is Unprocessed. Once the message is successfully published it is deleted from the table |
| 3 | MESSAGE_TYPE |  |  | Y | VARCHAR (15) | This is the type of message. Message types supported are differentiator group header create/modify/delete and differentiator group detail create/modify/delete. |
| 4 | DIFF_GROUP_ID |  |  | Y | VARCHAR (10) | This is the unique identifier for the diff group. |
| 5 | DIFF_ID |  |  |  | VARCHAR (10) | This column holds the unique identifier for the diff. This field is optional and should only be populated for differentiator group detail create/modify/delete message types. |
| 6 | MESSAGE |  |  | Y | CLOB | This column holds the XML message that will be published. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_DIFFGRP_MFQUEUE|PK||||SEQ_NO|ASC|

---

## Table: DIFFID_MFQUEUE

**Description:** Differentiator ID Publication API uses this table to publish differentiator ID details to external system. Any differentiator id which is newly created, updated or deleted will be recorded in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SEQ_NO | P |  | Y | NUMERIC (15) | This column keeps the sequence in which the messages were created. This column will ensure that messages are published in the same order. |
| 2 | PUB_STATUS |  |  | Y | VARCHAR (1) | This column holds the publication status of the message. Right now the only status for diff ID messages is Unprocessed. Once the message is successfully published it is deleted from the table. |
| 3 | MESSAGE_TYPE |  |  | Y | VARCHAR (15) | This column holds the type of message. Message types supported are differentiator ID create/modify/delete. |
| 4 | DIFF_ID |  |  | Y | VARCHAR (10) | This column holds the unique identifier for the diff. |
| 5 | MESSAGE |  |  | Y | CLOB | This column holds the XML message that will be published. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_DIFFID_MFQUEUE|PK||||SEQ_NO|ASC|

---

## Table: DIFFS_EXPORT_STG

**Description:** This is table is a staging table for differentiator records as they wait to be extracted. This table is automatically inserted into, as records are processed by Oracle Retail. This table will be scanned by a daily batch job to extract new, updated and deleted RMS differentiator information.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SEQ_NO | P |  | Y | NUMERIC (15) | The sequence in which the records are placed in the table. |
| 2 | DIFF_ID |  |  | Y | VARCHAR (10 BYTE) | Contains the code that uniquely identifies the differentiator. |
| 3 | ACTION_TYPE |  |  | Y | VARCHAR (15 BYTE) | Indicates if the organizational hierarchy has been added, changed or deleted. Valid values are 'diffcre', 'diffmod', and 'diffdel'. |
| 4 | BASE_EXTRACTED_IND |  |  | Y | VARCHAR (1 BYTE) | Indicates whether the record has been extracted or not. Upon record insert, this will be set to 'N'. After running the batch job, this will then be set to 'Y'. |
| 5 | CUSTOM1_EXTRACTED_IND |  |  |  | VARCHAR (1 BYTE) | Indicates whether the record has been extracted or not for a custom extraction. |
| 6 | CUSTOM2_EXTRACTED_IND |  |  |  | VARCHAR (1 BYTE) | Indicates whether the record has been extracted or not for a custom extraction. |
| 7 | CUSTOM3_EXTRACTED_IND |  |  |  | VARCHAR (1 BYTE) | Indicates whether the record has been extracted or not for a custom extraction. |
| 8 | CUSTOM4_EXTRACTED_IND |  |  |  | VARCHAR (1 BYTE) | Indicates whether the record has been extracted or not for a custom extraction. |
| 9 | PROCESS_ID |  |  |  | NUMERIC (15) | Process ID where the record belongs to. |
| 10 | TRANSACTION_DATETIME |  |  | Y | Date (7) | Time of record creation. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_DIFFS_EXPORT_STG|PK||||SEQ_NO|ASC|

---

## Table: DIFF_APPLY_TEMP

**Description:** This temporary table is used in the distribution of items by differentiator in various functions in RMS.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DIFF_ID | P |  | Y | VARCHAR (10) | This column holds the diff ID being distributed. |
| 2 | STATUS |  |  | Y | VARCHAR (1) | This column holds the status of distribution of the diff ID. Valid values are A = Applied, U = Unapplied. |
| 3 | RATIO |  |  |  | NUMERIC (12,4) | This column holds the value when diff distribution is by ratio. |
| 4 | QTY |  |  |  | NUMERIC (12,4) | This column holds the value when diff distribution is by quantity. |
| 5 | PCT |  |  |  | NUMERIC (12,4) | This column holds the value when diff distribution is by percentage. |
| 6 | DIFF_DESC |  |  |  | VARCHAR (120) | This column holds the description for the diff ID. It will be the same value as on DIFF_IDS, translated if necessary. |
| 7 | DISPLAY_SEQ |  |  |  | NUMERIC (4) | This column holds the display sequence for the diff ID. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_DIFF_APPLY_TEMP|PK||||DIFF_ID|ASC|

---

## Table: DIFF_DIST_MATRIX

**Description:** Stores all possible diff_x/diff_y/diff_z values and their assoc. qty or pct

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DIFF_X |  |  | Y | VARCHAR (10) | Stores diff_x value |
| 2 | DIFF_Y |  |  | Y | VARCHAR (10) | Stores diff_y_value |
| 3 | DIFF_Z |  |  |  | VARCHAR (10) | Stores diff_z_value |
| 4 | QTY |  |  |  | NUMERIC (12,4) | Stores the order quantity for this diff combination as a quantity |
| 5 | PCT |  |  |  | NUMERIC (12,4) | Stores the order quantity for this diff combination as a percent. |

---

## Table: DIFF_FNLZ_DETAIL_GTT

**Description:** Temporary header table for diff finalization in item induction.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DIFF_SEQ |  |  | Y | NUMERIC (2) | Sequence for diff ids. |
| 2 | USER_DIFF_VAL |  |  |  | VARCHAR (255 ) | Diff value entered by user. |
| 3 | DIFF_ID |  |  |  | VARCHAR (10 ) | Refer to diff_ids.diff_id |
| 4 | DIFF_DESC |  |  |  | VARCHAR (120 ) | Refer to diff_ids.diff_desc |

---

## Table: DIFF_FNLZ_HEAD_GTT

**Description:** Temporary header table for diff finalization in item induction.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  |  |  | VARCHAR (25 ) | Refer to item_master.item. |
| 2 | ITEM_PARENT |  |  |  | VARCHAR (25 ) | Refer to item_master.item_parent. |
| 3 | ITEM_PARENT_DESC |  |  |  | VARCHAR (250 ) | Long description of the parent item. |
| 4 | VPN |  |  |  | VARCHAR (30 ) | Refer to item_supplier.vpn. |
| 5 | ITEM_NUMBER_TYPE |  |  |  | VARCHAR (6 ) | Refer to item_master.item_number_type. |
| 6 | DIFF_1 |  |  |  | VARCHAR (10 ) | Refer to item_master.diff_1. |
| 7 | DIFF_1_DESC |  |  |  | VARCHAR (120 ) | Description of diff_1. |
| 8 | DIFF_1_AGGREGATE_IND |  |  |  | VARCHAR (1 ) | Refer to item_master.diff_2_aggregate_ind. |
| 9 | DIFF_1_ID_GROUP_IND |  |  |  | VARCHAR (10 ) | Denotes whether diff is group or id. |
| 10 | DIFF_2 |  |  |  | VARCHAR (10 ) | Refer to item_master.diff_2. |
| 11 | DIFF_2_DESC |  |  |  | VARCHAR (120 ) | Description of diff_2. |
| 12 | DIFF_2_AGGREGATE_IND |  |  |  | VARCHAR (1 ) | Refer to item_master.diff_2_aggregate_ind. |
| 13 | DIFF_2_ID_GROUP_IND |  |  |  | VARCHAR (10 ) | Denotes whether diff is group or id. |
| 14 | DIFF_3 |  |  |  | VARCHAR (10 ) | Refer to item_master.diff_3. |
| 15 | DIFF_3_DESC |  |  |  | VARCHAR (120 ) | Description of diff_3. |
| 16 | DIFF_3_AGGREGATE_IND |  |  |  | VARCHAR (1 ) | Refer to item_master.diff_3_aggregate_ind. |
| 17 | DIFF_3_ID_GROUP_IND |  |  |  | VARCHAR (10 ) | Denotes whether diff is group or id. |
| 18 | DIFF_4 |  |  |  | VARCHAR (10 ) | Refer to item_master.diff_4. |
| 19 | DIFF_4_DESC |  |  |  | VARCHAR (120 ) | Description of diff_4. |
| 20 | DIFF_4_AGGREGATE_IND |  |  |  | VARCHAR (1 ) | Refer to item_master.diff_4_aggregate_ind. |
| 21 | DIFF_4_ID_GROUP_IND |  |  |  | VARCHAR (10 ) | Denotes whether diff is group or id. |
| 22 | DIFF_GROUPS_EDITABLE |  |  |  | VARCHAR (1 ) | This indicator denotes whether diff can be editable or not. |

---

## Table: DIFF_GROUP_DETAIL

**Description:** This table contains differentiators associated with a differentiator group. A differentiator sequence is also defined for each differentiator to display the differentiators within a group in the appropriate order.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DIFF_ID | P | F | Y | VARCHAR (10) | Contains the differentiator which are associated with a differentiator group. This field must be a valid value from the DIFF_IDS table. |
| 2 | DIFF_GROUP_ID | P | F | Y | VARCHAR (10) | Contains the differentiator group for which differentiators are stored in this table. This field must be a valid value on the DIFF_GROUP_HEAD table. |
| 3 | DISPLAY_SEQ |  |  |  | NUMERIC (4) | This field contains the display sequence for the differentiator. This is an optional field. This field is used to determine the order in which differentiators should be displayed for a differentiator group. |
| 4 | CREATE_DATETIME |  |  | Y | Date | Date/time stamp of when the record was created. This date/time will be used in export processing. This value should only be populated on insert - it should never be updated. |
| 5 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | Holds the Oracle user-id of the user who most recently updated this record. |
| 6 | LAST_UPDATE_DATETIME |  |  | Y | Date | Holds the date time stamp of the most recent update by the LAST_UPDATE_ID. |
| 7 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_DIFF_GROUP_DETAIL|PK||||DIFF_ID|ASC|
||||||DIFF_GROUP_ID|ASC|
|DIFF_GROUP_DETAIL_I1|||||DIFF_GROUP_ID|ASC|

---

## Table: DIFF_GROUP_HEAD

**Description:** This table contains all the differentiator groups defined within Oracle Retail. A differentiator group is used to classify differentiators that are commonly used together. For example, Men s Shirts Size would be a differential group that would contain all possible sizes (Large, medium, xtra-large etc) used to define men s shirt size.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DIFF_GROUP_ID | P |  | Y | VARCHAR (10) | This field will hold a unique number (identifier) for the differentiator group. |
| 2 | DIFF_TYPE |  | F | Y | VARCHAR (6) | This field will hold a value of the types of differentiators contained in this differentiator group, such as S - size, C - color, F - flavor, E - scent, P - pattern. Valid values are stored in the DIFF_TYPE table. |
| 3 | DIFF_GROUP_DESC |  |  | Y | VARCHAR (120) | Description of the differentiator group (for example: Mens Shirt Sizes, Womens Shoe Sizes, Girls Dress Sizes, Shower Gel Scents, Yogurt Flavors, etc.). |
| 4 | CREATE_DATETIME |  |  | Y | Date | Date/time stamp of when the record was created. This date/time will be used in export processing. This value should only be populated on insert - it should never be updated. |
| 5 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | Holds the Oracle user-id of the user who most recently updated this record. |
| 6 | LAST_UPDATE_DATETIME |  |  | Y | Date | Holds the date time stamp of the most recent update by the last_update_id. |
| 7 | FILTER_ORG_ID |  |  |  | NUMERIC (10) | The ID of the organziational hierarchy to which the diff group is assigned. The level of the organziational hierarchy is determined based on SECURITY_CONFIG_OPTIONS.DIFF_GROUP_ORG_LEVEL_CODE. The value in this column will be used to control the Diff Groups a user can use when Diff Groups are utilized in RMS, if data level security has been set up for users in the system. This value is not required. |
| 8 | FILTER_MERCH_ID |  |  |  | NUMERIC (4) | The ID of the merchandise hierarchy to which the diff group is assigned. The level of the merchandise hierarchy is determined based on SECURITY_CONFIG_OPTIONS.DIFF_GROUP_MERCH_LEVEL_CODE. The value in this column will be used to control the Diff Groups a user can use when Diff Groups are utilized in RMS, if data level security has been set up for users in the system. This value is not required. |
| 9 | FILTER_MERCH_ID_CLASS |  |  |  | NUMERIC (4) | If SECURITY_CONFIG_OPTIONS.DIFF_GROUP_MERCH_LEVEL_CODE is C (class) or S (subclass), then the FILTER_MERCH_ID column on this table will hold the department and the class associated with that department is held in this column. |
| 10 | FILTER_MERCH_ID_SUBCLASS |  |  |  | NUMERIC (4) | If SECURITY_CONFIG_OPTIONS.DIFF_GROUP_MERCH_LEVEL_CODE is S (subclass), then the FILTER_MERCH_ID column on this table will hold the department, FILTER_MERCH_ID_CLASS will hold the class and the subclass associated with that department is held in this column. |
| 11 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_DIFF_GROUP_HEAD|PK||||DIFF_GROUP_ID|ASC|
|DIFF_GROUP_HEAD_I1|||||DIFF_TYPE|ASC|

---

## Table: DIFF_GROUP_HEAD_TL

**Description:** This is the translation table for DIFF_GROUP_HEAD table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG |  | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | DIFF_GROUP_ID |  | F | Y | VARCHAR (10) | This field will hold a unique number (identifier) for the differentiator group. |
| 3 | DIFF_GROUP_DESC |  |  | Y | VARCHAR (120) | Description of the differentiator group (for example: Mens Shirt Sizes, Womens Shoe Sizes, Girls Dress Sizes, Shower Gel Scents, Yogurt Flavors, etc.). |
| 4 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 6 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 7 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_DIFF_GROUP_HEAD_TL|UK||||LANG|ASC|
||||||DIFF_GROUP_ID|ASC|

---

## Table: DIFF_IDS

**Description:** This table holds all the unique differentiators defined for a differentiator type. For example: Pink, Blue, Orange, Black can be unique differentiator colors defined against a differentiator type Color.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DIFF_ID | P |  | Y | VARCHAR (10) | Contains the code to uniquely identify a differentiator. |
| 2 | DIFF_TYPE |  | F | Y | VARCHAR (6) | This field will hold a value of the types of differentiators contained in this differentiator group, such as S - size, C - color, F - flavor, E - scent, P - pattern. Valid values are stored in the DIFF_TYPE table. |
| 3 | DIFF_DESC |  |  | Y | VARCHAR (120) | Description of the differentiator (for example, Blueberry, Shower Fresh, Red, etc.) |
| 4 | INDUSTRY_CODE |  |  |  | VARCHAR (10) | Can be used to hold the unique code used by industry standards to identify the differentiator. For example, in the US, the National Retail Federation defines a standard Color and Size Codes that gives retailers, vendors and manufacturers a common language for product color and size identification for EDI purposes. This supplements the information conveyed by UPC codes. This columns holds the NRF code defined for size or color for example, mens pants size combination 32x32 has a NRF code number 10492. |
| 5 | INDUSTRY_SUBGROUP |  |  |  | VARCHAR (10) | Can be used to hold a sub-grouping code used by industry standards to further identify the differentiator. For example, in the US, the National Retail Federation uses a subgroup for colors (e.g. purple is defined as 500; dark purple represents a range from 501 - 509, medium purple represents a range from 510 - 519, bright purple represents a range from 520 - 529, etc.). |
| 6 | CREATE_DATETIME |  |  | Y | Date | Date/time stamp of when the record was created. This date/time will be used in export processing. This value should only be populated on insert - it should never be updated. |
| 7 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | Holds the Oracle user-id of the user who most recently updated this record. |
| 8 | LAST_UPDATE_DATETIME |  |  | Y | Date | Holds the date time stamp of the most recent update by the |
| 9 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_DIFF_IDS|PK||||DIFF_ID|ASC|
|DIFF_IDS_I1|||||DIFF_TYPE|ASC|

---

## Table: DIFF_IDS_TL

**Description:** This is the translation table for DIFF_IDS table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | DIFF_ID | P | F | Y | VARCHAR (10) | Contains the code to uniquely identify a differentiator. |
| 3 | DIFF_DESC |  |  | Y | VARCHAR (120) | Description of the differentiator (for example, Blueberry, Shower Fresh, Red, etc.) |
| 4 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 6 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 7 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_DIFF_IDS_TL|PK||||LANG|ASC|
||||||DIFF_ID|ASC|

---

## Table: DIFF_RANGE_DETAIL

**Description:** This table contains the differentiator IDs selected from up to three different differentiator groups that are associated with the differentiator range.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DIFF_RANGE | P | F | Y | NUMERIC (4) | Contains the number used to uniquely identify the differentiator range. |
| 2 | SEQ_NO | P |  | Y | NUMERIC (4) | Contains a sequence number used to uniquely identify the combination of differentiators in a particular row on the table. |
| 3 | DIFF_1 |  | F | Y | VARCHAR (10) | Contains the one of the differentiator values, that can be combined with up to two other differentiator values, to make up a unique row in the differentiator range. At least one differentiator is required for each row. This differentiator must belong to the differentiator group specified in DIFF_RANGE_HEAD.DIFF_GROUP_1. |
| 4 | DIFF_2 |  | F |  | VARCHAR (10) | Contains the optional second differentiator value that is associated with this row in the differentiator range. This value will be null if no DIFF_GROUP_2 has been specified for the range on DIFF_RANGE_HEAD. Otherwise, this differentiator value must belong to the differentiator group specified in the DIFF_RANGE_HEAD.DIFF_GROUP_2. |
| 5 | DIFF_3 |  | F |  | VARCHAR (10) | Contains the optional third differentiator value that is associated with thisi row in the differentiator range. This value will be null if no DIFF_GROUP_3 has been specified for the range on DIFF_RANGE_HEAD Otherwise, this differentiator value must belong to the differentiator group specified in the DIFF_RANGE_HEAD.DIFF_GROUP_3. |
| 6 | QTY |  |  |  | NUMERIC (12,4) | This field will contain the ratio or percentage associated with this row in a diff range. This ratio or percentage can be used when when creating fashion prepacks, to determine how many items to include in the prepack for an item parent/diff range combination. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_DIFF_RANGE_DETAIL|PK||||DIFF_RANGE|ASC|
||||||SEQ_NO|ASC|
|DIFF_RANGE_DETAIL_I2|||||DIFF_2|ASC|
|DIFF_RANGE_DETAIL_I1|||||DIFF_1|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|DIFF_RANGE_DETAIL_I3|||||DIFF_3|ASC|

---

## Table: DIFF_RANGE_HEAD

**Description:** A differentiator range is a subset of up to three differentiator group that are commonly used together by a retailer. For example, men s pants commonly are sized with both a length and a waist size. Using a differentiator range allows for matrix of these sizes to be created to facilitate item creation and creation of fashion prepacks.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DIFF_RANGE | P |  | Y | NUMERIC (4) | Contains the number used to uniquely identify the differentiator range. |
| 2 | DIFF_RANGE_DESC |  |  | Y | VARCHAR (120) | Contains the differentiator range description. |
| 3 | DIFF_GROUP_1 |  | F | Y | VARCHAR (10) | Contains the required first differentiator group associated with the range. All DIFF_1 values for the diff range on DIFF_RANGE_DETAIL must be a member of this differentiator group. |
| 4 | DIFF_GROUP_2 |  | F |  | VARCHAR (10) | Contains the optional second differentiator group associated with the range. If populated, all DIFF_2 values for the diff range on DIFF_RANGE_DETAIL must be a member of this differentiator group. If this value is not populated, no detail records on DIFF_RANGE_DETAIL will contain a DIFF_2 value. |
| 5 | DIFF_GROUP_3 |  | F |  | VARCHAR (10) | Contains the optional third differentiator group associated with the range. If populated, all DIFF_3 values for the diff range on DIFF_RANGE_DETAIL must be a member of this differentiator group. If this value is not populated, no detail records on DIFF_RANGE_DETAIL will contain a DIFF_3 value. |
| 6 | DIFF_RANGE_TYPE |  |  |  | VARCHAR (6) | This field will indicate whether the quantities associated with the diffs in the range are ratios or percentages. Valid values are P and R. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_DIFF_RANGE_HEAD|PK||||DIFF_RANGE|ASC|
|DIFF_RANGE_HEAD_I3|||||DIFF_GROUP_3|ASC|
|DIFF_RANGE_HEAD_I2|||||DIFF_GROUP_2|ASC|
|DIFF_RANGE_HEAD_I1|||||DIFF_GROUP_1|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_DIFF_RANGE_HEAD_DIFF_RNG_T|diff_range_type in ('P', 'R')|






|Type|Column / Constraint Name|Details|
|---|---|---|
||||

---

## Table: DIFF_RANGE_HEAD_TL

**Description:** This is the translation table for DIFF_RANGE_HEAD table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | DIFF_RANGE | P | F | Y | NUMERIC (4) | Contains the number used to uniquely identify the differentiator range. |
| 3 | DIFF_RANGE_DESC |  |  | Y | VARCHAR (120) | Contains the differentiator range description. |
| 4 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 6 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 7 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_DIFF_RANGE_HEAD_TL|PK||||LANG|ASC|
||||||DIFF_RANGE|ASC|

---

## Table: DIFF_RATIO_DETAIL

**Description:** This table will hold all of the diff ratios. All diff IDs will be members of the associated groups on the diff_ratio_head table

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DIFF_RATIO_ID | P | F | Y | NUMERIC (6) | This field holds the identifier for the diff_ratio_detail record. |
| 2 | SEQ_NO | P |  | Y | NUMERIC (10) | This is the order at which the code is displayed when the user selects from the drop down list item. |
| 3 | STORE |  | F |  | NUMERIC (10) | This field holds the store number where the size ratio is applicable. If this field is NULL, the size ratio is for the subclass level, not the subclass/store level. |
| 4 | DIFF_1 |  |  | Y | VARCHAR (10) | This field will contain the differentiator value. |
| 5 | DIFF_2 |  |  |  | VARCHAR (10) | This field will contain the differentiator value corresponding to diff_ratio_head when a diff_group_2 is defined. |
| 6 | DIFF_3 |  |  |  | VARCHAR (10) | This field will contain the differentiator value corresponding to diff_ratio_head when a diff_group_3 is defined. |
| 7 | QTY |  |  | Y | NUMERIC (12,4) | This field holds the sales quantity for sizes from size1 and size2. |
| 8 | PCT |  |  | Y | NUMERIC (12,4) | This field holds the ratio for sizes from size1 and size2. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_DIFF_RATIO_DETAIL|PK||||DIFF_RATIO_ID|ASC|
||||||SEQ_NO|ASC|
|DIFF_RATIO_DETAIL_I2|||||DIFF_1|ASC|
||||||DIFF_2|ASC|
||||||DIFF_3|ASC|
|DIFF_RATIO_DETAIL_I3|||||STORE|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|DIFF_RATIO_DETAIL_I1|UN||||DIFF_RATIO_ID|ASC|
||||||STORE|ASC|
||||||DIFF_1|ASC|
||||||DIFF_2|ASC|
||||||DIFF_3|ASC|

---

## Table: DIFF_RATIO_HEAD

**Description:** This table will hold all the dept/class/subclass parameters that are used to build size ratios

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DIFF_RATIO_ID | P |  | Y | NUMERIC (6) | This field holds the identifier for the diff_ratio_head record. |
| 2 | DESCRIPTION |  |  | Y | VARCHAR (120) | This field holds the description of the size_ratio_id. |
| 3 | DEPT |  | F | Y | NUMERIC (4) | This field holds the associated department number of the items to be included in the list. |
| 4 | CLASS |  | F | Y | NUMERIC (4) | This field holds the associated class number of the items to be included in the list. |
| 5 | SUBCLASS |  | F | Y | NUMERIC (4) | This field holds the associated subclass number of the items to be included in the list. There can only be one dept/class/subclass per system generated size ratio. |
| 6 | DIFF_GROUP_1 |  |  | Y | VARCHAR (10) | Contains the required first diff group associated with the ratio. All diff_1 values for the diff ratio on diff_ratio_detail must be a member of this diff group. |
| 7 | DIFF_GROUP_2 |  |  |  | VARCHAR (10) | Contains the optional second diff group associated with the ratio. If populated, all diff_2 values for the diff ratio on diff_ratio_detail must be a member of this diff. If this value is not populated, no detail records on diff_ratio_detail will contain a diff_2 value. |
| 8 | DIFF_GROUP_3 |  |  |  | VARCHAR (10) | Contains the optional third diff group associated with the ratio. If populated, all diff_3 values for the diff ratio on diff_ratio_detail must be a member of this diff. If this value is not populated, no detail records on diff_ratio_detail will contain a diff_3 value. |
| 9 | SYSTEM_GEN_IND |  |  | Y | VARCHAR (1) | This field will contain a Y if the size ration record was system generated (batch), N if it was manually created. |
| 10 | REGULAR_SALES_IND |  |  |  | VARCHAR (1) | This field will contain a Y if regular sales history is to be used, otherwise it will contain a N. If system_gen_ind = N, this will be null. |
| 11 | PROM_SALES_IND |  |  |  | VARCHAR (1) | This field will contain a Y if promotional sales history is to be used; otherwise it will contain a N. If system_gen_ind = N, this will be null. |
| 12 | CLEAR_SALES_IND |  |  |  | VARCHAR (1) | This field will contain a Y if clearance sales history is to be used; otherwise it will contain a N. If system_gen_ind = N, this will be null. |
| 13 | PERIOD_TYPE |  |  |  | VARCHAR (1) | This field holds the type of period to grab the history for. Valid values are Date-to-date, Weeks-to-date, and Last weeks. If system_gen_ind = N this field will be NULL. |
| 14 | START_DATE |  |  |  | Date | This field will hold the starting date for the sales history to be used. It will always be populated if system generated(batch). If system_gen_ind = N, this field will be NULL. |
| 15 | END_DATE |  |  |  | Date | This field will hold the ending date for sales history to be used. It will be populated using the D and W period types. If system_gen_ind = N, this will be NULL. |
| 16 | WEEKS_BACK |  |  |  | NUMERIC (3) | This field will hold the weeks back of sales history to be used. It will be populated when using the L period type. If system_gen_ind = N, this will be NULL. |
| 17 | LAST_REVIEW_DATE |  |  |  | Date | This field will hold the date of the last time size ratios were built for this size ratio. If system_gen_ind = N, this will be NULL. |
| 18 | REVIEW_WEEKS |  |  |  | NUMERIC (3) | This field will hold the number of weeks from the last review date to rebuild the size ratios for the size ratio. If system_gen_ind = N, this will be NULL. |
| 19 | UPDATE_IND |  |  |  | VARCHAR (1) | This field will indicate whether any size ratio parameters have changed that will affect the size ratios and flag the batch program to rebuild the size ratios. If system_gen_ind = N, this will be NULL. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_DIFF_RATIO_HEAD|PK||||DIFF_RATIO_ID|ASC|
|DIFF_RATIO_HEAD_I1|||||DEPT|ASC|
||||||CLASS|ASC|
||||||SUBCLASS|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_DF_RATIO_HD_CLEAR_SALES_IN|(system_gen_ind = 'Y' and clear_sales_ind IN ('Y','N')) or (system_gen_ind = 'N' and clear_sales_ind is NULL)<br>|
||CHK_DF_RATIO_HD_END_DATE|((system_gen_ind = 'Y' and period_type IN ('D','W') and end_date is not NULL) or (system_gen_ind = 'Y' and period_type = 'L' and<br>end_date is NULL)) or (system_gen_ind = 'N' and end_date is NULL)<br>|
||CHK_DF_RATIO_HD_LAST_REV_DATE|(system_gen_ind = 'Y') or (system_gen_ind = 'N' and last_review_date is NULL)<br>|
||CHK_DF_RATIO_HD_PERIOD_TYPE|(system_gen_ind = 'Y' and period_type IN ('D','W','L')) or (system_gen_ind = 'N' and period_type is NULL)<br>|
||CHK_DF_RATIO_HD_PROM_SALES_IND|(system_gen_ind = 'Y' and prom_sales_ind IN ('Y','N')) or (system_gen_ind = 'N' and prom_sales_ind is NULL)|






|Type|Column / Constraint Name|Details|
|---|---|---|
||||
||CHK_DF_RATIO_HD_REG_SALES_IND|(system_gen_ind = 'Y' and regular_sales_ind IN ('Y','N')) or (system_gen_ind = 'N' and regular_sales_ind is NULL)<br>|
||CHK_DF_RATIO_HD_REVIEW_WEEKS|(system_gen_ind = 'Y' and review_weeks is not NULL) or (system_gen_ind = 'N' and review_weeks is NULL)<br>|
||CHK_DF_RATIO_HD_START_DATE|(system_gen_ind = 'Y' and start_date is not NULL) or (system_gen_ind = 'N' and start_date is NULL)<br>|
||CHK_DF_RATIO_HD_SYSTEM_GEN_IND|system_gen_ind IN ('Y','N')<br>|
||CHK_DF_RATIO_HD_UPDATE_IND|(system_gen_ind = 'Y' and update_ind IN ('Y','N')) or (system_gen_ind = 'N' and update_ind is NULL)<br>|
||CHK_DF_RATIO_HD_WEEKS_BACK|((system_gen_ind = 'Y' and period_type = 'L' and weeks_back is not NULL) or ( system_gen_ind = 'Y' and period_type in ('D','W') and<br>weeks_back is NULL)) or (system_gen_ind = 'N' and weeks_back is NULL)<br>|
|Column Level|SYSTEM_GEN_IND||

---

## Table: DIFF_RATIO_HEAD_TL

**Description:** This is the translation table for DIFF_RATIO_HEAD table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | DIFF_RATIO_ID | P | F | Y | NUMERIC (6) | This field holds the identifier for the diff_ratio_head record. |
| 3 | DESCRIPTION |  |  | Y | VARCHAR (120) | This field holds the description of the size_ratio_id. |
| 4 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 6 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 7 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_DIFF_RATIO_HEAD_TL|PK||||LANG|ASC|
||||||DIFF_RATIO_ID|ASC|

---

## Table: DIFF_TYPE

**Description:** An item can be differentiated from another item based on various attributes like length, size, color, flavor, etc. These differentiating attributes of items are called differentiator types. This table contains one row for each diff type defined within Oracle Retail.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DIFF_TYPE | P |  | Y | VARCHAR (6) | Contains the code used to uniquely identify a differentiator type. |
| 2 | DIFF_TYPE_DESC |  |  | Y | VARCHAR (120) | Contains the description of the differentiator type. |
| 3 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |
| 4 | CREATE_DATETIME |  |  | Y | Date | This column holds the record creation date. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_DIFF_TYPE|PK||||DIFF_TYPE|ASC|

---

## Table: DIFF_TYPE_CFA_EXT

**Description:** This is the custom attribute extension table for the entity DIFF_TYPE.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DIFF_TYPE | P | F | Y | VARCHAR (6) | Contains the code used to uniquely identify a differentiator type. |
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
| 25 | DATE_23 |  |  |  | Date | This column holds data related to the attribute defined on the CFA_ATTRIB table that references DATE_22 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 26 | DATE_24 |  |  |  | Date | This column holds data related to the attribute defined on the CFA_ATTRIB table that references DATE_23 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 27 | DATE_25 |  |  |  | Date | This column holds data related to the attribute defined on the CFA_ATTRIB table that references DATE_23 in CFA_ATTRIB.STORAGE_COL_NAME. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_DIFF_TYPE_CFA_EXT|PK||||DIFF_TYPE|ASC|
||||||GROUP_ID|ASC|

---

## Table: DIFF_TYPE_TL

**Description:** This is the translation table for DIFF_TYPE table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | DIFF_TYPE | P | F | Y | VARCHAR (6) | Contains the code used to uniquely identify a differentiator type. |
| 3 | DIFF_TYPE_DESC |  |  | Y | VARCHAR (120) | Contains the description of the differentiator type. |
| 4 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 6 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 7 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_DIFF_TYPE_TL|PK||||LANG|ASC|
||||||DIFF_TYPE|ASC|

---

## Table: DIFF_X_TEMP

**Description:** This table stores all the diff_x/diff_z combinations.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DIFF_X |  |  | Y | VARCHAR (10) | Stores diff_x value |
| 2 | DIFF_Z |  |  | Y | VARCHAR (10) | Stores diff_z_value |
| 3 | SEQ_NO |  |  |  | NUMERIC (10) | This is the order at which the code is displayed when the user selects from the drop down list item. |

---

## Table: DIFF_Z_TEMP

**Description:** Used as a base table for the Z axis in podiffmx.fmb.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DIFF_Z |  |  | Y | VARCHAR (10) | Stores all possible diff_z values |
| 2 | SEQ_NO |  |  | Y | NUMERIC (10) | This is the order at which the code is displayed when the user selects from the drop down list item. |
| 3 | VALUE |  |  |  | NUMERIC (12,4) | Stores diff z value |
| 4 | COPY_IND |  |  | Y | VARCHAR (1) | Indicates where this diff_z is to be copied to. (used in copy window of podiffmx.fmb) |

---

## Table: RECLASS_ERROR_LOG

**Description:** This table will hold the results of the validation process for Reclass events. Records will be written to this table by the Reclass validation batch process. When run in the Pre-validation process, records will be written with a process_ind field value of P. When run in the Reclass Execution process, records will be written with a process_ind field value of E. Records that pass validation will be written with a success_ind value of P, and records that fail validation will be written with a success_ind field value of R.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | RECLASS_NO | P |  | Y | NUMERIC (4) | This field contains the primary key of reclass_head table, which holds the information about a reclass event. |
| 2 | ITEM | P |  | Y | VARCHAR (25) | This field will hold the Item number for the item in the reclass event. |
| 3 | PROCESS_IND | P |  | Y | VARCHAR (1) | This field will hold a value indicating which reclass process created the record, the Pre-validation process P, or the Reclass Execution process E. |
| 4 | RECLASS_DATE |  |  | Y | Date | This field will hold the date that the reclass event is scheduled to take place. |
| 5 | TO_DEPT |  |  | Y | NUMERIC (4) | This field will hold the Department number that the item will be reclassified to when the reclassification is executed. |
| 6 | TO_CLASS |  |  | Y | NUMERIC (4) | This field will hold the Class number that the item will be reclassified to when the reclassification is executed. |
| 7 | TO_SUBCLASS |  |  | Y | NUMERIC (4) | This field will hold the SubClass number that the item will be reclassified to when the reclassification is executed. |
| 8 | SUCCESS_IND |  |  | Y | VARCHAR (1) | This field will hold a value to indicate if the record passed or failed validation. Value will be S (Success) if the record passed validation, and R(Reject) if it failed validation. |
| 9 | ERROR_DESC |  |  |  | VARCHAR (250) | This field will hold a value when the Success_ind field is R. The program will write one of several predefined statements depending on which validation condition the record failed. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_RECLASS_ERROR_LOG|PK||||RECLASS_NO|ASC|
||||||ITEM|ASC|
||||||PROCESS_IND|ASC|

---

## Table: RECLASS_HEAD

**Description:** This table contains one row for each reclassification that has been specified through the mass change form, MCMRHIER. SKUs are reclassified on this form using a SKU List, so there will be one record on this table for each reclassification, and the table RECLASS_SKU will contain each SKU to be reclassified.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | RECLASS_NO | P |  | Y | NUMERIC (4) | This field contains a unique number representing the reclassification number. |
| 2 | RECLASS_DESC |  |  | Y | VARCHAR (120) | This field contains a description of why the SKUs in the RECLASS_SKU table are being reclassified. |
| 3 | RECLASS_DATE |  |  | Y | Date | This field contains the effective date for the reclassification date. |
| 4 | TO_DEPT |  |  | Y | NUMERIC (4) | This field contains the department that the SKUs should now belong to on the RECLASS_DATE. |
| 5 | TO_CLASS |  |  | Y | NUMERIC (4) | This field contains the class that the SKUs should now belong to |
| 6 | TO_SUBCLASS |  |  | Y | NUMERIC (4) | This field contains the subclass that the SKUs should now belong to on the RECLASS_DATE. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_RECLASS_HEAD|PK||||RECLASS_NO|ASC|
|RECLASS_HEAD_I1|||||TO_DEPT|ASC|
||||||TO_CLASS|ASC|
||||||TO_SUBCLASS|ASC|

---

## Table: RECLASS_HEAD_TL

**Description:** This is the translation table for RECLASS_HEAD table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | RECLASS_NO | P | F | Y | NUMERIC (4) | This field contains a unique number representing the reclassification number. |
| 3 | RECLASS_DESC |  |  | Y | VARCHAR (120) | This field contains a description of why the SKUs in the RECLASS_SKU table are being reclassified. |
| 4 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 6 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 7 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_RECLASS_HEAD_TL|PK||||LANG|ASC|
||||||RECLASS_NO|ASC|
|RECLASS_HEAD_TL_I1|||||RECLASS_NO|ASC|

---

## Table: RECLASS_ITEM

**Description:** This field contains one for each SKU that is to be reclassified within the specified reclassification.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | RECLASS_NO | P | F | Y | NUMERIC (4) | This field contains a unique identifier representing the reclassification number. |
| 2 | ITEM | P |  | Y | VARCHAR (25) | This field contains the SKU or style to be reclassified. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_RECLASS_ITEM|PK||||RECLASS_NO|ASC|
||||||ITEM|ASC|
|RECLASS_ITEM_I1|||||ITEM|ASC|

---

## Table: RECLASS_ITEM_TEMP

**Description:** It is a temp table to hold the values of the old and new dept, class and subclass

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  |  |  | VARCHAR (25) | This has the item that need to be reclassified |
| 2 | NEW_DEPT |  |  |  | NUMERIC (4) | This holds the value of the new dept of reclassified item |
| 3 | NEW_CLASS |  |  |  | NUMERIC (4) | This holds the value of the new class of reclassified item |
| 4 | NEW_SUBCLASS |  |  |  | NUMERIC (4) | This holds the value of the new subclass of reclassified item |
| 5 | OLD_DEPT |  |  |  | NUMERIC (4) | This holds the value of the old dept of reclassified item |
| 6 | OLD_CLASS |  |  |  | NUMERIC (4) | This holds the value of the old class of reclassified item |
| 7 | OLD_SUBCLASS |  |  |  | NUMERIC (4) | This holds the value of the old subclass of reclassified item |
| 8 | RECLASS_DATE |  |  |  | Date | This holds the reclassification effective date |

---

## Table: RELATED_ITEM_DETAIL

**Description:** This table contains the related items to a main_item in related_item_head. This table will contain one row for each related item for a given main-item and relationship type (Cross Sell, Up Sell, Substitute etc). E.g. if one needs to setup item2 as substitutes for item1, then related_item_head table will contain one row with item1 and relationship-type as substitute. The related_item_detail table will have item2 and item3 (joined using relationship_id foreign key).

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | RELATIONSHIP_ID | P | F | Y | NUMERIC (20) | Unique identifier of the relationship. Matches to RELATED_ITEM_HEAD.Relationship_Id. |
| 2 | RELATED_ITEM | P | F | Y | VARCHAR (25) | Item id of the related item. |
| 3 | PRIORITY |  |  |  | NUMERIC (4) | Applicable only in case of relationship type SUBS. In case of multiple related substitute items, this column could be used (optional) to define relative priority. |
| 4 | START_DATE |  |  |  | Date | From this date related item can be used on transactions. |
| 5 | END_DATE |  |  |  | Date | Till this date related item can be used on transactions. A value of null means that it is effective forever. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_RELATED_ITEM_DETAIL|PK||||RELATIONSHIP_ID|ASC|
||||||RELATED_ITEM|ASC|
|RELATED_ITEM_DETAIL_I1|||||RELATED_ITEM|ASC|

---

## Table: RELATED_ITEM_HEAD

**Description:** This is the header table for related items functionality. This table will contain one row for each item and relationship type (Cross Sell, Sub Sell, Substitute etc). E.g. if one needs to setup item2 and item3 as substitutes for item1, then related_item_head table will contain one row with item1 and relationship-type as substitute. The related_item_detail table will have item2 and item3 (joined using relationship_id foreign key).

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | RELATIONSHIP_ID | P |  | Y | NUMERIC (20) | Unique identifier for each relationship header. |
| 2 | ITEM |  |  | Y | VARCHAR (25) | Item for which the relationships are defined. |
| 3 | RELATIONSHIP_NAME |  |  | Y | VARCHAR (255) | Name given to the relationship. |
| 4 | RELATIONSHIP_TYPE |  |  | Y | VARCHAR (6) | Describes the type of relationship. Values are configured in code_detail table under code_type IREL. |
| 5 | MANDATORY_IND |  |  | Y | VARCHAR (1) | Indicates whether the relationship is mandatory. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_RELATED_ITEM_HEAD|PK||||RELATIONSHIP_ID|ASC|
|RELATED_ITEM_HEAD_I1|||||ITEM|ASC|

### Constraints

|Type|Column / Constraint<br>Name|Details|
|---|---|---|
|Table Level|RELATED_ITEM_HEAD_CHK1|MANDATORY_IND IN ('Y','N')<br>|
|Column Level|MANDATORY_IND||

---

## Table: RELATED_ITEM_HEAD_TL

**Description:** This is the translation table for RELATED_ITEM_HEAD table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | RELATIONSHIP_ID | P | F | Y | NUMERIC (20) | Unique identifier for each relationship header. |
| 3 | RELATIONSHIP_NAME |  |  | Y | VARCHAR (255) | Name given to the relationship. |
| 4 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 6 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 7 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_RELATED_ITEM_HEAD_TL|PK||||LANG|ASC|
||||||RELATIONSHIP_ID|ASC|

---

## Table: RELITEM_EXPORT_STG

**Description:** This table is a staging table for related item records as they wait to be extracted. This table is automatically inserted into, as records are processed by Oracle Retail. This table will be scanned by a daily batch job to extract new, updated and deleted related item records.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SEQ_NO | P |  | Y | NUMERIC (15) | The sequence in which the records are placed in the table. |
| 2 | RELATIONSHIP_ID |  |  | Y | NUMERIC (20) | Unique identifier for each relationship header. |
| 3 | ITEM |  |  |  | VARCHAR (25) | Item for which the relationships are defined. |
| 4 | RELATED_ITEM |  |  |  | VARCHAR (25) | Item ID of the related item. |
| 5 | ACTION_TYPE |  |  | Y | VARCHAR (15) | Indicates if the related item information has been added, changed or deleted. Valid values are 'relitemheadcre', 'relitemheadmod', 'relitemheaddel', 'relitemdetcre', 'relitemdetmod' and 'relitemdetdel'. |
| 6 | BASE_EXTRACTED_IND |  |  | Y | VARCHAR (1) | Indicates whether the record has been extracted or not. Upon record insert, this will be set to 'N'. After running the batch job, this will then be set to 'Y'. |
| 7 | CUSTOM1_EXTRACTED_IND |  |  |  | VARCHAR (1) | Indicates whether the record has been extracted or not for a custom extraction. |
| 8 | CUSTOM2_EXTRACTED_IND |  |  |  | VARCHAR (1) | Indicates whether the record has been extracted or not for a custom extraction. |
| 9 | CUSTOM3_EXTRACTED_IND |  |  |  | VARCHAR (1) | Indicates whether the record has been extracted or not for a custom extraction. |
| 10 | CUSTOM4_EXTRACTED_IND |  |  |  | VARCHAR (1) | Indicates whether the record has been extracted or not for a custom extraction. |
| 11 | PROCESS_ID |  |  |  | NUMERIC (15) | Process ID where the record belongs to. |
| 12 | TRANSACTION_DATETIME |  |  | Y | Date | Time of record creation. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_RELITEM_EXPORT_STG|PK||||SEQ_NO|ASC|

---

## Table: SKULIST_CRITERIA

**Description:** This table contains one row for each step performed to obtain a particular item list when item lists are created by criteria. For each step performed, either adding or deleting items, the criteria will be saved onto this table. This table can then be used to rebuild an item list at the time of use.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SKULIST | P | F | Y | NUMERIC (8) | This field contains the number that uniquely identifies the item list. |
| 2 | SEQ_NO | P |  | Y | NUMERIC (6) | This field contains the unique order in which the particular criteria should be applied to the item list. |
| 3 | ACTION_TYPE |  |  | Y | VARCHAR (1) | This field indicates whether the criteria is being used to add items to the list or delete items from the list. Valid values are: A - Add Items |
| 4 | ITEM_LEVEL |  |  |  | NUMERIC (1) | This field indicates which item level the items being added/deleted to list resides, level 1, 2 or 3. |
| 5 | ITEM |  | F |  | VARCHAR (25) | This field contains the unique Identifier of item that is being added to or deleted from the item list. |
| 6 | UDA_ID |  | F |  | NUMERIC (5) | This field contains the unique identifier for the user defined attribute of the item being added/deleted to the item list. |
| 7 | UDA_VALUE_MIN_DATE |  |  |  | Date | This field contains the minimum date associated with the UDA ID to be added/deleted to the item list. |
| 8 | UDA_VALUE_MAX_DATE |  |  |  | Date | This field contains the maximum date associated with the UDA ID to be added/deleted to the item list. |
| 9 | UDA_VALUE_LOV |  | F |  | NUMERIC (5) | This field contains the value of the UDA for the specified UDA ID to be added/deleted to the Item List. |
| 10 | SUPPLIER |  | F |  | NUMERIC (10) | This field contains the supplier of the items which are being added/deleted to the item list. |
| 11 | DEPT |  | F |  | NUMERIC (4) | This field contains the department of the items which are being added/deleted from the Item List. |
| 12 | CLASS |  | F |  | NUMERIC (4) | This field contains the class of the items which are being added/deleted from the Item List. |
| 13 | SUBCLASS |  | F |  | NUMERIC (4) | This field contains the subclass of the items which are being added/deleted from the Item List. |
| 14 | DIFF_1 |  |  |  | VARCHAR (10) | If populated, it indicates that for this item list, one of the criteria for adding items to the list is based on this value as Diff 1 for an item. Diff 1 can be added in conjunction with a parent item or without. |
| 15 | DIFF_2 |  |  |  | VARCHAR (10) | If populated, it indicates that for this item list, one of the criteria for adding items to the list is based on this value as Diff 2 for an item. Diff 2 can be added in conjunction with a parent item or without. |
| 16 | DIFF_3 |  |  |  | VARCHAR (10) | If populated, it indicates that for this item list, one of the criteria for adding items to the list is based on this value as Diff 3 for an item. Diff 3 can be added in conjunction with a parent item or without. |
| 17 | DIFF_4 |  |  |  | VARCHAR (10) | If populated, it indicates that for this item list, one of the criteria for adding items to the list is based on this value as Diff 4 for an item. Diff 4 can be added in conjunction with a parent item or without. |
| 18 | SEASON_ID |  | F |  | NUMERIC (3) | This field contains unique identifier for the season associated with the items which are being added/deleted from the item list. |
| 19 | PHASE_ID |  | F |  | NUMERIC (3) | This field contains unique identifier for the phase associated with the items which are being added/deleted from the item list. |
| 20 | CREATE_DATETIME |  |  | Y | Date | This field contains the date/time stamp of when the record was created. This date/time will be used in export processing. This value is populated on insert and never be updated. |
| 21 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field holds the date time stamp of the most recent update by the last_update_id. This field is required by the database. |
| 22 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field holds the Oracle user-id of the user who most recently updated this record. This field is required by the database. |
| 23 | ITEM_PARENT |  | F |  | VARCHAR (25) | If populated, it indicates that for this item list, one of the criteria for adding items to the list is based on this value as the parent for an item. |
| 24 | ITEM_GRANDPARENT |  | F |  | VARCHAR (25) | If populated, it indicates that for this item list, one of the criteria for adding items to the list is based on this value as the grandparent for an item. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SKULIST_CRITERIA|PK||||SKULIST|ASC|
||||||SEQ_NO|ASC|
|SKULIST_CRITERIA_I12|||||DIFF_3|ASC|
|SKULIST_CRITERIA_I11|||||ITEM_GRANDPARENT|ASC|
|SKULIST_CRITERIA_I1|||||ITEM|ASC|
|SKULIST_CRITERIA_I4|||||UDA_ID|ASC|
||||||UDA_VALUE_LOV|ASC|
|SKULIST_CRITERIA_I3|||||SUPPLIER|ASC|
|SKULIST_CRITERIA_I8|||||SEASON_ID|ASC|
||||||PHASE_ID|ASC|
|SKULIST_CRITERIA_I13|||||DIFF_4|ASC|
|SKULIST_CRITERIA_I10|||||ITEM_PARENT|ASC|
|SKULIST_CRITERIA_I5|||||DIFF_1|ASC|
|SKULIST_CRITERIA_I6|||||DIFF_2|ASC|
|SKULIST_CRITERIA_I2|||||DEPT|ASC|
||||||CLASS|ASC|
||||||SUBCLASS|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_SKULIST_CRIT_ACTION_TYPE|ACTION_TYPE IN ('A', 'D')<br>|
||CHK_SKULIST_CRIT_HIERARCHY_CHK|(DEPT IS NULL AND CLASS IS NULL AND SUBCLASS IS NULL) OR (DEPT IS NOT NULL AND CLASS IS NULL AND SUBCLASS IS NULL) OR<br>(DEPT IS NOT NULL AND CLASS IS NOT NULL AND SUBCLASS IS NULL) OR (DEPT IS NOT NULL AND CLASS IS NOT NULL AND SUBCLASS<br>IS NOT NULL)<br>|






|Type|Column / Constraint Name|Details|
|---|---|---|
||CHK_SKULIST_CRIT_UDA_DATE_CHK|(UDA_VALUE_MAX_DATE IS NULL AND UDA_VALUE_MIN_DATE IS NULL) OR (UDA_VALUE_MAX_DATE IS NOT NULL AND<br>UDA_VALUE_MIN_DATE IS NOT NULL AND UDA_ID IS NOT NULL)<br>|
||CHK_SKULIST_CRIT_UDA_VALUE_CHK|(UDA_VALUE_LOV IS NULL) OR (UDA_VALUE_LOV IS NOT NULL AND UDA_ID IS NOT NULL)<br>|
|Column Level|ACTION_TYPE||

---

## Table: SKULIST_DEPT

**Description:** If using data level security in RMS, this table is used to hold all the department/class/subclass combinations that are valid for the item list. Only users with access to these department/class/subclass combinations can view or use this item list.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SKULIST | P |  | Y | NUMERIC (8) | This field contains the number which uniquely identifies the Item List |
| 2 | DEPT | P |  | Y | NUMERIC (4) | This field contains the department from which items can be added to the Item List. |
| 3 | CLASS | P |  | Y | NUMERIC (4) | This field contains the class from which items can be added to the Item List. |
| 4 | SUBCLASS | P |  | Y | NUMERIC (4) | This field contains the subclass from which items can be added to the Item List. |

---

## Table: SKULIST_DEPT_CLASS_SUBCLASS

**Description:** This Table is created from SKULIST_DETAIL and ITEM_MASTER

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SKULIST | P |  | Y | NUMERIC (8) | SkuList Number |
| 2 | DEPT | P |  | Y | NUMERIC (4) | Department |
| 3 | CLASS | P |  | Y | NUMERIC (4) | Class |
| 4 | SUBCLASS | P |  | Y | NUMERIC (4) | Subclass |

---

## Table: SKULIST_DETAIL

**Description:** This table contains details of item list at the item level.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SKULIST | P | F | Y | NUMERIC (8) | This field contains the number which uniquely identifies the Item List |
| 2 | ITEM | P | F | Y | VARCHAR (25) | This field contains the unique identifier for the item included in item list. |
| 3 | ITEM_LEVEL |  |  | Y | NUMERIC (1) | This field indicates which item level the items being included in the list resides, level 1, 2 or 3. |
| 4 | TRAN_LEVEL |  |  | Y | NUMERIC (1) | This field indicates the level on which transactions are done for the item. |
| 5 | PACK_IND |  |  | Y | VARCHAR (1) | This field indicates if the item in the list is a pack item. |
| 6 | INSERT_ID |  |  | Y | VARCHAR (30) | This field holds the username of the individual who added the item to the itemlist. This field is updated when the item is initially added to the itemlist or when the itemlist is rebuilt. |
| 7 | INSERT_DATE |  |  | Y | Date | This field holds the date the item was added to the item list. This field is updated when the item is initially added to the itemlist or when the itemlist is rebuilt. |
| 8 | CREATE_DATETIME |  |  | Y | Date | This field contains the date/time stamp of when the record was created. This date/time will be used in export processing. This value is populated on insert and never be updated. |
| 9 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field holds the date time stamp of the most recent update by the last_update_id. This field is required by the database. |
| 10 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field holds the Oracle user-id of the user who most recently updated this record. This field is required by the database. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SKULIST_DETAIL|PK||||SKULIST|ASC|
||||||ITEM|ASC|
|SKULIST_DETAIL_I1|||||ITEM|ASC|

---

## Table: SKULIST_HEAD

**Description:** This table contains the header information for each item list created within the system.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SKULIST | P |  | Y | NUMERIC (8) | This field contains the number which uniquely identifies the Item List |
| 2 | SKULIST_DESC |  |  | Y | VARCHAR (120) | This field contains the description which corresponds to the SKU list number. |
| 3 | CREATE_DATE |  |  | Y | Date | This field contains the date that the item list was created. |
| 4 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the Oracle user ID of the user that created the item list. |
| 5 | STATIC_IND |  |  | Y | VARCHAR (1) | This field indicates whether the item list is considered dynamic or static. If N, then it is a dynamic item list, which can be rebuilt prior to usage to update the list based on the latest items that fit the criteria of the list. If Y, then the list can only be updated by manually updating the items in the list. |
| 6 | LAST_REBUILD_DATE |  |  | Y | Date | This field contains the date that the item list was last rebuilt. An item list can only be rebuild if it is a dynamic item list (i.e. STATIC_IND = N). |
| 7 | USER_SECURITY_IND |  |  | Y | VARCHAR (1) | This field indicates whether user level security for an item list is on or off. If this is Y for an item list, then only the person who created the list can select it for transactions in RMS. If N, it can be used by anyone. |
| 8 | COMMENT_DESC |  |  |  | VARCHAR (2000) | This field contains comments about the SKU list. |
| 9 | FILTER_ORG_ID |  |  |  | NUMERIC (10) | The ID of the organziational hierarchy to which the item list is assigned. The level of the organziational hierarchy is determined based on SECURITY_CONFIG_OPTIONS.SKULIST_ORG_LEVEL_CODE. The value in this column will be used to control the item lists a user can use when utilized in RMS, if data level security has been set up for users in the system. This value is not required. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SKULIST_HEAD|PK||||SKULIST|ASC|
|SKULIST_HEAD_I1|||||CREATE_ID|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_SKULIST_HEAD_STATIC_IND|STATIC_IND IN ('Y', 'N')<br>|
||CHK_SKULIST_HEAD_USER_SECURITY|user_security_ind in ('Y', 'N')<br>|
|Column Level|STATIC_IND||
||USER_SECURITY_IND||

---

## Table: SKULIST_HEAD_TL

**Description:** This is the translation table for SKULIST_HEAD table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | SKULIST | P | F | Y | NUMERIC (8) | This field contains the number which uniquely identifies the Item List |
| 3 | SKULIST_DESC |  |  | Y | VARCHAR (120) | This field contains the description which corresponds to the SKU list number. |
| 4 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 6 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 7 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SKULIST_HEAD_TL|PK||||LANG|ASC|
||||||SKULIST|ASC|

---

## Table: UDA

**Description:** This table contains one row for each Used-Defined Attribute (UDA) defined within the RMS. Generally, a UDA is any attribute that does not have specific processing in the RMS. There are three types of UDAs in RMS - Date, Free Form and List of Values

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | UDA_ID | P |  | Y | NUMERIC (5) | This field contains a unique number identifying the User Defined Attribute. |
| 2 | UDA_DESC |  |  | Y | VARCHAR (120) | This field contains a description of the User-Defined Attribute. |
| 3 | MODULE |  |  | Y | VARCHAR (20) | This field identifies which module the UDA belongs to. Valid value is: ITEM |
| 4 | DISPLAY_TYPE |  |  | Y | VARCHAR (2) | This field is used to store the display type (how the UDA values will be displayed to the user) for the given UDA. The valid values are DT-Date, FF - Free From, LV - List of values |
| 5 | DATA_TYPE |  |  |  | VARCHAR (12) | This field contains the data type of any valid values for the UDA. This is an optional field used only if specific processing is needed to validate the data type of the UDA values. Valid values are: Number, Alphanumeric and Date |
| 6 | DATA_LENGTH |  |  |  | NUMERIC (3) | This field contains the data length of any valid values for the UDA. This is an optional field used only if specific processing is needed to validate the data length of the UDA values. |
| 7 | SINGLE_VALUE_IND |  |  | Y | VARCHAR (1) | This field indicates whether or not the UDA should be constrained to having at most one value. |
| 8 | FILTER_ORG_ID |  |  |  | NUMERIC (10) | This field contains the ID of the Organizational Hierarchy that the UDA is assigned to. This field will be used to control the UDAs a user can see in |
| 9 | FILTER_MERCH_ID |  |  |  | NUMERIC (4) | This field contains the ID of the Merchandise Hierarchy that the UDA is assigned to. This field will be used to control the UDAs a user can see in the UDA LOV when the link between the user and the Merchandise Hierarchy has been established. |
| 10 | FILTER_MERCH_ID_CLASS |  |  |  | NUMERIC (4) | This field contains the class ID of the Merchandise Hierarchy that the UDA is assigned to. |
| 11 | FILTER_MERCH_ID_SUBCLASS |  |  |  | NUMERIC (4) | This field contains the subclass ID of the Merchandise Hierarchy that the UDA is assigned to. |
| 12 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |
| 13 | CREATE_DATETIME |  |  | Y | Date | This column holds the record creation date. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_UDA|PK||||UDA_ID|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_UDA_DATA_FIELDS|((display_type = 'DT' and data_type = 'DATE') or (display_type = 'FF' and data_type = 'ALPHA') or (display_type = 'LV' and data_type in ('NUM',<br>'ALPHA')))<br>|
||CHK_UDA_DATA_LENGTH|((display_type = 'DT' and data_length is NULL) or (display_type in ('LV','FF')))<br>|
||CHK_UDA_DATA_TYPE|DATA_TYPE IN ('NUM', 'ALPHA', 'DATE')<br>|






|Type|Column / Constraint Name|Details|
|---|---|---|
||CHK_UDA_DISPLAY_TYPE|display_type in ('LV', 'FF', 'DT')<br>|
||CHK_UDA_MODULE|MODULE IN ('ITEM')<br>|
||CHK_UDA_SINGLE_VALUE_IND|SINGLE_VALUE_IND IN ('Y', 'N')<br>|
|Column Level|MODULE||
||DISPLAY_TYPE||
||DATA_TYPE||
||SINGLE_VALUE_IND||

---

## Table: UDA_ITEM_DATE

**Description:** This table contains one row for each item/attribute combination for UDAs with display type of date (DT) and contains the information about item attribute relationship, create date, update date, etc.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM | P | F | Y | VARCHAR (25) | This field contains unique alphanumeric identifier for the item. |
| 2 | UDA_ID | P | F | Y | NUMERIC (5) | This field contains a number uniquely identifying the User-Defined Attribute. |
| 3 | UDA_DATE | P |  | Y | Date | This field contains the date of the Used Defined attribute for the item. |
| 4 | CREATE_DATETIME |  |  | Y | Date | This field contains the Date/time stamp of when the record was created. This date/time will be used in export processing. This value should only be populated on insert and should never be updated. |
| 5 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field holds the date time stamp of the most recent update by an Oracle user (last_update_id). This field is required by the database. |
| 6 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field holds the Oracle user-id of the user who most recently updated this record. This field is required by the database. |
| 7 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_UDA_ITEM_DATE|PK||||ITEM|ASC|
||||||UDA_ID|ASC|
||||||UDA_DATE|ASC|
|UDA_ITEM_DATE_I1|||||UDA_ID|ASC|

---

## Table: UDA_ITEM_DEFAULTS

**Description:** This table contains one row for each default value for an item attribute. Item defaults can be assigned at various levels of the merchandise hierarchy. Any item created within the given hierarchy level will inherit the User Defined Attribute and the associated default value (if any).

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | UDA_ID | P | F | Y | NUMERIC (5) | This field contains a unique number identifying the User Defined Attribute. |
| 2 | SEQ_NO | P |  | Y | NUMERIC (8) | This field is a numeric key used to enforce uniqueness. This key is defined as a primary key and then a unique key is defined on the UDA, DEPT, CLASS, SUBCLASS fields to enforce uniqueness. |
| 3 | DEPT |  | F | Y | NUMERIC (4) | This field contains the department for which the default is being set-up. |
| 4 | CLASS |  | F | Y | NUMERIC (4) | This field contains the class for which the default is being set-up. |
| 5 | SUBCLASS |  | F | Y | NUMERIC (4) | This field contains the subclass for which the default is being set-up. |
| 6 | UDA_VALUE |  | F |  | NUMERIC (5) | This is an optional field in which a default value can be assigned, such that all items created in the hierarchy level will be assigned this UDA value initially. |
| 7 | REQUIRED_IND |  |  | Y | VARCHAR (1) | This field indicates whether or not the specified attribute is required. If Y is chosen, then all items within the specified hierarchy must already have a value for this UDA. |
| 8 | HIERARCHY_VALUE |  |  | Y | NUMERIC (1) | This field indicates which level of the hierarchy this record contains. This field is used for performance purposes and should never be updated. Valid values are: 1 - Department, 2 - Class, 3 - Subclass. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_UDA_ITEM_DEFAULTS|PK||||UDA_ID|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
||||||SEQ_NO|ASC|
|UDA_ITEM_DEFAULTS_I2|||||DEPT|ASC|
||||||CLASS|ASC|
||||||SUBCLASS|ASC|
|UDA_ITEM_DEFAULTS_I1|UN||||UDA_ID|ASC|
||||||DEPT|ASC|
||||||CLASS|ASC|
||||||SUBCLASS|ASC|
||||||UDA_VALUE|ASC|
|UDA_ITEM_DEFAULTS_I3|||||UDA_ID|ASC|
||||||UDA_VALUE|ASC|
|UDA_ITEM_DEFAULTS_I4|||||HIERARCHY_VALUE|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_UDA_ITEM_DEFAULTS_HIERARCH|(SUBCLASS IS NOT NULL AND CLASS IS NOT NULL AND DEPT IS NOT NULL AND HIERARCHY_VALUE = 3) OR (SUBCLASS IS NULL AND<br>CLASS IS NOT NULL AND DEPT IS NOT NULL AND HIERARCHY_VALUE = 2) OR (SUBCLASS IS NULL AND CLASS IS NULL AND DEPT IS<br>NOT NULL AND HIERARCHY_VALUE = 1)<br>|
||CHK_UDA_ITEM_DEFAULTS_REQ_CHK|(UDA_VALUE IS NULL AND REQUIRED_IND = 'N') OR (UDA_VALUE IS NOT NULL AND REQUIRED_IND = 'N') OR (UDA_VALUE IS NULL<br>AND REQUIRED_IND = 'Y')<br>|
||CHK_UDA_ITEM_DEFAULTS_REQ_IND|REQUIRED_IND IN ('Y', 'N')<br>|
|Column Level|REQUIRED_IND||

---

## Table: UDA_ITEM_FF

**Description:** This table contains one row for each item/attribute combination for UDAs with display type of Free Form (FF) and contains the information about item attribute relationship, create date, update date, etc.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM | P | F | Y | VARCHAR (25) | This field contains unique alphanumeric identifier for the item. |
| 2 | UDA_ID | P | F | Y | NUMERIC (5) | This field contains a number uniquely identifying the User-Defined Attribute. |
| 3 | UDA_TEXT | P |  | Y | VARCHAR (250) | This field contains the text value of the Used Defined attribute for the item. |
| 4 | CREATE_DATETIME |  |  | Y | Date | This field contains the Date/time stamp of when the record was created. This date/time will be used in export processing. This value should only be populated on insert and should never be updated. |
| 5 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field holds the date time stamp of the most recent update by an Oracle user (last_update_id). This field is required by the database. |
| 6 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field holds the Oracle user-id of the user who most recently updated this record. This field is required by the database. |
| 7 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |
| 8 | UDA_TEXT_DESC |  |  |  |  | This field is is a virtual column and will have a value same UDA_TEXT. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_UDA_ITEM_FF|PK||||ITEM|ASC|
||||||UDA_ID|ASC|
||||||UDA_TEXT|ASC|
|UDA_ITEM_FF_I1|||||UDA_ID|ASC|

---

## Table: UDA_ITEM_FF_TL

**Description:** This is the translation table for UDA_ITEM_FF_TL table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | ITEM | P | F | Y | VARCHAR (25) | This field contains unique alphanumeric identifier for the item. |
| 3 | UDA_ID | P | F | Y | NUMERIC (5) | This field contains a number uniquely identifying the User-Defined Attribute. |
| 4 | UDA_TEXT | P | F | Y | VARCHAR (250) | This field contains the text value of the Used Defined attribute for the item. |
| 5 | UDA_TEXT_DESC |  |  |  | VARCHAR (250) | This field holds the uda text in different language. |
| 6 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 7 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 8 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 9 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_UDA_ITEM_FF_TL|PK||||LANG|ASC|
||||||ITEM|ASC|
||||||UDA_ID|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
||||||UDA_TEXT|ASC|

---

## Table: UDA_ITEM_LOV

**Description:** This table contains one row for each item/attribute combination for UDAs with display type of List of Values (LV) and contains the information about item attribute relationship, create date, update date, etc.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM | P | F | Y | VARCHAR (25) | This field contains unique alphanumeric identifier for the item. |
| 2 | UDA_ID | P | F | Y | NUMERIC (5) | This field contains a number uniquely identifying the User-Defined Attribute. |
| 3 | UDA_VALUE | P | F | Y | NUMERIC (5) | This field contains value of the Used Defined attribute for the item. |
| 4 | CREATE_DATETIME |  |  |  | Date | This field contains the Date/time stamp of when the record was created. This date/time will be used in export processing. This value should only be populated on insert and should never be updated. |
| 5 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field holds the date time stamp of the most recent update by an Oracle user (last_update_id). This field is required by the database. |
| 6 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field holds the Oracle user-id of the user who most recently updated this record. This field is required by the database. |
| 7 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_UDA_ITEM_LOV|PK||||ITEM|ASC|
||||||UDA_ID|ASC|
||||||UDA_VALUE|ASC|
|UDA_ITEM_LOV_I1|||||UDA_ID|ASC|
||||||UDA_VALUE|ASC|

---

## Table: UDA_MFQUEUE

**Description:** This table holds the message queue that keeps track of all of the events that occur on the UDA and UDA_VALUES tables and used for RIB integration.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SEQ_NO | P |  | Y | NUMERIC (15) | This field specifies the sequence that maintains the order in which messages are created. |
| 2 | PUB_STATUS |  |  | Y | VARCHAR (1) | This field contains current publishing status of the UDAs. Valid values are U - Unprocessed E - Error |
| 3 | MESSAGE_TYPE |  |  | Y | VARCHAR (15) | This field specifies whether the message is an add, modify, or delete. |
| 4 | UDA_ID |  |  | Y | NUMERIC (5) | This field contains the uda_id from the UDA and UDA_VALUES tables. |
| 5 | UDA_VALUE |  |  |  | NUMERIC (5) | This field contains the uda_value from the UDA_VALUES table if LOVs are used. |
| 6 | DISPLAY_TYPE |  |  | Y | VARCHAR (2) | This field is used to store the display type (how the UDA values will be displayed to the user) for the given UDA. |
| 7 | MESSAGE |  |  | Y | CLOB | This field contains a CLOB containing the XML message that will be published. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_UDA_MFQUEUE|PK||||SEQ_NO|ASC|

---

## Table: UDA_TL

**Description:** This is the translation table for UDA table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | UDA_ID | P | F | Y | NUMERIC (5) | This field contains a unique number identifying the User Defined Attribute. |
| 3 | UDA_DESC |  |  | Y | VARCHAR (120) | This field contains a description of the User-Defined Attribute. |
| 4 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 6 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 7 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_UDA_TL|PK||||LANG|ASC|
||||||UDA_ID|ASC|

---

## Table: UDA_VALUES

**Description:** This table contains all valid values associated with a Used Defined Attribute. This will be used for LOV type UDAs only.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | UDA_ID | P | F | Y | NUMERIC (5) | This field contains a unique number identifying the User Defined Attribute. |
| 2 | UDA_VALUE | P |  | Y | NUMERIC (5) | This field contains a unique number identifying the User Defined Attribute value for the UDA. A UDA can have multiple values. For example, Color can be a UDA and it can have different values like Green, Red, Blue, etc. |
| 3 | UDA_VALUE_DESC |  |  | Y | VARCHAR (250) | This field contains a description of the UDA value. |
| 4 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |
| 5 | CREATE_DATETIME |  |  | Y | Date | This column holds the record creation date. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_UDA_VALUES|PK||||UDA_ID|ASC|
||||||UDA_VALUE|ASC|

---

## Table: UDA_VALUES_TL

**Description:** This is the translation table for UDA_VALUES table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | UDA_ID | P | F | Y | NUMERIC (5) | This field contains a unique number identifying the User Defined Attribute. |
| 3 | UDA_VALUE | P | F | Y | NUMERIC (5) | This field contains a unique number identifying the User Defined Attribute value for the UDA. A UDA can have multiple values. For example, Color can be a UDA and it can have different values like Green, Red, Blue, etc. |
| 4 | UDA_VALUE_DESC |  |  | Y | VARCHAR (250) | This field contains a description of the UDA value. |
| 5 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 6 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 7 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 8 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_UDA_VALUES_TL|PK||||LANG|ASC|
||||||UDA_ID|ASC|
||||||UDA_VALUE|ASC|

---

## Table: UOM_CLASS

**Description:** This table holds all of the Units of Measure, classes and their relationships for the system.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | UOM | P |  | Y | VARCHAR (4) | Contains a string that uniquely identifies the unit of measure. Example: LBS for pounds. |
| 2 | UOM_CLASS |  |  | Y | VARCHAR (6) | Contains the unit of measure type used as a grouping mechanism for the many UOM options. When converting from one UOM to another, the class is used to determine how the system proceeds with the conversion, whether it is an in-class or across-class conversion. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_UOM_CLASS|PK||||UOM|ASC|

---

## Table: UOM_CLASS_TL

**Description:** This is the translation table for UOM_CLASS_TL table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | UOM | P | F | Y | VARCHAR (4) | Unit of Measurement |
| 3 | UOM_TRANS |  |  | Y | VARCHAR (4) | Translated UOM |
| 4 | UOM_DESC_TRANS |  |  | Y | VARCHAR (120) | Translated UOM description |
| 5 | ORIG_LANG_IND |  |  | Y | VARCHAR (1) | Indicates if the description is in the original language entered for the UOM. It is set to Y when the first record is written to the table for the UOM. |
| 6 | REVIEWED_IND |  |  | Y | VARCHAR (1) | Indicates if the description needs to be reviewed for translation. It is set to N when the description in the original language is inserted or updated. We assume that clients will regularly |
| 7 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 8 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 9 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 10 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_UOM_CLASS_TL|PK||||LANG|ASC|
||||||UOM|ASC|

---

## Table: UOM_CONVERSION

**Description:** Holds all of the scientific conversions from one unit of measure to another within a class.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | FROM_UOM | P | F | Y | VARCHAR (4) | Contains a string that uniquely identifies the unit of measure from which the conversion is to occur. |
| 2 | TO_UOM | P | F | Y | VARCHAR (4) | Contains a string that uniquely identifies the unit of measure to which the conversion is to occur. |
| 3 | FACTOR |  |  | Y | NUMERIC (20,10) | Contains a number that is the conversion factor from the from_UOM to the to_UOM. |
| 4 | OPERATOR |  |  | Y | VARCHAR (1) | Contains a character that identifies the operation required to convert from the from_UOM to the to_UOM. Valid Values are: M = Multiply and D= Divide. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_UOM_CONVERSION|PK||||FROM_UOM|ASC|
||||||TO_UOM|ASC|
|UOM_CONVERSION_I1|||||TO_UOM|ASC|

### Constraints

|Type|Column / Constraint<br>Name|Details|
|---|---|---|
|Table Level|CHK_UOM_CON_OPERATOR|operator in ('M','D')<br>|
|Column Level|OPERATOR||

---

## Table: UOM_X_CONVERSION

**Description:** This table holds all of the information required to convert between UOMs of different class.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | FROM_UOM_CLASS | P |  | Y | VARCHAR (6) | Contains the class of the UOM currently used on the product in question (for example, in a conversion from weight to volume, the From_Class is weight). |
| 2 | TO_UOM_CLASS | P |  | Y | VARCHAR (6) | Contains the type of the UOM that is required for the product in question, and to which the conversion takes place (in the above |
| 3 | CONVERT_SQL |  |  | Y | VARCHAR (2000) | Contains the actual select statement to perform the conversion. |
