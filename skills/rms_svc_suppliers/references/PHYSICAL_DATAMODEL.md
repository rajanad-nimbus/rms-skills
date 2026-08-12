# RMS Service Uploads - Suppliers & Procurement Datamodel - Physical Data Model Reference

## Table: SVC_BUYER

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in BUYER.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | BUYER |  |  |  | NUMERIC (4) | Contains the unique number identifying a person authorized to create purchase orders within the system. |
| 7 | BUYER_NAME |  |  |  | VARCHAR (120 ) | Contains the name of the authorized buyer. |
| 8 | BUYER_PHONE |  |  |  | VARCHAR (20 ) | Contains the current telephone number of the authorized buyer. |
| 9 | BUYER_FAX |  |  |  | VARCHAR (20 ) | Contains the current fax number of the authorized buyer. |
| 10 | CREATE_ID |  |  |  | VARCHAR (30 ) | This column holds the User id of the user who created the record. |
| 11 | CREATE_DATETIME |  |  |  | Date | This column holds the record creation date. |
| 12 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 13 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |
