# RMS Merchandise Hierarchy Datamodel - Physical Data Model Reference

## Table: CLASS

**Description:** Contains one row for each class within the company. Whenever a class name is used by Oracle Retail, or a class is validated, it is always selected from this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEPT | P | F | Y | NUMERIC (4) | Contains the number of the department of which the class is a member. |
| 2 | CLASS | P |  | Y | NUMERIC (4) | Contains the number which uniquely identifies the class within the system. |
| 3 | CLASS_NAME |  |  | Y | VARCHAR (120) | Contains the name of the class which, along with the class number, identifies the class. |
| 4 | CLASS_VAT_IND |  |  | Y | VARCHAR (1) | This field determines if retail is displayed and held with or with out vat. This field is only editable when vat is turned on in the system and defined at the class level, when that is the case the field can vary between Y and N by class. When vat is turned on in the system and not defined at the class level, this field defaults to Y. When vat is turned off in the system, this field defaults to N. |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |
| 6 | CREATE_DATETIME |  |  | Y | Date | This column holds the record creation date. |
| 7 | CLASS_ID |  |  | Y | NUMERIC (10) | Contains the number that uniquely identifies the department/class combination. This column is populated by the system and not displayed to end users. This will be used for integration to downstream systems as many downstream systems are unable to accommodate the composite dept/class PK in their hierarchy and item structures. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_CLASS|PK||||DEPT|ASC|
||||||CLASS|ASC|
|UK_CLASS|UK||||CLASS_ID|ASC|

---

## Table: CLASS_CFA_EXT

**Description:** This is the custom attribute extension table for the entity CLASS.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEPT | P | F | Y | NUMERIC (4) | This column holds the Dept this extended data is associated with. |
| 2 | CLASS | P | F | Y | NUMERIC (4) | This column holds the Class this extended data is associated with. |
| 3 | GROUP_ID | P |  | Y | NUMERIC (10) | This column holds the attribute group id that this extended data is associated with. The logical business meaning of the VARCHAR_, NUMBER_ and DATE_ columns on this table are determined by the metadata defined for this attribute. |
| 4 | VARCHAR2_1 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_1 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 5 | VARCHAR2_2 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_2 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 6 | VARCHAR2_3 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_3 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 7 | VARCHAR2_4 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_4 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 8 | VARCHAR2_5 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_5 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 9 | VARCHAR2_6 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_6 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 10 | VARCHAR2_7 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_7 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 11 | VARCHAR2_8 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_8 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 12 | VARCHAR2_9 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_9 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 13 | VARCHAR2_10 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_10 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 14 | NUMBER_11 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_11 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 15 | NUMBER_12 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_12 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 16 | NUMBER_13 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_13 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 17 | NUMBER_14 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_14 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 18 | NUMBER_15 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_15 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 19 | NUMBER_16 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_16 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 20 | NUMBER_17 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_17 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 21 | NUMBER_18 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_18 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 22 | NUMBER_19 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_19 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 23 | NUMBER_20 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_20 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 24 | DATE_21 |  |  |  | Date | This column holds data related to the attribute defined on the CFA_ATTRIB table that references DATE_21 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 25 | DATE_22 |  |  |  | Date | This column holds data related to the attribute defined on the CFA_ATTRIB table that references DATE_22 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 26 | DATE_23 |  |  |  | Date | This column holds data related to the attribute defined on the CFA_ATTRIB table that references DATE_23 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 27 | DATE_24 |  |  |  | Date | This column holds data related to the attribute defined on the CFA_ATTRIB table that references DATE_24 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 28 | DATE_25 |  |  |  | Date | This column holds data related to the attribute defined on the CFA_ATTRIB table that references DATE_25 in CFA_ATTRIB.STORAGE_COL_NAME. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_CLASS_CFA_EXT|PK||||DEPT|ASC|
||||||CLASS|ASC|
||||||GROUP_ID|ASC|

---

## Table: CLASS_SALES_FORECAST

**Description:** Holds the forecast information summed to the class/location/eow_date. Should be partitioned by domain_id, as well. Thus if only a portion of the domains are forecasted, then the rebuild will be done by domain_id.forecasted, then the rebuild will be done by domain_id.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEPT |  |  | Y | NUMERIC (4) | Contains the department of the class for which sales information is being kept. |
| 2 | CLASS |  |  | Y | NUMERIC (4) | Contains the class for which sales information is being kept. |
| 3 | DOMAIN_ID |  |  | Y | NUMERIC (3) | Contains the domain ID number corresponding to the sales information being kept. |
| 4 | LOC |  |  | Y | NUMERIC (10) | Contains the location corresponding to the sales information being kept. |
| 5 | EOW_DATE |  |  | Y | Date | Contains the EOW date for which sales totals are gathered. |
| 6 | FORECAST_SALES |  |  | Y | NUMERIC (20,4) | Contains forecasted sales units for given dept/class/loc/date combination. |

---

## Table: CLASS_SALES_HIST

**Description:** This table contains one row for each class/location/week/sales type combination. Sales history, forecast and plan information about each combination is held.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEPT | P |  | Y | NUMERIC (4) | Contains the department of the class for which sales information is being kept. |
| 2 | CLASS | P |  | Y | NUMERIC (4) | Contains the class for which sales information is being kept. |
| 3 | STORE | P |  | Y | NUMERIC (10) | Contains the store corresponding to the sales information is being kept. |
| 4 | EOW_DATE | P |  | Y | Date | Contains the end of the week date from which the sales totals are gathered. |
| 5 | WEEK_454 |  |  |  | NUMERIC (2) | Contains the number of the 454 week for the sales figures. |
| 6 | MONTH_454 |  |  |  | NUMERIC (2) | Contains the number of the 454 month for the sales figures. |
| 7 | YEAR_454 |  |  |  | NUMERIC (4) | Contains the number of the 454 year for the sales figures. |
| 8 | SALES_TYPE | P |  | Y | VARCHAR (1) | Indicates the type of sale which generated the sales. Valid values are: R - Regular, P - Promotional, C - Clearance |
| 9 | SALES |  |  |  | NUMERIC (20,4) | Contains the number of units sold for the Department/Class/Store/date/sales_type combination. |
| 10 | VALUE |  |  |  | NUMERIC (20,4) | Contains the retail value received on the sales for the Department/Class/Store/week/sales_type combination. |
| 11 | GP |  |  |  | NUMERIC (20,4) | Contains the gross profit on the sales for the Department/Class/Store/week/sales_type combination. |
| 12 | PLAN_SALES |  |  |  | NUMERIC (12,4) | Holds interfaced planned sales data. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_CLASS_SALES_HIST|PK||||DEPT|ASC|
||||||CLASS|ASC|
||||||STORE|ASC|
||||||EOW_DATE|ASC|
||||||SALES_TYPE|ASC|
|CLASS_SALES_HIST_I1|||||DEPT|ASC|
||||||STORE|ASC|
||||||EOW_DATE|ASC|
||||||SALES_TYPE|ASC|

---

## Table: CLASS_SALES_HIST_MTH

**Description:** This table contains one row for each class/location/month/sales type combination. Sales history, forecast and plan information about each combination is held.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEPT |  | F | Y | NUMERIC (4) | Contains the department for which sales information is being kept. |
| 2 | CLASS |  |  | Y | NUMERIC (4) | Contains the class for which sales information is being kept. |
| 3 | STORE |  | F | Y | NUMERIC (10) | Contains the store corresponding to the sales information for the department. |
| 4 | EOM_DATE |  |  | Y | Date | Contains the end of the week date from which the sales totals are gathered. |
| 5 | MONTH_454 |  |  |  | NUMERIC (2) | Contains the number of the 454 month for the sales figures. |
| 6 | YEAR_454 |  |  |  | NUMERIC (4) | Contains the number of the 454 year for the sales figures. |
| 7 | SALES_TYPE |  |  | Y | VARCHAR (1) | Indicates the type of sale which generated the sales. Valid values are: R - Regular, P - Promotional, C - Clearance |
| 8 | SALES |  |  |  | NUMERIC (20,4) | Contains the number of units sold for the Department/Store/month/sales type combination. |
| 9 | VALUE |  |  |  | NUMERIC (20,4) | Contains the retail value received on the sales for the Department/Store/month/sales type combination. |
| 10 | GP |  |  |  | NUMERIC (20,4) | Contains the gross profit on the sales for the Department/Store/month/sales type combination. |
| 11 | PLAN_SALES |  |  |  | NUMERIC (12,4) | Holds interfaced planned sales data. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|CLASS_SALES_HIST_MTH_I1|||||DEPT|ASC|
|CLASS_SALES_HIST_MTH_I2|||||STORE|ASC|

---

## Table: CLASS_TL

**Description:** This is the translation table for CLASS table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | DEPT | P | F | Y | NUMERIC (4) | Contains the number of the department of which the class is a member. |
| 3 | CLASS | P | F | Y | NUMERIC (4) | Contains the number which uniquely identifies the class within the system. |
| 4 | CLASS_NAME |  |  | Y | VARCHAR (120) | Contains the name of the class which, along with the class number, identifies the class. |
| 5 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 6 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 7 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 8 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_CLASS_TL|PK||||LANG|ASC|
||||||DEPT|ASC|
||||||CLASS|ASC|

---

## Table: DEPS

**Description:** This table contains one row for each department within the company. Whenever a department name etc., is used by Oracle Retail, or a department number is validated, it is always selected from this table. The values C & R represent whether the markup % was based on a % of Cost or Retail.C is markup based on percentage of Cost: ((Retail - Cost)/Cost) * 100 R is markup based on percentage of Retail ((Retail - Cost)/Retail) * 100

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEPT | P |  | Y | NUMERIC (4) | Contains the number which uniquely identifies the department. |
| 2 | DEPT_NAME |  |  | Y | VARCHAR (120) | Contains the name of the department. |
| 3 | BUYER |  | F |  | NUMERIC (4) | Contains the number which uniquely identifies the buyer for that department. |
| 4 | MERCH |  | F |  | NUMERIC (4) | Contains the number which uniquely describes the merchandiser for that department. |
| 5 | PROFIT_CALC_TYPE |  |  | Y | NUMERIC (1) | Contains a number which indicates whether profit will be calculated by Direct Cost or by Retail Inventory. Valid values are: 1 = Direct Cost, 2 = Retail Inventory |
| 6 | PURCHASE_TYPE |  |  | Y | NUMERIC (1) | Contains a code which indicates whether items in this department are normal merchandise, consignment stock or concession items. Valid values are: 0 = Normal Merchandise, 1 = Consignment Stock, 2 = Concession Items |
| 7 | GROUP_NO |  | F | Y | NUMERIC (4) | Contains the number of the group in which the department exists. |
| 8 | BUD_INT |  |  | Y | NUMERIC (12,4) | Contains the Budgeted Intake percentage. Budgeted Intake is the percent of total take that is income and is synonymous with the term Markup Percent of Retail. |
| 9 | BUD_MKUP |  |  | Y | NUMERIC (12,4) | Contains the Budgeted Markup percentage. This term is synonymous with the term Markup Percent of Cost. |
| 10 | TOTAL_MARKET_AMT |  |  |  | NUMERIC (24,4) | Contains the total market amount that is expected for the department. The field can be used for analytics or reporting. |
| 11 | MARKUP_CALC_TYPE |  |  | Y | VARCHAR (2) | Contains the code letter which determines how markup is calculated in this department. Valid values are: C = Cost, R = Retail |
| 12 | OTB_CALC_TYPE |  |  | Y | VARCHAR (1) | Contains the code letter which determines how OTB is calculated in this department. Valid values are: C = Cost, R = Retail |
| 13 | MAX_AVG_COUNTER |  |  |  | NUMERIC (5) | A maximum average counter will hold the maximum count of days with acceptable data to include in an avarage for items within the department. |
| 14 | AVG_TOLERANCE_PCT |  |  |  | NUMERIC (12,4) | A tolerance percentage value used in averaging for items within this value. This value will set up a range for appropriate data and constrain outliers. This column will hold 70% as 70 - not 0.70. |
| 15 | DEPT_VAT_INCL_IND |  |  | Y | VARCHAR (1) | This indicator will be be used only to default to the class level indicator when classes are initially set up for the department and will only be available when the system level class vat option is on. When vat is turned on in the system and not defined at the class level, this field defaults to Y. When vat is turned off in the system, this field defaults to N. |
| 16 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |
| 17 | CREATE_DATETIME |  |  | Y | Date | This column holds the record creation date. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_DEPS|PK||||DEPT|ASC|
|DEPS_I1|||||BUYER|ASC|
|DEPS_I2|||||MERCH|ASC|
|DEPS_I3|||||GROUP_NO|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_DEPS_MARCKUP_CALC_TYPE|MARKUP_CALC_TYPE IN('R', 'C')<br>|
||CHK_DEPS_OTB_CALC_TYPE|OTB_CALC_TYPE IN ('C', 'R')<br>|
||CHK_DEPS_PROFIT_CALC_TYPE|PROFIT_CALC_TYPE IN (1,2)|
||CHK_DEPS_PURCHASE_TYPE|PURCHASE_TYPE IN (0,1,2)<br>|
|Column Level|PROFIT_CALC_TYPE||
||PURCHASE_TYPE||
||MARKUP_CALC_TYPE||
||OTB_CALC_TYPE||

---

## Table: DEPS_CFA_EXT

**Description:** This is the custom attribute extension table for the entity DEPS

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEPT | P | F | Y | NUMERIC (4) | This column holds the Dept this extended data is associated with. |
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
|PK_DEPS_CFA_EXT|PK||||DEPT|ASC|
||||||GROUP_ID|ASC|

---

## Table: DEPS_TL

**Description:** This is the translation table for DEPS table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | DEPT | P | F | Y | NUMERIC (4) | Contains the number which uniquely identifies the department. |
| 3 | DEPT_NAME |  |  | Y | VARCHAR (120) | Contains the name of the department. |
| 4 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 6 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 7 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_DEPS_TL|PK||||LANG|ASC|
||||||DEPT|ASC|

---

## Table: DEPT_CHRG_DETAIL

**Description:** This table holds Up Charge components and their associated information for a given department/from location/to location combination. These Up Charges are incurred when transferring items within the department between the from and the to locations.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEPT | P | F | Y | NUMERIC (4) | This field contains the unique identifier for the department for which the upcharges are being defined. |
| 2 | FROM_LOC | P | F | Y | NUMERIC (10) | This field contains the unique identifier for the location from which goods will be transferred. This is a store, warehouse or external finisher if the FROM_LOC_TYPE is S, W or E respectively. |
| 3 | TO_LOC | P | F | Y | NUMERIC (10) | This field contains the unique identifier for the location to which goods will be transferred. This is a store, warehouse or external finisher if the TO_LOC_TYPE is S, W or E respectively. |
| 4 | COMP_ID | P | F | Y | VARCHAR (10) | This field contains the unique identifier of the Up Charge component. |
| 5 | FROM_LOC_TYPE |  |  | Y | VARCHAR (1) | This field contains the type of location from which goods will be transferred. This column can contain either S for store, W for warehouse, or E for External Finisher. |
| 6 | TO_LOC_TYPE |  |  | Y | VARCHAR (1) | This field contains the type of location to which goods will be transferred. This column can contain either S for store, W for warehouse, or E for External Finisher. |
| 7 | COMP_RATE |  |  | Y | NUMERIC (20,4) | This field contains the rate to be charged against the cost of the Item/To Location combinations within the department. The value in this field will be a percentage if the calculation basis is V (Value), and a monetary amount if the calculation basis is S (Specific). |
| 8 | PER_COUNT |  |  |  | NUMERIC (12,4) | This field contains a count indicating the amount of the Per Count Unit of |
| 9 | PER_COUNT_UOM |  | F |  | VARCHAR (4) | This field contains the unit of measure in which the Per Count is specified. This column will only contain a value if the calculation basis is S (Specific). For example, when creating an Up Charge that is defined as $.20 for every 10 kilograms of an item transferred, the Per Count UOM would be the Unit of Measure code for Kilograms. |
| 10 | UP_CHRG_GROUP |  |  | Y | VARCHAR (6) | This field contains the group to which the component ID belongs. Valid values can be found on the codes table with a code type of UCHG. |
| 11 | COMP_CURRENCY |  | F | Y | VARCHAR (3) | This field contains the currency of the Up Charge component. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_DEPT_CHRG_DETAIL|PK||||DEPT|ASC|
||||||FROM_LOC|ASC|
||||||TO_LOC|ASC|
||||||COMP_ID|ASC|
|DEPT_CHRG_DETAIL_I3|||||COMP_ID|ASC|
|DEPT_CHRG_DETAIL_I4|||||PER_COUNT_UOM|ASC|
|DEPT_CHRG_DETAIL_I1|||||COMP_CURRENCY|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_DEPT_CHRG_DTL_F_LOC_TYPE|FROM_LOC_TYPE in ('S','W','E')<br>|
||CHK_DEPT_CHRG_DTL_TO_LOC_TYPE|TO_LOC_TYPE in ('S','W','E')|






|Type|Column / Constraint Name|Details|
|---|---|---|
||||

---

## Table: DEPT_CHRG_HEAD

**Description:** This table holds from/to location combinations for a given department. Up charge components will be associated with the combinations. These up charges are incurred when transferring items within the department between the from and the to locations.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEPT | P | F | Y | NUMERIC (4) | Contains the department number. |
| 2 | FROM_LOC | P |  | Y | NUMERIC (10) | Contains the location number of the location to which goods will be transferred. This column can contain either a store or a warehouse. |
| 3 | TO_LOC | P |  | Y | NUMERIC (10) | Contains the location number of the location to which goods will be transferred. This column can contain either a store or a warehouse. |
| 4 | FROM_LOC_TYPE |  |  | Y | VARCHAR (1) | Contains the type of location from which goods will be transferred. this column can contain either S for store, W for warehouse, or E for External Finisher. |
| 5 | TO_LOC_TYPE |  |  | Y | VARCHAR (1) | Contains the type of location to which goods will be transferred. this column can contain either S for store, W for warehouse, or E for External Finisher. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_DEPT_CHRG_HEAD|PK||||DEPT|ASC|
||||||FROM_LOC|ASC|
||||||TO_LOC|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_DEPT_CHRG_HEAD_F_LOC_TYPE|FROM_LOC_TYPE IN ('W', 'S', 'E')<br>|
||CHK_DEPT_CHRG_HEAD_TO_LOC_TYPE|TO_LOC_TYPE IN ('W', 'S', 'E')<br>|

---

## Table: DEPT_SALES_FORECAST

**Description:** Holds the forecast information summed to the department/location/eow_date. If the Oracle 8 partition option is used, this table should be partitioned by domain_id. Thus if only a portion of the domains are forecasted, then the rebuild will be done by domain_id.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEPT |  |  | Y | NUMERIC (4) | Contains the department of the class for which sales information is being kept. |
| 2 | DOMAIN_ID |  |  | Y | NUMERIC (3) | Contains the domain ID number corresponding to the sales information being kept. |
| 3 | LOC |  |  | Y | NUMERIC (10) | Contains the location corresponding to the sales information being kept. |
| 4 | EOW_DATE |  |  | Y | Date | Contains the EOW date for which sales totals are gathered. |
| 5 | FORECAST_SALES |  |  | Y | NUMERIC (20,4) | Contains forecasted sales units for given dept/class/loc/date combination. |

---

## Table: DEPT_SALES_HIST

**Description:** This table is used to record sales history for each dept/location/week/sales type combination.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEPT | P |  | Y | NUMERIC (4) | This field contains the department for which sales information is being kept. |
| 2 | STORE | P | F | Y | NUMERIC (10) | This field contains the store corresponding to the sales information for the department. |
| 3 | EOW_DATE | P |  | Y | Date | This field contains the end of the week date from which the sales totals are gathered. |
| 4 | WEEK_454 |  |  |  | NUMERIC (2) | This field contains the week number for the sales figures. |
| 5 | MONTH_454 |  |  |  | NUMERIC (2) | This field contains the month number for the sales figures. |
| 6 | YEAR_454 |  |  |  | NUMERIC (4) | This field contains the year number for the sales figures. |
| 7 | SALES_TYPE | P |  | Y | VARCHAR (1) | This field indicates the type of sale for which the data is recorded. Valid values are: R - Regular, P - Promotional, C - Clearance. |
| 8 | SALES |  |  |  | NUMERIC (20,4) | This field contains the number of units sold for the department/store/week/sales type combination. |
| 9 | VALUE |  |  |  | NUMERIC (20,4) | This field contains the retail value of the sales for the department/store/week/sales type combination. |
| 10 | GP |  |  |  | NUMERIC (20,4) | This field contains the gross profit on the sales for the department/store/week/sales type combination. |
| 11 | PLAN_SALES |  |  |  | NUMERIC (12,4) | This field is not currently used by RMS. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_DEPT_SALES_HIST|PK||||DEPT|ASC|
||||||STORE|ASC|
||||||EOW_DATE|ASC|
||||||SALES_TYPE|ASC|
|DEPT_SALES_HIST_I1|||||STORE|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_DEPT_SALES_HIST_SAL_TYP|SALES_TYPE IN ('R','P','C')<br>|

---

## Table: DEPT_SALES_HIST_MTH

**Description:** This table is used to record sales history for each dept/location/month/sales type combination.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEPT |  | F | Y | NUMERIC (4) | This field contains the department for which sales information is being kept. |
| 2 | STORE |  | F | Y | NUMERIC (10) | This field contains the store corresponding to the sales information for the department. |
| 3 | EOM_DATE |  |  | Y | Date | This field contains the end of the month date from which the sales totals are gathered. |
| 4 | MONTH_454 |  |  |  | NUMERIC (2) | This field contains the month number for the sales figures. |
| 5 | YEAR_454 |  |  |  | NUMERIC (4) | This field contains the year number for the sales figures. |
| 6 | SALES_TYPE |  |  | Y | VARCHAR (1) | This field indicates the type of sale for which data is recorded. Valid values are: R - Regular, P - Promotional, C - Clearance. |
| 7 | SALES |  |  |  | NUMERIC (20,4) | This field contains the number of units sold for the department/store/month/sales type combination. |
| 8 | VALUE |  |  |  | NUMERIC (20,4) | This field contains the retail value of the sales for the department/store/month/sales type combination. |
| 9 | GP |  |  |  | NUMERIC (20,4) | This field contains the gross profit on the sales for the department/store/month/sales type combination. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|DEPT_SALES_HIST_MTH_I2|||||STORE|ASC|
|DEPT_SALES_HIST_MTH_I1|||||DEPT|ASC|

---

## Table: DIVISION

**Description:** This table contains one row for each division within the company. Whenever a division name is used by Oracle Retail, or a division number is validated, it is always selected from this table. No index is associated with this table because it contains a small number of rows.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DIVISION | P |  | Y | NUMERIC (4) | Contains the number which uniquely identifies the division of the company. |
| 2 | DIV_NAME |  |  | Y | VARCHAR (120) | Contains the name which, along with the division number, identifies the division of the company. |
| 3 | BUYER |  | F |  | NUMERIC (4) | Contains the number of the buyer associated with the division. |
| 4 | MERCH |  | F |  | NUMERIC (4) | Contains the number of the merchandiser associated with the division. |
| 5 | TOTAL_MARKET_AMT |  |  |  | NUMERIC (24,4) | Contains the total market amount that is expected for the division. The field can be used for analytics or reporting. |
| 6 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |
| 7 | CREATE_DATETIME |  |  | Y | Date | This column holds the record creation date. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_DIVISION|PK||||DIVISION|ASC|
|DIVISION_I2|||||MERCH|ASC|
|DIVISION_I1|||||BUYER|ASC|

---

## Table: DIVISION_TL

**Description:** This is the translation table for DIVISION table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | DIVISION | P | F | Y | NUMERIC (4) | Contains the number which uniquely identifies the division of the company. |
| 3 | DIV_NAME |  |  | Y | VARCHAR (120) | Contains the name which, along with the division number, identifies the division of the company. |
| 4 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 6 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 7 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_DIVISION_TL|PK||||LANG|ASC|
||||||DIVISION|ASC|

---

## Table: DOMAIN

**Description:** This table contains one row for each domain defined within Oracle Retail. A domain is used when interfacing data to external systems using multiple domains (i.e. database instances), specifically Oracle Retail Demand Forecasting (RDF). The columns on this table will help to make up the INI file used when calling RDF.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DOMAIN_ID | P |  | Y | NUMERIC (3) | This field contains the unique number representing the domain. This domain number is used when interfacing data to external systems using domains. |
| 2 | DOMAIN_DESC |  |  | Y | VARCHAR (20) | This field contains the system-level identifier for the database instance. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_DOMAIN|PK||||DOMAIN_ID|ASC|

---

## Table: DOMAIN_CLASS

**Description:** This table will be used to determine with which domains classes are associated if domains are set-up at the class level. These relationships will be used when interfacing data to external systemsusing multiple domains (i.e. database instances).

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEPT | P | F | Y | NUMERIC (4) | This field contains the department number associated with the domain. |
| 2 | CLASS | P | F | Y | NUMERIC (4) | This field contains the class number associated with the domain. |
| 3 | DOMAIN_ID |  | F | Y | NUMERIC (3) | This field contains the unique number representing the domain. This domain number is used when interfacing data to external systems using domains. |
| 4 | LOAD_SALES_IND |  |  | Y | VARCHAR (1) | This field indicates whether or not all the sales history for all SKUs in the class have to be interfaced to an external system. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_DOMAIN_CLASS|PK||||DEPT|ASC|
||||||CLASS|ASC|
|DOMAIN_CLASS_I1|||||DOMAIN_ID|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_DOMAIN_CLA_LOAD_SALES_IND|LOAD_SALES_IND IN ('Y', 'N')<br>|
|Column Level|LOAD_SALES_IND||

---

## Table: DOMAIN_DEPT

**Description:** This table will be used to determine with which domains departments are associated if domains are set-up at the department level. These relationships will be used when interfacing data to external systems using multiple domains (i.e. database instances).

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEPT | P | F | Y | NUMERIC (4) | This field contains the department number associated with the domain. |
| 2 | DOMAIN_ID |  | F | Y | NUMERIC (3) | This field contains the unique number representing the domain. This domain number is used when interfacing data to external systems using domains. |
| 3 | LOAD_SALES_IND |  |  | Y | VARCHAR (1) | This field indicates whether or not all the sales history for all SKUs in the department have to be interfaced to an external system. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_DOMAIN_DEPT|PK||||DEPT|ASC|
|DOMAIN_DEPT_I1|||||DOMAIN_ID|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_DOMAIN_DEPT_LOAD_SALES_IND|LOAD_SALES_IND IN ('Y', 'N')<br>|
|Column Level|LOAD_SALES_IND||

---

## Table: DOMAIN_SUBCLASS

**Description:** This table will be used to determine with which domains subclasses are associated if domains are set-up at the subclass level. These relationships will be used when interfacing data to external systems using multiple domains (i.e. database instances).

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEPT | P | F | Y | NUMERIC (4) | This field contains the department number associated with the domain. |
| 2 | CLASS | P | F | Y | NUMERIC (4) | This field contains the class number associated with the domain. |
| 3 | SUBCLASS | P | F | Y | NUMERIC (4) | This field contains the subclass number associated with the domain. |
| 4 | DOMAIN_ID |  | F | Y | NUMERIC (3) | This field contains the unique number representing the domain. This domain number is used when interfacing data to external systems using domains. |
| 5 | LOAD_SALES_IND |  |  | Y | VARCHAR (1) | This field indicates whether or not all the sales history for all SKUs in the subclass have to be interfaced to an external system. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_DOMAIN_SUBCLASS|PK||||DEPT|ASC|
||||||CLASS|ASC|
||||||SUBCLASS|ASC|
|DOMAIN_SUBCLASS_I1|||||DOMAIN_ID|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_DOMAIN_SUB_LOAD_SALES_IND|LOAD_SALES_IND IN ('Y', 'N')<br>|
|Column Level|LOAD_SALES_IND||

---

## Table: GROUPS

**Description:** This table contains one row for each group within the company. Whenever a group name is used by Oracle Retail, or a group number is validated, it is always selected from this table. No index is associated with this table because it contains a small number of rows.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | GROUP_NO | P |  | Y | NUMERIC (4) | Contains the number which uniquely identifies the group. |
| 2 | GROUP_NAME |  |  | Y | VARCHAR (120) | Contains the description which, along with the group number, identifies the group. |
| 3 | BUYER |  | F |  | NUMERIC (4) | Contains the number of the buyer associated with the group. |
| 4 | MERCH |  | F |  | NUMERIC (4) | Contains the number of the merchandiser associated with the group. |
| 5 | DIVISION |  | F | Y | NUMERIC (4) | Contains the number of the division of which the group is a member. |
| 6 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |
| 7 | CREATE_DATETIME |  |  | Y | Date | This column holds the record creation date. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_GROUPS|PK||||GROUP_NO|ASC|
|GROUPS_I3|||||DIVISION|ASC|
|GROUPS_I2|||||MERCH|ASC|
|GROUPS_I1|||||BUYER|ASC|

---

## Table: GROUPS_TL

**Description:** This is the translation table for GROUPS table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | GROUP_NO | P | F | Y | NUMERIC (4) | Contains the number which uniquely identifies the group. |
| 3 | GROUP_NAME |  |  | Y | VARCHAR (120) | Contains the description which, along with the group number, identifies the group. |
| 4 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 6 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 7 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_GROUPS_TL|PK||||LANG|ASC|
||||||GROUP_NO|ASC|

---

## Table: MERCHANT

**Description:** This table contains one row for each merchandiser within the system.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | MERCH | P |  | Y | NUMERIC (4) | Contains the number which uniquely identifies the merchandiser within the system. |
| 2 | MERCH_NAME |  |  | Y | VARCHAR (120) | Contains the name of the merchandiser. |
| 3 | MERCH_PHONE |  |  |  | VARCHAR (20) | Contains the phone number of the merchandiser. |
| 4 | MERCH_FAX |  |  |  | VARCHAR (20) | Contains the fax number of the merchandiser. |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |
| 6 | CREATE_DATETIME |  |  | Y | Date | This column holds the record creation date. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_MERCHANT|PK||||MERCH|ASC|

---

## Table: MERCHHIER_EXPORT_STG

**Description:** This is table is a staging table for merchandise hierarchy records as they wait to be extracted. This table is automatically inserted into, as records are processed by Oracle Retail. This table will be scanned by a bulk export job to extract new, updated and deleted RMS merchandise hierarchy information.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SEQ_NO | P |  | Y | NUMERIC (15) | The sequence in which the records are placed in the table. |
| 2 | DIVISION |  |  |  | NUMERIC (4) | Contains the number that uniquely identifies the division. |
| 3 | GROUP_NO |  |  |  | NUMERIC (4) | Contains the number that uniquely identifies the group. |
| 4 | DEPT |  |  |  | NUMERIC (4) | Contains the number that uniquely identifies the department. |
| 5 | CLASS_ID |  |  |  | NUMERIC (10) | Contains the number that uniquely identifies the department/class combination. |
| 6 | SUBCLASS_ID |  |  |  | NUMERIC (10) | Contains the number that uniquely identifies the department/class/subclass combination. |
| 7 | PARENT_LEVEL |  |  |  | VARCHAR (10 BYTE) | Indicates the level of the organizational hierarchy above the current hierarchy of the record. |
| 8 | ACTION_TYPE |  |  | Y | VARCHAR (15 BYTE) | Indicates if the merchandise hierarchy has been added, changed or deleted. Valid values are 'divisioncre', 'divisionmod', 'divisiondel', 'groupcre', 'groupmod', 'groupdel', 'deptcre', 'deptmod', 'deptdel', |
| 9 | BASE_EXTRACTED_IND |  |  | Y | VARCHAR (1 BYTE) | Indicates whether the record has been extracted or not. Upon record insert, this will be set to 'N'. After running the batch job, this will then be set to 'Y'. |
| 10 | CUSTOM1_EXTRACTED_IND |  |  |  | VARCHAR (1 BYTE) | Indicates whether the record has been extracted or not for a custom extraction. |
| 11 | CUSTOM2_EXTRACTED_IND |  |  |  | VARCHAR (1 BYTE) | Indicates whether the record has been extracted or not for a custom extraction. |
| 12 | CUSTOM3_EXTRACTED_IND |  |  |  | VARCHAR (1 BYTE) | Indicates whether the record has been extracted or not for a custom extraction. |
| 13 | CUSTOM4_EXTRACTED_IND |  |  |  | VARCHAR (1 BYTE) | Indicates whether the record has been extracted or not for a custom extraction. |
| 14 | PROCESS_ID |  |  |  | NUMERIC (15) | Process ID where the record belongs to. |
| 15 | TRANSACTION_DATETIME |  |  | Y | Date (7) | Time of record creation. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_MERCHHIER_EXPORT_STG|PK||||SEQ_NO|ASC|

---

## Table: MERCHHIER_MFQUEUE

**Description:** This table is a staging table for merchandise heirarchy messages as they wait to be sent over the Integration Bus.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SEQ_NO | P |  | Y | NUMERIC (15) | The sequence in which the records are placed in the MERCHHIER_MFQUEUE. Used to order the publication of messages to the RIB. |
| 2 | DIVISION |  |  |  | NUMERIC (4) | Contains the number which uniquely identifies the division of the company. |
| 3 | GROUP_NO |  |  |  | NUMERIC (4) | Contains the number which uniquely identifies the Group. |
| 4 | DEPT |  |  |  | NUMERIC (4) | Contains the number which uniquely identifies the Department. |
| 5 | CLASS |  |  |  | NUMERIC (4) | Contains the number which uniquely identifies the class within a department. |
| 6 | SUBCLASS |  |  |  | NUMERIC (4) | Contains the number which uniquely identifies the subclass within a specific department and class. |
| 7 | DIV_NAME |  |  |  | VARCHAR (120) | Contains the name which, along with the division number, identifies the division within a company. |
| 8 | BUYER |  |  |  | NUMERIC (4) | Contains the number of the buyer associated with the merchandise hierarchy. |
| 9 | MERCH |  |  |  | NUMERIC (4) | Contains the number of the merchandiser associated with the merchandise hierarchy. |
| 10 | TOTAL_MARKET_AMOUNT |  |  |  | NUMERIC (24,4) | Contains the total market amount that is expected for the division. |
| 11 | GROUP_NAME |  |  |  | VARCHAR (120) | Contains the group description which, along with the group number, identifies the group. |
| 12 | DEPT_NAME |  |  |  | VARCHAR (120) | Contains the name of the department. |
| 13 | PROFIT_CALC_TYPE |  |  |  | NUMERIC (1) | Contains a number which indicates whether profit will be calculated by Direct Cost or Retail Inventory. |
| 14 | PURCHASE_TYPE |  |  |  | NUMERIC (1) | Contains a code which indicates whether items in this department are normal merchandise or consignment stock. |
| 15 | BUD_INT |  |  |  | NUMERIC (12,4) | Contains the budgeted intake percentage. |
| 16 | BUD_MKUP |  |  |  | NUMERIC (12,4) | Contains the budgeted markup percentage. |
| 17 | MARKUP_CALC_TYPE |  |  |  | VARCHAR (2) | Contains the code letter which determines how markup is calculated in this department. |
| 18 | OTB_CALC_TYPE |  |  |  | VARCHAR (1) | Contains the code letter which determines how OTB is calculated in this department. |
| 19 | DEPT_VAT_INCL_IND |  |  |  | VARCHAR (1) | This indicator will be be used only to default to the class level indicator when classes are initially set up for the department and will only be available when the system level class vat option is on. |
| 20 | CLASS_NAME |  |  |  | VARCHAR (120) | Contains the name of the class which, along with the class number, identifies the class. |
| 21 | CLASS_VAT_IND |  |  |  | VARCHAR (1) | This field determines if retail is displayed and held with or without VAT. |
| 22 | SUBCLASS_NAME |  |  |  | VARCHAR (120) | Contains the name of the subclass which, along with the subclass number, identifies a subclass. |
| 23 | MESSAGE_TYPE |  |  |  | VARCHAR (15) | Describes the action in RMS that is causing the message to be published to the RIB. |
| 24 | THREAD_NO |  |  |  | NUMERIC (4) | The thread on which the business transaction will be published. Each business object has one |
| 25 | FAMILY |  |  |  | VARCHAR (30) | The functional area that this transaction belongs to. |
| 26 | CUSTOM_MESSAGE_TYPE |  |  |  | VARCHAR (1) | Not used by RMS. |
| 27 | PUB_STATUS |  |  |  | VARCHAR (1) | Set to Unpublished upon insertion into the table. Will be set to Hospital when an non-fatal error is encountered during the publication process. |
| 28 | TRANSACTION_NUMBER |  |  |  | NUMERIC (10) | Business Transaction Key. |
| 29 | TRANSACTION_TIME_STAMP |  |  |  | Date | Time of record creation. |

---

## Table: MERCH_HIER_DEFAULT

**Description:** This table will hold the default structures defined for the merchandise hierarchy. This table will allow the client to use his business process to either make some kinds of attributes or options available or not available. Among those that are available, the client will also be able to designate some options as required. This functionality is currently only implemented in the items dialog, but has been designed generically so that it may be expanded to other areas in the future. The user has the ability to set up these default structures at either the dept, dept/class, or dept/class/subclass levels.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SEQ_NO | P |  | Y | NUMERIC (20) | This field contains a unique identifier for each Info/dialog/dept combination. |
| 2 | DIALOG |  |  | Y | VARCHAR (6) | This field contains the value for dialog in the system for which a default structure is being defined. Valid values are stored on the codes table in the code type MHDD. Currently, this defaulting functionality is only being implemented for the items dialog. Adding additional values to the code type will not implement this functionality in other dialogs in the system. |
| 3 | INFO |  |  | Y | VARCHAR (6) | This field contains the value for the information that for which a default value is being defined. These infos may be fields or menu options which are not required by the database, but may be required by particular business practice. Valid values are stored in the code type MHDI. Currently, this defaulting functionality is only being implemented for certain fields and menu options the items dialog. Adding additional values to the code type will not implement this functionality in other fields, menu options or dialogs in the system. |
| 4 | DEPT |  | F | Y | NUMERIC (4) | This field contains the department for which the structure defaults are defined. This field is always required. |
| 5 | CLASS |  | F | Y | NUMERIC (4) | This field contains the class for which the structure defaults are defined. This field is not required. |
| 6 | SUBCLASS |  | F | Y | NUMERIC (4) | This field contains the class for which structure defaults are defined. This field is not required. |
| 7 | AVAILABLE_IND |  |  | Y | VARCHAR (1) | This field indicates whether the information should be available (i.e. displayed) in the dialog. This field is required. |
| 8 | REQUIRED_IND |  |  | Y | VARCHAR (1) | This field indicates whether the information should be required in the dialog. During any approval processes, this table will be checked to determine what information the user has set as required. Validation will be done to notify the user that business practice is to include this information in the dialog. |
| 9 | CREATE_DATETIME |  |  | Y | Date | This will hold the date and time on which the record was created. |
| 10 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This will hold the date and time the record was last updated. |
| 11 | LAST_UPDATE_DATE |  |  | Y | Date | This will hold the user ID of the user who last updated this record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_MERCH_HIER_DEFAULT|PK||||SEQ_NO|ASC|
|MERCH_HIER_DEFAULT_I3|||||DEPT|ASC|
||||||CLASS|ASC|
||||||SUBCLASS|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_MERCH_HIER_DEFAULT_AV_IND|AVAILABLE_IND IN ('Y','N')<br>|
||CHK_MERCH_HIER_DEFAULT_REQ_IND|REQUIRED_IND IN ('Y','N')<br>|
|Column Level|AVAILABLE_IND||






|Type|Column / Constraint Name|Details|
|---|---|---|
||REQUIRED_IND||

---

## Table: MERCH_ORG_MAP

**Description:** This table will be used to associate location hierarchy (chains) to merchandise hierarcy (divisions).

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DIVISION |  |  | Y | NUMERIC (4) | Field to hold the merchandise hierarchy (division) |
| 2 | CHAIN |  |  | Y | NUMERIC (10) | Field to hold the organization hierarchy (chain) |

---

## Table: ORGHIER_EXPORT_STG

**Description:** This is table is a staging table for organizational hierarchy records as they wait to be extracted. This table is automatically inserted into, as records are processed by Oracle Retail. This table will be scanned by a daily batch job to extract new, updated and deleted RMS organizational hierarchy information.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SEQ_NO | P |  | Y | NUMERIC (15) | The sequence in which the records are placed in the table. |
| 2 | COMPANY |  |  |  | NUMERIC (4) | Contains the number that uniquely identifies the company. |
| 3 | CHAIN |  |  |  | NUMERIC (10) | Contains the number that uniquely identifies the chain. |
| 4 | AREA |  |  |  | NUMERIC (10) | Contains the number that uniquely identifies the area. |
| 5 | REGION |  |  |  | NUMERIC (10) | Contains the number that uniquely identifies the region. |
| 6 | DISTRICT |  |  |  | NUMERIC (10) | Contains the number that uniquely identifies the district. |
| 7 | STORE |  |  |  | NUMERIC (10) | Contains the number that uniquely identifies the store. |
| 8 | WH |  |  |  | NUMERIC (10) | Contains the number that uniquely identifies the warehouse. |
| 9 | PARENT_LEVEL |  |  |  | VARCHAR (10 ) | Indicates the level of the organizational hierarchy above the current hierarchy of the record. |
| 10 | ACTION_TYPE |  |  | Y | VARCHAR (15 ) | Indicates if the organizational hierarchy has been added, changed or deleted. Valid values are compcre, compmod, chaincre, chainmod, chaindel, areacre, areamod, areadel, regioncre, regionmod, regiondel, districtcre, districtmod, districtdel, storecre, storemod, storedel, whcre, whmod and whdel |
| 11 | BASE_EXTRACTED_IND |  |  | Y | VARCHAR (1 ) | Indicates whether the record has been extracted or not. Upon record insert, this will be set to â€˜Nâ€™. After running the batch job, this will then be set to â€˜Yâ€™. |
| 12 | CUSTOM1_EXTRACTED_IND |  |  |  | VARCHAR (1 ) | Indicates whether the record has been extracted or not for a custom extraction. |
| 13 | CUSTOM2_EXTRACTED_IND |  |  |  | VARCHAR (1 ) | Indicates whether the record has been extracted or not for a custom extraction. |
| 14 | CUSTOM3_EXTRACTED_IND |  |  |  | VARCHAR (1 ) | Indicates whether the record has been extracted or not for a custom extraction. |
| 15 | CUSTOM4_EXTRACTED_IND |  |  |  | VARCHAR (1 ) | Indicates whether the record has been extracted or not for a custom extraction. |
| 16 | PROCESS_ID |  |  |  | NUMERIC (15) | Process ID where the record belongs to. |
| 17 | TRANSACTION_DATETIME |  |  | Y | Date | Time of record creation |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_ORGHIER_EXPORT_STG|PK||||SEQ_NO|ASC|

---

## Table: PEND_MERCH_HIER

**Description:** This table will hold all the addition/changes to the hierarchy structure for division, group, department, class and subclass level, so that a retailer can plan additions for the new division, group, department, class and subclass or changes to the existing division, group, department, class or subclass without affecting the actual division, groups, deps, class or subclass tables in RMS. This table will have the effective date for each additions/updates and the actual tables will be populated/updated on that effective date.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | HIER_TYPE |  |  | Y | VARCHAR (1) | This column will identify which hierarchy is being added or updated. The values for this column will be V- Division, G- Group D dept, C class and S subclass |
| 2 | MERCH_HIER_ID |  |  | Y | NUMERIC (4) | This column will contain the division, group, dept, class or the subclass number depending on the hier_type. If the action_type is _A_, then this id will be generated using the current sequence number generator for division, group, dept, class and subclass depending on the hier_type. |
| 3 | MERCH_HIER_PARENT_ID |  |  |  | NUMERIC (4) | This column will contain the division_id if hier_type = group, group_id if hier_type= dept, dept number if hier_type= class and class number if hier_type= subclass. |
| 4 | MERCH_HIER_GRANDPARENT_ID |  |  |  | NUMERIC (4) | This column will only be populated if the hier_type = subclass. If hier_type = subclass the column will contain the dept number. |
| 5 | EFFECTIVE_DATE |  |  | Y | Date | This column will contain the effective date when the records from shadow table will be moved to the actual RMS merchandise hierarchy tables. |
| 6 | ACTION_TYPE |  |  | Y | VARCHAR (1) | This column will identify whether this is a new addition of division, group, dept, class or subclass or changes for existing division, group, dept, class or subclass. |
| 7 | MERCH_HIER_NAME |  |  | Y | VARCHAR (120) | This column will contain name of the division, group, department, class or subclass depending on the hier_type |
| 8 | DOMAIN |  | F |  | NUMERIC (3) | This column will contain the unique number representing the domain. This domain number is used when interfacing data to external systems using domains. |
| 9 | BUYER |  | F |  | NUMERIC (4) | This column will contain the number that uniquely identifies the buyer for the hierarchy type. |
| 10 | MERCH |  | F |  | NUMERIC (4) | This column will contain the number that uniquely identifies the merchandiser for the hierarchy type. |
| 11 | PROFIT_CALC_TYPE |  |  |  | NUMERIC (1) | This column will contain a number that indicates whether profit will be calculated by Direct Cost or by Retail Inventory. Valid values are: 1 = Direct Cost 2 = Retail Inventory |
| 12 | PURCHASE_TYPE |  |  |  | NUMERIC (1) | This column will contain a code that indicates whether items in this department are normal merchandise or consignment stock. Valid values are: 0 = Normal Merchandise 1 = Consignment Stock |
| 13 | BUD_INT |  |  |  | NUMERIC (12,4) | This column will contain the Budgeted Intake percentage. Budgeted Intake is the percent of total take that is income and is synonymous with the term Markup Percent of Retail. |
| 14 | BUD_MKUP |  |  |  | NUMERIC (12,4) | This column will contain the Budgeted Markup percentage. This term is synonymous with the term Markup Percent of Cost. |
| 15 | TOTAL_MARKET_AMT |  |  |  | NUMERIC (24,4) | This column will contain the total market amount that is expected for the hierarchy type. The value can be used for analytics or reporting |
| 16 | MARKUP_CALC_TYPE |  |  |  | VARCHAR (2) | This column will contain the code letter that determines how markup is calculated in this hierarchy type. Valid values are: C = Cost R = Retail |
| 17 | OTB_CALC_TYPE |  |  |  | VARCHAR (1) | Otb_calc_type This column will contain the code letter that determines how OTB is calculated in this hierarchy type. Valid values are: C = Cost R = Retail |
| 18 | MAX_AVG_COUNTER |  |  |  | NUMERIC (5) | This column will contain the maximum count of days with acceptable data to include in an average for items within the hierarchy type. |
| 19 | AVG_TOLERANCE_PCT |  |  |  | NUMERIC (12,4) | This column will contain a tolerance percentage value used in averaging for items within this value. This value will set up a range for appropriate data and constrain outliers. This column will hold 70% as 70 - not 0.70. |
| 20 | DEPT_VAT_INCL_IND |  |  |  | VARCHAR (1) | This column will contain an indicator that will be used to default the class level indicator when classes are initially set up for the department and will only be available when the system level class vat option is on. When vat is turned on in the system and not defined at the class level, this field defaults to Y. When vat is turned off in the system, this field defaults to N. |
| 21 | CLASS_VAT_INCL_IND |  |  |  | VARCHAR (1) | This column will contain an indicator that is used to determine whether retail is displayed and held with or without vat. This field is only editable when vat is turned on in the system and defined at the class level, when that is the case the field can vary between Y and N by class. When vat is turned on in the system and not defined at the class level, this field defaults to Y. When vat is turned off in the system, this field defaults to N. |

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_PEND_MERCH_HIER_ACTION_TYP|ACTION_TYPE IN ('A','M')<br>|
||CHK_PEND_MERCH_HIER_CLASS_VAT|CLASS_VAT_INCL_IND IN ('Y','N')<br>|
||CHK_PEND_MERCH_HIER_DEPT_VAT|DEPT_VAT_INCL_IND IN ('Y','N')<br>|
||CHK_PEND_MERCH_HIER_HIER_TYPE|HIER_TYPE IN ('V', 'G', 'D', 'C', 'S')<br>|
||CHK_PEND_MERCH_HIER_MARKUP_CAL|MARKUP_CALC_TYPE IN ('R','C')<br>|
||CHK_PEND_MERCH_HIER_OTB_CALC|OTB_CALC_TYPE IN ('C','R')<br>|
||CHK_PEND_MERCH_HIER_PROFIT_CAL|PROFIT_CALC_TYPE IN (1,2)<br>|
||CHK_PEND_MERCH_HIER_PURCHASE|PURCHASE_TYPE IN (0,1)<br>|
||CHK_PEND_MERCH_HIER_PURCHASEv1|PURCHASE_TYPE IN (0,1,2)<br>|
|Column Level|HIER_TYPE||






|Type|Column / Constraint Name|Details|
|---|---|---|
||ACTION_TYPE||
||PROFIT_CALC_TYPE||
||PURCHASE_TYPE||
||MARKUP_CALC_TYPE||
||OTB_CALC_TYPE||
||DEPT_VAT_INCL_IND||
||CLASS_VAT_INCL_IND||

---

## Table: PEND_MERCH_HIER_TL

**Description:** This is the translation table for PEND_MERCH_HIER table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG |  | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | HIER_TYPE |  | F |  | VARCHAR (1) | This column will identify which hierarchy is being added or updated. The values for this column will be V- Division, G- Group D dept, C class and S subclass |
| 3 | MERCH_HIER_ID |  | F |  | NUMERIC (4) | This column will contain the division, group, dept, class or the subclass number depending on the hier_type. If the action_type is _A_, then this id will be generated using the current sequence number generator for division, group, dept, class and subclass depending on the hier_type. |
| 4 | MERCH_HIER_PARENT_ID |  | F |  | NUMERIC (4) | This column will contain the division_id if hier_type = group, group_id if hier_type= dept, dept number if hier_type= class and class number if hier_type= subclass. |
| 5 | MERCH_HIER_GRANDPARENT_ID |  | F |  | NUMERIC (4) | This column will only be populated if the hier_type = subclass. If hier_type = subclass the column will contain the dept number. |
| 6 | MERCH_HIER_NAME |  |  | Y | VARCHAR (120) | This column will contain name of the division, group, department, class or subclass depending on the hier_type |
| 7 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 8 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 9 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 10 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|UK_PEND_MERCH_HIER_TL|UK||||LANG|ASC|
||||||HIER_TYPE|ASC|
||||||MERCH_HIER_ID|ASC|
||||||MERCH_HIER_PARENT_ID|ASC|
||||||MERCH_HIER_GRANDPARENT_ID|ASC|

---

## Table: SUBCLASS

**Description:** This table contains one row for each department/subclass combination within the company. Whenever a subclass name is used by Oracle Retail, or a subclass is validated, it is always selected from this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEPT | P | F | Y | NUMERIC (4) | Contains the department number of which the subclass is a member. |
| 2 | CLASS | P | F | Y | NUMERIC (4) | Contains the class number of which the subclass is a member. |
| 3 | SUBCLASS | P |  | Y | NUMERIC (4) | Contains the number which uniquely identifies the subclass. |
| 4 | SUB_NAME |  |  | Y | VARCHAR (120) | Contains the name of the subclass which, along with the subclass number, uniquely identifies the subclass. |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |
| 6 | CREATE_DATETIME |  |  | Y | Date | This column holds the record creation date. |
| 7 | SUBCLASS_ID |  |  | Y | NUMERIC (10) | Contains the number that uniquely identifies the department/class/subclass combination. This column is populated by the system and not displayed to end users. This will be used for integration to downstream systems as many downstream systems are unable to accommodate the composite dept/class/subclass PK in their hierarchy and item structures. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SUBCLASS|PK||||DEPT|ASC|
||||||CLASS|ASC|
||||||SUBCLASS|ASC|
|UK_SUBCLASS|UK||||SUBCLASS_ID|ASC|

---

## Table: SUBCLASS_CFA_EXT

**Description:** This is the custom attribute extension table for the entity SUBCLASS.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEPT | P | F | Y | NUMERIC (4) | This column holds the Dept this extended data is associated with. |
| 2 | CLASS | P | F | Y | NUMERIC (4) | This column holds the Class this extended data is associated with. |
| 3 | SUBCLASS | P | F | Y | NUMERIC (4) | This column holds the Subclass this extended data is associated with. |
| 4 | GROUP_ID | P |  | Y | NUMERIC (10) | This column holds the attribute group id that this extended data is associated with. The logical business meaning of the VARCHAR_, NUMBER_ and DATE_ columns on this table are determined by the metadata defined for this attribute. |
| 5 | VARCHAR2_1 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_1 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 6 | VARCHAR2_2 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_2 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 7 | VARCHAR2_3 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_3 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 8 | VARCHAR2_4 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_4 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 9 | VARCHAR2_5 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_5 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 10 | VARCHAR2_6 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_6 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 11 | VARCHAR2_7 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_7 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 12 | VARCHAR2_8 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_8 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 13 | VARCHAR2_9 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_9 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 14 | VARCHAR2_10 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_10 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 15 | NUMBER_11 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_11 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 16 | NUMBER_12 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_12 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 17 | NUMBER_13 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_13 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 18 | NUMBER_14 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_14 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 19 | NUMBER_15 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_15 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 20 | NUMBER_16 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_16 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 21 | NUMBER_17 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_17 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 22 | NUMBER_18 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_18 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 23 | NUMBER_19 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_19 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 24 | NUMBER_20 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_20 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 25 | DATE_21 |  |  |  | Date | This column holds data related to the attribute defined on the CFA_ATTRIB table that references DATE_21 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 26 | DATE_22 |  |  |  | Date | This column holds data related to the attribute defined on the CFA_ATTRIB table that references DATE_22 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 27 | DATE_23 |  |  |  | Date | This column holds data related to the attribute defined on the CFA_ATTRIB table that references DATE_23 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 28 | DATE_24 |  |  |  | Date | This column holds data related to the attribute defined on the CFA_ATTRIB table that references DATE_24 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 29 | DATE_25 |  |  |  | Date | This column holds data related to the attribute defined on the CFA_ATTRIB table that references DATE_25 in CFA_ATTRIB.STORAGE_COL_NAME. |

---

## Table: SUBCLASS_SALES_FORECAST

**Description:** Holds the forecast information summed to the subclass/location/eow_date. Should be partitioned by domain, as well. Thus if only a portion of the domains are forecasted, then the rebuild will be done by domain_id.domain_id.forecasted, then the rebuild will be done by domain_id.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEPT |  |  | Y | NUMERIC (4) | Contains the department of the class for which sales information is being kept. |
| 2 | CLASS |  |  | Y | NUMERIC (4) | Contains the class for which sales information is being kept. |
| 3 | SUBCLASS |  |  | Y | NUMERIC (4) | Contains the subclass for which sales information is being kept. |
| 4 | DOMAIN_ID |  |  | Y | NUMERIC (3) | Contains the domain ID number corresponding to the sales information being kept. |
| 5 | LOC |  |  | Y | NUMERIC (10) | Contains the location corresponding to the sales information being kept. |
| 6 | EOW_DATE |  |  | Y | Date | Contains the EOW date for which sales totals are gathered. |
| 7 | FORECAST_SALES |  |  | Y | NUMERIC (20,4) | Contains forecasted sales units for given dept/class/loc/date combination. |

---

## Table: SUBCLASS_SALES_HIST

**Description:** This table contains one row for each subclass/location/week/sales type combination. Sales history, forecast and plan information about each combination is held.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEPT | P |  | Y | NUMERIC (4) | Contains the department of the subclass for which sales information is being kept. |
| 2 | CLASS | P |  | Y | NUMERIC (4) | Contains the class of the subclass for which sales information is being kept. |
| 3 | SUBCLASS | P |  | Y | NUMERIC (4) | Contains the subclass for which sales information is being kept. |
| 4 | STORE | P |  | Y | NUMERIC (10) | Contains the store corresponding to the sales information for the department/class/subclass. |
| 5 | EOW_DATE | P |  | Y | Date | Contains the end of the week date from which the sales totals are gathered. |
| 6 | WEEK_454 |  |  |  | NUMERIC (2) | Contains the number of the 454 week for the sales figures. |
| 7 | MONTH_454 |  |  |  | NUMERIC (2) | Contains the number of the 454 month for the sales figures. |
| 8 | YEAR_454 |  |  |  | NUMERIC (4) | Contains the number of the 454 year for the sales figures. |
| 9 | SALES_TYPE | P |  | Y | VARCHAR (1) | Indicates the type of sale which generated the sales. Valid values are: R - Regular P - Promotional C - Clearance |
| 10 | SALES |  |  |  | NUMERIC (20,4) | Contains the number of units sold for the Department/Class/Subclass/Store/week/sales_type combination. |
| 11 | VALUE |  |  |  | NUMERIC (20,4) | Contains the retail value received on the sales for the Department/Class/Subclass/Store/week/sales_type combination. |
| 12 | GP |  |  |  | NUMERIC (20,4) | Contains the gross profit on the sales for the Department/Class/Subclass/Store/week/sales_type combination. |
| 13 | PLAN_SALES |  |  |  | NUMERIC (12,4) | Holds interfaced planned sales data. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SUBCLASS_SALES_HIST|PK||||DEPT|ASC|
||||||CLASS|ASC|
||||||SUBCLASS|ASC|
||||||STORE|ASC|
||||||EOW_DATE|ASC|
||||||SALES_TYPE|ASC|
|SUBCLASS_SALES_HIST_I1|||||DEPT|ASC|
||||||CLASS|ASC|
||||||STORE|ASC|
||||||EOW_DATE|ASC|
||||||SALES_TYPE|ASC|

---

## Table: SUBCLASS_SALES_HIST_MTH

**Description:** This table contains one row for each subclass/location/month/sales type combination. Sales history, forecast and plan information about each combination is held.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEPT |  | F | Y | NUMERIC (4) | Contains the department for which sales information is being kept. |
| 2 | CLASS |  |  | Y | NUMERIC (4) | Contains the class for which sales information is being kept. |
| 3 | SUBCLASS |  |  | Y | NUMERIC (4) | Contains the subclass for which sales information is being kept. |
| 4 | STORE |  | F | Y | NUMERIC (10) | Contains the store corresponding to the sales information for the department. |
| 5 | EOM_DATE |  |  | Y | Date | Contains the end of the week date from which the sales totals are gathered. |
| 6 | MONTH_454 |  |  |  | NUMERIC (2) | Contains the number of the 454 month for the sales figures. |
| 7 | YEAR_454 |  |  |  | NUMERIC (4) | Contains the number of the 454 year for the sales figures. |
| 8 | SALES_TYPE |  |  | Y | VARCHAR (1) | Indicates the type of sale which generated the sales. Valid values are: R - Regular P - Promotional C - Clearance |
| 9 | SALES |  |  |  | NUMERIC (20,4) | Contains the number of units sold for the Department/Store/month/sales type combination. |
| 10 | VALUE |  |  |  | NUMERIC (20,4) | Contains the retail value received on the sales for the Department/Store/month/sales type combination. |
| 11 | GP |  |  |  | NUMERIC (20,4) | Contains the gross profit on the sales for the Department/Store/month/sales type combination. |
| 12 | PLAN_SALES |  |  |  | NUMERIC (12,4) | Holds interfaced planned sales data. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|SUBCLASS_SALES_HIST_MTH_I2|||||STORE|ASC|
|SUBCLASS_SALES_HIST_MTH_I1|||||DEPT|ASC|

---

## Table: SUBCLASS_TL

**Description:** This is the translation table for SUBCLASS table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | DEPT | P | F | Y | NUMERIC (4) | Contains the department number of which the subclass is a member. |
| 3 | CLASS | P | F | Y | NUMERIC (4) | Contains the class number of which the subclass is a member. |
| 4 | SUBCLASS | P | F | Y | NUMERIC (4) | Contains the number which uniquely identifies the subclass. |
| 5 | SUB_NAME |  |  | Y | VARCHAR (120) | Contains the name of the subclass which, along with the subclass number, uniquely identifies the subclass. |
| 6 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 7 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 8 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 9 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SUBCLASS_TL|PK||||LANG|ASC|
||||||DEPT|ASC|
||||||CLASS|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
||||||SUBCLASS|ASC|
