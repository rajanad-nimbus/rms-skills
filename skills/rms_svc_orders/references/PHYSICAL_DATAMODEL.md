# RMS Service Uploads - Orders & Procurement Datamodel - Physical Data Model Reference

## Table: SVC_PO_DEL

**Description:** This is a temporary table for PO Induction module which is used to track PO numbers that are candidates for record deletion from child staging tables.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ORDER_NO |  |  |  | NUMERIC (12) | Contains the number that uniquely identifies an order within the system. |
| 2 | ITEM |  |  |  | VARCHAR (25 BYTE) | Unique alphanumeric value that identifies the item. |
| 3 | PACK |  |  |  | VARCHAR (25 BYTE) | Alphanumeric value that uniquely identifies the pack. |
| 4 | LOCATION |  |  |  | NUMERIC (10) | This field contains the location that item will be ordered to. This field may contain a store or a warehouse. |
| 5 | HTS |  |  |  | VARCHAR (25 BYTE) | The identifier for the Harmonized Tariff Schedule code. |
| 6 | SVC_TBL_NAME |  |  |  | VARCHAR (128 BYTE) | This field contains the staging table names for PO Induction. They are considered parent staging tables to identify which succeeding child staging tables will be eligible for record deletion. |

---

## Table: SVC_PO_INDUCT_CONFIG

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in PO_INDUCT_CONFIG.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | MAX_FILE_SIZE_FOR_SYNC_UPLD |  |  |  | NUMERIC (10) | Maximum file size that can be uploaded in synchronous fashion. Beyond this threshold the process is submitted as an asynchronous process. |
| 7 | MAX_FILE_SIZE_FOR_UPLD |  |  |  | NUMERIC (10) | Maximum file size that can be uploaded. |
| 8 | MAX_PO_FOR_SYNC_DNLD |  |  |  | NUMERIC (10) | Maximum number of PO that can be downloaded using spreadsheet in synchronous fashion. Beyond this threshold the process is submitted as an asynchronous process. |
| 9 | MAX_PO_FOR_DNLD |  |  |  | NUMERIC (10) | Maximum number of PO that can be downloaded using spreadsheet. |
| 10 | CREATE_ID |  |  |  | VARCHAR (30) | User who created the record. |
| 11 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 12 | LAST_UPD_ID |  |  |  | VARCHAR (30) | User who last updated the record. |
| 13 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_PO_SEARCH_TEMP

**Description:** This table is used to temporarily store searched orders (based on user criteria) that are required for creation of spreadsheet containing data for these orders. Once the spreadsheet is created, the data is deleted from this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID |  |  | Y | NUMERIC (10) | The unique process id for which this order needs to be processed. |
| 2 | ORDER_NO |  |  | Y | NUMERIC (12) | The searched order that needs to be processed for this process id. |

---

## Table: SVC_PO_TYPE

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in PO_TYPE.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | PO_TYPE_DESC |  |  |  | VARCHAR (120) | This field contains a description for the specific order type. |
| 7 | PO_TYPE |  |  |  | VARCHAR (4) | This field contains the unique identifier for the order type. |
| 8 | CREATE_ID |  |  |  | VARCHAR (30) | User who created the record. |
| 9 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 10 | LAST_UPD_ID |  |  |  | VARCHAR (30) | User who last updated the record. |
| 11 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_PO_TYPE_TL

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in PO_TYPE_TL.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | PO_TYPE_DESC |  |  |  | VARCHAR (120) | This field contains a description for the specific order type. |
| 7 | PO_TYPE |  |  |  | VARCHAR (4) | This field contains the unique identifier for the order type. |
| 8 | LANG |  |  |  | NUMERIC (6) | This field contains valid Language for the specific order type. |
| 9 | CREATE_ID |  |  |  | VARCHAR (30) | User who created the record. |
| 10 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 11 | LAST_UPD_ID |  |  |  | VARCHAR (30) | User who last updated the record. |
| 12 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |
