# RMS Sales Audit Rules Engine & Error Datamodel - Physical Data Model Reference

## Table: RESA_OI_SYSTEM_OPTIONS

**Description:** This table holds the configurations related to ReSA dashboards.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | OVER_THRESHOLD |  |  | Y | NUMERIC (5) | Controls the over amount threshold |
| 2 | SHORT_THRESHOLD |  |  | Y | NUMERIC (5) | Controls the short amout threshold |

---

## Table: SA_CONSTANTS

**Description:** This table contains details for constants. Constants are numbers that can be used in multiple instances for validation.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | CONSTANT_ID | P |  | Y | VARCHAR (30) | This field contains a unique identifier for the constant. |
| 2 | CONSTANT_NAME |  |  |  | VARCHAR (250) | This field contains a name for the constant. |
| 3 | CONSTANT_VALUE |  |  | Y | VARCHAR (14) | This field contains the value of the constant. |
| 4 | VALUE_DATA_TYPE |  |  | Y | VARCHAR (6) | This field contains the data type of the constant value. Valid values are on the code tables with a code type of DTTP. |
| 5 | DELETE_IND |  |  | Y | VARCHAR (1) | This field contains whether or not the constant can be deleted. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SA_CONSTANTS|PK||||CONSTANT_ID|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_SA_CONSTANTS_DELETE_IND|delete_ind in ('Y','N')<br>|
||CHK_SA_CONSTANTS_VALUE_DATA_TY|value_data_type in ('C','N','D')<br>|
|Column Level|VALUE_DATA_TYPE||
||DELETE_IND||

---

## Table: SA_CONSTANTS_TL

**Description:** This is the translation table for SA_CONSTANTS table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | CONSTANT_ID | P | F | Y | VARCHAR (30) | This field contains a unique identifier for the constant. |
| 3 | CONSTANT_NAME |  |  |  | VARCHAR (250) | This field contains a name for the constant. |
| 4 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 6 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 7 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SA_CONSTANTS_TL|PK||||LANG|ASC|
||||||CONSTANT_ID|ASC|

---

## Table: SA_ERROR

**Description:** This table contains a record for every modification of an error generated during the automated audit process.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | STORE | P | F | Y | NUMERIC (10) | Store number to be used for table partitioning. |
| 2 | DAY | P | F | Y | NUMERIC (3) | Day number to be used for table partitioning. This is derived from the sa_store_day.business_date column by calling the function SA_DATE_HASH. |
| 3 | ERROR_SEQ_NO | P |  | Y | NUMERIC (20) | Contains a unique system generated sequence number used to distinguish between errors. |
| 4 | STORE_DAY_SEQ_NO |  | F | Y | NUMERIC (20) | The unique sequence number of the store-day for which this error occurred. |
| 5 | BAL_GROUP_SEQ_NO |  | F | Y | NUMERIC (20) | The unique sequence number of the balance group for which this error occurred. |
| 6 | TOTAL_SEQ_NO |  | F | Y | NUMERIC (20) | Contains the unique identifier of the total that the error is associated with. If this field contains a value, the tran_head_no field will not contain a value. An error can only be generated against a total or against a transaction, never against both. |
| 7 | TRAN_SEQ_NO |  | F | Y | NUMERIC (20) | Contains the sales audit systems transaction identifier that the error is associated with. If this field contains a value, the total_value_id field will not contain a value. An error can only be generated against a total or against a transaction, never against both. |
| 8 | ERROR_CODE |  | F | Y | VARCHAR (25) | Contains the identifying code of the error that was generated. |
| 9 | KEY_VALUE_1 |  |  |  | NUMERIC (4) | Contains the identifying number of the record that is in error. If the error is a Transaction Header error or Total error, this field will be empty. If the error is a Transaction Tender error, this field will contain the Tender Sequence number. If the error is a Transaction Item error, this field will contain the Item Sequence number. If the error is a Transaction Item Discount error, this field will contain the Item Sequence number. If the error is a Transaction Tax error, this field will contain the Tax Sequence number. |
| 10 | KEY_VALUE_2 |  |  |  | NUMERIC (4) | Contains the identifying number of the record that is in error. If the error is a Transaction Item Discount error, this field will contain the Discount Sequence number, otherwise this field will be empty. |
| 11 | REC_TYPE |  |  | Y | VARCHAR (6) | Contains the type of detail record that is in error. The code type for this field is SART. |
| 12 | STORE_OVERRIDE_IND |  |  | Y | VARCHAR (1) | Indicates whether or not a store employee has permission to override the error. Valid values are Yes or No. |
| 13 | HQ_OVERRIDE_IND |  |  | Y | VARCHAR (1) | Indicates whether or not a headquarters employee has permission to override the error. Valid values are Yes or No. |
| 14 | UPDATE_ID |  |  | Y | VARCHAR (30) | Contains the user identification of the person that last updated the error. |
| 15 | UPDATE_DATETIME |  |  | Y | Date | Contains the date when the error was last updated. |
| 16 | ORIG_VALUE |  |  |  | VARCHAR (70) | Contains the value that is in error. |
| 17 | ORIG_CC_NO |  |  |  | VARCHAR (40) | Contains the original cc_no value that is in error. If credit card security has been applied, the SA_ERROR_CC_SEC policy will restrict this column for users that are not granted the CC_ACCESS role. The column will |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SA_ERROR|PK||||ERROR_SEQ_NO|ASC|
||||||STORE|ASC|
||||||DAY|ASC|
|SA_ERROR_I5|UN||||STORE_DAY_SEQ_NO|ASC|
||||||BAL_GROUP_SEQ_NO|ASC|
||||||TOTAL_SEQ_NO|ASC|
||||||TRAN_SEQ_NO|ASC|
||||||ERROR_CODE|ASC|
||||||KEY_VALUE_1|ASC|
||||||KEY_VALUE_2|ASC|
||||||REC_TYPE|ASC|
||||||ORIG_VALUE|ASC|
||||||STORE|ASC|
||||||DAY|ASC|
||||||ERROR_SEQ_NO|ASC|
|SA_ERROR_I3|||||TRAN_SEQ_NO|ASC|
||||||STORE|ASC|
||||||DAY|ASC|
|SA_ERROR_I4|||||ERROR_CODE|ASC|
|SA_ERROR_I2|||||TOTAL_SEQ_NO|ASC|






|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
||||||STORE|ASC|
||||||DAY|ASC|
|PK_SA_ERROR|UN||||ERROR_SEQ_NO|ASC|
||||||STORE|ASC|
||||||DAY|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_SA_ERROR_THREE_FIELDS|(bal_group_seq_no IS NULL AND total_seq_no IS NULL AND tran_seq_no IS NULL) OR (bal_group_seq_no IS NOT NULL AND total_seq_no<br>IS NULL AND tran_seq_no IS NULL) OR (bal_group_seq_no IS NOT NULL AND total_seq_no IS NULL AND tran_seq_no IS NOT NULL) OR<br>(bal_group_seq_no IS NOT NULL AND total_seq_no IS NOT NULL AND tran_seq_no IS NULL) OR (bal_group_seq_no IS NULL AND<br>total_seq_no IS NOT NULL AND tran_seq_no IS NULL) OR (bal_group_seq_no IS NULL AND total_seq_no IS NULL AND tran_seq_no IS NOT<br>NULL)<br>|
||CHK_SA_ERROR_STORE_OVERRIDE|STORE_OVERRIDE_IND = 'N'<br>|
|Column Level|HQ_OVERRIDE_IND||

---

## Table: SA_ERROR_CODES

**Description:** This table contains specific error code information.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ERROR_CODE | P |  | Y | VARCHAR (25) | This field contains a unique error code. |
| 2 | ERROR_DESC |  |  | Y | VARCHAR (255) | This field contains the error description. |
| 3 | TARGET_FORM |  |  |  | VARCHAR (6) | This field contains the form that the user should navigate to in order to fix the current error. Valid values are on the code tables with a code type of FORM. |
| 4 | TARGET_TAB |  |  |  | VARCHAR (6) | This field contains the tab to navigate to in the given form. This field is only used if the form field contains a form that contains a tabular canvas. Valid values are on the code tables with a code type of TABS. |
| 5 | REC_SOLUTION |  |  |  | VARCHAR (255) | This field contains the recommended solution for the error. |
| 6 | STORE_OVERRIDE_IND |  |  | Y | VARCHAR (1) | Indicates whether or not a store employee has permission to override the error. Valid values are Yes or No. |
| 7 | HQ_OVERRIDE_IND |  |  | Y | VARCHAR (1) | This field indicates whether or not a head office employee can override the error. |
| 8 | REQUIRED_IND |  |  | Y | VARCHAR (1) | Indicates whether or not the error code is system required. |
| 9 | SHORT_DESC |  |  | Y | VARCHAR (40 BYTE) | This field contains the short error description. |
| 10 | MASS_RES_POP_UP_TYPE |  |  |  | VARCHAR (20 ) | Contains the Mass Resolution Popup Type. It can be POP_UP_DEL, POP_UP_REPLACE or blank. |
| 11 | ERROR_FIX_TABLE |  |  |  | VARCHAR (30 ) | Contains the table name that contains the record or field that causes the error. |
| 12 | ERROR_FIX_COLUMN |  |  |  | VARCHAR (30 ) | Contains the column name of the field that causes the error. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SA_ERROR_CODES|PK||||ERROR_CODE|ASC|

### Constraints

|Type|Column / Constraint<br>Name|Details|
|---|---|---|
|Column Level|STORE_OVERRIDE_IND||
||HQ_OVERRIDE_IND||
||REQUIRED_IND||

---

## Table: SA_ERROR_CODES_TL

**Description:** This is the translation table for SA_ERROR_CODES table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | ERROR_CODE | P | F | Y | VARCHAR (25) | This field contains a unique error code. |
| 3 | ERROR_DESC |  |  | Y | VARCHAR (255) | This field contains the error description. |
| 4 | REC_SOLUTION |  |  |  | VARCHAR (255) | This field contains the recommended solution for the error. |
| 5 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 6 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 7 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 8 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |
| 9 | SHORT_DESC |  |  | Y | VARCHAR (40 BYTE) | This field contains the short error description. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SA_ERROR_CODES_TL|PK||||LANG|ASC|
||||||ERROR_CODE|ASC|

---

## Table: SA_ERROR_IMPACT

**Description:** This table contains the association of error codes to error categories, defined by the systems that data is exported to.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ERROR_CODE | P | F | Y | VARCHAR (25) | This field contains a unique error code. |
| 2 | SYSTEM_CODE | P |  | Y | VARCHAR (6) | This field contains the error category code. Error categories are defined based on the types of exports in the system. For example, an RMS Export category, or an RDW Export category, etc. All errors for a particular category must be passed before any associated data can be |
| 3 | REQUIRED_IND |  |  | Y | VARCHAR (1) | Indicates whether or not the system impacted by the error is required. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SA_ERROR_IMPACT|PK||||ERROR_CODE|ASC|
||||||SYSTEM_CODE|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_SA_ERROR_IMPACT_REQ_IND|REQUIRED_IND IN ('Y','N')<br>|
|Column Level|REQUIRED_IND||

---

## Table: SA_ERROR_REV

**Description:** This table contains a record for every modification of an error generated during the automated audit process.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | STORE | P | F | Y | NUMERIC (10) | Store number to be used for table partitioning. |
| 2 | DAY | P | F | Y | NUMERIC (3) | Day number to be used for table partitioning. This is derived from the sa_store_day.business_date column by calling the function SA_DATE_HASH. |
| 3 | ERROR_SEQ_NO | P |  | Y | NUMERIC (20) | Contains a unique system generated sequence number used to distinguish between errors. |
| 4 | REV_NO | P | F | Y | NUMERIC (3) | This is an incremental counter used to identify the version of the error. |
| 5 | STORE_DAY_SEQ_NO |  | F | Y | NUMERIC (20) | The unique sequence number of the store-day for which this error occurred. |
| 6 | BAL_GROUP_SEQ_NO |  | F | Y | NUMERIC (20) | The unique sequence number of the balance group for which this error occurred. |
| 7 | TOTAL_SEQ_NO |  |  | Y | NUMERIC (20) | Contains the unique identifier of the total that the error is associated with. If this field contains a value, the tran_head_no field will not contain a value. An error can only be generated against a total or against a transaction, never against both. |
| 8 | VALUE_REV_NO |  |  |  | NUMERIC (3) | The revision of the total that is associated with the error. |
| 9 | TRAN_SEQ_NO |  | F | Y | NUMERIC (20) | Contains the sales audit systems transaction identifier that the error is associated with. If this field contains a value, the total_value_id field will not contain a value. An error can only be generated against a total or against a transaction, never against both. |
| 10 | TRAN_REV_NO |  |  |  | NUMERIC (3) | The revision of the transaction that is associated with this error |
| 11 | ERROR_CODE |  | F | Y | VARCHAR (25) | Contains the identifying code of the error that was generated. |
| 12 | KEY_VALUE_1 |  |  |  | NUMERIC (4) | Contains the identifying number of the record that is in error. If the error is a Transaction Header error or Total error, this field will be empty. If the error is a Transaction Tender error, this field will contain the Tender Sequence number. If the error is a Transaction Item error, this field will contain the Item Sequence number. If the error is a Transaction Item Discount error, this field will contain the Item Sequence number. If the error is a Transaction Tax error, this field will contain the Tax Sequence number. |
| 13 | KEY_VALUE_2 |  |  |  | NUMERIC (4) | Contains the identifying number of the record that is in error. If the error is a Transaction Item Discount error, this field will contain the Discount Sequence number, otherwise this field will be empty. |
| 14 | REC_TYPE |  |  | Y | VARCHAR (6) | Contains the type of detail record that is in error. The code type for this field is SART. |
| 15 | STORE_OVERRIDE_IND |  |  | Y | VARCHAR (1) | Indicates whether or not a store employee has permission to override the error. Valid values are Yes or No. |
| 16 | HQ_OVERRIDE_IND |  |  | Y | VARCHAR (1) | Indicates whether or not a headquarters employee has permission to override the error. Valid values are Yes or No. |
| 17 | UPDATE_ID |  |  | Y | VARCHAR (30) | Contains the user identification of the person that last updated the error. |
| 18 | UPDATE_DATETIME |  |  | Y | Date | Contains the date when the error was last updated. |
| 19 | ORIG_VALUE |  |  |  | VARCHAR (70) | Contains the value that is in error. |
| 20 | ORIG_CC_NO |  |  |  | VARCHAR (40) | Contains the original cc_no value that is in error. If credit card security has been applied, the SA_ERROR_REV_CC_SEC policy will restrict this column for users that are not granted the CC_ACCESS role. The column will appear NULL to these users. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SA_ERROR_REV|PK||||ERROR_SEQ_NO|ASC|
||||||REV_NO|ASC|
||||||STORE|ASC|
||||||DAY|ASC|
|SA_ERROR_REV_I3|||||TRAN_SEQ_NO|ASC|
||||||TRAN_REV_NO|ASC|
||||||STORE|ASC|
||||||DAY|ASC|
|SA_ERROR_REV_I5|UN||||REV_NO|ASC|
||||||STORE_DAY_SEQ_NO|ASC|
||||||BAL_GROUP_SEQ_NO|ASC|
||||||TOTAL_SEQ_NO|ASC|
||||||VALUE_REV_NO|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
||||||TRAN_SEQ_NO|ASC|
||||||TRAN_REV_NO|ASC|
||||||ERROR_CODE|ASC|
||||||KEY_VALUE_1|ASC|
||||||KEY_VALUE_2|ASC|
||||||REC_TYPE|ASC|
||||||STORE|ASC|
||||||DAY|ASC|
|SA_ERROR_REV_I2|||||TOTAL_SEQ_NO|ASC|
||||||VALUE_REV_NO|ASC|
|SA_ERROR_REV_I1|||||STORE_DAY_SEQ_NO|ASC|
||||||BAL_GROUP_SEQ_NO|ASC|
|SA_ERROR_REV_I4|||||ERROR_CODE|ASC|
|PK_SA_ERROR_REV|UN||||ERROR_SEQ_NO|ASC|
||||||REV_NO|ASC|
||||||STORE|ASC|
||||||DAY|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_SA_ERROR_REV_THREE_FIELDS|(bal_group_seq_no IS NULL AND total_seq_no IS NULL AND tran_seq_no IS NULL) OR (bal_group_seq_no IS NOT NULL AND<br>total_seq_no IS NULL AND tran_seq_no IS NULL) OR (bal_group_seq_no IS NOT NULL AND total_seq_no IS NULL AND tran_seq_no IS<br>NOT NULL) OR (bal_group_seq_no IS NOT NULL AND total_seq_no IS NOT NULL AND tran_seq_no IS NULL) OR (bal_group_seq_no IS<br>NULL AND total_seq_no IS NOT NULL AND tran_seq_no IS NULL) OR (bal_group_seq_no IS NULL AND total_seq_no IS NULL AND<br>tran_seq_no IS NOT NULL)<br>|
||CHK_SA_ERROR_REV_STORE_OVERRID|STORE_OVERRIDE_IND = 'N'|






|Type|Column / Constraint Name|Details|
|---|---|---|
||||
|Column Level|HQ_OVERRIDE_IND||

---

## Table: SA_ERROR_TEMP

**Description:** This table holds temporary information used during the auditing process.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | STORE | P |  | Y | NUMERIC (10) | Store number to be used for table partitioning. |
| 2 | DAY | P |  | Y | NUMERIC (3) | Day number to be used for table partitioning. This is derived from the sa_store_day.business_date column by calling the function SA_DATE_HASH. |
| 3 | ERROR_SEQ_NO | P |  | Y | NUMERIC (20) | Contains a unique system generated sequence number used to distinguish between errors. |
| 4 | STORE_DAY_SEQ_NO |  |  | Y | NUMERIC (20) | The unique sequence number of the store-day for which this error occurred. |
| 5 | BAL_GROUP_SEQ_NO |  |  |  | NUMERIC (20) | The unique sequence number of the balance group for which this error occurred. |
| 6 | TOTAL_SEQ_NO |  |  |  | NUMERIC (20) | Contains the unique identifier of the total that the error is associated with. If this field contains a value, the tran_head_no field will not contain a value. An error can only be generated against a total or against a transaction, never against both. |
| 7 | TRAN_SEQ_NO |  |  |  | NUMERIC (20) | Contains the sales audit systems transaction identifier that the error is associated with. If this field contains a value, the total_value_id field will not contain a value. An error can only be generated against a total or against a transaction, never against both. |
| 8 | ERROR_CODE |  |  | Y | VARCHAR (25) | Contains the identifying code of the error that was generated. |
| 9 | KEY_VALUE_1 |  |  |  | NUMERIC (4) | Contains the identifying number of the record that is in error. If the error is a Transaction Header error or Total error, this field will be empty. If the error is a Transaction Tender error, this field will contain the Tender Sequence number. If the error is a Transaction Item error, this field will contain the Item Sequence number. If the error is a Transaction Item Discount error, this field will contain the Item Sequence number. If the error is a Transaction Tax error, this field will contain the Tax Sequence number. |
| 10 | KEY_VALUE_2 |  |  |  | NUMERIC (4) | Contains the identifying number of the record that is in error. If the error is a Transaction Item Discount error, this field will contain the Discount Sequence number, otherwise this field will be empty. |
| 11 | REC_TYPE |  |  | Y | VARCHAR (6) | Contains the type of detail record that is in error. The code type for this field is SART. |
| 12 | STORE_OVERRIDE_IND |  |  | Y | VARCHAR (1) | Indicates whether or not a store employee has permission to override the error. Valid values are Yes or No. |
| 13 | HQ_OVERRIDE_IND |  |  | Y | VARCHAR (1) | Indicates whether or not a headquarters employee has permission to override the error. Valid values are Yes or No. |
| 14 | UPDATE_ID |  |  | Y | VARCHAR (30) | Contains the user identification of the person that last updated the error. |
| 15 | UPDATE_DATETIME |  |  | Y | Date | Contains the date when the error was last updated. |
| 16 | ORIG_VALUE |  |  |  | VARCHAR (50) | Contains the value that is in error. |
| 17 | ORIG_CC_NO |  |  |  | VARCHAR (40) | Contains the original cc_no value that is in error. If credit card security has been applied, the SA_ERROR_TEMP_CC_SEC policy will restrict this column for users that are not granted the CC_ACCESS role. The column |

---

## Table: SA_ERROR_WKSHT

**Description:** This table holds errors generated by the auditing process for audit rules that have not been approved yet.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | STORE | P |  | Y | NUMERIC (10) | Store number to be used for table partitioning. |
| 2 | DAY | P |  | Y | NUMERIC (3) | Day number to be used for table partitioning. This is derived from the sa_store_day.business_date column by calling the function SA_DATE_HASH. |
| 3 | ERROR_SEQ_NO | P |  | Y | NUMERIC (20) | Contains a unique system generated sequence number used to distinguish between errors. |
| 4 | STORE_DAY_SEQ_NO |  |  | Y | NUMERIC (20) | The unique sequence number of the store-day for which this error occurred. |
| 5 | BAL_GROUP_SEQ_NO |  |  |  | NUMERIC (20) | The unique sequence number of the balance group for which this error occurred. |
| 6 | TOTAL_SEQ_NO |  |  |  | NUMERIC (20) | Contains the unique identifier of the total that the error is associated with. If this field contains a value, the tran_head_no field will not contain a value. An error can only be generated against a total or against a transaction, never against both. |
| 7 | TRAN_SEQ_NO |  |  |  | NUMERIC (20) | Contains the sales audit systems transaction identifier that the error is associated with. If this field contains a value, the total_value_id field will not contain a value. An error can only be generated against a total or against a transaction, never against both. |
| 8 | ERROR_CODE |  |  | Y | VARCHAR (25) | Contains the identifying code of the error that was generated. |
| 9 | KEY_VALUE_1 |  |  |  | NUMERIC (4) | Contains the identifying number of the record that is in error. If the error is a Transaction Header error or Total error, this field will be empty. If the error is a Transaction Tender error, this field will contain the Tender Sequence number. If the error is a Transaction Item error, this field will contain the Item Sequence number. If the error is a Transaction Item Discount error, this field will contain the Item Sequence number. If the error is a Transaction Tax error, this field will contain the Tax Sequence number. |
| 10 | KEY_VALUE_2 |  |  |  | NUMERIC (4) | Contains the identifying number of the record that is in error. If the error is a Transaction Item Discount error, this field will contain the Discount Sequence number, otherwise this field will be empty. |
| 11 | REC_TYPE |  |  | Y | VARCHAR (6) | Contains the type of detail record that is in error. The code type for this field is SART. |
| 12 | STORE_OVERRIDE_IND |  |  | Y | VARCHAR (1) | Indicates whether or not a store employee has permission to override the error. Valid values are Yes or No. |
| 13 | HQ_OVERRIDE_IND |  |  | Y | VARCHAR (1) | Indicates whether or not a store employee has permission to override the error. Valid values are Yes or No. |
| 14 | UPDATE_ID |  |  | Y | VARCHAR (30) | Contains the user identification of the person that last updated the error. |
| 15 | UPDATE_DATETIME |  |  | Y | Date | Contains the date when the error was last updated. |
| 16 | ORIG_VALUE |  |  |  | VARCHAR (50) | Contains the value that is in error. |
| 17 | ORIG_CC_NO |  |  |  | VARCHAR (40) | Contains the original cc_no value that is in error. If credit card security has been applied, the SA_ERROR_WKSHT_CC_SEC policy will restrict this column for users that are not granted the CC_ACCESS role. The |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SA_ERROR_WKSHT|PK||||ERROR_SEQ_NO|ASC|
||||||STORE|ASC|
||||||DAY|ASC|
|SA_ERROR_WKSHT_I4|||||ERROR_CODE|ASC|
|SA_ERROR_WKSHT_I2|||||TOTAL_SEQ_NO|ASC|
|SA_ERROR_WKSHT_I5|||||STORE_DAY_SEQ_NO|ASC|
||||||BAL_GROUP_SEQ_NO|ASC|
||||||TOTAL_SEQ_NO|ASC|
||||||TRAN_SEQ_NO|ASC|
||||||ERROR_CODE|ASC|
||||||KEY_VALUE_1|ASC|
||||||KEY_VALUE_2|ASC|
||||||ORIG_VALUE|ASC|
|SA_ERROR_WKSHT_I3|||||TRAN_SEQ_NO|ASC|
|PK_SA_ERROR_WKSHT|UN||||ERROR_SEQ_NO|ASC|
||||||STORE|ASC|
||||||DAY|ASC|

---

## Table: SA_PARM

**Description:** The PARM table contains the base information on the metadata parameters. These parameters are the central data type for the metadata repository and are used extensively throughout ARI. In fact,except for an occasional glimpse of a REALM, the parameter is the only data type that the business analyst will see in working with ARI.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PARM_ID | P |  | Y | VARCHAR (15) | The PARM_ID filed is probably the most common field within ARI since it is used to link the other data structures back to metadata references. PARM_ID is simply a number (up to 10 digits long) prefixed with the word PNUM. The number is generated by an Oracle sequence. An example: PARM2342 |
| 2 | REALM_ID |  | F | Y | VARCHAR (15) | Reference to the realm containing this parameter. |
| 3 | PHYSICAL_NAME |  |  | Y | VARCHAR (120) | Name used within the physical realm containing the parameter. For an Oracle table or view this would be the column name. For a function this would be an input or output parameter. For actions with sequenced |
| 4 | SEQ_NO |  |  | Y | NUMERIC (8) | Used to avoid having active parameter and deactivated parameters with the same PHYSICAL_NAME cause a unique key violation. |
| 5 | PARM_TYPE_ID |  | F | Y | VARCHAR (15) | References the underlying parameter type. |
| 6 | REALM_KEY_IND |  |  | Y | VARCHAR (1) | Indicates whether the parameter is a key parameter for referencing the realm. For a table this is a part of the primary key, for a PL/SQL function this is an input parameter, and so on. In order to resolve a given parameter, it is necessary to have values for all of the realm input parameters for the realm containing that particular parameter. Those values can then be fed to a function or used as key values in a SQL query to retrieve the desired parameter value. |
| 7 | ACTIVE_IND |  |  | Y | VARCHAR (1) | Indicates whether the parameter is currently valid. Because of the complex interrelationships between parameters, exceptions, events, rules, etc., ARI uses an abandon in place strategy for dealing with obsolete data. Rather than deleting a parameter (or event or exception), ARI simply marks it as being no longer active. An inactive parameter is no longer available through the GUI. A parameter is deactivated when it is changed (the old version is deactivated and a new version takes its place) or when its realm is deactivated. |
| 8 | DISPLAY_NAME |  |  | Y | VARCHAR (120) | Name displayed in the GUI. If the name of the parameter is changed in the GUI, this is the value that gets altered, not PHYSICAL_NAME. |
| 9 | OVERRIDE_IND |  |  | Y | VARCHAR (1) | For functions and actions, this indicates whether this parameter will have a constant value, which is stored in OVERRIDE_VALUE. For all other realm types, this is N. |
| 10 | OVERRIDE_VALUE |  |  |  | VARCHAR (2000) | For functions and actions, contains the value of a constant parameter. |
| 11 | CURRENCY_PARM_ID |  | F |  | VARCHAR (15) | Points to the parameter ID that provides the currency mapping for this parameter. |
| 12 | DECODE_PARM_ID |  | F |  | VARCHAR (15) | Some parameter values can be expanded by looking up values in the appropriated decode table. For example, STORE.STORE can be replaced by STORE.NAME by using the STORE.STORE key value to reference the underlying name field in the STORE table. |
| 13 | LOOKUP_IND |  |  | Y | VARCHAR (1) | Indicates whether the parameter type can be used as an input for a lookup function. Only one parameter per parameter type may have this set to Y. |
| 14 | GROUP_LOOKUP_IND |  |  | Y | VARCHAR (1) | Indicates whether the parameter type can be used to drive a group lookup in the Users/Groups function. Only one parameter per parameter type may have this set to Y. |
| 15 | ERROR_IND |  |  | Y | VARCHAR (1) | For actions, indicates whether or not the action parameter is used for an error return value. |
| 16 | COMMENT_IND |  |  | Y | VARCHAR (1) | For actions, indicates whether or not the action parameter is used for a user inputted message. |
| 17 | CURRENT_USER_IND |  |  | Y | VARCHAR (1) | For actions, indicates whether or not the action parameter is used for the current user. |
| 18 | VALUE_COLUMN |  |  |  | VARCHAR (30) | For actions, holds the ID of the column being selected in an LOV query of valid values for the action parameter. For example, the column would hold ORDER_NO if the action needs a submitted order number. |
| 19 | DECODE_COLUMN |  |  |  | VARCHAR (30) | For actions, holds the ID of the decode column being selected in an LOV query. For example, BUYER_NAME would be the decode column for the BUYER_NO column. |
| 20 | FROM_CLAUSE |  |  |  | VARCHAR (2000) | For actions, holds the ID of the table for the column being selected in an LOV query of valid values for the action parameter. For example, the column would hold ORDHEAD if the action needs a submitted order number. |
| 21 | WHERE_CLAUSE |  |  |  | VARCHAR (2000) | For actions, holds the condition of the column being selected in an LOV query of valid values for the action parameter. For example, the column would hold ORDER_STATUS=7 if the action needs a submitted order number. |
| 22 | LOOKUP_PARM_ID |  | F |  | VARCHAR (15) | ID of the parameter that a lookup parameter will derive its value from. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SA_PARM|PK||||PARM_ID|ASC|
|UK_SA_PARM|UK||||REALM_ID|ASC|
||||||PHYSICAL_NAME|ASC|
||||||SEQ_NO|ASC|
||||||PARM_TYPE_ID|ASC|
|SA_PARM_I4|||||PARM_TYPE_ID|ASC|
|SA_PARM_I3|||||CURRENCY_PARM_ID|ASC|
|SA_PARM_I2|||||LOOKUP_PARM_ID|ASC|
|SA_PARM_I1|||||DECODE_PARM_ID|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_SA_PARM_ACTIVE_IND|active_ind in ('Y','N')<br>|
||CHK_SA_PARM_COMMENT_IND|comment_ind in ('Y', 'N')<br>|
||CHK_SA_PARM_CURRENT_USER_IND|current_user_ind in ('Y', 'N')<br>|
||CHK_SA_PARM_ERROR_IND|error_ind in ('Y','N')<br>|
||CHK_SA_PARM_GROUP_LOOKUP_IND|group_lookup_ind in ('Y', 'N')<br>|






|Type|Column / Constraint Name|Details|
|---|---|---|
||CHK_SA_PARM_LOOKUP_IND|lookup_ind in ('Y', 'N')<br>|
||CHK_SA_PARM_OVERRIDE_IND|override_ind in ('Y', 'N')<br>|
||CHK_SA_PARM_REALM_KEY_IND|realm_key_ind in ('Y','N')<br>|
|Column Level|REALM_KEY_IND||
||ACTIVE_IND||
||OVERRIDE_IND||
||LOOKUP_IND||
||ERROR_IND||
||COMMENT_IND||
||CURRENT_USER_IND||

---

## Table: SA_PARM_TYPE

**Description:** Parameter types group parameters by physical data representation and functional use in the system. They are a self-referencing recursive hierarchy. Parameter types are similar to Oracle domains, but their hierarchical nature allows a more specific type of parameter to be used in place of a more general one but not the other way around. Primary uses of this hierarchy in the system are with respect to SKUs and specific SKU types and Locations and the specific location types (store, warehouse).

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PARM_TYPE_ID | P |  | Y | VARCHAR (15) | PARM_TYPE_ID is simply a number (up to 10 digits long) prefixed with the word PTYPE. The number is generated by an Oracle sequence. |
| 2 | PARM_TYPE_NAME |  |  | Y | VARCHAR (120) | Contains the name of the parameter type. |
| 3 | SEQ_NO |  |  | Y | NUMERIC (8) | Used to avoid having active parameter types and deactivated types with the same PHYSICAL_NAME cause a unique key violation. |
| 4 | PARENT_PARM_TYPE_ID |  | F |  | VARCHAR (15) | This is required for all user defined parameter types. There will be 5 predefined base types from which all other parameter types are derived: VARCHAR2, DATE, NUMBER, LONG and BOOLEAN. These will be uneditable and the only parameter types with NULL in the parent field. |
| 5 | ACTIVE_IND |  |  | Y | VARCHAR (1) | Indicates whether the parameter is currently valid. Because of the complex interrelationships between parameters, exceptions, events, rules, etc., ARI uses an abandon in place strategy for dealing with obsolete data. Rather than deleting a parameter (or event or exception), ARI simply marks it as being no longer active. An inactive parameter is no longer available through the GUI. A parameter is deactivated when it is changed (the old version is deactivated and a new version takes its place) or when its realm is deactivated. |
| 6 | DATA_TYPE |  |  | Y | VARCHAR (8) | This maps the parameter type back to one of Oracles primary data types. When a new parameter type is created, the default values are set to those of its parent. |
| 7 | DATA_LENGTH |  |  | Y | NUMERIC (4) | Holds the length of the parameter type. |
| 8 | DATA_PRECISION |  |  |  | NUMERIC (4) | Holds the precision of a NUMBER based parameter type. |
| 9 | DATA_SCALE |  |  |  | NUMERIC (4) | Holds the scale of a NUMBER bases parameter type. |
| 10 | CODE_TYPE |  | F |  | VARCHAR (4) | Some parameters contain values that are common enough that separate decode tables are maintained to annotate output values. If this field is filled in, the output values is indirected through the indicated code table. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SA_PARM_TYPE|PK||||PARM_TYPE_ID|ASC|
|UK_SA_PARM_TYPE|UK||||PARM_TYPE_NAME|ASC|
||||||SEQ_NO|ASC|
|SA_PARM_TYPE_I2|||||PARENT_PARM_TYPE_ID|ASC|
|SA_PARM_TYPE_I1|||||CODE_TYPE|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_SA_PARM_TYPE_ACTIVE_IND|active_ind in ('Y', 'N')<br>|
||CHK_SA_PARM_TYPE_DATA_TYPE|DATA_TYPE in<br>('VARCHAR2','NUMBER','DATE','LONG','LONG RAW','BOOLEAN','ROWID')<br>|
|Column Level|ACTIVE_IND||
||DATA_TYPE||

---

## Table: SA_RULE_COMP

**Description:** This table contains the component level information for rules in the system. A rule component is a series of conditions joined together by or.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | RULE_ID | P | F | Y | VARCHAR (10) | User entered id to uniquely identify the rule being calculated. |
| 2 | RULE_REV_NO | P | F | Y | NUMERIC (3) | Sequential number to uniquely identify the generation of the rule being calculated. This number will increment as a user edits an existing rule definition. |
| 3 | RULE_COMP_SEQ_NO | P |  | Y | NUMERIC (3) | Contains the sequence number that identifies the rule component within the rule. |
| 4 | VR_ID |  |  | Y | VARCHAR (10) | The metadata virtual row associated with the rule. |
| 5 | VR_REV_NO |  |  | Y | NUMERIC (3) | The revision of the metadata virtual row associated with the rule. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SA_RULE_COMP|PK||||RULE_ID|ASC|
||||||RULE_REV_NO|ASC|
||||||RULE_COMP_SEQ_NO|ASC|

---

## Table: SA_RULE_COMP_RESTRICTIONS

**Description:** This table contains the header level information for rules definitions in the system.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | RULE_ID | P | F | Y | VARCHAR (10) | User entered id to uniquely identify the rule being calculated. |
| 2 | RULE_REV_NO | P | F | Y | NUMERIC (3) | Sequential number to uniquely identify the generation of the rule being calculated. This number will increment as a user edits an existing rule definition. |
| 3 | RULE_COMP_SEQ_NO | P | F | Y | NUMERIC (3) | Contains the sequence number that identifies the rule component within the rule. |
| 4 | RES_SEQ_NO | P |  | Y | NUMERIC (3) | Sequence number to ensure a primary key. |
| 5 | PARM_SEQ_NO_1 |  |  | Y | NUMERIC (3) | Identifies the parameter that drives the filtering condition. |
| 6 | RES_OPERATOR |  |  | Y | VARCHAR (6) | Any operator valid in an SQL statement, including =, <, >, IN, NOT IN, IS NULL, IS NOT NULL, BETWEEN, etc. Valid values can be found in the code_type = SACO. |
| 7 | PARM_SEQ_NO_2 |  |  |  | NUMERIC (3) | Identifies the parm on the right hand side of the expression. |
| 8 | PARM_SEQ_NO_3 |  |  |  | NUMERIC (3) | Identifies the second parm on the right hand side of the expression (used only if the Res_Operator is between or not between). |
| 9 | RES_CONSTANT_2 |  |  |  | VARCHAR (500) | String specifying the right hand side of the comparison. |
| 10 | RES_CONSTANT_3 |  |  |  | VARCHAR (500) | String specifying the second part of the right hand side of the comparison (used only if the Res_Operator is between or not between). |
| 11 | TOLERANCE |  |  |  | NUMERIC (3) | Contains the numeric amount of the tolerance to be used in a rule comparison. If the amount being compared is within + - this value, an error will not be created. |
| 12 | TOLERANCE_TYPE |  |  |  | VARCHAR (6) | Contains the type of the tolerance (amt, pct, etc.) Valid values can be found on the code_detail table with the code_type = SATT. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SA_RULE_COMP_RESTRICTIONS|PK||||RULE_ID|ASC|
||||||RULE_REV_NO|ASC|
||||||RULE_COMP_SEQ_NO|ASC|
||||||RES_SEQ_NO|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_SA_RULE_COMP_REST_RES_OPER|res_operator in ('=','!=','<','>','<=','>=','IN','NOT IN','NULL','!NULL','B','NB','TOL','!TOL')<br>|
||CHK_SA_RULE_COMP_REST_TOL_TYPE|tolerance_type in ('A','P')<br>|
|Column Level|RES_OPERATOR||

---

## Table: SA_RULE_ERRORS

**Description:** This table contains the header level information for rules definitions in the system.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | RULE_ID | P | F | Y | VARCHAR (10) | User entered id to uniquely identify the rule being calculated. |
| 2 | RULE_REV_NO | P | F | Y | NUMERIC (3) | Sequential number to uniquely identify the generation of the rule being calculated. This number will increment as a user edits an existing rule definition. |
| 3 | ERROR_CODE | P | F | Y | VARCHAR (25) | Contains the code of the error associated with this rule component. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SA_RULE_ERRORS|PK||||RULE_ID|ASC|
||||||RULE_REV_NO|ASC|
||||||ERROR_CODE|ASC|
|SA_RULE_ERRORS_I1|||||ERROR_CODE|ASC|

---

## Table: SA_RULE_HEAD

**Description:** This table contains the header level information for all rules in the system.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | RULE_ID | P |  | Y | VARCHAR (10) | User entered id to uniquely identify the rule being calculated. |
| 2 | RULE_REV_NO | P |  | Y | NUMERIC (3) | Sequential number to uniquely identify the generation of the rule being calculated. This number will increment as a user edits an existing rule definition. |
| 3 | RULE_NAME |  |  | Y | VARCHAR (255) | User defined name for the rule. |
| 4 | UPDATE_DATETIME |  |  | Y | Date | Contains the date and time the rule definition was initially created. Used to determine the order the definitions should occur. |
| 5 | UPDATE_ID |  |  | Y | VARCHAR (30) | Stored with each revision of the rule. Allows the user to track who has edited rule definitions. |
| 6 | RULE_STOP_IND |  |  | Y | VARCHAR (1) | Indicates that rule failure should stop all rule processing. Valid values are Y - yes and N - no. |
| 7 | WIZ_IND |  |  | Y | VARCHAR (1) | Indicates that the rule will be created using the rule wizard. Valid values are Y - yes and N - no. |
| 8 | START_BUSINESS_DATE |  |  | Y | Date | Date this version of the rule definition becomes effective. |
| 9 | END_BUSINESS_DATE |  |  |  | Date | Date this version of the rule definition becomes ineffective. |
| 10 | PRES_ABS_IND |  |  | Y | VARCHAR (1) | Indicates whether the presence or absence of the condition should trigger an error. |
| 11 | TOTAL_TRAN_IND |  |  | Y | VARCHAR (2) | Indicates whether the errors produced by the rule apply to total or transaction data. Valid values are TO - total and TR - transction and BG-Balance Group Level Error. |
| 12 | BAL_LEVEL |  |  | Y | VARCHAR (1) | Inidcates the balancing level to which the rule applies. Valid values are S - store, C - cashier and R - register. |
| 13 | KEY_VAL_1_PARM_SEQ_NO |  |  |  | NUMERIC (3) | Contains the sequence number of the parm in the rule definition. This value of this parm will be used in the sa_error key_value_1. |
| 14 | KEY_VAL_2_PARM_SEQ_NO |  |  |  | NUMERIC (3) | Contains the sequence number of the parm in the rule definition. This value of this parm will be used in the sa_error key_value_2. |
| 15 | EXECUTE_ORDER |  |  | Y | VARCHAR (6) | Contains the order grouping in which the rule should be executed. |
| 16 | REC_TYPE |  |  | Y | VARCHAR (6) | This field will hold the record type to which the error applies. |
| 17 | STATUS |  |  | Y | VARCHAR (6) | This field will hold the status of the rule definition. If the rule not in Approved status, the errors it produces will be written to the sa_errors_wksht table. If the rule is in approved status, the errors will be written to the sa_errors table. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SA_RULE_HEAD|PK||||RULE_ID|ASC|
||||||RULE_REV_NO|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_SA_RULE_HEAD_BAL_LEVEL|bal_level in ('S','R','C')<br>|
||CHK_SA_RULE_HEAD_PRES_ABS_IND|pres_abs_ind in ('P','A')<br>|
||CHK_SA_RULE_HEAD_RULE_STOP_IND|rule_stop_ind in ('Y','N')<br>|
||CHK_SA_RULE_HEAD_TOTAL_TRAN_IN|total_tran_ind in ('TO','TR','ST','BG')<br>|
||CHK_SA_RULE_HEAD_WIZ_IND|wiz_ind in ('Y','N')<br>|
|Column Level|RULE_STOP_IND||
||WIZ_IND||
||PRES_ABS_IND||
||TOTAL_TRAN_IND||
||BAL_LEVEL||

---

## Table: SA_RULE_HEAD_TL

**Description:** This is the translation table for SA_RULE_HEAD table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | RULE_ID | P | F | Y | VARCHAR (10) | User entered id to uniquely identify the rule being calculated. |
| 3 | RULE_REV_NO | P | F | Y | NUMERIC (3) | Sequential number to uniquely identify the generation of the rule being calculated. This number will increment as a user edits an existing rule definition. |
| 4 | RULE_NAME |  |  | Y | VARCHAR (255) | User defined name for the rule. |
| 5 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 6 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 7 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 8 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SA_RULE_HEAD_TL|PK||||LANG|ASC|
||||||RULE_ID|ASC|
||||||RULE_REV_NO|ASC|

---

## Table: SA_RULE_LOC_TRAIT

**Description:** This table contains the location traits associated with a given rule.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | RULE_ID | P | F | Y | VARCHAR (10) | User entered id to uniquely identify the rule being calculated. |
| 2 | RULE_REV_NO | P | F | Y | NUMERIC (3) | Sequential number to uniquely identify the generation of the rule being calculated. This number will increment as a user edits an existing rule definition. |
| 3 | LOC_TRAIT | P | F | Y | NUMERIC (4) | Location trait for which the rule is active. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SA_RULE_LOC_TRAIT|PK||||RULE_ID|ASC|
||||||RULE_REV_NO|ASC|
||||||LOC_TRAIT|ASC|
|SA_RULE_LOC_TRAIT_I1|||||LOC_TRAIT|ASC|
