# RMS Tax & VAT Configuration Datamodel - Physical Data Model Reference

## Table: GTAX_ITEM_ROLLUP

**Description:** This table holds the cumulative retail tax of the item locatoin on an effective date. It holds both the cumulative tax percentage and cumulative tax value. It supports scenarioes like %5 of tax and $2 being applied to retail sales.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM | P |  | Y | VARCHAR (25) | ID of item that can be ranged to a location. |
| 2 | LOC | P |  | Y | NUMERIC (10) | Location ID. |
| 3 | LOC_TYPE | P |  | Y | VARCHAR (2) | Location types: ST - store, WH - warehouse, E - external finisher |
| 4 | EFFECTIVE_FROM_DATE | P |  | Y | Date | Date the tax on this table becomes effective. |
| 5 | ITEM_PARENT |  |  |  | VARCHAR (25) | Parent of Item. |
| 6 | ITEM_GRANDPARENT |  |  |  | VARCHAR (25) | Grandparent of Item. |
| 7 | CUM_TAX_PCT |  |  |  | NUMERIC (20,10) | It holds the consolidated tax rate across different tax codes applicable to the item/locations unit retail when the calculation basis is Value (V). Along with cum_tax_pct, it can be used to determine the total tax amount contained in unit_retail: |
| 8 | CUM_TAX_VALUE |  |  |  | NUMERIC (20,10) | It holds the consolidated tax rate across different tax codes applicable to the item/locations unit retail when the calculation basis is Value (V). Along with cum_tax_pct, it can be used to determine the total tax amount contained in unit_retail. |
| 9 | CURRENCY_CODE |  |  |  | VARCHAR (3) | Currency of cum_tax_value. Assumed location currency. |
| 10 | CREATE_DATETIME |  |  | Y | Date | Date the record is created. |
| 11 | CREATE_ID |  |  | Y | VARCHAR (30) | User id that creates the records. |
| 12 | LAST_UPDATE_DATETIME |  |  | Y | Date | Date the record is last updated. |
| 13 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | User id that last updates the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_GTAX_ITEM_ROLLUP|PK||||ITEM|ASC|
||||||LOC|ASC|
||||||LOC_TYPE|ASC|
||||||EFFECTIVE_FROM_DATE|ASC|

---

## Table: TAX_CALC_EVENT

**Description:** This table holds the details of the tax event when the tax event is to be processed in the ASYNC mode. These events will be processed by the AQ tax engine. For this release this table will hold only the Purchase Order Tax breakup events. This table can be enhanced to store other tax events in future releases.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TAX_EVENT_ID | P |  | Y | NUMERIC (25) | Unique identifier that represents the Tax event |
| 2 | TAX_EVENT_TYPE |  |  | Y | VARCHAR (2) | This column holds the type of the tax event. For PO tax breakup the value is PO. |
| 3 | ORDER_NO |  | F | Y | NUMERIC (12) | This field holds the order number that should be processed by the AQ. |
| 4 | TAX_EVENT_RESULT |  |  | Y | VARCHAR (1) | This field holds the status of the event. Valid values are, N-Not Processed E-Error I-Processed with warnings C-Completed successfully. |
| 5 | TAX_EVENT_ERROR |  |  |  | VARCHAR (500) | This field holds the error message or warning when the the event is in E or I status. |
| 6 | CREATE_DATETIME |  |  | Y | Date | Timestamp when the event was created. |
| 7 | CREATE_ID |  |  | Y | VARCHAR (30) | User ID of the creator. |
| 8 | LAST_UPDATE_DATETIME |  |  | Y | Date | Timestamp when the event was last updated. |
| 9 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | User ID of the of the last update. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_TAX_CALC_EVENT|PK||||TAX_EVENT_ID|ASC|
|TAX_CALC_EVENT_I1|||||ORDER_NO|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_TAX_CALC_EVENT_TAX_EVENT_R|TAX_EVENT_RESULT IN ('C','E','I','N')<br>|
|Column Level|TAX_EVENT_RESULT||

---

## Table: TAX_EVENT_RUN_TYPE

**Description:** This table will hold the mode in which the different tax events should be executed. For this release only the PO tax breakup event is supported to be executed in ASYNC mode.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TAX_EVENT_TYPE | P |  | Y | VARCHAR (2) | This column holds the tax event id. For PO tax breakup event the value is PO |
| 2 | TAX_EVENT_TYPE_DESC |  |  |  | VARCHAR (50) | This column holds the description of the tax event. |
| 3 | RUN_TYPE |  |  | Y | VARCHAR (6) | This column gives the mode in which the tax event type would be processed. Valid values are SYNC and ASYNC. When the event is setup as ASYNC, AQ will be used to process the event. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_TAX_EVENT_RUN_TYPE|PK||||TAX_EVENT_TYPE|ASC|

---

## Table: VAT_CODES

**Description:** This table contains one row for each VAT code. The VAT code is used to determine which items are subject to VAT tax. An identifier has been included as the unique key because the alphanumeric may be meaningful and there could be duplicates across regions (countries) when this is extended to a European generic design. The ID will never be seen by the on-line user.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | VAT_CODE | P |  | Y | VARCHAR (6) | This field contains the alphanumeric identification for the VAT code. Valid values include: S - Standard C - Composite Z - Zero E - Exempt Other values may also be entered. These are the default VAT Rates that are set-up upon installation of the RMS. |
| 2 | VAT_CODE_DESC |  |  | Y | VARCHAR (120) | Contains a description identifying the VAT code. |
| 3 | INCL_NIC_IND |  |  | Y | VARCHAR (1) | This will determine if the tax code will be included in the calculation of the Negotiated Item Cost or not. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_VAT_CODES|PK||||VAT_CODE|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_VAT_CODES_INCL_NIC_IND|INCL_NIC_IND IN ('Y','N')<br>|
|Column Level|INCL_NIC_IND||

---

## Table: VAT_CODES_CFA_EXT

**Description:** This is the custom attribute extension table for the entity VAT_CODES.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | VAT_CODE | P | F | Y | VARCHAR (6) | This column holds the VAT Code this extended data is associated with. |
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
|PK_VAT_CODES_CFA_EXT|PK||||VAT_CODE|ASC|
||||||GROUP_ID|ASC|

---

## Table: VAT_CODES_TL

**Description:** This is the translation table for VAT_CODES table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | VAT_CODE | P | F | Y | VARCHAR (6) | This field contains the alphanumeric identification for the VAT code. Valid values include: S - Standard C - Composite Z - Zero E - Exempt Other values may also be entered. These are the default VAT Rates that are set-up upon installation of the RMS. |
| 3 | VAT_CODE_DESC |  |  | Y | VARCHAR (120) | Contains a description identifying the VAT code. |
| 4 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 6 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 7 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_VAT_CODES_TL|PK||||LANG|ASC|
||||||VAT_CODE|ASC|

---

## Table: VAT_CODE_RATES

**Description:** This table will hold VAT rates and active dates for each VAT code in the system. Each VAT code can only have one rate active at a time.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | VAT_CODE | P | F | Y | VARCHAR (6) | Code to uniquely identify a VAT rate. |
| 2 | ACTIVE_DATE | P |  | Y | Date | Date on which the VAT rate becomes active. |
| 3 | VAT_RATE |  |  | Y | NUMERIC (20,10) | VAT rate associated with a given VAT code. |
| 4 | CREATE_DATE |  |  | Y | Date | Date on which the new VAT code record was created. |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | User ID of the user who created the new VAT code record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_VAT_CODE_RATES|PK||||VAT_CODE|ASC|
||||||ACTIVE_DATE|ASC|

---

## Table: VAT_DEPS

**Description:** Notes

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | VAT_REGION | P | F | Y | NUMERIC (4) | Contains the number of the Value Added Tax region in which this store is contained. |
| 2 | DEPT | P | F | Y | NUMERIC (4) | The number of the department to which the item is attached. |
| 3 | VAT_TYPE | P |  | Y | VARCHAR (1 ) | Refer to VAT_ITEM.VAT_TYPE. |
| 4 | VAT_CODE |  | F | Y | VARCHAR (6) | The VAT code. |
| 5 | REVERSE_VAT_IND |  |  | Y | VARCHAR (1 ) | Indicates if items in the department are subject to reverse charge VAT at the vat region. It is used to default the value to VAT_ITEM only. Valid values are Y and N. |
| 6 | CREATE_ID |  |  | Y | VARCHAR (30 ) | This column holds the User id of the user who created the record. |
| 7 | CREATE_DATETIME |  |  | Y | Date | This column holds the record creation date. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_VAT_DEPS|PK||||VAT_REGION|ASC|
||||||DEPT|ASC|
||||||VAT_TYPE|ASC|
|VAT_DEPS_I2|||||VAT_CODE|ASC|
|VAT_DEPS_I1|||||DEPT|ASC|

### Constraints

|Type|Column / Constraint<br>Name|Details|
|---|---|---|
|Table Level|CHK_REVERSE_VAT_IND|REVERSE_VAT_IND IN ('Y', 'N')<br>|

---

## Table: VAT_EXPORT_STG

**Description:** This is table is a staging table for vat records as they wait to be extracted. This table is automatically inserted into, as records are processed by Oracle Retail. This table will be scanned by a daily batch job to extract new, updated and deleted of approved sellable items.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SEQ_NO | P |  | Y | NUMERIC (15) | The sequence in which the records are placed in the table. |
| 2 | VAT_REGION |  |  | Y | NUMERIC (4) | Contains the unique identifying number for the VAT region in the system. |
| 3 | VAT_CODE |  |  | Y | VARCHAR (6) | Contains the alphanumeric identification for the VAT code. |
| 4 | ACTIVE_DATE |  |  | Y | Date | The date on which the VAT rate becomes active. |
| 5 | ACTION_TYPE |  |  | Y | VARCHAR (15) | Indicates if the vat record has been added, changed or deleted. Valid values are 'vatcre', 'vatmod', and 'vatdel'. |
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
|PK_VAT_EXPORT_STG|PK||||SEQ_NO|ASC|

---

## Table: VAT_HISTORY

**Description:** Contains VAT dollar history by item/location/day for daily sales.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM | P |  | Y | VARCHAR (25) | Identifier of item for which sales included the value added tax. |
| 2 | STORE | P |  | Y | NUMERIC (10) | Contains the number identifying the store where the sale was made. |
| 3 | TRAN_DATE | P |  | Y | Date | Contains the date when the sales transaction occurred. |
| 4 | VAT_AMT |  |  | Y | NUMERIC (20,4) | Contains the amount of the Value Added Tax for the sale. This field is stored in the local currency. |
| 5 | VAT_RATE |  |  | Y | NUMERIC (12,4) | Contains the rate of the Value Added Tax for the sale. |
| 6 | VAT_CODE |  |  | Y | VARCHAR (6) | Contains the alphanumeric identification for the VAT code. Valid values include: S - Standard C - Composite N/A Z - Zero E - Exempt |
| 7 | CREATE_DATETIME |  |  | Y | Date | Date/time stamp of when the record was created. This date/time will be used in export processing. This value should only be populated on insert - it should never be updated. |
| 8 | LAST_UPDATE_DATETIME |  |  | Y | Date | Holds the date time stamp of the most recent update by the last_update_id. This field is required by the database. |
| 9 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | Holds the Oracle user-id of the user who most recently updated this record. This field is required by the database. |

---

## Table: VAT_ITEM

**Description:** Notes

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM | P | F | Y | VARCHAR (25) | Contains the item number in the distro |
| 2 | VAT_REGION | P | F | Y | NUMERIC (4) | Contains the number of the Value Added Tax region in which this store is contained. |
| 3 | ACTIVE_DATE | P |  | Y | Date | Holds the active date for record on future cost |
| 4 | VAT_TYPE | P |  | Y | VARCHAR (1 ) | Refer to VAT_ITEM.VAT_TYPE. |
| 5 | VAT_CODE |  | F | Y | VARCHAR (6) | The VAT code. |
| 6 | VAT_RATE |  |  | Y | NUMERIC (20,10) | This column contains the VAT rate for the item/location. |
| 7 | REVERSE_VAT_IND |  |  | Y | VARCHAR (1 ) | Indicates if the item is subject to reverse charge VAT at the vat region. Valid values are Y and N. |
| 8 | CREATE_DATE |  |  | Y | Date | The date of when the record was created. |
| 9 | CREATE_ID |  |  | Y | VARCHAR (30 ) | This column holds the User id of the user who created the record. |
| 10 | CREATE_DATETIME |  |  | Y | Date | This column holds the record creation date. |
| 11 | LAST_UPDATE_DATETIME |  |  | Y | Date | This column holds the record updated date. |
| 12 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30 ) | This column holds the User id of the user who updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_VAT_ITEM|PK||||ITEM|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
||||||VAT_REGION|ASC|
||||||ACTIVE_DATE|ASC|
||||||VAT_TYPE|ASC|
|VAT_ITEM_I1|||||VAT_REGION|ASC|
||||||ITEM|ASC|
|VAT_ITEM_I2|||||VAT_CODE|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_VAT_ITEM_VAT_TYPE|vat_type in ('C', 'R', 'B')<br>|
||CHK_REVERSE_VAT_IND_VAT_ITEM|REVERSE_VAT_IND IN ('Y', 'N')<br>|

---

## Table: VAT_REGION

**Description:** This table contains one row for each VAT region and is maintained by the VAT Region Maintenance form (vatreg.fmb). A VAT region is not the same as a region in the organizational hierarchy. VAT regions are determined by the VAT authority. This table contains the VAT region code and associated name.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | VAT_REGION | P |  | Y | NUMERIC (4) | Contains the unique identifying number for the VAT region in the system. |
| 2 | VAT_REGION_NAME |  |  | Y | VARCHAR (120) | Contains the name associated with the VAT region. |
| 3 | VAT_REGION_TYPE |  |  | Y | VARCHAR (6) | Will hold the type of VAT region. Valid values include E for the base EU region, M for EU member and N for Non-members. |
| 4 | ACQUISITION_VAT_IND |  |  | Y | VARCHAR (1) | Indicates if acquisition VAT is applicable to the vat region. Valid values are Y and N. |
| 5 | REVERSE_VAT_THRESHOLD |  |  |  | NUMERIC (20,4) | This holds the invoice-level total value limit. The reverse charge VAT rule only applies if the total value of items that are subject to reverse charge VAT exceeds the threshold for an invoice. This value is expressed in the country currency of the vat_region, which typically only belongs to one country. |
| 6 | VAT_CALC_TYPE |  |  | Y | VARCHAR (6 ) | This column holds the tax calculation type and can be ''S''imple, ''E''xempt or ''C''ustom. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_VAT_REGION|PK||||VAT_REGION|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_VAT_REGION_ACQ_VAT_IND|ACQUISITION_VAT_IND in ('Y','N')<br>|
||CHK_VAT_REGION_VAT_REGION_TYPE|vat_region_type in ('E', 'M', 'N')<br>|
|Column Level|ACQUISITION_VAT_IND||

---

## Table: VAT_REGION_TL

**Description:** This is the translation table for VAT_REGION table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | VAT_REGION | P | F | Y | NUMERIC (4) | Contains the unique identifying number for the VAT region in the system. |
| 3 | VAT_REGION_NAME |  |  | Y | VARCHAR (120) | Contains the name associated with the VAT region. |
| 4 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 6 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 7 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_VAT_REGION_TL|PK||||LANG|ASC|
||||||VAT_REGION|ASC|
