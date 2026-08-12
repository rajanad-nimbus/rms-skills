# RMS Service Uploads - Organization & Store Datamodel - Physical Data Model Reference

## Table: SVC_BANNER

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in BANNER.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | BANNER_ID |  |  |  | NUMERIC (4) | The number to uniquely identify a Banner. |
| 7 | BANNER_NAME |  |  |  | VARCHAR (120 ) | The name of the Banner for which channels are associated. |
| 8 | CREATE_ID |  |  |  | VARCHAR (30 ) | This column holds the User id of the user who created the record. |
| 9 | CREATE_DATETIME |  |  |  | Date | This column holds the record creation date. |
| 10 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 11 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_BANNER_TL

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in BANNER_TL.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 BYTE) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 BYTE) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | LANG |  |  |  | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 7 | BANNER_ID |  |  |  | NUMERIC (4) | The number to uniquely identify a Banner. |
| 8 | BANNER_NAME |  |  |  | VARCHAR (120 BYTE) | The name of the Banner for which channels are associated. |

---

## Table: SVC_CHANNELS

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in CHANNELS.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | CHANNEL_ID |  |  |  | NUMERIC (4) | This column will contain the number that uniquely identifies the channel. |
| 7 | CHANNEL_NAME |  |  |  | VARCHAR (120 ) | Contains the name of the channel. |
| 8 | CHANNEL_TYPE |  |  |  | VARCHAR (6 ) | Specifies the type of channel. |
| 9 | BANNER_ID |  |  |  | NUMERIC (4) | A banner is the name of a channel of multiple channels. |
| 10 | CREATE_ID |  |  |  | VARCHAR (30 ) | This column holds the User id of the user who created the record. |
| 11 | CREATE_DATETIME |  |  |  | Date | This column holds the record creation date. |
| 12 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 13 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_CHANNELS_TL

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in CHANNELS_TL.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 BYTE) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 BYTE) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | LANG |  |  |  | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 7 | CHANNEL_ID |  |  |  | NUMERIC (4) | This column will contain the number that uniquely identifies the channel. |
| 8 | CHANNEL_NAME |  |  |  | VARCHAR (120 BYTE) | Contains the name of the channel. |

---

## Table: SVC_LOC_TRAITS

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in LOC_TRAITS.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | LOC_TRAIT |  |  |  | NUMERIC (4) | Contains a number which uniquely identifies a location trait. |
| 7 | DESCRIPTION |  |  |  | VARCHAR (120 ) | Contains a description which corresponds with the location trait number. |
| 8 | FILTER_ORG_ID |  |  |  | NUMERIC (10) | The ID of the Organizational Hierarchy that the location trait is assigned to.This field will be used to control the location traits a user can see in the location trait LOV when the link between the user and the Organizational Hierarchy has been established. |
| 9 | CREATE_ID |  |  |  | VARCHAR (30 ) | This column holds the User id of the user who created the record. |
| 10 | CREATE_DATETIME |  |  |  | Date | This column holds the record creation date. |
| 11 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 12 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_LOC_TRAITS_TL

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in LOC_TRAITS_TL.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 BYTE) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 BYTE) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | LANG |  |  |  | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 7 | LOC_TRAIT |  |  |  | NUMERIC (4) | Contains a number which uniquely identifies a location trait. |
| 8 | DESCRIPTION |  |  |  | VARCHAR (120 BYTE) | Contains a description which corresponds with the location trait number. |

---

## Table: SVC_ORG_UNIT

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in ORG_UNIT.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | ORG_UNIT_ID |  |  |  | NUMERIC (15) | Holds the oracle organizational unit ID. |
| 7 | DESCRIPTION |  |  |  | VARCHAR (120) | Holds the organizational unit description. |
| 8 | SET_OF_BOOKS_ID |  |  |  | NUMERIC (15) | Set of Books Id. |
| 9 | CREATE_ID |  |  |  | VARCHAR (30) | User who created the record. |
| 10 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 11 | LAST_UPD_ID |  |  |  | VARCHAR (30) | User who last updated the record. |
| 12 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_ORG_UNIT_TL

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in ORG_UNIT_TL.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | LANG |  |  |  | NUMERIC (6) | Contains the number which uniquely identifies a language. |
| 7 | ORG_UNIT_ID |  |  |  | NUMERIC (15) | Holds the oracle organizational unit ID. |
| 8 | DESCRIPTION |  |  |  | VARCHAR (120) | Holds the organizational unit description. |
| 9 | CREATE_ID |  |  |  | VARCHAR (30) | User who created the record. |
| 10 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 11 | LAST_UPD_ID |  |  |  | VARCHAR (30) | User who last updated the record. |
| 12 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_STORE_FORMAT

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in STORE_FORMAT.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | STORE_FORMAT |  |  |  | NUMERIC (4) | Contains the number which uniquely identifies the store format. |
| 7 | FORMAT_NAME |  |  |  | VARCHAR (60 ) | Contains the name or description of the store format. |
| 8 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 9 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 10 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 11 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_STORE_FORMAT_TL

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in STORE_FORMAT_TL.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 BYTE) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 BYTE) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | LANG |  |  |  | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 7 | STORE_FORMAT |  |  |  | NUMERIC (4) | Contains the number which uniquely identifies the store format. |
| 8 | FORMAT_NAME |  |  |  | VARCHAR (60 BYTE) | Contains the name or description of the store format. |

---

## Table: SVC_STORE_GRADE

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in STORE_GRADE.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | STORE_GRADE_GROUP_ID |  |  |  | NUMERIC (8) | This column holds the store grade group identification number associated with the store grade. |
| 7 | STORE_GRADE |  |  |  | VARCHAR (120 ) | This column holds the store grades within each store grade group. |
| 8 | COMMENTS |  |  |  | VARCHAR (2000 ) | This column holds any comments entered by the buyer describing each store grade entered. |
| 9 | CREATE_ID |  |  |  | VARCHAR (30 ) | This column holds the User id of the user who created the record. |
| 10 | CREATE_DATETIME |  |  |  | Date | This column holds the record creation date. |
| 11 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 12 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_STORE_GRADE_GROUP

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in STORE_GRADE_GROUP.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | STORE_GRADE_GROUP_ID |  |  |  | NUMERIC (8) | This column holds the unique store grade group identification number. The id is a unique system generated number. |
| 7 | STORE_GRADE_GROUP_DESC |  |  |  | VARCHAR (120 ) | This column will hold the store group description associated with the identification number. |
| 8 | BUYER |  |  |  | NUMERIC (4) | This column holds the identification number of the buyer who created the store grade group. |
| 9 | CREATE_ID |  |  |  | VARCHAR (30 ) | This column holds the User id of the user who created the record. |
| 10 | CREATE_DATETIME |  |  |  | Date | This column holds the record creation date. |
| 11 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 12 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_STORE_GRADE_GROUP_TL

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in STORE_GRADE_GROUP_TL.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 BYTE) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 BYTE) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | LANG |  |  |  | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 7 | STORE_GRADE_GROUP_ID |  |  |  | NUMERIC (8) | This column holds the unique store grade group identification number. The id is a unique system generated number. |
| 8 | STORE_GRADE_GROUP_DESC |  |  |  | VARCHAR (120 BYTE) | This column will hold the store group description associated with the identification number. |

---

## Table: SVC_STORE_GRADE_STORE

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in STORE_GRADE_STORE.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | STORE_GRADE_GROUP_ID |  |  |  | NUMERIC (8) | This column holds the store grade_group associated with the stores. |
| 7 | STORE |  |  |  | NUMERIC (10) | This column holds the store numbers which exist in the store grade groups. A store can exist in multiple store grade groups, but only in one store grade per each store grade group. It is not required that all stores belong to a store grade within every store grade group. |
| 8 | STORE_GRADE |  |  |  | VARCHAR (120 ) | This column holds the store grades within each store grade group. |
| 9 | CREATE_ID |  |  |  | VARCHAR (30 ) | This column holds the User id of the user who created the record. |
| 10 | CREATE_DATETIME |  |  |  | Date | This column holds the record creation date. |
| 11 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 12 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |
