# RMS System Codes, Currencies & Options Configuration Datamodel - Physical Data Model Reference

## Table: ARI_INTERFACE_TEST

**Description:** This table is used for testing the ARI API and for controling the interface behavior when ARI is not installed. It simulates users being set as ARI users and as having new alerts or not having new alerts.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | IS_USER_IND |  |  | Y | VARCHAR (1) | This column is used to simulate users as ARI users for the ARI interface. |
| 2 | NEW_ALERT_IND |  |  | Y | VARCHAR (1) | This column indicates whether users have new alerts in the ARI interface. |

---

## Table: BATCH_ERROR

**Description:** This table contains one row each error that occurs during the running of the Oracle Retail batch programs. The information written to this table is used to report on what type of errors occurred within thesystem and what data was affected. NOTE: No primary key is associated with this table because the err_date field does not track time in small enough increments to ensure uniqueness.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROGRAM |  |  | Y | VARCHAR (255) | Contains the name of the Oracle Retail batch program where the error occurred. |
| 2 | ERR_DATE |  |  | Y | Date | Contains the system date when the Oracle Retail batch program encountered the error. |
| 3 | FUNCTION |  |  | Y | VARCHAR (255) | Contains the C function within the Oracle Retail batch program where the error occurred. |
| 4 | TABLE_NAME |  |  |  | VARCHAR (255) | Contains the Oracle Retail table being accessed or updated when the error occurred for SQL type errors. |
| 5 | ERR_TYPE |  |  | Y | VARCHAR (1) | Indicates whether the error is related to an SQL call to the database S or is a file related error F. |
| 6 | ERR_CODE |  |  | Y | VARCHAR (255) | Contains the Oracle error number or Oracle Retail defined number uniquely identifying what type of error occurred. |
| 7 | ERR_MSG |  |  | Y | VARCHAR (255) | Contains the message describing the error that has occurred and the Oracle or Oracle Retail error code number. The Oracle SQL error message will be used for SQL errors and a defined Oracle Retail specific message will be used for errors relating to function processing, file handling, stored procedures, or EDI processing. |
| 8 | ERR_DATA |  |  | Y | VARCHAR (2000) | Contains a character string used to hold any relevant data at the time of the error. Common uses include passing the current processing SKU, store, etc. to the error routine to assist in debugging the process. |

---

## Table: CALENDAR

**Description:** This table contains one row for each 4_5_4 month. This table is populated by a UNIX script during installation of the system and should be modified by the database administrator to coincide with thecalendar being used at the client site.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | FIRST_DAY |  |  | Y | Date | Contains the first day of the 4-5-4 month. |
| 2 | YEAR_454 | P |  | Y | NUMERIC (4) | Contains the year that the 4-5-4 month falls in. The 4-5-4 year begins on the first day of the first 4-5-4 month regardless of when the calendar year begins. |
| 3 | MONTH_454 | P |  | Y | NUMERIC (2) | Contains the number ranging from 1 to 12 which indicates the 4-5-4 month. |
| 4 | NO_OF_WEEKS |  |  | Y | NUMERIC (1) | Indicates whether there are 4 or 5 calendar weeks in the 4-5-4 month. |

---

## Table: CODES_MFQUEUE

**Description:** This table tracks changes in RMS that need to be published to the RIB.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SEQ_NO | P |  | Y | NUMERIC (15) | The sequence in which the records was placed in the CODES_MFQUEUE. Used to order the publication of messages to the RIB. |
| 2 | PUB_STATUS |  |  | Y | VARCHAR (1) | Contains the publish status for the message. |
| 3 | MESSAGE_TYPE |  |  | Y | VARCHAR (15) | Describes the action in RMS that is causing the message to be published to the RIB. |
| 4 | CODE_TYPE |  |  |  | VARCHAR (4) | Code_type from the code_head and code_detail tables. |
| 5 | MESSAGE |  |  | Y | CLOB | Contains the message that will be sent through the Integration Bus. |

---

## Table: CODE_DETAIL

**Description:** This table will contain code and decoded descriptions for each code type as defined in the CODE_HEAD table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | CODE_TYPE | P | F | Y | VARCHAR (4) | This field will contain a valid code type for the row. The valid code types are defined on the CODE_HEAD table. |
| 2 | CODE | P |  | Y | VARCHAR (6) | This field contains the code used in Oracle Retail which must be decoded for display in the on-line forms. |
| 3 | CODE_DESC |  |  | Y | VARCHAR (250) | This field contains the description associated with the code and code type. |
| 4 | REQUIRED_IND |  |  | Y | VARCHAR (1) | This field indicates whether or not the code is required. If the code is specified as required, then the user will not be able to delete the rows in the table for that code. |
| 5 | CODE_SEQ |  |  | Y | NUMERIC (4) | This is a number used to order the elements so that they appear consistently when using them to populate a list. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_CODE_DETAIL|PK||||CODE_TYPE|ASC|
||||||CODE|ASC|
|UK_CODE_DETAIL|UK||||CODE_TYPE|ASC|
||||||CODE_SEQ|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_CODE_DETAIL_CODE_SEQ|CODE_SEQ > 0<br>|
||CHK_CODE_DETAIL_REQUIRED_IND|REQUIRED_IND IN ('Y','N')<br>|
|Column Level|REQUIRED_IND||

---

## Table: CODE_DETAIL_TL

**Description:** This is the translation table for CODE_DETAIL table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | CODE_TYPE | P | F | Y | VARCHAR (4) | This field will contain a valid code type for the row. The valid code types are defined on the CODE_HEAD table. |
| 3 | CODE | P | F | Y | VARCHAR (6) | This column holds the code that is translated. |
| 4 | CODE_DESC |  |  | Y | VARCHAR (250) | This field contains the description associated with the code and code type. |
| 5 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 6 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 7 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 8 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_CODE_DETAIL_TL|PK||||LANG|ASC|
||||||CODE_TYPE|ASC|
||||||CODE|ASC|

---

## Table: CODE_HEAD

**Description:** This table contains one row for each different set of codes that is being defined. The code types for each set of codes is defined in the CODE_DETAIL table. This table will only contain codes that havestatic data.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | CODE_TYPE | P |  | Y | VARCHAR (4) | This field contains the code type which will serve as a grouping mechanism for the multiple codes stored on the CODE_DETAIL table. |
| 2 | CODE_TYPE_DESC |  |  | Y | VARCHAR (120) | This field will contain the description of the code type. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_CODE_HEAD|PK||||CODE_TYPE|ASC|

---

## Table: CONCESSION_DATA

**Description:** This table holds the rolled up sales history for concession items along with the outstanding concession amount. A row will be created for each item/date/store having concession transactions. This table is further used by external financial system for concessionaire billing.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  | F | Y | VARCHAR (25) | This column holds the unique alphanumeric identifier for the concession item sold at the store. |
| 2 | SUPPLIER |  | F | Y | NUMERIC (10) | This column contains the supplier for the concession item sold at the store. |
| 3 | STORE |  | F | Y | NUMERIC (10) | This column contains the location number where the concession sale occurred. This will always be a store location. |
| 4 | TRAN_DATE |  |  | Y | Date | This column contains the date of concession transaction. |
| 5 | CONCESSION_AMOUNT |  |  | Y | NUMERIC (20,4) | This column contains the outstanding monetary amount (excluding VAT) owed to the concession supplier. This is calculated based on the concession_rate defined in the item_supplier table as concession sales multiplied by concession rate. |
| 6 | PROCESSED_IND |  |  | Y | VARCHAR (1) | This column is set by external system to Y when the record has been uploaded. Valid values = Y or N |
| 7 | CONCESSION_AMOUNT_INCVAT |  |  | Y | NUMERIC (20,4) | This column contains the outstanding monetary amount (including VAT) owed to the concession supplier. This is calculated based on the concession_rate defined in the item_supplier table as concession sales multiplied by concession rate. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|CONCESSION_DATA_I2|||||STORE|ASC|
|CONCESSION_DATA_I1|||||ITEM|ASC|
|CONCESSION_DATA_I3|||||SUPPLIER|ASC|

---

## Table: CONTEXT_HELP

**Description:** This table contains mappings between the context strings and context numbers required by the Win Help function. This table is populated during installation of the system and should only be modified if the help is updated and recompiled.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TITLE |  |  | Y | VARCHAR (255) | Contains the title of the window with the word window attached to the end. For example, Item Selection window. |
| 2 | LANG | P |  | Y | NUMERIC (6) | Contains a number which uniquely identifies a language. |
| 3 | CONTEXT_STRING | P |  | Y | VARCHAR (255) | Contains the form name and window name in the format FM_NAMEW_NAME. For example, for the form pcgrp, this field would contain FM_PCGRPW_PCGRP. |
| 4 | CONTEXT_NO |  |  | Y | NUMERIC (6) | Contains a unique index number that is assigned by Doc-to-Help to identify help text. |
| 5 | FILE_NUMBER |  |  | Y | NUMERIC (1) | Contains the number of the Help Text volume in which information about the form exists. |
| 6 | WEB_PAGE |  |  |  | VARCHAR (255) | Contains the web page of a particular languages help file. |

---

## Table: CURRENCIES

**Description:** This table contains one row for each currency used in the system. Whenever a currency description is used by Oracle Retail, or a currency code is validated, it is always selected from this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | CURRENCY_CODE | P |  | Y | VARCHAR (3) | Contains a number which uniquely identifies the type of currency. |
| 2 | CURRENCY_DESC |  |  | Y | VARCHAR (120) | Contains a description of the currency. |
| 3 | CURRENCY_COST_FMT |  |  | Y | VARCHAR (35) | Contains the format in which to express the cost figures within Oracle Retail. |
| 4 | CURRENCY_RTL_FMT |  |  | Y | VARCHAR (35) | Contains the format in which to express the retail figures within Oracle Retail. |
| 5 | CURRENCY_COST_DEC |  |  | Y | NUMERIC (1) | Contains the number of decimals supported by the currency for costs. |
| 6 | CURRENCY_RTL_DEC |  |  | Y | NUMERIC (1) | Contains the number of decimals supported by the currency for retails. |
| 7 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |
| 8 | CREATE_DATETIME |  |  | Y | Date | This column holds the record creation date. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_CURRENCIES|PK||||CURRENCY_CODE|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_CURRENCIES_CURR_COST_DEC|CURRENCY_COST_DEC BETWEEN 0 AND 4<br>|
||CHK_CURRENCIES_CURR_RTL_DEC|CURRENCY_RTL_DEC BETWEEN 0 AND 4<br>|
|Column Level|CURRENCY_COST_DEC||






|Type|Column / Constraint Name|Details|
|---|---|---|
||CURRENCY_RTL_DEC||

---

## Table: CURRENCIES_TL

**Description:** This is the translation table for CURRENCIES table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | CURRENCY_CODE | P | F | Y | VARCHAR (3) | Contains a number which uniquely identifies the type of currency. |
| 3 | CURRENCY_DESC |  |  | Y | VARCHAR (120) | Contains a description of the currency. |
| 4 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 6 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 7 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_CURRENCIES_TL|PK||||LANG|ASC|
||||||CURRENCY_CODE|ASC|

---

## Table: CURRENCY_RATES

**Description:** This table contains the exchange rates for every currency used in the system. A currency can have multiple exchange rates based on a combination of different exchange types and effective dates.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | CURRENCY_CODE | P | F | Y | VARCHAR (3) | Contains the currency code for which the history applies. |
| 2 | EFFECTIVE_DATE | P |  | Y | Date | Date on which the currency rate became or will become active. |
| 3 | EXCHANGE_TYPE | P |  | Y | VARCHAR (1) | Identifies the type of exchange rate the history exists for. Valid values are defined under code type 'EXTP': C (Consolidation) O (Operational) L (Letter of Credit/Bank) P (Purchase Order) U (Customs Entry) T (Transportation) |
| 4 | EXCHANGE_RATE |  |  | Y | NUMERIC (20,10) | Contains the exchange rate for the specified currency/type/effective date combination. |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |
| 6 | CREATE_DATETIME |  |  | Y | Date | This column holds the record creation date. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_CURRENCY_RATES|PK||||CURRENCY_CODE|ASC|
||||||EFFECTIVE_DATE|ASC|
||||||EXCHANGE_TYPE|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_CURR_RATES_EXC_TYPE<br>|EXCHANGE_TYPE IN ('C','O', 'L','P','U', 'T')<br>|
|Column Level|EXCHANGE_TYPE<br>||

---

## Table: CUSTOM_PKG_CONFIG

**Description:** This table holds the list of custom packages that should be executed dynamically for each key and call_seq_num.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | FUNCTION_KEY | P |  | Y | VARCHAR (70) | This column contains the key identifier to the custom functions. The combination of this field and the call_seq_num uniquely determines which custom code should be called. |
| 2 | CALL_SEQ_NO | P |  | Y | NUMERIC (3) | This column contains the sequence of the custom call which determines sequence of custom code called when when a single ORMS base function has to call more than one custom code. |
| 3 | SCHEMA_NAME |  |  | Y | VARCHAR (30) | This column holds the schema name where the custom code is available. |
| 4 | PACKAGE_NAME |  |  |  | VARCHAR (30) | This column holds the name of package where the custom code resides. This is not a mandatory field when the custom code is a stored function. |
| 5 | FUNCTION_NAME |  |  | Y | VARCHAR (30) | This column will hold the name of the function which should be executed dynamically for the function_key and call_seq_num. |
| 6 | USER_ID |  |  | Y | VARCHAR (30) | This column will contain the ORACLE User ID of the user who has inserted/updated the record. This field is populated by trigger. |
| 7 | LAST_UPDATE_DATETIME |  |  | Y | Date | This column holds the date of the most recent update by the user_id. This field is populated by trigger. |

---

## Table: DAY_LEVEL_CALENDAR

**Description:** Table used as reference to help with determining where a transaction fits into the fiscal calendar.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DAY |  |  | Y | Date | Full date |
| 2 | EOW_DATE |  |  | Y | Date | End of week date for the date. |
| 3 | EOM_DATE |  |  | Y | Date | End of month date for the date. |
| 4 | DAY_DATE_454_DAY |  |  |  | NUMERIC (2) | The day number within the week. |
| 5 | DAY_DATE_454_WEEK |  |  |  | NUMERIC (2) | The week number within the month. |
| 6 | DAY_DATE_454_MONTH |  |  |  | NUMERIC (2) | The month number within the year. |
| 7 | DAY_DATE_454_YEAR |  |  |  | NUMERIC (4) | The year number within the year. |
| 8 | EOW_DATE_454_DAY |  |  |  | NUMERIC (2) | The day number for the end-of-week in a given week. |
| 9 | EOW_DATE_454_WEEK |  |  |  | NUMERIC (2) | The week number for the end-of-week in a given week. |
| 10 | EOW_DATE_454_MONTH |  |  |  | NUMERIC (2) | The month number for the end-of-week in a given week. |
| 11 | EOW_DATE_454_YEAR |  |  |  | NUMERIC (4) | The year number for the end-of-week in a given week. |
| 12 | EOM_DATE_454_DAY |  |  |  | NUMERIC (2) | The day number for the end-of-month in a given month. |
| 13 | EOM_DATE_454_WEEK |  |  |  | NUMERIC (2) | The week number for the end-of-month in a given month. |
| 14 | EOM_DATE_454_MONTH |  |  |  | NUMERIC (2) | The month number for the end-of-month in a given month. |
| 15 | EOM_DATE_454_YEAR |  |  |  | NUMERIC (4) | The year number for the end-of-month in a given month. |
| 16 | SOW_DATE |  |  | Y | Date | Start of week date |
| 17 | NUMBER_OF_WEEKS |  |  | Y | NUMERIC | Number of weeks in current month |
| 18 | MCAL_PERIOD |  |  | Y | NUMERIC | Accounting period number |
| 19 | MCAL_PERIOD_NAME |  |  | Y | VARCHAR (20 ) | Account Period name |
| 20 | MCAL_QTR |  |  | Y | NUMERIC (2) | Quarter |
| 21 | MCAL_YEAR |  |  | Y | NUMERIC (5) | Identifies the MCAL year in YYYY format |
| 22 | PERIOD_KEY |  |  | Y | NUMERIC (10) | Key to uniquely identify period |
| 23 | QUARTER_KEY |  |  | Y | NUMERIC (10) | Key to uniquely identify quarter |
| 24 | WEEK_KEY |  |  | Y | NUMERIC (10) | Key to uniquely identify week |
| 25 | MCAL_PERIOD_ST_DT |  |  | Y | Date | Period start date |
| 26 | MCAL_PERIOD_END_DT |  |  | Y | Date | Period end date |
| 27 | DATE_KEY |  |  | Y | NUMERIC (10) | Key to identify unique date |

---

## Table: DEBUG_CFG

**Description:** This table is used to set the debug process for the CFAS UI and related packages and libraries. The debug messages are only displayed on the screen (for CFAS UI and library) and/or logged to a table (for CFAS UI, library and CFA* packages) for the specific user. The debug tool can target specific package functions or group of package functions or UI program units.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DB_USER | P |  | Y | VARCHAR (30) | The USER or SCHEMA_NAME used for debugging |
| 2 | DBG_OBJECT | P |  | Y | VARCHAR (61) | The stored program unit name to debug. For database packages: PACKAGE_NAME.FUNCTION_NAME e.g. CFA_SQL.INITIALIZE For Form program unit: PROGRAM_UNIT NAME e.g. P_FORM_STARTUP For UI libraries: LIBRARY PACKAGE_NAME.PROCEDURE/FUNCTION_NAME e.g. FLEX_UI.BUILD_ATTRIB |
| 3 | UI_MSG |  |  |  | VARCHAR (1) | Indicates whether to display the debug messages on the UI during runtime (via imessage). This only works if the debug messages are in the UI or related UI libraries. Messages are not displayed through the UI if these are in the database package. Any value other than Y, N are treated as N |
| 4 | LOG_TO_TBL |  |  |  | VARCHAR (1) | Indicates whether to save the debug messages on the debug table (DEBUG_MSG). Any value other than Y, N is considered N |

---

## Table: DEBUG_MSG

**Description:** This table holds debug information logged by CFAS program units and stored procedures.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DB_USER |  |  |  | VARCHAR (30) | This holds the schema where the message was logged |
| 2 | DBG_OBJECT |  |  |  | VARCHAR (61) | The name of the object that logged the message |
| 3 | SEQ |  |  |  | NUMERIC (10) | Order of sequence the message was logged |
| 4 | MSG |  |  |  | VARCHAR (4000) | The debug message |
| 5 | CALL_STACK |  |  |  | VARCHAR (4000) | Displays where the message was triggered in the code hierarchy (stack) |
| 6 | LOG_TIME |  |  |  | Timestamp | The time the message was logged |

---

## Table: DEFAULT_FUNC_CONFIG_OPTIONS

**Description:** This table contains system configuration options related to default values that are used across different functional areas in RMS, such as check digits, dimensions used in unit of measure calculations.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | CHECK_DIGIT_IND |  |  | Y | VARCHAR (1) | Determines if check digits will be used on item number fields when the item number type is an Oracle Retail Item Number. This field will contain Y if check digits are to be used, otherwise it will contain N. |
| 2 | CD_MODULUS |  |  | Y | NUMERIC (2) | Indicates the modulus number used in the formula for check digit calculations in RMS. |
| 3 | CD_WEIGHT_1 |  |  | Y | NUMERIC (3) | Check Digit Weight 1 is the value to be used as a weight for the check digit calculation in the rightmost position. |
| 4 | CD_WEIGHT_2 |  |  | Y | NUMERIC (3) | Check Digit Weight 2 is the value to be used as a weight for the check digit calculation in the 2nd digit position from the right. |
| 5 | CD_WEIGHT_3 |  |  | Y | NUMERIC (3) | Check Digit Weight 3 is the value to be used as a weight for the check digit calculation in the 3rd digit position from the right. |
| 6 | CD_WEIGHT_4 |  |  | Y | NUMERIC (3) | Check Digit Weight 4 is the value to be used as a weight for the check digit calculation in the 4th digit position from the right. |
| 7 | CD_WEIGHT_5 |  |  | Y | NUMERIC (3) | Check Digit Weight 5 is the value to be used as a weight for the check digit calculation in the 5th digit position from the right. |
| 8 | CD_WEIGHT_6 |  |  | Y | NUMERIC (3) | Check Digit Weight 6 is the value to be used as a weight for the check digit calculation in the 6th digit position from the right. |
| 9 | CD_WEIGHT_7 |  |  | Y | NUMERIC (3) | Check Digit Weight 7 is the value to be used as a weight for the check digit calculation in the 7th digit position from the right. |
| 10 | CD_WEIGHT_8 |  |  | Y | NUMERIC (3) | Check Digit Weight 8 is the value to be used as a weight for the check digit calculation in the 8th digit position from the right. |
| 11 | DEFAULT_STANDARD_UOM |  |  | Y | VARCHAR (4) | Indicates the Standard UOM that will be the default for all new items created in RMS. This can be changed as part of the item creation process. It should have a valid UOM value used in the system which exists in UOM_CLASS table. |
| 12 | DEFAULT_DIMENSION_UOM |  |  | Y | VARCHAR (4) | Indicates the default dimension Unit of Measure that will be used throughout RMS. It should have a valid UOM value used in the system which exists in UOM_CLASS table. |
| 13 | DEFAULT_WEIGHT_UOM |  |  | Y | VARCHAR (4) | Indicates the Weight UOM that will be used as a default throughout RMS. It should have a valid UOM value used in the system which exists in UOM_CLASS table. |
| 14 | DEFAULT_UOP |  |  | Y | VARCHAR (1) | Indicates the default Unit of Purchase that will be used for all POs created in RMS. Valid values are: S - Standard Unit of Measure and C - Case or case equivalent. |
| 15 | CREATE_ID |  |  | Y | VARCHAR (30) | Stores the Oracle username of the one who inserted the first record. This field is required by the database. |
| 16 | CREATE_DATETIME |  |  | Y | Date | The date and time of when the record was created in the table. This value should only be populated on insert - it should never be updated. |
| 17 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | The Oracle username of the one who most recently updated this record. |
| 18 | LAST_UPDATE_DATETIME |  |  | Y | Date | The date time stamp of the most recent update by the user. |

---

## Table: DEFAULT_UI_CONFIG_OPTIONS

**Description:** This table contains system configuration options related to the the description given to fields on screens in RMS across functional areas, such as item levels and ELC nomination flags.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEFAULT_CASE_NAME |  |  | Y | VARCHAR (6) | This is the code referencing the name/label to refer to the CASE pack size. Valid codes are defined in the CASN code type (i.e. pack, box, bag). |
| 2 | DEFAULT_INNER_NAME |  |  | Y | VARCHAR (6) | This is the code referencing the name/label to refer to the INNER pack size. Valid codes are defined in the INRN code type (i.e. sub-case, sub-pack). |
| 3 | DEFAULT_PALLET_NAME |  |  | Y | VARCHAR (6) | This is the code referencing the name/label used to refer to PALLET pack size. Valid codes are defined in the PALN code type (i.e. pallet, flat) |
| 4 | CREATE_ID |  |  | Y | VARCHAR (30) | Stores the Oracle username of the one who inserted the first record. This field is required by the database. |
| 5 | CREATE_DATETIME |  |  | Y | Date | The date and time of when the record was created in the table. This value should only be populated on insert - it should never be updated. |
| 6 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | The Oracle username of the one who most recently updated this record. |
| 7 | LAST_UPDATE_DATETIME |  |  | Y | Date | The date time stamp of the most recent update by the user. |

---

## Table: DUMMY

**Description:** This table is used when no base table has been assigned to a form, but use of the pre or post insert, update or delete triggers is required. This table is populated during installation of the system and should not be modified.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DUMMY | P |  | Y | VARCHAR (1) | This field will always contain a Y. Used by Logon form. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_DUMMY|PK||||DUMMY|ASC|

---

## Table: DUMMY_CARTON_STAGE

**Description:** This table contains details of the receipts for which dummy carton indicator is set to Y and the carton has not been matched.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DISTRO_NO |  |  |  | NUMERIC (12) | This field contians Transfer or allocation number depending on distro_type. |
| 2 | DISTRO_TYPE |  |  | Y | VARCHAR (1) | This field indicates if this receipt is for allocation or transfer: A = allocation number, T = transfer number |
| 3 | ITEM |  |  | Y | VARCHAR (25) | This field contains the unique alphanumeric identifier for the Item on the receipt. |
| 4 | TO_LOC |  |  | Y | NUMERIC (10) | This field contains unique identifier for the receiving location. |
| 5 | CARTON |  |  |  | VARCHAR (20) | This field contains dummy carton ID used for the receipt. |
| 6 | BOL_NO |  |  | Y | VARCHAR (30) | This field contains bill of lading number for the receipt. |
| 7 | QTY |  |  | Y | NUMERIC (12,4) | This field contains quantity received of the item on the receipt. |
| 8 | TRAN_TYPE |  |  | Y | VARCHAR (1) | This field contains the transaction type. Valid values are: A - Adjustment, R - Receipt, T - Transshipment. |
| 9 | TRAN_DATE |  |  |  | Date | This field contains the transaction date when the dummy carton was received. |
| 10 | RECEIPT_NO |  |  |  | VARCHAR (17) | This field contains WMS receipt number. |
| 11 | APPT_NO |  |  |  | NUMERIC (9) | This field contains appointment number for the receipt. |
| 12 | DISPOSITION_CODE |  |  |  | VARCHAR (10) | This field contains disposition code of the item on the receipt. |
| 13 | TAMPERED_IND |  |  |  | VARCHAR (1) | This field indicate if the carton was tampered. |
| 14 | DUMMY_CARTON_IND |  |  |  | VARCHAR (1) | This field indicates if this carton is a dummy carton. |
| 15 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the last date/time the record was modified |

---

## Table: DYNAMIC_HIER_TOKEN_MAP

**Description:** This table contains the mapping of dynamic tokens to its name. This table is used by the installation script during initial install and during patch install for database and the application. If the client wants to maintain the hierarchy name different than the default RMS name, they will have to update the client name for the applicable tokens.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TOKEN | P |  | Y | VARCHAR (10) | This field contains the hierarchy token present in the seed data and in application bundle file. |
| 2 | RMS_NAME |  |  | Y | VARCHAR (40) | This is the default RMS name for this token |
| 3 | CLIENT_NAME |  |  |  | VARCHAR (40) | The client can define their own name for this token. The value in this column will take precedence to RMS_NAME column when tokens gets replaced. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_DYNAMIC_HIER_TOKEN_MAP|PK||||TOKEN|ASC|

---

## Table: DYNAMIC_HIER_TOKEN_MAP_TL

**Description:** This is the translation table for DYNAMIC_HIER_TOKEN_MAP table. The token to name mapping for data integration langauge is maintained in the base table. The token mapping in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TOKEN | P | F | Y | VARCHAR (10) | This field contains the hierarchy token present in the seed data and in application bundle file. |
| 2 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which mapped name is maintained. |
| 3 | RMS_NAME |  |  | Y | VARCHAR (40 ) | This is the default RMS name for this token |
| 4 | CLIENT_NAME |  |  |  | VARCHAR (40 ) | The client can define their own name for this token. The value in this column will take precedence to RMS_NAME column when tokens gets replaced. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_DYNAMIC_HIER_TOKEN_MAP_TL|PK||||TOKEN|ASC|
||||||LANG|ASC|

---

## Table: EURO_EXCHANGE_RATE

**Description:** This table holds all countries that are a part of the European Union and the associated fixed exchange rate between the euro and national currency.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | CURRENCY_CODE | P | F | Y | VARCHAR (3) | Contains a value which uniquely identifies the type of currency. |
| 2 | EXCHANGE_RATE |  |  | Y | NUMERIC (12,6) | Contains the fixed conversion rate between the euro and national currency. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_EURO_EXCHANGE_RATE|PK||||CURRENCY_CODE|ASC|

---

## Table: EXT_ENTITY

**Description:** This table provides the mapping between extendable base RMS tables and localization extension tables. This table will be populated by a seed data script in base RMS installation for each entity LFAS has been installed for.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | EXT_ENTITY_ID | P |  | Y | NUMERIC (10) | This column holds a generated ID that distinguishes the model extension point. |
| 2 | BASE_RMS_TABLE |  |  | Y | VARCHAR (30) | This column holds the base RMS table (for example,ordhead, tsfhead, etc) which the extension refers. |
| 3 | L10N_EXT_TABLE |  |  | Y | VARCHAR (22) | This column holds the name of localization extension value table related to this model extension. The localization table must be created when LFAS is installed for an entity. |
| 4 | BASE_IND |  |  | Y | VARCHAR (1) | This column indicates whether the entry came with the localization pack. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_EXT_ENTITY|PK||||EXT_ENTITY_ID|ASC|
|EXET_UK|UK||||BASE_RMS_TABLE|ASC|
|EXET_UK2|UK||||L10N_EXT_TABLE|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_EXT_ENTITY_L10N_EXT_TAB|L10N_EXT_TABLE like '%_L10N_EXT'<br>|
|Column Level|L10N_EXT_TABLE||

---

## Table: EXT_ENTITY_KEY

**Description:** This table holds the key information for the extended base RMS tables.This table will be populated by a seed data script in base RMS installation for each entity LFAS has been installed for.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | BASE_RMS_TABLE | P | F | Y | VARCHAR (30) | This column holds the base RMS table (for example,ordhead, tsfhead, etc) which the extension refers. |
| 2 | KEY_COL | P |  | Y | VARCHAR (30) | This column holds the name of the primary key column on the extended BASE_RMS_TABLE. |
| 3 | KEY_NUMBER |  |  | Y | NUMERIC (2) | This column holds the sequence of the key column. |
| 4 | DATA_TYPE |  |  | Y | VARCHAR (10) | This column holds the data type of the primary key element. |
| 5 | DESCRIPTION_CODE |  |  |  | VARCHAR (61) | Holds the procedure name used to display the key values description in the LFAS UI |
| 6 | L10N_DEPENDENCY_IND |  |  | Y | VARCHAR (1) | This column indicates that the key field is used to drive the localization of the entity. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_EXT_ENTITY_KEY|PK||||BASE_RMS_TABLE|ASC|
||||||KEY_COL|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_EXT_ENTITY_KEY_L10N_DIND|L10N_DEPENDENCY_IND IN ('Y','N')<br>|
|Column Level|L10N_DEPENDENCY_IND||

---

## Table: EXT_ENTITY_KEY_DESCS

**Description:** This table holds the description that should be used to label the key fields in the LFAS UI Widget header. Records must exist in this table to ensure that fields in the UI are labeled. This table will be populated by a seed data script in base RMS installation for each entity LFAS has been installed for.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | BASE_RMS_TABLE | P | F | Y | VARCHAR (30) | This column holds the base RMS table (for example,ordhead, tsfhead, etc) which the extension refers. |
| 2 | KEY_COL | P | F | Y | VARCHAR (30) | This column holds the name of the primary key column on the extended BASE_RMS_TABLE. |
| 3 | LANG | P | F | Y | NUMERIC (6) | This column holds the language that the KEY_DESC is in. It will be used to ensure the appropriate language is shown to any end users accessing the LFAS UI widget. |
| 4 | DEFAULT_LANG_IND |  |  | Y | VARCHAR (1) | This column indicates that the current records description should be considered the default and displayed in the UI if a translation for the end users language does not exist. This column should be Y for only one language for the BASE_RMS_TABLE and KEY_COL combination. |
| 5 | KEY_DESC |  |  | Y | VARCHAR (255) | This value will be displayed on the header of the LFAS UI widget to label the value passed from the calling form to the LFAS UI widget as the KEY_COL. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_EXT_ENTITY_KEY_DESCS|PK||||BASE_RMS_TABLE|ASC|
||||||KEY_COL|ASC|
||||||LANG|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_EEKD_DEFAULT_LANG_IND|DEFAULT_LANG_IND IN ('Y','N')<br>|

---

## Table: FILTER_GROUP_MERCH

**Description:** This table contains the Merchandise Hierarchy LOV filtering access information for a User Security.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SEC_GROUP_ID |  | F | Y | NUMERIC (4) | ID of the User Security group |
| 2 | FILTER_MERCH_LEVEL |  |  | Y | VARCHAR (1) | The Merchandise hierarchy level assigned to the User Security Group. |
| 3 | FILTER_MERCH_ID |  |  | Y | NUMERIC (4) | ID of the Merchandise hierarchy level assigned to the User Security Group |
| 4 | FILTER_MERCH_ID_CLASS |  |  |  | NUMERIC (4) | Class ID of the Merchandise hierarchy level assigned to the user security group |
| 5 | FILTER_MERCH_ID_SUBCLASS |  |  |  | NUMERIC (4) | Subclass ID of the Merchandise hierarchy level assigned to the user security group |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|UK_FILTER_GROUP_MERCH|UK||||SEC_GROUP_ID|ASC|
||||||FILTER_MERCH_LEVEL|ASC|
||||||FILTER_MERCH_ID|ASC|
||||||FILTER_MERCH_ID_CLASS|ASC|
||||||FILTER_MERCH_ID_SUBCLASS|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_FILTER_GROUP_MERCH_ID_CLAS|(filter_merch_level = 'C' and filter_merch_id_class is not null) or (filter_merch_level != 'C')<br>|
||CHK_FILTER_GROUP_MERCH_ID_SC|(filter_merch_level = 'S' and filter_merch_id_class is not null and filter_merch_id_subclass is not null) or (filter_merch_level != 'S')<br>|
||CHK_FILTER_GRP_MRCH_FILTER_LVL|FILTER_MERCH_LEVEL IN ('D','G','P','C','S')<br>|
|Column Level|FILTER_MERCH_LEVEL||

---

## Table: FILTER_GROUP_ORG

**Description:** This table contains the Organization Hierarchy LOV filtering access information for a User Security Group

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SEC_GROUP_ID | P | F | Y | NUMERIC (4) | ID of the User Security group |
| 2 | FILTER_ORG_LEVEL | P |  | Y | VARCHAR (1) | The Organization hierarchy level assigned to the User Security Group. Valid values are contained in the CODE_DETIAL table with a CODE_TYPE of FLOW. |
| 3 | FILTER_ORG_ID | P |  | Y | NUMERIC (15) | ID of the Organization hierarchy level assigned to the User Security Group. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_FILTER_GROUP_ORG|PK||||SEC_GROUP_ID|ASC|
||||||FILTER_ORG_LEVEL|ASC|
||||||FILTER_ORG_ID|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_FILTER_GRP_ORG_FILTER_LVL|FILTER_ORG_LEVEL IN ('C','A','R','D','W', 'I', 'E', 'T','O')<br>|
|Column Level|FILTER_ORG_LEVEL||

---

## Table: FILTER_TEMP

**Description:** This table is used by the forms that use the super-filter. This table is used to store the actual where clause used in the form to filter on certain records. This is a temporary table that will only have values while a user is active in a particular form using the super-filter.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | FORM_NAME | P |  | Y | VARCHAR (8) | This column contains the name of the form that is using the filter. |
| 2 | UNIQUE_KEY | P |  | Y | VARCHAR (100) | This field will contain a unique identifier for each record (primary key) of the table that is being filtered. |
| 3 | WHERE_CLAUSE |  |  |  | VARCHAR (4000) | This field will be a concatenation of the search criteria that the user wishes to filter on (i.e. ((style = 1000 and colour = 1234) or (style = 1000 and colour = 5678)) ). |

---

## Table: FORM_LINKS

**Description:** This table will hold the links for a form. This table does not have a form for maintenance. Maintenance should be performed by a DBA.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | FORM_ID | P |  | Y | VARCHAR (30) | This column will hold the name of the form with which the links are associated. This name must match the formal name of the form (i.e. |
| 2 | LINK_ID | P |  | Y | VARCHAR (6) |  |
| 3 | LINK_DESC |  |  | Y | VARCHAR (120) | This column will hold the description for a link. It is what will be displayed to the user, translated if necessary. |
| 4 | LINK_SEQ |  |  | Y | NUMERIC (2) | The will hold the sequence that the links are displayed on a form. |
| 5 | REQUIRED_IND |  |  | Y | VARCHAR (1) | This will indicate if the given link is a system required area. User defined required areas can be defined using the merchandise hierarchy default functionality. |

---

## Table: FOUNDATION_UNIT_OPTIONS

**Description:** This table contains parameters related to configuring foundation data functionality in RMS.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | AUTO_APPROVE_CHILD_IND |  |  | Y | VARCHAR (1) | Determines if the children of approved parents will be created automatically in approved status. If Y, children of approved parents will be created in approved status. This means that the item will immediately be available for any transactions in RMS. If N, children of approved parents will be created in worksheet status. This means that the child items must be manually approved before the item is available for any transactions in RMS. Care should be taken when setting this value. If all critical item information for transaction level items can be inherited from the parent, Y is a possible setting. If transaction level items are unique and require different data (i.e. different suppliers, locations, etc.), N is the suggested setting. |
| 2 | AUTO_EAN13_PREFIX |  |  |  | NUMERIC (6) | If the system option has been set such that EANs are auto generated, then this system option will indicate the prefix that will be used, if populated. This field must be either NULL or contain a 6-digit long prefix. |
| 3 | BRACKET_COSTING_IND |  |  | Y | VARCHAR (1) | Controls if an organization will allow vendors with bracket costing pricing structures. |
| 4 | COST_PRIOR_CREATE_DAYS |  |  |  | NUMERIC (2) | Indicates the minimum number of days prior to the cost change effective date that a cost change can be entered. |
| 5 | COST_EVENT_HIST_DAYS |  |  |  | NUMERIC (2) | Dictates how long cost event records are maintained on the cost event tables. |
| 6 | DEFAULT_PACKING_METHOD |  |  | Y | VARCHAR (6) | This specifies if the default packing method that will be assigned to an item when it is created in RMS. Valid values are stored on the code_detail table with the code_type PKMT |
| 7 | DOMAIN_LEVEL |  |  |  | VARCHAR (1) | Domain level defines the level at which RDF and other RPAS applications do planning and forecasting. RMS uses this to determine the level at which data will be sent. Valid values are: D - Department C - Class S - Subclass |
| 8 | GROCERY_ITEMS_IND |  |  | Y | VARCHAR (1) | Determines whether or not the retailer handles grocery merchandise. When this is Y, then RMS enables the user to enter grocery related info like catch weight order, sale type, wastage details, perishable info, etc. during item creation. When set to N all these fields are hidden from the screens. |
| 9 | MERCH_HIER_AUTO_GEN_IND |  |  | Y | VARCHAR (1) | This determines if the department, class and subclass IDs will be automatically generated. If indicator is set to N then the user can manually enter a department, class, and subclass ID when new are created. |
| 10 | ROUND_LVL |  |  | Y | VARCHAR (6) | Used to indicate the smallest supplier orderable unit and controls how rounding is executed for purchase orders. For example, it will determine if order quantities should be rounded to the nearest case, to the nearest pallet, or to case and then pallet. Valid values can be found on the CODE_DETAIL table with a code type of ORL. |
| 11 | ROUND_TO_CASE_PCT |  |  | Y | NUMERIC (12,4) | Percentage to round from inners to a case. During rounding, this value is used to determine whether to round partial case quantities up or down. If the case-fraction in question is less than the percentage defined, it is rounded down; if not, it is rounded up. |
| 12 | ROUND_TO_INNER_PCT |  |  | Y | NUMERIC (12,4) | Percentage to round from eaches to an inner. During rounding, this value is used to determine whether to round partial inner quantities up or down. If the inner fraction in question is less than the percentage defined, it is rounded down; if not, it is rounded up. |
| 13 | ROUND_TO_LAYER_PCT |  |  | Y | NUMERIC (12,4) | Percentage to round from partial layer quantities in the ordering process. If the layer fraction in question is less than the percentage defined, it is rounded down; if not, it is rounded up. |
| 14 | ROUND_TO_PALLET_PCT |  |  | Y | NUMERIC (12,4) | Percentage to round from partial pallet quantities in the ordering process. If the pallet fraction in question is less than the percentage defined, it is rounded down; if not, it is rounded up. |
| 15 | SUPP_PART_AUTO_GEN_IND |  |  | Y | VARCHAR (1) | This column determines whether the Supplier/Partner ID will be automatically generated upon creation. If not checked then the user can manually enter an ID. |
| 16 | WH_STORE_ASSIGN_TYPE |  |  |  | VARCHAR (6) | Specifies based on the replenishment stock category, which stores will be assigned to the specified warehouse by the warehouse store assignment batch program. Valid values include: W, Warehouse Stocked, to update the source warehouse for only the warehouse-store replenishment records. C, Cross-Docked, to update the source warehouse for only the cross-docked replenishment records. L, WH/Cross Link, to update the source warehouse for only the WH/Cross Link replenishment records. A, All, to update the source warehouse for all replenishment records. |
| 17 | CREATE_ID |  |  |  | VARCHAR (30) | Stores the Oracle username of the one who inserted the first record. This field is required by the database. |
| 18 | CREATE_DATETIME |  |  |  | Date | The date and time of when the record was created in the table. This value should only be populated on insert - it should never be updated. |
| 19 | LAST_UPDATE_ID |  |  |  | VARCHAR (30) | The Oracle username of the one who most recently updated this record. |
| 20 | LAST_UPDATE_DATETIME |  |  |  | Date | The date time stamp of the most recent update by the user. |

---

## Table: FROM_LOC_TEMP

**Description:** This table contains all from locations that will be inserted into the item up charge tables, or update on the item up charge tables. This is a temporary table used only in the apply processing in the Item Up Charge form.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | FROM_LOC |  |  | Y | NUMERIC (10) | Contains the location number of the location from which goods will be transferred. This column can contain either a store or a warehouse. |
| 2 | FROM_LOC_TYPE |  |  | Y | VARCHAR (1) | Contains the type of location from which goods will be transferred. this column can contain either S for store, W for warehouse, or E for External Finisher. |

---

## Table: FUNCTIONAL_CONFIG_OPTIONS

**Description:** Table that contains functional parameters that are used turn on certain functions in RMS, such as contracts and ELC.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | CONTRACT_IND |  |  | Y | VARCHAR (1) | Specifies if contracting is being used within Oracle Retail. Default value is N if NULL. |
| 2 | ELC_IND |  |  | Y | VARCHAR (1) | This column controls whether landed cost will be used within the system. Default value if NULL is N. |
| 3 | IMPORT_IND |  |  | Y | VARCHAR (1) | This field will indicate if Oracle Retail Trade Management is used to manage importing within RMS. |
| 4 | ORG_UNIT_IND |  |  | Y | VARCHAR (1) | When a company is divided into different ledgers or a company has operations in different countries, it may use different sets of books for each division. An org unit is a subdivision within a set of books which could represent a sales office, division, or department. Org units are not associated with legal entities. This column will be used to determine if organizational units are used within the system. Valid value is Y-Yes. |
| 5 | SUPPLIER_SITES_IND |  |  | Y | VARCHAR (1) | Suppliers usually have multiple sites from which they supply merchandise. Each of these sites can have different supplier control parameters like lead times, payment terms, etc. When the Supplier Site parameter is set to Y then many functions in RMS that involve suppliers, such as purchasing, will display the supplier site details. RMS only supports the supplier site is Y configuration. For clients that do not use the supplier site functionality, they need to set up a one-to-one relation between a supplier and supplier site. |
| 6 | CREATE_ID |  |  | Y | VARCHAR (30) | Stores the Oracle username of the one who inserted the first record. This field is required by the database. |
| 7 | CREATE_DATETIME |  |  | Y | Date | The date and time of when the record was created in the table. This value should only be populated on insert - it should never be updated. |
| 8 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | The Oracle username of the one who most recently updated this record. |
| 9 | LAST_UPDATE_DATETIME |  |  | Y | Date | The date time stamp of the most recent update by the user. |
| 10 | RPM_IND |  |  | Y | VARCHAR (1 ) | Indicates whether RPM is used as a pricing application or not. |

---

## Table: HIST_REBUILD_MASK

**Description:** This table is used to store the Departments, Classes, and Subclasses which will be used as inputs during the next run of the sales history rollup batch. This batch, if run with the runtime parameter of rebuild, uses data from this table to determine what to rebuild. To rebuild an entire department, class and subclass are to be specified as NULL. To rebuild entire class, department and class are to be specifed and subclass is to be set to NULL.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEPT |  | F | Y | NUMERIC (4) | This field contains the unique identifer for the department for which to rebuild the sales history. |
| 2 | CLASS |  | F | Y | NUMERIC (4) | This field contains the unique identifer for the class for which to rebuild the sales history. |
| 3 | SUBCLASS |  | F | Y | NUMERIC (4) | This field contains the unique identifer for the subclass for which to rebuild the sales history. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|HIST_REBUILD_MASK_I1|||||DEPT|ASC|
||||||CLASS|ASC|
||||||SUBCLASS|ASC|

---

## Table: IB_RESULTS

**Description:** This table holds the input parameters and resulting values of Investment Buy opportunity calculations.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM | P |  | Y | VARCHAR (25) | Contains the item considered by the Investment Buy calculation |
| 2 | LOCATION | P |  | Y | NUMERIC (10) | Contains the location associated with the investment buy opportunity. Currently, only warehouses are investment bought. In a Multi Channel environment, this location will be a virtual warehouse |
| 3 | CREATE_DATE | P |  | Y | Date | Contains the date the record was inserted into the table. |
| 4 | LOC_TYPE |  |  | Y | VARCHAR (1) | Contains the location type associated with the investment buy opportunity. Valid values include Store and Warehouse. Currently, only |
| 5 | PHYSICAL_WH |  |  |  | NUMERIC (10) | Contains the physical warehouse associated with the location of the investment buy opportunity if RMS Multi Channel functionality is being used. Otherwise, the column is not populated . Will hold physical warehouse in this column |
| 6 | REPL_WH_LINK |  |  |  | NUMERIC (10) | This column contains the replenishable warehouse that is attached to the virtual warehouse. |
| 7 | SUPPLIER |  |  | Y | NUMERIC (10) | Contains the source supplier of the item being considered in the Investment Buy calculation. If the item/location is on replenishment, it will be the replenishment supplier. Otherwise, it will be the primary supplier associated with the item/location. |
| 8 | ORIGIN_COUNTRY_ID |  |  | Y | VARCHAR (3) | Contains the origin country associated with the item/supplier combination being considered in the Investment Buy calculation. If the item/location is on replenishment, it will be the replenishment origin country. Otherwise, it will be the primary origin country associated with the item/location. |
| 9 | SUPP_LEAD_TIME |  |  |  | NUMERIC (4) | Contains the time between sending an order to the supplier and the supplier having the product ready to ship. |
| 10 | PICKUP_LEAD_TIME |  |  |  | NUMERIC (4) | Contains the time it takes the supplier to ship an order, once it is ready to be shipped, to the location associated with the investment buy opportunity |
| 11 | TERMS |  |  | Y | VARCHAR (15) | Contains the sales terms of the supplier associated with the investment buy opportunity |
| 12 | DUEDAYS |  |  | Y | NUMERIC (3) | Contains the number of days until supplier payment is due. This value is derived from the supplier sales terms and used in the opportunity calculation. |
| 13 | TI |  |  | Y | NUMERIC (12,4) | Contains the number of shipping units (cases) that make up one tier of a pallet of the item. Multiply TI x HI to get total number of units (cases) for a pallet. |
| 14 | HI |  |  | Y | NUMERIC (12,4) | Contains the number of tiers that make up a complete pallet (height) of the item. Multiply TI x HI to get total number of units (cases) for a pallet. |
| 15 | CASE_SIZE |  |  | Y | NUMERIC (12,4) | Contains the supplier case size (also referred to as the supplier pack size) of the item associated with the investment buy opportunity. |
| 16 | POOL_SUPPLIER |  |  |  | NUMERIC (10) | Contains the pooled supplier associated with the source supplier, if applicable |
| 17 | SOURCE_TYPE |  |  | Y | VARCHAR (6) | Contains the source type associated with the line item. This column always contains I and is only used to facilitate record filtering in the buyer worksheet online dialog. |
| 18 | STATUS |  |  | Y | VARCHAR (6) | Contains the status associated with the line item. Valid values will include Worksheet, PO processed, Unprocessed and Deleted. |
| 19 | ITEM_TYPE |  |  | Y | VARCHAR (1) | Indicates whether the item being recommended for investment buy is a simple pack or an individual item. Valid values include P and M. P indicates that the item being purchased is a simple pack. M indicates that the item being purchased is a Master Item, i.e. not a simple pack. (The term Master Item is used to achieve consistency between ib_results and repl_results.) |
| 20 | COMP_ITEM |  |  |  | VARCHAR (25) | Contains the component item within the pack if the item being purchased is a simple pack. Otherwise, the column is not populated. |
| 21 | DEPT |  |  | Y | NUMERIC (4) | Contains the department associated with the item |
| 22 | CLASS |  |  | Y | NUMERIC (4) | Contains the class associated with the item. |
| 23 | SUBCLASS |  |  | Y | NUMERIC (4) | Contains the subclass associated with the item. |
| 24 | BUYER |  |  |  | NUMERIC (4) | Contains the buyer associated with the department of the item. |
| 25 | COST_WH_STORAGE_MEAS |  |  |  | VARCHAR (6) | The type of the whs stroage cost. |
| 26 | COST_WH_STORAGE |  |  |  | NUMERIC (20,4) | Contains the cost of warehouse storage, expressed as the weekly cost per the unit of measure specified in COST_WH_STORAGE_UOM. The column is only populated if the value is used in the calculation (i.e. COST_OUT_STORAGE is not used). |
| 27 | COST_WH_STORAGE_UOM |  |  |  | VARCHAR (4) | Contains the unit of measure to which the cost of warehouse storage is applicable. This unit of measure may only be pallet or from the volume class. |
| 28 | COST_OUT_STORAGE_MEAS |  |  |  | VARCHAR (6) | The type of the whs stroage cost. |
| 29 | COST_OUT_STORAGE |  |  |  | NUMERIC (20,4) | Contains the cost of outside storage, expressed in weekly cost per the unit of measure specified in COST_OUT_STORAGE_UOM. The column is only populated if the value is used in the calculation (i.e. COST_WH_STORAGE is not used). |
| 30 | COST_OUT_STORAGE_UOM |  |  |  | VARCHAR (4) | Contains the unit of measure to which the cost of outside storage is applicable. This unit of measure may only be pallet or from the volume class. |
| 31 | SUPP_UNIT_COST |  |  | Y | NUMERIC (20,4) | Contains the suppliers current cost for the item without deals applied. This value is held in the suppliers currency. |
| 32 | UNIT_COST |  |  | Y | NUMERIC (20,4) | Contains the unit cost to be used by the order building libraries. The value of this column is defaulted to match that of the supp_unit_cost but may be modified by the user via the buyer worksheet online dialog. Contains the suppliers current cost for the item without deals applied. This value is held in the suppliers currency. |
| 33 | COST_MONEY |  |  | Y | NUMERIC (12,4) | Contains the cost of money used in the Investment Buy calculation, defined as the annualized percentage cost to borrow capital for investing |
| 34 | MAX_WEEKS_SUPPLY |  |  | Y | NUMERIC (3) | Contains the maximum weeks of supply used in the investment buy opportunity calculation. The calculation does not recommend an order quantity that would cause the warehouse to have a stock level that would last, based on weekly issues forecasts, a number of weeks greater than this value. |
| 35 | TARGET_ROI |  |  | Y | NUMERIC (12,4) | Contains the minimum return on investment used in the Investment Buy calculation. This percentage must be met or exceeded if the Investment Buy calculation is to recommend an order quantity. |
| 36 | DAYS_TO_EVENT |  |  | Y | NUMERIC (3) | Contains the number of days until the deal end or cost increase that prompted the investment buy opportunity. |
| 37 | CURRENT_COST |  |  | Y | NUMERIC (20,4) | Contains the current deal cost of the item. Contains the suppliers current cost for the item without deals applied. This value is held in the suppliers currency. |
| 38 | FUTURE_COST |  |  | Y | NUMERIC (20,4) | Contains the deal cost of the item used in the ROI calculation. This field is held in the suppliers currency. |
| 39 | NEXT_EVENT_DATE |  |  |  | Date | Contains the next upcoming cost event that occurs after the current cost event (that prompted the investment buy opportunity) and causes the items future cost to be equal to or lesser than the current cost. If no upcoming events satisfy the above criteria, the column will not be populated. This date is provided since upcoming cost events that cause the future cost to be less than or equal to the current cost can affect the recommended order quantity of the investment buy. |
| 40 | TARGET_DATE |  |  | Y | Date | Contains the date through which the RAW_ROQ should supply the location, based on existing forecasts. |
| 41 | ROI |  |  | Y | NUMERIC (12,4) | Contains the actual return on investment computed by the Investment Buy calculation. If this value exceeds the value held in the TARGET_ROI column, the value contained in the RAW_ROQ column should be greater than zero. |
| 42 | RAW_ROQ |  |  | Y | NUMERIC (12,4) | Contains the recommended order quantity as computed by the investment buy opportunity calculation. This value is not rounded. |
| 43 | ORDER_ROQ |  |  | Y | NUMERIC (12,4) | Contains the actual quantity of the investment buy that is sent to the ordering process. It is defaulted to the RAW_ROQ when the record is created but may be modified in the buyer worksheet online dialog. This quantity may be rounded by the user via the buyer worksheet.. |
| 44 | LAST_ROUNDED_QTY |  |  |  | NUMERIC (12,4) | This column will hold the most recent system rounded order quantity value for the line item. |
| 45 | LAST_GRP_ROUNDED_QTY |  |  |  | NUMERIC (12,4) | This column will hold the last system rounded order quantity for the rounding group the location is apart of. |
| 46 | IB_ORDER_CTRL |  |  | Y | VARCHAR (6) | Contains the order control associated with the line item. A value of Manual dictates that investment buy ROQs will only be written to the Investment Buy Results table and will not be processed by any online or batch processes. A value of Buyer Worksheet dictates that investment buy ROQs will be processed solely via the buyer worksheet online dialog. A value of Semi-Automatic dictates that investment buy ROQs will be added to Worksheet orders by the replenishment automatic order building process. A value of Automatic dictates that investment buy ROQs will be added to Approved orders by the replenishment automatic order building process. |
| 47 | ORDER_NO |  |  |  | NUMERIC (12) | Contains the order number associated with the line item. This column will be populated via the replenishment order building libraries, which are called during batch processing or by the buyer worksheet online dialog. If the line item has not been associated with an order, the column will not be populated. |
| 48 | AUDSID |  |  |  | NUMERIC | Contains the oracle session ID associated with the line item. The value is used to group line items selected online in the buyer worksheet dialog and facilitates interaction with the order building libraries. |

---

## Table: IF_ERRORS

**Description:** When an error occurs during a validation upload or PDLP program (which insert into base tables), a record will be written to this table. Multiple records can be written for one row of information being inserted into a base table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROGRAM_NAME |  |  |  | VARCHAR (100) | Contains the name of the program which had error. |
| 2 | ERR_DATE |  |  |  | Date | Contains the date and time error occurred. |
| 3 | UNIT_OF_WORK |  |  |  | VARCHAR (250) | Contains detailed information as to which record failed. For example: Vendor 1000000000, Address type 04 |
| 4 | ERROR |  |  |  | VARCHAR (255) | Description of what the error is. |

---

## Table: IF_RDF_DIFF_MAP

**Description:** This table holds the mapping of diffs used by the merchandise heirarchy RETL extracts. It maps diff types inside RMS to the 10-diff positions in the RDF upload file spec (file position). It also deals with key length constraints by mapping diff_types to 1 character identifies (rdf_diff_type_map). This table is dba maintained.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DIFF_TYPE | P |  | Y | VARCHAR (6) | Contains the value used to uniquely identify the diff type. |
| 2 | FILE_POSITION |  |  | Y | NUMERIC (2) | This field indicates which position on the output file (1-10) a diff_type should be mapped to. |
| 3 | RDF_DIFF_TYPE_MAP |  |  | Y | VARCHAR (1) | This field assigns a 1-character identifier to each diff_type that is being mapped to RDF. This is done to help alleviate key field length concerns. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_IF_RDF_DIFF_MAP|PK||||DIFF_TYPE|ASC|
|UK2_IF_RDF_DIFF_MAP|UK||||RDF_DIFF_TYPE_MAP|ASC|
|UK_IF_RDF_DIFF_MAP|UK||||FILE_POSITION|ASC|

---

## Table: ITEM_APPROVAL_ERROR

**Description:** This table will hold all the errors encountered during item submission/approval process.Errors will be removed from this table after successfull submission/approval of an item.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  | F | Y | VARCHAR (25) | Unique alphanumeric value that identifies the item. |
| 2 | ERROR_KEY |  |  | Y | VARCHAR (25) | This column holds the error key that describes this error. The error description is stored in RTK_ERRORS table for each error key. |
| 3 | SYSTEM_REQ_IND |  |  | Y | VARCHAR (1) | Errors caused by fields which are mandatorily required by system and cannot be overridden by user will have this indicator as Y. Example of such fields are country of manufacture, supplier, unit retail etc. |
| 4 | OVERRIDE_IND |  |  | Y | VARCHAR (1) | In some instances, errors like case dimensions not defined for an item can be overridden by user. If an error has been overriden by the user then this indicator will be set to Y. A system required error cannot be overridden. If the error has already been overridden, system will ignore this error and not create duplicates during re-submission/re-approval process. |
| 5 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | Holds the Oracle user-id of the user who most recently updated this record. |
| 6 | LAST_UPDATE_DATETIME |  |  | Y | Date | Holds the date time stamp of the most recent update by the last_update_id. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|ITEM_APPROVAL_ERROR_I1|UN||||ITEM|ASC|
||||||ERROR_KEY|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_ITEM_APP_ERROR_OVERRIDE_IN|OVERRIDE_IND in ('Y', 'N')<br>|
||CHK_ITEM_APP_ERROR_SYS_REQ_IND|SYSTEM_REQ_IND in ('Y', 'N')<br>|






|Type|Column / Constraint Name|Details|
|---|---|---|
|Column Level|SYSTEM_REQ_IND||
||OVERRIDE_IND||

---

## Table: ITEM_CHRG_DETAIL

**Description:** This table holds Up Charge components and their associated information for a given item/from location/to location combination. These Up Charges are incurred when transferring the items between the from and the to locations.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM | P | F | Y | VARCHAR (25) | This field contains the unique identifier for the item for which the upcharges are being defined. |
| 2 | FROM_LOC | P | F | Y | NUMERIC (10) | This field contains the unique identifier for the location from which goods will be transferred. This is a store, warehouse or external finisher if the FROM_LOC_TYPE is S, W or E respectively. |
| 3 | TO_LOC | P | F | Y | NUMERIC (10) | This field contains the unique identifier for the location to which goods will be transferred. This is a store, warehouse or external finisher if the TO_LOC_TYPE is S, W or E respectively. |
| 4 | COMP_ID | P | F | Y | VARCHAR (10) | This field contains the unique identifier of the Up Charge component. |
| 5 | FROM_LOC_TYPE |  |  | Y | VARCHAR (1) | This field contains the type of location from which goods will be transferred. This column can contain either S for store, W for warehouse, or E for External Finisher. |
| 6 | TO_LOC_TYPE |  |  | Y | VARCHAR (1) | This field contains the type of location to which goods will be transferred. This column can contain either S for store, W for warehouse, or E for External Finisher. |
| 7 | COMP_RATE |  |  | Y | NUMERIC (20,4) | This field contains the rate to be charged against the cost of the Item/To Location combinations within the department. The value in this field will be a percentage if the calculation basis is V (Value), and a monetary amount if the calculation basis is S (Specific). |
| 8 | PER_COUNT |  |  |  | NUMERIC (12,4) | This field contains a count indicating the amount of the Per Count Unit of Measure to which the rate applies. This column will only contain a value if the calculation basis is S (Specific). For example, when creating an Up Charge that is defined as $.20 for every 10 kilograms of an item transferred, the Per Count would be 10. |
| 9 | PER_COUNT_UOM |  | F |  | VARCHAR (4) | This field contains the unit of measure in which the Per Count is specified. This column will only contain a value if the calculation basis is S (Specific). For example, when creating an Up Charge that is defined as $.20 for every 10 kilograms of an item transferred, the Per Count UOM would be the Unit of Measure code for Kilograms. |
| 10 | UP_CHRG_GROUP |  |  | Y | VARCHAR (6) | This field contains the group to which the component ID belongs. Valid values can be found on the codes table with a code type of UCHG. |
| 11 | COMP_CURRENCY |  | F | Y | VARCHAR (3) | This field contains the currency of the Up Charge component. |
| 12 | DISPLAY_ORDER |  |  | Y | NUMERIC (2) | This field contains the order in which the components should be displayed. A value of 0 (zero) indicates that the component will not be displayed in RMS screens, but the assoicated value will be included in the calculations. |
| 13 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |
| 14 | CREATE_DATETIME |  |  | Y | Date | This column holds the record creation date. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_ITEM_CHRG_DETAIL|PK||||ITEM|ASC|
||||||FROM_LOC|ASC|
||||||TO_LOC|ASC|
||||||COMP_ID|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|ITEM_CHRG_DETAIL_I1|||||COMP_CURRENCY|ASC|
|ITEM_CHRG_DETAIL_I3|||||PER_COUNT_UOM|ASC|
|ITEM_CHRG_DETAIL_I2|||||COMP_ID|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_IT_CHRG_DETAIL_FROM_LOC_TY|FROM_LOC_TYPE in ('S', 'W', 'E')<br>|
||CHK_IT_CHRG_DETAIL_TO_LOC_TYPE|TO_LOC_TYPE in ('S', 'W', 'E')<br>|

---

## Table: ITEM_CHRG_HEAD

**Description:** This table holds all the source/destination location combinations between which upcharges will be incurred while transferring an item.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM | P | F | Y | VARCHAR (25) | Alphanumeric value which identifies the item. |
| 2 | FROM_LOC | P |  | Y | NUMERIC (10) | Contains the location number of the location from which transferring goods will incur upcharges. This column can contain either a store, warehouse or external finisher. |
| 3 | TO_LOC | P |  | Y | NUMERIC (10) | Contains the location number of the location to which tranferring goods will incur upcharges. This column can contain either a store, warehouse or external finisher. |
| 4 | FROM_LOC_TYPE |  |  | Y | VARCHAR (1) | Contains the type of location from which goods will be transferred. Valid values are S for store, W for warehouse, or E for External Finisher. |
| 5 | TO_LOC_TYPE |  |  | Y | VARCHAR (1) | Contains the type of location to which goods will be transferred. Valid values are S for store, W for warehouse, or E for External Finisher. |
| 6 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |
| 7 | CREATE_DATETIME |  |  | Y | Date | This column holds the record creation date. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_ITEM_CHRG_HEAD|PK||||ITEM|ASC|
||||||FROM_LOC|ASC|
||||||TO_LOC|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_IT_CHRG_HEAD_FROM_LOC_TYPE|FROM_LOC_TYPE in ('S', 'W', 'E')<br>|
||CHK_IT_CHRG_HEAD_TO_LOC_TYPE|TO_LOC_TYPE in ('S', 'W', 'E')<br>|

---

## Table: ITEM_COST_DETAIL

**Description:** This table contains the details of the components that makes up the items cost. This table can hold the details like tax and expenses which are part of the items cost.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM | P | F | Y | VARCHAR (25) | Alphanumeric value which identifies the item. |
| 2 | SUPPLIER | P | F | Y | NUMERIC (10) | Unique identifier for the supplier/supplier site of the item. |
| 3 | ORIGIN_COUNTRY_ID | P | F | Y | VARCHAR (3) | Country from where the item was sourced. |
| 4 | DELIVERY_COUNTRY_ID | P | F | Y | VARCHAR (3) | Country to which the item will be delivered to. |
| 5 | COND_TYPE | P |  | Y | VARCHAR (10) | This will hold the condition type applicable on the items cost. Condition can be a tax code or an expense or a type of a cost of the item. |
| 6 | COND_VALUE |  |  |  | NUMERIC (20,4) | This will hold the condition value or tax amount per of the corresponding condition. |
| 7 | APPLIED_ON |  |  |  | NUMERIC (20,4) | This will hold the cost on which a particular condition should be applied. |
| 8 | COMP_RATE |  |  |  | NUMERIC (20,10) | This will hold the rate of the condition applied. |
| 9 | CALCULATION_BASIS |  |  |  | VARCHAR (1) | Indicates if the comp_rate is a percentage or an amount value. Valid values are: P - percent, V - amount value. |
| 10 | RECOVERABLE_AMOUNT |  |  |  | NUMERIC (20,4) | Hold the recoverable amount of tax applied on the item. |
| 11 | MODIFIED_TAXABLE_BASE |  |  |  | NUMERIC (20,4) | This column will hold the cost on which the taxes were applied. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_ITEM_COST_DETAIL|PK||||ITEM|ASC|
||||||SUPPLIER|ASC|
||||||ORIGIN_COUNTRY_ID|ASC|
||||||DELIVERY_COUNTRY_ID|ASC|
||||||COND_TYPE|ASC|
|ITEM_COST_DETAIL_I1|||||ITEM|ASC|
||||||SUPPLIER|ASC|
||||||ORIGIN_COUNTRY_ID|ASC|
||||||DELIVERY_COUNTRY_ID|ASC|

---

## Table: ITEM_COST_HEAD

**Description:** This table contains the item costing record for each item-supplier-country-delivery country.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM | P | F | Y | VARCHAR (25) | Alphanumeric value which identifies the item. |
| 2 | SUPPLIER | P | F | Y | NUMERIC (10) | Unique identifier for the supplier/supplier site of the item |
| 3 | ORIGIN_COUNTRY_ID | P | F | Y | VARCHAR (3) | Country where the item will be sourced from by the supplier. |
| 4 | DELIVERY_COUNTRY_ID | P | F | Y | VARCHAR (3) | Country to which the item will be delivered to. |
| 5 | PRIM_DLVY_CTRY_IND |  |  | Y | VARCHAR (1) | Indicates if the country is the primary delivery country of the item. |
| 6 | NIC_STATIC_IND |  |  | Y | VARCHAR (1) | Indicates if the Negotiated Item Cost (NIC) is static or not. If NIC is static then the BASE COST of the item will vary based on the location/tax region. If NIC is not static then it will vary based on the location/tax region. |
| 7 | BASE_COST |  |  | Y | NUMERIC (20,4) | This will hold the tax exclusive cost of the item. |
| 8 | NEGOTIATED_ITEM_COST |  |  | Y | NUMERIC (20,4) | This will hold the supplier negotiated item cost. |
| 9 | EXTENDED_BASE_COST |  |  | Y | NUMERIC (20,4) | This will hold the extended base cost of the item. Extended base cost is the cost inclusive of all the taxes that affect the WAC. |
| 10 | INCLUSIVE_COST |  |  | Y | NUMERIC (20,4) | This will hold the inclusive cost of the item. This includes both the recoverable and non-recoverable taxes. |

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_ICH_NIC_STATIC_IND|NIC_STATIC_IND IN ('Y','N')<br>|
||CHK_ICH_PRIM_DLVY_CTRY_IND|PRIM_DLVY_CTRY_IND IN ('Y','N')<br>|
|Column Level|PRIM_DLVY_CTRY_IND||
||NIC_STATIC_IND||

---

## Table: ITEM_COUNTRY

**Description:** This table holds the list of all the countries where an item can be transacted (purchased/sold/transferred).

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM | P | F | Y | VARCHAR (25) | This column contains the unique alphanumeric value which identifies the item. |
| 2 | COUNTRY_ID | P | F | Y | VARCHAR (3) | This column contains the unique code that identifies the country, which is associated with the item. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_ITEM_COUNTRY|PK||||ITEM|ASC|
||||||COUNTRY_ID|ASC|

---

## Table: ITEM_COUNTRY_L10N_EXT

**Description:** In a GTAX (where SYSTEM_OPTIONS.DEFAULT_TAX_TYPE = GTAX ) environment, this table holds the fiscal attributes of a country associated with each item. Currently, Brazil is the only country supported for GTAX; the fiscal attributes like NCM Codes, NCM types required for an item in Brazil will be stored in this table. This table will not be populated for SVAT/US Sales Tax enviornment.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM | P | F | Y | VARCHAR (25) | This column contains the unique alphanumeric value which identifies the item. |
| 2 | COUNTRY_ID | P | F | Y | VARCHAR (3) | This column contains the unique code that identifies the country, which is associated with the item. |
| 3 | L10N_COUNTRY_ID | P | F | Y | VARCHAR (3) | This column holds the country this extended data is associated with. The logical business meaning of the VARCHAR_, NUMBER_ and DATE_ columns on this table are determined by the metadata defined for this country in its localization pack. |
| 4 | GROUP_ID | P | F | Y | NUMERIC (10) | This column holds the attribute group id that this extended data is associated with. The logical business meaning of the VARCHAR_, NUMBER_ and DATE_ columns on this table are determined by the metadata defined for this country/attribute group in the countrys localization pack. |
| 5 | VARCHAR2_1 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references VARCHAR2_1 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 6 | VARCHAR2_2 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references VARCHAR2_2 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 7 | VARCHAR2_3 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references VARCHAR2_3 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 8 | VARCHAR2_4 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references VARCHAR2_4 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 9 | VARCHAR2_5 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references VARCHAR2_5 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 10 | VARCHAR2_6 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references VARCHAR2_6 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 11 | VARCHAR2_7 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references VARCHAR2_7 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 12 | VARCHAR2_8 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references VARCHAR2_8 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 13 | VARCHAR2_9 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references VARCHAR2_9 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 14 | VARCHAR2_10 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references VARCHAR2_10 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 15 | NUMBER_11 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references NUMBER_11 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 16 | NUMBER_12 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references NUMBER_12 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 17 | NUMBER_13 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references NUMBER_13 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 18 | NUMBER_14 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references NUMBER_14 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 19 | NUMBER_15 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references NUMBER_15 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 20 | NUMBER_16 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references NUMBER_16 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 21 | NUMBER_17 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references NUMBER_17 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 22 | NUMBER_18 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references NUMBER_18 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 23 | NUMBER_19 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references NUMBER_19 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 24 | NUMBER_20 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references NUMBER_20 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 25 | DATE_21 |  |  |  | Date | This column holds data related to the attribute defined on the L10N_ATTRIB table that references DATE_21 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 26 | DATE_22 |  |  |  | Date | This column holds data related to the attribute defined on the L10N_ATTRIB table that references DATE_22 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_ITEM_COUNTRY_L10N_EXT|PK||||ITEM|ASC|
||||||COUNTRY_ID|ASC|
||||||L10N_COUNTRY_ID|ASC|
||||||GROUP_ID|ASC|

---

## Table: ITEM_DIFF_LOC_HIST

**Description:** This table will hold the rolled up sales history for items with a diff_id.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM | P |  | Y | VARCHAR (25) | Unique alphanumeric value that identifies the item. |
| 2 | DIFF_ID | P |  | Y | VARCHAR (10) | This field that differentiates the current item from its item_parent. For an item that is not a parent, this field may contain a value (34X34, Red, etc.) Valid values are found on the diff_id tables. |
| 3 | LOCATION | P |  | Y | NUMERIC (10) | Contains the location corresponding to the sales information for the Item/diff. |
| 4 | LOC_TYPE |  |  | Y | VARCHAR (1) | Contains the type of location. |
| 5 | EOW_DATE | P |  | Y | Date | Contains the end of the week date from which the sales totals are gathered. |
| 6 | SALES_TYPE | P |  | Y | VARCHAR (1) | Indicates the type of sale which generated the sales. Valid values are: R - Regular, P - Promotional, and C - Clearance |
| 7 | WEEK_454 |  |  |  | NUMERIC (2) | Contains the number of the 454 week for the sales figures. |
| 8 | MONTH_454 |  |  |  | NUMERIC (2) | Contains the number of the 454 month for the sales figures. |
| 9 | YEAR_454 |  |  |  | NUMERIC (4) | Contains the number of the 454 year for the sales figures. |
| 10 | SALES |  |  |  | NUMERIC (12,4) | Contains the number of units sold for the Item/Store/week/sales_type combination. |
| 11 | VALUE |  |  |  | NUMERIC (20,4) | Contains the retail value received on the sales for the Item/Store/week/sales_type combination. This field is stored in the local currency. |
| 12 | GP |  |  |  | NUMERIC (20,4) | GP (Gross profit) is calculated for each sale of an item as (sales retail - cost of sales), where sales retail is the actual retail sold for this item, and cost of sales is either av_cost (weighted average cost) or unit_cost (primary supplier cost) on itemloc table, depending on system_options.std_av_ind = A or S, respectively. |
| 13 | STOCK |  |  |  | NUMERIC (12,4) | Contains the stock on hand for the Item/Store combination at the end of the week. |
| 14 | RETAIL |  |  |  | NUMERIC (20,4) | Contains the unit retail price of the Item at the store at the end of the week. This field is stored in the local currency. |
| 15 | AV_COST |  |  |  | NUMERIC (20,4) | Contains the average cost of the Item at the store at the end of the week. This field is stored in the local currency. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_ITEM_DIFF_LOC_HIST|PK||||ITEM|ASC|
||||||DIFF_ID|ASC|
||||||LOCATION|ASC|
||||||EOW_DATE|ASC|
||||||SALES_TYPE|ASC|

---

## Table: ITEM_DIFF_LOC_HIST_MTH

**Description:** This table will hold the rolled up sales history for items with a diff_id by month.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  |  | Y | VARCHAR (25) | Unique alphanumeric value that identifies the item. |
| 2 | DIFF_ID |  |  | Y | VARCHAR (10) | This field that differentiates the current item from its item_parent. For an item that is not a parent, this field may contain a value (34X34, Red, etc.). Valid values are found on the diff_id tables. |
| 3 | LOCATION |  |  | Y | NUMERIC (10) | Number of the location in which the item is to be found. This field may contain a store or a warehouse. |
| 4 | LOC_TYPE |  |  | Y | VARCHAR (1) | Type of location in the location field. Valid values are: S = Store, W = Warehouse |
| 5 | EOM_DATE |  |  | Y | Date | End of the month date for which the sales totals are gathered. |
| 6 | SALES_TYPE |  |  | Y | VARCHAR (1) | Indicates the type of sale or inventory movement. Valid Values are: R = Regular Sales, P = Promotional Sales, C = Clearance Sales, I = Issues from Warehouses to Stores Regular sales, promotional sales and clearance sales can occur at stores. Issues occur only at warehouses. |
| 7 | MONTH_454 |  |  | Y | NUMERIC (2) | Number of the 454 year for the sales figures. |
| 8 | YEAR_454 |  |  |  | NUMERIC (4) | Number of the 454 year for the sales figures. |
| 9 | SALES |  |  | Y | NUMERIC (12,4) | Contains the number of units sold for the Item/Store/month/sales_type combination. |
| 10 | VALUE |  |  |  | NUMERIC (20,4) | Retail value received on the sales for the item/location/week/sales_type combination. This field is stored in the local currency. This field will only hold a value for stores. |
| 11 | GP |  |  |  | NUMERIC (20,4) | Gross profit calculated for each sale of an item as (sales retail - cost of sales). Sales retail is the actual retail sold for this item. Cost of sales is either av_cost (weighted average cost when system_options.std_av_ind = A), or unit_cost (primary supplier cost when system_options.std_av_ind = S) on item_loc table. This field will only hold a value for stores. |
| 12 | STOCK |  |  |  | NUMERIC (12,4) | Stock on hand for the item/location combination at the end of the week. |
| 13 | RETAIL |  |  |  | NUMERIC (20,4) | Unit retail price of the item at the location at the end of the week. This field is stored in the local currency. |
| 14 | AV_COST |  |  |  | NUMERIC (20,4) | Average cost of the item at the location at the end of the week. This field is stored in the local currency. |

---

## Table: ITEM_EXPORT_INFO

**Description:** This table helps the export of item data. Any item which is newly created will be recorded in this table. Once the data has been exported from this table can the other detail information be exported.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM | P |  | Y | VARCHAR (25 ) | Contains the code that uniquely identifies the item. |
| 2 | BASE_EXTRACTED_IND |  |  | Y | VARCHAR (1 ) | Indicates whether the record has been extracted or not. Upon record insert, this will be set to â€˜Nâ€™. After running the batch job, this will then be set to â€˜Yâ€™. |
| 3 | CUSTOM1_EXTRACTED_IND |  |  |  | VARCHAR (1 ) | Indicates whether the record has been extracted or not for a custom extraction. |
| 4 | CUSTOM2_EXTRACTED_IND |  |  |  | VARCHAR (1 ) | Indicates whether the record has been extracted or not for a custom extraction. |
| 5 | CUSTOM3_EXTRACTED_IND |  |  |  | VARCHAR (1 ) | Indicates whether the record has been extracted or not for a custom extraction. |
| 6 | CUSTOM4_EXTRACTED_IND |  |  |  | VARCHAR (1 ) | Indicates whether the record has been extracted or not for a custom extraction. |
| 7 | PROCESS_ID |  |  |  | NUMERIC (15) | Process ID where the record belongs to. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_ITEM_EXPORT_INFO|PK||||ITEM|ASC|

---

## Table: ITEM_EXPORT_STG

**Description:** This is table is a staging table for item records as they wait to be extracted. This table is automatically inserted into, as records are processed by Oracle Retail. This table will be scanned by a daily batch job to extract new, updated and deleted of approved sellable items.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SEQ_NO | P |  | Y | NUMERIC (15) | The sequence in which the records are placed in the table. |
| 2 | ITEM |  |  | Y | VARCHAR (25 BYTE) | Contains the code that uniquely identifies the item. |
| 3 | LOC |  |  |  | NUMERIC (10) | Contains the location, to which item is ranged. |
| 4 | LOC_TYPE |  |  |  | VARCHAR (1 BYTE) | Contains the location type. |
| 5 | VAT_REGION |  |  |  | NUMERIC (4) | Contains the VAT region associated to the item. |
| 6 | VAT_CODE |  |  |  | VARCHAR (6 BYTE) | Contains the VAT code associated to the item for a particular vat region. |
| 7 | VAT_ACTIVE_DATE |  |  |  | Date (7) | The date that the VAT rate became active for the item/VAT region combination. |
| 8 | VAT_TYPE |  |  |  | VARCHAR (1) |  |
| 9 | MERCHANDISE_IND |  |  |  | VARCHAR (1) | This field indicates if the item is a merchandise item or not. |
| 10 | ACTION_TYPE |  |  | Y | VARCHAR (15 BYTE) | Indicates if an item related record has been added, changed or deleted. Valid values are 'itemhdrmod', 'itemhdrdel', 'itemloccre', 'itemlocmod', 'itemlocdel', 'vatitemcre', 'vatitemmod' and 'vatitemdel'. |
| 11 | BASE_EXTRACTED_IND |  |  | Y | VARCHAR (1 BYTE) | Indicates whether the record has been extracted or not. Upon record insert, this will be set to 'N'. After running the batch job, this will then be set to 'Y'. |
| 12 | CUSTOM1_EXTRACTED_IND |  |  |  | VARCHAR (1 BYTE) | Indicates whether the record has been extracted or not for a custom extraction. |
| 13 | CUSTOM2_EXTRACTED_IND |  |  |  | VARCHAR (1 BYTE) | Indicates whether the record has been extracted or not for a custom extraction. |
| 14 | CUSTOM3_EXTRACTED_IND |  |  |  | VARCHAR (1 BYTE) | Indicates whether the record has been extracted or not for a custom extraction. |
| 15 | CUSTOM4_EXTRACTED_IND |  |  |  | VARCHAR (1 BYTE) | Indicates whether the record has been extracted or not for a custom extraction. |
| 16 | PROCESS_ID |  |  |  | NUMERIC (15) | Process ID where the record belongs to. |
| 17 | TRANSACTION_DATETIME |  |  | Y | Date (7) | Time of record creation. |
| 18 | ITEM_PARENT |  |  |  | VARCHAR (25 ) | This field uniquely identifies the item/group at the level above the item. |
| 19 | ITEM_GRANDPARENT |  |  |  | VARCHAR (25 ) | This field uniquely identifies the item/group two levels above the item. |
| 20 | ITEM_LEVEL |  |  |  | NUMERIC (1) | Indicates which of the three levels the item resides. The item level determines if the item stands alone or if it is part of a family of related items. |
| 21 | TRAN_LEVEL |  |  |  | NUMERIC (1) | Indicates which of the three levels transactions occur for the item group. The transaction level is the level at which the items' inventory is tracked in the system. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_ITEM_EXPORT_STG|PK||||SEQ_NO|ASC|
|ITEM_EXPORT_STG_I1|||||ITEM|ASC|
||||||LOC|ASC|
||||||LOC_TYPE|ASC|
||||||ACTION_TYPE|ASC|

---

## Table: ITEM_EXP_DETAIL

**Description:** This table holds Item Expense Detail information. This information indicates the expenses incurred when moving goods from a particular origin country/lading port to a discharge port in another country, or from a discharge port to a particular zone in the destination country.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM | P | F | Y | VARCHAR (25) | Alphanumeric value that identifies the item. |
| 2 | SUPPLIER | P | F | Y | NUMERIC (10) | The unique identifier for the supplier. |
| 3 | ITEM_EXP_TYPE | P | F | Y | VARCHAR (1) | Contains the type of expense. Valid values are Z (Zone), or C (Country). Zone expenses consist of expenses that are incurred from the movement of goods between a particular discharge port to a zone within |
| 4 | ITEM_EXP_SEQ | P | F | Y | NUMERIC (6) | Contains a sequence number that is used to distinguish between the different Item/Supplier expenses. |
| 5 | COMP_ID | P | F | Y | VARCHAR (10) | Contains a user specified code representing a specific expense found on the ELC_COMP table. |
| 6 | CVB_CODE |  | F |  | VARCHAR (10) | Contains a code representing the base value for calculating an expense. |
| 7 | COMP_RATE |  |  | Y | NUMERIC (20,4) | Contains the rate to be charged against the calculation base. |
| 8 | COMP_CURRENCY |  | F | Y | VARCHAR (3) | Contains the currency the expense or assessment is to be entered in. If the Calculation Basis is V (Value), then the comp_currency will be NULL. |
| 9 | PER_COUNT |  |  |  | NUMERIC (12,4) | Contains a count indicating the amount of the Per Count Unit of Measure to which the rate applies. |
| 10 | PER_COUNT_UOM |  | F |  | VARCHAR (4) | Contains the unit of measure in which the Per Count is specified. |
| 11 | EST_EXP_VALUE |  |  | Y | NUMERIC (26,10) | Contains the calculated value of the Component. |
| 12 | NOM_FLAG_1 |  |  | Y | VARCHAR (1) | Contains a flag that is used to indicate the status of this particular nomination flag for a given expense. Valid values are N, +, and -. |
| 13 | NOM_FLAG_2 |  |  | Y | VARCHAR (1) | Contains a flag that is used to indicate the status of this particular nomination flag for a given expense. Valid values are N, +, and -. If ALC is turned on (i.e. system_options.import_ind = Y), nom_flag_2 is used to indicate the status of a component in duty calculation nom_flag_4 is used to indicate the status of a component in ELC calculation nom_flag_5 is used to indicate the status of a component in ALC calculation i.e. these 3 flags can not be used for any other purposes if ALC is turned on. |
| 14 | NOM_FLAG_3 |  |  | Y | VARCHAR (1) | Contains a flag that is used to indicate the status of this particular nomination flag for a given expense. Valid values are N, +, and -. |
| 15 | NOM_FLAG_4 |  |  | Y | VARCHAR (1) | Contains a flag that is used to indicate the status of this particular nomination flag for a given expense. Valid values are N, +, and -. If ALC is turned on (i.e. system_options.import_ind = Y), nom_flag_2 is used to indicate the status of a component in duty calculation nom_flag_4 is used to indicate the status of a component in ELC calculation nom_flag_5 is used to indicate the status of a component in ALC calculation i.e. these 3 flags can not be used for any other purposes if ALC is turned on. |
| 16 | NOM_FLAG_5 |  |  | Y | VARCHAR (1) | Contains a flag that is used to indicate the status of this particular nomination flag for a given expense. Valid values are N, +, and -. If ALC is turned on (i.e. system_options.import_ind = Y), nom_flag_2 is used to indicate the status of a component in duty calculation nom_flag_4 is used to indicate the status of a component in ELC calculation nom_flag_5 is used to indicate the status of a component in ALC calculation i.e. these 3 flags can not be used for any other purposes if ALC is turned on. |
| 17 | DISPLAY_ORDER |  |  | Y | NUMERIC (2) | Contains a numeric value that determines the display order of the expense or assessment when used in other modules. |
| 18 | CREATE_DATETIME |  |  | Y | Date | Date/time stamp of when the record was created. This date/time will be used in export processing. This value should only be populated on insert - it should never be updated. |
| 19 | LAST_UPDATE_DATETIME |  |  | Y | Date | Holds the date time stamp of the most recent update by the last_update_id. This field is required by the database. |
| 20 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | Holds the Oracle user-id of the user who most recently updated this record. This field is required by the database. |
| 21 | DEFAULTED_FROM |  |  |  | VARCHAR (1) | This field specifies the source from which the expense is been defaulted to the item. Valid values are, P - defaulted from a partner expense profile, S - defaulted from a supplier expense profile, C - defaulted from a country expense profile, M - manually added expenses. |
| 22 | KEY_VALUE_1 |  |  |  | VARCHAR (20) | This will hold either the supplier value or Origin_country_id or the partner type, depending on the value of the defaulted_from column. |
| 23 | KEY_VALUE_2 |  |  |  | VARCHAR (20) | When the expense is defaulted from a partner, this column will hold the value of the partner id. |
| 24 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_ITEM_EXP_DETAIL|PK||||ITEM|ASC|
||||||SUPPLIER|ASC|
||||||ITEM_EXP_TYPE|ASC|
||||||ITEM_EXP_SEQ|ASC|
||||||COMP_ID|ASC|
|ITEM_EXP_DETAIL_I2|||||CVB_CODE|ASC|
|ITEM_EXP_DETAIL_I4|||||PER_COUNT_UOM|ASC|
|ITEM_EXP_DETAIL_I3|||||COMP_ID|ASC|
|ITEM_EXP_DETAIL_I1|||||COMP_CURRENCY|ASC|

### Constraints

|Type|Column / Constraint<br>Name|Details|
|---|---|---|
|Table Level|CHK_IED_DEFAULTED_FROM|DEFAULTED_FROM in ('P','C','S','E','M')<br>|
||CHK_IED_ITEM_EXP_TYPE|ITEM_EXP_TYPE IN ('Z','C')<br>|
||CHK_IED_NOM_FLAG_1|NOM_FLAG_1 in ('N','+','-')<br>|






|Type|Column / Constraint<br>Name|Details|
|---|---|---|
||CHK_IED_NOM_FLAG_2|NOM_FLAG_2 in ('N','+','-')<br>|
||CHK_IED_NOM_FLAG_3|NOM_FLAG_3 in ('N','+','-')<br>|
||CHK_IED_NOM_FLAG_4|NOM_FLAG_4 in ('N','+','-')<br>|
||CHK_IED_NOM_FLAG_5|NOM_FLAG_5 in ('N','+','-')<br>|
|Column Level|NOM_FLAG_1||
||NOM_FLAG_2||
||NOM_FLAG_3||
||NOM_FLAG_4||
||NOM_FLAG_5||
||DEFAULTED_FROM||

---

## Table: ITEM_EXP_HEAD

**Description:** This table will hold one record for each Expense. If the Item Expense Type is Country, the expense will be associated with a given Item/Supplier/Origin Country/Lading Port/Discharge Port. Otherwise if the Item Expense Type is Zone the expense will be associated with a given Item/Supplier/Zone Group/Zone/Discharge Port.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM | P | F | Y | VARCHAR (25) | Alphanumeric value that identifies the item. |
| 2 | SUPPLIER | P | F | Y | NUMERIC (10) | The unique identifier for the supplier. |
| 3 | ITEM_EXP_TYPE | P |  | Y | VARCHAR (1) | Contains a the type of expense. Valid values are Z (Zone), or C (Country). Zone expenses consist of expenses that are incurred from the movement of goods between a particular discharge port to a zone within the discharge ports country. Country expenses consist of the expense incurred when moving goods from a particular origin country/lading port to a given discharge port. |
| 4 | ITEM_EXP_SEQ | P |  | Y | NUMERIC (6) | Contains a sequence number that is used to distinguish between the different Item/Supplier expenses. |
| 5 | ORIGIN_COUNTRY_ID |  | F |  | VARCHAR (3) | The country where the item was manufactured or significantly altered. |
| 6 | ZONE_ID |  |  |  | NUMERIC (10) | The final destination zone of the item. this field will only contain a value if the item_exp_type = Zone. |
| 7 | LADING_PORT |  |  |  | VARCHAR (5) | Contains the identification of the Landed Cost Country Profiles lading port. This field will only contain a value if the Expense Type is Country. |
| 8 | DISCHARGE_PORT |  |  | Y | VARCHAR (5) | The port where the item will enter the importing country. |
| 9 | ZONE_GROUP_ID |  |  |  | NUMERIC (4) | This field holds the items Zone Group, it is stored here for performance reasons. |
| 10 | BASE_EXP_IND |  |  | Y | VARCHAR (1) | Indicates whether or not this Set of Expenses is also the base Set of Expenses. Valid values are Y or N. |
| 11 | CREATE_DATETIME |  |  | Y | Date | Date/time stamp of when the record was created. This date/time will be used in export processing. This value should only be populated on insert - it should never be updated. |
| 12 | LAST_UPDATE_DATETIME |  |  | Y | Date | Holds the date time stamp of the most recent update by the last_update_id. This field is required by the database. |
| 13 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | Holds the Oracle user-id of the user who most recently updated this record. This field is required by the database. |
| 14 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_ITEM_EXP_HEAD|PK||||ITEM|ASC|
||||||SUPPLIER|ASC|
||||||ITEM_EXP_TYPE|ASC|
||||||ITEM_EXP_SEQ|ASC|
|ITEM_EXP_HEAD_I1|||||ITEM|ASC|
||||||SUPPLIER|ASC|
||||||ORIGIN_COUNTRY_ID|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_ITEM_EXP_HEAD_BASE_EXP_IND|base_exp_ind in ('Y','N')<br>|
||CHK_ITEM_EXP_HEAD_EXP_TYPE|(item_exp_type = 'Z' AND zone_group_id IS NOT NULL AND zone_id IS NOT NULL AND origin_country_id IS NULL AND lading_port IS<br>NULL) or (item_exp_type = 'C' AND zone_group_id IS NULL AND zone_id IS NULL AND origin_country_id is NOT NULL AND lading_port IS<br>NOT NULL)<br>|
|Column Level|BASE_EXP_IND||

---

## Table: ITEM_FORECAST

**Description:** Holds the item level forecasted information from the RDF extractions. This table will hold all item types. This table should be partitioned according to the domain level. While the development environment will create this table with a generic set-up, the exact partitioning scheme will be individual to the client. There should be at least one partition per domain_id.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM | P |  | Y | VARCHAR (25) | Alphanumeric value that identifies the item |
| 2 | LOC | P |  | Y | NUMERIC (10) | Contains the location corresponding to the sales information for the SKU. |
| 3 | EOW_DATE | P |  | Y | Date | Contains the end of the week date from which the sales totals are gathered. |
| 4 | DOMAIN_ID | P |  | Y | NUMERIC (3) | This field contains the unique number representing the domain. This domain number is used when interfacing data to external systems using domains. |
| 5 | FORECAST_SALES |  |  | Y | NUMERIC (12,4) | This field contains forecasted sales units for the given SKU/store/date combination. This field will only contain a value for sales_type = R. |
| 6 | FORECAST_STD_DEV |  |  | Y | NUMERIC (12,4) | This field contains the standard deviation value for the given SKU/store/date combination. This value represents the confidence level in the sales forecast. This field is used in the safety stock calculations for the Synamic replenishment method. This field will only contain a value for sales_type = R. |

---

## Table: ITEM_FORECAST_HIST

**Description:** Holds 4 weeks of history of the item level forecasted sales information from the RDF extractions. It is used to support the Inventory Variance to Forecast dashboard report. This table should be partitioned according to the end of week date.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM | P |  | Y | VARCHAR (25 BYTE) | Contains the item id. Only forecasted items will be on this table. |
| 2 | LOC | P |  | Y | NUMERIC (10) | Contains the location corresponding to the forecasted sales information for the Item. |
| 3 | EOW_DATE | P |  | Y | Date | Contains the end of the week date from which the forecasted sales totals are gathered. Since this history holds 4 weeks of history, it will be the previous eow_date with regard to the vdate and three previous to that. |
| 4 | FORECAST_SALES |  |  | Y | NUMERIC (12,4) | Contains forecasted sales units for the given item/store/date combination. This field will only contain a value for sales_type = R (regular sales). |
| 5 | FORECAST_STD_DEV |  |  | Y | NUMERIC (12,4) | Contains the standard deviation value for the given item/store/date combination. This value represents the confidence level in the sales forecast. This field is used in the safety stock calculations for the dynamic replenishment method. This field will only contain a value for sales_type = R (regular). |

---

## Table: ITEM_HTS

**Description:** This table holds the Harmonized Tariff Schedule (HTS) codes that are associated with a given item and associated details.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM | P | F | Y | VARCHAR (25) | Alphanumeric value that identifies the item. |
| 2 | HTS | P | F | Y | VARCHAR (25) | The unique identifier for the Harmonized Tariff Schedule code. |
| 3 | IMPORT_COUNTRY_ID | P | F | Y | VARCHAR (3) | The unique identifier for the country that the item will be imported into. |
| 4 | ORIGIN_COUNTRY_ID | P | F | Y | VARCHAR (3) | The country where the item was manufactured or significantly altered. |
| 5 | EFFECT_FROM | P | F | Y | Date | The date from which the Item/HTS relationship is valid. This field is used to maintain historical information related to the Item/HTS relationship. |
| 6 | EFFECT_TO | P | F | Y | Date | The date until when the Item/HTS relationship is valid. This field is used to maintain historical information related to the item/HTS relationship. |
| 7 | CLEARING_ZONE_ID |  |  | Y | VARCHAR (5) | The concept of 'clearing zone' represents a country's zone-level point of entry of goods (for example, zones within the country where the goods are clearing customs). No locations or cost zones are associated to a clearing zone. This field holds the Clearing Zone ID for the effective HTS code. Clearing zones are defined by import country. |
| 8 | STATUS |  |  | Y | VARCHAR (1) | Used to indicate the status of the Item/HTS relationship. Valid values are (W)orksheet and (A)pproved. |
| 9 | CREATE_DATETIME |  |  | Y | Date | Date/time stamp of when the record was created. This date/time will be used in export processing. This value should only be populated on insert - it should never be updated. |
| 10 | LAST_UPDATE_DATETIME |  |  | Y | Date | Holds the date time stamp of the most recent update by the LAST_UPDATE_ID. |
| 11 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | Holds the Oracle user-id of the user who most recently updated this record. |
| 12 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_ITEM_HTS|PK||||ITEM|ASC|
||||||HTS|ASC|
||||||IMPORT_COUNTRY_ID|ASC|
||||||ORIGIN_COUNTRY_ID|ASC|
||||||EFFECT_FROM|ASC|
||||||EFFECT_TO|ASC|
|ITEM_HTS_I1|||||ORIGIN_COUNTRY_ID|ASC|
|ITEM_HTS_I3|||||HTS|ASC|
||||||IMPORT_COUNTRY_ID|ASC|
||||||EFFECT_FROM|ASC|
||||||EFFECT_TO|ASC|
|ITEM_HTS_I2|||||IMPORT_COUNTRY_ID|ASC|

### Constraints

|Type|Column / Constraint<br>Name|Details|
|---|---|---|
|Table Level|CHK_ITEM_HTS_STATUS|STATUS in ('W','A')<br>|






|Type|Column / Constraint<br>Name|Details|
|---|---|---|
|Column Level|STATUS||

---

## Table: ITEM_HTS_ASSESS

**Description:** This table will store the assessments associated with a given item/hts code. These assessments are used in the compilation of Estimated and Actual Landed Cost for the item. Values will be stored in the systems primary currency.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM | P | F | Y | VARCHAR (25) | Alphanumeric identifier for the item. |
| 2 | HTS | P | F | Y | VARCHAR (25) | The unique identifier for the Harmonized Tariff Schedule code. |
| 3 | IMPORT_COUNTRY_ID | P | F | Y | VARCHAR (3) | The unique identifier for the country that the item will be imported into. |
| 4 | ORIGIN_COUNTRY_ID | P | F | Y | VARCHAR (3) | The country where the item was manufactured or significantly altered. |
| 5 | EFFECT_FROM | P | F | Y | Date | The date from which the Item/HTS relationship is valid. This field is used to maintain historical information related to the Item/HTS relationship. |
| 6 | EFFECT_TO | P | F | Y | Date | The date from which the Item/HTS relationship is valid. This field is used to maintain historical information related to the Item/HTS relationship. |
| 7 | COMP_ID | P | F | Y | VARCHAR (10) | The code representing the specific assessment component. |
| 8 | CVB_CODE |  | F |  | VARCHAR (10) | The Computation Value Base representing the base value for calculating the assessment. |
| 9 | COMP_RATE |  |  | Y | NUMERIC (20,4) | The rate to be charged against the calculation base. This field will hold a percentage value if the Calculation Basis of the Component is Value or a monetary amount if the Calculation Basis is Specific. |
| 10 | PER_COUNT |  |  |  | NUMERIC (12,4) | A count indicating the amount of the Per Count Unit of Measure to which the rate applies. This column is only used for specific (per-unit) assessments. |
| 11 | PER_COUNT_UOM |  | F |  | VARCHAR (4) | The unit of measure in which the Per Count is specified. This column is only used from specific (per-unit) assessments. |
| 12 | EST_ASSESS_VALUE |  |  | Y | NUMERIC (26,10) | Contains the calculated value of the Component. |
| 13 | NOM_FLAG_1 |  |  | Y | VARCHAR (1) | Contains a flag that is used to indicate the status of this particular nomination flag for a given expense. Valid values are N, +, and -. |
| 14 | NOM_FLAG_2 |  |  | Y | VARCHAR (1) | Contains a flag that is used to indicate the status of this particular nomination flag for a given expense. Valid values are N, +, and -. |
| 15 | NOM_FLAG_3 |  |  | Y | VARCHAR (1) | Contains a flag that is used to indicate the status of this particular nomination flag for a given expense. Valid values are N, +, and -. |
| 16 | NOM_FLAG_4 |  |  | Y | VARCHAR (1) | Contains a flag that is used to indicate the status of this particular nomination flag for a given expense. Valid values are N, +, and -. |
| 17 | NOM_FLAG_5 |  |  | Y | VARCHAR (1) | Contains a flag that is used to indicate the status of this particular nomination flag for a given expense. Valid values are N, +, and -. |
| 18 | DISPLAY_ORDER |  |  | Y | NUMERIC (2) | Contains a numeric value that determines the display order of the expense or assessment when used in other modules. |
| 19 | CREATE_DATETIME |  |  | Y | Date | Date/time stamp of when the record was created. This date/time will be used in export processing. This value should only be populated on insert - it should never be updated. |
| 20 | LAST_UPDATE_DATETIME |  |  | Y | Date | Holds the date time stamp of the most recent update by the last_update_id. This field is required by the database. |
| 21 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | Holds the Oracle user-id of the user who most recently updated this record. This field is required by the database. |
| 22 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_ITEM_HTS_ASSESS|PK||||ITEM|ASC|
||||||HTS|ASC|
||||||IMPORT_COUNTRY_ID|ASC|
||||||ORIGIN_COUNTRY_ID|ASC|
||||||EFFECT_FROM|ASC|
||||||EFFECT_TO|ASC|
||||||COMP_ID|ASC|
|ITEM_HTS_ASSESS_I5|||||COMP_ID|ASC|
|ITEM_HTS_ASSESS_I1|||||ORIGIN_COUNTRY_ID|ASC|
|ITEM_HTS_ASSESS_I3|||||CVB_CODE|ASC|






|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|ITEM_HTS_ASSESS_I2|||||IMPORT_COUNTRY_ID|ASC|
|ITEM_HTS_ASSESS_I4|||||PER_COUNT_UOM|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_ITEM_HTS_ASSESS_NOM_FLAG_1|NOM_FLAG_1 in ('N','+','-')<br>|
||CHK_ITEM_HTS_ASSESS_NOM_FLAG_2|NOM_FLAG_2 in ('N','+','-')<br>|
||CHK_ITEM_HTS_ASSESS_NOM_FLAG_3|NOM_FLAG_3 in ('N','+','-')<br>|
||CHK_ITEM_HTS_ASSESS_NOM_FLAG_4|NOM_FLAG_4 in ('N','+','-')<br>|
||CHK_ITEM_HTS_ASSESS_NOM_FLAG_5|NOM_FLAG_5 in ('N','+','-')<br>|
|Column Level|NOM_FLAG_1||
||NOM_FLAG_2||
||NOM_FLAG_3||
||NOM_FLAG_4||
||NOM_FLAG_5||

---

## Table: ITEM_IMAGE

**Description:** This table holds a copy of all images (pictures) and related documentation associated with an item. These images and documentation are used to create the Merchandise Specification.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM | P | F | Y | VARCHAR (25) | This field contains the unique alphanumeric identifier for the item, the image is for. |
| 2 | IMAGE_NAME | P |  | Y | VARCHAR (120) | This field contains the name of the image of the item. |
| 3 | IMAGE_ADDR |  |  | Y | VARCHAR (255) | This field contains the actual path where the file of the image of the item is stored. |
| 4 | IMAGE_DESC |  |  | Y | VARCHAR (40) | This field contains the description associated with the image of the item. |
| 5 | CREATE_DATETIME |  |  | Y | Date | This field contains date/time stamp of when the record was created. This value is only to be populated on insert and never be updated. |
| 6 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field holds the date time stamp of the most recent update by the last_update_id. This field is required by the database. |
| 7 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field holds the Oracle user-id of the user who most recently updated this record. This field is required by the database. |
| 8 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |
| 9 | IMAGE_TYPE |  |  | Y | VARCHAR (6 ) | This field contains the type of the image of the item. Valid values are defined as member of IITD code type. |
| 10 | PRIMARY_IND |  |  | Y | VARCHAR (1 BYTE) | This field will indicate whether this record is the primary image of the item or not. Valid values are Y(es) and N(o) only. Default to N value if left blank or set as NULL. |
| 11 | DISPLAY_PRIORITY |  |  | Y | NUMERIC (4) | This field will specify the display sequence order of images associated to the item per priority. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_ITEM_IMAGE|PK||||ITEM|ASC|
||||||IMAGE_NAME|ASC|

### Constraints

|Type|Column / Constraint<br>Name|Details|
|---|---|---|
|Table Level|CHK_IMAGE_TYPE|IMAGE_TYPE IN ('H', 'M', 'L', 'T')<br>|
||CHK_IMAGE_PRIMARY_IND|PRIMARY_IND IN ('Y', 'N')<br>|

---

## Table: ITEM_IMAGE_TL

**Description:** This is the translation table for ITEM_IMAGE table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | ITEM | P | F | Y | VARCHAR (25) | This field contains the unique alphanumeric identifier for the item, the image is for. |
| 3 | IMAGE_NAME | P | F | Y | VARCHAR (120) | This field contains the name of the image of the item. |
| 4 | IMAGE_DESC |  |  | Y | VARCHAR (40) | This field contains the description associated with the image of the item. |
| 5 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 6 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 7 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 8 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_ITEM_IMAGE_TL|PK||||LANG|ASC|
||||||ITEM|ASC|
||||||IMAGE_NAME|ASC|

---

## Table: ITEM_IMPORT_ATTR

**Description:** This table holds the import specific attributes associated with a given item. Values in this table are stored in the Primary currency for the system.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM | P | F | Y | VARCHAR (25) | Contains the unique alphanumeric identifier for the item for which import attributes are defined. |
| 2 | TOOLING |  |  |  | NUMERIC (20,4) | Contains the cost associated with a given Tooling/Assist charge. This value will be stored in the systems primary currency. |
| 3 | FIRST_ORDER_IND |  |  |  | VARCHAR (1) | Used to determine if duty is to be paid on the total value of the tooling expense the first time the item is shipped. Valid values are Y - Yes and N - No. |
| 4 | AMORTIZE_BASE |  |  |  | NUMERIC (12,4) | Contains the number of units over which the tooling/assist cost will be amortized. This number is used to calculate the per unit amortization expense for estimated and actual landed cost records until the tooling costs are depleted. When you record import attributes, this should contain the number of units over which the tooling cost will be amortized. |
| 5 | OPEN_BALANCE |  |  |  | NUMERIC (12,4) | Contains the open balance of the number of units yet to be received over which the tooling costs will be amortized. The open balance is the number of units that the tooling costs will be amortized over minus the number of units already received. |
| 6 | COMMODITY |  |  |  | VARCHAR (6) | Contains the code used to classify the item by their type of merchandise. For example, ceramic products might be used to group all ceramic products (including bowls, vases, figurines, etc.) that are imported into the country. The code for this field is user defined. |
| 7 | IMPORT_DESC |  |  |  | VARCHAR (2000) | Contains description of the item used for importing purposes. |
| 8 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |
| 9 | CREATE_DATETIME |  |  | Y | Date | This column holds the record creation date. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_ITEM_IMPORT_ATTR|PK||||ITEM|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_ITEM_IMP_ATTR_FIR_ORD_IND|first_order_ind in ('Y','N')<br>|
|Column Level|FIRST_ORDER_IND||

---

## Table: ITEM_INDUCT_CONFIG

**Description:** This is the configuration table for item induction module. This table always contains one and only one record.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | MAX_ITEMS_FOR_DNLD |  |  | Y | NUMERIC (10) | Maximum number of items that can be downloaded using spreadsheet. |
| 2 | MAX_ITEMS_FOR_SYNC_DNLD |  |  | Y | NUMERIC (10) | Maximum number of items that can be downloaded using spreadsheet in synchronous fashion. Beyond this threshold the process is submitted as an asynchronous process. |
| 3 | MAX_FILE_SIZE_FOR_UPLD |  |  | Y | NUMERIC (10) | Maximum file size that can be uploaded. |
| 4 | MAX_FILE_SIZE_FOR_SYNC_UPLD |  |  | Y | NUMERIC (10) | Maximum file size that can be uploaded in synchronous fashion. Beyond this threshold the process is submitted as an asynchronous process. |
| 5 | MAX_CC_FOR_SYNC_DNLD |  |  | Y | NUMERIC (10) | Maximum number of cost changes allowed for synchronous download. |
| 6 | MAX_CC_FOR_DNLD |  |  | Y | NUMERIC (10) | Maximum number of cost changes allowed for download. |

---

## Table: ITEM_MFQUEUE

**Description:** This table tracks changes in RMS that need to be published to the RIB. It is populated by calls to ADDTOQ. It is updated and deleted from by calls to GETNXT and PUB_RETRY.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SEQ_NO | P |  | Y | NUMERIC (15) | The sequence in which the records was placed in the ITEM_MFQUEUE. Used to order the publication of messages to the RIB. |
| 2 | ITEM |  |  | Y | VARCHAR (25) | Functional key that uniquely identiies the change to the item_master, item_supplier, item_supp_country, item_supp_country_dim, packitem, item_image, uda_item tables that caused the record to be written to the ITEM_MFQUEUE. Item uniquely identifies an item. |
| 3 | SUPPLIER |  |  |  | NUMERIC (10) | Functional key that uniquely identiies the change to the item_master, item_supplier, item_supp_country, item_supp_country_dim, packitem, item_image, uda_item tables that caused the record to be written to the |
| 4 | COUNTRY_ID |  |  |  | VARCHAR (3) | Functional key that uniquely identiies the change to the item_master, item_supplier, item_supp_country, item_supp_country_dim, packitem, item_image, uda_item tables that caused the record to be written to the ITEM_MFQUEUE. Item, supplier and origin country_id uniquely identifies an item_supp_country. |
| 5 | DIM_OBJECT |  |  |  | VARCHAR (6) | Functional key that uniquely identiies the change to the item_master, item_supplier, item_supp_country, item_supp_country_dim, packitem, item_image, uda_item tables that caused the record to be written to the ITEM_MFQUEUE. Item, supplier, origin_country_id and dim_object uniquely identifies an item_supp_country_dim. |
| 6 | REF_ITEM |  |  |  | VARCHAR (25) | Functional key that uniquely identiies the change to the item_master, item_supplier, item_supp_country, item_supp_country_dim, packitem, item_image, uda_item tables that caused the record to be written to the ITEM_MFQUEUE. Ref_item uniquely identifies an items UPC. |
| 7 | PACK_COMP |  |  |  | VARCHAR (25) | Functional key that uniquely identiies the change to the item_master, item_supplier, item_supp_country, item_supp_country_dim, packitem, item_image, uda_item tables that caused the record to be written to the ITEM_MFQUEUE. Item and pack_comp uniquely identifies a packitems item components. |
| 8 | IMAGE_NAME |  |  |  | VARCHAR (120) | Functional key that uniquely identiies the change to the item_master, item_supplier, item_supp_country, item_supp_country_dim, packitem, item_image, uda_item tables that caused the record to be written to the ITEM_MFQUEUE. Item and image_name uniquely identifies an item_image. |
| 9 | UDA_ID |  |  |  | NUMERIC (5) | Functional key that uniquely identiies the change to the item_master, item_supplier, item_supp_country, item_supp_country_dim, packitem, item_image, uda_item tables that caused the record to be written to the ITEM_MFQUEUE. Item and uda_id uniquely identifies an uda_item_ff or an uda_item_date. |
| 10 | UDA_VALUE |  |  |  | NUMERIC (5) | Functional key that uniquely identiies the change to the item_master, item_supplier, item_supp_country, item_supp_country_dim, packitem, item_image, uda_item tables that caused the record to be written to the ITEM_MFQUEUE. Item, uda_id and uda_value uniquely identifies an |
| 11 | MESSAGE_TYPE |  |  | Y | VARCHAR (15) | Describes the action in RMS that is causing the message to be published to the RIB. |
| 12 | FAMILY |  |  | Y | VARCHAR (30) | The functional area that this transaction belongs to, in this case, item. |
| 13 | CUSTOM_MESSAGE_TYPE |  |  |  | VARCHAR (1) | Not used by RMS |
| 14 | PUB_STATUS |  |  | Y | VARCHAR (1) | Set to Unpublished upon insertion into the table. Set to Hospital when a non-fatal error is encountered during the publication process. |
| 15 | TRANSACTION_NUMBER |  |  |  | NUMERIC (10) | Business transaction key. |
| 16 | TRANSACTION_TIME_STAMP |  |  |  | Date | Time of record creation. |
| 17 | TICKET_TYPE_ID |  |  |  | VARCHAR (4) | This column will be populated for item ticket messages. The item and ticket make up the primary key for these messages. |
| 18 | THREAD_NO |  |  | Y | NUMERIC (4) | The thread number on which the item will be published. Each item has one and only one thread number. |
| 19 | APPROVE_IND |  |  | Y | VARCHAR (1) | Indicates whether the status of the item has changed to Approved. |
| 20 | RELATIONSHIP_ID |  |  |  | NUMERIC (20) | Unique identifier for each relationship header record. |
| 21 | RELATED_ITEM |  |  |  | VARCHAR (25) | Item id of the related item. This along with the relationship id serves as a unique identifier for each relationship detail record. |
| 22 | UDA_TEXT |  |  |  | VARCHAR (250) | Functional key that uniquely identifies the change to the item_master, item_supplier, item_supp_country, item_supp_country_dim, packitem, item_image, uda_item tables that caused the record to be written to the ITEM_MFQUEUE. Item, uda_id and uda_text uniquely identify an uda_item_ff. |
| 23 | UDA_DATE |  |  |  | Date | Functional key that uniquely identifies the change to the item_master, item_supplier, item_supp_country, item_supp_country_dim, packitem, item_image, uda_item tables that caused the record to be written to the ITEM_MFQUEUE. Item, uda_id and uda_date uniquely identify an uda_item_date. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_ITEM_MFQUEUE|PK||||SEQ_NO|ASC|
|ITEM_MFQUEUE_I1|||||ITEM|ASC|
||||||PUB_STATUS|ASC|
|ITEM_MFQUEUE_I2|||||THREAD_NO|ASC|
||||||SEQ_NO|ASC|
||||||PUB_STATUS|ASC|

---

## Table: ITEM_PARENTLOC_HIST_MTH

**Description:** This table will hold the rolled up sales history for item parents by month.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  |  | Y | VARCHAR (25) | Unique alphanumeric value that identifies the item. |
| 2 | LOCATION |  |  | Y | NUMERIC (10) | Number of the location in which the item is to be found. This field may contain a store or a warehouse. |
| 3 | LOC_TYPE |  |  | Y | VARCHAR (1) | Type of location in the location field. Valid values are: S = Store W = Warehouse |
| 4 | EOM_DATE |  |  | Y | Date | End of the month date for which the sales totals are gathered. |
| 5 | SALES_TYPE |  |  |  | VARCHAR (1) | Indicates the type of sale or inventory movement. Valid Values are: R = Regular Sales P = Promotional Sales C = Clearance Sales I = Issues from Warehouses to Stores Regular sales, promotional sales and clearance sales can occur at stores. Issues occur only at warehouses. |
| 6 | MONTH_454 |  |  |  | NUMERIC (2) | Number of the 454 month for the sales figures. |
| 7 | YEAR_454 |  |  |  | NUMERIC (4) | Number of the 454 year for the sales figures. |
| 8 | SALES |  |  |  | NUMERIC (12,4) | Contains the number of units sold for the Item/Store/month/sales_type combination. |
| 9 | VALUE |  |  |  | NUMERIC (20,4) | Retail value received on the sales for the item/location/week/sales_type combination. This field is stored in the local currency. This field will only hold a value for stores. |
| 10 | GP |  |  |  | NUMERIC (20,4) | Gross profit calculated for each sale of an item as (sales retail - cost of sales). Sales retail is the actual retail sold for this item. Cost of sales is either av_cost (weighted average cost when system_options.std_av_ind = A), or unit_cost (primary supplier cost when system_options.std_av_ind = S) on item_loc table. This field will only hold a value for stores. |
| 11 | STOCK |  |  |  | NUMERIC (12,4) | Stock on hand for the item/location combination at the end of the week. |
| 12 | RETAIL |  |  |  | NUMERIC (20,4) | Unit retail price of the item at the location at the end of the week. This field is stored in the local currency. |
| 13 | AV_COST |  |  |  | NUMERIC (20,4) | Average cost of the item at the location at the end of the week. This field is stored in the local currency. |

---

## Table: ITEM_PARENT_LOC_HIST

**Description:** This table will hold the rolled up sales history for item parents.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM | P |  | Y | VARCHAR (25) | Unique alphanumeric value that identifies the item. |
| 2 | LOCATION | P |  | Y | NUMERIC (10) | Contains the location corresponding to the sales information for the Item/diff. |
| 3 | LOC_TYPE |  |  | Y | VARCHAR (1) | Contains the type of location. |
| 4 | EOW_DATE | P |  | Y | Date | Contains the end of the week date from which the sales totals are gathered. |
| 5 | SALES_TYPE | P |  | Y | VARCHAR (1) | Indicates the type of sale which generated the sales. Valid values are: R - Regular, P - Promotional, and C - Clearance |
| 6 | WEEK_454 |  |  |  | NUMERIC (2) | Contains the number of the 454 week for the sales figures. |
| 7 | MONTH_454 |  |  |  | NUMERIC (2) | Contains the number of the 454 month for the sales figures. |
| 8 | YEAR_454 |  |  |  | NUMERIC (4) | Contains the number of the 454 year for the sales figures. |
| 9 | SALES |  |  |  | NUMERIC (12,4) | Contains the number of units sold for the Item/Store/week/sales_type combination. |
| 10 | VALUE |  |  |  | NUMERIC (20,4) | Contains the retail value received on the sales for the Item/Store/week/sales_type combination. This field is stored in the |
| 11 | GP |  |  |  | NUMERIC (20,4) | GP (Gross profit) is calculated for each sale of an item as (sales retail - cost of sales), where sales retail is the actual retail sold for this item, and cost of sales is either av_cost (weighted average cost) or unit_cost (primary supplier cost) on itemloc table, depending on system_options.std_av_ind = A or S, respectively. |
| 12 | STOCK |  |  |  | NUMERIC (12,4) | Contains the stock on hand for the Item/Store combination at the end of the week. |
| 13 | RETAIL |  |  |  | NUMERIC (20,4) | Contains the unit retail price of the Item at the store at the end of the week. This field is stored in the local currency. |
| 14 | AV_COST |  |  |  | NUMERIC (20,4) | Contains the average cost of the Item at the store at the end of the week. This field is stored in the local currency. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_ITEM_PARENT_LOC_HIST|PK||||ITEM|ASC|
||||||LOCATION|ASC|
||||||EOW_DATE|ASC|
||||||SALES_TYPE|ASC|

---

## Table: ITEM_PUB_INFO

**Description:** This table helps the publication of item. Any item which is newly created, updated or deleted will be recorded in this table. It does this by tracking the state of the item and holding any information that can be populated at the header level and used in detail level publication.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM | P |  | Y | VARCHAR (25) | This is the business object id to publish by. They uniquely identify the row on the item table. |
| 2 | PUBLISHED |  |  | Y | VARCHAR (1) | Indicates whether or not the transaction has been initially published. Set to N upon insertion into the table. When the entire transaction is published, it is set to Y. If some of the details in the transaction are published, but some are not, this indicator is set to I (in progress). |
| 3 | SELLABLE_IND |  |  | Y | VARCHAR (1) | Indicates if the item published is sellable. |
| 4 | TRAN_LEVEL_IND |  |  | Y | VARCHAR (1) | Indicates if the item published is a transactional level item. |
| 5 | APPR_UPON_CREATE_IND |  |  | Y | VARCHAR (1) | Indicates if the item published is appoved when created. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_ITEM_PUB_INFO|PK||||ITEM|ASC|

---

## Table: ITEM_REPL_DAY

**Description:** This table indicates what days of the week the item should be reviewed for replenishment. It is only used as a helper table to populate MASTER_REPL_ATTR table based on REPL_ITEM_LOC and REPL_DAY.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  |  |  | VARCHAR (25) | Holds the item on replenishment. |
| 2 | SUNDAY_IND |  |  |  | VARCHAR (1) | Indicator to specify whether or not the item will be reviewed on Sunday. Valid values are Y and N. |
| 3 | MONDAY_IND |  |  |  | VARCHAR (1) | Indicator to specify whether or not the item will be reviewed on Monday. Valid values are Y and N. |
| 4 | TUESDAY_IND |  |  |  | VARCHAR (1) | Indicator to specify whether or not the item will be reviewed on Tuesday. Valid values are Y and N. |
| 5 | WEDNESDAY_IND |  |  |  | VARCHAR (1) | Indicator to specify whether or not the item will be reviewed on Wednesday. Valid values are Y and N. |
| 6 | THURSDAY_IND |  |  |  | VARCHAR (1) | Indicator to specify whether or not the item will be reviewed on Thursday. Valid values are Y and N. |
| 7 | FRIDAY_IND |  |  |  | VARCHAR (1) | Indicator to specify whether or not the item will be reviewed on Friday. Valid values are Y and N. |
| 8 | SATURDAY_IND |  |  |  | VARCHAR (1) | Indicator to specify whether or not the item will be reviewed on Saturday. Valid values are Y and N. |
| 9 | DAY_IND |  |  |  | VARCHAR (1) | Indicator to specify whether or not the replenishment days will be updated for the item. Valid values are Y and N. |

---

## Table: ITEM_SUPPLIER

**Description:** This table holds all item supplier relationships for all items.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM | P | F | Y | VARCHAR (25) | Alphanumeric value that identifies the item |
| 2 | SUPPLIER | P | F | Y | NUMERIC (10) | This field contains the number of the supplier of the item. |
| 3 | PRIMARY_SUPP_IND |  |  | Y | VARCHAR (1) | This field Indicates whether this supplier is the primary supplier for the item.. Each item can have one and only one primary supplier. Valid values are Y or N. This field is meaningless for sub-transaction level items. |
| 4 | VPN |  |  |  | VARCHAR (30) | This field contains the Vendor Product Number associated with this item. |
| 5 | SUPP_LABEL |  |  |  | VARCHAR (15) | This field will hold the supplier laber for an item (Parent/Child) |
| 6 | CONSIGNMENT_RATE |  |  |  | NUMERIC (12,4) | This field contains the consignment rate for this item for the supplier. |
| 7 | SUPP_DIFF_1 |  |  |  | VARCHAR (120) | This field contains the first supplier differentiator and/or description. This field may only contain a value for items with an item_parent. |
| 8 | SUPP_DIFF_2 |  |  |  | VARCHAR (120) | This field contains the second supplier differentiator and/or description. This field may only contain a value for items with an item_parent. |
| 9 | SUPP_DIFF_3 |  |  |  | VARCHAR (120) | This field contains the third supplier differentiator and/or description. This field may only contain a value for items with an item_parent. |
| 10 | SUPP_DIFF_4 |  |  |  | VARCHAR (120) | This field contains the fourth supplier differentiator and/or description. This field may only contain a value for items with an item_parent. |
| 11 | PALLET_NAME |  |  | Y | VARCHAR (6) | Code referencing the name used by supplier to refer to the pallet. Valid codes are defined in the PALN code type. Examples are flat, pallet. |
| 12 | CASE_NAME |  |  | Y | VARCHAR (6) | Code referencing the name used by supplier to refer to the case. Valid codes are defined in the CASN code type. Examples are pack, box, bag. |
| 13 | INNER_NAME |  |  | Y | VARCHAR (6) | Code referencing the name used by supplier to refer to the inner. Valid codes are defined in the INRN code type. Examples are sub-case, sub-pack. |
| 14 | SUPP_DISCONTINUE_DATE |  |  |  | Date | Date which the supplier discontinues an item. The retailor should be aware that the supplier is able to reuse a UPC after 30 months and should work to ensure that no data exists in RMS for a UPC 30 months after it has been discontinued. |
| 15 | DIRECT_SHIP_IND |  |  | Y | VARCHAR (1) | This field will contain a value of Yes to indicate that any item asssociated with this supplier is eligible for a direct shipment from the supplier to the customer. |
| 16 | CREATE_DATETIME |  |  | Y | Date | Date/time stamp of when the record was created. This date/time will be used in export processing. This value should only be populated on insert - it should never be updated. |
| 17 | LAST_UPDATE_DATETIME |  |  | Y | Date | Holds the date time stamp of the most recent update by the last_update_id. This field is required by the database. |
| 18 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | Holds the Oracle user-id of the user who most recently updated this record. This field is required by the database. |
| 19 | CONCESSION_RATE |  |  |  | NUMERIC (12,4) | The concession rate is the margin that a particular supplier receives for the sale of a concession item. |
| 20 | PRIMARY_CASE_SIZE |  |  |  | VARCHAR (6) | Used only if AIP is interfaced. Indicates the primary case size for the item supplier when an orderable item is configured for informal case types. |
| 21 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_ITEM_SUPPLIER|PK||||ITEM|ASC|
||||||SUPPLIER|ASC|
|ITEM_SUPPLIER_I2|||||VPN|ASC|
|ITEM_SUPPLIER_I1|||||SUPPLIER|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_ITEM_SUPP_DIRECT_SHIP_IND|DIRECT_SHIP_IND in ('Y','N')<br>|
||CHK_ITEM_SUPP_PRIMARY_SUPP|PRIMARY_SUPP_IND IN ('Y', 'N')<br>|
||CHK_ITEM_SUPP_VPN|VPN = UPPER(VPN)<br>|
|Column Level|PRIMARY_SUPP_IND||






|Type|Column / Constraint Name|Details|
|---|---|---|
||VPN||
||DIRECT_SHIP_IND||

---

## Table: ITEM_SUPPLIER_CFA_EXT

**Description:** This is the custom attribute extension table for the entity ITEM_SUPPLIER.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM | P | F | Y | VARCHAR (25) | This column holds the Item this extended data is associated with. |
| 2 | SUPPLIER | P | F | Y | NUMERIC (10) | This column holds the Supplier this extended data is associated with. |
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
|PK_ITEM_SUPPLIER_CFA_EXT|PK||||ITEM|ASC|
||||||SUPPLIER|ASC|
||||||GROUP_ID|ASC|

---

## Table: ITEM_SUPPLIER_L10N_EXT

**Description:** This is the LFAS storage table for the entity ITEM_SUPPLIER

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM | P | F | Y | VARCHAR (25) | This field is alphanumeric value which identifies the item of the item supplier relationship. |
| 2 | SUPPLIER | P | F | Y | NUMERIC (10) | This column contains the unique numeric value that identifies the supplier of the item supplier relationship. |
| 3 | L10N_COUNTRY_ID | P | F | Y | VARCHAR (3) | This column holds the country this extended data is associated with. The logical business meaning of the VARCHAR_, NUMBER_ and DATE_ columns on this table are determined by the metadata defined for this country in its localization pack. |
| 4 | GROUP_ID | P | F | Y | NUMERIC (10) | This column holds the attribute group id that this extended data is associated with. The logical business meaning of the VARCHAR2_, NUMBER_ and DATE_ columns on this table are determined by the metadata defined for this country/attribute group in the countries localization pack. |
| 5 | VARCHAR2_1 |  |  |  | VARCHAR (250 BYTE) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references varchar2_1 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 6 | VARCHAR2_2 |  |  |  | VARCHAR (250 BYTE) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references varchar2_2 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 7 | VARCHAR2_3 |  |  |  | VARCHAR (250 BYTE) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references varchar2_3 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 8 | VARCHAR2_4 |  |  |  | VARCHAR (250 BYTE) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references varchar2_4 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 9 | VARCHAR2_5 |  |  |  | VARCHAR (250 BYTE) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references varchar2_5 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 10 | VARCHAR2_6 |  |  |  | VARCHAR (250 BYTE) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references varchar2_6 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 11 | VARCHAR2_7 |  |  |  | VARCHAR (250 BYTE) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references varchar2_7 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 12 | VARCHAR2_8 |  |  |  | VARCHAR (250 BYTE) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references varchar2_8 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 13 | VARCHAR2_9 |  |  |  | VARCHAR (250 BYTE) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references varchar2_9 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 14 | VARCHAR2_10 |  |  |  | VARCHAR (250 BYTE) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references varchar2_10 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 15 | NUMBER_11 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references number_11 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 16 | NUMBER_12 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references number_12 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 17 | NUMBER_13 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references number_13 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 18 | NUMBER_14 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references number_14 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 19 | NUMBER_15 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references number_15 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 20 | NUMBER_16 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references number_16 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 21 | NUMBER_17 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references number_17 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 22 | NUMBER_18 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references number_18 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 23 | NUMBER_19 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references number_19 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 24 | NUMBER_20 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references number_20 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 25 | DATE_21 |  |  |  | Date (7) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references date_21 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 26 | DATE_22 |  |  |  | Date (7) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references date_22 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_ITEM_SUPPLIER_L10N_EXT|PK||||ITEM|ASC|
||||||SUPPLIER|ASC|
||||||L10N_COUNTRY_ID|ASC|
||||||GROUP_ID|ASC|

---

## Table: ITEM_SUPPLIER_TL

**Description:** This is the translation table for ITEM_SUPPLIER table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | ITEM | P | F | Y | VARCHAR (25) | Alphanumeric value that identifies the item |
| 3 | SUPPLIER | P | F | Y | NUMERIC (10) | This field contains the number of the supplier of the item. |
| 4 | SUPP_LABEL |  |  |  | VARCHAR (15) | This field will hold the supplier laber for an item (Parent/Child) |
| 5 | SUPP_DIFF_1 |  |  |  | VARCHAR (120) | This field contains the first supplier differentiator and/or description. This field may only contain a value for items with an item_parent. |
| 6 | SUPP_DIFF_2 |  |  |  | VARCHAR (120) | This field contains the second supplier differentiator and/or description. This field may only contain a value for items with an item_parent. |
| 7 | SUPP_DIFF_3 |  |  |  | VARCHAR (120) | This field contains the third supplier differentiator and/or description. This field may only contain a value for items with an item_parent. |
| 8 | SUPP_DIFF_4 |  |  |  | VARCHAR (120) | This field contains the fourth supplier differentiator and/or description. This field may only contain a value for items with an item_parent. |
| 9 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 10 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 11 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 12 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_ITEM_SUPPLIER_TL|PK||||LANG|ASC|
||||||ITEM|ASC|
||||||SUPPLIER|ASC|

---

## Table: ITEM_TEMP

**Description:** This temporary table will be used in the item creation process when many items (i.e. children, like items, etc) are being created. The table allows for faster processing. Data will be posted to this table for use in a single session, but data should never be committed to this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  |  |  | VARCHAR (25) | Unique alphanumeric value that identifies the item. |
| 2 | ITEM_NUMBER_TYPE |  |  | Y | VARCHAR (6) | Code specifying what type the item is. Valid values for this field are in the code type UPCT on the code_head and code_detail tables. |
| 3 | FORMAT_ID |  |  |  | VARCHAR (1) | This field will hold the format ID that corresponds to the items variable UPC. This value is only used for items with variable UPCs. |
| 4 | PREFIX |  |  |  | NUMERIC (2) | This column holds the prefix for variable weight UPCs. The prefix determines the format of the eventual UPC and will be used to decode variable weight UPCs that are uploaded from the POS. It is the clients responsibility to download this value to their scale systems. |
| 5 | ITEM_LEVEL |  |  | Y | NUMERIC (1) | Number indicating which of the three levels the item resides. The item level determines if the item stands alone or if it is part of a family of related items. The item level also determines how the item may be used throughout the system. |
| 6 | ITEM_DESC |  |  |  | VARCHAR (250) | Long description of the item. This description is used through out the system to help online users identify the item. For items that have parents, this description will default to the parents description plus any differentiators. For items without parents, this description will default to null. |
| 7 | DIFF_1 |  |  |  | VARCHAR (10) | Diff_group or diff_id that differentiates the current item from its item_parent. For an item that is a parent, this field may be either a group (i.e. Mens pant sizes) or a value (6 oz). For an item that is not a parent, this field may contain a value (34X34, Red, etc.) Valid values are found on the diff_group and diff_id tables. |
| 8 | DISPLAY_SEQ_1 |  |  |  | NUMERIC (4) | This field contains the display sequence for the differentiator. This field is used to determine the display order when multiple differentiators in a group are displayed. This is an optional field. |
| 9 | DIFF_2 |  |  |  | VARCHAR (10) | Diff_group or diff_id that differentiates the current item from its item_parent. For an item that is a parent, this field may be either a group (i.e. Mens pant sizes) or a value (6 oz). For an item that is not a parent, this field may contain a value (34X34, Red, etc.) Valid values are found on the diff_group and diff_id tables. |
| 10 | DISPLAY_SEQ_2 |  |  |  | NUMERIC (4) | This field contains the display sequence for the differentiator. This field is used to determine the display order when multiple differentiators in a group are displayed. This is an optional field. |
| 11 | DIFF_3 |  |  |  | VARCHAR (10) | Diff_group or diff_id that differentiates the current item from its item_parent. For an item that is a parent, this field may be either a group (i.e. Mens pant sizes) or a value (6 oz). For an item that is not a parent, this field may contain a value (34X34, Red, etc.) |
| 12 | DISPLAY_SEQ_3 |  |  |  | NUMERIC (4) | This field contains the display sequence for the differentiator. This field is used to determine the display order when multiple differentiators in a group are displayed. |
| 13 | DIFF_4 |  |  |  | VARCHAR (10) | Diff_group or diff_id that differentiates the current item from its item_parent. For an item that is a parent, this field may be either a group (i.e. Mens pant sizes) or a value (6 oz). For an item that is not a parent, this field may contain a value (34X34, Red, etc.) |
| 14 | DISPLAY_SEQ_4 |  |  |  | NUMERIC (4) | This field contains the display sequence for the differentiator. This field is used to determine the display order when multiple differentiators in a group are displayed. |
| 15 | LIKE_EXISTING_ITEM |  |  |  | VARCHAR (25) | Only used when Like Item functionality is used. Will contain the unique alphanumeric value that identifies the item being copied. |
| 16 | EXISTING_ITEM_PARENT |  |  |  | VARCHAR (25) | This column will hold the parent of the existing item the new temporary item is duplicating. |
| 17 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |
| 18 | CREATE_DATETIME |  |  | Y | Date | This column holds the record creation date. |

---

## Table: ITEM_XFORM_DETAIL

**Description:** From one transformable orderable/non-sellable item one or many transformed sellable items can be made. This table holds the details of all the transformed sellable items for a transformed orderable (non-sellable) item.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM_XFORM_DETAIL_ID | P |  | Y | NUMERIC (15) | This is the primary key of the table automatically generated by the system. |
| 2 | ITEM_XFORM_HEAD_ID | P | F | Y | NUMERIC (10) | This is the primary key of the ITEM_XFORM_HEAD table. |
| 3 | DETAIL_ITEM |  | F | Y | VARCHAR (25) | Contains the ID of the sellable transformed item which is created from the orderable transformed item. Must be sellable only transcation level item and should have the standard UOM in the same UOM class as the orderable transformed item. |
| 4 | ITEM_QUANTITY_PCT |  |  |  | NUMERIC (12,4) | This field holds the percentage of the orderable transformed item used to produce given sellable transformed item. |
| 5 | YIELD_FROM_HEAD_ITEM_PCT |  |  |  | NUMERIC (12,4) | In cases where a sellable transformed item is produced from multiple orderable transformed items, this field holds the percentage of a given orderable transformed item used to derive this sellable transformed item. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_ITEM_XFORM_DETAIL|PK||||ITEM_XFORM_HEAD_ID|ASC|
||||||ITEM_XFORM_DETAIL_ID|ASC|
|ITEM_XFORM_DETAIL_I1|||||DETAIL_ITEM|ASC|

---

## Table: ITEM_XFORM_HEAD

**Description:** This table holds the header level information that defines the relationship between a transformed orderable (non-sellable) item and its sellable components. For example, an whole meat carcass (orderable item) is transformed into one or more sellable items, such as minced meat and steaks.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM_XFORM_HEAD_ID | P |  | Y | NUMERIC (10) | This is the primary key of the table automatically generated by the system |
| 2 | HEAD_ITEM |  | F | Y | VARCHAR (25) | Alphanumeric identifier for the orderable/non-sellable item which needs transformation |
| 3 | ITEM_XFORM_TYPE |  |  | Y | VARCHAR (6) | This field holds the item transformation type. Currently, the system supports only K (Break-to-Sell) transformation process. |
| 4 | ITEM_XFORM_DESC |  |  |  | VARCHAR (250) | This field holds the description of the item transformation template defined by the user for the orderable/non-sellable transformable item. |
| 5 | PRODUCTION_LOSS_PCT |  |  |  | NUMERIC (12,4) | This is the percentage of the orderable transformed item which is wasted in producing one or more sellable transformed items |
| 6 | COMMENTS_DESC |  |  |  | VARCHAR (2000) | This field holds any business specific comments associated with the item transformation template. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_ITEM_XFORM_HEAD|PK||||ITEM_XFORM_HEAD_ID|ASC|
|UK_ITEM_XFORM_HEAD|UK||||HEAD_ITEM|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_IXH_ITEM_XFORM_TYPE<br>|ITEM_XFORM_TYPE in ('K')<br>|
|Column Level|ITEM_XFORM_TYPE<br>||

---

## Table: ITEM_XFORM_HEAD_TL

**Description:** This is the translation table for ITEM_XFORM_HEAD table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | ITEM_XFORM_HEAD_ID | P | F | Y | NUMERIC (10) | This is the primary key of the table automatically generated by the system |
| 3 | ITEM_XFORM_DESC |  |  |  | VARCHAR (250) | This field holds the description of the item transformation template defined by the user for the orderable/non-sellable transformable item. |
| 4 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 6 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 7 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_ITEM_XFORM_HEAD_TL|PK||||LANG|ASC|
||||||ITEM_XFORM_HEAD_ID|ASC|

---

## Table: LANG

**Description:** Contains a list of all the languages used by the Oracle Retail system. This table is created when the system is installed and must be maintained by the database administrator.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P |  | Y | NUMERIC (6) | Contains a number which uniquely identifies a language. |
| 2 | DESCRIPTION |  |  | Y | VARCHAR (120) | Contains a description or name for the language. |
| 3 | WEBHELP_SERVER |  |  |  | VARCHAR (200) | Contains a web help server for the particular language. |
| 4 | REPORTS_SERVER |  |  |  | VARCHAR (200) | Contains the name of the reports server for a particular language. |
| 5 | WEBREPORTS_SERVER |  |  |  | VARCHAR (200) | Contains the URL of the web reports server. |
| 6 | ISO_CODE |  |  | Y | VARCHAR (6) | This field holds the ISO code associated with the given language. |
| 7 | APP_SERVER |  |  |  | VARCHAR (200) | Application Server |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_LANG|PK||||LANG|ASC|

---

## Table: MV_CURRENCY_CONVERSION_RATES

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | from_currency |  |  |  |  |  |
| 2 | to_currency |  |  |  |  |  |
| 3 | effective_date |  |  |  |  |  |
| 4 | exchange_type |  |  |  |  |  |
| 5 | exchange_rate |  |  |  |  |  |

---

## Table: MV_L10N_ENTITY

---

## Table: MV_LOC_PRIM_ADDR

---

## Table: MV_LOC_SOB

---

## Table: MV_RESTART_STORE_WH

---

## Table: MV_SIZE_PROFILE

---

## Table: MV_SIZE_PROFILE_1A

---

## Table: MV_SIZE_PROFILE_1B

---

## Table: OGA

**Description:** This table contains all of the codes that identify Governmental regulatory agencies outside of Customs.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | OGA_CODE | P |  | Y | VARCHAR (3) | Contains a unique code which will identify the government agency. The codes are provided by customs. |
| 2 | OGA_DESC |  |  | Y | VARCHAR (250) | Contains a description of the government agency. |
| 3 | REQ_FORM |  |  |  | VARCHAR (30) | Contains a description of the government agency. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_OGA|PK||||OGA_CODE|ASC|

---

## Table: OGA_TL

**Description:** This is the translation table for OGA table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | OGA_CODE | P | F | Y | VARCHAR (3) | Contains a unique code which will identify the government agency. The codes are provided by customs. |
| 3 | OGA_DESC |  |  | Y | VARCHAR (250) | Contains a description of the government agency. |
| 4 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 6 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 7 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_OGA_TL|PK||||LANG|ASC|
||||||OGA_CODE|ASC|

---

## Table: OI_SESSION_ID_LOG

**Description:** Tracking session ID requests to be used in table cleanup operation

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SESSION_ID | P |  | Y | NUMERIC (15) | The new session id given to user |
| 2 | USER_ID |  |  | Y | VARCHAR (30 BYTE) | User requested the next session id |
| 3 | REQUESTED_DATE |  |  | Y | Date | Date and time session id requested |

---

## Table: PERIOD

**Description:** This control table is used to hold the current system dates for all processing runs, reports, and C programs. The date can be updated on this table by running the batch program dtesys.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SYSAVAIL |  |  | Y | NUMERIC (1) | Indicator determining if the system is available to users. The value is 0 when the system is not available and 1 when it is available. |
| 2 | VDATE |  |  | Y | Date | The current system date. This value will be updated at the completion of the nightly batch run to ensure that all transactions processed in a single run have the same day in the system. |
| 3 | START_454_HALF |  |  | Y | Date | First day of the current 4-5-4 half. |
| 4 | END_454_HALF |  |  | Y | Date | Last day of the current 4-5-4 half. |
| 5 | START_454_MONTH |  |  | Y | Date | The first day of the current 4-5-4 month. |
| 6 | MID_454_MONTH |  |  | Y | Date | The middle of the current 4-5-4 month. |
| 7 | END_454_MONTH |  |  | Y | Date | The last day of the current 4-5-4 month. |
| 8 | HALF_NO |  |  | Y | NUMERIC (5) | The current half number. |
| 9 | NEXT_HALF_NO |  |  | Y | NUMERIC (5) | The next half number. |
| 10 | CURR_454_DAY |  |  | Y | NUMERIC (2) | This value will range from 1 to 7 and indicates the current day of the 4-5-4 week. |
| 11 | CURR_454_WEEK |  |  | Y | NUMERIC (2) | This indicates the 4-5-4 week number within the current month. The number will range between 1 and 5. |
| 12 | CURR_454_MONTH |  |  | Y | NUMERIC (2) | This number indicates the current 4-5-4 month and will range from 1 to 12. |
| 13 | CURR_454_YEAR |  |  | Y | NUMERIC (4) | Indicates the current 4-5-4 year. |
| 14 | CURR_454_MONTH_IN_HALF |  |  | Y | NUMERIC (2) | The current 4-5-4 month in the half. Numbers should range from month 1 to month 6. |
| 15 | CURR_454_WEEK_IN_HALF |  |  | Y | NUMERIC (2) | The current 4-5-4 week number in the half. Numbers should range from week 1 to week 26. |

---

## Table: PROCESS_CONFIG

**Description:** This table holds the configurations for async and batch processes. E.g. process_mode column indicates whether the process will be executed in ASYNC or batch mode.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_NAME |  |  | Y | VARCHAR (255 BYTE) | This is the name and the unique identifier of the process. |
| 2 | PROCESS_MODE |  |  | Y | VARCHAR (5 BYTE) | This is the mode in which the process will be executed. Valid values are ASYNC and BATCH. |
| 3 | CREATE_ID |  |  | Y | VARCHAR (30 BYTE) | The user that created this row. |
| 4 | CREATE_DATETIME |  |  | Y | Date (7) | The date and time when the row was created. |
| 5 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30 BYTE) | The user who last updated this row. |
| 6 | LAST_UPDATE_DATETIME |  |  | Y | Date (7) | The date and time when the row was last updated. |

---

## Table: PRODUCT_CONFIG_OPTIONS

**Description:** This table contains attributes used to indicate with which other systems in RMS is being implemented, both other Oracle Retail applications and external applications, like Financials applications.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | AIP_IND |  |  | Y | VARCHAR (1) | The Advance Inventory Planning (AIP) indicator determines whether RMS is integrated with the Oracle Retail AIP application. It also drives some different behavior in RMS, such as requiring a primary case type for item and restricting the number of simple packs of the same quantity that can be created for an item. Valid values are 'Y' or 'N', with the default value if null of 'N'. |
| 2 | ALLOCATION_IND |  |  | Y | VARCHAR (1) | The Allocation indicator determines if RMS is integrated with the Oracle Retail Allocation application. Valid values are 'Y' or 'N', with the default value if null of 'N'. |
| 3 | FINANCIAL_AP |  |  |  | VARCHAR (10) | Indicates the external financial system and configuration being used by the business. Valid values are 'O', 'A', or NULL. The 'O' option exists to enable a custom point-to-point integration between RMS and EBS. This option is used by RMS only to enable and disable certain functions in the supplier screens on-line. The 'A' option exists to enable financials integration through the Oracle Retail Financials Integration Pack (RFI). A NULL value indicates no integration with a financial system. |
| 4 | FORECAST_IND |  |  | Y | VARCHAR (1) | This attribute is used to indicate whether RMS is integrated to a forecasting system, such as Oracle Retail Demand Forecasting (RDF). Valid values are 'Y'-Yes or 'N'-No. |
| 5 | REIM_IND |  |  | Y | VARCHAR (1) | This attribute is used to indicate whether RMS is integrated with the Oracle Retail Invoice Match (ReIM) application. Valid values are Y or N, with N used as the default if null. |
| 6 | RWMS_IND |  |  | Y | VARCHAR (1) | This attribute is used to indicate whether RMS is integrated with a Warehouse Management System. Valid values are Y or N, with N used as the default if null. |
| 7 | SALES_AUDIT_IND |  |  | Y | VARCHAR (1) | This attribute is used to indicate whether ReSA functionality is being used. Valid values are Y or N, with N used as the default if null. |
| 8 | SIM_IND |  |  | Y | VARCHAR (1) | This attribute is used to indicate whether RMS is integrated with a Store Inventory Management Valid values are Y or N, with N used as the default if null. |
| 9 | OMS_IND |  |  | Y | VARCHAR (1) | This field indicates whether or not RMS is integrated with an external order management system. Valid values are Y and N. |
| 10 | CREATE_ID |  |  | Y | VARCHAR (30) | Stores the Oracle username of the one who inserted the first record. This field is required by the database. |
| 11 | CREATE_DATETIME |  |  | Y | Date | The date and time of when the record was created in the table. This value should only be populated on insert - it should never be updated. |
| 12 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | The Oracle username of the one who most recently updated this record. |
| 13 | LAST_UPDATE_DATETIME |  |  | Y | Date | The date time stamp of the most recent update by the user. |

---

## Table: PRODUCT_UI_INTEGRATION_CONFIG

**Description:** This table is used by the application ui to launch other applications. This table will be populated during application installation process. This table contains the URL of each of the integrated application to allow application launch from another application.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | APPLICATION_NAME |  |  | Y | VARCHAR (30 ) | This contains the product name. Example RMS, RESA.ALLOCATION, REIM |
| 2 | APPLICATION_URL |  |  | Y | VARCHAR (255 ) | This contains application complete url including the port. Example 'http://msp10001.us.oracle.com:1001/Rms/faces/RmsLogin' |

---

## Table: PRODUCT_VERS_CONFIG_OPTIONS

**Description:** This table contains attributes that state the version number of the Oracle Retail products installed with RMS in a customer s environment.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | AIP_VERS |  |  |  | VARCHAR (10) | Version number of AIP installed at a customer. |
| 2 | ALLOCATION_VERS |  |  |  | VARCHAR (10) | Version number of Allocations installed at a customer. |
| 3 | REIM_VERS |  |  |  | VARCHAR (10) | Version number of ReIM installed at a customer. |
| 4 | RESA_VERS |  |  |  | VARCHAR (10) | Version number of ReSA installed at a customer. |
| 5 | RMS_VERS |  |  |  | VARCHAR (10) | Version number of RMS installed at a customer. |
| 6 | RWMS_VERS |  |  |  | VARCHAR (10) | Version number of RWMS installed at a customer. |
| 7 | RPM_VERS |  |  |  | VARCHAR (10) | Version number of RPM installed at a customer. |
| 8 | SIM_VERS |  |  |  | VARCHAR (10) | Version number of SIM installed at a customer. |
| 9 | AIP_IMPL_DATE |  |  |  | Date | Implementation date of the current version of AIP (Advanced Inventory Planning) product installed at a customer. |
| 10 | ALLOCATION_IMPL_DATE |  |  |  | Date | Implementation date of the current version of Allocation product installed at a customer. |
| 11 | REIM_IMPL_DATE |  |  |  | Date | Implementation date of the current version of REIM product installed at a customer. |
| 12 | RESA_IMPL_DATE |  |  |  | Date | Implementation date of the current version of RESA product installed at a customer. |
| 13 | RMS_IMPL_DATE |  |  |  | Date | Implementation date of the current version of RMS product installed at a customer. |
| 14 | RPM_IMPL_DATE |  |  |  | Date | Implementation date of the current version of RPM product installed at a customer. |
| 15 | RWMS_IMPL_DATE |  |  |  | Date | Implementation date of the current version of RWMS product installed at a customer. |
| 16 | SIM_IMPL_DATE |  |  |  | Date | Implementation date of the current version of SIM product installed at a customer. |
| 17 | CREATE_ID |  |  |  | VARCHAR (30) | Stores the Oracle username of the one who inserted the first record. This field is required by the database. |
| 18 | CREATE_DATETIME |  |  |  | Date | The date and time of when the record was created in the table. This value should only be populated on insert - it should never be updated. |
| 19 | LAST_UPDATE_ID |  |  |  | VARCHAR (30) | The Oracle username of the one who most recently updated this record. |
| 20 | LAST_UPDATE_DATETIME |  |  |  | Date | The date time stamp of the most recent update by the user. |

---

## Table: PURGE_CONFIG_OPTIONS

**Description:** This table contains attributes that determine the age of certain transaction records at which point they will be deleted from RMS.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | COMP_LIST_DAYS |  |  | Y | NUMERIC (3) | Indicates the number of days of competitive shopping list history will remain in RMS. All history older than this number of days will be deleted in a batch process. |
| 2 | COMP_PRICE_MONTHS |  |  | Y | NUMERIC (2) | Indicates the number of months of competitive pricing information will remain in RMS. All history older than this number of months will be deleted in a batch process. |
| 3 | CONTRACT_INACTIVE_MONTHS |  |  |  | NUMERIC (2) | Indicates the number of months that inactive contracts will remain in RMS. All inactive contracts older than this number of months will be deleted in a batch process. |
| 4 | CUST_ORDER_HISTORY_MONTHS |  |  | Y | NUMERIC (4) | Specifies the number of months after which the fulfilled customer reservation records and rejected purchase or transfer leg customer fulfillment records are purged. |
| 5 | DAILY_SALES_DISC_MTHS |  |  |  | NUMERIC (4) | Indicates the number of months of sales discount information will be retained in RMS on the DAILY_SALES_DISCOUNT table. All history older than this number of months will be deleted in a batch process. |
| 6 | DEAL_HISTORY_MONTHS |  |  | Y | NUMERIC (2) | Indicates the number of months that closed deals will be retained in RMS. All deals older than this number of months will be deleted in a batch process. |
| 7 | EDI_DAILY_RPT_LAG |  |  |  | NUMERIC (1) | Indicates the number of days sales information will be held in RMS prior to transmitting to suppliers via EDI 852. |
| 8 | EDI_REV_DAYS |  |  | Y | NUMERIC (3) | Indicates the number of days versions and revisions to an order will be retained in RMS after an order has been completed or cancelled. All records older than this number of days will be deleted by a batch process. |
| 9 | FDN_STG_RETENTION_DAYS |  |  |  | NUMERIC (3) | Specifies the number of days after which the records in staging tables used by Foundation modules are purged. |
| 10 | FUTURE_COST_HISTORY_DAYS |  |  | Y | NUMERIC (3) | Indicates the number of days that cost events are retained on the FUTURE_COST table in RMS. All records older than this number of days will be deleted by a batch process. |
| 11 | IB_RESULTS_PURGE_DAYS |  |  |  | NUMERIC (3) | Indicates the number of days that investment buy results are held in RMS. All records older than this number of days will be deleted by a batch process. |
| 12 | INV_ADJ_MONTHS |  |  | Y | NUMERIC (2) | Indicates the number of months that inventory adjustment history is held in RMS. All records older than this number of months will be deleted by a batch process. If a value is not entered in this field, inventory adjustment records will never be removed from RMS. |
| 13 | ITEM_HISTORY_MONTHS |  |  | Y | NUMERIC (2) | Indicates the number of months of sales history is held in RMS. All records older than this number of months will be deleted from RMS by a batch process. |
| 14 | LOC_CLOSE_HIST_MONTHS |  |  | Y | NUMERIC (2) | Indicates the number of months that activity schedules will be retained in RMS on the LOCATION_CLOSED, COMPANY_CLOSED and COMPANY_CLOSED_EXCEP tables. All records older than this number of months will be deleted by a batch process. |
| 15 | ORDER_HISTORY_MONTHS |  |  | Y | NUMERIC (2) | Indicates the number of months that completed orders will remain in RMS. All orders, along with the associated order information (e.g. shipments, expenses, etc.) older than this number of months will be removed from RMS by a batch process. |
| 16 | NWP_RETENTION_PERIOD |  |  |  | NUMERIC (2) | Indicates the number of years that NWP data will be retained in RMS. All records older than this number of years will be deleted from RMS by a batch process. |
| 17 | PRICE_HIST_RETENTION_DAYS |  |  | Y | NUMERIC (3) | Indicates the number of days of price history that will be retained in RMS. All records older than this number of days will be deleted from RMS by a batch process. |
| 18 | REPL_ATTR_HIST_RETENTION_WEEKS |  |  |  | NUMERIC (5) | Indicates the number of weeks that replenishment attribute history will be retained in RMS. All records older than this number of weeks will be deleted from RMS by a batch process. |
| 19 | REPL_ORDER_HISTORY_DAYS |  |  | Y | NUMERIC (3) | Indicates the number of days that replenishment orders in worksheet status will remain in RMS. All orders that are older than this number of days will be deleted by a batch process. |
| 20 | REPL_RESULTS_PURGE_DAYS |  |  |  | NUMERIC (3) | Indicates the number of days of replenishment results (REPL_RESULTS) will remain in RMS. All records older than this number of days will be deleted in a batch process. |
| 21 | RETENTION_OF_REJECTED_COST_CHG |  |  |  | NUMERIC (3) | Indicates the number of days that rejected cost changes will remain in RMS. All rejected cost changes older than this number of days will be deleted in a batch process. |
| 22 | RETN_SCHED_UPD_DAYS |  |  | Y | NUMERIC (3) | Indicates the number of days that scheduled replenishment update history should remain in RMS. All records older than this number of days will be deleted in a batch process. |
| 23 | RTV_ORDER_HISTORY_MONTHS |  |  | Y | NUMERIC (2) | Indicates the number of months that completed RTVs will remain in RMS. All records older than this number of months and whose invoices are posted to ReIM will be deleted in a batch process. |
| 24 | SHIP_SCHED_HISTORY_MTHS |  |  | Y | NUMERIC (4) | Indicates the number of months of store ship schedule history should be retained by RMS.Â All records older than this number of months will be deleted from the STORE_SHIP_SCHEDULE table by a batch process. |
| 25 | STORE_ORDERS_PURGE_DAYS |  |  | Y | NUMERIC (3) | Indicates the number of days that store orders (STORE_ORDERS) will be retained by RMS. All records older than this number of days will be purged by a batch process. |
| 26 | TRAN_DATA_RETAINED_DAYS_NO |  |  | Y | NUMERIC (4) | Indicates the number of days that stock ledger transaction data (TRAN_DATA_HISTORY) is retained in RMS. All records older than this number of days will be purged by a batch process. |
| 27 | TSF_HISTORY_MTHS |  |  | Y | NUMERIC (4) | Indicates the number of months that completed transfers are retained in RMS. All records older than this number of months will be deleted by a batch process. |
| 28 | TSF_MRT_RETENTION_DAYS |  |  | Y | NUMERIC (3) | Indicates the number of days that completed mass return transfers (MRT) are retained by RMS. All records older than this number of days will be deleted by a batch process. |
| 29 | WF_HISTORY_MONTHS |  |  | Y | NUMERIC (4) | Specifies the number of months after which the Franchise Order and Return records are purged. |
| 30 | WF_NON_STOCK_SALES_HIST_DAYS |  |  | Y | NUMERIC (3) | This column determines how long non-stockholding franchise store sales information will be retained in the system. Any information that has exceeded this history days limit will be purged. |
| 31 | CREATE_ID |  |  |  | VARCHAR (30) | Stores the Oracle username of the one who inserted the first record. This field is required by the database. |
| 32 | CREATE_DATETIME |  |  |  | Date | The date and time of when the record was created in the table. This value should only be populated on insert - it should never be updated. |
| 33 | LAST_UPDATE_ID |  |  |  | VARCHAR (30) | The Oracle username of the one who most recently updated this record. |
| 34 | LAST_UPDATE_DATETIME |  |  |  | Date | The date time stamp of the most recent update by the user. |
| 35 | PROC_DATA_RETENTION_DAYS |  |  | Y | NUMERIC (5) | The maximum number of days to hold data induction related information in the svc_* staging tables. |

---

## Table: RETAIL_CALC_TEMP

**Description:** Temporary table used to enable bulk processing when calculating initial retail and markup percentage on the itemretail and itemchildrendiff RMS forms.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  |  |  | VARCHAR (25) | The item number. Mirrors the PM_RETAIL_API_SQL.ITEM_PRICING_TABLE structure for retail and markup calculation. |
| 2 | RPM_ZONE_GROUP_ID |  |  |  | NUMERIC (4) | The zone group associated with the item. Mirrors the PM_RETAIL_API_SQL.ITEM_PRICING_TABLE structure for retail and markup calculation. |
| 3 | ZONE_ID |  |  |  | NUMERIC (10) | The zone id associated with the item. Mirrors the PM_RETAIL_API_SQL.ITEM_PRICING_TABLE structure for retail and markup calculation. |
| 4 | ZONE_DISPLAY_ID |  |  |  | NUMERIC (10) | The zone id displayed in RPM for the item. Mirrors the PM_RETAIL_API_SQL.ITEM_PRICING_TABLE structure for retail and markup calculation. |
| 5 | ZONE_DESCRIPTION |  |  |  | VARCHAR (150) | The zone description of the zone that the item belongs to. Mirrors the PM_RETAIL_API_SQL.ITEM_PRICING_TABLE structure for retail and markup calculation. |
| 6 | LOC_TYPE |  |  |  | VARCHAR (1) | Indicates if the row is associated with a store, warehouse, zone or supplier. This is defaulted to 'Z' (zone) for markup calculation from the itemretail form. |
| 7 | UNIT_RETAIL |  |  |  | NUMERIC (20,4) | Contains the single unit retail in the standard unit of measure of the item/zone. Mirrors the PM_RETAIL_API_SQL.ITEM_PRICING_TABLE structure for retail and markup calculation. |
| 8 | SELLING_UNIT_RETAIL |  |  |  | NUMERIC (20,4) | Contains the single unit retail in the selling unit of measure of the item/zone. Mirrors the PM_RETAIL_API_SQL.ITEM_PRICING_TABLE structure for retail and markup calculation. |
| 9 | SELLING_UOM |  |  |  | VARCHAR (4) | Contains the selling unit of measure for an item/zone's single-unit retail. Mirrors the PM_RETAIL_API_SQL.ITEM_PRICING_TABLE structure for retail and markup calculation. |
| 10 | MULTI_UNITS |  |  |  | NUMERIC (12,4) | The multi units of the item/zone. Mirrors the PM_RETAIL_API_SQL.ITEM_PRICING_TABLE structure for retail and markup calculation. |
| 11 | MULTI_UNIT_RETAIL |  |  |  | NUMERIC (20,4) | Contains the multi-unit retail in the selling unit of measure of the item/zone. Mirrors the PM_RETAIL_API_SQL.ITEM_PRICING_TABLE structure for retail and markup calculation. |
| 12 | TOTAL_COST |  |  |  | NUMERIC (20,4) | Contains cost associated with the item. This is a parameter passed into retail and markup calculation. |
| 13 | MULTI_SELLING_UOM |  |  |  | VARCHAR (4) | The multi-selling unit of measure of the item/zone. Mirrors the PM_RETAIL_API_SQL.ITEM_PRICING_TABLE structure for retail and markup calculation. |
| 14 | BASE_RETAIL_IND |  |  |  | VARCHAR (1) | Indicates whether or not the base retail is in the item/zone. Mirrors the PM_RETAIL_API_SQL.ITEM_PRICING_TABLE structure for retail and markup calculation. |
| 15 | CURRENCY_CODE |  |  |  | VARCHAR (3) | The currency code of the item/zone. Mirrors the PM_RETAIL_API_SQL.ITEM_PRICING_TABLE structure for retail and markup calculation. |
| 16 | STANDARD_UOM |  |  |  | VARCHAR (4) | The standard unit of measure of the item/zone. Mirrors the PM_RETAIL_API_SQL.ITEM_PRICING_TABLE structure for retail and markup calculation. |
| 17 | SELLING_MARK_UP |  |  |  | NUMERIC (20,10) | The computed selling markup of the item/zone. Mirrors the PM_RETAIL_API_SQL.ITEM_PRICING_TABLE structure for retail and markup calculation. |
| 18 | MULTI_SELLING_MARK_UP |  |  |  | NUMERIC (20,10) | The multi-selling mark of the item/zone. Mirrors the PM_RETAIL_API_SQL.ITEM_PRICING_TABLE structure for retail and markup calculation. |
| 19 | DEFAULT_TO_CHILDREN |  |  |  | VARCHAR (1) | Indicates if the computed results should be defaulted to the item's children. Mirrors the PM_RETAIL_API_SQL.ITEM_PRICING_TABLE structure for retail and markup calculation. |
| 20 | UNIT_RETAIL_PRIM |  |  |  | NUMERIC (20,4) | Contains the single unit retail in the standard unit of measure of the item/zone. Mirrors the PM_RETAIL_API_SQL.ITEM_PRICING_TABLE structure for retail and markup calculation. |
| 21 | SELLING_UNIT_RETAIL_PRIM |  |  |  | NUMERIC (20,4) | Contains the single unit retail in the selling unit of measure of the item/zone. Mirrors the PM_RETAIL_API_SQL.ITEM_PRICING_TABLE structure for retail and markup calculation. |
| 22 | MULTI_UNIT_RETAIL_PRIM |  |  |  | NUMERIC (20,4) | Contains the multi-unit retail in the selling unit of measure of the item/zone. Mirrors the PM_RETAIL_API_SQL.ITEM_PRICING_TABLE structure for retail and markup calculation. |
| 23 | UNIT_RETAIL_EURO |  |  |  | NUMERIC (20,4) | Contains the single unit retail in the standard unit of measure in the european union's currency. This is associated with the item/zone. Mirrors the PM_RETAIL_API_SQL.ITEM_PRICING_TABLE structure for retail and markup calculation. |
| 24 | SELLING_UNIT_RETAIL_EURO |  |  |  | NUMERIC (20,4) | Contains the single unit retail in the selling unit of measure in the european union's currency. This is associated with the item/zone. Mirrors the PM_RETAIL_API_SQL.ITEM_PRICING_TABLE structure for retail and markup calculation. |
| 25 | MULTI_UNIT_RETAIL_EURO |  |  |  | NUMERIC (20,4) | Contains the multi-unit retail in the selling unit of measure in the european union's currency. Mirrors the PM_RETAIL_API_SQL.ITEM_PRICING_TABLE structure for retail and markup calculation. |
| 26 | ERROR_MESSAGE |  |  |  | VARCHAR (255) | The error message returned from the retail calculation. Only used to mirror data from the initial retail calculation. Mirrors the PM_RETAIL_API_SQL.ITEM_PRICING_TABLE structure for retail and markup calculation. |
| 27 | RETURN_CODE |  |  |  | VARCHAR (5) | The return code returned from the retail calculation. Only used to mirror data from the initial retail calculation. Mirrors the PM_RETAIL_API_SQL.ITEM_PRICING_TABLE structure for retail and markup calculation. |
| 28 | AREA_DIFF_ZONE_IND |  |  |  | NUMERIC (1) | The area diff zone indicator. Mirrors the PM_RETAIL_API_SQL.ITEM_PRICING_TABLE structure for retail and markup calculation. |
| 29 | ITEM_XFORM_IND |  |  |  | VARCHAR (1) | Identifies if the item is a transformed item. Retrieved from the item_master table. |
| 30 | STATUS |  |  |  | VARCHAR (1) | Status of the item. Retrieved from the item_master table |
| 31 | ORDERABLE_IND |  |  |  | VARCHAR (1) | Identifies if the item is orderable. Retrieved from the item_master table. |
| 32 | SELLABLE_IND |  |  |  | VARCHAR (1) | Identifies if the item is sellable. Retrieved from the item_master table. |
| 33 | DEPT |  |  |  | NUMERIC (4) | The department where the item belongs to. Retrieved from the item_master table. |
| 34 | CLASS |  |  |  | NUMERIC (4) | The class where the item belongs to. Retrieved from the item_master table. |
| 35 | PACK_IND |  |  |  | VARCHAR (1) | Identifies if the item is a pack item. Retrieved from the item_master table. |
| 36 | PACK_TYPE |  |  |  | VARCHAR (1) | Identifies what type of pack a pack item is. Blank for non-pack items. Retrieved from the item_master table. |
| 37 | ORDER_AS_TYPE |  |  |  | VARCHAR (1) | Indicates if a pack item is receivable at the component level or at the pack level(for a buyer pack only). Retrieved from the item_master table. |
| 38 | NOTIONAL_PACK_IND |  |  |  | VARCHAR (1) | Indicate if the the pack item should post the transaction at component level in SIM. Retrieved from the item_master table. |
| 39 | WASTE_TYPE |  |  |  | VARCHAR (6) | Identifies the wastage type as either sales or spoilage wastage. Retrieved from the item_master table. |
| 40 | WASTE_PCT |  |  |  | NUMERIC (12,4) | Average percent of wastage for the item over its shelf life. Used in inflating the retail price for wastage items. Retrieved from the item_master table. |
| 41 | DEFAULT_WASTE_PCT |  |  |  | NUMERIC (12,4) | Default daily wastage percent for spoilage type wastage items. Retrieved from the item_master table. |
| 42 | BUD_INT |  |  |  | NUMERIC (12,4) | Contains the Budgeted Intake percentage. Budgeted Intake is the percent of total take that is income and is synonymous with the term Markup Percent of Retail. Retrieved from the deps table. |
| 43 | BUD_MKUP |  |  |  | NUMERIC (12,4) | Contains the Budgeted Markup percentage. This term is synonymous with the term Markup Percent of Cost. Retrieved from the deps table. |
| 44 | MARKUP_CALC_TYPE |  |  |  | VARCHAR (2) | Contains the code letter which determines how markup is calculated in this department. Valid values are: C = Cost, R = Retail. Retrieved from the deps table. |
| 45 | GET_VAT_IND |  |  |  | VARCHAR (1) | Indicates if VAT details should be retrieved for the item. This is set to 'N' if the item is a pack item and its retail_zone_group_id is NULL. Otherwise it's set to 'Y'. |
| 46 | TAX_IND |  |  |  | VARCHAR (1) | Indicates if tax should be computed for the item. This is set to N if the class_level_vat_ind is set to N in system_options and the items class is set to class_vat_ind = N. Otherwise this is set to Y. |
| 47 | CLASS_VAT_IND |  |  |  | VARCHAR (1) | Indicates if retail is displayed and held with or with out vat. Retrieved from the class table. |
| 48 | TAX_RATE |  |  |  | NUMERIC (20,10) | Contains the computed tax rate rate for the item/zone group. |
| 49 | TAX_AMOUNT |  |  |  | NUMERIC (20,10) | Contains the computed tax amount for the item/zone group. |

---

## Table: RETAIL_SERVICE_REPORT_URL

**Description:** This new table will be used to hold the retail service code, retail service name, retail service type and URL for the new web services for ORFI.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | RS_CODE | P |  | Y | VARCHAR (6) | Report or Service code. |
| 2 | RS_NAME |  |  | Y | VARCHAR (250) | Report or Service name. |
| 3 | RS_TYPE |  |  | Y | VARCHAR (6) | Indicates whether the record information is for a service or report. |
| 4 | URL |  |  |  | VARCHAR (250) | Service URL or Report URL without the parameters |
| 5 | SERVER |  |  |  | VARCHAR (64) | Server name for the report or web service. |
| 6 | PORT |  |  |  | VARCHAR (10) | This is the server port number |
| 7 | SYS_ACCOUNT |  |  |  | Raw (200) | System account name. |
| 8 | TIMEOUT |  |  |  | NUMERIC (20) | Holds the timeout value in milleseconds for service operation. |
| 9 | KEYSTORE_NAME |  |  |  | VARCHAR (20) | This column will contain the name of the keystore setup in the Database that holds the security certificate. This column will only be populated if the RS_CODE is for a secured web service. |
| 10 | KEYSTORE_PATH |  |  |  | VARCHAR (1000) | This column will contain the path of the keystore in the Database. This column will only be populated if the RS_CODE is for a secured web service. |
| 11 | KEYSTORE_PASSWD |  |  |  | Raw (200) | This column will contain the password of the keystore in the Database, and it will be encrypted. This column will only be populated if the RS_CODE is for a secured web service. |
| 12 | PRIVATE_KEY_ALIAS |  |  |  | VARCHAR (50) | This column will contain the private key alias used to call a secure webservice. This column will only be populated if the RS_CODE is for a secured web service. |
| 13 | PRIVATE_KEY_ALIAS_PASSWD |  |  |  | Raw (200) | This column will contain the password of the private kjey alias and it will be encrypted. This column will only be populated if the RS_CODE is for a secured web service. |

---

## Table: RMS_BATCH_STATUS

**Description:** This table holds the status of the RMS batch process.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | BATCH_RUNNING_IND |  |  | Y | VARCHAR (1) | This column indicates if RMS batch jobs are running. It is set to 'Y' at the beginning of the RMS batch cycle and set to 'N' at the end of the cycle. |

---

## Table: RMS_OI_BUYER_EARLY_LATE_SHIP

**Description:** This table is used to display early and late shipped orders in the the Buyer Dashboard.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SESSION_ID |  |  | Y | NUMERIC (15) | Uniquely identifies a user session opening the report. |
| 2 | ORDER_NO |  |  | Y | NUMERIC (12) | Holds the purchase order no that meets the filter criteria. |
| 3 | SUP_NAME |  |  |  | VARCHAR (240 ) | Holds the translated name of the order supplier. |
| 4 | NOT_BEFORE_DATE |  |  |  | Date | Holds the not before date of the purchase order. |
| 5 | NOT_AFTER_DATE |  |  |  | Date | Holds the not after date of the purchase order. |
| 6 | EST_ARR_DATE |  |  |  | Date | Holds the estmated arrival date of the order shipment. |
| 7 | OTB_EOW_DATE |  |  |  | Date | Holds the end of week date of the open to buy. |
| 8 | SHIPMENT_ISSUE |  |  |  | VARCHAR (20 ) | Holds the issue that is flagged for the order shipment. For example, ASN not received yet, or early shipment where the estimated arrival date of the order shipment is before the not before date of the order. |

---

## Table: RMS_OI_BUYER_ORDERS_TO_APPROVE

**Description:** This table is used to display unapproved orders in the the Buyer Dashboard.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SESSION_ID |  |  | Y | NUMERIC (15) | Uniquely identifies a user session opening the report. |
| 2 | ORDER_NO |  |  | Y | NUMERIC (12) | Holds the purchase order no that meets the filter criteria. |
| 3 | SUP_NAME |  |  |  | VARCHAR (240 ) | Holds the translated name of the order supplier. |
| 4 | NOT_BEFORE_DATE |  |  |  | Date | Holds the not before date of the purchase order. |
| 5 | NOT_AFTER_DATE |  |  |  | Date | Holds the not after date of the purchase order. |
| 6 | OTB_EOW_DATE |  |  |  | Date | Holds the end of week date of the open to buy. |
| 7 | TOTAL_COST |  |  |  | NUMERIC (*,4) | Holds the total cost of the order. Declared as NUMBER(*,4) to allow greater number of digits for the precision because it holds a total value. |
| 8 | TOTAL_RETAIL |  |  |  | NUMERIC (*,4) | Holds the total retail of the order. Declared as NUMBER(*,4) to allow greater number of digits for the precision because it holds a total value. |
| 9 | CURRENCY_CODE |  |  | Y | VARCHAR (3 ) | Holds the currency code the total_cost and total_retail are expressed in. |
| 10 | CREATE_ID |  |  | Y | VARCHAR (30 ) | Holds the ID of the person created the purchase order. |
| 11 | COMMENT_DESC |  |  |  | VARCHAR (2000 ) | Holds any user comment. |
| 12 | STATUS |  |  |  | VARCHAR (1 ) | Purchase order status |
| 13 | STATUS_DESC |  |  |  | VARCHAR (25 ) | This field contains a description for the PO status. |
| 14 | SUPPLIER |  |  |  | NUMERIC (10) | Contains the vendor number who will provide the merchandise specified in the order. |
| 15 | DEPT |  |  |  | NUMERIC (4) | Contains the department number for orders limited to a single department and will be Null for orders involving items in more than one department. |
| 16 | DEPT_NAME |  |  |  | VARCHAR (120 ) | Department name |
| 17 | PO_TYPE |  |  |  | VARCHAR (4 ) | Contains the value associated with the PO_TYPE for the order. |
| 18 | PO_TYPE_DESC |  |  |  | VARCHAR (120 ) | This field contains a description for the specific order type. |
| 19 | MASTER_PO_NO |  |  |  | NUMERIC (12) | A number that is used to reference the master order number from which child records were created. Orders with the same Master_PO number are grouped together using the same delivery date. |
| 20 | WRITTEN_DATE |  |  |  | Date | Contains the date the order was created within the system. |
| 21 | TOTAL_UNITS |  |  |  | NUMERIC (*,4) | Contains the total number of items ordered. Declared as NUMBER(*,4) to allow greater number of digits for the precision because it holds a total value. |
| 22 | MULTIPLE_UOM_IND |  |  |  | VARCHAR (1 ) | Indicates if the order has more than one unit of measure. |
| 23 | MARKUP_PERCENT |  |  |  | NUMERIC (*,4) | Markup is the difference between the cost of a good or service and its selling price. Declared as NUMBER(*,4) to allow greater number of digits for the precision because it holds a value based on the total. |
| 24 | PO_LAST_UPDATE_DATETIME |  |  |  | Date | Holds the date time stamp of the most recent update by the last_update_id. |
| 25 | PO_LAST_UPDATE_ID |  |  |  | VARCHAR (30 ) | Holds the Oracle user-id of the user who most recently updated this record. |

---

## Table: RMS_OI_BUYER_SALES_GTT

**Description:** This is a global temporary table to support the dashboard Buyer Sales report process. It is used to temporarily hold the sales and margin data for an item that meets the filter criteria.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SESSION_ID |  |  | Y | NUMERIC (15) | Uniquely identifies a user session opening the report. |
| 2 | ITEM |  |  |  | VARCHAR (25 ) | Transactional Item ID or Parent Item ID. For a tran-level item with parent and the parent item is aggregated by at least one differentiator, this holds the Parent Item ID. Otherwise, it holds the tran-level item ID. |
| 3 | ITEM_DESC |  |  |  | VARCHAR (250 ) | Translated description of the ITEM. |
| 4 | AGG_DIFF_1 |  |  |  | VARCHAR (10 ) | Holds the diff_1 value of the tran-level item if the corresponding diff_1_aggregated_ind of its parent item is Y. |
| 5 | AGG_DIFF_2 |  |  |  | VARCHAR (10 ) | Holds the diff_2 value of the tran-level item if the corresponding diff_2_aggregated_ind of its parent item is Y. |
| 6 | AGG_DIFF_3 |  |  |  | VARCHAR (10 ) | Holds the diff_3 value of the tran-level item if the corresponding diff_3_aggregated_ind of its parent item is Y. |
| 7 | AGG_DIFF_4 |  |  |  | VARCHAR (10 ) | Holds the diff_4 value of the tran-level item if the corresponding diff_4_aggregated_ind of its parent item is Y. |
| 8 | AGG_DIFF_1_DESC |  |  |  | VARCHAR (120 ) | Holds the translated description of AGG_DIFF_1. |
| 9 | AGG_DIFF_2_DESC |  |  |  | VARCHAR (120 ) | Holds the translated description of AGG_DIFF_2. |
| 10 | AGG_DIFF_3_DESC |  |  |  | VARCHAR (120 ) | Holds the translated description of AGG_DIFF_3. |
| 11 | AGG_DIFF_4_DESC |  |  |  | VARCHAR (120 ) | Holds the translated description of AGG_DIFF_4. |
| 12 | TOTAL_RETAIL_PRIM |  |  |  | NUMERIC (20,4) | Holds the total_retail from tran_data converted to primary currency. It aggregates the data across all locations that meet the filter criteria. For parent/diff, it also aggregates the data by parent item and all differentiators that are aggregated. |
| 13 | TOTAL_COST_PRIM |  |  |  | NUMERIC (20,4) | Holds the total_cost from tran_data converted to primary currency. It aggregates the data across all locations that meet the filter criteria. For parent/diff, it also aggregates the data by parent item and all differentiators that are aggregated. |
| 14 | TOTAL_MARGIN_PRIM |  |  |  | NUMERIC (20,4) | Holds the total_retail - total_cost from tran_data converted to primary currency. It aggregates the data across all locations that meet the filter criteria. For parent/diff, it also aggregates the data by parent item and all differentiators that are aggregated. |
| 15 | PRIM_CURRENCY_CODE |  |  |  | VARCHAR (3 ) | Holds the primary currency of the system. |
| 16 | SALES_UNITS |  |  |  | NUMERIC (12,4) | Holds the sales quantity in item''s standard unit of measure. |
| 17 | STANDARD_UOM |  |  |  | VARCHAR (4 ) | Holds the item''s standard unit of measure. |

---

## Table: RMS_OI_CUM_MARKON_PCT_VARIANCE

**Description:** This table holds the information about subclass/location combinations having a cumulative markon variance that falls outside of a defined tolerance for the Cumulative markon% Variance Report.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SESSION_ID |  |  |  | NUMERIC (15) | Session id |
| 2 | DEPT |  |  |  | NUMERIC (4) | Department number |
| 3 | DEPT_NAME |  |  |  | VARCHAR (120 ) | Department name |
| 4 | CLASS |  |  |  | NUMERIC (4) | Class number |
| 5 | CLASS_NAME |  |  |  | VARCHAR (120 ) | Class name |
| 6 | SUBCLASS |  |  |  | NUMERIC (4) | Subclass number |
| 7 | SUBCLASS_NAME |  |  |  | VARCHAR (120 ) | Subclass name |
| 8 | LOC |  |  |  | NUMERIC (10) | Location |
| 9 | LOC_TYPE |  |  |  | VARCHAR (1 ) | Location Type |
| 10 | LOC_NAME |  |  |  | VARCHAR (150 ) | Location Name |
| 11 | CALCULATED_MARKON_PCT |  |  |  | NUMERIC (20,10) | Calculated mark on percentage |
| 12 | POSTED_MARKON_PCT |  |  |  | NUMERIC (20,10) | Posted mark on percentage |
| 13 | BUDGETED_MARKON_PCT |  |  |  | NUMERIC (20,10) | Budgeted mark on percentage |
| 14 | VARIANCE_MARKON_PCT |  |  |  | NUMERIC (20,10) | Variance mark on percentage |
| 15 | HTD_GAFS_RETAIL |  |  |  | NUMERIC (20,4) | Half-to-date Goods Available For Sale at retail, used in the retail method of accounting only. htd_gafs_retail = beginning of half stock at retail + half-to-date (purch_retail + markup_retail - RTV_retail + tsf_in_retail - tsf_out_retail)) |
| 16 | HTD_GAFS_COST |  |  |  | NUMERIC (20,4) | Half-to-date Goods Available For Sale at cost, used in the retail method of accounting only. htd_gafs_cost = beginning of half stock at cost + half-to-date (purch_cost + freight_cost - RTV_cost + tsf_in_cost - tsf_out_cost)) |
| 17 | CLS_STK_RETAIL |  |  |  | NUMERIC (20,4) | End of month stock on hand dollar values at retail for a subclass/location. This is a calculated field. cls_stk_retail = opn_stk_retail + purch_retail + markup_retail - RTV _retail + tsf_in_retail - tsf_out_retail - net_sales_retail - perm_markdown_retail - prom_markdown_retail - clear_markdown_retail + markdown_can_retail - shrinkage_retail - empl_disc_retail |
| 18 | CLS_STK_COST |  |  |  | NUMERIC (20,4) | End of month stock on hand dollar values at cost for a subclass/location. This is a calculated field. For retail method of accounting : cls_stk_cost = cls_stk_retail * ( 1 - cum_markon_pct/100) For cost method of accounting : cls_stk_cost = opn_stk_cost + purch_cost - RTV_cost + tsf_in_cost - tsf_out_cost |
| 19 | HTD_GAFS_RETAIL_PRIM_CUR |  |  |  | NUMERIC (20,4) | The HTD_GAFS_RETAIL coverted to the primary currency. |
| 20 | HTD_GAFS_COST_PRIM_CUR |  |  |  | NUMERIC (20,4) | The HTD_GAFS_COST coverted to the primary currency. |
| 21 | CLS_STK_RETAIL_PRIM_CUR |  |  |  | NUMERIC (20,4) | The CLS_STK_RETAIL coverted to the primary currency. |
| 22 | CLS_STK_COST_PRIM_CUR |  |  |  | NUMERIC (20,4) | The CLS_STK_COST coverted to the primary currency. |
| 23 | EOM_DATE |  |  |  | Date | The end of month date for the row. |
| 24 | CURRENCY_CODE |  |  |  | VARCHAR (3 ) | The currency for the location. |
| 25 | SUBCLASS_EOM_DATE_LOC_CNT |  |  |  | NUMERIC (10) | The count of locations that share the same dept/class/subclass and eom_date. |
| 26 | LOC_EOM_DATE_SUBCLASS_CNT |  |  |  | NUMERIC (10) | The count of dept/class/subclasses that share the same location and eom_date. |

---

## Table: RMS_OI_DATA_STWRD_CMPLTD_ITEMS

**Description:** This tables holds data for the items marked as completed in the Data Steward Dashboard Incomplete Items Report.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM | P | F | Y | VARCHAR (25) | Item number. |
| 2 | COMPLETED |  |  | Y | VARCHAR (1 ) | Marks the completed flag to ''Y'' for all items that are marked as COMPLETED in the Incomplete Items report, though not completed in the base tables. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_RMS_OI_DS_COMP_ITEM|PK||||ITEM|ASC|

---

## Table: RMS_OI_DATA_STWRD_INCOMP_ITEMS

**Description:** This tables holds data for the Data Steward Incomplete Items Report.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SESSION_ID |  |  |  | NUMERIC (15) | The session_id for the data. |
| 2 | REQD_COMPLETION |  |  |  | NUMERIC (3) | Indicates the percentage of completion for the all parameteres configured as 'Required'. |
| 3 | ITEM_PARENT |  |  |  | VARCHAR (25 ) | Parent Item. |
| 4 | ITEM |  |  |  | VARCHAR (25 ) | Item. |
| 5 | ITEM_DESC |  |  |  | VARCHAR (250 ) | Item description. |
| 6 | STATUS |  |  |  | VARCHAR (1 ) | Item status. |
| 7 | DEPT |  |  |  | NUMERIC (4) | Department to which item belongs. |
| 8 | DEPT_NAME |  |  |  | VARCHAR (120 ) | Department name. |
| 9 | CLASS |  |  |  | NUMERIC (4) | Class to which item belongs. |
| 10 | CLASS_NAME |  |  |  | VARCHAR (120 ) | Class name. |
| 11 | SUBCLASS |  |  |  | NUMERIC (4) | Subclass to which item belongs. |
| 12 | SUBCLASS_NAME |  |  |  | VARCHAR (120 ) | Subclass name. |
| 13 | CREATE_DATE |  |  |  | Date | Item Create Date. |
| 14 | CREATE_ID |  |  |  | VARCHAR (30 ) | Item Create ID. |
| 15 | PRIM_SUPPLIER |  |  |  | NUMERIC (10) | Primary Supplier Site of the Item. |
| 16 | PRIM_SUPPLIER_NAME |  |  |  | VARCHAR (240 ) | Primary Supplier Site name. |
| 17 | PRIM_COUNTRY |  |  |  | VARCHAR (3 ) | Primary Country of the item. |
| 18 | UNIT_COST |  |  |  | NUMERIC (20,4) | Unit cost of the item. |
| 19 | SELLING_RETAIL |  |  |  | NUMERIC (20,4) | Selling retail. |
| 20 | SUP_CURRENCY |  |  |  | VARCHAR (3 ) | Supplier Currency. |
| 21 | VPN |  |  |  | VARCHAR (30 ) | VPN. |
| 22 | PACK_IND |  |  |  | VARCHAR (1 ) | Indicates if the Item is a pack. |
| 23 | REF_ITEMS |  |  |  | NUMERIC (3) | Reference Items. |
| 24 | VAT |  |  |  | NUMERIC (3) | Value Added Tax. |
| 25 | SIMPLE_PACK |  |  |  | NUMERIC (3) | Simple Pack. |
| 26 | UDA |  |  |  | NUMERIC (3) | UDA. |
| 27 | LOCATION |  |  |  | NUMERIC (3) | Item Location. |
| 28 | SEASONS |  |  |  | NUMERIC (3) | Seasons/Phases. |
| 29 | REPLENISHMENT |  |  |  | NUMERIC (3) | Replenishment. |
| 30 | SUBS_ITEMS |  |  |  | NUMERIC (3) | Substitute Items. |
| 31 | DIMENSIONS |  |  |  | NUMERIC (3) | Dimensions. |
| 32 | RELATED_ITEMS |  |  |  | NUMERIC (3) | Related Items. |
| 33 | TICKET |  |  |  | NUMERIC (3) | Ticket. |
| 34 | HTS |  |  |  | NUMERIC (3) | HTS. |
| 35 | IMPORT_ATTR |  |  |  | NUMERIC (3) | Import Attributes. |
| 36 | IMAGES |  |  |  | NUMERIC (3) | Item Images. |

---

## Table: RMS_OI_DEPT_OPTIONS

**Description:** This table holds department level configurations for the Dashboard Reports.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEPT | P |  | Y | NUMERIC (4) | The department. |
| 2 | FA_CUM_MARKON_MIN_VAR_PCT |  |  |  | NUMERIC (12,4) | Defines the tolerance level outside of which if the cumulative mark on % variance falls, the subclass/locations combinations will be shown in the |
| 3 | DS_DAYS_AFTER_ITEM_CREATE |  |  |  | NUMERIC (3) | Defines the number of days after item creation after which the Item will appear in INCOMPLETE ITEMS report. |
| 4 | DS_SHOW_INCOMP_ITEM_REF_ITEM |  |  |  | VARCHAR (1) | Configured to show Reference Items in Incomplete Items Report. Valid values are 'R'equired or 'O'ptional or 'N'ot required. Default to be taken from RMS_OI_SYSTEM_OPTIONS table. |
| 5 | DS_SHOW_INCOMP_ITEM_VAT |  |  |  | VARCHAR (1) | Configured to show VAT in Incomplete Items Report. Valid values are 'R'equired or 'O'ptional or 'N'ot required. Default to be taken from RMS_OI_SYSTEM_OPTIONS table. |
| 6 | DS_SHOW_INCOMP_ITEM_SPACK |  |  |  | VARCHAR (1) | Configured to show Simple Pack in Incomplete Items Report. Valid values are 'R'equired or 'O'ptional or 'N'ot required. Default to be taken from RMS_OI_SYSTEM_OPTIONS table. |
| 7 | DS_SHOW_INCOMP_ITEM_UDA |  |  |  | VARCHAR (1) | Configured to show UDA in Incomplete Items Report. Valid values are 'R'equired or 'O'ptional or 'N'ot required. Default to be taken from RMS_OI_SYSTEM_OPTIONS table. |
| 8 | DS_SHOW_INCOMP_ITEM_LOC |  |  |  | VARCHAR (1) | Configured to show Locations in Incomplete Items Report. Valid values are 'R'equired or 'O'ptional or 'N'ot required. Default to be taken from RMS_OI_SYSTEM_OPTIONS table. |
| 9 | DS_SHOW_INCOMP_ITEM_SEASONS |  |  |  | VARCHAR (1) | Configured to show Seasons/Phases in Incomplete Items Report. Valid values are 'R'equired or 'O'ptional or 'N'ot required. Default to be taken from RMS_OI_SYSTEM_OPTIONS table. |
| 10 | DS_SHOW_INCOMP_ITEM_REPL |  |  |  | VARCHAR | Configured to show Replenishment in Incomplete Items Report. Valid values are 'R'equired or 'O'ptional or 'N'ot required. Default to be taken from RMS_OI_SYSTEM_OPTIONS table. |
| 11 | DS_SHOW_INCOMP_ITEM_SUBS_ITEM |  |  |  | VARCHAR (1) | Configured to show Substitute Items in Incomplete Items Report. Valid values are 'R'equired or 'O'ptional or 'N'ot required. Default to be taken from RMS_OI_SYSTEM_OPTIONS table. |
| 12 | DS_SHOW_INCOMP_ITEM_DIMEN |  |  |  | VARCHAR (1) | Configured to show Dimensions in Incomplete Items Report. Valid values are 'R'equired or 'O'ptional or 'N'ot required. Default to be taken from RMS_OI_SYSTEM_OPTIONS table. |
| 13 | DS_SHOW_INCOMP_ITEM_REL_ITEM |  |  |  | VARCHAR (1) | Configured to show Related Items in Incomplete Items Report. Valid values are 'R'equired or 'O'ptional or 'N'ot required. Default to be taken from RMS_OI_SYSTEM_OPTIONS table. |
| 14 | DS_SHOW_INCOMP_ITEM_TICKETS |  |  |  | VARCHAR (1) | Configured to show Tickets in Incomplete Items Report. Valid values are 'R'equired or 'O'ptional or 'N'ot required. Default to be taken from RMS_OI_SYSTEM_OPTIONS table. |
| 15 | DS_SHOW_INCOMP_ITEM_HTS |  |  |  | VARCHAR (1) | Configured to show HTS in Incomplete Items Report. Valid values are 'R'equired or 'O'ptional or 'N'ot required. Default to be taken from RMS_OI_SYSTEM_OPTIONS table. |
| 16 | DS_SHOW_INCOMP_ITEM_IMP_ATTR |  |  |  | VARCHAR (1) | Configured to show Import Attributes in Incomplete Items Report. Valid values are 'R'equired or 'O'ptional or 'N'ot required. Default to be taken from RMS_OI_SYSTEM_OPTIONS table. |
| 17 | DS_SHOW_INCOMP_ITEM_IMAGES |  |  |  | VARCHAR (1) | Configured to show Images in Incomplete Items Report. Valid values are 'R'equired or 'O'ptional or 'N'ot required. Default to be taken from RMS_OI_SYSTEM_OPTIONS table. |
| 18 | IC_UNEXP_INV_TOLERANCE_QTY |  |  |  | NUMERIC (12,4) | Defines a tolerance level of unexpected inventory for an item location to be shown in the Inventory Control Unexpected Inventory Report at Department level. |
| 19 | IC_NEG_INV_TOLERANCE_QTY |  |  |  | NUMERIC (12,4) | Defines a tolerance level of negative inventory for an item location to be shown in the Inventory Control Negative Inventory Report at Department level. |
| 20 | IC_UNEXP_INV_INACTIVE_IND |  |  |  | VARCHAR (1) | Controls if inactive item/locs are included in the inventory control unexpected inventory report at Department level. |
| 21 | IC_UNEXP_INV_DISCONTINUE_IND |  |  |  | VARCHAR (1) | Controls if discontinued item/locs are included in the inventory control unexpected inventory report at Department level. |
| 22 | IC_UNEXP_INV_DELETE_IND |  |  |  | VARCHAR (1) | Controls if deleted item/locs are included in the inventory control unexpected inventory report at Department level. |
| 23 | IC_UNEXP_INV_WARN_COUNT |  |  |  | NUMERIC (10) | Controls the number of item/locs when exceeded causes the unexpected inventory report to be considered critical in the inventory control unexpected inventory report. |
| 24 | IC_UNEXP_INV_CRITIAL_COUNT |  |  |  | NUMERIC (10) | Controls the number of item/locs when exceeded causes the unexpected inventory report to be considered warning in the inventory control unexpected inventory report. |
| 25 | IA_VARIANCE_RANGE_PCT_1 |  |  |  | NUMERIC (12,4) | Configuring first % value for Inventory Variance to Forecast tile. |
| 26 | IA_VARIANCE_RANGE_PCT_2 |  |  |  | NUMERIC (12,4) | Configuring second % value for Inventory Variance to Forecast tile. |
| 27 | IA_VARIANCE_RANGE_PCT_3 |  |  |  | NUMERIC (12,4) | Configuring third % value for Inventory Variance to Forecast tile. |
| 28 | IA_VARIANCE_RANGE_PCT_4 |  |  |  | NUMERIC (12,4) | Configuring forth % value for Inventory Variance to Forecast tile. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_RMS_OI_DEPT_OPTIONS|PK||||DEPT|ASC|

---

## Table: RMS_OI_INV_ANA_INV_GTT

**Description:** This table holds data for the Inventory Analyst Order Errors Detail Report.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SESSION_ID |  |  |  | NUMERIC (15) | The session_id for the data. |
| 2 | ITEM |  |  |  | VARCHAR (25 ) | The item. |
| 3 | ITEM_PARENT |  |  |  | VARCHAR (25 ) | The item parent. |
| 4 | ITEM_DESC |  |  |  | VARCHAR (250 ) | The item description. |
| 5 | ALC_ITEM_TYPE |  |  |  | VARCHAR (15 ) | The alc_item_type of the item. |
| 6 | AGG_DIFF_1 |  |  |  | VARCHAR (10 ) | The aggregate diff 1 of the item. |
| 7 | AGG_DIFF_2 |  |  |  | VARCHAR (10 ) | The aggregate diff 2 of the item. |
| 8 | AGG_DIFF_3 |  |  |  | VARCHAR (10 ) | The aggregate diff 3 of the item. |
| 9 | AGG_DIFF_4 |  |  |  | VARCHAR (10 ) | The aggregate diff 4 of the item. |
| 10 | LOC |  |  |  | NUMERIC (10) | The location. |
| 11 | GROUPING_LOC_ID |  |  |  | VARCHAR (150 ) | The grouping location ID. |
| 12 | GROUPING_LOC_NAME |  |  |  | VARCHAR (150 ) | The grouping location name. |
| 13 | STOCK_ON_HAND |  |  |  | NUMERIC (12,4) | The stock on hand for the item location |
| 14 | IN_TRANSIT_QTY |  |  |  | NUMERIC (12,4) | The in transit qty for the item location |
| 15 | PACK_COMP_INTRAN |  |  |  | NUMERIC (12,4) | The pack_comp_intran for the item location |
| 16 | PACK_COMP_SOH |  |  |  | NUMERIC (12,4) | The pack_comp_soh for the item location |
| 17 | TSF_RESERVED_QTY |  |  |  | NUMERIC (12,4) | The tsf_reserved_qty for the item location |
| 18 | PACK_COMP_RESV |  |  |  | NUMERIC (12,4) | The pack_comp_resv for the item location |
| 19 | TSF_EXPECTED_QTY |  |  |  | NUMERIC (12,4) | The tsf_expected_qty for the item location |
| 20 | PACK_COMP_EXP |  |  |  | NUMERIC (12,4) | The pack_comp_exp for the item location |
| 21 | RTV_QTY |  |  |  | NUMERIC (12,4) | The rtv_qty for the item location |
| 22 | NON_SELLABLE_QTY |  |  |  | NUMERIC (12,4) | The non_sellable_qty for the item location |
| 23 | PACK_COMP_NON_SELLABLE |  |  |  | NUMERIC (12,4) | The pack_comp_non_sellable for the item location |
| 24 | CUSTOMER_RESV |  |  |  | NUMERIC (12,4) | The customer_resv for the item location |
| 25 | PACK_COMP_CUST_RESV |  |  |  | NUMERIC (12,4) | The pack_comp_cust_resv for the item location |
| 26 | CUSTOMER_BACKORDER |  |  |  | NUMERIC (12,4) | The customer_backorder for the item location |
| 27 | PACK_COMP_CUST_BACK |  |  |  | NUMERIC (12,4) | The pack_comp_cust_back for the item location |
| 28 | FORECAST_SALES |  |  |  | NUMERIC (12,4) | The forecast_sales for the item location |
| 29 | ON_ORDER_QTY |  |  |  | NUMERIC (12,4) | The on_order_qty for the item location |
| 30 | CO_INBOUND |  |  |  | NUMERIC (12,4) | The co_inbound for the item location |
| 31 | PL_TSF_INBOUND |  |  |  | NUMERIC (12,4) | The pl_tsf_inbound for the item location |
| 32 | ALLOC_INBOUND |  |  |  | NUMERIC (12,4) | The alloc_inbound for the item location |
| 33 | ALLOC_OUTBOUND |  |  |  | NUMERIC (12,4) | The alloc_outbound for the item location |
| 34 | SALES_HIST_QTY |  |  |  | NUMERIC (12,4) | The sales_hist_qty for the item location |
| 35 | UNIT_RETAIL |  |  |  | NUMERIC (20,4) | The unit_retail for the item location |
| 36 | AVAIL_QTY |  |  |  | NUMERIC (12,4) | The avail_qty for the item location |
| 37 | FORECAST_SALES_HIST |  |  |  | NUMERIC (12,4) | The forecast_sales history for the item location |

---

## Table: RMS_OI_INV_ANA_OPEN_ORDER

**Description:** This table holds data for the Inventory Analyst Order Errors Detail Report.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SESSION_ID |  |  |  | NUMERIC (15) | The session_id for the data |
| 2 | ORDER_NO |  |  |  | NUMERIC (10) | The order. |
| 3 | SUPPLIER_SITE |  |  |  | NUMERIC (10) | The supplier of the order. |
| 4 | SUP_NAME |  |  |  | VARCHAR (240 ) | The supplier name. |
| 5 | NOT_BEFORE_DATE |  |  |  | Date | The not before date of the order. |
| 6 | NOT_AFTER_DATE |  |  |  | Date | The not after date of the order. |
| 7 | OTB_EOW_DATE |  |  |  | Date | the otb eow date of the order |
| 8 | QTY_ORDERED |  |  |  | NUMERIC (12,4) | The quantity ordered. |
| 9 | QTY_RECEIVED |  |  |  | NUMERIC (12,4) | Teh quantity received. |
| 10 | ORDER_TYPE |  |  |  | VARCHAR (3 ) | Indicates the type of order and which Open To Buy bucket will be updated. |
| 11 | WF_ORDER_NO |  |  |  | NUMERIC (10) | This column contains the franchise order number for which the purchase order was created. |

---

## Table: RMS_OI_INV_ANA_VARIANCE

**Description:** This table holds data for the Inventory Analyst Inventory Variance to Forecast Report.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SESSION_ID |  |  |  | NUMERIC (15) | The session_id for the data. |
| 2 | ITEM |  |  |  | VARCHAR (25 ) | The item for the row. |
| 3 | ITEM_DESC |  |  |  | VARCHAR (250 ) | The item description. |
| 4 | ALC_ITEM_TYPE |  |  |  | VARCHAR (15 ) | The alc_item_type of the item. |
| 5 | AGG_DIFF_1 |  |  |  | VARCHAR (10 ) | The aggregate diff 1 for the item. |
| 6 | AGG_DIFF_2 |  |  |  | VARCHAR (10 ) | The aggregate diff 2 for the item. |
| 7 | AGG_DIFF_3 |  |  |  | VARCHAR (10 ) | The aggregate diff 3 for the item. |
| 8 | AGG_DIFF_4 |  |  |  | VARCHAR (10 ) | The aggregate diff 4 for the item. |
| 9 | SALES_UNITS |  |  |  | NUMERIC (20,4) | The sales units for the item. |
| 10 | SALES_VAR_TO_FORECAST_PCT |  |  |  | NUMERIC (20,4) | The sales variance to forecast percent. |
| 11 | INV_UNITS |  |  |  | NUMERIC (20,4) | The inventory for the item. |
| 12 | INV_VAR_VALUE |  |  |  | NUMERIC (20,4) | The Inventory Variance value. |
| 13 | INV_VAR_TO_FORECAST_PCT |  |  |  | NUMERIC (20,4) | The inventory variance to forecast percent. |
| 14 | CURRENCY_CODE |  |  |  | VARCHAR (3 ) | The currency code of the inv_var_value column. Will be base currency. |

---

## Table: RMS_OI_INV_ANA_VARIANCE_DEFER

**Description:** This table holds defered item data for the Inventory Analyst Inventory Variance to Forecast Report.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SESSION_ID |  |  | Y | NUMERIC (15) | The session_id for the data. |
| 2 | DEFER_TO_DATE |  |  | Y | Date | The date to defer the item to. |
| 3 | DEFER_USER |  |  | Y | VARCHAR (30 ) | The user who is defering the item. |
| 4 | ITEM |  |  | Y | VARCHAR (25 ) | The item for the row. |
| 5 | ALC_ITEM_TYPE |  |  |  | VARCHAR (15 ) | The alc_item_type of the item. |
| 6 | AGG_DIFF_1 |  |  |  | VARCHAR (10 ) | The aggregate diff 1 for the item. |
| 7 | AGG_DIFF_2 |  |  |  | VARCHAR (10 ) | The aggregate diff 2 for the item. |
| 8 | AGG_DIFF_3 |  |  |  | VARCHAR (10 ) | The aggregate diff 3 for the item. |
| 9 | AGG_DIFF_4 |  |  |  | VARCHAR (10 ) | The aggregate diff 4 for the item. |

---

## Table: RMS_OI_INV_CTL_NEG_INV

**Description:** This table holds the information for the Negative Inventory Control Report.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SESSION_ID |  |  |  | NUMERIC (15) | The session_id for the data. |
| 2 | ITEM |  |  |  | VARCHAR (25 ) | The item. |
| 3 | ITEM_DESC |  |  |  | VARCHAR (250 ) | The item description |
| 4 | STANDARD_UOM |  |  |  | VARCHAR (4 ) | The standard UOM for the item |
| 5 | LOC |  |  |  | NUMERIC (10) | The location |
| 6 | LOC_NAME |  |  |  | VARCHAR (150 ) | The location name. |
| 7 | LOC_TYPE |  |  |  | VARCHAR (150 ) | The type of location |
| 8 | STOCK_ON_HAND |  |  |  | NUMERIC (12,4) | The stock on hand for the item/location. |
| 9 | IN_PROGRESS_PO_COUNT |  |  |  | NUMERIC (10) | The number of in process orders. |
| 10 | IN_PROGRESS_TSF_COUNT |  |  |  | NUMERIC (10) | The number of in process transfers. |
| 11 | IN_PROGRESS_ALLOC_COUNT |  |  |  | NUMERIC (10) | The number of in process allocations. |

---

## Table: RMS_OI_INV_ORD_ERRORS

**Description:** This table holds data for the Inventory Analyst Order Errors Detail Report.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SESSION_ID |  |  |  | NUMERIC (15) | The session_id for the data. |
| 2 | ORDER_NO |  |  |  | NUMERIC (12) | The order number. |
| 3 | SUPPLIER_SITE |  |  |  | NUMERIC (10) | The supplier of the order. |
| 4 | STATUS |  |  |  | VARCHAR (1 ) | The status of the order. |
| 5 | NOT_BEFORE_DATE |  |  |  | Date | The not before date of the order. |
| 6 | NOT_AFTER_DATE |  |  |  | Date | The not after date of the order. |
| 7 | OTB_EOW_DATE |  |  |  | Date | The otb_eow_date of the order. |
| 8 | TOTAL_COST |  |  |  | NUMERIC (20,4) | The total cost of the order. |
| 9 | RECEIVED_PERCENT |  |  |  | NUMERIC (20,10) | The received percent for the order. |
| 10 | IMPORT_ORDER_IND |  |  |  | VARCHAR (1 ) | The import order indicator for the order. |
| 11 | MASTER_PO_NO |  |  |  | NUMERIC (12) | The master PO for the order. |
| 12 | CURRENCY_CODE |  |  |  | VARCHAR (3 ) | The currency of the order. |
| 13 | ERROR_MESSAGE |  |  |  | VARCHAR (255 ) | The description of the error associated with the order |
| 14 | TOTAL_RETAIL |  |  |  | NUMERIC (20,4) | Holds the total retail of the order. |
| 15 | RECEIVED_UNITS |  |  |  | NUMERIC (12,4) | Contains the total received number of items ordered |
| 16 | OUTSTANDING_UNITS |  |  |  | NUMERIC (12,4) | Contains the total outstanding number of items ordered |
| 17 | MULTIPLE_UOM_IND |  |  |  | VARCHAR (1 ) | Indicates if the order has more than one unit of measure. |
| 18 | OUTSTANDING_COST |  |  |  | NUMERIC (20,4) | Holds the cost of the order outstanding units. |
| 19 | OUTSTANDING_RETAIL |  |  |  | NUMERIC (20,4) | Holds the retail of the order outstanding units. |
| 20 | DEPT |  |  |  | NUMERIC (4) | Contains the department number for orders limited to a single department and will be Null for orders involving items in more than one department. |
| 21 | DEPT_NAME |  |  |  | VARCHAR (120 ) | Department name |
| 22 | PO_TYPE |  |  |  | VARCHAR (4 ) | Contains the value associated with the PO_TYPE for the order. |
| 23 | PO_TYPE_DESC |  |  |  | VARCHAR (120 ) | This field contains a description for the specific order type. |
| 24 | COMMENT_DESC |  |  |  | VARCHAR (2000 ) | Holds user comment. |
| 25 | PO_LAST_UPDATE_DATETIME |  |  |  | Date | Holds the date time stamp of the most recent update by the last_update_id. |
| 26 | PO_LAST_UPDATE_ID |  |  |  | VARCHAR (30 ) | Holds the Oracle user-id of the user who most recently updated this record. |
| 27 | TOTAL_UNITS |  |  |  | NUMERIC (12,4) | The total order quantity. |
| 28 | ORDER_TYPE |  |  |  | VARCHAR (3 ) | Indicates the type of order and which Open To Buy bucket will be updated. |
| 29 | WF_ORDER_NO |  |  |  | NUMERIC (10) | This column contains the franchise order number for which the purchase order was created. |

---

## Table: RMS_OI_INV_ORD_ITEM_ERRORS

**Description:** This table holds data for the Inventory Analyst Order Errors Item Detail Report.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SESSION_ID |  |  |  | NUMERIC (15) | The session_id for the data. |
| 2 | ORDER_NO |  |  |  | NUMERIC (12) | The order number. |
| 3 | ITEM |  |  |  | VARCHAR (25 ) | The item on the order. |
| 4 | ITEM_DESC |  |  |  | VARCHAR (250 ) | The description of the item. |
| 5 | ITEM_PARENT |  |  |  | VARCHAR (25 ) | The item parent. |
| 6 | ITEM_PARENT_DESC |  |  |  | VARCHAR (250 ) | The item parent description. |
| 7 | VPN |  |  |  | VARCHAR (30 ) | The of the item. |
| 8 | REF_ITEM |  |  |  | VARCHAR (25 ) | The ref item. |
| 9 | REF_ITEM_DESC |  |  |  | VARCHAR (250 ) | The ref item description. |
| 10 | IMPORT_ORDER_IND |  |  |  | VARCHAR (1 ) | The import_order_ind for the order. |
| 11 | MARGIN |  |  |  | NUMERIC (20,10) | The margin for the order. |
| 12 | ERROR_MESSAGE |  |  |  | VARCHAR (255) | The error message associated with the order/item. |
| 13 | REF_ITEM_ACTION_IND |  |  |  | VARCHAR (1 ) | Indicates for rows with reference item errors, whether or not a primary refrerance item exists. This will control the add reference item action is emabled. Values will be Y/N. |
| 14 | ORDER_TYPE |  |  |  | VARCHAR (3 ) | Indicates the type of order and which Open To Buy bucket will be updated. |
| 15 | WF_ORDER_NO |  |  |  | NUMERIC (10) | This column contains the franchise order number for which the purchase order was created. |

---

## Table: RMS_OI_LATE_POST_TRANSACTIONS

**Description:** This table holds the information about sof any late posted transactions that have occurred since the last month close for total company and by location for the Late posted transaction Variance Report.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SESSION_ID |  |  |  | NUMERIC (15) | Session id |
| 2 | REGION |  |  |  | NUMERIC (10) | Region |
| 3 | REGION_NAME |  |  |  | VARCHAR (150 ) | Region name |
| 4 | DISTRICT |  |  |  | NUMERIC (10) | District |
| 5 | DISTRICT_NAME |  |  |  | VARCHAR (150 ) | District name |
| 6 | LOC |  |  |  | NUMERIC (10) | Location |
| 7 | LOC_NAME |  |  |  | VARCHAR (150 ) | Location Name |
| 8 | DEPT |  |  |  | NUMERIC (4) | Department number |
| 9 | DEPT_NAME |  |  |  | VARCHAR (120 ) | Department name |
| 10 | CLASS |  |  |  | NUMERIC (4) | Class number |
| 11 | CLASS_NAME |  |  |  | VARCHAR (120 ) | Class name |
| 12 | SUBCLASS |  |  |  | NUMERIC (4) | Subclass number |
| 13 | SUBCLASS_NAME |  |  |  | VARCHAR (120 ) | Subclass name |
| 14 | TRAN_TYPE |  |  |  | VARCHAR (4 ) | Transaction type |
| 15 | TRAN_TYPE_DESC |  |  |  | VARCHAR (250 ) | Transaction type description |
| 16 | TOTAL_COST |  |  |  | NUMERIC (20,4) | Total cost |
| 17 | TOTAL_RETAIL |  |  |  | NUMERIC (20,4) | Total retail |
| 18 | CURRENCY_CODE |  |  |  | VARCHAR (3 ) | Currency code |
| 19 | TRAN_COUNT |  |  |  | NUMERIC (10) | Count of late transactions for a particular transaction type belonging to a particular location/subclass |
| 20 | LOC_TYPE |  |  |  | VARCHAR (1 ) | Location type |

---

## Table: RMS_OI_LEAD_TIME_GTT

**Description:** Helper table for Inventory Analyst Dashboard.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  |  |  | VARCHAR (25 ) | The item of the row. |
| 2 | LOC |  |  |  | NUMERIC (10) | The location of the row. |
| 3 | PLAN_SUP_LEAD_TIME |  |  |  | NUMERIC (20,10) | The planned suppleir lead time. |
| 4 | PLAN_WH_LEAD_TIME |  |  |  | NUMERIC (20,10) | The planned wh lead time. |
| 5 | PLAN_REVIEW_LEAD_TIME |  |  |  | NUMERIC (20,10) | The planned review lead time. |
| 6 | ACTUAL_SUP_LEAD_TIME |  |  |  | NUMERIC (20,10) | The actual suppleir lead time. |
| 7 | ACTUAL_WH_LEAD_TIME |  |  |  | NUMERIC (20,10) | The actual wh lead time. |
| 8 | ACTUAL_REVIEW_LEAD_TIME |  |  |  | NUMERIC (20,10) | The actual review lead time. |

---

## Table: RMS_OI_MISSING_STOCK_COUNT

**Description:** This table holds the information for the Missing Stock Count Inventory Control Report.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SESSION_ID |  |  |  | NUMERIC (15) | The session_id for the data. |
| 2 | CYCLE_COUNT |  |  |  | NUMERIC (8) | The stock count id. |
| 3 | CYCLE_COUNT_DESC |  |  |  | VARCHAR (250 ) | The stock count description. |
| 4 | LOC |  |  |  | NUMERIC (10) | The location |
| 5 | LOC_TYPE |  |  |  | VARCHAR (1 ) | The location type. |
| 6 | LOC_NAME |  |  |  | VARCHAR (150 ) | The location name. |
| 7 | STOCKTAKE_DATE |  |  |  | Date | The stock count date. |

---

## Table: RMS_OI_OVERDUE_SHIP_ALLOC

**Description:** This table holds the information for the Allocations Pending Close Inventory Control Report.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SESSION_ID |  |  |  | NUMERIC (15) | The session_id for the data. |
| 2 | ALLOC_NO |  |  |  | NUMERIC (10) | The allocation. |
| 3 | FROM_LOC |  |  |  | NUMERIC (10) | The allocation from location. |
| 4 | FROM_LOC_NAME |  |  |  | VARCHAR (150 ) | The allocation from location name. |
| 5 | FROM_LOC_TYPE |  |  |  | VARCHAR (1 ) | The allocation from location type. |
| 6 | ITEM |  |  |  | VARCHAR (25 ) | The item. |
| 7 | ITEM_DESC |  |  |  | VARCHAR (250 ) | The item description. |
| 8 | RELEASE_DATE |  |  |  | Date | The release date. |
| 9 | ALLOC_QTY |  |  |  | NUMERIC (12,4) | The allocation quantity. |

---

## Table: RMS_OI_OVERDUE_SHIP_RTV

**Description:** This table holds the information for the RTVs Pending Close Inventory Control Report.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SESSION_ID |  |  |  | NUMERIC (15) | The session_id for the data. |
| 2 | RTV_ORDER_NO |  |  |  | NUMERIC (10) | The RTV id. |
| 3 | FROM_LOC |  |  |  | NUMERIC (10) | The RTV from location. |
| 4 | FROM_LOC_NAME |  |  |  | VARCHAR (150 ) | The RTV from location name. |
| 5 | FROM_LOC_TYPE |  |  |  | VARCHAR (1 ) | The RTV from location type. |
| 6 | SUPPLIER_SITE |  |  |  | NUMERIC (10) | The supplier site for the RTV. |
| 7 | SUPPLIER_SITE_NAME |  |  |  | VARCHAR (240 ) | The supplier name. |
| 8 | CREATED_DATE |  |  |  | Date | The create date. |
| 9 | NOT_AFTER_DATE |  |  |  | Date | The not after date. |
| 10 | RTV_QTY |  |  |  | NUMERIC (12,4) | The total quantity for the RTV. |
| 11 | MULTI_UOM_IND |  |  |  | VARCHAR (1 ) | Indicates if the items on the RTV have more than 1 standard UOM between them. Possible values are Y or N. |

---

## Table: RMS_OI_OVERDUE_SHIP_TSF

**Description:** This table holds the information for the Transfers Pending Close Inventory Control Report.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SESSION_ID |  |  |  | NUMERIC (15) | The session_id for the data. |
| 2 | TSF_NO |  |  |  | NUMERIC (12) | The transfer. |
| 3 | TSF_TYPE |  |  |  | VARCHAR (6 ) | The transfer type. |
| 4 | FROM_LOC |  |  |  | NUMERIC (10) | The transfer from location. |
| 5 | FROM_LOC_NAME |  |  |  | VARCHAR (150 ) | The transfer from location name. |
| 6 | FROM_LOC_TYPE |  |  |  | VARCHAR (1 ) | The transfer from location type. |
| 7 | TO_LOC |  |  |  | NUMERIC (10) | The transfer to location. |
| 8 | TO_LOC_NAME |  |  |  | VARCHAR (150 ) | The transfer to location name. |
| 9 | TO_LOC_TYPE |  |  |  | VARCHAR (1 ) | The transfer to location type. |
| 10 | APPROVAL_DATE |  |  |  | Date | The tranfer approval date. |
| 11 | NOT_AFTER_DATE |  |  |  | Date | The tranfer not after date. |
| 12 | DELIVERY_DATE |  |  |  | Date | The transfer delivery date. |
| 13 | FINISHER |  |  |  | NUMERIC (10) | The finisher. |
| 14 | FINISHER_NAME |  |  |  | VARCHAR (150 ) | The finisher name. |
| 15 | INTERCOMPANY_IND |  |  |  | VARCHAR (1 ) | Indications if the transfer is inter-company. |
| 16 | TSF_QTY |  |  |  | NUMERIC (12,4) | The total quantity for the transfer. |
| 17 | MULTI_UOM_IND |  |  |  | VARCHAR (1 ) | Indicates if the items on the transfer have more than 1 standard UOM between them. Possible values are Y or N. |

---

## Table: RMS_OI_SHRINKAGE_VARIANCE

**Description:** This table holds the information about shrinkage differences between the actual and budgeted shrinkage rate falling outside the defined tolerence for the Shrinkage Variance Report.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SESSION_ID |  |  |  | NUMERIC (15) | Session id |
| 2 | REGION |  |  |  | NUMERIC (10) | Region |
| 3 | REGION_NAME |  |  |  | VARCHAR (150 ) | Region name |
| 4 | DISTRICT |  |  |  | NUMERIC (10) | District |
| 5 | DISTRICT_NAME |  |  |  | VARCHAR (150 ) | District name |
| 6 | LOC |  |  |  | NUMERIC (10) | Location |
| 7 | LOC_TYPE |  |  |  | VARCHAR (1 ) | Location Type |
| 8 | LOC_NAME |  |  |  | VARCHAR (150 ) | Location Name |
| 9 | DEPT |  |  |  | NUMERIC (4) | Department number |
| 10 | DEPT_NAME |  |  |  | VARCHAR (120 ) | Department name |
| 11 | CLASS |  |  |  | NUMERIC (4) | Class number |
| 12 | CLASS_NAME |  |  |  | VARCHAR (120 ) | Class name |
| 13 | SUBCLASS |  |  |  | NUMERIC (4) | Subclass number |
| 14 | SUBCLASS_NAME |  |  |  | VARCHAR (120 ) | Subclass name |
| 15 | BUDGETED_SHRINKAGE |  |  |  | NUMERIC (20,4) | Budgeted shrinkage |
| 16 | BUDGETED_SHRINKAGE_RATE |  |  |  | NUMERIC (20,4) | Budgeted_Shrinkage rate |
| 17 | ACTUAL_SHRINKAGE |  |  |  | NUMERIC (20,4) | Actual shrinkage |
| 18 | ACTUAL_SHRINKAGE_RATE |  |  |  | NUMERIC (20,4) | Actual_Shrinkage rate |
| 19 | TOTAL_SALES |  |  |  | NUMERIC (12,4) | Total sales |
| 20 | VARIANCE_PCT |  |  |  | NUMERIC (20,4) | Variance pct |
| 21 | UNIT_AND_VALUE_COUNT |  |  |  | NUMERIC (20,4) | Unit_And_Value count |
| 22 | CURRENCY_CODE |  |  |  | VARCHAR (3 ) | Currency code |

---

## Table: RMS_OI_STK_CNT_VALUE_VARIANCE

**Description:** This table holds the information about Stock Count unit and value variances for the Stock Count Value Variance Report.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SESSION_ID |  |  |  | NUMERIC (15) | Session id |
| 2 | CYCLE_COUNT |  |  |  | NUMERIC (8) | Stock count |
| 3 | CYCLE_COUNT_DESC |  |  |  | VARCHAR (250 ) | Stock count description |
| 4 | STOCKTAKE_TYPE |  |  |  | VARCHAR (1 ) | Type of stock count |
| 5 | STOCKTAKE_DATE |  |  |  | Date | Date on which Stock count was taken |
| 6 | DEPT |  |  |  | NUMERIC (4) | Department number |
| 7 | DEPT_NAME |  |  |  | VARCHAR (120 ) | Department name |
| 8 | CLASS |  |  |  | NUMERIC (4) | Class number |
| 9 | CLASS_NAME |  |  |  | VARCHAR (120 ) | Class name |
| 10 | SUBCLASS |  |  |  | NUMERIC (4) | Subclass number |
| 11 | SUBCLASS_NAME |  |  |  | VARCHAR (120 ) | Subclass name |
| 12 | LOC |  |  |  | NUMERIC (10) | Location |
| 13 | LOC_TYPE |  |  |  | VARCHAR (1 ) | Location Type |
| 14 | LOC_NAME |  |  |  | VARCHAR (150 ) | Location Name |
| 15 | TOTAL_UNIT_VARIANCE_PCT |  |  |  | NUMERIC (20,10) | Total unit variance percent. |
| 16 | OVER_UNIT_VARIANCE_PCT |  |  |  | NUMERIC (20,10) | Over unit variance percent. |
| 17 | SHORT_UNIT_VARIANCE_PCT |  |  |  | NUMERIC (20,10) | Short unit variance percent. |
| 18 | TOTAL_VARIANCE_PCT |  |  |  | NUMERIC (20,10) | Total variance percent. |
| 19 | SNAPSHOT_VALUE |  |  |  | NUMERIC (20,4) | Book value for the count location/merchandise hierarchy |
| 20 | ACTUAL_VALUE |  |  |  | NUMERIC (20,4) | Book value for the count location/merchandise hierarchy |

---

## Table: RMS_OI_STK_ORD_PEND_CLOSE

**Description:** This table holds the information for the Stock Order Pending Close Inventory Control Report.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SESSION_ID |  |  |  | NUMERIC (15) | The session_id for the data. |
| 2 | STOCK_ORDER_ID |  |  |  | NUMERIC (12) | The Allocation or Transfer ID. |
| 3 | STOCK_ORDER_TYPE |  |  |  | VARCHAR (1 ) | A for Allocation - T for Transfer. |
| 4 | FROM_LOC |  |  |  | NUMERIC (10) | The transfer from location. |
| 5 | FROM_LOC_NAME |  |  |  | VARCHAR (150 ) | The transfer from location name. |
| 6 | FROM_LOC_TYPE |  |  |  | VARCHAR (1 ) | The transfer from location type. |
| 7 | TO_LOC |  |  |  | NUMERIC (10) | The transfer to location. |
| 8 | TO_LOC_NAME |  |  |  | VARCHAR (150 ) | The transfer to location name. |
| 9 | TO_LOC_TYPE |  |  |  | VARCHAR (1 ) | The transfer to location type. |
| 10 | RECEIPT_DATE |  |  |  | Date | The receipt date |
| 11 | MULTI_UOM_IND |  |  |  | VARCHAR (1 ) | Indications if there are items with varrying UOMs on the transaction. |
| 12 | RECEIVED_PCT |  |  |  | NUMERIC (20,10) | The received percent. |
| 13 | RECONCILED_QTY |  |  |  | NUMERIC (12,4) | The reconciled quantity. |
| 14 | STOCK_ORDER_QTY |  |  |  | NUMERIC (12,4) | The stock order order quantity. |
| 15 | SHIPPED_QTY |  |  |  | NUMERIC (12,4) | The shipped quantity. |
| 16 | RECEIVED_QTY |  |  |  | NUMERIC (12,4) | The received quantity. |
| 17 | CANCELLED_QTY |  |  |  | NUMERIC (12,4) | The cancelled quantity. |
| 18 | FINISHER |  |  |  | NUMERIC (10) | The finisher. |
| 19 | FINISHER_NAME |  |  |  | VARCHAR (150 ) | The finisher name. |

---

## Table: RMS_OI_STOCK_COUNT_VARIANCE

**Description:** This table holds the information for the Stock Count Variance Inventory Control Report.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SESSION_ID |  |  |  | NUMERIC (15) | The session_id for the data. |
| 2 | CYCLE_COUNT |  |  |  | NUMERIC (8) | The stock count. |
| 3 | CYCLE_COUNT_DESC |  |  |  | VARCHAR (250 ) | The stock count description. |
| 4 | STOCKTAKE_TYPE |  |  |  | VARCHAR (1 ) | The type of stock count. |
| 5 | STOCKTAKE_DATE |  |  |  | Date | The date of the stock count. |
| 6 | LOC |  |  |  | NUMERIC (10) | The location. |
| 7 | LOC_TYPE |  |  |  | VARCHAR (1 ) | The location type. |
| 8 | LOC_NAME |  |  |  | VARCHAR (150 ) | The location name. |
| 9 | TOTAL_VARIANCE_PCT |  |  |  | NUMERIC (20,10) | The total variance percent. |
| 10 | OVER_VARIANCE_PCT |  |  |  | NUMERIC (20,10) | The over variance percent. |
| 11 | SHORT_VARIANCE_PCT |  |  |  | NUMERIC (20,10) | The short variance percent. |
| 12 | SNAPSHOT_ON_HAND_QTY |  |  |  | NUMERIC (20,4) | The snapshot stock on hand value. |
| 13 | SNAPSHOT_IN_TRANSIT_QTY |  |  |  | NUMERIC (20,4) | The snapshot in transit quanty. |
| 14 | PHYSICAL_COUNT_QTY |  |  |  | NUMERIC (20,4) | The physical count quanty. |

---

## Table: RMS_OI_SYSTEM_OPTIONS

**Description:** This table holds the configurations related to RMS dashboards.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | IA_ORD_ERR_REF_ITEM_IND |  |  | Y | VARCHAR (1) | Controls if ref item logic is included in the Order Errors Missing Item Data Tile |
| 2 | IA_ORD_ERR_FACTORY_IND |  |  | Y | VARCHAR (1) | Controls if factory logic is included in teh Order Errors Missing Order Data Tile. |
| 3 | IC_NEG_INV_WARN |  |  | Y | NUMERIC (12,4) | Controls the inventory level an item/loc needs to be under to be classified in the warning level in the inventory control negative retail report. |
| 4 | IC_NEG_INV_CRITIAL |  |  | Y | NUMERIC (12,4) | Controls the inventory level an item/loc needs to be under to be classified in the critical level in the inventory control negative retail report. |
| 5 | IC_OVERDUE_SHIP_DAYS |  |  | Y | NUMERIC (5) | Controls if an shipment will be classified as overdue in the overdue shipment reports. Controls level of overdue. |
| 6 | IC_OVERDUE_SHIP_COUNT |  |  | Y | NUMERIC (5) | Controls if the level of overdue in the overdue shipment reports. |
| 7 | IC_UNEXP_INV_INACTIVE_IND |  |  | Y | VARCHAR (1) | Controls if inactive item/locs are included in the inventory control unexpected inventory report. |
| 8 | IC_UNEXP_INV_DISCONTINUE_IND |  |  | Y | VARCHAR (1) | Controls if discontinued item/locs are included in the inventory control unexpected inventory report. |
| 9 | IC_UNEXP_INV_DELETE_IND |  |  | Y | VARCHAR (1) | Controls if deleted item/locs are included in the inventory control unexpected inventory report. |
| 10 | IC_UNEXP_INV_CRITIAL_COUNT |  |  | Y | NUMERIC (10) | Controls the number of item/locs when exceeded causes the unexpected inventory report to be considered critical in the inventory control unexpected inventory report. |
| 11 | IC_TSF_APPRV_PEND_CRITIAL_DAYS |  |  | Y | NUMERIC (10) | Controls the age of transfers to be included in the inventory control transfer pending approval report. |
| 12 | IC_TSF_APPRV_PEND_CRITIAL_CNT |  |  | Y | NUMERIC (10) | Controls the number of transfers when exceeded causes the inventory control transfer pending approval report to be considered critical. |
| 13 | IC_STKORD_CLS_PEND_CRIT_DAYS |  |  | Y | NUMERIC (10) | Controls the age of stock orders to be included in the inventory control stock order pending closure report. |
| 14 | IC_STKORD_CLS_PEND_CRIT_CNT |  |  | Y | NUMERIC (10) | Controls the number of transfers when exceeded causes the inventory control stock order pending closure report to be considered critical. |
| 15 | IC_MISS_STK_COUNT_CRIT_DAYS |  |  | Y | NUMERIC (10) | Controls the age of stock count to be included in the inventory control missing stock count report. |
| 16 | IC_MISS_STK_COUNT_CRIT_CNT |  |  | Y | NUMERIC (10) | Controls the number of stock counts when exceeded causes the inventory control missing stock count report to be considered critical. |
| 17 | IC_STK_COUNT_VAR_PCT |  |  | Y | NUMERIC (10) | Controls the variance percent for stock counts to be included in the inventory control stock count variance report. |
| 18 | IC_STK_COUNT_VAR_LOC_CNT |  |  | Y | NUMERIC (10) | Controls the number of locations on a stock count that exceed the IC_STK_COUNT_VAR_PCT that when exceeded causes the inventory control stock count variance report to be considered critical. |
| 19 | IC_UNEXP_INV_WARN_COUNT |  |  | Y | NUMERIC (10) | Controls the number of item/locs when exceeded causes the unexpected inventory report to be considered warning in the inventory control unexpected inventory report. |
| 20 | IA_STORE_GRADE_OR_AREA_IND |  |  | Y | VARCHAR (1) | Indicator to show store grade group or Area in inventory analyst dashboard prompt. |
| 21 | IA_ITEM_PARENT_FILTER |  |  | Y | VARCHAR (1) | Indicator to display all Item filters (Item/Item Parent/Parent Diff) in inventory analyst dashboard prompt. |
| 22 | IA_VARIANCE_RANGE_PCT_1 |  |  | Y | NUMERIC (12,4) | Configuring first % value for Inventory Variance to Forecast tile. |
| 23 | IA_VARIANCE_RANGE_PCT_2 |  |  | Y | NUMERIC (12,4) | Configuring second % value for Inventory Variance to Forecast tile. |
| 24 | IA_VARIANCE_RANGE_PCT_3 |  |  | Y | NUMERIC (12,4) | Configuring third % value for Inventory Variance to Forecast tile. |
| 25 | IA_VARIANCE_RANGE_PCT_4 |  |  | Y | NUMERIC (12,4) | Configuring fourth % value for Inventory Variance to Forecast tile. |
| 26 | IA_VARIANCE_TO_FORECAST_IND |  |  | Y | VARCHAR (1) | Indicates if the Inventory Variance to Forecast report in the Inventory Analyst dashboard is supported. If yes, the system will preserve 4 weeks of item weekly forecasted sales data before loading the next set of forecasting data. |
| 27 | B_PO_PENDING_APPROVAL_LEVEL |  |  |  | VARCHAR (1) | Determines whether orders in worksheet status will be shown in the report for approval |
| 28 | FA_WAC_VAR_TOLERANCE_PCT |  |  | Y | NUMERIC (12,4) | Defines the tolerance level outside of which if the variance between unit cost and average cost falls, the item/locations combinations will be shown in the financial analyst WAC variance report. |
| 29 | FA_WAC_VAR_ITEMLOC_CNT |  |  | Y | NUMERIC (10) | Controls the number of item/locations which when exceeded causes the financial analyst WAC variance report to be considered critical. |
| 30 | FA_CUM_MARKON_MIN_VAR_PCT |  |  | Y | NUMERIC (12,4) | Defines the tolerance level outside of which if the cumulative mark on % variance falls, the subclass/locations combinations will be shown in the financial analyst cumulative markon % variance report. |
| 31 | FA_CUM_MARKON_VAR_CRITICAL_CNT |  |  | Y | NUMERIC (10) | Controls the number of item/locations that exceed the FA_CUM_MARKON_MIN_VAR_PCT which when exceeded causes the |
| 32 | FA_STK_CNT_VALUE_VAR_CRIT_CNT |  |  | Y | NUMERIC (10) | Controls the number of locations on a stock count that exceed the FA_STK_CNT_VALUE_VAR_TOLERANCE_PCT that when exceeded causes the financial analyst Stock count value variance report to be considered critical. |
| 33 | FA_STK_CNT_VALUE_TOLERENCE_PCT |  |  | Y | NUMERIC (10) | Controls the variance percent for stock counts to be included in the financial analyst stock count value variance report. |
| 34 | FA_SHRINKAGE_VAR_TOLERANCE_PCT |  |  | Y | NUMERIC (12,4) | Defines the tolerance outside of which if the variance between budgeted shrinkage and actual shrinkage falls, that subclass/location will be shown in the financial analyst Shrinkage variance report |
| 35 | FA_SHRINKAGE_VAR_CRITICAL_CNT |  |  | Y | NUMERIC (10) | Controls the number of subclass/locations that exceed FA_SHRINKAGE_VAR_TOLERANCE_PCT which when exceeded causes the financial analyst Shrinkage report to be considered critical. |
| 36 | FA_LATE_POST_THRESHOLD_TRN_CNT |  |  | Y | NUMERIC (10) | Define the threshold value for the count of late transactions per location which when executed causes the financial analyst Late posted transactions report to be considered critial |
| 37 | FA_LATE_POST_THRESHOLD_LOC_CNT |  |  | Y | NUMERIC (10) | Defines the threshold value for the number of locations which when executed causes the financial analyst Late posted transactions report to be considered critial |
| 38 | FA_LATE_POST_ORG_HIER_LEVEL |  |  | Y | NUMERIC (10) | Defines the level of organization hierarchy that would be used for chart display in the financial analyst late posted transactions report |
| 39 | FA_WAC_VAR_MAXIMUM_PCT |  |  | Y | NUMERIC (12,4) | Defines the maximul level which exceeds the FA_WAC_VAR_TOLERANCE_PCT the item/locations combinations will be considered critical in the financial analyst WAC variance report. |
| 40 | FA_SHRINKAGE_VAR_MAX_PCT |  |  | Y | NUMERIC (12,4) | Defines the maximum variance which exceeds FA_SHRINKAGE_VAR_TOLERANCE_PCT, that subclass/location will be considered critical in the financial analyst Shrinkage variance report |
| 41 | DISPLAY_CONTEXTUAL_PAYLOAD |  |  | Y | VARCHAR (1) | ï¿½Yï¿½ - Display the payload parameters passed in the screen's contextual area. This is intended as a troubleshooting aid for customers building their own contextual reports, to view the parameters passed to the contextual area on specified user action in the screen. ï¿½Nï¿½ - Hide the payload parameters passed in the screen's contextual area. |
| 42 | DS_DAYS_AFTER_ITEM_CREATE |  |  | Y | NUMERIC (3) | Defines the number of days after item creation after which the Item will appear in INCOMPLETE ITEMS report. |
| 43 | DS_SHOW_INCOMP_ITEM_REF_ITEM |  |  | Y | VARCHAR (1) | Configured to show Reference Items in Incomplete Items Report. Valid values are 'R'equired or 'O'ptional or 'N'ot required. |
| 44 | DS_SHOW_INCOMP_ITEM_VAT |  |  | Y | VARCHAR (1) | Configured to show VAT in Incomplete Items Report. Valid values are 'R'equired or 'O'ptional or 'N'ot required. |
| 45 | DS_SHOW_INCOMP_ITEM_SPACK |  |  | Y | VARCHAR (1) | Configured to show Simple Pack in Incomplete Items Report. Valid values are 'R'equired or 'O'ptional or 'N'ot required. |
| 46 | DS_SHOW_INCOMP_ITEM_UDA |  |  | Y | VARCHAR (1) | Configured to show UDA in Incomplete Items Report. Valid values are 'R'equired or 'O'ptional or 'N'ot required. |
| 47 | DS_SHOW_INCOMP_ITEM_LOC |  |  | Y | VARCHAR (1) | Configured to show Locations in Incomplete Items Report. Valid values are 'R'equired or 'O'ptional or 'N'ot required. |
| 48 | DS_SHOW_INCOMP_ITEM_SEASONS |  |  | Y | VARCHAR (1) | Configured to show Seasons/Phases in Incomplete Items Report. Valid values are 'R'equired or 'O'ptional or 'N'ot required. |
| 49 | DS_SHOW_INCOMP_ITEM_REPL |  |  | Y | VARCHAR (1) | Configured to show Replenishment in Incomplete Items Report. Valid values are 'R'equired or 'O'ptional or 'N'ot required. |
| 50 | DS_SHOW_INCOMP_ITEM_SUBS_ITEM |  |  | Y | VARCHAR (1) | Configured to show Substitute Items in Incomplete Items Report. Valid values are 'R'equired or 'O'ptional or 'N'ot required. |
| 51 | DS_SHOW_INCOMP_ITEM_DIMEN |  |  | Y | VARCHAR (1) | Configured to show Dimensions in Incomplete Items Report. Valid values are 'R'equired or 'O'ptional or 'N'ot required. |
| 52 | DS_SHOW_INCOMP_ITEM_REL_ITEM |  |  | Y | VARCHAR (1) | Configured to show Related Items in Incomplete Items Report. Valid values are 'R'equired or 'O'ptional or 'N'ot required. |
| 53 | DS_SHOW_INCOMP_ITEM_TICKETS |  |  | Y | VARCHAR (1) | Configured to show Tickets in Incomplete Items Report. Valid values are 'R'equired or 'O'ptional or 'N'ot required. |
| 54 | DS_SHOW_INCOMP_ITEM_HTS |  |  | Y | VARCHAR (1) | Configured to show HTS in Incomplete Items Report. Valid values are 'R'equired or 'O'ptional or 'N'ot required. |
| 55 | DS_SHOW_INCOMP_ITEM_IMP_ATTR |  |  | Y | VARCHAR (1) | Configured to show Import Attributes in Incomplete Items Report. Valid values are 'R'equired or 'O'ptional or 'N'ot required. |
| 56 | DS_SHOW_INCOMP_ITEM_IMAGES |  |  | Y | VARCHAR (1) | Configured to show Images in Incomplete Items Report. Valid values are 'R'equired or 'O'ptional or 'N'ot required. |
| 57 | MI_MONTH_RANGE |  |  | Y | NUMERIC (10) | Defines a Month Range for Margin Impact Contextual BI Report |
| 58 | IC_UNEXP_INV_TOLERANCE_QTY |  |  | Y | NUMERIC (12,4) | Defines a tolerance level of unexpected inventory for an item location to be shown in the Inventory Control Unexpected Inventory Report,this will be used when it the configuration is not defined at the dept level on RMS_OI_DEPT_OPTIONS. |
| 59 | IC_NEG_INV_TOLERANCE_QTY |  |  | Y | NUMERIC (12,4) | Defines a tolerance level of negative inventory for an item location to be shown in the Inventory Control Negative Inventory Report,this will be used when it the configuration is not defined at the dept level on RMS_OI_DEPT_OPTIONS. |
| 60 | B_NUM_DAYS_NAD_EOW |  |  | Y | NUMERIC (5) | Number of days between NAD and EOW date to determine if order qualifies as an issue |
| 61 | B_NUM_DAYS_EAD_OTB |  |  | Y | NUMERIC (5) | Number of days between EAD and OTB date to determine if order qualifies as issue |
| 62 | B_NUM_DAYS_BOW_EAD |  |  | Y | NUMERIC (5) | Number of days between beginning of week and EAD to determine if order qualifies as issue |
| 63 | B_OTB_IND |  |  | Y | VARCHAR (1) | Indicator to turn on/off OTB report in a dashboard |

---

## Table: RMS_OI_TSF_PEND_APPROVE

**Description:** This table holds the information for the Submitted Transfers Inventory Control Report.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SESSION_ID |  |  |  | NUMERIC (15) | The session_id for the data. |
| 2 | TSF_NO |  |  |  | NUMERIC (12) | The transfer. |
| 3 | TSF_TYPE |  |  |  | VARCHAR (6 ) | The transfer type. |
| 4 | FROM_LOC |  |  |  | NUMERIC (10) | The transfer from location. |
| 5 | FROM_LOC_NAME |  |  |  | VARCHAR (150 ) | The transfer from location name. |
| 6 | FROM_LOC_TYPE |  |  |  | VARCHAR (1 ) | The transfer from location type. |
| 7 | TO_LOC |  |  |  | NUMERIC (10) | The transfer to location. |
| 8 | TO_LOC_NAME |  |  |  | VARCHAR (150 ) | The transfer to location name. |
| 9 | TO_LOC_TYPE |  |  |  | VARCHAR (1 ) | The transfer to location type. |
| 10 | DELIVERY_DATE |  |  |  | Date | The transfer delivery date. |
| 11 | CREATE_DATE |  |  |  | Date | The transfer create date. |
| 12 | TSF_COST |  |  |  | NUMERIC (20,4) | The transfer cost. |
| 13 | TSF_RETAIL |  |  |  | NUMERIC (20,4) | The transfer retail. |
| 14 | CURRENCY_CODE |  |  |  | VARCHAR (3 ) | The currency code. |
| 15 | FINISHER |  |  |  | NUMERIC (10) | The finisher. |
| 16 | FINISHER_NAME |  |  |  | VARCHAR (150 ) | The finisher name. |
| 17 | INTERCOMPANY_IND |  |  |  | VARCHAR (1 ) | Indications if the transfer is inter-company. |

---

## Table: RMS_OI_UNEXPECTED_INV

**Description:** This table holds the information for the Unexpected Inventory Inventory Control Report.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SESSION_ID |  |  |  | NUMERIC (15) | The session_id for the data. |
| 2 | ITEM |  |  |  | VARCHAR (25 ) | The item. |
| 3 | ITEM_DESC |  |  |  | VARCHAR (250 ) | The item description. |
| 4 | ITEM_PARENT |  |  |  | VARCHAR (25 ) | The parent item. |
| 5 | ITEM_PARENT_DESC |  |  |  | VARCHAR (250 ) | The parent item description. |
| 6 | LOC |  |  |  | NUMERIC (10) | The location. |
| 7 | LOC_NAME |  |  |  | VARCHAR (150 ) | The location name. |
| 8 | LOC_TYPE |  |  |  | VARCHAR (150 ) | The location type. |
| 9 | STATUS |  |  |  | VARCHAR (1 ) | The item/location status. |
| 10 | RANGED_IND |  |  |  | VARCHAR (1 ) | The item/location ranged indicator. |
| 11 | STOCK_ON_HAND |  |  |  | NUMERIC (12,4) | The stock on hand quantity. |
| 12 | RESERVED_QTY |  |  |  | NUMERIC (12,4) | The reserved quantity. |
| 13 | NON_SELLABLE_QTY |  |  |  | NUMERIC (12,4) | The non sellable quantity. |
| 14 | UNEXPECTED_QTY |  |  |  | NUMERIC (12,4) | The unexpected quantity. |
| 15 | DEPT |  |  |  | NUMERIC (4) | Department number |
| 16 | DEPT_NAME |  |  |  | VARCHAR (120 ) | Department name |
| 17 | CLASS |  |  |  | NUMERIC (4) | Class number |
| 18 | CLASS_NAME |  |  |  | VARCHAR (120 ) | Class name |
| 19 | SUBCLASS |  |  |  | NUMERIC (4) | Subclass number |
| 20 | SUBCLASS_NAME |  |  |  | VARCHAR (120 ) | Subclass name |

---

## Table: RMS_OI_UNEXPECTED_INV_GTT

**Description:** This temporary helper table holds the information for the Unexpected Inventory Inventory Control Report.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SESSION_ID |  |  |  | NUMERIC (15) | The session_id for the data. |
| 2 | ITEM |  |  |  | VARCHAR (25 ) | The item. |
| 3 | ITEM_DESC |  |  |  | VARCHAR (250 ) | The item description. |
| 4 | ITEM_PARENT |  |  |  | VARCHAR (25 ) | The parent item. |
| 5 | ITEM_PARENT_DESC |  |  |  | VARCHAR (250 ) | The parent item description. |
| 6 | LOC |  |  |  | NUMERIC (10) | The location. |
| 7 | LOC_NAME |  |  |  | VARCHAR (150 ) | The location name. |
| 8 | LOC_TYPE |  |  |  | VARCHAR (150 ) | The location type. |
| 9 | STATUS |  |  |  | VARCHAR (1 ) | The item/location status. |
| 10 | RANGED_IND |  |  |  | VARCHAR (1 ) | The item/location ranged indicator. |
| 11 | STOCK_ON_HAND |  |  |  | NUMERIC (12,4) | The stock on hand quantity. |
| 12 | RESERVED_QTY |  |  |  | NUMERIC (12,4) | The reserved quantity. |
| 13 | NON_SELLABLE_QTY |  |  |  | NUMERIC (12,4) | The non sellable quantity. |
| 14 | UNEXPECTED_QTY |  |  |  | NUMERIC (12,4) | The unexpected quantity. |

---

## Table: RMS_OI_WAC_VARIANCE

**Description:** This table holds the information about item/locations having a variance between the unit cost and weighted average cost (WAC) that falls outside of a defined tolerance for the WAC Variance Report.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SESSION_ID |  |  |  | NUMERIC (15) | Session id |
| 2 | ITEM |  |  |  | VARCHAR (25) | Transactional Item ID |
| 3 | ITEM_DESC |  |  |  | VARCHAR (250) | Translated description of the ITEM. |
| 4 | LOC |  |  |  | NUMERIC (10) | Location |
| 5 | LOC_NAME |  |  |  | VARCHAR (150) | Location Name |
| 6 | UNIT_ELC |  |  |  | NUMERIC (20,4) | Unit Cost for the item/location |
| 7 | AVG_COST |  |  |  | NUMERIC (20,4) | Average Cost |
| 8 | VARIANCE_PCT |  |  |  | NUMERIC (20,10) | Variance Percentage |
| 9 | INVENTORY |  |  |  | NUMERIC (20,4) | Stock on hand * cost |
| 10 | CURRENCY_CODE |  |  |  | VARCHAR (3) | Currency of the location |
| 11 | DEPT |  |  |  | NUMERIC (4) | Number identifying the department to which the item is attached. The items department will be the same as that of its parent (and, by transitivity, to that of its grandparent). Valid values for this field are located on the deps table. |
| 12 | CLASS |  |  |  | NUMERIC (4) | Number identifying the class to which the item is attached. The items class will be the same as that of its parent (and, by transitivity, to that of its grandparent). Valid values for this field are located on the class table. |
| 13 | SUBCLASS |  |  |  | NUMERIC (4) | Number identifying the subclass to which the item is attached. The items subclass will be the same as that of its parent (and, by transitivity, to that of its grandparent). Valid values for this field are located on the subclass table. |
| 14 | SUBCLASS_NAME |  |  |  | VARCHAR (120 ) | Subclass name |
| 15 | SUPPLIER |  |  |  | NUMERIC (10) | Primary supplier ID |
| 16 | SUPPLIER_NAME |  |  |  | VARCHAR (240 ) | Primary supplier name |
| 17 | UNIT_RETAIL |  |  |  | NUMERIC (20,4) | Contains the unit retail price in the standard unit of measure for the item/location combination. This field is stored in the local currency. |
| 18 | CHAIN_AVERGE |  |  |  | NUMERIC (20,4) | Chain WAC |
| 19 | WH |  |  |  | NUMERIC (10) | Source or defulat Warehouse ID |
| 20 | WH_NAME |  |  |  | VARCHAR (150 ) | Warehouse name |
| 21 | WH_AVERAGE_COST |  |  |  | NUMERIC (20,4) | Warehouse WAC |
| 22 | UNIT_ELC_PRIMARY |  |  |  | NUMERIC (20,4) | ELC in retailer primary currancy |
| 23 | AVERAGE_COST_PRIMARY |  |  |  | NUMERIC (20,4) | WAC in retailer primary currancy |
| 24 | INVENTORY_PRIMARY |  |  |  | NUMERIC (20,4) | Inventory value in retailer primary currancy |
| 25 | ITEM_IMAGE |  |  |  | VARCHAR (255 ) |  |
| 26 | NUM_LOCS_WAC_ISSUE_ITEM |  |  |  | NUMERIC (10) | Number of locations with WAC variance issue for this item |
| 27 | NUM_ITEMS_WAC_ISSUE_LOC |  |  |  | NUMERIC (10) | Number of items with WAC variance issue for this location |
| 28 | LOC_TYPE |  |  |  | VARCHAR (1 ) | Location type |

---

## Table: RMS_PLSQL_BATCH_CONFIG

**Description:** This table contains the configuration settings for RMS PLSQL batch programs.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROGRAM_NAME |  |  | Y | VARCHAR (30) | This is the name of the core package used by the salesprocess.ksh program. Sample entry for this field - "CORESVC_SALES_UPLOAD_SQL" - used by salesprocess.ksh. |
| 2 | MAX_CHUNK_SIZE |  |  | Y | NUMERIC (10) | This column is similar to the RESTART_CONTROL.COMMIT_MAX_CTR column. Analysis of hardware resources and other factors (i.e. data volume, concurrency with other processes) should be considered to come up with an optimal value for this parameter. The default setting on install is 1000 rows. |
| 3 | MAX_CONCURRENT_THREADS |  |  | Y | NUMERIC (6) | This is the setting required to enable the threading mechanism of the program. The default setting on install is 1 thread. Together with the MAX_CHUNK_SIZE column, analysis should be made to come up with the optimal value for this as this is governed by the allowable number of processes to run on the system. |
| 4 | RETRY_LOCK_ATTEMPTS |  |  | Y | NUMERIC (3) | The number of times the process will attempt to get the lock for the table to be used for succeeding update or delete. |
| 5 | RETRY_WAIT_TIME |  |  | Y | NUMERIC (3,2) | Determines the length of time that the process will wait before it attempts to get the lock of a table. |

---

## Table: RMS_SIZE_PROFILE

**Description:** The table stores the ratios in which the distribution has to take place for the various differentiator values. When ALLOCATIONS is installed the table data is copied from the table alc_size_profile.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SIZE_PROFILE_ID | P |  | Y | NUMERIC (20) | Primary key field, contains the table unique identifier. |
| 2 | STORE |  |  | Y | NUMERIC (20) | Store identifier |
| 3 | DEPT |  |  |  | NUMERIC (4) | Department identifier |
| 4 | CLASS |  |  |  | NUMERIC (4) | Class identifier |
| 5 | SUBCLASS |  |  |  | NUMERIC (4) | Subclass identifier |
| 6 | ITEM_PARENT |  |  |  | VARCHAR (25) | Parent item number |
| 7 | DIFF_1 |  |  |  | VARCHAR (10) | First differentiator value |
| 8 | DIFF_2 |  |  |  | VARCHAR (10) | Second differentiator value |
| 9 | DIFF_3 |  |  |  | VARCHAR (10) | Third differentiator value |
| 10 | DIFF_4 |  |  |  | VARCHAR (10) | Fourth differentiator value |
| 11 | RATIO |  |  | Y | NUMERIC (12,4) | Quantity that is distributed to the profile |

---

## Table: SA_ACH_INFO

**Description:** This table contains the sales audit ACH identification information

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SENDER_ID |  |  | Y | VARCHAR (10) | Contains the ID used by the originator to identify itself to the Originating Financial Depository Institution (ODFI). |
| 2 | COMPANY_ID |  |  | Y | VARCHAR (10) | Contains the alphanumeric code to identify the company. The first character may be the ANSI one-digit Identification Code Designators (ICD). For example, 1 IRS Employer ID Number or 9 User Assigned Number. |
| 3 | CONSOLIDATING_BANK_NAME |  |  | Y | VARCHAR (250) | Contains the name of the Originating Financial Depository Institution (ODFI). |
| 4 | CONSOLIDATING_ROUTING_NO |  |  | Y | NUMERIC (9) | Contains the routing number of the consolidating bank. |
| 5 | CONSOLIDATING_ACCT_NO |  |  | Y | VARCHAR (17) | Contains the account number of the consolidating bank. |

---

## Table: SA_COMMENTS

**Description:** This table will be used to access multiple user comments based on the type of comment.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | COMMENT_SEQ_NO | P |  | Y | NUMERIC (20) | This field contains a unique sequence number for each record in the table. |
| 2 | COMMENT_TYPE |  |  | Y | VARCHAR (6) | This field contains the type of comment in the record. Valid values are in code_type SACM. |
| 3 | COMMENT_KEY |  |  | Y | NUMERIC (20) | This field contains the sequence number for the appropriate record, based on the type of comment. |
| 4 | COMMENTS |  |  | Y | VARCHAR (2000) | This field contains the text of the comment. |
| 5 | USER_ID |  |  | Y | VARCHAR (30) | This field contains the user id of the person who entered the comment. |
| 6 | DATETIME |  |  | Y | Date | This field contains the date and time when the comment was entered. |

---

## Table: SA_CORP_EMP

**Description:** This table has been made redundant and replaced with SA_USER_LOC_TRAITS table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | EMP_ID | P | F | Y | VARCHAR (10) | This field contains a unique, system generated, employee identification number. |
| 2 | LOC_TRAIT | P | F | Y | NUMERIC (4) | This field contains the location trait the auditor is assigned to work. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SA_CORP_EMP|PK||||EMP_ID|ASC|
||||||LOC_TRAIT|ASC|
|SA_CORP_EMP_I1|||||LOC_TRAIT|ASC|

---

## Table: SA_EMPLOYEE

**Description:** This table has been made redundant and replaced with SA_USER table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | EMP_ID | P |  | Y | VARCHAR (10) | This field will contain a unique, system generated, employee identification number. |
| 2 | EMP_TYPE |  |  | Y | VARCHAR (6) | Contains whether the employee is a store employee or a headquarters employee. Valid Values are defined on the codes tables with a code type of EMPT. |
| 3 | CASHIER_IND |  |  | Y | VARCHAR (1) | Indicates whether or not the employee is a cashier. |
| 4 | SALESPERSON_IND |  |  | Y | VARCHAR (1) | Indicates whether or not a Store Employee is a Salesperson. |
| 5 | NAME |  |  | Y | VARCHAR (120) | This field will contain the employees name. |
| 6 | PHONE |  |  |  | VARCHAR (20) | This field will contain the employees work phone number. |
| 7 | USER_ID |  |  | Y | VARCHAR (30) | This field contains the oracle user identification code that the employee uses to log into the Oracle database. |
| 8 | EMAIL |  |  |  | VARCHAR (100) | This field will contain the employees e-mail address. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SA_EMPLOYEE|PK||||EMP_ID|ASC|
|SA_EMPLOYEE_I1|||||USER_ID|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_SA_EMPLOYEE_CASHIER_IND|cashier_ind in ('Y','N')<br>|
||CHK_SA_EMPLOYEE_EMP_TYPE|emp_type in ('S','H')<br>|






|Type|Column / Constraint Name|Details|
|---|---|---|
||CHK_SA_EMPLOYEE_SALESPERSON|salesperson_ind in ('Y','N')<br>|
|Column Level|EMP_TYPE||
||CASHIER_IND||
||SALESPERSON_IND||

---

## Table: SA_ESCHEAT_OPTIONS

**Description:** This table is used to define the individual state or countrys escheat rules.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | COUNTRY |  | F | Y | VARCHAR (3) | The country funds will escheat to. |
| 2 | STATE |  |  |  | VARCHAR (3) | The state funds will escheat to. |
| 3 | ESCHEAT_OPT_SEQ_NO | P |  | Y | NUMERIC (20) | The sequence number used to uniquely identify the country/state combination. |
| 4 | PARTNER_TYPE |  | F | Y | VARCHAR (6) | The type of partner. This column should have a foreign key to the PARTNER.PARTNER_TYPE table/column. |
| 5 | PARTNER_ID |  | F | Y | VARCHAR (10) | The id of the partner for this country/state. This column should have a foreign key to the PARTNER.PARTNER_ID table/column. |
| 6 | STORE_ESCHEAT_IND |  |  | Y | VARCHAR (1) | This column indicates whether or not the partner escheats monies to the state of the store where the voucher was issued during escheatment. |
| 7 | ISS_CUST_ESCHEAT_IND |  |  | Y | VARCHAR (1) | This column indicates whether or not the partner escheats monies to the state of the customer the document was issued to during escheatment. |
| 8 | RECIPIENT_ESCHEAT_IND |  |  | Y | VARCHAR (1) | This column indicates whether or not the partner escheats monies to the state of the recipient of the voucher during escheatment. |
| 9 | HQ_ESCHEAT_IND |  |  | Y | VARCHAR (1) | This column indicates whether or not the partner escheats monies to the state of the headquarters of the store where the voucher was issued during escheatment. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SA_ESCHEAT_OPTIONS|PK||||ESCHEAT_OPT_SEQ_NO|ASC|
|SA_ESCHEAT_OPTIONS_I1|UN||||COUNTRY|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
||||||STATE|ASC|
|SA_ESCHEAT_OPTIONS_I2|||||PARTNER_TYPE|ASC|
||||||PARTNER_ID|ASC|
|SA_ESCHEAT_OPTIONS_I3|||||STATE|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_SA_ESCHEAT_OPT_HQ_ESCHEAT|hq_escheat_ind in ('Y','N')<br>|
||CHK_SA_ESCHEAT_OPT_ISS_CUST_ES|iss_cust_escheat_ind in ('Y','N')<br>|
||CHK_SA_ESCHEAT_OPT_RECIPIENT|recipient_escheat_ind in ('Y','N')<br>|
||CHK_SA_ESCHEAT_OPT_STORE_ESCHE|store_escheat_ind in ('Y','N')<br>|
|Column Level|STORE_ESCHEAT_IND||
||ISS_CUST_ESCHEAT_IND||
||RECIPIENT_ESCHEAT_IND||
||HQ_ESCHEAT_IND||

---

## Table: SA_ESCHEAT_TOTAL

**Description:** This table stores the total amount of vouchers escheated to a partner for a store-day.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ESCHEAT_SEQ_NO | P |  | Y | NUMERIC (20) | The unique sequence number of the escheated value for a partner for a store-day. |
| 2 | STORE_DAY_SEQ_NO |  | F | Y | NUMERIC (20) | The unique sequence number for a store-day. This column should have a foreign key to SA_STORE_DAY.STORE_DAY_SEQ_NO. |
| 3 | PARTNER_TYPE |  | F | Y | VARCHAR (6) | The type of partner. This column should have a foreign key to the PARTNER.PARTNER_TYPE table. |
| 4 | PARTNER_ID |  | F | Y | VARCHAR (10) | The id of the partner. This column should have a foreign key to the PARTNER.PARTNER_ID table. |
| 5 | ESCHEAT_AMT |  |  | Y | NUMERIC (20,4) | The amount to be escheated. |
| 6 | ESCHEAT_TYPE |  |  | Y | VARCHAR (6) | Indicates if the amount is to be used to escheat the value to the state/country (E) or if it is adjusted income for the store (I). |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SA_ESCHEAT_TOTAL|PK||||ESCHEAT_SEQ_NO|ASC|
|SA_ESCHEAT_TOTAL_I2|||||STORE_DAY_SEQ_NO|ASC|
|SA_ESCHEAT_TOTAL_I1|||||PARTNER_TYPE|ASC|
||||||PARTNER_ID|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_SA_ESCHEAT_TOTAL_ESCHEAT_T|escheat_type in ('E','N')<br>|
|Column Level|ESCHEAT_TYPE||

---

## Table: SA_ESCHEAT_VOUCHER

**Description:** This table stores which vouchers were included in an escheatment batch for a specific store-day.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ESCHEAT_SEQ_NO | P | F | Y | NUMERIC (20) | The unique sequence number of the escheated value for a partner for a store-day. |
| 2 | VOUCHER_SEQ_NO | P | F | Y | NUMERIC (20) | The unique sequence number of the voucher. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SA_ESCHEAT_VOUCHER|PK||||ESCHEAT_SEQ_NO|ASC|
||||||VOUCHER_SEQ_NO|ASC|
|SA_ESCHEAT_VOUCHER_I1|||||VOUCHER_SEQ_NO|ASC|

---

## Table: SA_EXPORTED

**Description:** This table stores details about transactions and totals that have been exported to external systems.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | STORE | P | F | Y | NUMERIC (10) | Store number to be used for table partitioning. |
| 2 | DAY | P | F | Y | NUMERIC (3) | Day number to be used for table partitioning. This is derived from the sa_store_day.business_date column by calling the function SA_DATE_HASH. |
| 3 | EXPORT_SEQ_NO | P |  | Y | NUMERIC (20) | A unique sequential number defining the primary key on this table. |
| 4 | STORE_DAY_SEQ_NO |  |  | Y | NUMERIC (20) | A unique sequential number that represents a combination of a store and a date. |
| 5 | TRAN_SEQ_NO |  | F | Y | NUMERIC (20) | The unique identifier associated with a transaction. Since the records on this table could correspond to either transactions or totals, this field and the total_value_id field are mutually exclusive. |
| 6 | TOTAL_SEQ_NO |  |  |  | NUMERIC (20) | The unique identifier associated with a summarized total. |
| 7 | ACCT_PERIOD |  |  |  | VARCHAR (120) | Contains the accounting period that the data exported will be posted to. |
| 8 | SYSTEM_CODE |  |  | Y | VARCHAR (6) | The system this data was exported to. Valid values are defined on the code tables with a code type of SYST. |
| 9 | EXP_DATETIME |  |  | Y | Date | The date and time this total or transaction was written to the output file/staging table for this export type. |
| 10 | STATUS |  |  | Y | VARCHAR (1) | Indicates the status of the transaction that was exported. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SA_EXPORTED|PK||||EXPORT_SEQ_NO|ASC|
||||||STORE|ASC|
||||||DAY|ASC|
|SA_EXPORTED_I3|||||TRAN_SEQ_NO|ASC|
||||||STORE|ASC|
||||||DAY|ASC|
||||||STORE_DAY_SEQ_NO|ASC|
|SA_EXPORTED_I2|||||TOTAL_SEQ_NO|ASC|
|SA_EXPORTED_I1|UN||||TRAN_SEQ_NO|ASC|
||||||TOTAL_SEQ_NO|ASC|
||||||SYSTEM_CODE|ASC|
||||||STORE|ASC|
||||||DAY|ASC|
|PK_SA_EXPORTED|UN||||EXPORT_SEQ_NO|ASC|
||||||STORE|ASC|
||||||DAY|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_SA_EXPORTED_TOTAL_V_TRAN|(total_seq_no IS NOT NULL AND tran_seq_no IS NULL) OR (total_seq_no IS NULL AND tran_seq_no IS NOT NULL)<br>|
|Column Level|STATUS||

---

## Table: SA_EXPORTED_REV

**Description:** This table stores details of all revisions of transactions and totals that have been exported to external systems.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | STORE | P | F | Y | NUMERIC (10) | Store number to be used for table partitioning. |
| 2 | DAY | P | F | Y | NUMERIC (3) | Day number to be used for table partitioning. This is derived from the sa_store_day.business_date column by calling the function SA_DATE_HASH. |
| 3 | EXPORT_SEQ_NO | P |  | Y | NUMERIC (20) | A unique sequential number defining the primary key on this table. |
| 4 | REV_NO | P | F | Y | NUMERIC (3) | The revision number of the total or transaction exported. |
| 5 | STORE_DAY_SEQ_NO |  |  | Y | NUMERIC (20) | A unique sequential number that represents a combination of a store and a date. |
| 6 | TRAN_SEQ_NO |  | F | Y | NUMERIC (20) | The unique identifier associated with a transaction. Since the records on this table could correspond to either transactions or totals, this field and the total_value_id field are mutually exclusive. |
| 7 | TOTAL_SEQ_NO |  | F | Y | NUMERIC (20) | The unique identifier associated with a summarized total. |
| 8 | ACCT_PERIOD |  |  |  | VARCHAR (120) | Contains the accounting period that the data exported will be posted to. |
| 9 | SYSTEM_CODE |  |  | Y | VARCHAR (6) | The system this data was exported to. Valid values are defined on the code tables with a code type of SYST. |
| 10 | EXP_DATETIME |  |  | Y | Date | The date and time this total or transaction was written to the output file/staging table for this export type. |
| 11 | STATUS |  |  | Y | VARCHAR (1) | Indicates the status of the transaction that was exported. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SA_EXPORTED_REV|PK||||EXPORT_SEQ_NO|ASC|
||||||REV_NO|ASC|
||||||STORE|ASC|
||||||DAY|ASC|
|SA_EXPORTED_REV_I3|||||TOTAL_SEQ_NO|ASC|
||||||STORE|ASC|
||||||DAY|ASC|
|SA_EXPORTED_REV_I1|UN||||REV_NO|ASC|
||||||TRAN_SEQ_NO|ASC|
||||||TOTAL_SEQ_NO|ASC|
||||||SYSTEM_CODE|ASC|
||||||STORE|ASC|
||||||DAY|ASC|
|SA_EXPORTED_REV_I4|||||STORE_DAY_SEQ_NO|ASC|
||||||SYSTEM_CODE|ASC|
||||||STORE|ASC|
||||||DAY|ASC|
|SA_EXPORTED_REV_I2|||||TRAN_SEQ_NO|ASC|
||||||REV_NO|ASC|
||||||STORE|ASC|






|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
||||||DAY|ASC|
|SXR_SOL_FK|||||TOTAL_SEQ_NO|ASC|
||||||STORE|ASC|
||||||DAY|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_SA_EXPORTED_REV_TOTAL_V_TR|(total_seq_no IS NOT NULL AND tran_seq_no IS NULL) OR (total_seq_no IS NULL AND tran_seq_no IS NOT NULL)<br>|
|Column Level|STATUS||

---

## Table: SA_EXPORT_LOG

**Description:** This table holds a log of all exports from the Sales Audit system.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | STORE | P |  | Y | NUMERIC (10) | Store number to be used for table partitioning. |
| 2 | DAY | P |  | Y | NUMERIC (3) | Day number to be used for table partitioning. This is derived from the sa_store_day.business_date column by calling the function SA_DATE_HASH. |
| 3 | STORE_DAY_SEQ_NO | P |  | Y | NUMERIC (20) | This field will hold the unique identifier for a store/day combination. |
| 4 | SYSTEM_CODE | P |  | Y | VARCHAR (6) | This field will hold the name of the external system to which the file is being sent. Decodes of the valid values are stored with the code type SYSE. |
| 5 | SEQ_NO | P |  | Y | NUMERIC (4) | As multiple files of each type can be exported each day, this field will hold the a unique sequence number for each file exported of each type. |
| 6 | STATUS |  |  | Y | VARCHAR (1) | This field will hold the status of the export. Valid values R - ready for export, P - processed, E - exported. Decodes of the valid values are stored with the code type SAES. |
| 7 | DATETIME |  |  |  | Date | This field will hold the date and time that the file was created. This information will be taken from the header of the file. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SA_EXPORT_LOG|PK||||STORE_DAY_SEQ_NO|ASC|
||||||SYSTEM_CODE|ASC|
||||||SEQ_NO|ASC|
||||||STORE|ASC|
||||||DAY|ASC|
|PK_SA_EXPORT_LOG|UN||||STORE_DAY_SEQ_NO|ASC|
||||||SYSTEM_CODE|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
||||||SEQ_NO|ASC|
||||||STORE|ASC|
||||||DAY|ASC|

---

## Table: SA_EXPORT_OPTIONS

**Description:** This table provides additional detail about systems receiving data from ReSA.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SYSTEM_CODE | P |  | Y | VARCHAR (6) | Defines the system that data is exported to. |
| 2 | MULTIPLE_EXP_IND |  |  | Y | VARCHAR (1) | Defines whether or not multiple exports are allowed to this system. |
| 3 | EXP_DETAIL_IND |  |  |  | VARCHAR (1) | Defines if details need to be exported in addition to totals, primarily used for exports to a Reconciliation system. |

---

## Table: SA_FIF_GL_CROSS_REF

**Description:** This table will be used to associate an Oracle account code with the different types of totals that can be calculated by Sales Audit. Different account codes can be associated with the same total type at different locations and different levels of rollup.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | STORE | P |  | Y | NUMERIC (10) | Location that account code is valid for. |
| 2 | TOTAL_ID | P |  | Y | VARCHAR (10) | Which type of total the account is valid for. |
| 3 | ROLLUP_LEVEL_1 | P |  | Y | VARCHAR (30) | First rollup level of total. |
| 4 | ROLLUP_LEVEL_2 | P |  | Y | VARCHAR (30) | Second rollup level of total. |
| 5 | ROLLUP_LEVEL_3 | P |  | Y | VARCHAR (30) | Third rollup level of total. |
| 6 | SET_OF_BOOKS_ID | P | F | Y | NUMERIC (15) | Oracle set of books for Oracle Retail transactions. |
| 7 | DR_CCID |  |  |  | NUMERIC (15) | Debit CCID (Oracle Financials account code). |
| 8 | DR_SEQUENCE1 |  |  |  | VARCHAR (25) | Oracle debit account mapping field1, maps to Oracle side GL_Code _combinations table |
| 9 | DR_SEQUENCE2 |  |  |  | VARCHAR (25) | Oracle debit account mapping field2, maps to Oracle side GL_Code _combinations table |
| 10 | DR_SEQUENCE3 |  |  |  | VARCHAR (25) | Oracle debit account mapping field3, maps to Oracle side GL_Code _combinations table |
| 11 | DR_SEQUENCE4 |  |  |  | VARCHAR (25) | Oracle debit account mapping field4, maps to Oracle side GL_Code _combinations table |
| 12 | DR_SEQUENCE5 |  |  |  | VARCHAR (25) | Oracle debit account mapping field5, maps to Oracle side GL_Code _combinations table |
| 13 | DR_SEQUENCE6 |  |  |  | VARCHAR (25) | Oracle debit account mapping field6, maps to Oracle side GL_Code _combinations table |
| 14 | DR_SEQUENCE7 |  |  |  | VARCHAR (25) | Oracle debit account mapping field7, maps to Oracle side GL_Code _combinations table |
| 15 | DR_SEQUENCE8 |  |  |  | VARCHAR (25) | Oracle debit account mapping field8, maps to Oracle side GL_Code _combinations table |
| 16 | DR_SEQUENCE9 |  |  |  | VARCHAR (25) | Oracle debit account mapping field9, maps to Oracle side GL_Code _combinations table |
| 17 | DR_SEQUENCE10 |  |  |  | VARCHAR (25) | Oracle debit account mapping field10, maps to Oracle side GL_Code _combinations table |
| 18 | CR_CCID |  |  |  | NUMERIC (15) | Credit CCID (Oracle Financials account code). |
| 19 | CR_SEQUENCE1 |  |  |  | VARCHAR (25) | Oracle credit account mapping field1, maps to Oracle side GL_Code _combinations table |
| 20 | CR_SEQUENCE2 |  |  |  | VARCHAR (25) | Oracle credit account mapping field2, maps to Oracle side GL_Code _combinations table |
| 21 | CR_SEQUENCE3 |  |  |  | VARCHAR (25) | Oracle credit account mapping field3, maps to Oracle side GL_Code _combinations table |
| 22 | CR_SEQUENCE4 |  |  |  | VARCHAR (25) | Oracle credit account mapping field4, maps to Oracle side GL_Code _combinations table |
| 23 | CR_SEQUENCE5 |  |  |  | VARCHAR (25) | Oracle credit account mapping field5, maps to Oracle side GL_Code _combinations table |
| 24 | CR_SEQUENCE6 |  |  |  | VARCHAR (25) | Oracle credit account mapping field6, maps to Oracle side GL_Code _combinations table |
| 25 | CR_SEQUENCE7 |  |  |  | VARCHAR (25) | Oracle credit account mapping field7, maps to Oracle side GL_Code _combinations table |
| 26 | CR_SEQUENCE8 |  |  |  | VARCHAR (25) | Oracle credit account mapping field8, maps to Oracle side GL_Code _combinations table |
| 27 | CR_SEQUENCE9 |  |  |  | VARCHAR (25) | Oracle credit account mapping field9, maps to Oracle side GL_Code _combinations table |
| 28 | CR_SEQUENCE10 |  |  |  | VARCHAR (25) | Oracle credit account mapping field10, maps to Oracle side GL_Code _combinations table |
| 29 | DR_SEQUENCE11 |  |  |  | VARCHAR (25) | debit account mapping field11 |
| 30 | DR_SEQUENCE12 |  |  |  | VARCHAR (25) | debit account mapping field12 |
| 31 | DR_SEQUENCE13 |  |  |  | VARCHAR (25) | debit account mapping field13 |
| 32 | DR_SEQUENCE14 |  |  |  | VARCHAR (25) | debit account mapping field14 |
| 33 | DR_SEQUENCE15 |  |  |  | VARCHAR (25) | debit account mapping field15 |
| 34 | DR_SEQUENCE16 |  |  |  | VARCHAR (25) | debit account mapping field16 |
| 35 | DR_SEQUENCE17 |  |  |  | VARCHAR (25) | debit account mapping field17 |
| 36 | DR_SEQUENCE18 |  |  |  | VARCHAR (25) | debit account mapping field18 |
| 37 | DR_SEQUENCE19 |  |  |  | VARCHAR (25) | debit account mapping field19 |
| 38 | DR_SEQUENCE20 |  |  |  | VARCHAR (25) | debit account mapping field20 |
| 39 | CR_SEQUENCE11 |  |  |  | VARCHAR (25) | credit account mapping field11 |
| 40 | CR_SEQUENCE12 |  |  |  | VARCHAR (25) | credit account mapping field12 |
| 41 | CR_SEQUENCE13 |  |  |  | VARCHAR (25) | credit account mapping field13 |
| 42 | CR_SEQUENCE14 |  |  |  | VARCHAR (25) | credit account mapping field14 |
| 43 | CR_SEQUENCE15 |  |  |  | VARCHAR (25) | credit account mapping field15 |
| 44 | CR_SEQUENCE16 |  |  |  | VARCHAR (25) | credit account mapping field16 |
| 45 | CR_SEQUENCE17 |  |  |  | VARCHAR (25) | credit account mapping field17 |
| 46 | CR_SEQUENCE18 |  |  |  | VARCHAR (25) | credit account mapping field18 |
| 47 | CR_SEQUENCE19 |  |  |  | VARCHAR (25) | credit account mapping field19 |
| 48 | CR_SEQUENCE20 |  |  |  | VARCHAR (25) | credit account mapping field20 |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SA_FIF_GL_CROSS_REF|PK||||STORE|ASC|
||||||TOTAL_ID|ASC|
||||||ROLLUP_LEVEL_1|ASC|
||||||ROLLUP_LEVEL_2|ASC|
||||||ROLLUP_LEVEL_3|ASC|
||||||SET_OF_BOOKS_ID|ASC|

---

## Table: SA_FLASH_SALES

**Description:** This table holds the daily net sales totals by store for flash sales reporting purposes. The data may be kept on this table for two years or more.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | BUSINESS_DATE | P |  | Y | Date | Contains the date of the Business Day when the sales occurred. |
| 2 | STORE | P |  | Y | NUMERIC (10) | Store number associated with the total. |
| 3 | WEATHER |  |  |  | VARCHAR (6) | Weather conditions at that store on that day, for example: sun (SUN), cloudy (CLO), rain (RAI), snow (SNO). Valid values stored on the codes table where code_type = WEAT. |
| 4 | TEMPERATURE |  |  |  | NUMERIC (3) | Actual temperature at that store on that day. Can be negative, so it is a signed value. |
| 5 | COMP_IND |  |  | Y | VARCHAR (1) | Indicates whether this store is comp (C) or non-comp (N). A store is comp if it has been open for one year. |
| 6 | NET_SALES |  |  | Y | NUMERIC (20,4) | The total net sales amount for this store on this date. This amount is calculated by subtracting returns from sales. |
| 7 | NET_SALES_SUSPENDED |  |  |  | NUMERIC (20,4) | The total sales value for transactions that have a failed status. |

---

## Table: SA_GL_REF_DATA

**Description:** This table contains the ReSA related reference data.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | STORE_DAY_SEQ_NO |  |  | Y | NUMERIC (20) | This field will hold the store day sequence no. |
| 2 | STORE |  |  | Y | NUMERIC (10) | This field will hold the store number. |
| 3 | DAY |  |  | Y | NUMERIC (3) | This field will hold the particular day information. |
| 4 | ACCT_DATE |  |  | Y | Date | This field will hold the date of accounting |
| 5 | PROCESSED_DATE |  |  | Y | Date | This field will hold the date when the GL data was processed. |
| 6 | CURRENCY_CODE |  |  | Y | VARCHAR (3) | This field will hold the currency code of the store location. |
| 7 | SET_OF_BOOKS_ID |  |  |  | NUMERIC (15) | This field will hold the MSOB ID linked to the ReSA transaction |
| 8 | UPDATE_ID |  |  |  | VARCHAR (15) | This field will hold the information whether the record has been updated. |
| 9 | TOTAL_VALUE |  |  | Y | NUMERIC (20,4) | This fileds holds the total value with appropriate sign |
| 10 | TOTAL_ID |  |  | Y | VARCHAR (10) | This field will hold the total_id informaiton |
| 11 | ATTRIB1 |  |  |  | VARCHAR (30) | Holds the first attribute information |
| 12 | ATTRIB2 |  |  |  | VARCHAR (30) | Holds the second attribute information |
| 13 | PERIOD |  |  |  | VARCHAR (15 ) | This will hold the accounting period name as defined by the financial application. |
| 14 | REFERENCE_TRACE_ID |  |  | Y | VARCHAR (32) | This field will hold the Reference trace ID for drill back and traceability purposes. |

---

## Table: SA_HQ_VALUE

**Description:** This table contains the hq value for a given total_value_seq_no and value_rev_no.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | STORE | P | F | Y | NUMERIC (10) | Store number to be used for table partitioning. |
| 2 | DAY | P | F | Y | NUMERIC (3) | Day number to be used for table partitioning. This is derived from the sa_store_day.business_date column by calling the function SA_DATE_HASH. |
| 3 | TOTAL_SEQ_NO | P | F | Y | NUMERIC (20) | Identifies the unique result set for this total id, total revision, store/day, Balancing group and index values. |
| 4 | VALUE_REV_NO | P |  | Y | NUMERIC (3) | Sequential number to uniquely identify the generation of the total being calculated. The sequence that populates this value will also populate the value_rev_no fields on the sa_sys_calc_value, sa_pos_value and sa_store_value tables. |
| 5 | HQ_VALUE |  |  | Y | NUMERIC (20,4) | Value for the total entered by a headquarters user. |
| 6 | UPDATE_ID |  |  | Y | VARCHAR (30) | ID of the user that has updated the value. |
| 7 | UPDATE_DATETIME |  |  | Y | Date | Date and timestamp of the value update. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SA_HQ_VALUE|PK||||TOTAL_SEQ_NO|ASC|
||||||VALUE_REV_NO|ASC|
||||||STORE|ASC|
||||||DAY|ASC|
|SA_HQ_VALUE_I1|||||TOTAL_SEQ_NO|ASC|
||||||STORE|ASC|
||||||DAY|ASC|
|PK_SA_HQ_VALUE|UN||||TOTAL_SEQ_NO|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
||||||VALUE_REV_NO|ASC|
||||||STORE|ASC|
||||||DAY|ASC|

---

## Table: SA_IF_ITEM

**Description:** Contains items that have been added, modified, or deleted in the RMS system.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  |  | Y | VARCHAR (25) | Contains the unique Item identifier being added, modified, or deleted. |
| 2 | ACTION_TYPE |  |  | Y | VARCHAR (1) | The action being performed on this record. A=Add, M=Modify, D=Delete |

---

## Table: SA_IF_LOCATION

**Description:** This table is populated by an insert/update/delete trigger on the store table. It is used as an interface point between Oracle Retails Sales Audit and Oracle Site Fuels Management (SFM).

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LOCATION |  |  | Y | NUMERIC (10) | The locations that sell fuel which have had a change to their name or their currency code. This field will only contain stores. |
| 2 | ACTION_TYPE |  |  | Y | VARCHAR (1) | The action being performed on this record. A=Add, M=Modify, D=Delete. |

---

## Table: SA_IMPORT_LOG

**Description:** This table holds a log of all imports into the Sales Audit system.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | STORE | P |  | Y | NUMERIC (10) | Store number to be used for table partitioning. |
| 2 | DAY | P |  | Y | NUMERIC (3) | Day number to be used for table partitioning. This is derived from the sa_store_day.business_date column by calling the function SA_DATE_HASH. |
| 3 | STORE_DAY_SEQ_NO | P | F | Y | NUMERIC (20) | This field will hold the unique identifier for a store/day combination. |
| 4 | SYSTEM_CODE | P |  | Y | VARCHAR (6) | This field will hold the name of the external system that produced the file. Valid values can be found on the code_detail table with the code_type of SYST. |
| 5 | STATUS |  |  | Y | VARCHAR (1) | This field will hold the status of the import. Valid values R - ready for import,L - imported and loaded into database, U - unexpected import, but loaded into database. Decodes of the valid values are stored with the code type SAIS. |
| 6 | DATETIME |  |  |  | Date | This field will hold the date and time that the file was created. This information will be taken from the header of the file. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SA_IMPORT_LOG|PK||||STORE_DAY_SEQ_NO|ASC|
||||||SYSTEM_CODE|ASC|
||||||STORE|ASC|
||||||DAY|ASC|
|PK_SA_IMPORT_LOG|UN||||STORE_DAY_SEQ_NO|ASC|
||||||SYSTEM_CODE|ASC|
||||||STORE|ASC|
||||||DAY|ASC|

### Constraints

|Type|Column /<br>Constraint Name|Details|
|---|---|---|
|Column Level|STATUS||

---

## Table: SA_MISSING_TRAN

**Description:** This table contains all the transaction missing in the RTLOGs at a store/tran_date/register level. This table is populated with the missing transaction numbers that are detected during the transaction sequence check.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | MISS_TRAN_SEQ_NO | P |  | Y | NUMERIC (20) | Contains a unique identifier for the missing transactions. |
| 2 | STORE_DAY_SEQ_NO |  |  | Y | NUMERIC (20) | Contains a system generated identification number for a unique store/business date combination. |
| 3 | REGISTER |  |  |  | VARCHAR (5) | Register ID |
| 4 | TRAN_NO |  |  | Y | NUMERIC (10) | Transaction number |
| 5 | STATUS |  |  | Y | VARCHAR (6) | Status. Valid values are from code_type SAMS and are A,D, and M. |
| 6 | RTLOG_ORIG_SYS |  |  | Y | VARCHAR (3) | This column contains the RTLOG file's originating/source system. This denotes the system that the missing transaction number belongs to. Expected values for this field are 'POS' for ORPOS and 'OMS' for other Order Management Systems. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SA_MISSING_TRAN|PK||||MISS_TRAN_SEQ_NO|ASC|

---

## Table: SA_REALM

**Description:** The REALM table is used to keep track of metadata realms. Realms represent database objects (such as tables and PL/SQL blocks), ARI constructs (such as lookup and actions), and external data sources (such as headlines and data retrieved from monitors). A realms parameters specify what data is contained by the realm.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | REALM_ID | P |  | Y | VARCHAR (15) | REALM_ID is simply a number (up to 10 digits long) prefixed with the word REALM. The number is generated by an Oracle sequence. |
| 2 | REALM_TYPE_ID |  | F | Y | VARCHAR (8) | Indicates the realms type |
| 3 | PHYSICAL_NAME |  |  | Y | VARCHAR (120) | The interpretation of this field varies with the REALM_TYPE. For tables and views it represents a table or view name. For functions, it is a function name which can have a prepended package name. For external data and headlines, it is a data row name or headline name in the appropriate data structures. For lookups and actions, it is simply a user-defined name. |
| 4 | SEQ_NO |  |  | Y | NUMERIC (8) | Used to avoid having active realms and deactivated realms with the PHYSICAL_NAME name cause a unique key violation. |
| 5 | INSTANCE_ID |  |  | Y | VARCHAR (6) | Identifies the instance of this realm. This is used when the user wants more than one version of a realm. For example, the user may want two instance of a function, one which has certain parameters overridden, and one which doesnt. This is an ID as opposed to a number to make telling instances apart easier. |
| 6 | LOGICAL_REALM_ID |  |  |  | VARCHAR (15) | Points to the logical realm containing this realm. Only a queriable realm can be part of a logical realm. |
| 7 | ACTIVE_IND |  |  | Y | VARCHAR (1) | Indicates whether the realm is active. In order to be considered active, a realm must contain at least one active parameter. If a realm contains no active parameters, it will be automatically deactivated. A realm can also be deactivated via the GUI (through a user deleting it). Deactivated realms are abandoned in place. |
| 8 | DISPLAY_NAME |  |  | Y | VARCHAR (120) | Name displayed in the GUI. If the name of the parameter is changed in the GUI, this is the value that gets altered, not PHYSICAL_NAME. |
| 9 | DB_LINK |  |  |  | VARCHAR (30) | Name of a DB_Link for connecting to remote databases. DB_Links can be used for tables, views and PL/SQL realms. |
| 10 | SCHEMA |  |  |  | VARCHAR (30) | Name of the schema containing the object. Normally this will be the default schema for Oracle Retail, but the schema reference makes it possible to reference another schema within the same database instance, or by using a DB_LINK, to a schema contained in another instance. |
| 11 | MULTISELECT_AVAIL_IND |  |  | Y | VARCHAR (1) | For actions, indicates whether this action can be performed on multiple events at once. |
| 12 | RDW_OWNER |  |  |  | VARCHAR (120) | For Report realms, contains the owner of the RDW report |
| 13 | RDW_PROJECT |  |  |  | VARCHAR (120) | For Report realms, contains the project for the RDW report. |
| 14 | LAST_SCAN_DATE |  |  |  | Date | For RDW Report realms, this column contains the last time data was scanned from RDW and inserted into the realms shadow table. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SA_REALM|PK||||REALM_ID|ASC|
|UK_SA_REALM|UK||||REALM_TYPE_ID|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
||||||PHYSICAL_NAME|ASC|
||||||SEQ_NO|ASC|
||||||INSTANCE_ID|ASC|
|SA_REALM_I1|||||LOGICAL_REALM_ID|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_SA_REALM_ACTIVE_IND|active_ind in ('Y', 'N')<br>|
||CHK_SA_REALM_MULTISELECT|multiselect_avail_ind in ('Y', 'N')<br>|
|Column Level|ACTIVE_IND||
||MULTISELECT_AVAIL_IND||

---

## Table: SA_REALM_TYPE

**Description:** Realm types describe kinds of realms by their physical access methods from the vantage point of ARI. Realms can be tables, data warehouse headlines, PL/SQL functions, forms functions, windows command line functions or other external data streams. These may be deployed in the same or a different database instance from ARI. The number of such realm types is limited and predefined rows are populated by Oracle Retail.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | REALM_TYPE_ID | P |  | Y | VARCHAR (8) | An abbreviation (max 8 letters) of the Realm Types name. |
| 2 | REALM_TYPE_NAME |  |  | Y | VARCHAR (30) | Short name describing the realm type. |
| 3 | REALM_TYPE_DESC |  |  | Y | VARCHAR (250) | Description of the realm type. |
| 4 | REALM_CAT |  |  | Y | VARCHAR (1) | Indicates the physical kind of object. |
| 5 | DB_LINK_REQ |  |  | Y | VARCHAR (1) | Indicates whether realms of this type must be, can or cannot be part of a different database than the one in which Oracle is installed. |
| 6 | RETRIEVE_VALUES_IND |  |  | Y | VARCHAR (1) | Indicates whether ARI can retrieve values for the parameters of this realm type at will. |
| 7 | DELAYED_MONITOR_IND |  |  | Y | VARCHAR (1) | Indicates whether a delayed batch monitor can be used against this realm type to generate potential exceptions. |
| 8 | REALTIME_MONITOR_IND |  |  | Y | VARCHAR (1) | Indicates whether a real-time monitor can be used against this realm type to generate potential exceptions. |
| 9 | ACTION_DRILL_CODE |  |  | Y | VARCHAR (1) | Indicates whether a realm type is an action or a drill or neither. |
| 10 | NAMED_PARM_IND |  |  | Y | VARCHAR (1) | Indicates whether the realm can have named parameters or if it needs sequencing numbers instead. |
| 11 | SPECIAL_USE_IND |  |  | Y | VARCHAR (1) | Indicates a realm whose parameters must be populated as special cases in the parameter population routines. |
| 12 | TRICKLE_MONITOR_IND |  |  | Y | VARCHAR (1) | Indicates that this realm must be monitored as a stream of data, rather than a static data set (such as a normal PK table). |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SA_REALM_TYPE|PK||||REALM_TYPE_ID|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_SA_REALM_TYPE_ACTION|action_drill_code in ('A','D','N')<br>|
||CHK_SA_REALM_TYPE_DB_LINK_REQ|db_link_req in ('Y','N','O')<br>|
||CHK_SA_REALM_TYPE_DELAYED|delayed_monitor_ind in ('Y','N')<br>|
||CHK_SA_REALM_TYPE_NAMED_PARM|named_parm_ind in ('Y','N')<br>|
||CHK_SA_REALM_TYPE_REALM_CAT|realm_cat in ('L','V','T','R','X','P','F','K','S','W')<br>|
||CHK_SA_REALM_TYPE_REALTIME|realtime_monitor_ind in ('Y', 'N')<br>|
||CHK_SA_REALM_TYPE_RETRIEVE|retrieve_values_ind in ('Y', 'N')<br>|
||CHK_SA_REALM_TYPE_SPEC_USE_IND|Special_Use_Ind in ('Y','N')<br>|
||CHK_SA_REALM_TYPE_TRICKLE_MON|TRICKLE_MONITOR_IND in ('Y','N')<br>|






|Type|Column / Constraint Name|Details|
|---|---|---|
|Column Level|REALM_CAT||
||DB_LINK_REQ||
||RETRIEVE_VALUES_IND||
||DELAYED_MONITOR_IND||
||REALTIME_MONITOR_IND||
||ACTION_DRILL_CODE||
||NAMED_PARM_IND||
||SPECIAL_USE_IND||
||TRICKLE_MONITOR_IND||

---

## Table: SA_REFERENCE

**Description:** This table defines the type of information stored in the ref_no columns on the sa_tran_head, sa_tran_item and sa_tran_tender tables based on the transaction type.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | REF_SEQ_NO | P |  | Y | NUMERIC (10) | Unique identifier for each tran_type, sub_tran_type, reason_code, ref_no combination. This field will be populated by sa_ref_sequence. |
| 2 | TRAN_TYPE |  |  | Y | VARCHAR (6) | Type of transaction. Valid values are in codes table. |
| 3 | SUB_TRAN_TYPE |  |  |  | VARCHAR (6) | If the transaction type field has a value, this field may contain the transaction sub type for certain Transaction Types. Valid values are defined on the code tables with a code type of TRAS. |
| 4 | REASON_CODE |  |  |  | VARCHAR (6) | If the transaction type field has a value, this field may contain a reason code for certain Transaction Types. Valid values are defined on the code tables with a code type of REAC. |
| 5 | REF_NO |  |  | Y | NUMERIC (2) | Which ref_no field the value is mapped to. |
| 6 | REF_LABEL_CODE |  |  | Y | VARCHAR (6) | Contains the code of the label to be displayed for the reference field with the corresponding reference number. The decode of the label is on the code detail table with a code type of REFL. |

---

## Table: SA_ROLE_FIELD

**Description:** This table has been made redundant with migration to ADF and field level access is handled using application roles and privileges.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ROLE | P |  | Y | VARCHAR (30) | This field will contain a unique role id. |
| 2 | FIELD | P |  | Y | VARCHAR (6) | This field will contain a field associated with the role. Valid values for this field are on the code tables with a code type of FLDA. |
| 3 | ENABLE_IND |  |  | Y | VARCHAR (1) | This field will indicate whether or not the field will be enabled for a user that is associated with the role. Valid values are Y and N. |
| 4 | DISPLAY_IND |  |  | Y | VARCHAR (1) | This field will indicate whether or not the field will be displayed for a user that is associated with the role. Valid values are Y and N. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SA_ROLE_FIELD|PK||||ROLE|ASC|
||||||FIELD|ASC|

---

## Table: SA_ROUNDING_RULE_DETAIL

**Description:** This table will hold the details of the rounding rules

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ROUNDING_RULE_ID |  | F | Y | VARCHAR (10) | This field contains the rounding rule id. |
| 2 | LOW_ENDING_AMT |  |  | Y | NUMERIC (20,4) | This field contatins the low ending amount of the rounding rule. |
| 3 | HIGH_ENDING_AMT |  |  | Y | NUMERIC (20,4) | This field contains the high ending amount of the rounding rule. |
| 4 | ROUND_AMT |  |  | Y | NUMERIC (20,4) | This file contains the rounded amount of the rounding rule. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|SA_ROUNDING_RULE_DETAIL_I1|||||ROUNDING_RULE_ID|ASC|

---

## Table: SA_ROUNDING_RULE_HEAD

**Description:** This table contains the header information of the rounding rules

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ROUNDING_RULE_ID | P |  | Y | VARCHAR (10) | This field contains the rounding rule id. |
| 2 | ROUNDING_RULE_NAME |  |  | Y | VARCHAR (255) | This field contains the description of the rounding rule. |
| 3 | CURRENCY_CODE |  |  | Y | VARCHAR (3) | This field contains the currency code of the rounding rule. |
| 4 | COUNTRY_ID |  |  |  | VARCHAR (3) | This field contains the country id of the rounding rule. |
| 5 | START_BUSINESS_DATE |  |  |  | Date | This field contains the effective business date of the rounding rule. |
| 6 | STATUS |  |  | Y | VARCHAR (1) | This field contains the status of the rounding rule. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SA_ROUNDING_RULE_HEAD|PK||||ROUNDING_RULE_ID|ASC|
|UK_SA_ROUNDING_RULE_HEAD|UK||||CURRENCY_CODE|ASC|
||||||COUNTRY_ID|ASC|

---

## Table: SA_ROUNDING_RULE_HEAD_TL

**Description:** This is the translation table for SA_ROUNDING_RULE_HEAD table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | ROUNDING_RULE_ID | P | F | Y | VARCHAR (10) | This field contains the rounding rule id. |
| 3 | ROUNDING_RULE_NAME |  |  | Y | VARCHAR (255) | This field contains the description of the rounding rule. |
| 4 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 6 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 7 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SA_ROUNDING_RULE_HEAD_TL|PK||||LANG|ASC|
||||||ROUNDING_RULE_ID|ASC|

---

## Table: SA_STORE_ACH

**Description:** This table will contain one row for each store/day combination, which does not exist in the tables SA_CORP_CLOSE and SA_STORE_CLOSE. It will be used to hold the individual store/day information for ACH.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | STORE | P |  | Y | NUMERIC (10) | Store id that the ACH amount was calculated for. |
| 2 | BUSINESS_DATE | P |  | Y | Date | Date that the ACH amount was created for. |
| 3 | PARTNER_TYPE | P | F | Y | VARCHAR (6) | Specifies the type of partner. |
| 4 | PARTNER_ID | P | F | Y | VARCHAR (10) | Unique identifying number for a partner within the system. |
| 5 | TODAY_ADJ_DEPOSIT_EST |  |  |  | NUMERIC (20,4) | Store adjustment for missing deposits, NSF, and bank fees. T he amounts are stored in the stores local currency. |
| 6 | NEXT_DAY_MAN_ADJ_DEPOSIT |  |  |  | NUMERIC (20,4) | Contains a manually entered adjusted amount. The amounts are stored in the stores local currency. |
| 7 | NEXT_DAY_DEPOSIT_EST |  |  |  | NUMERIC (20,4) | Store days estimated deposit. The amounts are stored in the stores local currency. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SA_STORE_ACH|PK||||STORE|ASC|
||||||BUSINESS_DATE|ASC|
||||||PARTNER_TYPE|ASC|
||||||PARTNER_ID|ASC|
|SA_STORE_ACH_I1|||||PARTNER_TYPE|ASC|
||||||PARTNER_ID|ASC|

---

## Table: SA_STORE_DATA

**Description:** This table will contain details about which files are expected for import or export for each store. The data in this table will allow errors to be generated when expected data is not received or sent for a given store.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | STORE | P | F | Y | NUMERIC (10) | This field contains the Store that the data is related to. |
| 2 | SYSTEM_CODE | P |  | Y | VARCHAR (6) | This field will hold the name of the external system that produced the file. Valid values can be found on the code_detail table with the code_type of SYSI or SYSE. |
| 3 | IMP_EXP | P |  | Y | VARCHAR (6) | This field indicates whether the file expected is an import (I) files or and export (E) file. Valid values are on the code tables with a code type of IMEX. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SA_STORE_DATA|PK||||STORE|ASC|
||||||SYSTEM_CODE|ASC|
||||||IMP_EXP|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_SA_STORE_DATA_IMP_EXP|imp_exp in ('I','E')<br>|
|Column Level|IMP_EXP||

---

## Table: SA_STORE_EMP

**Description:** This table has been made redundant and replaced with SA_STORE_POS_USER table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | EMP_ID | P | F | Y | VARCHAR (10) | This field will contain a unique, system generated, employee identification number. |
| 2 | STORE | P | F | Y | NUMERIC (10) | This field will contain the store that the employee may work at. |
| 3 | POS_ID |  |  |  | VARCHAR (10) | This field will contain the employees number used to enter themselves into the POS system when they work. |
| 4 | HOME_STORE_IND |  |  | Y | VARCHAR (1) | This field indicates whether the store in this record is the primary store for this employee. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SA_STORE_EMP|PK||||EMP_ID|ASC|
||||||STORE|ASC|
|SA_STORE_EMP_I1|||||STORE|ASC|
|SA_STORE_EMP_I2|||||POS_ID|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_SA_STORE_EMP_HOME_STORE|home_store_ind in ('Y','N')<br>|

---

## Table: SA_STORE_POS

**Description:** This table contains the Point-of-Sale starting and ending transaction numbers for each store.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | STORE | P | F | Y | NUMERIC (10) | This field contains the store number. |
| 2 | POS_TYPE | P |  | Y | VARCHAR (6) | This field contains the POS type. Valid values are defined on the code tables with a code type of POST. |
| 3 | START_TRAN_NO |  |  | Y | NUMERIC (10) | This field contains the starting transaction number for the POS type and store. |
| 4 | END_TRAN_NO |  |  | Y | NUMERIC (10) | This field contains the ending transaction number for the POS type and store. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SA_STORE_POS|PK||||STORE|ASC|
||||||POS_TYPE|ASC|

---

## Table: SA_STORE_POS_USER

**Description:** This table is used to setup the Store employee and the list of stores the store employee is assigned. Store employees are not managed by the ReSA application and this table has to be manually managed if Store employees has to be setup in ReSA and used for any auditing rules. The employees setup in this table is not used by the resa import job to validate the cashier or salesperson id fields in the input RTLOG file.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | STORE | P | F | Y | NUMERIC (10) | This field will contain the store that the employee may work at. |
| 2 | POS_USER_ID | P |  | Y | VARCHAR (10) | This field contains the POS ID for the store employee. |
| 3 | STORE_EMP_TYPE |  |  |  | VARCHAR (6) | This field contains the employee types for the store employee. Valid values are C - Cashier, S - Salesperson, M - Manager. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SA_STORE_POS_USER|PK||||STORE|ASC|
||||||POS_USER_ID|ASC|

### Constraints

|Type|Column / Constraint<br>Name|Details|
|---|---|---|
|Table Level|CHK_SA_STORE_POS_USER|STORE_EMP_TYPE IN ('C','S','M')<br>|

---

## Table: SA_STORE_PRICE_HIST_TEMP

**Description:** This global temporary table is referenced by saexprdw.pc. It is used to derive the most recent retail type of an item/store combination, and is joined to as opposed to querying the PRICE_HIST table for each item/store combination processed.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | STORE | P |  | Y | NUMERIC (10) | This field holds a Store identifier. |
| 2 | ITEM | P |  | Y | VARCHAR (25) | This field holds an Item identifier. |
| 3 | RETAIL_TYPE |  |  | Y | VARCHAR (20) | This field holds a string which contains the Action Date from the PRICE_HIST table for the item/location combination, a transaction priority value, and the transaction type from the PRICE_HIST table for the item/location combination. This string is then used to derive the retail type to be written to the current output file. Since more than one transaction type may exist for the item/location/action date combination on the PRICE_HIST table, the transaction priority value is used to determine which transaction will take precedence over the other(s). |

---

## Table: SA_STORE_VALUE

**Description:** This table contains the store reported value for a given total_value_seq_no and value_rev_no.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | STORE | P | F | Y | NUMERIC (10) | Store number to be used for table partitioning. |
| 2 | DAY | P | F | Y | NUMERIC (3) | Day number to be used for table partitioning. This is derived from the sa_store_day.business_date column by calling the function SA_DATE_HASH. |
| 3 | TOTAL_SEQ_NO | P | F | Y | NUMERIC (20) | Identifies the unique result set for this total id, total revision, store/day, Balancing group and index values. |
| 4 | VALUE_REV_NO | P |  | Y | NUMERIC (3) | Sequential number to uniquely identify the generation of the total being calculated. The sequence that populates this value will also populate the value_rev_no fields on the sa_sys_calc_value, sa_pos_value and sa_hq_rep_value tables. |
| 5 | STORE_VALUE |  |  | Y | NUMERIC (20,4) | Value for the total entered by a store user. |
| 6 | UPDATE_ID |  |  | Y | VARCHAR (30) | ID of the user that has updated the value. |
| 7 | UPDATE_DATETIME |  |  | Y | Date | Date and timestamp of the value update. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SA_STORE_VALUE|PK||||TOTAL_SEQ_NO|ASC|
||||||VALUE_REV_NO|ASC|
||||||STORE|ASC|
||||||DAY|ASC|
|SA_STORE_VALUE_I1|||||TOTAL_SEQ_NO|ASC|
||||||STORE|ASC|
||||||DAY|ASC|
|PK_SA_STORE_VALUE|UN||||TOTAL_SEQ_NO|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
||||||VALUE_REV_NO|ASC|
||||||STORE|ASC|
||||||DAY|ASC|

---

## Table: SA_SYSTEM_OPTIONS

**Description:** This table contains all user-defined parameters which will be accessed by the sales audit system to control the various processing options available. This table is populated during installation of the system and must be maintained by the database administrator.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DAYS_BEFORE_PURGE |  |  | Y | NUMERIC (3) | A system parameter used to determine how many days sales audit data should remain on the databases after posted to other systems before purging. |
| 2 | DAY_POST_SALE |  |  | Y | NUMERIC (3) | This parameter is used to define the number of days before post-dated sale transactions are allowed in the system to be processed. |
| 3 | BALANCE_LEVEL_IND |  |  | Y | VARCHAR (6) | Indicator used to determine the level balancing of declared totals to system summarized totals is performed. Valid values (found in the code_detail table under code_type SABL) are Store, Register, and Cashier. |
| 4 | MAX_DAYS_COMPARE_DUPS |  |  |  | NUMERIC (3) | Maximun number of previous days information to use when determining if a transaction is a duplicate. |
| 5 | COMP_BASE_DATE |  |  | Y | VARCHAR (6) | The date on the store table that will be used as a base to determine if the store is comp or not. Valid values (found in the code_detail table under code_type SACD) are Store Open Date, Remodel Date, and Acquire Date. |
| 6 | COMP_NO_DAYS |  |  | Y | NUMERIC (3) | The number of days since the comp_base_date value that must have passed to qualify a store as Comp. |
| 7 | CHECK_DUP_MISS_TRAN |  |  | Y | VARCHAR (1) | This field indicates whether to check for missing and duplicate transactions, or neither. Valid values are Y and N. |
| 8 | UNIT_OF_WORK |  |  | Y | VARCHAR (6) | This field indicates whether the retailer intends to work at the transaction level or the store day level. Valid values are Transaction level and Store day level. Valid values are defined on the code tables with a code type of UOWK. |
| 9 | AUDIT_AFTER_IMP_IND |  |  | Y | VARCHAR (1) | This column indicates whether or not to execute the Automated Totaling and Automated Audit processes after each import of data. If this indicator is set to No, the Automated Totaling and Automated Audit processes will not occur until the system receives a transaction verifying that all data for the Store Day has been transmitted. |
| 10 | FUEL_DEPT |  |  |  | NUMERIC (4) | This field contains the department number of the fuel department. This field will only contain a value if the retailer sells fuel. |
| 11 | DEFAULT_CHAIN |  |  |  | NUMERIC (10) | Contains the default or primary chain for the retailer. |
| 12 | CLOSE_IN_ORDER |  |  | Y | VARCHAR (1) | Used to specify whether a store can close a current day if a previous day is still open. Valud values are Y,N |
| 13 | ESCHEAT_IND |  |  |  | VARCHAR (1) | This field indicates whether or not the retailer would like to escheat vouchers (gift certificates and credit vouchers) back to the state after a defined timeperiod. |
| 14 | PARTNER_TYPE |  | F |  | VARCHAR (6) | The partner type for the retailer themselves, used in processing income adjustments of vouchers. |
| 15 | PARTNER_ID |  | F |  | VARCHAR (10) | The partner id for the retailer themselves, used in processing income adjustments of vouchers. |
| 16 | AUTO_VALIDATE_TRAN_EMPLOYEE_ID |  |  | Y | VARCHAR (1) | This column indicates whether employee information should be validated automaticly during the ReSA import. If the value is Y, employee information will be validated on import of the RTLOG and in the interactive audit. If the value is N, employee information will not be automaticly validated. |
| 17 | VIEW_SYS_CALC_TOTAL |  |  | Y | VARCHAR (3) | This field indicates whether or not a head office mployee is permitted to view the system calcualted totals. Valid values = A, HQ, HSM, N The default value should be A. |
| 18 | WKSTATION_TRAN_APPEND_IND |  |  | Y | VARCHAR (1) | This column will identify if the client is sending workstation id appended to the transaction number. It will determine if standard missing transaction processing or new process is to be triggered for transactions in RTLOG file. The new process is where clients will be sending a transaction number equal to workstation id |
| 19 | INV_RESV_FROM_STORE_IND |  |  | Y | VARCHAR (1) | Inventory reservation from SIM indicator. If this indicator is Y then, the inventory reserve/unreserve for customer orders will come from SIM otherwise ReSA has to generate the flat file for RMS. |
| 20 | INV_RESV_LAYAWAY_IND |  |  | Y | VARCHAR (1) | Reserve or unreserve the inventory for Layaway orders. |
| 21 | CC_NO_MASK_CHAR |  |  | Y | VARCHAR (1) | Masking character for Credit/Debit Card Number. |
| 22 | TRAN_NAVIGATION_IND |  |  | Y | VARCHAR (1) | Indicator used to determine the navigation of transaction maintenance screen based on either Resa transaction number or POS transaction number. The default value for the column is 'R'. |

---

## Table: SA_SYS_VALUE

**Description:** This table contains the ReSA calculated value for a given total_value_seq_no and value_rev_no.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | STORE | P | F | Y | NUMERIC (10) | Store number to be used for table partitioning. |
| 2 | DAY | P | F | Y | NUMERIC (3) | Day number to be used for table partitioning. This is derived from the sa_store_day.business_date column by calling the function SA_DATE_HASH. |
| 3 | TOTAL_SEQ_NO | P | F | Y | NUMERIC (20) | Identifies the unique result set for this total id, total revision, store/day, Balancing group and index values. |
| 4 | VALUE_REV_NO | P |  | Y | NUMERIC (3) | Sequential number to uniquely identify the generation of the total being calculated. The sequence that populates this value will also populate the value_rev_no fields on the sa_pos_value, sa_store_value and sa_hq_value tables. |
| 5 | SYS_VALUE |  |  | Y | NUMERIC (20,4) | Value for the total calculated by ReSA. |
| 6 | TOTAL_REV_NO |  |  | Y | NUMERIC (3) | Sequential number to uniquely identify the generation of the total being calculated. This number will increment as a user edits an existing total calculation defintion. |
| 7 | UPDATE_ID |  |  | Y | VARCHAR (30) | ID of the user that has updated the value. |
| 8 | UPDATE_DATETIME |  |  | Y | Date | Date and timestamp of the value update. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SA_SYS_VALUE|PK||||TOTAL_SEQ_NO|ASC|
||||||VALUE_REV_NO|ASC|
||||||STORE|ASC|
||||||DAY|ASC|
|SA_SYS_VALUE_I1|||||TOTAL_SEQ_NO|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
||||||STORE|ASC|
||||||DAY|ASC|
|PK_SA_SYS_VALUE|UN||||TOTAL_SEQ_NO|ASC|
||||||VALUE_REV_NO|ASC|
||||||STORE|ASC|
||||||DAY|ASC|

---

## Table: SA_SYS_VALUE_WKSHT

**Description:** The table will hold the system calculated values produced by totals that have not been approved.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | STORE | P | F | Y | NUMERIC (10) | Store number to be used for table partitioning. |
| 2 | DAY | P | F | Y | NUMERIC (3) | Day number to be used for table partitioning. This is derived from the sa_store_day.business_date column by calling the function SA_DATE_HASH. |
| 3 | TOTAL_SEQ_NO | P | F | Y | NUMERIC (20) | Identifies the unique result set for this total id, total revision, store/day, Balancing group and index values. |
| 4 | VALUE_REV_NO | P |  | Y | NUMERIC (3) | Sequential number to uniquely identify the generation of the total being calculated. The sequence that populates this value will also populate the value_rev_no fields on the sa_pos_value, sa_store_value and sa_hq_value tables. |
| 5 | SYS_VALUE |  |  | Y | NUMERIC (20,4) | Value for the total calculated by ReSA |
| 6 | TOTAL_REV_NO |  |  | Y | NUMERIC (3) | Sequential number to uniquely identify the generation of the total being calculated. This number will increment as a user edits an existing total calculation defintion. |
| 7 | UPDATE_ID |  |  | Y | VARCHAR (30) | ID of the user that has updated the value. |
| 8 | UPDATE_DATETIME |  |  | Y | Date | Date and timestamp of the value update. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SA_SYS_VALUE_WKSHT|PK||||TOTAL_SEQ_NO|ASC|
||||||VALUE_REV_NO|ASC|
||||||STORE|ASC|
||||||DAY|ASC|
|SA_SYS_VALUE_WKSHT_I1|||||TOTAL_SEQ_NO|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
||||||STORE|ASC|
||||||DAY|ASC|

---

## Table: SA_USER

**Description:** This table contains the valid ReSA application users.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | USER_ID | P |  | Y | VARCHAR (30) | This field contains the application user identification code that the user uses to login to ReSA application. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SA_USER|PK||||USER_ID|ASC|

---

## Table: SA_USER_LOC_TRAITS

**Description:** This table is used to setup the relationship between ReSA application user to location traits.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | USER_ID | P | F | Y | VARCHAR (30) | This field contains the application user identification code that the user uses to login to ReSA application. |
| 2 | LOC_TRAIT | P | F | Y | NUMERIC (4) | This field contains the location trait the auditor is assigned to work. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SA_USER_LOC_TRAITS|PK||||USER_ID|ASC|
||||||LOC_TRAIT|ASC|

---

## Table: SA_VOUCHER

**Description:** This is a new table that contains issued/redeemed information about gift certificates and credit vouchers. It is populated when a gift certificate is sold or merchandise is returned for credit, and is updated as these documents are used as a form of payment in a transaction.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | VOUCHER_SEQ_NO | P |  | Y | NUMERIC (20) | Unique identifier for an entry on this table. |
| 2 | VOUCHER_NO |  |  |  | VARCHAR (25) | Serial number of the voucher. |
| 3 | TENDER_TYPE_ID |  | F | Y | NUMERIC (6) | Type of voucher (i.e. merchandise credit voucher, gift certificate, etc.). Valid values can be found on the pos_tender_type_head table with a tender_type_group of VOUCH. |
| 4 | ASS_DATE |  |  |  | Date | Date the voucher was assigned. |
| 5 | ASS_STORE |  |  |  | NUMERIC (10) | Store this voucher was assigned to from the head office. |
| 6 | ISS_DATE |  |  |  | Date | Date the document was issued. |
| 7 | ISS_STORE |  |  |  | NUMERIC (10) | Store this document was issued from. |
| 8 | ISS_REGISTER |  |  |  | VARCHAR (5) | Register this document was issued from. |
| 9 | ISS_CASHIER |  |  |  | VARCHAR (10) | Cashier issuing this document. |
| 10 | ISS_TRAN_SEQ_NO |  |  |  | NUMERIC (20) | Transaction number when it was issued. |
| 11 | ISS_ITEM_SEQ_NO |  |  |  | NUMERIC (4) | This column will hold the item sequence of the item within the transaction when a voucher is sold as an item (i.e. as a gift certificate). |
| 12 | ISS_TENDER_SEQ_NO |  |  |  | NUMERIC (4) | This column will hold the tender sequence of the tender within the transaction when a voucher isissued as tender (i.e. as a merchandise credit). |
| 13 | ISS_AMT |  |  |  | NUMERIC (20,4) | Amount the document was issued for. |
| 14 | ISS_CUST_NAME |  |  |  | VARCHAR (120) | The name of the customer who was issued the voucher. |
| 15 | ISS_CUST_ADDR1 |  |  |  | VARCHAR (240) | The address of the customer who was issued the voucher. |
| 16 | ISS_CUST_ADDR2 |  |  |  | VARCHAR (240) | The second address line of the customer who was issued the voucher. |
| 17 | ISS_CUST_CITY |  |  |  | VARCHAR (120) | The city of the customer who was issued the voucher. |
| 18 | ISS_CUST_STATE |  |  |  | VARCHAR (3) | The state of the customer who was issued the voucher. |
| 19 | ISS_CUST_POSTAL_CODE |  |  |  | VARCHAR (30) | The postal code of the customer who was issued the voucher. |
| 20 | ISS_CUST_COUNTRY |  |  |  | VARCHAR (3) | The country of the customer who was issued the voucher. |
| 21 | RECIPIENT_NAME |  |  |  | VARCHAR (120) | The name of the intended recipient of the gift certificate. |
| 22 | RECIPIENT_STATE |  |  |  | VARCHAR (3) | The state of the intended recipient of the gift certificate. |
| 23 | RECIPIENT_COUNTRY |  |  |  | VARCHAR (3) | The country of the intended recipient of the gift certificate. |
| 24 | RED_DATE |  |  |  | Date | Date the document was redeemed. |
| 25 | RED_STORE |  |  |  | NUMERIC (10) | Store this document was redeemed at. |
| 26 | RED_REGISTER |  |  |  | VARCHAR (5) | Register this document was redeemed at. |
| 27 | RED_CASHIER |  |  |  | VARCHAR (10) | Cashier redeeming this document. |
| 28 | RED_TRAN_SEQ_NO |  |  |  | NUMERIC (20) | Transaction number when it was redeemed. |
| 29 | RED_TENDER_SEQ_NO |  |  |  | NUMERIC (4) | This column will hold the tender sequence of the tender within the transaction when a voucher is redeemed as tender (i.e. as either a merchandise credit, gift certificate, etc.). |
| 30 | RED_AMT |  |  |  | NUMERIC (20,4) | Amount the document was redeemed for. |
| 31 | EXP_DATE |  |  |  | Date | Date of expiration of the document |
| 32 | ESCHEAT_DATE |  |  |  | Date | The date the voucher was escheated. |
| 33 | ISS_POST_DATE |  |  |  | Date | holds the date that issue information was posted |
| 34 | RED_POST_DATE |  |  |  | Date | holds the date that redemption informtion was posted |
| 35 | ESCH_POST_DATE |  |  |  | Date | holds the date that escheated information was posted |
| 36 | STATUS |  |  | Y | VARCHAR (6) | Indicator showing the documents status, issued or redeemed. Valid values = I, R. |
| 37 | COMMENTS |  |  |  | VARCHAR (2000) | Correction comments. |

### Constraints

|Type|Column / Constraint<br>Name|Details|
|---|---|---|
|Table Level|CHK_SA_VOUCHER_STATUS|status in ('N','E','I','R','A')<br>|
|Column Level|STATUS||

---

## Table: SA_VOUCHER_OPTIONS

**Description:** This table stores the time period after which each voucher type should be escheated and/or purged.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TENDER_TYPE_ID | P |  | Y | NUMERIC (6) | The id of the voucher. |
| 2 | ESCHEAT_NO_DAYS |  |  |  | NUMERIC (4) | The number of days between issuance of this voucher type and its escheatment. |
| 3 | PURGE_NO_DAYS |  |  |  | NUMERIC (4) | The number of days between redemption or escheatment of a voucher and its deletion from the database. |

---

## Table: SA_VR_HEAD

**Description:** This table contains header level information for the metadata defined for totals and rules.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | VR_ID | P |  | Y | VARCHAR (10) | Virtual row id. Identifies a virtual row. |
| 2 | VR_REV_NO | P |  | Y | NUMERIC (3) | Virtual row rev no. Identifies the generation of a virtual row definition. |
| 3 | VR_NAME |  |  |  | VARCHAR (120) | User defined virtual row name. |
| 4 | DRIVING_REALM_ID |  | F | Y | VARCHAR (15) | Identifies the metadata realm off which the virtual row drives. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SA_VR_HEAD|PK||||VR_ID|ASC|
||||||VR_REV_NO|ASC|
|SA_VR_HEAD_I1|||||DRIVING_REALM_ID|ASC|

---

## Table: SA_VR_LINKS

**Description:** This table contains the mappings of the relationship between the parms in a virtual row.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | VR_ID | P | F | Y | VARCHAR (10) | Virtual row id. Identifies a virtual row. |
| 2 | VR_REV_NO | P | F | Y | NUMERIC (3) | Virtual row rev no. Identifies the generation of a virtual row definition. |
| 3 | VR_PARM_SEQ_NO | P |  | Y | NUMERIC (3) | Sequence number of the parm in the virtual row. |
| 4 | LINK_TO_PARM_ID | P |  | Y | VARCHAR (15) | Parm_id of the parm the vr_parm_seq_no joins to. |
| 5 | LINK_TO_PARM_SEQ_NO | P |  | Y | NUMERIC (3) | Sequence number of the parm the vr_parm_seq_no joins to. |
| 6 | OUTER_JOIN_IND |  |  | Y | VARCHAR (1) | Indicates whether an outer join should be applied to this join. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SA_VR_LINKS|PK||||VR_ID|ASC|
||||||VR_REV_NO|ASC|
||||||VR_PARM_SEQ_NO|ASC|
||||||LINK_TO_PARM_ID|ASC|
||||||LINK_TO_PARM_SEQ_NO|ASC|

---

## Table: SA_VR_PARMS

**Description:** This table contains the parms involved in a virtual row.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | VR_ID | P | F | Y | VARCHAR (10) | Virtual row id. Identifies a virtual row. |
| 2 | VR_REV_NO | P | F | Y | NUMERIC (3) | Virtual row rev no. Identifies the generation of a virtual row definition. |
| 3 | VR_PARM_SEQ_NO | P |  | Y | NUMERIC (3) | Sequence number of the parm in the virtual row. |
| 4 | PARM_ID |  | F | Y | VARCHAR (15) | Parm_id of this parm in the virtual row. |
| 5 | VR_PARM_ALIAS |  |  |  | VARCHAR (120) | User defined alias of this parm the virtual row. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SA_VR_PARMS|PK||||VR_ID|ASC|
||||||VR_REV_NO|ASC|
||||||VR_PARM_SEQ_NO|ASC|
|SA_VR_PARMS_I1|||||PARM_ID|ASC|

---

## Table: SA_VR_REALM

**Description:** This table contains the realms involved in a virtual row.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | VR_ID | P | F | Y | VARCHAR (10) | Virtual row id. Identifies a virtual row. |
| 2 | VR_REV_NO | P | F | Y | NUMERIC (3) | Virtual row rev no. Identifies the generation of a virtual row definition. |
| 3 | VR_REALM_SEQ_NO | P |  | Y | NUMERIC (3) | Holds the sequence of the realm in the virtual row. |
| 4 | REALM_ID |  | F | Y | VARCHAR (15) | Realm id involved in the virtual row. |
| 5 | SIGNATURE |  |  |  | VARCHAR (100) | Unique position of the realm within the total. |
| 6 | REALM_ALIAS |  |  |  | VARCHAR (120) | Holds a system created identifier for the realm in the virtual row. |
| 7 | OUTER_JOIN_IND |  |  | Y | VARCHAR (1) | Indicates that an outer join should be performed. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SA_VR_REALM|PK||||VR_ID|ASC|
||||||VR_REV_NO|ASC|
||||||VR_REALM_SEQ_NO|ASC|
|SA_VR_REALM_I1|||||REALM_ID|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_SA_VR_REALM_OUTER_JOIN_IND|outer_join_ind in ('Y','N')<br>|
|Column Level|OUTER_JOIN_IND||

---

## Table: STATE

**Description:** This table contains one row for each state and province in the system.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | STATE | P |  | Y | VARCHAR (3) | This column contains the state abbreviation for the address. |
| 2 | DESCRIPTION |  |  | Y | VARCHAR (120) | Contains the full name of the state. |
| 3 | COUNTRY_ID | P | F | Y | VARCHAR (3) | Contains the unique code which identifies the country where the state belongs. |
| 4 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |
| 5 | CREATE_DATETIME |  |  | Y | Date | This column holds the record creation date. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_STATE|PK||||STATE|ASC|
||||||COUNTRY_ID|ASC|

---

## Table: STATE_TL

**Description:** This is the translation table for STATE table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | STATE | P | F | Y | VARCHAR (3) | Contains the postal abbreviation for the state. |
| 3 | COUNTRY_ID | P | F | Y | VARCHAR (3) | Contains the unique code which identifies the country where the state belongs. |
| 4 | DESCRIPTION |  |  | Y | VARCHAR (120) | Contains the full name of the state. |
| 5 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 6 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 7 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 8 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_STATE_TL|PK||||LANG|ASC|
||||||STATE|ASC|
||||||COUNTRY_ID|ASC|

---

## Table: SYSTEM_CONFIG_OPTIONS

**Description:** This table contains parameters used to configure RMS across functional areas, such as calendar and currency.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | BASE_COUNTRY_ID |  |  | Y | VARCHAR (3) | This column stores the base country code for the system. This field is validated from the COUNTRY table. |
| 2 | CALENDAR_454_IND |  |  | Y | VARCHAR (1) | Determines whether the normal (Gregorian) or the 4-5-4 calendar is going to be used as the financial calendar in RMS. |
| 3 | CONSOLIDATION_IND |  |  | Y | VARCHAR (1) | Indicator used to determine what type of consolidation exchange rate is used as default for all currency conversion within Oracle Retail. If this field contains Y, then the consolidation exchange rate maintenance will be supported, and consolidation exchange rate is used as default for all currency conversion within Oracle Retail. If this field is N, then the consolidation exchange rate maintenance will not be supported, and operational exchange rate is used as default for all currency conversion within Oracle Retail. Default value if NULL is N. |
| 4 | CURRENCY_CODE |  |  | Y | VARCHAR (3) | Indicates the base currency for RMS. This field is validated from the CURRENCIES table. |
| 5 | DATA_INTEGRATION_LANG |  |  | Y | NUMERIC (6) | This is the language for which information will be entered into RMS and integrated to other systems. Foreign key to this column references to LANG.lang. |
| 6 | MULTI_CURRENCY_IND |  |  | Y | VARCHAR (1) | Determines if the company can use more than one currency in the system. Default value if NULL is Y. |
| 7 | TABLE_OWNER |  |  | Y | VARCHAR (30) | Contains the name of the schema owner of the RMS database. |
| 8 | CREATE_ID |  |  | Y | VARCHAR (30) | Stores the Oracle username of the one who inserted the first record. This field is required by the database. |
| 9 | CREATE_DATETIME |  |  | Y | Date | The date and time of when the record was created in the table. This value should only be populated on insert - it should never be updated. |
| 10 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | The Oracle username of the one who most recently updated this record. |
| 11 | LAST_UPDATE_DATETIME |  |  | Y | Date | The date time stamp of the most recent update by the user. |

---

## Table: SYSTEM_VARIABLES

**Description:** This table is the control table for Oracle Retail. All columns which are updated regularly are stored here. This table is populated during installation of the system and must be maintained by the database administrator.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LAST_EOM_HALF_NO |  |  | Y | NUMERIC (5) | Indicates the half number of the previous month. |
| 2 | LAST_EOM_MONTH_NO |  |  | Y | NUMERIC (1) | Indicates the number in the half of the previous month. |
| 3 | LAST_EOM_DATE |  |  | Y | Date | Indicates the date of the last dollar end of month cycle. |
| 4 | NEXT_EOM_DATE |  |  | Y | Date | Indicates the date of the next dollar end of month cycle. |
| 5 | LAST_EOM_START_HALF |  |  | Y | Date | This field contains the date of the beginning of the half for last month. |
| 6 | LAST_EOM_END_HALF |  |  | Y | Date | This field contains the date of the end of the half for last month. |
| 7 | LAST_EOM_START_MONTH |  |  | Y | Date | The first day of the previous month. |
| 8 | LAST_EOM_MID_MONTH |  |  | Y | Date | The 15th day of the previous month. |
| 9 | LAST_EOM_NEXT_HALF_NO |  |  | Y | NUMERIC (5) | The current half number. |
| 10 | LAST_EOM_DAY |  |  | Y | NUMERIC (2) | The last day of the previous month. |
| 11 | LAST_EOM_WEEK |  |  | Y | NUMERIC (2) | The last week of the previous month. |
| 12 | LAST_EOM_MONTH |  |  | Y | NUMERIC (2) | The previous month. |
| 13 | LAST_EOM_YEAR |  |  | Y | NUMERIC (4) | The year the previous month was part of. |
| 14 | LAST_EOM_WEEK_IN_HALF |  |  |  | NUMERIC (2) | This field contains the week number in the half for the last week in the previous month. |
| 15 | LAST_EOM_DATE_UNIT |  |  | Y | Date | Indicates the date of the last unit end of month cycle. |
| 16 | NEXT_EOM_DATE_UNIT |  |  | Y | Date | Indicates the date of the next unit end of month cycle. |
| 17 | LAST_EOW_DATE |  |  | Y | Date | Indicates the date of the last dollar end of week cycle. |
| 18 | LAST_EOW_DATE_UNIT |  |  | Y | Date | Indicates the date of the last unit end of week cycle. |
| 19 | NEXT_EOW_DATE_UNIT |  |  | Y | Date | Indicates the date of the next unit end of week cycle. |
| 20 | LAST_CONT_ORDER_DATE |  |  |  | Date | This column contains the last date on which the batch program cntrordb was run. It is used to ensure that orders are raised for all type B contract ready dates, regardless of whether cntrordb is run daily or not. |

---

## Table: TIMELINE

**Description:** This table contains one row for each timeline that can be defined within Oracle Retail. A timeline is used to create a series of dates (held on the TIMELINE_STEPS table) which can then be used to attach to an order to track certain dates (e.g., supplier confirmed receipt of order, on suppliers dock, received at dock, received at reconditioning center, etc.) to be assigned to facilitate tracking throughout the life cycle of the purchase order.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TIMELINE_KEY | P |  | Y | NUMERIC (6) | This unique sequence number is used to distinguish between different timelines. |
| 2 | TIMELINE_NO |  | F | Y | NUMERIC (6) | This field contains the number which uniquely identifies the timeline number to which the timeline step is attached to. |
| 3 | TIMELINE_TYPE |  | F | Y | VARCHAR (6) | This field will hold the module the timeline is referring to. Valid values are: PO - Purchase Orders at the Header Level POIT - Purchase Orders at the Item Level IT - Item Maintenance CE - Customs Entry LO - Logistics at the Header Level LOBL - Logistics at the Bill of Lading Level LOCO - Logistics at the Container Level LOPI - Logistics at the Purchase Order/Item Level LOCI - Logistics at the Commercial Invoice Level |
| 4 | KEY_VALUE_1 |  |  | Y | VARCHAR (30) | Alphanumeric value that identifies the module that the timeline is attached to. For example, if the module is Purchase Orders, then key_value_1 would be the Order number. |
| 5 | KEY_VALUE_2 |  |  |  | VARCHAR (30) | Alphanumeric value that identifies an item if the module the timeline is attached to is a Purchase Order at the item level. |
| 6 | BASE_DATE |  |  |  | Date | This field will hold the date that the timeline will be driven on. |
| 7 | STEP_NO |  | F | Y | NUMERIC (4) | This field contains the number which uniquely identifies the timeline step which will be attached to the corresponding order. |
| 8 | DISPLAY_SEQ |  |  |  | NUMERIC (4) | This field contains a number which will determine the display order of the steps. This will be directly copied from the DISPLAY_SEQ field on the TIMELINE_STEPS table. The reason this field must also be on this table is to actually put an Order By clause in an Oracle Form, the order by clause must be on the base table, which in this case would be the ORD_TIMELINE table. |
| 9 | ORIGINAL_DATE |  |  |  | Date | This field contains the initial date that the step is set to be completed. This field will be automatically populated within Oracle Retail by the date criteria setup from the TIMELINE_BASE field on the TIMELINE table and the DAYS_COMPLETED on the TIMELINE_STEPS table. It is also allowable to manually enter this field when attaching a timeline to an order. |
| 10 | REVISED_DATE |  |  |  | Date | This field contains the revised date that the step is set to be completed. This field can be manually entered by the user while maintaining the timeline. |
| 11 | ACTUAL_DATE |  |  |  | Date | This field contains the actual date that the step is completed on. The date will have to be manually entered by the user while maintaining the order. |
| 12 | REASON_CODE |  |  |  | VARCHAR (6) | This field contains the code which explains the original date vs. actual date variance for each timeline step. |
| 13 | COMMENT_DESC |  |  |  | VARCHAR (2000) | This field may contain a comment entered by the user while setting-up and maintaining the timeline on the order. |
| 14 | CREATE_DATETIME |  |  | Y | Date | Date/time stamp of when the record was created. This date/time will be used in export processing. This value should only be populated on insert - it should never be updated. |
| 15 | LAST_UPDATE_DATETIME |  |  | Y | Date | Holds the date time stamp of the most recent update by the last_update_id. This field is required by the database. |
| 16 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | Holds the Oracle user-id of the user who most recently updated this record. This field is required by the database. |
| 17 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_TIMELINE|PK||||TIMELINE_KEY|ASC|
|UK_TIMELINE|UK||||TIMELINE_NO|ASC|
||||||KEY_VALUE_1|ASC|
||||||KEY_VALUE_2|ASC|
||||||STEP_NO|ASC|
|TIMELINE_I1|||||TIMELINE_NO|ASC|
||||||STEP_NO|ASC|
||||||TIMELINE_TYPE|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_TIMELINE_TIMELINE_TYPE|timeline_type in ('PO', 'POIT', 'IT', 'CE', 'TR', 'TRBL',<br>'TRCO', 'TRPI', 'TRCI','TRPOBL')<br>|
|Column Level|TIMELINE_TYPE||

---

## Table: TIMELINE_HEAD

**Description:** This table contains one row for each timeline that can be defined within Oracle Retail. A timeline is used to create a series of dates (held on the TIMELINE_STEPS table) which can then be used to attach to an order to track certain dates (e.g., supplier confirmed receipt of order, on suppliers dock, received at dock, received at reconditioning center, etc.) to be assigned to facilitate tracking throughout the life cycle of the purchase order.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TIMELINE_NO | P |  | Y | NUMERIC (6) | This field contains a number that uniquely identifies the timeline. |
| 2 | TIMELINE_DESC |  |  | Y | VARCHAR (120) | This field contains the description of the timeline. |
| 3 | TIMELINE_TYPE |  |  | Y | VARCHAR (6) | This field will hold the module the timeline is referring to. Valid values are: PO - Purchase Orders at the Header Level POIT - Purchase Orders at the Item Level IT - Item Maintenance CE - Customs Entry LO - Logistics at the Header Level LOBL - Logistics at the Bill of Lading Level LOCO - Logistics at the Container Level LOPI - Logistics at the Purchase Order/Item Level LOCI - Logistics at the Commercial Invoice Level |
| 4 | TIMELINE_BASE |  |  |  | VARCHAR (3) | This field contains the basis for the timeline. The basis for the timeline will determine which date the timelines steps completion date is based on. Valid values for this field are: APD - based on the PO approval date NBD - based on the PO not before date NAD - based on the PO not after date WRD - based on then PO written date |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_TIMELINE_HEAD|PK||||TIMELINE_NO|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_TIME_HEAD_TIMELINE_BASE|TIMELINE_BASE IN ('APD', 'NBD', 'NAD', 'WRD')<br>|
||CHK_TIME_HEAD_TIMELINE_TYPE|timeline_type in ('PO', 'POIT', 'IT', 'CE', 'TR', 'TRBL',<br>'TRCO', 'TRPI', 'TRCI','TRPOBL')<br>|
|Column Level|TIMELINE_TYPE||
||TIMELINE_BASE||

---

## Table: TIMELINE_HEAD_TL

**Description:** This is the translation table for TIMELINE_HEAD table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | TIMELINE_NO | P | F | Y | NUMERIC (6) | This field contains a number that uniquely identifies the timeline. |
| 3 | TIMELINE_DESC |  |  | Y | VARCHAR (120) | This field contains the description of the timeline. |
| 4 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 6 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 7 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_TIMELINE_HEAD_TL|PK||||LANG|ASC|
||||||TIMELINE_NO|ASC|

---

## Table: TIMELINE_STEPS

**Description:** This table contains one row for each step defined within a timeline. A timeline step is a way of representing an occurrence in the Purchase Order process. Based on the timeline basis, the steps can be set-up to be completed by a specified completion date.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TIMELINE_NO | P | F | Y | NUMERIC (6) | This field contains the number that uniquely defines the timeline. |
| 2 | STEP_NO | P | F | Y | NUMERIC (4) | This field contains the number that uniquely defines the timeline step. |
| 3 | TIMELINE_TYPE | P | F | Y | VARCHAR (6) | This field will hold the module the timeline is referring to. Valid values are: PO - Purchase Orders at the Header Level POIT - Purchase Orders at the Item Level IT - Item Maintenance CE - Customs Entry LO - Logistics at the Header Level LOBL - Logistics at the Bill of Lading Level LOCO - Logistics at the Container Level LOPI - Logistics at the Purchase Order/Item Level LOCI - Logistics at the Commercial Invoice Level |
| 4 | DAYS_COMPLETED |  |  |  | NUMERIC (3) | This field contains the estimated number of days for this timeline step to be completed based on the TIMELINE_BASE field on the TIMELINE table. Note that if DAYS_COMPLETED is negative, it means the completed date is before the TIMELINE_BASE date. |
| 5 | DISPLAY_SEQ |  |  |  | NUMERIC (4) | This field contains a number which will determine the display order of the steps. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_TIMELINE_STEPS|PK||||TIMELINE_NO|ASC|
||||||STEP_NO|ASC|
||||||TIMELINE_TYPE|ASC|
|TIMELINE_STEPS_I1|||||TIMELINE_TYPE|ASC|
||||||STEP_NO|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_TIMELINE_STEPS_TLTYPE|TIMELINE_TYPE IN<br>('PO','POIT','IT','CE','TR', 'TRBL','TRCO','TRPI','TRCI','TRPOBL')<br>|






|Type|Column / Constraint Name|Details|
|---|---|---|
|Column Level|TIMELINE_TYPE||

---

## Table: TIMELINE_STEP_COMP

**Description:** This table is used to store defined timeline component steps. Predefined steps allow for greater reporting opportunities.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TIMELINE_TYPE | P |  | Y | VARCHAR (6) | This field will hold the module the timeline is referring to. Valid values are: PO - Purchase Orders at the Header Level POIT - Purchase Orders at the Item Level IT - Item Maintenance CE - Customs Entry LO - Logistics at the Header Level LOBL - Logistics at the Bill of Lading Level LOCO - Logistics at the Container Level LOPI - Logistics at the Purchase Order/Item Level LOCI - Logistics at the Commercial |
| 2 | STEP_NO | P |  | Y | NUMERIC (4) | This field contains the number that uniquely defines the timeline step. |
| 3 | STEP_DESC |  |  | Y | VARCHAR (120) | This field contains the description of the timeline step. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_TIMELINE_STEP_COMP|PK||||TIMELINE_TYPE|ASC|
||||||STEP_NO|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_TIMELINE_STEP_COMP_TLTYPE|TIMELINE_TYPE IN<br>('PO','POIT','IT','CE','TR','TRBL','TRCO','TRPI','TRCI','TRPOBL')<br>|
|Column Level|TIMELINE_TYPE||

---

## Table: TIMELINE_STEP_COMP_TL

**Description:** This is the translation table for TIMELINE_STEP_COMP table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | TIMELINE_TYPE | P | F | Y | VARCHAR (6) | This field will hold the module the timeline is referring to. Valid values are: PO - Purchase Orders at the Header Level POIT - Purchase Orders at the Item Level IT - Item Maintenance CE - Customs Entry LO - Logistics at the Header Level LOBL - Logistics at the Bill of Lading Level LOCO - Logistics at the Container Level LOPI - Logistics at the Purchase Order/Item Level LOCI - Logistics at the Commercial Invoice Level |
| 3 | STEP_NO | P | F | Y | NUMERIC (4) | This field contains the number that uniquely defines the timeline step. |
| 4 | STEP_DESC |  |  | Y | VARCHAR (120) | This field contains the description of the timeline step. |
| 5 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 6 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 7 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 8 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_TIMELINE_STEP_COMP_TL|PK||||LANG|ASC|
||||||TIMELINE_TYPE|ASC|
||||||STEP_NO|ASC|

---

## Table: TIMELINE_TEMP

**Description:** This table contains one row for each timeline that can be defined within Oracle Retail. A timeline is used to create a series of dates (held on the TIMELINE_STEPS table) which can then be used to attach to an order to track certain dates (e.g., supplier confirmed receipt of order, on suppliers dock, received at dock, received at reconditioning center, etc.) to be assigned to facilitate tracking throughout the life cycle of the purchase order.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TIMELINE_KEY | P |  | Y | NUMERIC (6) | This unique sequence number is used to distinguish between different timelines. |
| 2 | TIMELINE_NO |  |  | Y | NUMERIC (6) | This field contains the number which uniquely identifies the timeline number to which the timeline step is attached to. |
| 3 | TIMELINE_TYPE |  |  | Y | VARCHAR (6) | This field will hold the module the timeline is referring to. Valid values are: PO - Purchase Orders at the Header Level POIT - Purchase Orders at the Item Level IT - Item Maintenance CE - Customs Entry LO - Logistics at the Header Level LOBL - Logistics at the Bill of Lading Level LOCO - Logistics at the Container Level LOPI - Logistics at the Purchase Order/Item Level LOCI - Logistics at the Commercial Invoice Level |
| 4 | KEY_VALUE_1 |  |  | Y | VARCHAR (30) | This field will hold the identification number of the module that the timeline is attached to for example if the module is Purchase Orders, then key_value_1 would be the Order number. |
| 5 | KEY_VALUE_2 |  |  |  | VARCHAR (30) | This field will hold an Item number, if the module the timeline is attached to is a Purchase Order at the Item Level. |
| 6 | BASE_DATE |  |  |  | Date | This field will hold the date that the timeline will be driven on. |
| 7 | STEP_NO |  |  | Y | NUMERIC (4) | This field contains the number which uniquely identifies the timeline step which will be attached to the corresponding order. |
| 8 | DISPLAY_SEQ |  |  |  | NUMERIC (4) | This field contains a number which will determine the display order of the steps. This will be directly copied from the DISPLAY_SEQ field on the TIMELINE_STEPS table. The reason this field must also be on this table is to actually put an Order By clause in an Oracle Form, the order by clause must be on the base table, which in this case would be the ORD_TIMELINE table. |
| 9 | ORIGINAL_DATE |  |  |  | Date | This field contains the initial date that the step is set to be completed. This field will be automatically populated within Oracle Retail by the date criteria setup from the TIMELINE_BASE field on the TIMELINE table and the DAYS_COMPLETED on the TIMELINE_STEPS table. It is also allowable to manually enter this field when attaching a timeline to an order. |
| 10 | REVISED_DATE |  |  |  | Date | This field contains the revised date that the step is set to be completed. This field can be manually entered by the user while maintaining the timeline. |
| 11 | ACTUAL_DATE |  |  |  | Date | This field contains the actual date that the step is completed on. The date will have to be manually entered by the user while maintaining the order. |
| 12 | REASON_CODE |  |  |  | VARCHAR (6) | This field contains the code which explains the original date vs. actual date variance for each timeline step. |
| 13 | COMMENT_DESC |  |  |  | VARCHAR (2000) | This field may contain a comment entered by the user while setting-up and maintaining the timeline on the order. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_TIMELINE_TEMP|PK||||TIMELINE_KEY|ASC|
|UK_TIMELINE_TEMP|UK||||TIMELINE_NO|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
||||||KEY_VALUE_1|ASC|
||||||KEY_VALUE_2|ASC|
||||||STEP_NO|ASC|

---

## Table: TO_LOC_TEMP

**Description:** This table contains all to locations that will be inserted into the item up charge tables, or updated on the item up charge tables. This is a temporary table used only in the apply processing in the Item Up Charge form.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TO_LOC |  |  | Y | NUMERIC (10) | This field contains the location number of the location to which goods will be transferred. This field will contain a store, virtual warehouse, internal finisher or external finisher based on the TO_LOC_TYPE field. |
| 2 | TO_LOC_TYPE |  |  | Y | VARCHAR (1) | This field contains the type of location to which goods will be transferred. this column can contain either S for Store, W for Warehouse or Internal Finisher, or E for External Finisher. |

---

## Table: UI_CONFIG_OPTIONS

**Description:** This table contains parameters used to configure the user interface in RMS, such as date and time entry formats.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DATE_ENTRY |  |  | Y | VARCHAR (12) | his column specifies the format in which dates will be entered throughout the system. Example: 'MMDDRR'. |
| 2 | TIME_ENTRY |  |  | Y | VARCHAR (12) | Format mask used for entering time values within the system. |
| 3 | TIME_DISPLAY |  |  | Y | VARCHAR (12) | Format mask used throughout the system to display time values. |
| 4 | IMAGE_PATH |  |  |  | VARCHAR (255) | This holds path name for where images linked to items are stored. |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | Stores the Oracle username of the one who inserted the first record. This field is required by the database. |
| 6 | CREATE_DATETIME |  |  | Y | Date | The date and time of when the record was created in the table. This value should only be populated on insert - it should never be updated. |
| 7 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | The Oracle username of the one who most recently updated this record. |
| 8 | LAST_UPDATE_DATETIME |  |  | Y | Date | The date time stamp of the most recent update by the user. |
| 9 | MIN_QTY_PCT_DEC |  |  | Y | NUMERIC (1) | Holds the mininum decimal digits for quantity or percentage precision. The value should be between 0 and 4. |
| 10 | MAX_QTY_PCT_DEC |  |  | Y | NUMERIC (1) | Holds the maximum decimal digits for quantity or percentage precision. The value should be between 0 and 4. |
| 11 | NUM_HIST_EXCHANGE_RATE |  |  | Y | NUMERIC (2) | This field is used to control how many historical exchange rate is presented to the user in list of value while selecting the exchange rate. |
| 12 | DEFAULT_ITEM_IMAGE |  |  |  | VARCHAR (255) | This holds default image name for item image and will be displayed in reports when the Item image is not found in ITEM_IMAGE table. |
