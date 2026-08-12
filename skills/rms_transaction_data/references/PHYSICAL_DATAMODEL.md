# RMS Transaction Data & Financial Postings Datamodel - Physical Data Model Reference

## Table: IF_TRAN_DATA

**Description:** This table is a staging table for financial interface and mirrors tran_data.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  |  |  | VARCHAR (25) | Unique identifier for the item. |
| 2 | DEPT |  |  | Y | NUMERIC (4) | Department number associated with the SKU. |
| 3 | CLASS |  |  | Y | NUMERIC (4) | Class number associated with the SKU. |
| 4 | SUBCLASS |  |  | Y | NUMERIC (4) | Subclass number associated with the SKU. |
| 5 | PACK_IND |  |  |  | VARCHAR (1) | Indicates whether or not the item is a pack item. |
| 6 | LOC_TYPE |  |  | Y | VARCHAR (1) | This field contains Location Type. Valid Values are : S = Store, W = Warehouse, E = External Finisher |
| 7 | LOCATION |  |  | Y | NUMERIC (10) | This field contains the Store if Loc_type = S, the Warehouse or Internal Finisher if Loc_type = W, the External Finisher if Loc_type = E. |
| 8 | TRAN_DATE |  |  | Y | Date | Identifies the location for the transaction if the record is associated with a warehouse level event. If the record corresponds to a store, this field will contain a -1. |
| 9 | TRAN_CODE |  |  | Y | NUMERIC (4) | Identifies the transaction type. Valid values are same as in tran_data. |
| 10 | ADJ_CODE |  |  |  | VARCHAR (1) | This field indicates the type of adjustment for which this record is written to correct a previous error. Valid values are: C- Cost adjustment, R - Retail adjustment, U - Unit adjustment |
| 11 | UNITS |  |  | Y | NUMERIC (12,4) | The number of units involved in the transaction. |
| 12 | TOTAL_COST |  |  |  | NUMERIC (20,4) | The number of units involved in the transaction. |
| 13 | TOTAL_RETAIL |  |  |  | NUMERIC (20,4) | Contains the total cost associated with the transaction. This field is stored in the local currency. |
| 14 | REF_NO_1 |  |  |  | NUMERIC (12) | Reference number associated with the transaction. For example, this field would contain the order number for a transaction type of 20 related to purchase orders. |
| 15 | REF_NO_2 |  |  |  | NUMERIC (12) | Reference number associated with the transaction. The value could be an order number, an Advance Shipment Notification identifying number, a promotion number, etc. |
| 16 | GL_REF_NO |  |  |  | VARCHAR (25) | Contains the reference number associated with transactions, and is used for defining the General Ledger account relationship, along with dept, class, subclass, location and tran code, etc.. If tran code is 22 or 23 then this field contains Inventory Adj Reason Code.. |
| 17 | OLD_UNIT_RETAIL |  |  |  | NUMERIC (20,4) | Contains the old unit retail before the change for transaction types 11 to 16. Otherwise, this field will be empty. This field is stored in the local currency. |
| 18 | NEW_UNIT_RETAIL |  |  |  | NUMERIC (20,4) | Contains the new unit retail after the change for transaction types 11 to 16. Otherwise, this field will be empty. This field is stored in the local currency. |
| 19 | PGM_NAME |  |  | Y | VARCHAR (100) | Identifies the Oracle Retail module where the record was written. |
| 20 | SALES_TYPE |  |  |  | VARCHAR (1) | This field will contain the type of sale for SKU. Valid values are Regular, Clearance, and Promotion. This field will only contain a value for records with a tran_type = 1. |
| 21 | VAT_RATE |  |  |  | NUMERIC (12,4) | This field will contain the vat_rate at the selling store. This field will only contain a value for records with a tran_type = 1. |
| 22 | AV_COST |  |  |  | NUMERIC (20,4) | This field will contain the average cost for the SKU from the SKU/Location table. This file will only contain a value for records with a tran_type = 1. This field will be held in the local currency. |
| 23 | REF_PACK_NO |  |  |  | VARCHAR (25) | sed to store pack for a transaction items. |
| 24 | TRAN_DATA_TIMESTAMP |  |  |  | Date | will contain the date with timestamp of the transaction |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|IF_TRAN_DATA_I3|||||TRAN_DATE|ASC|
||||||DEPT|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|IF_TRAN_DATA_I1|||||DEPT|ASC|
||||||CLASS|ASC|
||||||SUBCLASS|ASC|
||||||TRAN_DATE|ASC|

---

## Table: IF_TRAN_DATA_TEMP

**Description:** Temporary table used by AIP RETL extract scripts. Contains locations that had transactions for the current day.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LOC_TYPE |  |  | Y | VARCHAR (1) | Type of location in the location field. Valid values are S (store) and W (warehouse). |
| 2 | LOCATION |  |  | Y | NUMERIC (10) | Contains locations that had transactions for the current day. Used by AIP RETL extract scripts. |

---

## Table: TRAN_DATA_A

**Description:** This table holds the stock ledger financial transaction data that are generated throughout on-line day as well as from batch processes which affect the stock ledger. Each night, all transactions on the transaction data (tran_data_a or tran_data_b) table are added to transaction data history (tran_data_history) table and transaction data (tran_data_a or tran_data_b) table is then truncated. Tran_data_A and tran_data_B tables are view only tables and exactly the same in structure. The reason behind having two different tables is when one of the tables are locked during data upload to tran_data_history table, the other table is still open to write transactions.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  |  |  | VARCHAR (25) | This field contains unique alphanumeric identifier for the item on the transaction. |
| 2 | DEPT |  | F | Y | NUMERIC (4) | This field contains the Department number associated with the item for which transaction records are posted. |
| 3 | CLASS |  | F | Y | NUMERIC (4) | This field contains the Class number associated with the item for which transaction records are posted. |
| 4 | SUBCLASS |  | F | Y | NUMERIC (4) | This field contains the Subclass number associated with the item for which transaction records are posted. |
| 5 | PACK_IND |  |  |  | VARCHAR (1) | This field indicates whether or not the item is a pack item. Since transaction data records are not posted for pack items, this field is not used anymore and is defaulted to either NULL or N. |
| 6 | LOC_TYPE |  |  | Y | VARCHAR (1) | This field contains type of the location for which the transaction is posted. Valid Values are : S = Store, W = Warehouse, E = External Finisher. |
| 7 | LOCATION |  |  | Y | NUMERIC (10) | This field contains the unique identifier for the location for which the transaction is posted. The location will be a store if Location type is S, a Warehouse or Internal Finisher if Location type is W and a External Finisher if Location type is E. |
| 8 | TRAN_DATE |  |  | Y | Date | This field contains the date at which the transaction record was recorded into the transaction data table. |
| 9 | TRAN_CODE |  | F | Y | NUMERIC (4) | This field contains the unique numerical code to identify different transaction types. |
| 10 | ADJ_CODE |  |  |  | VARCHAR (1) | This field indicates the type of adjustment for which this record is written to correct a previous error. Valid values are: C- Cost adjustment U - Unit adjustment A - ALC (Actual Landed Cost) adjustment |
| 11 | UNITS |  |  | Y | NUMERIC (12,4) | This field contains the number of units of the item involved in the transaction. |
| 12 | TOTAL_COST |  |  |  | NUMERIC (20,4) | This field contains the total cost associated of the transaction in the local currency of the location where the transaction took place. |
| 13 | TOTAL_RETAIL |  |  |  | NUMERIC (20,4) | This field contains the total retail value of the transaction in the local currency of the location where the transaction took place. |
| 14 | REF_NO_1 |  |  |  | NUMERIC (12) | This field contains the Reference number associated with the transaction. The reference number can be used for identifying related transactions or reporting purposes, etc. For example, this field would contain the order number for a transaction type of 20 related to purchase orders. |
| 15 | REF_NO_2 |  |  |  | NUMERIC (12) | This field contains the Reference number associated with the transaction. The reference number can be used for identifying related transactions or reporting purposes, etc. For example, The value could be an order number, an Advance Shipment Notification identifying number, a promotion number, etc. |
| 16 | GL_REF_NO |  |  |  | VARCHAR (25) | This field contains the reference number associated with a transaction. It is used for defining the General Ledger account relationship along with dept, class, subclass, location, and tran_code, etc. For example: if tran_code is 22 or 23, then this field contains an Inventory Adjustment Reason Code; if tran_code is 37 or 38, then this field contains From_loc or To_loc for the Intercompany Transfer; if tran_code is 63 or 64, then this field contains Work Order Activity ID; if tran_code is 87 or 88, then this field contains the VAT code associated with the transaction. |
| 17 | OLD_UNIT_RETAIL |  |  |  | NUMERIC (20,4) | This field contains the old unit retail of the item before the change taking place becuase of markup or mardown activities, recorded in the transaction types 11 to 16. This field is populated only for these transaction codes, otherwise, it will remain empty. This field is stored in the local currency. |
| 18 | NEW_UNIT_RETAIL |  |  |  | NUMERIC (20,4) | This field contains the new unit retail of the item because of the change in the original retail. The change in the original retail takes place becuase of markup or mardown activities and recorded in the transaction types 11 to 16. This field is populated only for these transaction codes, otherwise, it will remain empty. This field is stored in the local currency. |
| 19 | PGM_NAME |  |  | Y | VARCHAR (100) | This field identifies the Oracle Retail module which inserted the record into the transaction data table. |
| 20 | SALES_TYPE |  |  |  | VARCHAR (1) | This field contains the type of sale for an item. Valid values are Regular, Clearance, and Promotion. This field will only contain a value for Net Sales transaction records (transaction code - 1). |
| 21 | VAT_RATE |  |  |  | NUMERIC (12,4) | This field contains the Vat rate at the selling store and recorded only for Net Sales transaction records (transaction code -1). For other transaction records, it remains empty. |
| 22 | AV_COST |  |  |  | NUMERIC (20,4) | This field contains the average cost for the item from the SKU/Location table only for the Net Sales transaction record (transaction code - 1) and held in the local currency of the location. |
| 23 | TIMESTAMP |  |  | Y | Date | This field contains the time at which the transaction record was recorded into the transaction data table. |
| 24 | REF_PACK_NO |  |  |  | VARCHAR (25) | This field is used to store pack number for transaction items if it was part of a pack. |
| 25 | TOTAL_COST_EXCL_ELC |  |  |  | NUMERIC (20,4) | This field contains the transaction cost exclusive of Estimate Landed Cost for the Purchases transaction (Transaction Code - 20). |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|TRAN_DATA_A_I2|||||TRAN_DATE|ASC|
|TRAN_DATA_A_I3|||||TRAN_CODE|ASC|
|TRAN_DATA_A_I1|||||DEPT|ASC|
||||||CLASS|ASC|
||||||SUBCLASS|ASC|
|TRAN_DATA_A_I4|||||TRAN_DATE|ASC|
||||||TRAN_CODE|ASC|
||||||ITEM|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_TRAN_DATA_A_ADJ_CODE|ADJ_CODE IN ('C', 'U', 'A')<br>|
||CHK_TRAN_DATA_A_PACK_IND|PACK_IND in ('Y', 'N')<br>|
||CHK_TRAN_DATA_A_SALES_TYPE|sales_type in ('R', 'C', 'P')<br>|
|Column Level|PACK_IND||
||ADJ_CODE||
||SALES_TYPE||

---

## Table: TRAN_DATA_B

**Description:** This table holds the stock ledger financial transaction data that are generated throughout on-line day as well as from batch processes which affect the stock ledger. Each night, all transactions on the transaction data (tran_data_a or tran_data_b) table are added to transaction data history (tran_data_history) table and transaction data (tran_data_a or tran_data_b) table is then truncated. Tran_data_A and tran_data_B tables are view only tables and exactly the same in structure. The reason behind having two different tables is when one of the tables are locked during data upload to tran_data_history table, the other table is still open to write transactions.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  |  |  | VARCHAR (25) | This field contains unique alphanumeric identifier for the item on the transaction. |
| 2 | DEPT |  | F | Y | NUMERIC (4) | This field contains the Department number associated with the item for which transaction records are posted. |
| 3 | CLASS |  | F | Y | NUMERIC (4) | This field contains the Class number associated with the item for which transaction records are posted. |
| 4 | SUBCLASS |  | F | Y | NUMERIC (4) | This field contains the subclass number associated with the item for which transaction records are posted. |
| 5 | PACK_IND |  |  |  | VARCHAR (1) | This field indicates whether or not the item is a pack item. Since transaction data records are not posted for pack items, this field is not used anymore and is defaulted to either NULL or N. |
| 6 | LOC_TYPE |  |  | Y | VARCHAR (1) | This field contains type of the location for which the transaction is posted. Valid Values are : S = Store, W = Warehouse, E = External Finisher. |
| 7 | LOCATION |  |  | Y | NUMERIC (10) | This field contains the unique identifier for the location for which the transaction is posted. The location will be a store if Location type is S, a Warehouse or Internal Finisher if Location type is W and a External Finisher if Location type is E. |
| 8 | TRAN_DATE |  |  | Y | Date | This field contains the date at which the transaction record was recorded into the transaction data table. |
| 9 | TRAN_CODE |  | F | Y | NUMERIC (4) | This field contains the unique numerical code to identify different transaction types. |
| 10 | ADJ_CODE |  |  |  | VARCHAR (1) | This field indicates the type of adjustment for which this record is written to correct a previous error. Valid values are: C- Cost adjustment U - Unit adjustment A - ALC (Actual Landed Cost) adjustment |
| 11 | UNITS |  |  | Y | NUMERIC (12,4) | This field contains the number of units of the item involved in the transaction. |
| 12 | TOTAL_COST |  |  |  | NUMERIC (20,4) | This field contains the total cost associated of the transaction in the local currency of the location where the transaction took place. |
| 13 | TOTAL_RETAIL |  |  |  | NUMERIC (20,4) | This field contains the total retail value of the transaction in the local currency of the location where the transaction took place. |
| 14 | REF_NO_1 |  |  |  | NUMERIC (12) | This field contains the Reference number associated with the transaction. The reference number can be used for indentifying related transactions or reporting purposes, etc. For example, this field would contain the order number for a transaction type of 20 related to purchase orders. |
| 15 | REF_NO_2 |  |  |  | NUMERIC (12) | This field contains the Reference number associated with the transaction. The reference number can be used for indentifying related transactions or reporting purposes, etc. For example, The value could be an order number, an Advance Shipment Notification identifying number, a promotion number, etc. |
| 16 | GL_REF_NO |  |  |  | VARCHAR (25) | This field contains the reference number associated with a transaction. It is used for defining the General Ledger account relationship along with dept, class, subclass, location, and tran_code, etc. For example: if tran_code is 22 or 23, then this field contains an Inventory Adjustment Reason Code; if tran_code is 37 or 38, then this field contains From_loc or To_loc for the Intercompany Transfer; if tran_code is 63 or 64, then this field contains Work Order Activity ID; if tran_code is 87 or 88, then this field contains the VAT code associated with the transaction. |
| 17 | OLD_UNIT_RETAIL |  |  |  | NUMERIC (20,4) | This field contains the old unit retail of the item before the change taking place becuase of markup or mardown activities, recorded in the transaction types 11 to 16. This field is populated only for these transaction codes, otherwise, it will remain empty. This field is stored in the local currency. |
| 18 | NEW_UNIT_RETAIL |  |  |  | NUMERIC (20,4) | This field contains the new unit retail of the item because of the change in the original retail. The change in the original retail takes place becuase of markup or mardown activities and recorded in the transaction types 11 to 16. This field is populated only for these transaction codes, otherwise, it will remain empty. This field is stored in the local currency. |
| 19 | PGM_NAME |  |  | Y | VARCHAR (100) | This field identifies the Oracle Retail module which inserted the record into the transaction data table. |
| 20 | SALES_TYPE |  |  |  | VARCHAR (1) | This field contains the type of sale for an item. Valid values are Regular, Clearance, and Promotion. This field will only contain a value for Net Sales transaction records (transaction code - 1). |
| 21 | VAT_RATE |  |  |  | NUMERIC (12,4) | This field contains the Vat rate at the selling store and recorded only for Net Sales transaction records (transaction code -1). For other trnasaction records, it remains empty. |
| 22 | AV_COST |  |  |  | NUMERIC (20,4) | This field contains the average cost for the item from the SKU/Location table only for the Net Sales transaction record (transaction code - 1) and held in the local currency of the location. |
| 23 | TIMESTAMP |  |  | Y | Date | This field contains the time at which the transaction record was recorded into the transaction data table. |
| 24 | REF_PACK_NO |  |  |  | VARCHAR (25) | This field is used to store pack number for transaction items if it was part of a pack. |
| 25 | TOTAL_COST_EXCL_ELC |  |  |  | NUMERIC (20,4) | This field contains the transaction cost exclusive of Estimate Landed Cost for the Purchases transaction (Transaction Code - 20). |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|TRAN_DATA_B_I3|||||TRAN_CODE|ASC|
|TRAN_DATA_B_I2|||||TRAN_DATE|ASC|
|TRAN_DATA_B_I1|||||DEPT|ASC|
||||||CLASS|ASC|
||||||SUBCLASS|ASC|
|TRAN_DATA_B_I4|||||TRAN_DATE|ASC|
||||||TRAN_CODE|ASC|
||||||ITEM|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_TRAN_DATA_B_ADJ_CODE|ADJ_CODE IN ('C', 'U', 'A')<br>|
||CHK_TRAN_DATA_B_PACK_IND|PACK_IND in ('Y', 'N')<br>|
||CHK_TRAN_DATA_B_SALES_TYPE|sales_type in ('R', 'C', 'P')<br>|
|Column Level|PACK_IND||
||ADJ_CODE||
||SALES_TYPE||

---

## Table: TRAN_DATA_CODES

**Description:** This table holds unique numeric values identifying different transactions posted in the transaction data tables. These values are used in the transaction code (tran_code) field on the transaction data (tran_data) table. This table is populated during installation of the system and must be maintained by the database administrator.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | CODE | P |  | Y | NUMERIC (4) | This field contains the code that uniquely identifies the transaction type. |
| 2 | DECODE |  |  | Y | VARCHAR (250) | This field contains the text description for the associated code. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_TRAN_DATA_CODES|PK||||CODE|ASC|

---

## Table: TRAN_DATA_CODES_REF

**Description:** This table is used to define the values for reference fields (REF_NO_1, REF_NO_2 and GL_REF_NO) used in transaction data (tran_data) table for the transaction code and Program name (TRAN_CODE/PGM_NAME) combination. This table is populated during installation of the system and must be maintained by the database administrator.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TRAN_CODE | P |  | Y | NUMERIC (4) | This field contains the tran code that uniquely identifies the transaction entered in the tran_data table. |
| 2 | PGM_NAME | P |  | Y | VARCHAR (100) | This field identifies the Oracle Retail module which inserted the record into the transaction data table. |
| 3 | REF_NO_1_DESC |  |  |  | VARCHAR (120) | This field contains a description of what is contained in the REF_NO_1 field on TRAN_DATA for the specified TRAN_CODE/PGM_NAME combination. |
| 4 | REF_NO_2_DESC |  |  |  | VARCHAR (120) | This field contains a description of what is contained in the REF_NO_2 field on TRAN_DATA for the specified TRAN_CODE/PGM_NAME combination. |
| 5 | GL_REF_NO_DESC |  |  |  | VARCHAR (30) | This field contains a description of what is contained in the GL_REF_NO field on TRAN_DATA for the specified TRAN_CODE/PGM_NAME combination. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_TRAN_DATA_CODES_REF|PK||||TRAN_CODE|ASC|
||||||PGM_NAME|ASC|

---

## Table: TRAN_DATA_CODES_REF_TL

**Description:** This is the translation table for TRAN_DATA_CODES_REF table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | TRAN_CODE | P | F | Y | NUMERIC (4) | This field contains the tran code that uniquely identifies the transaction entered in the tran_data table. |
| 3 | PGM_NAME | P | F | Y | VARCHAR (100) | This field identifies the Oracle Retail module which inserted the record into the transaction data table. |
| 4 | REF_NO_1_DESC |  |  |  | VARCHAR (120) | This field contains a description of what is contained in the REF_NO_1 field on TRAN_DATA for the specified TRAN_CODE/PGM_NAME combination. |
| 5 | REF_NO_2_DESC |  |  |  | VARCHAR (120) | This field contains a description of what is contained in the REF_NO_2 field on TRAN_DATA for the specified TRAN_CODE/PGM_NAME combination. |
| 6 | GL_REF_NO_DESC |  |  |  | VARCHAR (30) | This field contains a description of what is contained in the GL_REF_NO field on TRAN_DATA for the specified TRAN_CODE/PGM_NAME combination. |
| 7 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 8 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 9 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 10 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_TRAN_DATA_CODES_REF_TL|PK||||LANG|ASC|
||||||TRAN_CODE|ASC|
||||||PGM_NAME|ASC|

---

## Table: TRAN_DATA_CODES_TL

**Description:** This is the translation table for TRAN_DATA_CODES table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | CODE | P | F | Y | NUMERIC (4) | This field contains the code that uniquely identifies the transaction type. |
| 3 | DECODE |  |  | Y | VARCHAR (250) | This field contains the text description for the associated code. |
| 4 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 6 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 7 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_TRAN_DATA_CODES_TL|PK||||LANG|ASC|
||||||CODE|ASC|

---

## Table: TRAN_DATA_HISTORY

**Description:** PARTITIONED BY RANGE(POST_DATE)

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  |  |  | VARCHAR (25) | This field contains unique alphanumeric identifier for the item on the transaction. |
| 2 | DEPT |  | F | Y | NUMERIC (4) | This field contains the Department number associated with the item for which transaction records are posted. |
| 3 | CLASS |  | F | Y | NUMERIC (4) | This field contains the Class number associated with the item for which transaction records are posted. |
| 4 | SUBCLASS |  | F | Y | NUMERIC (4) | This field contains the subclass number associated with the item for which transaction records are posted. |
| 5 | PACK_IND |  |  |  | VARCHAR (1) | This field indicates whether or not the item is a pack item. Since transaction data records are not posted for pack items, this field is not used anymore and is defaulted to either NULL or N. |
| 6 | LOC_TYPE |  |  | Y | VARCHAR (1) | This field contains type of the location for which the transaction is posted. Valid Values are : S = Store, W = Warehouse, E = External Finisher. |
| 7 | LOCATION |  |  | Y | NUMERIC (10) | This field contains the unique identifier for the location for which the transaction is posted. The location will be a store if Location type is S, a Warehouse or Internal Finisher if Location type is W and a External Finisher if Location type is E. |
| 8 | TRAN_DATE |  |  | Y | Date | This field contains the date at which the transaction record was recorded into the transaction data table. |
| 9 | POST_DATE |  |  | Y | Date | This field contains the date corresponding to the daily_data.data_date for which this transaction is updated. Normally this date is equal to tran_date. If this date is different from tran_date, this signifies that the transaction is a late transaction, i.e. polled into stock ledger after the month it belongs to has been closed. |
| 10 | TRAN_CODE |  | F | Y | NUMERIC (4) | This field contains the unique numerical code to identify different transaction types. |
| 11 | ADJ_CODE |  |  |  | VARCHAR (1) | This field indicates the type of adjustment for which this record is written to correct a previous error. Valid values are: C- Cost adjustment A- ALC adjustment U - Unit adjustment |
| 12 | UNITS |  |  | Y | NUMERIC (12,4) | This field contains the number of units of the item involved in the transaction. |
| 13 | TOTAL_COST |  |  |  | NUMERIC (20,4) | This field contains the total cost associated of the transaction in the local currency of the location where the transaction took place. |
| 14 | TOTAL_RETAIL |  |  |  | NUMERIC (20,4) | This field contains the total retail value of the transaction in the local currency of the location where the transaction took place. |
| 15 | REF_NO_1 |  |  |  | NUMERIC (12) | This field contains the Reference number associated with the transaction. The reference number can be used for indentifying related transactions or reporting purposes, etc. For example, this field would contain the order number for a transaction type of 20 related to purchase orders. |
| 16 | REF_NO_2 |  |  |  | NUMERIC (12) | This field contains the Reference number associated with the transaction. The reference number can be used for indentifying related transactions or reporting purposes, etc. For example, The value could be an order number, an Advance Shipment Notification identifying number, a promotion number, etc. |
| 17 | GL_REF_NO |  |  |  | VARCHAR (25) | This field contains the reference number associated with transactions, and is used for defining the General Ledger account relationship, along with dept, class, subclass, and location, etc. For example: If tran code is 22 or 23 then this field contains Inventory Adj Reason Code. If tran code is 37 or 38 then this field contains From_loc or To_loc for the Intercompany Transfer. If tran code is 63 or 64 then this field contains Work Order Activity ID and so on. |
| 18 | OLD_UNIT_RETAIL |  |  |  | NUMERIC (20,4) | This field contains the old unit retail of the item before the change taking place becuase of markup or mardown activities, recorded in the transaction types 11 to 16. This field is populated only for these transaction codes, otherwise, it will remain empty. This field is stored in the local currency. |
| 19 | NEW_UNIT_RETAIL |  |  |  | NUMERIC (20,4) | This field contains the new unit retail of the item because of the change in the original retail. The change in the original retail takes place becuase of markup or mardown activities and recorded in the transaction types 11 to 16. This field is populated only for these transaction codes, otherwise, it will remain empty. This field is stored in the local currency. |
| 20 | PGM_NAME |  |  | Y | VARCHAR (100) | This field identifies the Oracle Retail module which inserted the record into the transaction data table. |
| 21 | SALES_TYPE |  |  |  | VARCHAR (1) | This field contains the type of sale for an item. Valid values are Regular, Clearance, and Promotion. This field will only contain a value for Net Sales transaction records (transaction code - 1). |
| 22 | VAT_RATE |  |  |  | NUMERIC (12,4) | This field contains the Vat rate at the selling store and recorded only for Net Sales transaction records (transaction code -1). For other trnasaction records, it remains empty. |
| 23 | AV_COST |  |  |  | NUMERIC (20,4) | This field contains the average cost for the item from the SKU/Location table only for the Net Sales transaction record (transaction code - 1) and held in the local currency of the location. |
| 24 | REF_PACK_NO |  |  |  | VARCHAR (25) | This field is used to store pack number for transaction items if it was part of a pack. |
| 25 | IFTD_ROWID |  |  |  | ROWID | This field contains the row id of each record from if_tran_data table which will be used to drill back the records processed by fifgldn1.pc batch program. |
| 26 | TRAN_DATA_TIMESTAMP |  |  |  | Date | This field contains the time at which the transaction record was recorded into the transaction data table. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|TRAN_DATA_HISTORY_I1|||||DEPT|ASC|
||||||CLASS|ASC|
||||||SUBCLASS|ASC|
|TRAN_DATA_HISTORY_I2|||||TRAN_CODE|ASC|
|TRAN_DATA_HISTORY_I4|||||DEPT|ASC|
||||||LOCATION|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
||||||TRAN_CODE|ASC|
||||||POST_DATE|ASC|
|TRAN_DATA_HISTORY_I3|||||TRAN_DATE|ASC|

### Constraints

|Type|Column / Constraint Name|Details|Col4|
|---|---|---|---|
|Table<br>Level|CHK_TRAN_DATA_HISTORY_PACK_IND|PACK_IND in ('Y', 'N')<br>|PACK_IND in ('Y', 'N')<br>|
||CHK_TRAN_DATA_HISTORY_SALES_TY|SALES_TYPE IN ('R','P','C')<br>|SALES_TYPE IN ('R','P','C')<br>|
||CHK_TRAN_DATA_HIST_ADJ_CODE|ADJ_CODE IN ('C', 'A', 'U')|ADJ_CODE IN ('C', 'A', 'U')|
|Column<br>Level|PACK_IND|||
|Column<br>Level|PACK_IND|Value List|Value List|
|Column<br>Level|PACK_IND|Value|Description|
|Column<br>Level|PACK_IND|'N'||
|Column<br>Level|PACK_IND|'Y'||
||ADJ_CODE|||
||ADJ_CODE|Value List|Value List|
||ADJ_CODE|Value|Description|
||ADJ_CODE|'A'||
||ADJ_CODE|'C'||
||ADJ_CODE|'U'||
||SALES_TYPE|||
||SALES_TYPE|Value List|Value List|
||SALES_TYPE|Value|Description|
||SALES_TYPE|'C'||
||SALES_TYPE|'P'||






|Type|Column / Constraint Name|Details|Col4|
|---|---|---|---|
|||'R'||
