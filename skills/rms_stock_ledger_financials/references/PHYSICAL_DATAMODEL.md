# RMS Stock Ledger & Financial Accounting Datamodel - Physical Data Model Reference

## Table: DISC_OTB_APPLY

**Description:** This table contains the original and new values applied against open to buy (OTB) budget for a PO for an item/dept/class/subclass combination, changed because of the application of a deal to an order.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ORIG_OTB |  |  |  | NUMERIC (20,4) | This field contains the original OTB value for the item/dept/class/subclass combination on the order. |
| 2 | NEW_OTB |  |  |  | NUMERIC (20,4) | This field contains the new OTB value for the item/dept/class/subclass combination on the order. |
| 3 | ORDER_NO |  |  |  | NUMERIC (12) | This field contains the number that uniquely identifies an order for which the deal is applicable. |
| 4 | DEPT |  |  |  | NUMERIC (4) | This field contains the unique identifier of the department whose OTB budget is impacted. |
| 5 | CLASS |  |  |  | NUMERIC (4) | This field contains the unique identifier of the class whose OTB budget is impacted. |
| 6 | SUBCLASS |  |  |  | NUMERIC (4) | This field contains the unique identifier of the subclass whose OTB budget is impacted. |
| 7 | OTB_CALC_TYPE |  |  |  | VARCHAR (1) | This field contains the code letter which determines how OTB is calculated for this department. Valid values are: C = Cost R = Retail |

---

## Table: FIF_CLASS

**Description:** This table contains one row for each class for which an insert, update, or delete to the CLASS table has occurred. The table will be extracted and purged nightly by the financial interface process.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEPT | P |  | Y | NUMERIC (4) | This field contains the unique identifer for the department of which the class is a member. |
| 2 | CLASS | P |  | Y | NUMERIC (4) | This field contains the unique identifer for the class from the CLASS table. |
| 3 | CLASS_NAME |  |  |  | VARCHAR (120) | The field contains the class name. |

---

## Table: FIF_CURRENCY_XREF

**Description:** This table is used to cross reference exchange rate type defined by RMS and external financial system.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | FIF_EXCHANGE_TYPE |  |  |  | VARCHAR (30) | This field contains the type of exchange rate defined by the external financial system interfacing with RMS. |
| 2 | RMS_EXCHANGE_TYPE |  |  |  | VARCHAR (1) | This field contains the cross referenced type of exchange rate defined by RMS. |

---

## Table: FIF_DEPS

**Description:** This table contains one row for each department for which an insert, update, or delete to the DEPS table has occurred. The table will be extracted and purged nightly by the financial interface process.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEPT | P |  | Y | NUMERIC (4) | This field contains the unique identifer for the department from the DEPS table. |
| 2 | DEPT_NAME |  |  |  | VARCHAR (120) | The field contains the department name. |

---

## Table: FIF_GL_ACCT

**Description:** This table will hold all the account related information which will be bridged across from the respective Financial Application.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PRIMARY_ACCOUNT |  |  |  | NUMERIC (15) | This denotes the primary account for a chart of accounts. |
| 2 | SET_OF_BOOKS_ID |  |  | Y | NUMERIC (15) | Set Of Books Id |
| 3 | ATTRIBUTE1 |  |  |  | VARCHAR (25) | Secondary Account information |
| 4 | ATTRIBUTE2 |  |  |  | VARCHAR (25) | Secondary Account information |
| 5 | ATTRIBUTE3 |  |  |  | VARCHAR (25) | Secondary Account information |
| 6 | ATTRIBUTE4 |  |  |  | VARCHAR (25) | Secondary Account information |
| 7 | ATTRIBUTE5 |  |  |  | VARCHAR (25) | Secondary Account information |
| 8 | ATTRIBUTE6 |  |  |  | VARCHAR (25) | Secondary Account information |
| 9 | ATTRIBUTE7 |  |  |  | VARCHAR (25) | Secondary Account information |
| 10 | ATTRIBUTE8 |  |  |  | VARCHAR (25) | Secondary Account information |
| 11 | ATTRIBUTE9 |  |  |  | VARCHAR (25) | Secondary Account information |
| 12 | ATTRIBUTE10 |  |  |  | VARCHAR (25) | Secondary Account information |
| 13 | ATTRIBUTE11 |  |  |  | VARCHAR (25) | Secondary Account information |
| 14 | ATTRIBUTE12 |  |  |  | VARCHAR (25) | Secondary Account information |
| 15 | ATTRIBUTE13 |  |  |  | VARCHAR (25) | Secondary Account information |
| 16 | ATTRIBUTE14 |  |  |  | VARCHAR (25) | Secondary Account information |
| 17 | ATTRIBUTE15 |  |  |  | VARCHAR (25) | Secondary Account information |
| 18 | DESCRIPTION1 |  |  |  | VARCHAR (50) | Description of the Attribute1 field |
| 19 | DESCRIPTION2 |  |  |  | VARCHAR (50) | Description of the Attribute2 field |
| 20 | DESCRIPTION3 |  |  |  | VARCHAR (50) | Description of the Attribute3 field |
| 21 | DESCRIPTION4 |  |  |  | VARCHAR (50) | Description of the Attribute4 field |
| 22 | DESCRIPTION5 |  |  |  | VARCHAR (50) | Description of the Attribute5 field |
| 23 | DESCRIPTION6 |  |  |  | VARCHAR (50) | Description of the Attribute6 field |
| 24 | DESCRIPTION7 |  |  |  | VARCHAR (50) | Description of the Attribute7 field |
| 25 | DESCRIPTION8 |  |  |  | VARCHAR (50) | Description of the Attribute8 field |
| 26 | DESCRIPTION9 |  |  |  | VARCHAR (50) | Description of the Attribute9 field |
| 27 | DESCRIPTION10 |  |  |  | VARCHAR (50) | Description of the Attribute10 field |
| 28 | DESCRIPTION11 |  |  |  | VARCHAR (50) | Description of the Attribute11 field |
| 29 | DESCRIPTION12 |  |  |  | VARCHAR (50) | Description of the Attribute12 field |
| 30 | DESCRIPTION13 |  |  |  | VARCHAR (50) | Description of the Attribute13 field |
| 31 | DESCRIPTION14 |  |  |  | VARCHAR (50) | Description of the Attribute14 field |
| 32 | DESCRIPTION15 |  |  |  | VARCHAR (50) | Description of the Attribute15 field |

---

## Table: FIF_GL_CROSS_REF

**Description:** Will be populated by the form glcrossr.fmt. It maps Oracle Retail mapping fields (dept, class, subclass, location, tran_code, and cost/retail flag) to Oracle sequence numbers and CCIDs. It will be used by the Oracle GL PDLP to determine account mappings.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | FIF_GL_CROSS_REF_ID | P |  | Y | NUMERIC (10) | system-generated primary key for this table. |
| 2 | SET_OF_BOOKS_ID |  | F | Y | NUMERIC (15) | Set Of Books Id |
| 3 | DEPT |  |  | Y | NUMERIC (4) | Oracle Retail department. A value of -1 will be used as a wildcard to mean all departments. |
| 4 | CLASS |  |  | Y | NUMERIC (4) | Oracle Retail Class. A value of -1 will be used as a wildcard to mean all classes. |
| 5 | SUBCLASS |  |  | Y | NUMERIC (4) | Oracle Retail Subclass. A value of -1 will be used as a wildcard to mean all subclasses. |
| 6 | LOCATION |  |  | Y | NUMERIC (10) | Oracle Retail Location. A value of -1 will be used as a wildcard to mean all locations. |
| 7 | TRAN_CODE |  |  | Y | NUMERIC (4) | Oracle Retail Transaction code. A value of -1 will be used as a wildcard to mean all tran codes. A tran code of zero will be used to refer to purchase order accounts. |
| 8 | COST_RETAIL_FLAG |  |  | Y | VARCHAR (1) | Cost C or Retail R Flag. |
| 9 | LINE_TYPE |  |  | Y | VARCHAR (6) | This indicates whether the account code of this record is for an Item, Freight, Tax, or Miscellaneous. This information will be necessary when choosing which Oracle Financials account to associate with each line in the invoice. Without this field, we are only able to choose an account code for an item, not for freight, tax, or miscellaneous charges. |
| 10 | TRAN_REF_NO |  |  |  | VARCHAR (25) | Contains the intercompany transfer from/to location (tran code = 37, 38), the work order activity ID (tran code = 63, 64), the inv_adj_reason (tran code = 22, 23), or the vat_code (tran_code = 87, 88). If the tran code is Intercompany Out, the field will contain the transfer To Location. If the tran code is Intercompany In, the field will contain the transfer From Location. |
| 11 | DR_CCID |  |  |  | NUMERIC (15) | Oracle debit account combination code ID, determined from the 10 sequence numbers. |
| 12 | DR_SEQUENCE1 |  |  |  | VARCHAR (25) | Oracle debit account mapping field1, maps to Oracle side GL_Code _combinations table |
| 13 | DR_SEQUENCE2 |  |  |  | VARCHAR (25) | Oracle debit account mapping field2, maps to Oracle side GL_Code _combinations table |
| 14 | DR_SEQUENCE3 |  |  |  | VARCHAR (25) | Oracle debit account mapping field3, maps to Oracle side GL_Code _combinations table |
| 15 | DR_SEQUENCE4 |  |  |  | VARCHAR (25) | Oracle debit account mapping field4, maps to Oracle side GL_Code _combinations table |
| 16 | DR_SEQUENCE5 |  |  |  | VARCHAR (25) | Oracle debit account mapping field5, maps to Oracle side GL_Code _combinations table |
| 17 | DR_SEQUENCE6 |  |  |  | VARCHAR (25) | Oracle debit account mapping field6, maps to Oracle side GL_Code _combinations table |
| 18 | DR_SEQUENCE7 |  |  |  | VARCHAR (25) | Oracle debit account mapping field7, maps to Oracle side GL_Code _combinations table |
| 19 | DR_SEQUENCE8 |  |  |  | VARCHAR (25) | Oracle debit account mapping field8, maps to Oracle side GL_Code _combinations table |
| 20 | DR_SEQUENCE9 |  |  |  | VARCHAR (25) | Oracle debit account mapping field9, maps to Oracle side GL_Code _combinations table |
| 21 | DR_SEQUENCE10 |  |  |  | VARCHAR (25) | Oracle debit account mapping field10, maps to Oracle side GL_Code _combinations table |
| 22 | CR_CCID |  |  |  | NUMERIC (15) | Oracle credit account combination code ID, determined from the 10 sequence numbers. |
| 23 | CR_SEQUENCE1 |  |  |  | VARCHAR (25) | Oracle credit account mapping field1, maps to Oracle side GL_Code _combinations table |
| 24 | CR_SEQUENCE2 |  |  |  | VARCHAR (25) | Oracle credit account mapping field2, maps to Oracle side GL_Code _combinations table |
| 25 | CR_SEQUENCE3 |  |  |  | VARCHAR (25) | Oracle credit account mapping field3, maps to Oracle side GL_Code _combinations table |
| 26 | CR_SEQUENCE4 |  |  |  | VARCHAR (25) | Oracle credit account mapping field4, maps to Oracle side GL_Code _combinations table |
| 27 | CR_SEQUENCE5 |  |  |  | VARCHAR (25) | Oracle credit account mapping field5, maps to Oracle side GL_Code _combinations table |
| 28 | CR_SEQUENCE6 |  |  |  | VARCHAR (25) | Oracle credit account mapping field6, maps to Oracle side GL_Code _combinations table |
| 29 | CR_SEQUENCE7 |  |  |  | VARCHAR (25) | Oracle credit account mapping field7, maps to Oracle side GL_Code _combinations table |
| 30 | CR_SEQUENCE8 |  |  |  | VARCHAR (25) | Oracle credit account mapping field8, maps to Oracle side GL_Code _combinations table |
| 31 | CR_SEQUENCE9 |  |  |  | VARCHAR (25) | Oracle credit account mapping field9, maps to Oracle side GL_Code _combinations table |
| 32 | CR_SEQUENCE10 |  |  |  | VARCHAR (25) | Oracle credit account mapping field10, maps to Oracle side GL_Code _combinations table |
| 33 | DR_SEQUENCE11 |  |  |  | VARCHAR (25) | debit account mapping field11 |
| 34 | DR_SEQUENCE12 |  |  |  | VARCHAR (25) | debit account mapping field12 |
| 35 | DR_SEQUENCE13 |  |  |  | VARCHAR (25) | debit account mapping field13 |
| 36 | DR_SEQUENCE14 |  |  |  | VARCHAR (25) | debit account mapping field14 |
| 37 | DR_SEQUENCE15 |  |  |  | VARCHAR (25) | debit account mapping field15 |
| 38 | DR_SEQUENCE16 |  |  |  | VARCHAR (25) | debit account mapping field16 |
| 39 | DR_SEQUENCE17 |  |  |  | VARCHAR (25) | debit account mapping field17 |
| 40 | DR_SEQUENCE18 |  |  |  | VARCHAR (25) | debit account mapping field18 |
| 41 | DR_SEQUENCE19 |  |  |  | VARCHAR (25) | debit account mapping field19 |
| 42 | DR_SEQUENCE20 |  |  |  | VARCHAR (25) | debit account mapping field20 |
| 43 | CR_SEQUENCE11 |  |  |  | VARCHAR (25) | credit account mapping field11 |
| 44 | CR_SEQUENCE12 |  |  |  | VARCHAR (25) | credit account mapping field12 |
| 45 | CR_SEQUENCE13 |  |  |  | VARCHAR (25) | credit account mapping field13 |
| 46 | CR_SEQUENCE14 |  |  |  | VARCHAR (25) | credit account mapping field14 |
| 47 | CR_SEQUENCE15 |  |  |  | VARCHAR (25) | credit account mapping field15 |
| 48 | CR_SEQUENCE16 |  |  |  | VARCHAR (25) | credit account mapping field16 |
| 49 | CR_SEQUENCE17 |  |  |  | VARCHAR (25) | credit account mapping field17 |
| 50 | CR_SEQUENCE18 |  |  |  | VARCHAR (25) | credit account mapping field18 |
| 51 | CR_SEQUENCE19 |  |  |  | VARCHAR (25) | credit account mapping field19 |
| 52 | CR_SEQUENCE20 |  |  |  | VARCHAR (25) | credit account mapping field20 |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_FIF_GL_CROSS_REF|PK||||FIF_GL_CROSS_REF_ID|ASC|
|FIF_GL_CROSS_REF_I1|||||LOCATION|ASC|
|FIF_GL_CROSS_REF_I2|||||TRAN_CODE|ASC|
|FIF_GL_CROSS_REF_I3|UN||||DEPT|ASC|
||||||CLASS|ASC|
||||||SUBCLASS|ASC|
||||||LOCATION|ASC|
||||||TRAN_CODE|ASC|
||||||COST_RETAIL_FLAG|ASC|
||||||LINE_TYPE|ASC|
||||||TRAN_REF_NO|ASC|
||||||SET_OF_BOOKS_ID|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_FIF_GL_CRS_RF_CST_RTL_FLG|COST_RETAIL_FLAG in ('C','R')<br>|
||CHK_FIF_GL_CRS_RF_TRAN_REF_NO|((tran_code in(37,38,63,64,87,88) and tran_ref_no is not null) or (tran_code not in(22,23,37,38,63,64,87,88) and tran_ref_no is null) )<br>|
|Column Level|COST_RETAIL_FLAG||

---

## Table: FIF_GL_DATA

**Description:** This table is used for staging data from MONTH_DATA and TRAN_DATA to a General Ledger in an external financial system.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEPT |  |  |  | NUMERIC (4) | This field contains the unique identifier for the department associated with the Item/SKU. |
| 2 | CLASS |  |  |  | NUMERIC (4) | This field contains the unique identifier for the class associated with the Item/SKU. |
| 3 | SUBCLASS |  |  |  | NUMERIC (4) | This field contains the unique identifier for the subclass associated with the Item/SKU. |
| 4 | LOCATION |  |  |  | NUMERIC (10) | This field contains the unique identifier for the location for which the transaction is posted. The location will be a store if LOC_TYPE is S, a Warehouse or Internal Finisher if LOC_TYPE is W and a External Finisher if LOC_TYPE is E. |
| 5 | LOC_TYPE |  |  |  | VARCHAR (1) | This field contains type of the location for which the transaction is posted. Valid Values are : S = Store, W = Warehouse, E = External Finisher. |
| 6 | TRAN_DATE |  |  |  | Date | This field contains the date that the transaction was written. |
| 7 | TRAN_CODE |  |  |  | NUMERIC (4) | This field contains the unique numerical code to identify different transaction types. |
| 8 | AMOUNT |  |  |  | NUMERIC (20,4) | This field contains the amount of the transaction in the currency specified in currency code column. |
| 9 | ADJ_CODE |  |  |  | VARCHAR (1) | This field indicates the type of adjustment for which this record is written to correct a previous error, such as Cost adjustment, Retail adjustment, or Unit adjustment. This will only be populated for records with tran_code = 20. |
| 10 | COST_RETAIL_FLAG |  |  |  | VARCHAR (1) | This field specifies if the amount of the transaction is recorded at Cost or at Retail. |
| 11 | REF_NO_1 |  |  |  | NUMERIC (12) | This field contains the Reference number associated with the transaction. The reference number can be used for identifying related transactions or reporting purposes. For example, this field would contain the order number for a transaction type of 20 related to purchase order receipts. |
| 12 | REF_NO_2 |  |  |  | NUMERIC (12) | This field contains the Reference number associated with the transaction. The reference number can be used for indentifying related transactions or reporting purposes, etc. For example, this field would contain the Shipment Number for a transaction type of 20 related to purchase order receipts. |
| 13 | SKU |  |  |  | NUMERIC (8) | This field contains the unique identifier for the Item/SKU associated with the transaction. |
| 14 | CURRENCY_CODE |  |  |  | VARCHAR (3) | This field contains the unique identifier for the currency in which the transaction amount is recorded, such as USD. |

---

## Table: FIF_GL_SETUP

**Description:** This table is used to hold all the intial set-up information pertaining to Financial Application

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SET_OF_BOOKS_ID | P |  | Y | NUMERIC (15) | Oracle set of books for Oracle Retail transactions. |
| 2 | LAST_UPDATE_ID |  |  | Y | NUMERIC (15) | Oracle last update ID, default for all Oracle Retail transactions. |
| 3 | SEQUENCE1_DESC |  |  |  | VARCHAR (20) | Contains description for sequence columns on the interface cross reference form. |
| 4 | SEQUENCE2_DESC |  |  |  | VARCHAR (20) | Contains description for sequence columns on the interface cross reference form. |
| 5 | SEQUENCE3_DESC |  |  |  | VARCHAR (20) | Contains description for sequence columns on the interface cross reference form. |
| 6 | SEQUENCE4_DESC |  |  |  | VARCHAR (20) | Contains description for sequence columns on the interface cross reference form. |
| 7 | SEQUENCE5_DESC |  |  |  | VARCHAR (20) | Contains description for sequence columns on the interface cross reference form. |
| 8 | SEQUENCE6_DESC |  |  |  | VARCHAR (20) | Contains description for sequence columns on the interface cross reference form. |
| 9 | SEQUENCE7_DESC |  |  |  | VARCHAR (20) | Contains description for sequence columns on the interface cross reference form. |
| 10 | SEQUENCE8_DESC |  |  |  | VARCHAR (20) | Contains description for sequence columns on the interface cross reference form. |
| 11 | SEQUENCE9_DESC |  |  |  | VARCHAR (20) | Contains description for sequence columns on the interface cross reference form. |
| 12 | SEQUENCE10_DESC |  |  |  | VARCHAR (20) | Contains description for sequence columns on the interface cross reference form. |
| 13 | CATEGORY_ID |  |  | Y | NUMERIC (38) | Oracle category ID, default for Oracle Retail purchase order feed. |
| 14 | DELIVER_TO_LOCATION_ID |  |  | Y | NUMERIC (15) | Oracle location_id, default for Oracle Retail purchase order feed. |
| 15 | DESTINATION_ORGANIZATION_ID |  |  | Y | NUMERIC (38) | Oracle organization_id, default for Oracle Retail purchase order feed. |
| 16 | PERIOD_NAME |  |  |  | VARCHAR (15) | This denotes the user entered accounting period name as defined in Financial Applications e.g. Oracle, Peoplesoft. This field will be manually populated either by insert script or hard insert. |
| 17 | SET_OF_BOOKS_DESC |  |  | Y | VARCHAR (120) | Set Of Books Description |
| 18 | CURRENCY_CODE |  |  | Y | VARCHAR (3) | Currency code for the Set Of Book ID |
| 19 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |
| 20 | CREATE_DATETIME |  |  | Y | Date | This column holds the record creation date. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_FIF_GL_SETUP|PK||||SET_OF_BOOKS_ID|ASC|

---

## Table: FIF_GL_SETUP_L10N_EXT

**Description:** This table will store the fiscal attributes at the Set of Books level. This table will not be accessed by a form to insert/maintain data, but will be populated and updated maintained by the retailer

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SET_OF_BOOKS_ID | P | F | Y | NUMERIC (15) | Contains the unique number identifying the set of books |
| 2 | L10N_COUNTRY_ID | P | F | Y | VARCHAR (3) | This column holds the country this extended data is associated with. The logical business meaning of the VARCHAR_, NUMBER_ and DATE_ columns on this table are determined by the metadata defined for this country in its localization pack. |
| 3 | GROUP_ID | P | F | Y | NUMERIC (10) | This column holds the attribute group id that this extended data is associated with. The logical business meaning of the VARCHAR_, NUMBER_ and DATE_ columns on this table are determined by the metadata defined for this country/attribute group in the countrys localization pack. |
| 4 | VARCHAR2_1 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references VARCHAR2_1 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 5 | VARCHAR2_2 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references VARCHAR2_2 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 6 | VARCHAR2_3 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references VARCHAR2_3 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 7 | VARCHAR2_4 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references VARCHAR2_4 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 8 | VARCHAR2_5 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references VARCHAR2_5 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 9 | VARCHAR2_6 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references VARCHAR2_6 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 10 | VARCHAR2_7 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references VARCHAR2_7 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 11 | VARCHAR2_8 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references VARCHAR2_8 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 12 | VARCHAR2_9 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references VARCHAR2_9 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 13 | VARCHAR2_10 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references VARCHAR2_10 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 14 | NUMBER_11 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references NUMBER_11 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 15 | NUMBER_12 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references NUMBER_12 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 16 | NUMBER_13 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references NUMBER_13 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 17 | NUMBER_14 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references NUMBER_14 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 18 | NUMBER_15 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references NUMBER_15 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 19 | NUMBER_16 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references NUMBER_16 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 20 | NUMBER_17 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references NUMBER_17 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 21 | NUMBER_18 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references NUMBER_18 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 22 | NUMBER_19 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references NUMBER_19 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 23 | NUMBER_20 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references NUMBER_20 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 24 | DATE_21 |  |  |  | Date | This column holds data related to the attribute defined on the L10N_ATTRIB table that references DATE_21 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 25 | DATE_22 |  |  |  | Date | This column holds data related to the attribute defined on the L10N_ATTRIB table that references DATE_22 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_FIF_GL_SETUP_L10N_EXT|PK||||SET_OF_BOOKS_ID|ASC|
||||||L10N_COUNTRY_ID|ASC|
||||||GROUP_ID|ASC|

---

## Table: FIF_INVC_DETAILS_EXPORT

**Description:** This table will hold a row of each SKU or type of non_merchandise cost associated on an invoice in the system that is to be transmitted to the financial system.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | RTK_INVOICE_ID |  |  |  | NUMERIC (10) | Oracle Retail invoice number. |
| 2 | LINE_NO |  |  |  | NUMERIC (15) | Unique number that identifying the line. |
| 3 | INVOICE_LINE_TYPE |  |  |  | VARCHAR (25) | Code identifying the type of the line. Convert RMS SKU cost to ITEM, and RMS non_merch cost to more detailed category as FREIGHT, TAX and MISCELLANOUS. |
| 4 | AMOUNT |  |  |  | NUMERIC (20,4) | Cost for the line item. |
| 5 | AMOUNT_INCLUDES_TAX_FLAG |  |  |  | VARCHAR (1) | Indicated whether or not the cost amount include tax. If include set it to Y. |
| 6 | TAX_CODE |  |  |  | VARCHAR (15) | Code identifying tax category. As of VAT code or if the line type is TAX, a tax code is required. |
| 7 | QUANTITY_INVOICED |  |  |  | NUMERIC (12,4) | Invoiced quantity |
| 8 | UNIT_PRICE |  |  |  | NUMERIC (20,4) | Unit cost for the SKU, which is held at invoice currency. |
| 9 | DIST_CODE_CMBINATION_ID |  |  |  | NUMERIC (15) | Account id to which the invoice is debit or credit for. (specific for Oracle financial) |
| 10 | LAST_UPDATE_DATE |  |  |  | Date | Date at which the invoice post to the interface. |
| 11 | LAST_UPDATE_BY |  |  |  | NUMERIC (15) | User id to whom invoice post is preformed. |
| 12 | CREATION_DATE |  |  |  | Date | Date when invoice was posted to the interface. |
| 13 | CREATED_BY |  |  |  | NUMERIC (15) | User id to whom invoice post is preformed. |
| 14 | ATTRIBUTE_CATEGORY |  |  |  | VARCHAR (150) | Code identifying the propose. Default to Invoice Upload. |
| 15 | ATTRIBUTE1 |  |  |  | VARCHAR (150) | Free from column for adding reference. |
| 16 | ATTRIBUTE2 |  |  |  | VARCHAR (150) | Free from column for adding reference. |
| 17 | ATTRIBUTE3 |  |  |  | VARCHAR (150) | Free from column for adding reference. |
| 18 | ATTRIBUTE4 |  |  |  | VARCHAR (150) | Free from column for adding reference. |
| 19 | ATTRIBUTE5 |  |  |  | VARCHAR (150) | Free from column for adding reference. |
| 20 | ITEM_DESCRIPTION |  |  |  | VARCHAR (240) | Free from comment column. Description for the item. |

---

## Table: FIF_INVC_HEADERS_EXPORT

**Description:** This table will hold a row of each ready to paid invoice in the system that is to be transmitted to the financial system.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | RTK_INVOICE_ID |  |  |  | NUMERIC (10) | Oracle Retail invoice number. |
| 2 | INVOICE_NUM |  |  |  | VARCHAR (30) | Any supplier-generated invoice number. |
| 3 | INVOICE_DATE |  |  |  | Date | Date when the invoice was create in the system. |
| 4 | VENDOR_NUM |  |  |  | NUMERIC (10) | Supplier or partner the invoice was created from. |
| 5 | VENDOR_SITE_ID |  |  |  | NUMERIC (15) | Vendors address id where invoice payment pay to. |
| 6 | INVOICE_TOTAL |  |  |  | NUMERIC (20,4) | Total amount need to be paid for the invoice. |
| 7 | INVOICE_TYPE |  |  |  | VARCHAR (25) | Type of invoice, Standard or Credit. A Credit invoice is must have invoice amount that is less than zero. |
| 8 | INVOICE_CURRENCY_CODE |  |  |  | VARCHAR (15) | Code identifying the currency in which the invoice is held. |
| 9 | EXCHANGE_RATE |  |  |  | NUMERIC (20,10) | Exchange rate at which the invoice is held. |
| 10 | EXCHANGE_TYPE |  |  |  | VARCHAR (30) | Exchange rate type at which the invoice is held. |
| 11 | EXCHANGE_DATE |  |  |  | Date | Date at which exchange take place. |
| 12 | TERMS |  |  |  | VARCHAR (50) | Term assigned to the invoice. |
| 13 | INVOICE_RECEIVED_DATE |  |  |  | Date | Date when invoice received. |
| 14 | INVOICE_POST_DATE |  |  |  | Date | Date when invoice was posted to the interface. |
| 15 | LAST_UPDATE_DATE |  |  |  | Date | Date at which the invoice post to the interface. |
| 16 | LAST_UPDATE_BY |  |  |  | NUMERIC (15) | User id to whom invoice post is preformed. |
| 17 | CREATION_DATE |  |  |  | Date | Date when invoice was posted to the interface. |
| 18 | CREATED_BY |  |  |  | NUMERIC (15) | User id to whom invoice post is preformed. |
| 19 | ACCTS_PAY_CODE_COMBINATION_ID |  |  |  | NUMERIC (15) | Account id to which the invoice is debit or credit for. |
| 20 | ORG_ID |  |  |  | NUMERIC (15) | Organization id to which the accounts are set upped. |
| 21 | AMOUNT_APPLICABLE_TO_DISCOUNT |  |  |  | NUMERIC (20,4) | The invoice amount in which a discount applicable to it. |
| 22 | SOURCE |  |  |  | VARCHAR (80) | Code identifying the source. Default to Oracle Retail. |
| 23 | ATTRIBUTE_CATEGORY |  |  |  | VARCHAR (150) | Code identifying the propose. Default to Invoice Upload. |
| 24 | ATTRIBUTE1 |  |  |  | VARCHAR (150) | Free from column for adding reference. |
| 25 | ATTRIBUTE2 |  |  |  | VARCHAR (150) | Free from column for adding reference. |
| 26 | ATTRIBUTE3 |  |  |  | VARCHAR (150) | Free from column for adding reference. |
| 27 | ATTRIBUTE4 |  |  |  | VARCHAR (150) | Free from column for adding reference. |
| 28 | ATTRIBUTE5 |  |  |  | VARCHAR (150) | Free from column for adding reference. |
| 29 | INVOICE_DESC |  |  |  | VARCHAR (255) | Free form comments associated to the invoice. |

---

## Table: FIF_LINE_TYPE_XREF

**Description:** Description of the table: A cross reference table used to map the Line type of the Financial package to the Line type of RMS.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | RMS_LINE_TYPE | P |  | Y | VARCHAR (6) | Denotes the line type defined by RMS which will be a cross reference to the line type of the Financial package. |
| 2 | RMS_LINE_TYPE_DESC |  |  | Y | VARCHAR (30) | Denotes the description of the line type defined by RMS. |
| 3 | FIF_LINE_TYPE |  |  | Y | VARCHAR (25) | Denotes the line type defined by the Financial package interfacing with RMS. When Financial package is Oracle, it will fetch the lookup_code from AP_LOOKUP_CODE table where lookup_type = INVOICE DISTRIBUTION TYPE. |

---

## Table: FIF_SUBCLASS

**Description:** This table contains one row for each subclass for which an insert, update, or delete to the SUBCLASS table has occurred. The table will be extracted and purged nightly by the financial interface process.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEPT | P |  | Y | NUMERIC (4) | The field contains the unique identifier for the department, of which the subclass is a member. |
| 2 | CLASS | P |  | Y | NUMERIC (4) | The field contains the unique identifier for the class, of which the subclass is a member. |
| 3 | SUBCLASS | P |  | Y | NUMERIC (4) | This field contains the unique identifier for the subclass. |
| 4 | SUB_NAME |  |  |  | VARCHAR (120) | This field contains the subclass name. |

---

## Table: FINANCIAL_UNIT_OPTIONS

**Description:** This table contains attributes that affect how financial data is captured for both stock ledger and general ledger in RMS.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | BUD_SHRINK_IND |  |  | Y | VARCHAR (1) | This column determines whether budgeted shrinkage will be used in the calculation of period ending inventory value in the stock ledger. If BUD_SHRINK_IND = N, then shrinkage will be calculated based on inventory adjustments (it is assumed that SIM/WMS would perform regular cycle counts to report the shrinkage). If BUD_SHRINK_IND = Y, then shrinkage will be calculated as a percentage of sales. Then when the Unit & Dollar stock count is performed, the estimated shrinkage will be corrected according the the count results. |
| 2 | CLOSE_MTH_WITH_OPN_CNT_IND |  |  | Y | VARCHAR (1) | Indicator if a month with open Unit & Value stock counts can be closed. |
| 3 | ELC_INCLUSIVE_IND_WF_STORE |  |  | Y | VARCHAR (1) | Indicates whether pricing and acquisition costs should be inclusive of ELC for franchise stores. If no value is specified, it is assume to be N. |
| 4 | ELC_INCLUSIVE_IND_COMP_STORE |  |  | Y | VARCHAR (1) | Indicates whether pricing and acquisition costs should be inclusive of ELC for company stores. If no value is specified, it is assume to be N. |
| 5 | GL_ROLLUP |  |  |  | VARCHAR (1) | The roll up level of Oracle Retails general ledger information when bridged to a financial system. Valid values are: D - Department, C -Class, S - Subclass. |
| 6 | MARGIN_IMPACT_HIST_RECS |  |  |  | NUMERIC (2) | This column controls how many historical future cost records will be displayed for each item/supplier/country/location on the Margin Impact screen. |
| 7 | MAX_CUM_MARKON_PCT |  |  |  | NUMERIC (12,4) | Indicates the maximum value that will be allowed for Cumulative Mark-On Percentage, when recalculated in the monthly stock ledger batch processes. |
| 8 | MIN_CUM_MARKON_PCT |  |  |  | NUMERIC (12,4) | Indicates the minimum value that will be allowed for Cumulative Mark-On Percentage, when recalculated in the monthly stock ledger batch processes. |
| 9 | START_OF_HALF_MONTH |  |  | Y | NUMERIC (2) | The month number of the first month of the first half of any fiscal year. It is set during system installation and cannot be changed. The month number must be from -12 to 12, excluding 0 and -1. A negative number indicates that the first half of a year starts in the previous year with -2 = February, -3 =March etc. A positive number corresponds to the normal calendar month numbers. |
| 10 | STD_AV_IND |  |  | Y | VARCHAR (1) | Indicates whether standard cost or weighted average cost will be used for inventory and gross profit calculations. Valid values are 'S' for standard and 'A' for average. |
| 11 | STKLDGR_VAT_INCL_RETL_IND |  |  |  | VARCHAR (1) | This column determines whether retail value in stock ledger is VAT inclusive or not. This field is only applicable when VAT is used in the system (when DEFAULT_TAX_TYPE is 'SVAT' or 'GTAX') . If this field contains Y, then all retail value in the stock ledger (e.g. sales retail, purchase retail and gross margin) are VAT inclusive. |
| 12 | STOCK_LEDGER_TIME_LEVEL_CODE |  |  | Y | VARCHAR (1) | The lowest time interval for the stock ledger: Month (M) or Week (W). If a client is running on 454 calendar, stock ledger is available to run for both weekly and monthly levels, which means that inventory and gross margin are available at both weekly and monthly levels. However, a client is not required to run the weekly level stock ledger, if it is not needed. If a client is running on a normal calendar, only monthly level stock ledger is available. |
| 13 | CREATE_ID |  |  | Y | VARCHAR (30) | Stores the Oracle username of the one who inserted the first record. This field is required by the database. |
| 14 | CREATE_DATETIME |  |  | Y | Date | The date and time of when the record was created in the table. This value should only be populated on insert - it should never be updated. |
| 15 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | The Oracle username of the one who most recently updated this record. |
| 16 | LAST_UPDATE_DATETIME |  |  | Y | Date | The date time stamp of the most recent update by the user. |

---

## Table: KEY_MAP_GL

**Description:** This table contains the reference key details of the GL records that are written to stg_fif_gl_data. So this new table will be used to map the records in the TRAN_DATA_HISTORY with the reference key values send by financial application system like PSFT for drill back reports.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | REFERENCE_TRACE_ID | P |  | Y | VARCHAR (32) | This field will hold the unique Reference trace id used for drill back/forward and traceability purposes |
| 2 | REFERENCE_TRACE_TYPE |  |  | Y | VARCHAR (32) | This field will store Reference trace type information used for drill back purposes. |
| 3 | IFTD_ROWID |  |  |  | ROWID | This field contains the row id of each record from IF_TRAN_DATA table which is used to drill back the records processed by fifgldn1.pc batch program. |
| 4 | ITEM |  |  |  | VARCHAR (25) | This field will hold the item number. |
| 5 | DEPT |  |  |  | NUMERIC (4) | This field will hold the dept number. |
| 6 | CLASS |  |  |  | NUMERIC (4) | This field will hold the class number. |
| 7 | SUBCLASS |  |  |  | NUMERIC (4) | This field will hold the subclass number. |
| 8 | PROCESSED_DATE |  |  | Y | Date | This field will hold the transaction date for records processed by fifgldn1 or the post date if processed by other financial download batch. |
| 9 | TRAN_CODE |  |  |  | NUMERIC (4) | This filed will hold the transaction code. |
| 10 | LOCATION |  |  |  | NUMERIC (10) | This field will hold the location number (store/wh). |
| 11 | LOC_TYPE |  |  |  | VARCHAR (1) | This field will hold the type of the location (either Store or Warehouse). |
| 12 | DEAL_NO |  |  |  | NUMERIC (10) | This field will hold the deal_no of the fixed deal record stored in the FIXED_DEAL table. |
| 13 | GL_REF_NO |  |  |  | VARCHAR (25) | COMMENT ON COLUMN KEY_MAP_GL.GL_REF_NO is 'This field contains the reference number associated with a transaction. It is used for defining the General Ledger account relationship along with dept, class, subclass, location, and tran_code, etc. For example: if tran_code is 22 or 23, then this field contains an Inventory Adjustment Reason Code; if tran_code is 37 or 38, then this field contains From_loc or To_loc for the Intercompany Transfer; if tran_code is 63 or 64, then this field contains Work Order Activity ID; if tran_code is 87 or 88, then this field contains the VAT code associated with the transaction.' |
| 14 | COST_RETAIL_FLAG |  |  |  | VARCHAR (25) | Contains the cost or retail value of the transaction. |
| 15 | PGM_NAME |  |  |  | VARCHAR (100) | Identifies the Oracle Retail module where the record was written. |

---

## Table: OTB

**Description:** This table contains open-to-buy budgets and actuals by period.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEPT | P | F | Y | NUMERIC (4) | Contains the department number for the Open To Buy budget. |
| 2 | CLASS | P | F | Y | NUMERIC (4) | Contains the class number for the Open To Buy budget. |
| 3 | SUBCLASS | P | F | Y | NUMERIC (4) | Contains the subclass number for the Open To Buy budget. |
| 4 | EOW_DATE | P |  | Y | Date | Contains the last day of the week the Open To Buy budget. |
| 5 | WEEK_NO |  |  | Y | NUMERIC (2) | Contains the number of the 4-5-4 week that the Open To Buy budget covers. The number will range from 1 to 5. |
| 6 | MONTH_NO |  |  | Y | NUMERIC (2) | Contains the number of the month-in-half that the Open To Buy budget covers. The number will range from 1 to 6. |
| 7 | HALF_NO |  | F | Y | NUMERIC (5) | Contains the half number that the Open to Buy budget covers. |
| 8 | CANCEL_AMT |  |  | Y | NUMERIC (20,4) | Contains the total amount of the orders that were cancelled during this OTB period for the subclass in the period. This field is stored in the primary currency. |
| 9 | N_BUDGET_AMT |  |  | Y | NUMERIC (20,4) | Contains the total Open to Buy budget amount for non-replenishment orders (N/B type orders) for that subclass in the period. This field is stored in the primary currency. |
| 10 | N_APPROVED_AMT |  |  | Y | NUMERIC (20,4) | Contains the total approved amount for non-replenishment orders for the subclass in the period. This field is stored in the primary currency. |
| 11 | N_RECEIPTS_AMT |  |  | Y | NUMERIC (20,4) | Total receipts against non-replenishment orders due for the subclass in the specified period. This field is stored in the primary currency. |
| 12 | B_BUDGET_AMT |  |  | Y | NUMERIC (20,4) | Contains the total Open to Buy budget amount for system-generated replenishment with buyer approval orders (BRB type orders) for that subclass in the period. This field is stored in the primary currency. |
| 13 | B_APPROVED_AMT |  |  | Y | NUMERIC (20,4) | Contains the total approved amount for system-generated replenishment (with buyer approval) orders for the subclass in the period. This field is stored in the primary currency. |
| 14 | B_RECEIPTS_AMT |  |  | Y | NUMERIC (20,4) | Total receipts against system-generated replenishment (with buyer approval) orders due for the subclass in the specified period. This field is stored in the primary currency. |
| 15 | A_BUDGET_AMT |  |  | Y | NUMERIC (20,4) | Contains the total Open to Buy budget amount for automatic replenishment orders (ARB type orders) for that subclass in the period. This field is stored in the primary currency. |
| 16 | A_APPROVED_AMT |  |  | Y | NUMERIC (20,4) | Contains the total approved amount for automatic replenishment orders for the subclass in the period. This field is stored in the primary currency. |
| 17 | A_RECEIPTS_AMT |  |  | Y | NUMERIC (20,4) | Total receipts against automatic replenishment orders due for the subclass in the specified period. This field is stored in the primary currency. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_OTB|PK||||DEPT|ASC|
||||||CLASS|ASC|
||||||SUBCLASS|ASC|
||||||EOW_DATE|ASC|
|OTB_I2|||||HALF_NO|ASC|
|OTB_I1|||||DEPT|ASC|
||||||CLASS|ASC|
||||||SUBCLASS|ASC|
||||||WEEK_NO|ASC|
||||||MONTH_NO|ASC|
||||||HALF_NO|ASC|

### Constraints

|Type|Column / Constraint<br>Name|Details|
|---|---|---|
|Table Level|CHK_OTB_MONTH_NO|MONTH_NO BETWEEN 1 AND 6<br>|
||CHK_OTB_WEEK_NO|WEEK_NO BETWEEN 1 AND 5<br>|
|Column Level|WEEK_NO||
||MONTH_NO||

---

## Table: OTB_CASCADE_STG

**Description:** This is a staging table that is used to post the OTB updates after the mass update of the expenses and assessments on the order.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEPT |  |  | Y | NUMERIC (4) | Contains the department number for the Open To Buy budget defnition. |
| 2 | CLASS |  |  | Y | NUMERIC (4) | Contains the class number for the Open To Buy budget defnition. |
| 3 | SUBCLASS |  |  | Y | NUMERIC (4) | Contains the subclass number for the Open To Buy budget defnition. |
| 4 | EOW_DATE |  |  | Y | Date | The end of week date of the OTB budget. |
| 5 | B_APPROVED_AMT |  |  | Y | NUMERIC (20,4) | Contains the total approved amount for system generated orders for the subclass in the period. This value is stored in the primary currency. |
| 6 | A_APPROVED_AMT |  |  | Y | NUMERIC (20,4) | Contains the total approved amount for auto replenishment orders for the subclass in the period. This value is stored in the primary currency. |
| 7 | N_APPROVED_AMT |  |  | Y | NUMERIC (20,4) | Contains the total approved amount for non-replenishment orders for the subclass in the period. This value is stored in the primary currency. |

---

## Table: RDW_DELETE_ITEM

**Description:** This table is populated by a trigger on the DAILY_PURGE table to capture items deleted from RMS for integration to Retail Analytics.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  |  | Y | VARCHAR (50) | This field contains the items that have been deleted in RMS. |

---

## Table: RDW_RECLASS

**Description:** This table is populated by table triggers in RMS to capture reclassifications of a group moving to a new division or a department moving to a new group for integration to Retail Analytics.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | IDNT | P |  | Y | NUMERIC (16) | This field contains the number which uniquely identifies a department or a group. |
| 2 | TABLE_NAME | P |  | Y | VARCHAR (30) | This field contains the table name that corresponds to the idnt. Valid values are DEPS and GROUPS. |

---

## Table: SALWEEK_C_DAILY

**Description:** Prepost writes to salweek_c_daily and salweek reads it

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEPT |  |  | Y | NUMERIC (4) | The department of the daily summary row |
| 2 | CLASS |  |  | Y | NUMERIC (4) | The class of the daily summary row |
| 3 | SUBCLASS |  |  | Y | NUMERIC (4) | The subclass of the daily summary row |
| 4 | LOC_TYPE |  |  |  | VARCHAR (1) | This field contains Location Type. |
| 5 | LOCATION |  |  |  | NUMERIC (10) | Contains the location ID. |
| 6 | CURRENCY_IND |  |  | Y | VARCHAR (1) | The currency indicator of the daily summary row |
| 7 | EOW_DATE |  |  |  | VARCHAR (8) | The end-of-week date of the daily summary row |
| 8 | SET_OF_BOOKS_ID |  |  | Y | NUMERIC (15) | Set Of Books Id |
| 9 | PURCH_COST |  |  |  | NUMERIC (20,4) | The total cost of purchases of the daily summary row |
| 10 | PURCH_RETAIL |  |  |  | NUMERIC (20,4) | The total retail of purchases of the daily summary row |
| 11 | RTV_COST |  |  |  | NUMERIC (20,4) | The total return-to-vendor cost of the daily summary row |
| 12 | RTV_RETAIL |  |  |  | NUMERIC (20,4) | The total return-to-vendor retail of the daily summary row |
| 13 | FREIGHT_COST |  |  |  | NUMERIC (20,4) | The total freight cost of the daily summary row |
| 14 | MARKUP_RETAIL |  |  |  | NUMERIC (20,4) | Markups (upward revisions of original prices)The total return-to-vendor cost of the daily summary row |
| 15 | MARKUP_CAN_RETAIL |  |  |  | NUMERIC (20,4) | Markup cancellationsThe total return-to-vendor cost of the daily summary row |
| 16 | NET_SALES_COST |  |  |  | NUMERIC (20,4) | Cost of net merchandise sold of the daily summary row |
| 17 | NET_SALES_RETAIL |  |  |  | NUMERIC (20,4) | Retail of net merchandise sold of the daily summary row |
| 18 | NET_SALES_RETAIL_EX_VAT |  |  |  | NUMERIC (20,4) | Retail of net merchandise, excluding VAT,Cost of net merchandise sold of the daily summary row |
| 19 | RETURNS_COST |  |  |  | NUMERIC (20,4) | Cost of returns of the daily summary row |
| 20 | RETURNS_RETAIL |  |  |  | NUMERIC (20,4) | Retail of returns of the daily summary row |
| 21 | PERM_MARKDOWN_RETAIL |  |  |  | NUMERIC (20,4) | Permanent retail markdown of the daily summary row |
| 22 | PROM_MARKDOWN_RETAIL |  |  |  | NUMERIC (20,4) | Promotional retail markdown of the daily summary row |
| 23 | CLEAR_MARKDOWN_RETAIL |  |  |  | NUMERIC (20,4) | Clearance retail markdown of the daily summary row |
| 24 | MARKDOWN_CAN_RETAIL |  |  |  | NUMERIC (20,4) | Markdown retail cancellations of the daily summary row |
| 25 | UP_CHRG_AMT_PROFIT |  |  |  | NUMERIC (20,4) | Contains the value of Profit Up Charge cost incurred by the location/subclass for th week. |
| 26 | UP_CHRG_AMT_EXP |  |  |  | NUMERIC (20,4) | Contains the value of Expense Up Charge costs incurred by the location/subcalss for the week. |
| 27 | TSF_IN_RETAIL |  |  |  | NUMERIC (20,4) | Retail of merchandise transferred in of the daily summary row |
| 28 | TSF_IN_COST |  |  |  | NUMERIC (20,4) | Cost of merchandise transferred into a location of the daily summary row |
| 29 | TSF_IN_BOOK_RETAIL |  |  |  | NUMERIC (20,4) | Retail of merchandise book transferred in of the daily summary row |
| 30 | TSF_IN_BOOK_COST |  |  |  | NUMERIC (20,4) | Cost of merchandise book transferred in of the daily summary row |
| 31 | TSF_OUT_RETAIL |  |  |  | NUMERIC (20,4) | Retail of merchandise transferred out of the daily summary row |
| 32 | TSF_OUT_COST |  |  |  | NUMERIC (20,4) | Cost of merchandise transferred out of the daily summary row |
| 33 | TSF_OUT_BOOK_RETAIL |  |  |  | NUMERIC (20,4) | Retail of merchandise book transferred out of the daily summary row |
| 34 | TSF_OUT_BOOK_COST |  |  |  | NUMERIC (20,4) | Cost of merchandise book transferred out of the daily summary row |
| 35 | RECLASS_IN_RETAIL |  |  |  | NUMERIC (20,4) | Retail of merchandise reclassified in of the daily summary row |
| 36 | RECLASS_IN_COST |  |  |  | NUMERIC (20,4) | Cost of merchandise reclassified in of the daily summary row |
| 37 | RECLASS_OUT_COST |  |  |  | NUMERIC (20,4) | Cost of merchandise reclassified out of the daily summary row |
| 38 | RECLASS_OUT_RETAIL |  |  |  | NUMERIC (20,4) | Retail of merchandise reclassified out of the daily summary row |
| 39 | STOCK_ADJ_RETAIL |  |  |  | NUMERIC (20,4) | Stock on hand adjustment retail of the daily summary row |
| 40 | STOCK_ADJ_COST |  |  |  | NUMERIC (20,4) | Stock on hand adjustment cost of the daily summary row |
| 41 | STOCK_ADJ_COGS_RETAIL |  |  |  | NUMERIC (20,4) | Amount at retail of Stock Adjustment that affects COGS for a subclass/location for the week. |
| 42 | STOCK_ADJ_COGS_COST |  |  |  | NUMERIC (20,4) | Amount at cost of Stock Adjusment that affects the COGS for the location/subclass for the week. |
| 43 | EMPL_DISC_RETAIL |  |  |  | NUMERIC (20,4) | Employee discount retail of the daily summary row |
| 44 | FREIGHT_CLAIM_RETAIL |  |  |  | NUMERIC (20,4) | Amount at cost of freight claim for a subclass/location for the week. |
| 45 | FREIGHT_CLAIM_COST |  |  |  | NUMERIC (20,4) | Amount at retail of freight claim for a subclass/location for the week. |
| 46 | INTERCOMPANY_IN_RETAIL |  |  |  | NUMERIC (20,4) | Contains the dollar values at retail of merchandise transferred into a locaiton/subclass during a week for intercompany transfers. |
| 47 | INTERCOMPANY_IN_COST |  |  |  | NUMERIC (20,4) | Contains the dollar values at cost of merchandise transferred into a locaiton/subclass during a week for intercompany transfers. |
| 48 | INTERCOMPANY_OUT_RETAIL |  |  |  | NUMERIC (20,4) | Contains the dollar values at retail of merchandise transferred out of a locaiton/subclass during a week for intercompany transfers. |
| 49 | INTERCOMPANY_OUT_COST |  |  |  | NUMERIC (20,4) | Contains the dollar values at cost of merchandise transferred out of a locaiton/subclass during a week for intercompany transfers. |
| 50 | INTERCOMPANY_MARKUP |  |  |  | NUMERIC (20,4) | Contains the sum of markup at retail of merchandise transferred out of a location/subclass during a week for intercompany transfers. |
| 51 | INTERCOMPANY_MARKDOWN |  |  |  | NUMERIC (20,4) | Contains the sum of markdown at retail of merchandise transferred out of a location/subclass during a week for intercompany transfers. |
| 52 | WO_ACTIVITY_UPD_INV |  |  |  | NUMERIC (20,4) | Contains the sum of dollar value at cost of merchandise required work order-activity-update inventory in a location/subclass during a week for intercompany transfers. |
| 53 | WO_ACTIVITY_POST_FIN |  |  |  | NUMERIC (20,4) | Contains the sum of dollar value at cost of merchandise required work order-activity-post to financial in a location/subclass during a week for intercompany transfers. |
| 54 | DEAL_INCOME_SALES |  |  |  | NUMERIC (20,4) | Sum in dollar values of deal incomes purchases received for a subclass/location for the week. |
| 55 | DEAL_INCOME_PURCH |  |  |  | NUMERIC (20,4) | Sum in dollar values of deal incomes purchases received for a subclass/location for the week. |
| 56 | RESTOCKING_FEE |  |  |  | NUMERIC (20,4) | Sum in dollar values at cost of restocking fees received for a subclass/location for the week. |
| 57 | RETAIL_COST_VARIANCE |  |  |  | NUMERIC (20,4) | Cost variance using retail based accounting. |
| 58 | MARGIN_COST_VARIANCE |  |  |  | NUMERIC (20,4) | New Cost variance using cost based accounting. |
| 59 | CASH_DISC_AMT |  |  |  | NUMERIC (20,4) | Cash discount amount of the daily summary row |
| 60 | WORKROOM_AMT |  |  |  | NUMERIC (20,4) | Workroom amount of the daily summary row |
| 61 | SALES_UNITS |  |  |  | NUMERIC (20,4) | Number of units of the daily summary row |
| 62 | COST_VARIANCE_AMT |  |  |  | NUMERIC (20,4) | Standard cost change of the daily summary row |
| 63 | FRANCHISE_SALES_RETAIL |  |  |  | NUMERIC (20,4) | Amount at retail of merchandise sold to franchisees at the subclass / franchise location for the week |
| 64 | FRANCHISE_SALES_COST |  |  |  | NUMERIC (20,4) | Amount at cost of merchandise to franchisees sold at the subclass / franchise location for the week |
| 65 | FRANCHISE_RETURNS_RETAIL |  |  |  | NUMERIC (20,4) | Amount at retail of merchandise returned by franchisees at the subclass / franchise location for the week |
| 66 | FRANCHISE_RETURNS_COST |  |  |  | NUMERIC (20,4) | Amount at cost of merchandise returned by franchisees at the subclass / franchise location for the week |
| 67 | FRANCHISE_MARKUP_RETAIL |  |  |  | NUMERIC (20,4) | Contains the sum of markups at retail of merchandise at franchise location / subclass for the week. |
| 68 | FRANCHISE_MARKDOWN_RETAIL |  |  |  | NUMERIC (20,4) | Contains the sum of markdowns at retail of merchandise at franchise location / subclass for the week. |
| 69 | FRANCHISE_RESTOCKING_FEE |  |  |  | NUMERIC (20,4) | Amount at cost of restocking fees received for a franchise location / subclass for the week |
| 70 | VAT_IN |  |  |  | NUMERIC (20,4) | Input VAT |
| 71 | VAT_OUT |  |  |  | NUMERIC (20,4) | Output VAT |
| 72 | WEIGHT_VARIANCE_RETAIL |  |  |  | NUMERIC (20,4) | This will contain the weight variance retail for catchweight items. |
| 73 | RECOVERABLE_TAX |  |  |  | NUMERIC (20,4) | This column will hold the consolidated value of the tax amount which can be recovered. |
| 74 | NET_SALES_NON_INV_RETAIL |  |  |  | NUMERIC (20,4) | Dollar values at retail of non-inventory item sold for a subclass/location for the day. |
| 75 | NET_SALES_NON_INV_RTL_EX_VAT |  |  |  | NUMERIC (20,4) | Dollar values at retail (excluding VAT) of non-inventory item sold for a subclass/location for the day. |
| 76 | NET_SALES_NON_INV_COST |  |  |  | NUMERIC (20,4) | Dollar values at cost of non-inventory item sold for a subclass/location for the day. |
| 77 | REC_COST_ADJ_VARIANCE |  |  |  | NUMERIC (20,4) | Dollar value for the receiver cost adjustment variance. |

---

## Table: SALWEEK_C_WEEK

**Description:** This is a temporary table created by prepost and used by salweek

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEPT |  |  | Y | NUMERIC (4) | The department number of the weekly stock ledger summary row |
| 2 | CLASS |  |  | Y | NUMERIC (4) | The class number of the weekly stock ledger summary row |
| 3 | SUBCLASS |  |  | Y | NUMERIC (4) | The subclass number of the weekly stock ledger summary row |
| 4 | LOC_TYPE |  |  | Y | VARCHAR (1) | Contains location type. |
| 5 | LOCATION |  |  | Y | NUMERIC (10) | Contains the Location ID. |
| 6 | HALF_NO |  |  | Y | NUMERIC (5) | The calendar half number of the weekly stock ledger summary row |
| 7 | WEEK_NO |  |  | Y | NUMERIC (2) | The calendar week number of the weekly stock ledger summary row |
| 8 | CURRENCY_IND |  |  | Y | VARCHAR (1) | the currency indicator of the weekly stock ledger summary row |
| 9 | SET_OF_BOOKS_ID |  |  | Y | NUMERIC (15) | Set Of Books Id |
| 10 | EOW_DATE |  |  | Y | VARCHAR (8) | The calendar end-of-week date of the weekly stock ledger summary row |
| 11 | EOW_PLUS_7_DD |  |  |  | NUMERIC (2) | The calendar end-of-week plus 7 day component of the weekly stock ledger summary row |
| 12 | EOW_PLUS_7_MM |  |  |  | NUMERIC (2) | The calendar end-of-week plus 7 month component of the weekly stock ledger summary row |
| 13 | EOW_PLUS_7_YYYY |  |  |  | NUMERIC (4) | The calendar end-of-week plus 7 year component of the weekly stock ledger summary row |
| 14 | EOW_PLUS_7_YYYYMMDD |  |  |  | VARCHAR (8) | The calendar end-of-week plus 7 entire date component of the weekly stock ledger summary row |
| 15 | STOCKTAKE_ADJ_RETAIL |  |  |  | NUMERIC (20,4) | Adjusted stock dollar amount at retail of the weekly stock ledger summary row |
| 16 | STOCKTAKE_ADJ_COST |  |  |  | NUMERIC (20,4) | Adjusted stock dollar amount at cost of the weekly stock ledger summary row |
| 17 | OPN_STK_RETAIL |  |  |  | NUMERIC (20,4) | Beginning of week stock on hand dollar value at retail of the weekly stock ledger summary row |
| 18 | OPN_STK_COST |  |  |  | NUMERIC (20,4) | Beginning of week stock on hand dollar value at cost of the weekly stock ledger summary row |
| 19 | CURRENCY_RETAIL |  |  |  | NUMERIC (20,4) | The calculated retail values of the weekly stock ledger summary row |
| 20 | CURRENCY_COST |  |  |  | NUMERIC (20,4) | The calculated cost values of the weekly stock ledger summary row |
| 21 | CUM_MARKON_PCT |  |  |  | VARCHAR (40) | The cumulative markon percent of the weekly stock ledger summary row |
| 22 | WD_ROWID |  |  |  | VARCHAR (18) | The rowid of the WEEK_DATA row associated with this summary row |

---

## Table: SALWEEK_RESTART_DEPT

**Description:** Prepost populates this table and salweek reads it. Its purpose is to help balance the work of all threads in salweek and thus avoid thread skew.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEPT | P |  | Y | NUMERIC (4) | Unique department |
| 2 | THREAD_VAL |  |  |  | NUMERIC (4) | Thread the department is assigned to |
| 3 | ROW_COUNT |  |  | Y | NUMERIC (20) | Number of rows in SALWEEK_C_WEEK for this department |

---

## Table: STG_FIF_GL_DATA

**Description:** This table will hold all the Stock Ledger information for RMS and Total ID information for ReSA to be sent across to Financial General Ledger.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SET_OF_BOOKS_ID |  |  |  | NUMERIC (15) | This denotes the accounting books for an organization. |
| 2 | ACCOUNTING_DATE |  |  |  | Date | This denotes the effective date of the transaction |
| 3 | CURRENCY_CODE |  |  |  | VARCHAR (15) | This denotes the Currency used for the Financial Information. |
| 4 | STATUS |  |  |  | VARCHAR (50) | This denotes the status of the when there is a Journal Import. Default to New. |
| 5 | DATE_CREATED |  |  |  | Date | This denotes the date when the transaction was done. |
| 6 | CREATED_BY |  |  |  | NUMERIC (15) | This denotes who created the transaction. |
| 7 | ACTUAL_FLAG |  |  |  | VARCHAR (1) | This denotes the Balance type and is default to A. |
| 8 | USER_JE_CATEGORY_NAME |  |  |  | VARCHAR (25) | This denotes the Journal Entry Category User defined name. |
| 9 | USER_JE_SOURCE_NAME |  |  |  | VARCHAR (25) | This denotes the Journal Entry Source User defined name. |
| 10 | CURRENCY_CONVERSION_DATE |  |  |  | Date | This denotes the date of currency exchange rate |
| 11 | CURRENCY_CONVERSION_TYPE |  |  |  | VARCHAR (30) | This denotes the type of currency exchange rate. |
| 12 | ACCT_SEGMENT1 |  |  |  | VARCHAR (25) | This denotes the account segment for the accounting structure. |
| 13 | ACCT_SEGMENT2 |  |  |  | VARCHAR (25) | This denotes the account segment for the accounting structure. |
| 14 | ACCT_SEGMENT3 |  |  |  | VARCHAR (25) | This denotes the account segment for the accounting structure. |
| 15 | ACCT_SEGMENT4 |  |  |  | VARCHAR (25) | This denotes the account segment for the accounting structure. |
| 16 | ACCT_SEGMENT5 |  |  |  | VARCHAR (25) | This denotes the account segment for the accounting structure. |
| 17 | ACCT_SEGMENT6 |  |  |  | VARCHAR (25) | This denotes the account segment for the accounting structure. |
| 18 | ACCT_SEGMENT7 |  |  |  | VARCHAR (25) | This denotes the account segment for the accounting structure. |
| 19 | ACCT_SEGMENT8 |  |  |  | VARCHAR (25) | This denotes the account segment for the accounting structure. |
| 20 | ACCT_SEGMENT9 |  |  |  | VARCHAR (25) | This denotes the account segment for the accounting structure. |
| 21 | ACCT_SEGMENT10 |  |  |  | VARCHAR (25) | This denotes the account segment for the accounting structure. |
| 22 | ENTERED_DR_AMOUNT |  |  |  | NUMERIC (20,4) | This denotes the transaction debit amount. |
| 23 | ENTERED_CR_AMOUNT |  |  |  | NUMERIC (20,4) | This denotes the transaction credit amount. |
| 24 | TRANSACTION_DATE |  |  |  | Date | This denotes the transaction date. |
| 25 | REFERENCE1 |  |  |  | VARCHAR (20) | This denotes the reference description to be used for the column. |
| 26 | REFERENCE2 |  |  |  | VARCHAR (20) | This denotes the reference description to be used for the column. |
| 27 | REFERENCE3 |  |  |  | VARCHAR (20) | This denotes the reference description to be used for the column. |
| 28 | REFERENCE4 |  |  |  | VARCHAR (25) | This denotes the reference description to be used for the column. |
| 29 | REFERENCE5 |  |  |  | VARCHAR (20) | This denotes the reference description to be used for the column. |
| 30 | ATTRIBUTE1 |  |  |  | VARCHAR (20) | This denotes the attribute description to be used for the column. |
| 31 | ATTRIBUTE2 |  |  |  | VARCHAR (20) | This denotes the attribute description to be used for the column. |
| 32 | ATTRIBUTE3 |  |  |  | VARCHAR (20) | This denotes the attribute description to be used for the column. |
| 33 | ATTRIBUTE4 |  |  |  | VARCHAR (20) | This denotes the attribute description to be used for the column. |
| 34 | ATTRIBUTE5 |  |  |  | VARCHAR (20) | This denotes the attribute description to be used for the column. |
| 35 | ATTRIBUTE6 |  |  |  | VARCHAR (20) | This denotes the attribute description to be used for the column. |
| 36 | PERIOD_NAME |  |  |  | VARCHAR (15) | This denotes the accounting period. |
| 37 | CODE_COMBINATION_ID |  |  |  | NUMERIC (15) | This denotes the unique identification of an accounting structure. |
| 38 | PGM_NAME |  |  |  | VARCHAR (100) | Identifies the Oracle Retail module where the record was written. |
| 39 | ACCT_SEGMENT11 |  |  |  | VARCHAR (25) | This field will contain the eleventh account segment information coming from the financial system. |
| 40 | ACCT_SEGMENT12 |  |  |  | VARCHAR (25) | This field will contain the twelfth account segment information coming from the financial system. |
| 41 | ACCT_SEGMENT13 |  |  |  | VARCHAR (25) | This field will contain the thirteenth account segment information coming from the financial system. |
| 42 | ACCT_SEGMENT14 |  |  |  | VARCHAR (25) | This field will contain the fourteenth account segment information coming from the financial system. |
| 43 | ACCT_SEGMENT15 |  |  |  | VARCHAR (25) | This field will contain the fifteenth account segment information coming from the financial system. |
| 44 | ACCT_SEGMENT16 |  |  |  | VARCHAR (25) | This field will contain the sixteenth account segment information coming from the financial system. |
| 45 | ACCT_SEGMENT17 |  |  |  | VARCHAR (25) | This field will contain the seventeenth account segment information coming from the financial system. |
| 46 | ACCT_SEGMENT18 |  |  |  | VARCHAR (25) | This field will contain the eighteenth account segment information coming from the financial system. |
| 47 | ACCT_SEGMENT19 |  |  |  | VARCHAR (25) | This field will contain the nineteenth account segment information coming from the financial system. |
| 48 | ACCT_SEGMENT20 |  |  |  | VARCHAR (25) | This field will contain the twentieth account segment information coming from the financial system. |
| 49 | REFERENCE_TRACE_ID |  |  |  | VARCHAR (32) | This field will contain the reference key which needs for drilling back the reference data from RMS/ReSA. |
| 50 | PRIM_CURRENCY_CODE |  |  |  | VARCHAR (15) | This field will contain the base or primary currency code of the RMS System. |
| 51 | PRIM_ENTERED_DR_AMOUNT |  |  |  | NUMERIC (20,4) | This field will contain the Debit amount value for that particular record in primary currency. |
| 52 | PRIM_ENTERED_CR_AMOUNT |  |  |  | NUMERIC (20,4) | This field will contain the Credit amount value for that particular record in primary currency. |
| 53 | FIN_GL_SEQ_ID |  |  |  | NUMERIC (15) | Contains the Seqence from GL |
| 54 | PROCESSED_FLAG |  |  |  | VARCHAR (1) | Indicates if the record is processed |

---

## Table: STK_FILE_STG

**Description:** This table will hold ITEM_MASTER information based on the items from the stkupld file.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM | P |  | Y | VARCHAR (25) | Contains the item value from the upload file |
| 2 | ITEM_TYPE |  |  |  | VARCHAR (3) | Contains the item type |
| 3 | DEPT |  |  |  | NUMERIC (4) | Contains the department information from the item_master table |
| 4 | CLASS |  |  |  | NUMERIC (4) | Contains the class information from the item_master table |
| 5 | SUBCLASS |  |  |  | NUMERIC (4) | Contains the subclass information from the item_master table |
| 6 | ITEM_LEVEL |  |  |  | NUMERIC (1) | Contains the item level information for the item |
| 7 | TRAN_LEVEL |  |  |  | NUMERIC (1) | Contains the transaction level information for the item |
| 8 | STATUS |  |  |  | VARCHAR (1) | Contains the status information of the item |
| 9 | PACK_IND |  |  |  | VARCHAR (1) | Indicates if the item is a pack |
| 10 | SIMPLE_PACK_IND |  |  |  | VARCHAR (1) | Indicates if the pack item is a simple pack |
| 11 | ITEM_XFORM_IND |  |  |  | VARCHAR (1) | Indicates if the item is a transformation item |
| 12 | SELLABLE_IND |  |  |  | VARCHAR (1) | Indicates if the item is sellable |
| 13 | ORDERABLE_IND |  |  |  | VARCHAR (1) | Indicates if the item is orderable |
| 14 | INVENTORY_IND |  |  |  | VARCHAR (1) | Indicates if the item is an inventory item |
| 15 | LOC_DESC |  |  |  | VARCHAR (150) | Contains the location description from the upload file |

---

## Table: STK_SSL_TEMP

**Description:** This table will hold stock count information based on the items in the STK_FILE_STG table

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  |  |  | VARCHAR (25) | Contains the item in stock count |
| 2 | LOCATION |  |  |  | NUMERIC (10) | Contains the location from the upload file or the stockholding warehouses of the physical warehouse on the upload file for multichannel processing |
| 3 | SNAPSHOT_ON_HAND_QTY |  |  |  | NUMERIC (20,4) | Contains the items snapshot on hand from the stake_sku_loc table |
| 4 | SUM_SNAP_ON_HAND |  |  |  | NUMERIC (20,4) | Contains the sum of the items snapshot on hand across all the stockholding warehouses |
| 5 | PROCESSED |  |  |  | VARCHAR (1) | Indicates if the item is processed for the location |
| 6 | XFORM_ITEM_TYPE |  |  |  | VARCHAR (1) | Indicates the item tranforamation type |
| 7 | QTY |  |  |  | NUMERIC (20,4) | Contains the quantity from the stake_qty table |
| 8 | LOCATION_DESC |  |  |  | VARCHAR (150) | Contains the location description from the upload file |

---

## Table: STK_XFORM_ORD_TEMP

**Description:** This table will contain missing orderable tranformation items associated to the sellable items under stock count

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DETAIL_ITEM |  |  |  | VARCHAR (25) | Contains the detail item under the stock count |
| 2 | HEAD_ITEM |  |  |  | VARCHAR (25) | Contains the missing head item associated to the detail item |

---

## Table: STK_XFORM_TEMP

**Description:** This table will hold transformation item information based on the items in the STK_FILE_STG table

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DETAIL_ITEM | P |  | Y | VARCHAR (25) | Contains the detail item from the item_xform_detail table |
| 2 | YIELD_FROM_HEAD_ITEM_PCT |  |  |  | NUMERIC (12,4) | Contains the percentage yield information of the detail item from the header items associated with it |
| 3 | LOC_DESC |  |  |  | VARCHAR (150) | Contains the location description from the upload file |
| 4 | HEAD_ITEM | P |  | Y | VARCHAR (25) | Contains the head item associated to the detail item |
| 5 | DEPT |  |  |  | NUMERIC (4) | Contains the head items department information |
| 6 | CLASS |  |  |  | NUMERIC (4) | Contains the head items class information |
| 7 | SUBCLASS |  |  |  | NUMERIC (4) | Contains the head items subclass information |
| 8 | ITEM_LEVEL |  |  |  | VARCHAR (1) | Contains the head items item level information |
| 9 | TRAN_LEVEL |  |  |  | VARCHAR (1) | Contains the head items tran level information |

---

## Table: WFSLSUPLD_ROLLUP

**Description:** This table holds the non-stockholding franchise store sales information which has been rolled up (i.e. summed up) to a specific customer location/report date/item combination.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | CHUNK_ID |  |  |  | NUMERIC (10) | This column holds the chunk number that a record belongs to. Records inserted in this table are chunked up to break them down into more manageable blocks of information. |
| 2 | CUSTOMER_LOC |  |  |  | NUMERIC (10) | Franchise store for which the sales pertain. |
| 3 | REPORT_DATE |  |  |  | Date | Date on which the extract was sent. |
| 4 | ITEM |  |  |  | VARCHAR (25) | Item sold at the franchise store. |
| 5 | NET_SALES_QTY |  |  |  | NUMERIC (12,4) | Net sales quantity for the item/store since last time sales were extracted. |
| 6 | NET_SALES_QTY_UOM |  |  |  | VARCHAR (4) | Contains the unit of measure for the net sales quantity. |
| 7 | TOTAL_RETAIL_AMT |  |  |  | NUMERIC (20,4) | Extended retail value of the net sales since the last time sales were extracted |
| 8 | TOTAL_RETAIL_AMT_CURR |  |  |  | VARCHAR (3) | This field contains the currency code for the Total Retail Amount value. |

---

## Table: WFSLSUPLD_STAGING

**Description:** This table holds the raw file detail data read in from the non-stockholding franchise store sales file.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | FILE_RECORD_DESCRIPTOR |  |  |  | VARCHAR (5) | This column contains the file record identifier (i.e. FDETL). |
| 2 | CHUNK_ID |  |  |  | NUMERIC (10) | This column holds the chunk number that the record belongs to. Records in this table are chunked-up to break them down into more manageable blocks of information. |
| 3 | CUSTOMER_LOC |  |  |  | NUMERIC (10) | Franchise store for which the sales in the file pertain. |
| 4 | REPORT_DATE |  |  |  | Date | Date on which the extract was sent. |
| 5 | ITEM |  |  |  | VARCHAR (25) | Item sold at the franchise store. |
| 6 | NET_SALES_QTY |  |  |  | NUMERIC (12,4) | Net sales quantity for the item/store since the last time sales were extracted. |
| 7 | NET_SALES_QTY_UOM |  |  |  | VARCHAR (4) | Contains the unit of measure for the net sales quantity. |
| 8 | TOTAL_RETAIL_AMT |  |  |  | NUMERIC (20,4) | Extended retail value of the net sales since the last time sales were extracted. |
| 9 | TOTAL_RETAIL_AMT_CURR |  |  |  | VARCHAR (3) | This column contains the currency code for the Total Retail Amount value. |
| 10 | ERROR_MSG |  |  |  | VARCHAR (255) | This column will contain the error message associated with the record. Any information that does not pass validation will have values in this column. |

---

## Table: WF_BILLING_RETURNS

**Description:** This is a staging table to capture billing information when franchise returns are received.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | CUSTOMER_LOC |  | F | Y | NUMERIC (10) | This field holds the Franchise location number. |
| 2 | CUST_ORD_REF_NO |  |  |  | VARCHAR (20) | This field holds the customer order reference number of the Franchise order number against which, the item is returned. |
| 3 | WF_ORDER_NO |  | F | Y | NUMERIC (10) | This field holds the franchise order number against which, the item is returned. |
| 4 | RMA_NO |  | F | Y | NUMERIC (10) | This field holds the RMA number of the return. |
| 5 | RETURN_DATE |  |  | Y | Date | The date on which the item was received or destroyed on site. |
| 6 | ITEM |  | F | Y | VARCHAR (25) | This field has the item that was returned. |
| 7 | DEPT |  | F | Y | NUMERIC (4) | This field holds the department of the item that is returned. |
| 8 | CLASS |  | F | Y | NUMERIC (4) | This field holds the class of the item that is returned. |
| 9 | SUBCLASS |  | F | Y | NUMERIC (4) | This field holds the subclass of the item that is returned. |
| 10 | RETURNED_QTY |  |  | Y | NUMERIC (12,4) | The quantity that was returned or destroyed on site. |
| 11 | RETURN_UNIT_COST |  |  |  | NUMERIC (20,4) | The unit cost at which the item is returned. This unit cost is VAT exclusive. |
| 12 | RESTOCKING_FEE |  |  |  | NUMERIC (20,4) | This field holds the unit restocking fee charged for the received items. |
| 13 | VAT_CODE |  | F |  | VARCHAR (6) | This field holds the retail vat code of the returned item at the company location the item is returned to. |
| 14 | VAT_RATE |  |  |  | NUMERIC (20,10) | The vat rate associated with the vat code. |
| 15 | EXTRACTED_IND |  |  | Y | VARCHAR (1) | This indicator is Yes if the row has been extracted to the external billing system, otherwise its No. |
| 16 | EXTRACTED_DATE |  |  |  | Date | This field holds the date when the row was extracred to the external billing table. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|WF_BILLING_RETURNS_I3|||||CUSTOMER_LOC|ASC|
|WF_BILLING_RETURNS_I2|||||DEPT|ASC|
||||||CLASS|ASC|
||||||SUBCLASS|ASC|
|WF_BILLING_RETURNS_I4|||||VAT_CODE|ASC|
|WF_BILLING_RETURNS_I1|||||ITEM|ASC|
|WF_BILLING_RETURNS_I5|||||WF_ORDER_NO|ASC|
|WF_BILLING_RETURNS_I6|||||RMA_NO|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_WF_BILL_RET_EXTRACTED_IND|extracted_ind in ('Y','N')<br>|
|Column Level|EXTRACTED_IND||

---

## Table: WF_BILLING_SALES

**Description:** This is a staging table to capture billing information when franchise orders are shipped.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | CUSTOMER_LOC |  | F | Y | NUMERIC (10) | This field holds franchisees location number. This is the location where the items have been shipped. |
| 2 | CUST_ORD_REF_NO |  |  |  | VARCHAR (20) | This is a reference number that would be provided by the franchisee for their tracking purposes. |
| 3 | WF_ORDER_NO |  | F | Y | NUMERIC (10) | This holds the Franchise Order number. |
| 4 | ORDER_DATE |  |  | Y | Date | This holds the date on which the order was created. |
| 5 | SHIPMENT_DATE |  |  | Y | Date | This field holds the date on which the item was shipped to the franchise location. |
| 6 | ITEM |  | F | Y | VARCHAR (25) | The item which is shipped to the franchise location. |
| 7 | DEPT |  | F | Y | NUMERIC (4) | This field has the department of the items that was shipped. |
| 8 | CLASS |  | F | Y | NUMERIC (4) | This field has the class of the items that was shipped. |
| 9 | SUBCLASS |  | F | Y | NUMERIC (4) | This field has the subclass of the items that was shipped. |
| 10 | ORDER_QTY |  |  |  | NUMERIC (12,4) | The field contains the total number of items ordered for the franchise location. |
| 11 | CUSTOMER_COST |  |  |  | NUMERIC (20,4) | The cost at which the item was sold to the franchise location. This cost is VAT exclusive. |
| 12 | FREIGHT_COST |  |  |  | NUMERIC (20,4) | This field contains the freight associated with the franchise order for each ordered unit. It is the total freight for the entire franchise order on wf_order_head divided by the total requested_qty on wf_order_detail. |
| 13 | VAT_CODE |  | F |  | VARCHAR (6) | This field holds the retail vat code of the item at the franchise order source location. In case of a franchise order sourced from a supplier, the costing location of the franchise location is used. |
| 14 | VAT_RATE |  |  |  | NUMERIC (20,10) | This field has the vat rate associated with the vat code. |
| 15 | EXTRACTED_IND |  |  | Y | VARCHAR (1) | This indicator is Yes if the row has been extracted to the external billing system, otherwise its No. |
| 16 | EXTRACTED_DATE |  |  |  | Date | This field holds the date when the row was extracred to the external billing table. |
| 17 | OTHER_CHARGES |  |  |  | NUMERIC (20,4) | This field contains the charges associated with the franchise order for each ordered unit. It is the total charge for the entire franchise order on wf_order_head divided by the total requested_qty on wf_order_detail. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|WF_BILLING_SALES_I1|||||ITEM|ASC|
|WF_BILLING_SALES_I3|||||CUSTOMER_LOC|ASC|
|WF_BILLING_SALES_I2|||||DEPT|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
||||||CLASS|ASC|
||||||SUBCLASS|ASC|
|WF_BILLING_SALES_I4|||||VAT_CODE|ASC|
|WF_BILLING_SALES_I5|||||WF_ORDER_NO|ASC|

### Constraints

|Type|Column / Constraint<br>Name|Details|
|---|---|---|
|Table Level|CHK_WBS_EXTRACTED_IND|EXTRACTED_IND IN ('Y','N')<br>|
|Column Level|EXTRACTED_IND||

---

## Table: WF_COST_BUILDUP_TMPL_DETAIL

**Description:** This table will hold W/F cost components associated with the template.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TEMPL_ID | P |  | Y | NUMERIC (10) | Unique cost buildup template ID number associated |
| 2 | COST_COMP_ID | P | F | Y | VARCHAR (10) | Contains a unique specified code representing the component. |
| 3 | DESCRIPTION |  |  | Y | VARCHAR (250) | Contains the name or description of the Component. |
| 4 | CALC_BASIS |  |  | Y | VARCHAR (6) | Contains a one-character code indicating wheter the component is calculated on a per-unit (specific) or ad valorem (value) basis. |
| 5 | COMP_RATE |  |  | Y | NUMERIC (20,4) | Contains the rate to be charged against the calculation base. |
| 6 | PER_COUNT |  |  |  | NUMERIC (12,4) | Contains the count indicating the amount of he Per Count Unit of Measure to which the rate applies. |
| 7 | PER_COUNT_UOM |  |  |  | VARCHAR (4) | Contains the unit of measure in which the per count is specified. |
| 8 | COMP_CURRENCY |  |  | Y | VARCHAR (3) | Contains the currency code for the cost component. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_WF_COST_BUILDUP_TMPL_DETAIL|PK||||TEMPL_ID|ASC|
||||||COST_COMP_ID|ASC|

### Constraints

|Type|Column / Constraint<br>Name|Details|
|---|---|---|
|Table Level|CHK_WCBTD_CALC_BASIS|calc_basis in ('V','S')<br>|
|Column Level|CALC_BASIS||

---

## Table: WF_COST_BUILDUP_TMPL_DTL_TL

**Description:** This is the translation table for WF_COST_BUILDUP_TMPL_DETAIL table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | TEMPL_ID | P | F | Y | NUMERIC (10) | Unique cost buildup template ID number associated |
| 3 | COST_COMP_ID | P | F | Y | VARCHAR (10) | Contains a unique specified code representing the component. |
| 4 | DESCRIPTION |  |  | Y | VARCHAR (250) | Contains the name or description of the Component. |
| 5 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 6 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 7 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 8 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_WF_COST_BUILDUP_TMPL_DTL_TL|PK||||LANG|ASC|
||||||TEMPL_ID|ASC|
||||||COST_COMP_ID|ASC|

---

## Table: WF_COST_BUILDUP_TMPL_HD_TL

**Description:** This is the translation table for WF_COST_BUILDUP_TMPL_HEAD table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | TEMPL_ID | P | F | Y | NUMERIC (10) | Unique cost buildup template ID number, generated from sequence. |
| 3 | TEMPL_DESC |  |  | Y | VARCHAR (120) | Description of the cost buildup template. |
| 4 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 6 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 7 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_WF_COST_BUILDUP_TMPL_HD_TL|PK||||LANG|ASC|
||||||TEMPL_ID|ASC|

---

## Table: WF_COST_BUILDUP_TMPL_HEAD

**Description:** This table will hold W/F cost buildup header information associated with the template.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TEMPL_ID | P |  | Y | NUMERIC (10) | Unique cost buildup template ID number, generated from sequence. |
| 2 | TEMPL_DESC |  |  | Y | VARCHAR (120) | Description of the cost buildup template. |
| 3 | FIRST_APPLIED |  |  | Y | VARCHAR (1) | Indicates whether Margin % or the Up-charges are applied first in the cost buildup process. |
| 4 | MARGIN_PCT |  |  |  | NUMERIC (12,4) | The margin percent to be applied to the acquisition cost to determine the margin markup amount. |
| 5 | COST |  |  |  | NUMERIC (20,4) | Customer cost for an item when First Applied is 'C'. |
| 6 | FINAL_COST_IND |  |  | Y | VARCHAR (1) | Flag which signifies if the cost is the final cost for the item/franchise location or deal pass through should be applied on this cost to derive the final customer cost for the item/franchise location. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_WF_COST_BUILDUP_TMPL_HEAD|PK||||TEMPL_ID|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_WCBTH_COST|((first_applied = 'C' and (cost is not null and cost > 0)) or (first_applied in ('U','M','R') and cost is null))<br>|
||CHK_WCBTH_FIRST_APPLIED|first_applied in ('M','U','R','C')<br>|
||CHK_WCBTH_FINAL_COST|"FINAL_COST_IND"='Y' OR "FINAL_COST_IND"='N'<br>|
|Column Level|FIRST_APPLIED||
||COST||

---

## Table: WF_COST_RELATIONSHIP

**Description:** This table will hold cost relationships at the merchandise hierarchy/customer location associated with effective dates.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEPT | P |  | Y | NUMERIC (4) | Department ID |
| 2 | CLASS | P |  | Y | NUMERIC (4) | Class ID |
| 3 | SUBCLASS | P |  | Y | NUMERIC (4) | Subclass ID |
| 4 | LOCATION | P |  | Y | NUMERIC (10) | Franchise store. |
| 5 | START_DATE | P |  | Y | Date | Date that cost relationship is effective. |
| 6 | END_DATE | P |  | Y | Date | Date that cost relationship is terminated. |
| 7 | TEMPL_ID |  |  | Y | NUMERIC (10) | Template ID number. |
| 8 | ITEM | P |  | Y | VARCHAR (25) | Unique number that identifies an item. NULL will be stored as '-1', as this column is part of the primary key. |

---

## Table: WF_CUSTOMER

**Description:** This new table will hold franchise customer information.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | WF_CUSTOMER_NAME |  |  | Y | VARCHAR (120) | This field will hold the customer description. |
| 2 | WF_CUSTOMER_ID | P |  | Y | NUMERIC (10) | This field will hold the unique identifier for the customer. |
| 3 | CREDIT_IND |  |  | Y | VARCHAR (1) | This field will determine if the customer has good credit. |
| 4 | WF_CUSTOMER_GROUP_ID |  | F | Y | NUMERIC (10) | This field will indicate which customer group this customer belongs to. |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |
| 6 | CREATE_DATETIME |  |  | Y | Date | This column holds the record creation date. |
| 7 | AUTO_APPROVE_IND |  |  | Y | VARCHAR (1) | This indicator is used to auto approve the externally uploaded orders and returns if all the validations are passed. Valid values are Y and N |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_WF_CUSTOMER|PK||||WF_CUSTOMER_ID|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_WF_CUSTOMER_AUTO_APPROVE|AUTO_APPROVE_IND in ('Y','N')<br>|
||CHK_WH_CUSTOMER_CREDIT_IND|CREDIT_IND in ('Y','N')<br>|
|Column Level|CREDIT_IND||
||AUTO_APPROVE_IND||

---

## Table: WF_CUSTOMER_GROUP

**Description:** This new table will hold the franchise customer group information.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | WF_CUSTOMER_GROUP_ID | P |  | Y | NUMERIC (10) | This field will hold the unique identifier for the customer group. |
| 2 | WF_CUSTOMER_GROUP_NAME |  |  | Y | VARCHAR (120) | This field will hold the customer group description |
| 3 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |
| 4 | CREATE_DATETIME |  |  | Y | Date | This column holds the record creation date. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_WF_CUSTOMER_GROUP|PK||||WF_CUSTOMER_GROUP_ID|ASC|

---

## Table: WF_CUSTOMER_GROUP_TL

**Description:** This is the translation table for WF_CUSTOMER_GROUP table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | WF_CUSTOMER_GROUP_ID | P | F | Y | NUMERIC (10) | This field will hold the unique identifier for the customer group. |
| 3 | WF_CUSTOMER_GROUP_NAME |  |  | Y | VARCHAR (120) | This field will hold the customer group description |
| 4 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 6 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 7 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_WF_CUSTOMER_GROUP_TL|PK||||LANG|ASC|
||||||WF_CUSTOMER_GROUP_ID|ASC|

---

## Table: WF_CUSTOMER_TL

**Description:** This is the translation table for WF_CUSTOMER table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG |  | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | WF_CUSTOMER_NAME |  |  | Y | VARCHAR (120) | This field will hold the customer description. |
| 3 | WF_CUSTOMER_ID |  | F | Y | NUMERIC (10) | This field will hold the unique identifier for the customer. |
| 4 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 6 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 7 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_WF_CUSTOMER_TL|UK||||LANG|ASC|
||||||WF_CUSTOMER_ID|ASC|

---

## Table: WF_NON_STOCKHOLDING_SALES

**Description:** This table will hold sales information for non-stockholding franchise locations where the inventory is not being tracked to support reporting and negotiation with the customer. The sales information will be loaded into this table by the wfslsupld.ksh job.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM | P |  | Y | VARCHAR (25) | The item sold at the franchise store. |
| 2 | CUSTOMER_LOC | P |  | Y | NUMERIC (10) | The franchise store the sales in the file pertains to. |
| 3 | REPORT_DATE | P |  | Y | Date | The date the extract was sent. |
| 4 | NET_SALES_QTY |  |  | Y | NUMERIC (12,4) | Net sales quantity for the item/store since last time sales were extracted. |
| 5 | NET_SALES_QTY_UOM |  |  | Y | VARCHAR (4) | Contains the unit of measure for the net sales quantity. |
| 6 | TOTAL_RETAIL_AMT |  |  | Y | NUMERIC (20,4) | Extended retail value of the net sales since the last time sales were extracted. |
| 7 | TOTAL_RETAIL_AMT_CURR |  |  | Y | VARCHAR (3) | This field contains the currency code for the Total Retail Amount value. |

---

## Table: WF_ORDER_AUDIT

**Description:** This table keeps an audit trail for all submitted Franchise Orders in the system. It captures any changes made to a Franchise Order once it has been submitted.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | WF_ORDER_NO | P | F | Y | NUMERIC (10) | This is the unique system generated franchise order no. |
| 2 | SEQ_NO | P |  | Y | NUMERIC (20) | This field is used with WF_ORDER_NO to make the record unique. |
| 3 | WF_ORDER_LINE_NO |  |  | Y | NUMERIC (20) | This is a required system generated field that is used to link the audit record to the WF_ORDER_DETAIL table. |
| 4 | ITEM_CANCELLED_IND |  |  |  | VARCHAR (1) | This is an optional field that is populated with Y or N depending on whether the item was cancelled from a WF_ORDER. |
| 5 | MODIFIED_QTY |  |  |  | NUMERIC (12,4) | This value represents the requested quantity for an item and is populated whenever a quantity is changed for an item on the WF Order. This quantity always represents the last requested quantity of the item as the current requested quantity will still be available on the WF_ORDER_DETAIL table. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_WF_ORDER_AUDIT|PK||||WF_ORDER_NO|ASC|
||||||SEQ_NO|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_WOA_ITEM_CANCELLED_IND|ITEM_CANCELLED_IND in ('Y','N')<br>|
|Column Level|ITEM_CANCELLED_IND||

---

## Table: WF_ORDER_DETAIL

**Description:** This table holds the line level details of a franchise orders.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | WF_ORDER_NO | P | F | Y | NUMERIC (10) | This is the unique system generated franchise order no. It also serves as the primary key for this table along with WF_ORDER_LINE_NO. |
| 2 | WF_ORDER_LINE_NO | P |  | Y | NUMERIC (20) | This is a required system generated field that is used to link an item record to the WF_ORDER_EXP and WF_ORDER_AUDIT tables. |
| 3 | ITEM |  | F | Y | VARCHAR (25) | This is the item which is on the Franchise Order. |
| 4 | SOURCE_LOC_TYPE |  |  | Y | VARCHAR (2) | Contains the source entity type from where the items will originate. Valid values are ST - Store, WH - Warehouse, SU - Supplier |
| 5 | SOURCE_LOC_ID |  |  | Y | NUMERIC (10) | Contains the location id from where this item will be sourced from. The id will correspond to a company store, warehouse or supplier depending on the source type value. |
| 6 | CUSTOMER_LOC |  | F | Y | NUMERIC (10) | This field holds franchises location number. |
| 7 | REQUESTED_QTY |  |  | Y | NUMERIC (12,4) | This field represents the quantity of the item on this record being ordered. This value is always written in the standard UOM for the item. |
| 8 | CANCEL_REASON |  |  |  | VARCHAR (6) | This field represents the reason an item was cancelled from a Franchise Order. |
| 9 | NEED_DATE |  |  | Y | Date | This date represents the initial date by which the franchisee wants the item on this order. |
| 10 | NOT_AFTER_DATE |  |  | Y | Date | This date represents the last date by which the franchisee will accept the item on this order. |
| 11 | ACQUISITION_COST |  |  |  | NUMERIC (20,4) | This is the cost that the retailer acquired the item on this record at, from the supplier. This cost includes any applicable deals (using deal pass through logic) and ELC (if ELC is on for the system and included for franchise stores). This cost is maintained in wf_order_head currency_code. |
| 12 | CUSTOMER_COST |  |  |  | NUMERIC (20,4) | This is the cost that the franchisee will pay the retailer for the item on this record. This cost is sum of the acquisition cost and the components of the applicable cost template. This cost is maintained in wf_order_head currency_code. |
| 13 | FIXED_COST |  |  |  | NUMERIC (20,4) | This is a user defined cost which will override the customer cost for the item on this order if populated. This cost is maintained in wf_order_head currency_code. |
| 14 | TEMPL_ID |  | F |  | NUMERIC (10) | This is the cost template ID of the cost template applied to the item on this record. |
| 15 | MARGIN_PCT |  |  |  | NUMERIC (12,4) | This is the margin percent contained in the cost template applied to the item on this order. |
| 16 | CALC_TYPE |  |  |  | VARCHAR (1) | This is the margin calculation method for the cost template. Valid values are M - Apply Margin First, U - Apply up charges first, R - Percentage of retail amount, C - Fixed cost. |
| 17 | TEMPL_DESC |  |  |  | VARCHAR (120) | This is the description of the cost template applied to the item on this record. |
| 18 | CREATE_DATETIME |  |  | Y | Date | This column contains the date when the Franchise Order line was created. |
| 19 | CREATE_ID |  |  | Y | VARCHAR (30) | This column contains the ID of the user who created the Franchise order line record. |
| 20 | LAST_UPDATE_DATETIME |  |  | Y | Date | This column contains the date when the Franchise order line record was last updated. |
| 21 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This column contains the ID of the user who last updated the Franchise order line record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_WF_ORDER_DETAIL|PK||||WF_ORDER_NO|ASC|
||||||WF_ORDER_LINE_NO|ASC|
|WF_ORDER_DETAIL_I1|||||ITEM|ASC|
|WF_ORDER_DETAIL_I4|||||NEED_DATE|ASC|
|WF_ORDER_DETAIL_I2|||||CUSTOMER_LOC|ASC|
|WF_ORDER_DETAIL_I3|||||TEMPL_ID|ASC|
|WF_ORDER_DETAIL_I5|||||SOURCE_LOC_ID|ASC|
||||||SOURCE_LOC_TYPE|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_WF_ORDER_DETAIL_CALC_TYPE|CALC_TYPE in ('M','U','R','C')<br>|
||CHK_WF_ORDER_DETAIL_SOURCE_LOC|SOURCE_LOC_TYPE in ('ST','WH','SU')<br>|
|Column Level|SOURCE_LOC_TYPE||
||CALC_TYPE||

---

## Table: WF_ORDER_EXP

**Description:** This table holds the details of expenses associated with item/location on a Franchise order and are defaulted from the applicable cost template. The expenses will be related to the items by WF_ORDER_LINE_NO field.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | WF_ORDER_NO | P | F | Y | NUMERIC (10) | This is the unique system generated franchise order no. It also serves as the primary key for this table along with SEQ_NO. |
| 2 | SEQ_NO | P |  | Y | NUMERIC (20) | This field is used with WF_ORDER_NO to make the record unique. |
| 3 | WF_ORDER_LINE_NO |  |  | Y | NUMERIC (20) | This is a required system generated field that is used to link an item record to the WF_ORDER_DETAIL table. |
| 4 | COMP_ID |  | F | Y | VARCHAR (10) | This field identifies the cost component ID which gives the upcharge cost component that was applied to this item location. |
| 5 | CALC_BASIS |  |  | Y | VARCHAR (1) | This field identifies the calculation basis as how the component rate will be used. The two valid values are, Value and Specific. When the calculation basis is Value the component rate represents a percent. When the calculation basis is Specific the component rate represents a particular monetary amount. |
| 6 | COMP_RATE |  |  | Y | NUMERIC (20,4) | This field represents the rate of the upcharge amount based on the CALC_BASIS. This field will have a percent when the calculation basis is value and it will have an amount when the calculation basis is specific. |
| 7 | PER_COUNT |  |  |  | NUMERIC (12,4) | This field represents the number of units for the per count unit of measure that a specific component rate will be applied against. |
| 8 | PER_COUNT_UOM |  |  |  | VARCHAR (4) | This field represents the UOM that a specific component rate will be applied against. This field is only used when the CALC_BASIS is specific. |
| 9 | COMP_CURRENCY |  | F |  | VARCHAR (3) | This field represents the currency the component rate is entered in. If |
| 10 | EXCHANGE_RATE |  |  |  | NUMERIC (20,10) | This field represents the exchange rate between the currency the component rate is entered in and the franchise currency. If the CALC_BASIS is V then this field is NULL. |
| 11 | EST_UPCHARGE_AMT |  |  |  | NUMERIC (20,4) | This field represents the estimated upcharge amount for this particular expense against the item/location on the order. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_WF_ORDER_EXP|PK||||WF_ORDER_NO|ASC|
||||||SEQ_NO|ASC|
|WF_ORDER_EXP_I1|||||COMP_CURRENCY|ASC|
|WF_ORDER_EXP_I2|||||COMP_ID|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_WF_ORDER_EXP_CALC_BASIS|CALC_BASIS in ('V','S')<br>|
|Column Level|CALC_BASIS||

---

## Table: WF_ORDER_HEAD

**Description:** This table holds the Header level details of a Franchise order.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | WF_ORDER_NO | P |  | Y | NUMERIC (10) | This is the unique system generated franchise order no. It also serves as the primary key for this table. |
| 2 | CUST_ORD_REF_NO |  |  |  | VARCHAR (20) | This is a reference number that would be provided by the franchisee for their tracking purposes. |
| 3 | STATUS |  |  | Y | VARCHAR (1) | This field represents the current state of the franchise order. Valid values are I - Input, A - Approved,P - In Progress, D - Closed, C - Cancelled, R - Require Credit Approval |
| 4 | ORDER_TYPE |  |  | Y | VARCHAR (1) | This field represents how the franchise order was created in RMS. Valid values are M - Manual, E - EDI, A - Auto or X - Externally generated. |
| 5 | CURRENCY_CODE |  | F | Y | VARCHAR (3) | This field represents the currency of the order, which may or may not be different from the primary currency in the system. Valid values for this field are based on the currency codes held in the CURRENCIES table. |
| 6 | EXCHANGE_RATE |  |  |  | NUMERIC (20,10) | This field represents the exchange rate between the primary currency and the Franchise order currency. This field references the exchange rates maintained on the currency rates table. |
| 7 | FREIGHT |  |  |  | NUMERIC (20,4) | This field represents any freight charges associated to the WF order and will be populated by the user. |
| 8 | OTHER_CHARGES |  |  |  | NUMERIC (20,4) | This field represents other miscellaneous charges associated to the WF order and will be populated by the user. |
| 9 | ALL_LOCATION_BILLING |  |  | Y | VARCHAR (1) | This field is an indicator representing whether or not invoices will be sent to all locations on a WF Order. Valid values are Y-Yes and N-No. Default value is N. |
| 10 | DEFAULT_BILL_TO_LOC |  | F |  | NUMERIC (10) | This field represents the default billing location for an order. This is used if all_location_billing is No. |
| 11 | BILL_TO_ADDR_TYPE |  | F |  | VARCHAR (2) | This field represents the address type for the default billing location the user is using as the billing location. |
| 12 | COMMENTS |  |  |  | VARCHAR (2000) | Free form comments associated with the franchise order. |
| 13 | CANCEL_REASON |  |  |  | VARCHAR (6) | This field represents the reason an order was cancelled. Valid values are part of code_type WFCR. |
| 14 | APPROVAL_DATE |  |  |  | Date | This column contains the date when the Franchise Order was approved. |
| 15 | CREATE_ID |  |  | Y | VARCHAR (30) | This field represents the ID of the user who created the franchise order. |
| 16 | CREATE_DATETIME |  |  | Y | Date | This column contains the date when the Franchise Order was created. |
| 17 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This column contains the ID of the user who last updated the Franchise order record. |
| 18 | LAST_UPDATE_DATETIME |  |  | Y | Date | This column contains the date when the Franchise order record was last updated. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_WF_ORDER_HEAD|PK||||WF_ORDER_NO|ASC|
|WF_ORDER_HEAD_I1|||||BILL_TO_ADDR_TYPE|ASC|
|WF_ORDER_HEAD_I2|||||CURRENCY_CODE|ASC|
|WF_ORDER_HEAD_I3|||||DEFAULT_BILL_TO_LOC|ASC|
|WF_ORDER_HEAD_I4|||||STATUS|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_WF_ORDER_HEAD_ORDER_TYPE|ORDER_TYPE in ('M','A','E','X')<br>|
||CHK_WF_ORDER_HEAD_STATUS|status in ('I','A','P','D','C', 'R')<br>|
||CHK_WOH_ALL_LOCATION_BILLING|ALL_LOCATION_BILLING in ('Y','N')<br>|
||CHK_WOH_DEFAULT_BILL_TO_LOC|(((ALL_LOCATION_BILLING = 'N') AND (DEFAULT_BILL_TO_LOC is NOT NULL)) OR (ALL_LOCATION_BILLING = 'Y'))<br>|
|Column Level|STATUS||
||ORDER_TYPE||
||ALL_LOCATION_BILLING||

---

## Table: WF_RETURN_DETAIL

**Description:** This table holds the line level details for franchise returns.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | RMA_NO | P | F | Y | NUMERIC (10) | This is a system generated sequence number. This is the authorization number for the franchisee to return the goods. |
| 2 | ITEM | P | F | Y | VARCHAR (25) | Item that has to be returned to the retailer. |
| 3 | WF_ORDER_NO |  | F | Y | NUMERIC (10) | Franchise order number against which the item is being returned. For auto or externally generated franchise order, this field will be null. |
| 4 | RETURNED_QTY |  |  | Y | NUMERIC (12,4) | Quantity of the item that is being returned. |
| 5 | RETURN_REASON |  |  |  | VARCHAR (6) | Reason describing why the item is being returned. Valid values are part of code_type RTVR. |
| 6 | RETURN_UNIT_COST |  |  |  | NUMERIC (20,4) | Cost at which the item is being returned. This value is picked from the franchise order or the user has the option of overriding it on the screen. For Auto or externally generated returns, the average cost at the franchise location is used. |
| 7 | RESTOCK_TYPE |  |  |  | VARCHAR (1) | This field represents Restocking fee type. The valid values are V- Value and S -Specific. When the restock_type is Value the UNIT_RESTOCK_FEE represents a percentage of the RETURN_UNIT_COST, else the UNIT_RESTOCK_FEE represents a particular monetary amount. |
| 8 | UNIT_RESTOCK_FEE |  |  |  | NUMERIC (20,4) | Restocking fee per unit level. If RESTOCK_TYPE is V then this value will be a percentage of return unit cost else this will be a monetary value. |
| 9 | NET_RETURN_UNIT_COST |  |  |  | NUMERIC (20,4) | The difference between RETURN_UNIT_COST and UNIT_RESTOCK_FEE. This will represent the value that the retailer should pay the franchisee. This field is maintained in wf_return_head currency_code |
| 10 | CANCEL_REASON |  |  |  | VARCHAR (6) | Contains the reason the return line was cancelled. Valid values are part of code_type WFCR. |
| 11 | CREATE_DATETIME |  |  | Y | Date | This column contains the date when the Franchise Return line was created. |
| 12 | CREATE_ID |  |  | Y | VARCHAR (30) | This column contains the ID of the user who created the Franchise return line record. |
| 13 | LAST_UPDATE_DATETIME |  |  | Y | Date | This column contains the date when the Franchise return line record was last updated. |
| 14 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This column contains the ID of the user who last updated the Franchise return line record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_WF_RETURN_DETAIL|PK||||RMA_NO|ASC|
||||||ITEM|ASC|
|WF_RETURN_DETAIL_I1|||||WF_ORDER_NO|ASC|
|WF_RETURN_DETAIL_I2|||||ITEM|ASC|

---

## Table: WF_RETURN_HEAD

**Description:** This table holds the header level details of Franchise returns.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | RMA_NO | P |  | Y | NUMERIC (10) | This is a system generated sequence number which acts as primary key for the table. This is the authorization number for the franchisee to return the goods. |
| 2 | STATUS |  |  | Y | VARCHAR (1) | Status of the return. The return can be in one of these states I - Input, A - Approved, C - Cancel, P - In Progress and D - Closed. |
| 3 | CUST_RET_REF_NO |  |  |  | VARCHAR (20) | This is a reference number that would be provided by the franchisee for their tracking purposes. |
| 4 | CUSTOMER_LOC |  | F | Y | NUMERIC (10) | This is the franchise location from where the goods are being returned. |
| 5 | RETURN_LOC_TYPE |  |  | Y | VARCHAR (1) | This column contains the return location type. Valid values are S - Store and W - Warehouse. |
| 6 | RETURN_LOC_ID |  |  | Y | NUMERIC (10) | Contains the id of the location where the items will be returned. Will contain a store or warehouse id depending on the return_loc_type value. |
| 7 | RETURN_TYPE |  |  | Y | VARCHAR (1) | This field represents how the franchise return was created in RMS. Valid values are M - Manual, A - Auto, E - EDI and X - External. |
| 8 | RETURN_METHOD |  |  | Y | VARCHAR (1) | This field represents the type of the return. Valid values are D - Destroy on site or R - Return to warehouse/store |
| 9 | TOTAL_RETURN_AMT |  |  |  | NUMERIC (20,4) | This field represents the total amount that has to be returned to the franchisee. |
| 10 | TOTAL_RESTOCK_AMT |  |  |  | NUMERIC (20,4) | Total restocking fee that franchisee should pay the retailer. |
| 11 | TOTAL_NET_RETURN_AMT |  |  |  | NUMERIC (20,4) | The final amount to be returned to the franchisee, this will be equal to TOTAL_RETURN_AMT minus TOTAL_RESTOCK_AMT. |
| 12 | CURRENCY_CODE |  | F | Y | VARCHAR (3) | This field represents the currency of the return, which may or may not be different from the primary currency in the system. Valid values for this field are based on the currency codes held in the CURRENCIES table. |
| 13 | COMMENTS |  |  |  | VARCHAR (2000) | Free form comments associated with the franchise return. |
| 14 | CANCEL_REASON |  |  |  | VARCHAR (6) | Contains the reason the return was cancelled. Valid values are part of code_type WFCR. |
| 15 | CREATE_ID |  |  | Y | VARCHAR (30) | This field represents the ID of the user who created the franchise return. |
| 16 | CREATE_DATETIME |  |  | Y | Date | This field represents the date on which the franchise return was created. |
| 17 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This column contains the ID of the user who last updated the Franchise return record. |
| 18 | LAST_UPDATE_DATETIME |  |  | Y | Date | This column contains the date when the Franchise return record was last updated. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_WF_RETURN_HEAD|PK||||RMA_NO|ASC|
|WF_RETURN_HEAD_I1|||||CUSTOMER_LOC|ASC|
|WF_RETURN_HEAD_I2|||||STATUS|ASC|
|WF_RETURN_HEAD_I3|||||CURRENCY_CODE|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_WF_RETURN_HEAD_RETURN_TYPE|RETURN_TYPE IN ('M','X','E','A')<br>|
||CHK_WF_RETURN_HEAD_RLT|RETURN_LOC_TYPE IN ('S','W')<br>|
||CHK_WF_RETURN_HEAD_RM|RETURN_METHOD IN ('D','R')<br>|
||CHK_WF_RETURN_HEAD_STATUS|STATUS IN ('I','A','C','D','P')<br>|
|Column Level|STATUS||
||RETURN_LOC_TYPE||
||RETURN_TYPE||
||RETURN_METHOD||
