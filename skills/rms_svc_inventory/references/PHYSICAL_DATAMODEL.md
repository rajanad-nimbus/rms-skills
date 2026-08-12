# RMS Service Uploads - Inventory & Transfers Datamodel - Physical Data Model Reference

## Table: SVC_INV_ADJ_REASON

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in INV_ADJ_REASON.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | REASON |  |  |  | NUMERIC (4) | Contains a number which uniquely identifies the reason for an inventory adjustment. |
| 7 | REASON_DESC |  |  |  | VARCHAR (120 ) | Contains a description of the inventory adjustment reason code. |
| 8 | COGS_IND |  |  |  | VARCHAR (1 ) | Indicates the inventory adjustment reason code is associated with COGS.If Y-inventory adjustment affect COGS and if N-inventory adjustment does not affect COGS. |
| 9 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 10 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 11 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 12 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_INV_ADJ_REASON_TL

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated to INV_ADJ_REASON_TL

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | LANG |  |  |  | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 7 | REASON |  |  |  | NUMERIC (4) | Contains the number which uniquely identifies the reason for the inventory adjustment. |
| 8 | REASON_DESC |  |  |  | VARCHAR (120 ) | Holds the description of the inventory adjustment reason code in a given language. |
| 9 | ORIG_LANG_IND |  |  |  | VARCHAR (1 ) | Indicates if the description is in the original language entered for the inventory status type. It is set to ''Y'' when the first record is written to the table for the inventory status types. |
| 10 | REVIEWED_IND |  |  |  | VARCHAR (1 ) | Indicates if the description needs to be reviewed for translation. It is set to ''N'' when the description in the original language is inserted or updated. We assume that clients will regularly run reports on all strings that are not reviewed (i.e. reviewed_ind = ''N''). When translation either provides a new string, or OKs that the existing string is correct, the reviewed_ind should be set to ''Y''. |

---

## Table: SVC_INV_STATUS_CODES_LANG_TL

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded to INV_STATUS_CODES_TL

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | LANG |  |  |  | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 7 | INV_STATUS_CODE |  |  |  | VARCHAR (10 ) | Contains a unique inventory status code. |
| 8 | INV_STATUS_CODE_DESC |  |  |  | VARCHAR (120 ) | Contains an inventory status code description for the inventory status code. |

---

## Table: SVC_INV_STATUS_CODES_TL

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in INV_STATUS_CODES and INV_STATUS_CODES_TL.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | INV_STATUS_CODE |  |  |  | VARCHAR (10 ) | Contains a unique inventory status code. |
| 7 | INV_STATUS |  |  |  | NUMERIC (2) | The inventory status type associated with this inventory status code. |
| 8 | INV_STATUS_CODE_DESC |  |  |  | VARCHAR (120 ) | Contains an inventory status code description for the inventory status code. |
| 9 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 10 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 11 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 12 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_INV_STATUS_TYPES_TL

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated to INV_STATUS_TYPES_TL

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | LANG |  |  |  | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 7 | INV_STATUS |  |  |  | NUMERIC (2) | Contains the number which uniquely identifies the inventory status types |
| 8 | INV_STATUS_DESC |  |  |  | VARCHAR (120 ) | Holds the description of the inventory status types in a given language. |
| 9 | ORIG_LANG_IND |  |  |  | VARCHAR (1 ) | Indicates if the description is in the original language entered for the inventory status type. It is set to ''Y'' when the first record is written to the table for the inventory status types. |
| 10 | REVIEWED_IND |  |  |  | VARCHAR (1 ) | Indicates if the description needs to be reviewed for translation. It is set to ''N'' when the description in the original language is inserted or updated. We assume that clients will regularly run reports on all strings that are not reviewed (i.e. reviewed_ind = ''N''). When translation either provides a new string, or OKs that the existing string is correct, the reviewed_ind should be set to ''Y''. |

---

## Table: SVC_INV_ST_TYPS_TL

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in INV_STATUS_TYPES and INV_STATUS_TYPES_TL.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | INV_STATUS |  |  |  | NUMERIC (2) | Contains a number which uniquely identifies an inventory status. |
| 7 | INV_STATUS_DESC |  |  |  | VARCHAR (120 ) | Contains an inventory status description for the inventory status number. |
| 8 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 9 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 10 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 11 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_TSF_ENTITY

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in TSF_ENTITY.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | TSF_ENTITY_ID |  |  |  | NUMERIC (10) | This field contains the number which uniquely identifies the transfer entity. |
| 7 | TSF_ENTITY_DESC |  |  |  | VARCHAR (120 ) | This field contains the name of the transfer entity. |
| 8 | SECONDARY_DESC |  |  |  | VARCHAR (120 ) | This column contains the secondary description of the transfer entity. |
| 9 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 10 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 11 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 12 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_TSF_ENTITY_ORG_UNIT_SOB

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in TSF_ENTITY_ORG_UNIT_SOB.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | TSF_ENTITY_ID |  |  |  | NUMERIC (10) | This field contains the number which uniquely identifies a transfer entity. |
| 7 | ORG_UNIT_ID |  |  |  | NUMERIC (15) | This field contains the number which uniquely identifies a org unit. |
| 8 | SET_OF_BOOKS_ID |  |  |  | NUMERIC (15) | This field contains the number which uniquley identifies a set of books.One set of books can be shared among multiple transfer entities and org units however each transfer entity and org unit can be associated with only one set of books. |
| 9 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 10 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 11 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 12 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_TSF_ENTITY_TL

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in TSF_ENTITY_TL.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | LANG |  |  |  | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 7 | TSF_ENTITY_ID |  |  |  | NUMERIC (10) | This field contains the number which uniquely identifies the transfer entity. |
| 8 | TSF_ENTITY_DESC |  |  |  | VARCHAR (120) | This field contains the name of the transfer entity. |
