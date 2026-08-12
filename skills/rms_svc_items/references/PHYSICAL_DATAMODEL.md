# RMS Service Uploads - Item Master Datamodel - Physical Data Model Reference

## Table: SVC_DIFF_IDS

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in DIFF_IDS.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | DIFF_ID |  |  |  | VARCHAR (10 ) | Contains a code to uniquely identify the differentiator. |
| 7 | DIFF_TYPE |  |  |  | VARCHAR (6 ) | This field will hold a value of the types of differentiators contained in this differentiator group,such as S-size,C-color,F-flavor,E-scent,P-pattern. |
| 8 | DIFF_DESC |  |  |  | VARCHAR (120 ) | Description of the differentiator. |
| 9 | INDUSTRY_CODE |  |  |  | VARCHAR (10 ) | Can be used to hold the unique code used by industry standards to identify the differentiator. |
| 10 | INDUSTRY_SUBGROUP |  |  |  | VARCHAR (10 ) | Can be used to hold a sub-grouping code used by industry standards to further identify the differentiator. |
| 11 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 12 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 13 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 14 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_DIFF_IDS_TL

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in DIFF_IDS_TL.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 BYTE) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 BYTE) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | LANG |  |  |  | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 7 | DIFF_ID |  |  |  | VARCHAR (10 BYTE) | Contains the code to uniquely identify a differentiator. |
| 8 | DIFF_DESC |  |  |  | VARCHAR (120 BYTE) | Description of the differentiator (for example, Blueberry, Shower Fresh, Red, etc.) |

---

## Table: SVC_DIFF_TYPE

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in DIFF_TYPE.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | DIFF_TYPE |  |  |  | VARCHAR (6 ) | Contains the code used to uniquely identify a differentiator type. |
| 7 | DIFF_TYPE_DESC |  |  |  | VARCHAR (120 ) | Contains the description of the differentiator type. |
| 8 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 9 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 10 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 11 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_DIFF_TYPE_TL

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in DIFF_TYPE_TL.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 BYTE) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 BYTE) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | LANG |  |  |  | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 7 | DIFF_TYPE |  |  |  | VARCHAR (6 BYTE) | Contains the code used to uniquely identify a differentiator type. |
| 8 | DIFF_TYPE_DESC |  |  |  | VARCHAR (120 BYTE) | Contains the description of the differentiator type. |

---

## Table: SVC_ITEM_COST_DETAIL

**Description:** This is the staging table for Item Induction module. It is used to temporarily hold data before it is uploaded/updated in ITEM_COST_DETAIL

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The data for a process is split in multiple chunks. The Chunk information is present in SVC_PROCESS_CHUNKS. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | ITEM |  |  |  | VARCHAR (25) | Refer to ITEM_COST_DETAIL.ITEM. |
| 7 | SUPPLIER |  |  |  | NUMERIC (10) | Refer to ITEM_COST_DETAIL.SUPPLIER. |
| 8 | ORIGIN_COUNTRY_ID |  |  |  | VARCHAR (3) | Refer to ITEM_COST_DETAIL.ORIGIN_COUNTRY_ID. |
| 9 | DELIVERY_COUNTRY_ID |  |  |  | VARCHAR (3) | Refer to ITEM_COST_DETAIL.DELIVERY_COUNTRY_ID. |
| 10 | COND_TYPE |  |  |  | VARCHAR (10) | Refer to ITEM_COST_DETAIL.COND_TYPE. |
| 11 | COND_VALUE |  |  |  | NUMERIC (20,4) | Refer to ITEM_COST_DETAIL.COND_VALUE. |
| 12 | APPLIED_ON |  |  |  | NUMERIC (20,4) | Refer to ITEM_COST_DETAIL.APPLIED_ON. |
| 13 | COMP_RATE |  |  |  | NUMERIC (20,10) | Refer to ITEM_COST_DETAIL.COMP_RATE. |
| 14 | CALCULATION_BASIS |  |  |  | VARCHAR (1) | Refer to ITEM_COST_DETAIL.CALCULATION_BASIS. |
| 15 | RECOVERABLE_AMOUNT |  |  |  | NUMERIC (20,4) | Refer to ITEM_COST_DETAIL.RECOVERABLE_AMOUNT. |
| 16 | MODIFIED_TAXABLE_BASE |  |  |  | NUMERIC (20,4) | Refer to ITEM_COST_DETAIL.MODIFIED_TAXABLE_BASE. |
| 17 | CREATE_ID |  |  |  | VARCHAR (30) | User who created the record. |
| 18 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 19 | LAST_UPD_ID |  |  |  | VARCHAR (30) | User who last updated the record. |
| 20 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_ITEM_COST_HEAD

**Description:** This is the staging table for Item Induction module. It is used to temporarily hold data before it is uploaded/updated in ITEM_COST_HEAD

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The data for a process is split in multiple chunks. The Chunk information is present in SVC_PROCESS_CHUNKS. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | ITEM |  |  |  | VARCHAR (25) | Refer to ITEM_COST_HEAD.ITEM. |
| 7 | SUPPLIER |  |  |  | NUMERIC (10) | Refer to ITEM_COST_HEAD.SUPPLIER. |
| 8 | ORIGIN_COUNTRY_ID |  |  |  | VARCHAR (3) | Refer to ITEM_COST_HEAD.ORIGIN_COUNTRY_ID. |
| 9 | DELIVERY_COUNTRY_ID |  |  |  | VARCHAR (3) | Refer to ITEM_COST_HEAD.DELIVERY_COUNTRY_ID. |
| 10 | PRIM_DLVY_CTRY_IND |  |  |  | VARCHAR (1) | Refer to ITEM_COST_HEAD.PRIM_DLVY_CTRY_IND. |
| 11 | NIC_STATIC_IND |  |  |  | VARCHAR (1) | Refer to ITEM_COST_HEAD.NIC_STATIC_IND. |
| 12 | BASE_COST |  |  |  | NUMERIC (20,4) | Refer to ITEM_COST_HEAD.BASE_COST. |
| 13 | NEGOTIATED_ITEM_COST |  |  |  | NUMERIC (20,4) | Refer to ITEM_COST_HEAD.NEGOTIATED_ITEM_COST. |
| 14 | EXTENDED_BASE_COST |  |  |  | NUMERIC (20,4) | Refer to ITEM_COST_HEAD.EXTENDED_BASE_COST. |
| 15 | INCLUSIVE_COST |  |  |  | NUMERIC (20,4) | Refer to ITEM_COST_HEAD.INCLUSIVE_COST. |
| 16 | CREATE_ID |  |  |  | VARCHAR (30) | User who created the record. |
| 17 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 18 | LAST_UPD_ID |  |  |  | VARCHAR (30) | User who last updated the record. |
| 19 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_ITEM_COUNTRY

**Description:** This is the staging table for Item Induction module. It is used to temporarily hold data before it is uploaded/updated in ITEM_COUNTRY

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The data for a process is split in multiple chunks. The Chunk information is present in SVC_PROCESS_CHUNKS. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | ITEM |  |  |  | VARCHAR (25) | Refer to ITEM_COUNTRY.ITEM. |
| 7 | COUNTRY_ID |  |  |  | VARCHAR (3) | Refer to ITEM_COUNTRY.COUNTRY_ID. |
| 8 | CREATE_ID |  |  |  | VARCHAR (30) | User who created the record. |
| 9 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 10 | LAST_UPD_ID |  |  |  | VARCHAR (30) | User who last updated the record. |
| 11 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_ITEM_COUNTRY_L10N_EXT

**Description:** This is the staging table for Item Induction module. It is used to temporarily hold data before it is uploaded/updated in ITEM_COUNTRY_L10N_EXT

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The data for a process is split in multiple chunks. The Chunk information is present in SVC_PROCESS_CHUNKS. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10) | Describes type of action i.e. NEW, MOD or DEL |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | ITEM |  |  |  | VARCHAR (25) | Refer to ITEM_COUNTRY_L10N_EXT.ITEM. |
| 7 | COUNTRY_ID |  |  |  | VARCHAR (3) | Refer to ITEM_COUNTRY_L10N_EXT.COUNTRY_ID. |
| 8 | L10N_COUNTRY_ID |  |  |  | VARCHAR (3) | Refer to ITEM_COUNTRY_L10N_EXT.L10N_COUNTRY_ID. |
| 9 | GROUP_ID |  |  |  | NUMERIC (10) | Refer to ITEM_COUNTRY_L10N_EXT.GROUP_ID. |
| 10 | VARCHAR2_1 |  |  |  | VARCHAR (250) | Refer to ITEM_COUNTRY_L10N_EXT.VARCHAR2_1. |
| 11 | VARCHAR2_2 |  |  |  | VARCHAR (250) | Refer to ITEM_COUNTRY_L10N_EXT.VARCHAR2_2. |
| 12 | VARCHAR2_3 |  |  |  | VARCHAR (250) | Refer to ITEM_COUNTRY_L10N_EXT.VARCHAR2_3. |
| 13 | VARCHAR2_4 |  |  |  | VARCHAR (250) | Refer to ITEM_COUNTRY_L10N_EXT.VARCHAR2_4. |
| 14 | VARCHAR2_5 |  |  |  | VARCHAR (250) | Refer to ITEM_COUNTRY_L10N_EXT.VARCHAR2_5. |
| 15 | VARCHAR2_6 |  |  |  | VARCHAR (250) | Refer to ITEM_COUNTRY_L10N_EXT.VARCHAR2_6. |
| 16 | VARCHAR2_7 |  |  |  | VARCHAR (250) | Refer to ITEM_COUNTRY_L10N_EXT.VARCHAR2_7. |
| 17 | VARCHAR2_8 |  |  |  | VARCHAR (250) | Refer to ITEM_COUNTRY_L10N_EXT.VARCHAR2_8. |
| 18 | VARCHAR2_9 |  |  |  | VARCHAR (250) | Refer to ITEM_COUNTRY_L10N_EXT.VARCHAR2_9. |
| 19 | VARCHAR2_10 |  |  |  | VARCHAR (250) | Refer to ITEM_COUNTRY_L10N_EXT.VARCHAR2_10. |
| 20 | NUMBER_11 |  |  |  | NUMERIC (20,4) | Refer to ITEM_COUNTRY_L10N_EXT.NUMBER_11. |
| 21 | NUMBER_12 |  |  |  | NUMERIC (20,4) | Refer to ITEM_COUNTRY_L10N_EXT.NUMBER_12. |
| 22 | NUMBER_13 |  |  |  | NUMERIC (20,4) | Refer to ITEM_COUNTRY_L10N_EXT.NUMBER_13. |
| 23 | NUMBER_14 |  |  |  | NUMERIC (20,4) | Refer to ITEM_COUNTRY_L10N_EXT.NUMBER_14. |
| 24 | NUMBER_15 |  |  |  | NUMERIC (20,4) | Refer to ITEM_COUNTRY_L10N_EXT.NUMBER_15. |
| 25 | NUMBER_16 |  |  |  | NUMERIC (20,4) | Refer to ITEM_COUNTRY_L10N_EXT.NUMBER_16. |
| 26 | NUMBER_17 |  |  |  | NUMERIC (20,4) | Refer to ITEM_COUNTRY_L10N_EXT.NUMBER_17. |
| 27 | NUMBER_18 |  |  |  | NUMERIC (20,4) | Refer to ITEM_COUNTRY_L10N_EXT.NUMBER_18. |
| 28 | NUMBER_19 |  |  |  | NUMERIC (20,4) | Refer to ITEM_COUNTRY_L10N_EXT.NUMBER_19. |
| 29 | NUMBER_20 |  |  |  | NUMERIC (20,4) | Refer to ITEM_COUNTRY_L10N_EXT.NUMBER_20. |
| 30 | DATE_21 |  |  |  | Date | Refer to ITEM_COUNTRY_L10N_EXT.DATE_21. |
| 31 | DATE_22 |  |  |  | Date | Refer to ITEM_COUNTRY_L10N_EXT.DATE_22. |
| 32 | CREATE_ID |  |  |  | VARCHAR (30) | User who created the record. |
| 33 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 34 | LAST_UPD_ID |  |  |  | VARCHAR (30) | User who last updated the record |
| 35 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_ITEM_IMAGE

**Description:** This is the staging table for Item Induction module. It is used to temporarily hold data before it is uploaded/updated in ITEM_IMAGE.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The data for a process is split in multiple chunks. The Chunk information is present in SVC_PROCESS_CHUNKS. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 BYTE) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 BYTE) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | ITEM |  |  |  | VARCHAR (25 BYTE) | Refer to ITEM_IMAGE.ITEM field. |
| 7 | IMAGE_NAME |  |  |  | VARCHAR (120 BYTE) | Refer to ITEM_IMAGE.IMAGE_NAME field. |
| 8 | IMAGE_ADDR |  |  |  | VARCHAR (255 BYTE) | Refer to ITEM_IMAGE.IMAGE_ADDR field. |
| 9 | IMAGE_DESC |  |  |  | VARCHAR (40 BYTE) | Refer to ITEM_IMAGE.IMAGE_DESC field. |
| 10 | IMAGE_TYPE |  |  |  | VARCHAR (6 BYTE) | Refer to ITEM_IMAGE.IMAGE_TYPE field. |
| 11 | PRIMARY_IND |  |  |  | VARCHAR (1 BYTE) | Refer to ITEM_IMAGE.PRIMARY_IND field. |
| 12 | DISPLAY_PRIORITY |  |  |  | NUMERIC (4) | Refer to ITEM_IMAGE.DISPLAY_PRIORITY field. |
| 13 | CREATE_ID |  |  |  | VARCHAR (30 BYTE) | User who created the record. |
| 14 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 15 | LAST_UPDATE_ID |  |  |  | VARCHAR (30 BYTE) | User who last updated the record. |
| 16 | LAST_UPDATE_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_ITEM_IMAGE_TL

**Description:** This is a staging table used for item induction spreadsheet upload process. It is used to temporarily hold data before it is uploaded/updated in ITEM_IMAGE_TL.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | LANG |  |  |  | NUMERIC (6) | Refer to ITEM_IMAGE_TL.LANG column |
| 7 | ITEM |  |  |  | VARCHAR (25 ) | Refer to ITEM_IMAGE_TL.ITEM column |
| 8 | IMAGE_NAME |  |  |  | VARCHAR (120 ) | Refer to ITEM_IMAGE_TL.IMAGE_NAME column |
| 9 | IMAGE_DESC |  |  |  | VARCHAR (40 ) | Refer to ITEM_IMAGE_TL.IMAGE_DESC column. |
| 10 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 11 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 12 | LAST_UPDATE_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 13 | LAST_UPDATE_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_ITEM_INDUCT_CONFIG

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in ITEM_INDUCT_CONFIG.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | MAX_ITEMS_FOR_DNLD |  |  |  | NUMERIC (10) | Maximum number of items that can be downloaded using spreadsheet. |
| 7 | MAX_ITEMS_FOR_SYNC_DNLD |  |  |  | NUMERIC (10) | Maximum number of items that can be downloaded using spreadsheet in synchronous fashion. Beyond this threshold the process is submitted as an asynchronous process. |
| 8 | MAX_FILE_SIZE_FOR_UPLD |  |  |  | NUMERIC (10) | Maximum file size that can be uploaded. |
| 9 | MAX_FILE_SIZE_FOR_SYNC_UPLD |  |  |  | NUMERIC (10) | Maximum file size that can be uploaded in synchronous fashion. Beyond this threshold the process is submitted as an asynchronous process. |
| 10 | MAX_CC_FOR_SYNC_DNLD |  |  |  | NUMERIC (10) | Maximum number of cost changes allowed for synchronous download. |
| 11 | MAX_CC_FOR_DNLD |  |  |  | NUMERIC (10) | Maximum number of cost changes allowed for download. |
| 12 | CREATE_ID |  |  |  | VARCHAR (30) | User who created the record. |
| 13 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 14 | LAST_UPD_ID |  |  |  | VARCHAR (30) | User who last updated the record. |
| 15 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_ITEM_LOC_RANGING

**Description:** This is the parameter table used the by RMS asynchronous item location ranging functionality. It serves as an interface between an initiating transaction and the asynchronous transaction that ranges the item locations. The records on this table are inserted by the item location form when ranging new item locations or updating existing item locations. Records belonging to a particular asynchronous transaction will be identified by the RMS_ASYNC_ID columns and are picked up by the core package for item location ranging in a separate transaction.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | RMS_ASYNC_ID | P |  | Y | NUMERIC (15) | A numeric value that identifies an asynchronous process in RMS. The asynchronous process in the context of this table is item-loc ranging (either create or update). Each row on this table represents a unique item-location ranging job. One or more item-locations can be associated to a single RMS_ASYNC_ID through location grouping. |
| 2 | ITEM |  |  |  | VARCHAR (25) | Unique alphanumeric value that identifies the item. |
| 3 | ITEM_PARENT |  |  |  | VARCHAR (25) | Alphanumeric value that uniquely identifies the item/group at the level above the item. |
| 4 | ITEM_GRANDPARENT |  |  |  | VARCHAR (25) | Alphanumeric value that uniquely identifies the item/group two levels above the item. |
| 5 | LOC_GROUP_TYPE |  |  |  | VARCHAR (6) | Describes the grouping for a location group value. Groupings can pertain to the entire set of valid location type or a subset. The valid values are mapped to the code type GTVF and GT1E as populated on the item location form. |
| 6 | LOC_GROUP_VALUE |  |  |  | VARCHAR (10) | Numeric value that identifies an entity in a location group type. An example is a store list id under the group type for store list. |
| 7 | DEFAULT_TO_CHILDREN |  |  | Y | VARCHAR (1) | Indicates if the item-location ranging should be defaulted to the items child and grandchild items. |
| 8 | ITEM_STATUS |  |  | Y | VARCHAR (1) | Status of the item. Valid values are: W = Worksheet: item setup in progress, cannot be used in system S = Submitted: item setup complete and awaiting approval, cannot be use in system A = Approved: item is approved and can now be used throughout the system. |
| 9 | SHORT_DESC |  |  | Y | VARCHAR (120) | Shortened description of the item being ranged to locations. |
| 10 | DEPT |  |  | Y | NUMERIC (4) | Number identifying the department to which the item is attached. |
| 11 | CLASS |  |  | Y | NUMERIC (4) | Number identifying the class to which the item is attached. |
| 12 | SUBCLASS |  |  | Y | NUMERIC (4) | Number identifying the subclass to which the item is attached. |
| 13 | ITEM_LEVEL |  |  | Y | NUMERIC (1) | Number indicating which of the three levels the item resides. The item level determines if the item stands alone or if it is part of a family of related items. |
| 14 | TRAN_LEVEL |  |  | Y | NUMERIC (1) | Number indicating which of the three levels transactions occur for the items group. The transaction level is the level at which the items inventory is tracked in the system. The transaction level item will be counted, transferred, shipped, etc. The transaction level may be at the current item or up to 2 levels above or below the current item. Only one |
| 15 | SELLABLE_IND |  |  | Y | VARCHAR (1) | Holds a Yes/No indicate to mark if an item is sellable. |
| 16 | ORDERABLE_IND |  |  | Y | VARCHAR (1) | Holds a Yes/No indicate to mark if an item is orderable. |
| 17 | PACK_IND |  |  | Y | VARCHAR (1) | Holds a Yes/No indicate to mark if an item is a pack. |
| 18 | PACK_TYPE |  |  |  | VARCHAR (6) | Indicates if pack item is a vendor pack or a buyer pack. A vendor pack is a pack that the vendor or supplier recognizes and sells to the retailer. If the pack item is a vendor pack, communication with the supplier will use the vendor pack number. A buyer pack is a pack that a buyer has created for internal ease of use. If the pack item is a buyer pack, communication with the supplier will explode the pack out to its component items. This field will only be available if the item is a pack item. If the pack item is not orderable this field must be NULL. Valid values are: V = Vendor B = Buyer |
| 19 | WASTE_TYPE |  |  |  | VARCHAR (6) | Identifies the wastage type as either sales or spoilage wastage. Sales wastage occurs during processes that make an item saleable (i.e. fat is trimmed off at customer request). Spoilage wastage occurs during the products shelf life (i.e. evaporation causes the product to weigh less after a period of time). Valid values are: SP = Spoilage SL = Sales Wastage is not applicable to pack items. |
| 20 | ITEM_LOC_STATUS |  |  | Y | VARCHAR (1) | Indicates the status of an item at the location. Valid values are: A = Active, item is valid and can be ordered and sold; I = Inactive, item is valid but cannot be ordered or sold; C = Discontinued, item is valid and sellable but no longer orderable D = Delete, item is invalid and cannot be ordered or sold |
| 21 | LOCAL_ITEM_DESC |  |  | Y | VARCHAR (250) | Contains the local description of the item. This field will default to the items description but can be overrided. This value will be downloaded to the POS. |
| 22 | LOCAL_SHORT_DESC |  |  |  | VARCHAR (120) | Contains the local short description of the item. This field will default to the items short description but can be overrided. This value will be downloaded to the POS. |
| 23 | CURRENCY_CODE |  |  |  | VARCHAR (3) | Contains the code which uniquely identifies the type of currency for the set of locations. |
| 24 | RANGED_IND |  |  | Y | VARCHAR (1) | This column determines if the location is ranged intentionally by the user for replenishment/selling or incidentally ranged by the RMS programs when item is not ranged to a specific location on the transaction. |
| 25 | TAXABLE_IND |  |  | Y | VARCHAR (1) | Indicates if item is taxable at the store. Valid values are: Y = Yes, the item is taxable N = No, the item is not taxable |
| 26 | STORE_PRICE_IND |  |  | Y | VARCHAR (1) | This field indicates if an item at a particular store location can have the unit retail marked down by the store. |
| 27 | PRIMARY_SUPP |  |  |  | NUMERIC (10) | Numeric identifier of the supplier who will be considered the primary supplier for the specified item/loc. The supplier/origin country combination will determine the value of the unit cost field on item_loc. If the supplier is changed and ELC = N, the unit cost field on item_loc will be updated with the new suppliers cost. |
| 28 | PRIMARY_CNTRY |  |  |  | VARCHAR (3) | Contains the identifier of the origin country which will be considered the primary country for the specified item/location. |
| 29 | PRIMARY_VARIANT |  |  |  | VARCHAR (25) | This field is used to address sales of PLUs (i.e. above transaction level items) when inventory is tracked at a lower level (i.e. UPC). This field will only contain a value for items one level higher than the transaction level. Valid choices will be any transaction level item that is a child of this item. In order to select a transaction level item as the primary variant, the item/location relationship must exist at the transaction level. Both the transaction level item (i.e. UPC) and the higher than transcation level item (i.e. PLU) will be sent to the POS to allow the store to sell the PLU. The information sent for the PLU will be the same information sent for the transaction level item (i.e. UPC). |
| 30 | PRIMARY_COST_PACK |  |  |  | VARCHAR (25) | This field contains an item number that is a simple pack containing the item in the item column for this record. If populated, the cost of the future cost table will be driven from the simple pack and the deals and cost changes for the simple pack. |
| 31 | SOURCE_METHOD |  |  |  | VARCHAR (1) | This value will be used to specify how the ad-hoc PO/TSF creation process should source the item/stores request. If the value is Warehouse, the process will attempt to fill the request by creating a transfer from the item/locations primary sourcing warehouse. If this warehouse doesnt have enough inventory to fill the request a purchase order will be created for the item/locations primary supplier. |
| 32 | SOURCE_WH |  |  |  | NUMERIC (10) | This value will be used by the ad-hoc PO/Transfer creation process to determine which warehouse to fill the stores request from. A value will be required in this field if the sourcing method is Warehouse. |
| 33 | STORE_ORD_MULT |  |  | Y | VARCHAR (1) | This column contains the multiple in which the item needs to be shipped from a warehouse to the location. |
| 34 | RECEIVE_AS_TYPE |  |  |  | VARCHAR (1) | This column determines whether the stock on hand for a pack component item or the buyer pack itself will be updated when a buyer pack is received at a warehouse. Valid values are Each or Pack. |
| 35 | INBOUND_HANDLING_DAYS |  |  |  | NUMERIC (2) | This field indicates the number of inbound handling days for an item at a warehouse type location. |
| 36 | DAILY_WASTE_PCT |  |  |  | NUMERIC (12,4) | Average percentage lost from inventory on a daily basis due to natural wastage. |
| 37 | TI |  |  |  | NUMERIC (12,4) | Number of shipping units (cases) that make up one tier of a pallet. Multiply TI x HI to get total number of cases for a pallet. |
| 38 | HI |  |  |  | NUMERIC (12,4) | Number of tiers that make up a complete pallet (height). Multiply TI x HI to get total number of cases for a pallet. |
| 39 | UNIT_COST_LOC |  |  |  | NUMERIC (20,4) | Contains the unit cost in the standard unit of measure for the item/location combination. This field is stored in the local currency. |
| 40 | UNIT_RETAIL_LOC |  |  |  | NUMERIC (20,4) | Contains the unit retail price in the standard unit of measure for the item/location combination. This field is stored in the local currency. |
| 41 | SELLING_UNIT_RETAIL_LOC |  |  |  | NUMERIC (20,4) | Contains the unit retail price in the selling unit of measure for the item/location combination. This field is stored in the local currency. |
| 42 | SELLING_UOM |  |  |  | VARCHAR (4) | Contains the selling unit of measure for an item single-unit retail. |
| 43 | MULTI_UNIT_RETAIL |  |  |  | NUMERIC (20,4) | This field holds the multi-unit retail in the multi-selling unit of measure for the item/location (zone) combination. This field is stored in teh local currency. |
| 44 | MULTI_SELLING_UOM |  |  |  | VARCHAR (4) | This field holds the selling unit of measure for this item/location (zone) combinations multi-unit retail. |
| 45 | MULTI_UNITS |  |  |  | NUMERIC (12,4) | This field contains the multi-units for the item/location (zone) combination. |
| 46 | MEAS_OF_EACH |  |  |  | NUMERIC (12,4) | Size of an each in terms of the uom_of_price. For example 12 oz. Used in ticketing. |
| 47 | MEAS_OF_PRICE |  |  |  | NUMERIC (12,4) | Size to be used on the ticket in terms of the uom_of_price. For example, if the user wants the ticket to have the label print the price per ounce, this value would be 1. If the user wanted the price per 100 grams this value would be 100. Used in ticketing. |
| 48 | UOM_OF_PRICE |  |  |  | VARCHAR (4) | Unit of measure that will be used on the ticket for this item. |
| 49 | EXT_UIN_IND |  |  | Y | VARCHAR (1) | This Yes/No indicator indicates if UIN is being generated in the external system. |
| 50 | UIN_TYPE |  |  |  | VARCHAR (6) | This column will contain the unique identification number (UIN) used to identify the instances of the item at the location. |
| 51 | UIN_LABEL |  |  |  | VARCHAR (6) | This column will contain the label for the UIN when displayed in SIM. |
| 52 | CAPTURE_TIME |  |  |  | VARCHAR (6) | This column will indicate when the UIN should be captured for an item during transaction processing. |
| 53 | CREATE_ID |  |  | Y | VARCHAR (30) | Holds the user who has created the record. |
| 54 | CREATE_DATETIME |  |  | Y | Date | Holds the time the record is written. |
| 55 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | Holds the user who has last updated the record. |
| 56 | LAST_UPDATE_DATETIME |  |  | Y | Date | Holds the time the record is last updated. |
| 57 | COSTING_LOC |  |  |  | NUMERIC (10) | Numeric identifier of the costing location for the franchise store. This field may contain a store or a warehouse. |
| 58 | COSTING_LOC_TYPE |  |  |  | VARCHAR (1) | This field holds the type of costing location in the costing location field. |
| 59 | ITEM_DESC |  |  |  | VARCHAR (250 ) | Long description of the item. |
| 60 | DIFF_1 |  |  |  | VARCHAR (10 ) | Diff_group or diff_id that differentiates the current item from its item_parent. for an item that is a parent, this field may be either a group (i.e. mens pant sizes) or a value (6 oz). for an item that is not a parent, this field may contain a value (34x34, red, etc.) valid values are found on the diff_group and diff_id tables. |
| 61 | DIFF_2 |  |  |  | VARCHAR (10 ) | Diff_group or diff_id that differentiates the current item from its item_parent. for an item that is a parent, this field may be either a group (i.e. mens pant sizes) or a value (6 oz). for an item that is not a parent, this field may contain a value (34x34, red, etc.) valid values are found on the diff_group and diff_id tables. |
| 62 | DIFF_3 |  |  |  | VARCHAR (10 ) | Diff_group or diff_id that differentiates the current item from its item_parent. for an item that is a parent, this field may be either a group (i.e. mens pant sizes) or a value (6 oz). for an item that is not a parent, this field may contain a value (34x34, red, etc.) valid values are found on the diff_group and diff_id tables. |
| 63 | DIFF_4 |  |  |  | VARCHAR (10 ) | Diff_group or diff_id that differentiates the current item from its item_parent. for an item that is a parent, this field may be either a group (i.e. mens pant sizes) or a value (6 oz). for an item that is not a parent, this field may contain a value (34x34, red, etc.) valid values are found on the diff_group and diff_id tables. |
| 64 | LOC |  |  |  | NUMERIC (10) | Numeric identifier of the location in which the item is to be found. This field may contain a store, warehouse, or external finisher. |
| 65 | LOC_TYPE |  |  |  | VARCHAR (1 ) | Type of location in the location field. Valid values are S (store), W (warehouse), and E (external finisher). |
| 66 | HIER_LEVEL |  |  |  | VARCHAR (6 ) | The organizational hierarchy level to which to range the item to. |
| 67 | HIER_NUM_VALUE |  |  |  | NUMERIC (20) | The number value of the organizational hierarchy level to which to range the item to. |
| 68 | HIER_CHAR_VALUE |  |  |  | VARCHAR (6 ) | The char value of the organizational hierarchy level to which to range the item to. |
| 69 | LIKE_STORE |  |  |  | NUMERIC (10) | Contains the store in which to copy items to the new store. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|SVC_ITEM_LOC_RANGING_PK|PK||||RMS_ASYNC_ID|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_SVC_ITEM_LOC_RANGING|(COSTING_LOC_TYPE in ('S','W'))<br>|

---

## Table: SVC_ITEM_LOC_RANGING_LOCS

**Description:** This tables contains the list of valid locations for ranging or for updating. It is used by RMS asynchronous item location ranging functionality.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | RMS_ASYNC_ID | P | F | Y | NUMERIC (15) | A numeric value that identifies an asynchronous process in RMS. RMS_ASYNC_ID in this table has a foreign key reference to SVC_ITEM_LOC_RANGING.RMS_ASYNC_ID. |
| 2 | LOC | P |  | Y | NUMERIC (10) | This column holds the value of the location associated with the asynchronous transaction. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|SVC_ITEM_LOC_RANGING_LOC_PK|PK||||RMS_ASYNC_ID|ASC|
||||||LOC|ASC|

---

## Table: SVC_ITEM_MASTER

**Description:** This is the staging table for Item Induction module. It is used to temporarily hold data before it is uploaded/updated in ITEM_MASTER

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The data for a process is split in multiple chunks. The Chunk information is present in SVC_PROCESS_CHUNKS. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10) | Describes type of action i.e. NEW, MOD or DEL |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | ITEM |  |  |  | VARCHAR (25) | Refer to ITEM_MASTER.ITEM. |
| 7 | ITEM_NUMBER_TYPE |  |  |  | VARCHAR (6) | Refer to ITEM_MASTER.ITEM_NUMBER_TYPE. |
| 8 | FORMAT_ID |  |  |  | VARCHAR (1) | Refer to ITEM_MASTER.FORMAT_ID. |
| 9 | PREFIX |  |  |  | NUMERIC (2) | Refer to ITEM_MASTER.PREFIX. |
| 10 | ITEM_PARENT |  |  |  | VARCHAR (25) | Refer to ITEM_MASTER.ITEM_PARENT. |
| 11 | ITEM_GRANDPARENT |  |  |  | VARCHAR (25) | Refer to ITEM_MASTER.ITEM_GRANDPARENT. |
| 12 | PACK_IND |  |  |  | VARCHAR (1) | Refer to ITEM_MASTER.PACK_IND. |
| 13 | ITEM_LEVEL |  |  |  | NUMERIC (1) | Refer to ITEM_MASTER.ITEM_LEVEL. |
| 14 | TRAN_LEVEL |  |  |  | NUMERIC (1) | Refer to ITEM_MASTER.TRAN_LEVEL. |
| 15 | ITEM_AGGREGATE_IND |  |  |  | VARCHAR (1) | Refer to ITEM_MASTER.ITEM_AGGREGATE_IND. |
| 16 | DIFF_1 |  |  |  | VARCHAR (10) | Refer to ITEM_MASTER.DIFF_1. |
| 17 | DIFF_1_AGGREGATE_IND |  |  |  | VARCHAR (1) | Refer to ITEM_MASTER.DIFF_1_AGGREGATE_IND. |
| 18 | DIFF_2 |  |  |  | VARCHAR (10) | Refer to ITEM_MASTER.DIFF_2. |
| 19 | DIFF_2_AGGREGATE_IND |  |  |  | VARCHAR (1) | Refer to ITEM_MASTER.DIFF_2_AGGREGATE_IND. |
| 20 | DIFF_3 |  |  |  | VARCHAR (10) | Refer to ITEM_MASTER.DIFF_3 |
| 21 | DIFF_3_AGGREGATE_IND |  |  |  | VARCHAR (1) | Refer to ITEM_MASTER.DIFF_3_AGGREGATE_IND. |
| 22 | DIFF_4 |  |  |  | VARCHAR (10) | Refer to ITEM_MASTER.DIFF_4. |
| 23 | DIFF_4_AGGREGATE_IND |  |  |  | VARCHAR (1) | Refer to ITEM_MASTER.DIFF_4_AGGREGATE_IND. |
| 24 | DEPT |  |  |  | NUMERIC (4) | Refer to ITEM_MASTER.DEPT. |
| 25 | CLASS |  |  |  | NUMERIC (4) | Refer to ITEM_MASTER.CLASS. |
| 26 | SUBCLASS |  |  |  | NUMERIC (4) | Refer to ITEM_MASTER.SUBCLASS. |
| 27 | STATUS |  |  |  | VARCHAR (1) | Refer to ITEM_MASTER.STATUS. |
| 28 | ITEM_DESC |  |  |  | VARCHAR (250) | Refer to ITEM_MASTER.ITEM_DESC. |
| 29 | ITEM_DESC_SECONDARY |  |  |  | VARCHAR (250) | Refer to ITEM_MASTER.ITEM_DESC_SECONDARY. |
| 30 | SHORT_DESC |  |  |  | VARCHAR (120) | Refer to ITEM_MASTER.SHORT_DESC. |
| 31 | PRIMARY_REF_ITEM_IND |  |  |  | VARCHAR (1) | Refer to ITEM_MASTER.PRIMARY_REF_ITEM_IND. |
| 32 | COST_ZONE_GROUP_ID |  |  |  | NUMERIC (4) | Refer to ITEM_MASTER.COST_ZONE_GROUP_ID. |
| 33 | STANDARD_UOM |  |  |  | VARCHAR (4) | Refer to ITEM_MASTER.STANDARD_UOM. |
| 34 | UOM_CONV_FACTOR |  |  |  | NUMERIC (20,10) | Refer to ITEM_MASTER.UOM_CONV_FACTOR. |
| 35 | PACKAGE_SIZE |  |  |  | NUMERIC (12,4) | Refer to ITEM_MASTER.PACKAGE_SIZE. |
| 36 | PACKAGE_UOM |  |  |  | VARCHAR (4) | Refer to ITEM_MASTER.PACKAGE_UOM. |
| 37 | MERCHANDISE_IND |  |  |  | VARCHAR (1) | Refer to ITEM_MASTER.MERCHANDISE_IND. |
| 38 | STORE_ORD_MULT |  |  |  | VARCHAR (1) | Refer to ITEM_MASTER.STORE_ORD_MULT. |
| 39 | FORECAST_IND |  |  |  | VARCHAR (1) | Refer to ITEM_MASTER.FORECAST_IND. |
| 40 | ORIGINAL_RETAIL |  |  |  | NUMERIC (20,4) | Refer to ITEM_MASTER.ORIGINAL_RETAIL. |
| 41 | MFG_REC_RETAIL |  |  |  | NUMERIC (20,4) | Refer to ITEM_MASTER.MFG_REC_RETAIL. |
| 42 | RETAIL_LABEL_TYPE |  |  |  | VARCHAR (6) | Refer to ITEM_MASTER.RETAIL_LABEL_TYPE. |
| 43 | RETAIL_LABEL_VALUE |  |  |  | NUMERIC (20,4) | Refer to ITEM_MASTER.RETAIL_LABEL_VALUE. |
| 44 | HANDLING_TEMP |  |  |  | VARCHAR (6) | Refer to ITEM_MASTER.HANDLING_TEMP. |
| 45 | HANDLING_SENSITIVITY |  |  |  | VARCHAR (6) | Refer to ITEM_MASTER.HANDLING_SENSITIVITY. |
| 46 | CATCH_WEIGHT_IND |  |  |  | VARCHAR (1) | Refer to ITEM_MASTER.CATCH_WEIGHT_IND |
| 47 | WASTE_TYPE |  |  |  | VARCHAR (6) | Refer to ITEM_MASTER.WASTE_TYPE. |
| 48 | WASTE_PCT |  |  |  | NUMERIC (12,4) | Refer to ITEM_MASTER.WASTE_PCT. |
| 49 | DEFAULT_WASTE_PCT |  |  |  | NUMERIC (12,4) | Refer to ITEM_MASTER.DEFAULT_WASTE_PCT. |
| 50 | CONST_DIMEN_IND |  |  |  | VARCHAR (1) | Refer to ITEM_MASTER.CONST_DIMEN_IND. |
| 51 | SIMPLE_PACK_IND |  |  |  | VARCHAR (1) | Refer to ITEM_MASTER.SIMPLE_PACK_IND. |
| 52 | CONTAINS_INNER_IND |  |  |  | VARCHAR (1) | Refer to ITEM_MASTER.CONTAINS_INNER_IND. |
| 53 | SELLABLE_IND |  |  |  | VARCHAR (1) | Refer to ITEM_MASTER.SELLABLE_IND. |
| 54 | ORDERABLE_IND |  |  |  | VARCHAR (1) | Refer to ITEM_MASTER.ORDERABLE_IND. |
| 55 | PACK_TYPE |  |  |  | VARCHAR (1) | Refer to ITEM_MASTER.PACK_TYPE. |
| 56 | ORDER_AS_TYPE |  |  |  | VARCHAR (1) | Refer to ITEM_MASTER.ORDER_AS_TYPE. |
| 57 | COMMENTS |  |  |  | VARCHAR (2000) | Refer to ITEM_MASTER.COMMENTS. |
| 58 | ITEM_SERVICE_LEVEL |  |  |  | VARCHAR (6) | Refer to ITEM_MASTER.ITEM_SERVICE_LEVEL. |
| 59 | GIFT_WRAP_IND |  |  |  | VARCHAR (1) | Refer to ITEM_MASTER.GIFT_WRAP_IND. |
| 60 | SHIP_ALONE_IND |  |  |  | VARCHAR (1) | Refer to ITEM_MASTER.SHIP_ALONE_IND. |
| 61 | ITEM_XFORM_IND |  |  |  | VARCHAR (1) | Refer to ITEM_MASTER.ITEM_XFORM_IND. |
| 62 | INVENTORY_IND |  |  |  | VARCHAR (1) | Refer to ITEM_MASTER.INVENTORY_IND. |
| 63 | ORDER_TYPE |  |  |  | VARCHAR (6) | Refer to ITEM_MASTER.ORDER_TYPE. |
| 64 | SALE_TYPE |  |  |  | VARCHAR (6) | Refer to ITEM_MASTER.SALE_TYPE. |
| 65 | DEPOSIT_ITEM_TYPE |  |  |  | VARCHAR (6) | Refer to ITEM_MASTER.DEPOSIT_ITEM_TYPE. |
| 66 | CONTAINER_ITEM |  |  |  | VARCHAR (25) | Refer to ITEM_MASTER.CONTAINER_ITEM. |
| 67 | DEPOSIT_IN_PRICE_PER_UOM |  |  |  | VARCHAR (6) | Refer to ITEM_MASTER.DEPOSIT_IN_PRICE_PER_UOM. |
| 68 | AIP_CASE_TYPE |  |  |  | VARCHAR (6) | Refer to ITEM_MASTER.AIP_CASE_TYPE |
| 69 | PERISHABLE_IND |  |  |  | VARCHAR (1) | Refer to ITEM_MASTER.PERISHABLE_IND. |
| 70 | NOTIONAL_PACK_IND |  |  |  | VARCHAR (1) | Refer to ITEM_MASTER.NOTIONAL_PACK_IND. |
| 71 | SOH_INQUIRY_AT_PACK_IND |  |  |  | VARCHAR (1) | Refer to ITEM_MASTER.SOH_INQUIRY_AT_PACK_IND. |
| 72 | PRODUCT_CLASSIFICATION |  |  |  | VARCHAR (6) | Refer to ITEM_MASTER.PRODUCT_CLASSIFICATION. |
| 73 | BRAND_NAME |  |  |  | VARCHAR (30) | Refer to ITEM_MASTER.BRAND_NAME |
| 74 | CREATE_ID |  |  |  | VARCHAR (30) | User who created the record. |
| 75 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 76 | LAST_UPD_ID |  |  |  | VARCHAR (30) | User who last updated the record. |
| 77 | NEXT_UPD_ID |  |  |  | VARCHAR (30) | This column holds the user ID which is expected work next on this item. |
| 78 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |
| 79 | ORIG_REF_NO |  |  |  | VARCHAR (25) | When new item numbers are expected to be generated, this column holds the original reference number that can be used to tie data between this table and other SVC item tables. |
| 80 | PRE_RESERVED_IND |  |  |  | VARCHAR (1) | Pre reserved indicator is check if the item number is reserved. |
| 81 | DIFF_FINALIZED_IND |  |  | Y | VARCHAR (1) | Indicates whether diff is finalized or not for the item. |

---

## Table: SVC_ITEM_MASTER_CFA_EXT

**Description:** This is the staging table for Item Induction module. It is used to temporarily hold data before it is uploaded/updated in ITEM_MASTER_CFA_EXT

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The data for a process is split in multiple chunks. The Chunk information is present in SVC_PROCESS_CHUNKS. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | ITEM |  |  |  | VARCHAR (25) | Refer to ITEM_MASTER_CFA_EXT.ITEM. |
| 7 | GROUP_ID |  |  |  | NUMERIC (10) | Refer to ITEM_MASTER_CFA_EXT.GROUP_ID. |
| 8 | VARCHAR2_1 |  |  |  | VARCHAR (250) | Refer to ITEM_MASTER_CFA_EXT.VARCHAR2_1. |
| 9 | VARCHAR2_2 |  |  |  | VARCHAR (250) | Refer to ITEM_MASTER_CFA_EXT.VARCHAR2_2. |
| 10 | VARCHAR2_3 |  |  |  | VARCHAR (250) | Refer to ITEM_MASTER_CFA_EXT.VARCHAR2_3. |
| 11 | VARCHAR2_4 |  |  |  | VARCHAR (250) | Refer to ITEM_MASTER_CFA_EXT.VARCHAR2_4. |
| 12 | VARCHAR2_5 |  |  |  | VARCHAR (250) | Refer to ITEM_MASTER_CFA_EXT.VARCHAR2_5. |
| 13 | VARCHAR2_6 |  |  |  | VARCHAR (250) | Refer to ITEM_MASTER_CFA_EXT.VARCHAR2_6. |
| 14 | VARCHAR2_7 |  |  |  | VARCHAR (250) | Refer to ITEM_MASTER_CFA_EXT.VARCHAR2_7. |
| 15 | VARCHAR2_8 |  |  |  | VARCHAR (250) | Refer to ITEM_MASTER_CFA_EXT.VARCHAR2_8. |
| 16 | VARCHAR2_9 |  |  |  | VARCHAR (250) | Refer to ITEM_MASTER_CFA_EXT.VARCHAR2_9. |
| 17 | VARCHAR2_10 |  |  |  | VARCHAR (250) | Refer to ITEM_MASTER_CFA_EXT.VARCHAR2_10. |
| 18 | NUMBER_11 |  |  |  | NUMERIC (22) | Refer to ITEM_MASTER_CFA_EXT.NUMBER_11. |
| 19 | NUMBER_12 |  |  |  | NUMERIC (22) | Refer to ITEM_MASTER_CFA_EXT.NUMBER_12. |
| 20 | NUMBER_13 |  |  |  | NUMERIC (22) | Refer to ITEM_MASTER_CFA_EXT.NUMBER_13. |
| 21 | NUMBER_14 |  |  |  | NUMERIC (22) | Refer to ITEM_MASTER_CFA_EXT.NUMBER_14. |
| 22 | NUMBER_15 |  |  |  | NUMERIC (22) | Refer to ITEM_MASTER_CFA_EXT.NUMBER_15. |
| 23 | NUMBER_16 |  |  |  | NUMERIC (22) | Refer to ITEM_MASTER_CFA_EXT.NUMBER_16. |
| 24 | NUMBER_17 |  |  |  | NUMERIC (22) | Refer to ITEM_MASTER_CFA_EXT.NUMBER_17. |
| 25 | NUMBER_18 |  |  |  | NUMERIC (22) | Refer to ITEM_MASTER_CFA_EXT.NUMBER_18. |
| 26 | NUMBER_19 |  |  |  | NUMERIC (22) | Refer to ITEM_MASTER_CFA_EXT.NUMBER_19. |
| 27 | NUMBER_20 |  |  |  | NUMERIC (22) | Refer to ITEM_MASTER_CFA_EXT.NUMBER_20. |
| 28 | DATE_21 |  |  |  | Date | Refer to ITEM_MASTER_CFA_EXT.DATE_21. |
| 29 | DATE_22 |  |  |  | Date | Refer to ITEM_MASTER_CFA_EXT.DATE_22. |
| 30 | CREATE_ID |  |  |  | VARCHAR (30) | User who created the record. |
| 31 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 32 | LAST_UPD_ID |  |  |  | VARCHAR (30) | User who last updated the record. |
| 33 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |
| 34 | DATE_23 |  |  |  | Date | Refer to ITEM_MASTER_CFA_EXT.DATE_23. |
| 35 | DATE_24 |  |  |  | Date | Refer to ITEM_MASTER_CFA_EXT.DATE_24. |
| 36 | DATE_25 |  |  |  | Date | Refer to ITEM_MASTER_CFA_EXT.DATE_25. |

---

## Table: SVC_ITEM_MASTER_TL

**Description:** This is a staging table used for item induction spreadsheet upload process. It is used to temporarily hold data before it is uploaded/updated in ITEM_MASTER_TL.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | LANG |  |  |  | NUMERIC (6) | Refer to ITEM_MASTER_TL.LANG column |
| 7 | ITEM |  |  |  | VARCHAR (25 ) | Refer to ITEM_MASTER_TL.ITEM column |
| 8 | ITEM_DESC |  |  |  | VARCHAR (250 ) | Refer to ITEM_MASTER_TL.ITEM_DESC column |
| 9 | ITEM_DESC_SECONDARY |  |  |  | VARCHAR (250 ) | Refer to ITEM_MASTER_TL.ITEM_DESC_SECONDARY column. |
| 10 | SHORT_DESC |  |  |  | VARCHAR (120 ) | Refer to ITEM_MASTER_TL.SHORT_DESC column. |
| 11 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 12 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 13 | LAST_UPDATE_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 14 | LAST_UPDATE_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_ITEM_RESERVATION

**Description:** Item reservation table that will hold the values from the Item Reservation webservice

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM | P |  | Y | VARCHAR (25) | Item Number reserved |
| 2 | ITEM_NUMBER_TYPE |  |  | Y | VARCHAR (6) | Item number type of the item reserved |
| 3 | EXPIRY_DATE |  |  | Y | Date | Expiration date of the item number reserved |
| 4 | CREATE_ID |  |  | Y | VARCHAR (30) | User ID |
| 5 | CREATE_DATETIME |  |  | Y | Date | Create Date Time |

---

## Table: SVC_ITEM_SEARCH_TEMP

**Description:** This table is used to temporary store searched items (based on user criteria) that are required for creation of spreadsheet containing data for these items. Once the spreadsheet is created, the data is deleted from this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID |  |  | Y | NUMERIC (20) | The unique process-id for which this item needs to be processed. Maps to svc_process_tracker.process_id. |
| 2 | ITEM |  |  | Y | VARCHAR (25) | The searched item that needs to be processed for this process. |

---

## Table: SVC_ITEM_SEASONS

**Description:** This table holds XITEM messages ITEM_SEASONS records

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | The process-id of the process to which this record is associated to. Maps to SVC_PROCESS_TRACKER.PROCESS_ID. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Chunk-id to which this item and related records have been assigned to. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The relative sequence number for this row. |
| 4 | ACTION |  |  |  | VARCHAR (10) | The action-type i.e. ADD,MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10) | The status of the process i.e. P rocessed or E rror etc. |
| 6 | ITEM |  |  |  | VARCHAR (25) | The item number |
| 7 | SEASON_ID |  |  |  | NUMERIC (3) | Same as ITEM_SEASONS.SEASON_ID |
| 8 | PHASE_ID |  |  |  | NUMERIC (3) | Same as ITEM_SEASONS.PHASE_ID |
| 9 | ITEM_SEASON_SEQ_NO |  |  |  | NUMERIC (4) | Same as ITEM_SEASONS.ITEM_SEASON_SEQ_NO |
| 10 | DIFF_ID |  |  |  | VARCHAR (10) | Same as ITEM_SEASONS.DIFF_ID |
| 11 | CREATE_ID |  |  |  | VARCHAR (30) | The user who created this record. |
| 12 | CREATE_DATETIME |  |  |  | Date | The date and time when the record was created. |
| 13 | LAST_UPD_ID |  |  |  | VARCHAR (30) | The user who last updated the record. |
| 14 | LAST_UPD_DATETIME |  |  |  | Date | The date and time when the record was last updated. |

---

## Table: SVC_ITEM_SUPPLIER

**Description:** This is the staging table for Item Induction module. It is used to temporarily hold data before it is uploaded/updated in ITEM_SUPPLIER

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The data for a process is split in multiple chunks. The Chunk information is present in SVC_PROCESS_CHUNKS. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | ITEM |  |  |  | VARCHAR (25) | Refer to ITEM_SUPPLIER.ITEM. |
| 7 | SUPPLIER |  |  |  | NUMERIC (10) | Refer to ITEM_SUPPLIER.SUPPLIER. |
| 8 | PRIMARY_SUPP_IND |  |  |  | VARCHAR (1) | Refer to ITEM_SUPPLIER.PRIMARY_SUPP_IND. |
| 9 | VPN |  |  |  | VARCHAR (30) | Refer to ITEM_SUPPLIER.VPN. |
| 10 | SUPP_LABEL |  |  |  | VARCHAR (15) | Refer to ITEM_SUPPLIER.SUPP_LABEL. |
| 11 | CONSIGNMENT_RATE |  |  |  | NUMERIC (12,4) | Refer to ITEM_SUPPLIER.CONSIGNMENT_RATE. |
| 12 | SUPP_DIFF_1 |  |  |  | VARCHAR (120) | Refer to ITEM_SUPPLIER.SUPP_DIFF_1. |
| 13 | SUPP_DIFF_2 |  |  |  | VARCHAR (120) | Refer to ITEM_SUPPLIER.SUPP_DIFF_2. |
| 14 | SUPP_DIFF_3 |  |  |  | VARCHAR (120) | Refer to ITEM_SUPPLIER.SUPP_DIFF_3. |
| 15 | SUPP_DIFF_4 |  |  |  | VARCHAR (120) | Refer to ITEM_SUPPLIER.SUPP_DIFF_4. |
| 16 | PALLET_NAME |  |  |  | VARCHAR (6) | Refer to ITEM_SUPPLIER.PALLET_NAME. |
| 17 | CASE_NAME |  |  |  | VARCHAR (6) | Refer to ITEM_SUPPLIER.CASE_NAME. |
| 18 | INNER_NAME |  |  |  | VARCHAR (6) | Refer to ITEM_SUPPLIER.INNER_NAME. |
| 19 | SUPP_DISCONTINUE_DATE |  |  |  | Date | Refer to ITEM_SUPPLIER.SUPP_DISCONTINUE_DATE. |
| 20 | DIRECT_SHIP_IND |  |  |  | VARCHAR (1) | Refer to ITEM_SUPPLIER.DIRECT_SHIP_IND. |
| 21 | CONCESSION_RATE |  |  |  | NUMERIC (12,4) | Refer to ITEM_SUPPLIER.CONCESSION_RATE. |
| 22 | PRIMARY_CASE_SIZE |  |  |  | VARCHAR (6) | Refer to ITEM_SUPPLIER.PRIMARY_CASE_SIZE. |
| 23 | CREATE_ID |  |  |  | VARCHAR (30) | User who created the record. |
| 24 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 25 | LAST_UPD_ID |  |  |  | VARCHAR (30) | User who last updated the record. |
| 26 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_ITEM_SUPPLIER_CFA_EXT

**Description:** This is the staging table for Item Induction module. It is used to temporarily hold data before it is uploaded/updated in ITEM_SUPPLIER_CFA_EXT

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The data for a process is split in multiple chunks. The Chunk information is present in SVC_PROCESS_CHUNKS. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | ITEM |  |  |  | VARCHAR (25) | Refer to ITEM_SUPPLIER_CFA_EXT.ITEM. |
| 7 | SUPPLIER |  |  |  | NUMERIC (10) | Refer to ITEM_SUPPLIER_CFA_EXT.SUPPLIER. |
| 8 | GROUP_ID |  |  |  | NUMERIC (10) | Refer to ITEM_SUPPLIER_CFA_EXT.GROUP_ID. |
| 9 | VARCHAR2_1 |  |  |  | VARCHAR (250) | Refer to ITEM_SUPPLIER_CFA_EXT.VARCHAR2_1. |
| 10 | VARCHAR2_2 |  |  |  | VARCHAR (250) | Refer to ITEM_SUPPLIER_CFA_EXT.VARCHAR2_2. |
| 11 | VARCHAR2_3 |  |  |  | VARCHAR (250) | Refer to ITEM_SUPPLIER_CFA_EXT.VARCHAR2_3. |
| 12 | VARCHAR2_4 |  |  |  | VARCHAR (250) | Refer to ITEM_SUPPLIER_CFA_EXT.VARCHAR2_4. |
| 13 | VARCHAR2_5 |  |  |  | VARCHAR (250) | Refer to ITEM_SUPPLIER_CFA_EXT.VARCHAR2_5. |
| 14 | VARCHAR2_6 |  |  |  | VARCHAR (250) | Refer to ITEM_SUPPLIER_CFA_EXT.VARCHAR2_6. |
| 15 | VARCHAR2_7 |  |  |  | VARCHAR (250) | Refer to ITEM_SUPPLIER_CFA_EXT.VARCHAR2_7. |
| 16 | VARCHAR2_8 |  |  |  | VARCHAR (250) | Refer to ITEM_SUPPLIER_CFA_EXT.VARCHAR2_8. |
| 17 | VARCHAR2_9 |  |  |  | VARCHAR (250) | Refer to ITEM_SUPPLIER_CFA_EXT.VARCHAR2_9. |
| 18 | VARCHAR2_10 |  |  |  | VARCHAR (250) | Refer to ITEM_SUPPLIER_CFA_EXT.VARCHAR2_10. |
| 19 | NUMBER_11 |  |  |  | NUMERIC (22) | Refer to ITEM_SUPPLIER_CFA_EXT.NUMBER_11. |
| 20 | NUMBER_12 |  |  |  | NUMERIC (22) | Refer to ITEM_SUPPLIER_CFA_EXT.NUMBER_12. |
| 21 | NUMBER_13 |  |  |  | NUMERIC (22) | Refer to ITEM_SUPPLIER_CFA_EXT.NUMBER_13. |
| 22 | NUMBER_14 |  |  |  | NUMERIC (22) | Refer to ITEM_SUPPLIER_CFA_EXT.NUMBER_14. |
| 23 | NUMBER_15 |  |  |  | NUMERIC (22) | Refer to ITEM_SUPPLIER_CFA_EXT.NUMBER_15. |
| 24 | NUMBER_16 |  |  |  | NUMERIC (22) | Refer to ITEM_SUPPLIER_CFA_EXT.NUMBER_16. |
| 25 | NUMBER_17 |  |  |  | NUMERIC (22) | Refer to ITEM_SUPPLIER_CFA_EXT.NUMBER_17. |
| 26 | NUMBER_18 |  |  |  | NUMERIC (22) | Refer to ITEM_SUPPLIER_CFA_EXT.NUMBER_18. |
| 27 | NUMBER_19 |  |  |  | NUMERIC (22) | Refer to ITEM_SUPPLIER_CFA_EXT.NUMBER_19. |
| 28 | NUMBER_20 |  |  |  | NUMERIC (22) | Refer to ITEM_SUPPLIER_CFA_EXT.NUMBER_20. |
| 29 | DATE_21 |  |  |  | Date | Refer to ITEM_SUPPLIER_CFA_EXT.DATE_21. |
| 30 | DATE_22 |  |  |  | Date | Refer to ITEM_SUPPLIER_CFA_EXT.DATE_22. |
| 31 | CREATE_ID |  |  |  | VARCHAR (30) | User who created the record. |
| 32 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 33 | LAST_UPD_ID |  |  |  | VARCHAR (30) | User who last updated the record. |
| 34 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |
| 35 | DATE_23 |  |  |  | Date | Refer to SVC_ITEM_SUPPLIER_CFA_EXT.DATE_23. |
| 36 | DATE_24 |  |  |  | Date | Refer to SVC_ITEM_SUPPLIER_CFA_EXT.DATE_24. |
| 37 | DATE_25 |  |  |  | Date | Refer to SVC_ITEM_SUPPLIER_CFA_EXT.DATE_25. |

---

## Table: SVC_ITEM_SUPPLIER_TL

**Description:** This is a staging table used for item induction spreadsheet upload process. It is used to temporarily hold data before it is uploaded/updated in ITEM_SUPPLIER_TL.'

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | LANG |  |  |  | NUMERIC (6) | Refer to ITEM_SUPPLIER_TL.LANG column. |
| 7 | ITEM |  |  |  | VARCHAR (25 ) | Refer to ITEM_SUPPLIER_TL.ITEM column. |
| 8 | SUPPLIER |  |  |  | NUMERIC (10) | Refer to ITEM_SUPPLIER_TL.SUPPLIER column. |
| 9 | SUPP_LABEL |  |  |  | VARCHAR (15 ) | Refer to ITEM_SUPPLIER_TL.SUPP_LABEL column. |
| 10 | SUPP_DIFF_1 |  |  |  | VARCHAR (120 ) | Refer to ITEM_SUPPLIER_TL.SUPP_DIFF_1 column. |
| 11 | SUPP_DIFF_2 |  |  |  | VARCHAR (120 ) | Refer to ITEM_SUPPLIER_TL.SUPP_DIFF_2 column. |
| 12 | SUPP_DIFF_3 |  |  |  | VARCHAR (120 ) | Refer to ITEM_SUPPLIER_TL.SUPP_DIFF_3 column. |
| 13 | SUPP_DIFF_4 |  |  |  | VARCHAR (120 ) | Refer to ITEM_SUPPLIER_TL.SUPP_DIFF_4 column. |
| 14 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 15 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 16 | LAST_UPDATE_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 17 | LAST_UPDATE_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_ITEM_SUPP_COUNTRY

**Description:** This is the staging table for Item Induction module. It is used to temporarily hold data before it is uploaded/updated in ITEM_SUPP_COUNTRY

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The data for a process is split in multiple chunks. The Chunk information is present in SVC_PROCESS_CHUNKS. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | ITEM |  |  |  | VARCHAR (25) | Refer to ITEM_SUPP_COUNTRY.ITEM. |
| 7 | SUPPLIER |  |  |  | NUMERIC (10) | Refer to ITEM_SUPP_COUNTRY.SUPPLIER. |
| 8 | ORIGIN_COUNTRY_ID |  |  |  | VARCHAR (3) | Refer to ITEM_SUPP_COUNTRY.ORIGIN_COUNTRY_ID. |
| 9 | UNIT_COST |  |  |  | NUMERIC (20,4) | Refer to ITEM_SUPP_COUNTRY.UNIT_COST. |
| 10 | LEAD_TIME |  |  |  | NUMERIC (4) | Refer to ITEM_SUPP_COUNTRY.LEAD_TIME. |
| 11 | PICKUP_LEAD_TIME |  |  |  | NUMERIC (4) | Refer to ITEM_SUPP_COUNTRY.PICKUP_LEAD_TIME. |
| 12 | SUPP_PACK_SIZE |  |  |  | NUMERIC (12,4) | Refer to ITEM_SUPP_COUNTRY.SUPP_PACK_SIZE. |
| 13 | INNER_PACK_SIZE |  |  |  | NUMERIC (12,4) | Refer to ITEM_SUPP_COUNTRY.INNER_PACK_SIZE. |
| 14 | ROUND_LVL |  |  |  | VARCHAR (6) | Refer to ITEM_SUPP_COUNTRY.ROUND_LVL. |
| 15 | ROUND_TO_INNER_PCT |  |  |  | NUMERIC (12,4) | Refer to ITEM_SUPP_COUNTRY.ROUND_TO_INNER_PCT. |
| 16 | ROUND_TO_CASE_PCT |  |  |  | NUMERIC (12,4) | Refer to ITEM_SUPP_COUNTRY.ROUND_TO_CASE_PCT. |
| 17 | ROUND_TO_LAYER_PCT |  |  |  | NUMERIC (12,4) | Refer to ITEM_SUPP_COUNTRY.ROUND_TO_LAYER_PCT. |
| 18 | ROUND_TO_PALLET_PCT |  |  |  | NUMERIC (12,4) | Refer to ITEM_SUPP_COUNTRY.ROUND_TO_PALLET_PCT. |
| 19 | MIN_ORDER_QTY |  |  |  | NUMERIC (12,4) | Refer to ITEM_SUPP_COUNTRY.MIN_ORDER_QTY. |
| 20 | MAX_ORDER_QTY |  |  |  | NUMERIC (12,4) | Refer to ITEM_SUPP_COUNTRY.MAX_ORDER_QTY. |
| 21 | PACKING_METHOD |  |  |  | VARCHAR (6) | Refer to ITEM_SUPP_COUNTRY.PACKING_METHOD. |
| 22 | PRIMARY_SUPP_IND |  |  |  | VARCHAR (1) | Refer to ITEM_SUPP_COUNTRY.PRIMARY_SUPP_IND. |
| 23 | PRIMARY_COUNTRY_IND |  |  |  | VARCHAR (1) | Refer to ITEM_SUPP_COUNTRY.PRIMARY_COUNTRY_IND. |
| 24 | DEFAULT_UOP |  |  |  | VARCHAR (6) | Refer to ITEM_SUPP_COUNTRY.DEFAULT_UOP. |
| 25 | TI |  |  |  | NUMERIC (12,4) | Refer to ITEM_SUPP_COUNTRY.TI. |
| 26 | HI |  |  |  | NUMERIC (12,4) | Refer to ITEM_SUPP_COUNTRY.HI. |
| 27 | SUPP_HIER_TYPE_1 |  |  |  | VARCHAR (6) | Refer to ITEM_SUPP_COUNTRY.SUPP_HIER_TYPE_1. |
| 28 | SUPP_HIER_LVL_1 |  |  |  | VARCHAR (10) | Refer to ITEM_SUPP_COUNTRY.SUPP_HIER_LVL_1. |
| 29 | SUPP_HIER_TYPE_2 |  |  |  | VARCHAR (6) | Refer to ITEM_SUPP_COUNTRY.SUPP_HIER_TYPE_2. |
| 30 | SUPP_HIER_LVL_2 |  |  |  | VARCHAR (10) | Refer to ITEM_SUPP_COUNTRY.SUPP_HIER_LVL_2. |
| 31 | SUPP_HIER_TYPE_3 |  |  |  | VARCHAR (6) | Refer to ITEM_SUPP_COUNTRY.SUPP_HIER_TYPE_3. |
| 32 | SUPP_HIER_LVL_3 |  |  |  | VARCHAR (10) | Refer to ITEM_SUPP_COUNTRY.SUPP_HIER_LVL_3. |
| 33 | COST_UOM |  |  |  | VARCHAR (4) | Refer to ITEM_SUPP_COUNTRY.COST_UOM. |
| 34 | TOLERANCE_TYPE |  |  |  | VARCHAR (6) | Refer to ITEM_SUPP_COUNTRY.TOLERANCE_TYPE. |
| 35 | MAX_TOLERANCE |  |  |  | NUMERIC (12,4) | Refer to ITEM_SUPP_COUNTRY.MAX_TOLERANCE. |
| 36 | MIN_TOLERANCE |  |  |  | NUMERIC (12,4) | Refer to ITEM_SUPP_COUNTRY.MIN_TOLERANCE. |
| 37 | NEGOTIATED_ITEM_COST |  |  |  | NUMERIC (20,4) | Refer to ITEM_SUPP_COUNTRY.NEGOTIATED_ITEM_COST. |
| 38 | EXTENDED_BASE_COST |  |  |  | NUMERIC (20,4) | Refer to ITEM_SUPP_COUNTRY.EXTENDED_BASE_COST. |
| 39 | INCLUSIVE_COST |  |  |  | NUMERIC (20,4) | Refer to ITEM_SUPP_COUNTRY.INCLUSIVE_COST. |
| 40 | BASE_COST |  |  |  | NUMERIC (20,4) | Refer to ITEM_SUPP_COUNTRY.BASE_COST. |
| 41 | CREATE_ID |  |  |  | VARCHAR (30) | User who created the record. |
| 42 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 43 | LAST_UPD_ID |  |  |  | VARCHAR (30) | User who last updated the record. |
| 44 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_ITEM_SUPP_COUNTRY_CFA_EXT

**Description:** This is the staging table for Item Induction module. It is used to temporarily hold data before it is uploaded/updated in ITEM_SUPP_COUNTRY_CFA_EXT

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The data for a process is split in multiple chunks. The Chunk information is present in SVC_PROCESS_CHUNKS. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | ITEM |  |  |  | VARCHAR (25) | Refer to ITEM_SUPP_COUNTRY_CFA_EXT.ITEM. |
| 7 | SUPPLIER |  |  |  | NUMERIC (10) | Refer to ITEM_SUPP_COUNTRY_CFA_EXT.SUPPLIER. |
| 8 | ORIGIN_COUNTRY_ID |  |  |  | VARCHAR (3) | Refer to ITEM_SUPP_COUNTRY_CFA_EXT.ORIGIN_COUNTRY_ID. |
| 9 | GROUP_ID |  |  |  | NUMERIC (10) | Refer to ITEM_SUPP_COUNTRY_CFA_EXT.GROUP_ID. |
| 10 | VARCHAR2_1 |  |  |  | VARCHAR (250) | Refer to ITEM_SUPP_COUNTRY_CFA_EXT.VARCHAR2_1. |
| 11 | VARCHAR2_2 |  |  |  | VARCHAR (250) | Refer to ITEM_SUPP_COUNTRY_CFA_EXT.VARCHAR2_2. |
| 12 | VARCHAR2_3 |  |  |  | VARCHAR (250) | Refer to ITEM_SUPP_COUNTRY_CFA_EXT.VARCHAR2_3. |
| 13 | VARCHAR2_4 |  |  |  | VARCHAR (250) | Refer to ITEM_SUPP_COUNTRY_CFA_EXT.VARCHAR2_4. |
| 14 | VARCHAR2_5 |  |  |  | VARCHAR (250) | Refer to ITEM_SUPP_COUNTRY_CFA_EXT.VARCHAR2_5. |
| 15 | VARCHAR2_6 |  |  |  | VARCHAR (250) | Refer to ITEM_SUPP_COUNTRY_CFA_EXT.VARCHAR2_6. |
| 16 | VARCHAR2_7 |  |  |  | VARCHAR (250) | Refer to ITEM_SUPP_COUNTRY_CFA_EXT.VARCHAR2_7. |
| 17 | VARCHAR2_8 |  |  |  | VARCHAR (250) | Refer to ITEM_SUPP_COUNTRY_CFA_EXT.VARCHAR2_8. |
| 18 | VARCHAR2_9 |  |  |  | VARCHAR (250) | Refer to ITEM_SUPP_COUNTRY_CFA_EXT.VARCHAR2_9. |
| 19 | VARCHAR2_10 |  |  |  | VARCHAR (250) | Refer to ITEM_SUPP_COUNTRY_CFA_EXT.VARCHAR2_10. |
| 20 | NUMBER_11 |  |  |  | NUMERIC (22) | Refer to ITEM_SUPP_COUNTRY_CFA_EXT.NUMBER_11. |
| 21 | NUMBER_12 |  |  |  | NUMERIC (22) | Refer to ITEM_SUPP_COUNTRY_CFA_EXT.NUMBER_12. |
| 22 | NUMBER_13 |  |  |  | NUMERIC (22) | Refer to ITEM_SUPP_COUNTRY_CFA_EXT.NUMBER_13. |
| 23 | NUMBER_14 |  |  |  | NUMERIC (22) | Refer to ITEM_SUPP_COUNTRY_CFA_EXT.NUMBER_14. |
| 24 | NUMBER_15 |  |  |  | NUMERIC (22) | Refer to ITEM_SUPP_COUNTRY_CFA_EXT.NUMBER_15. |
| 25 | NUMBER_16 |  |  |  | NUMERIC (22) | Refer to ITEM_SUPP_COUNTRY_CFA_EXT.NUMBER_16. |
| 26 | NUMBER_17 |  |  |  | NUMERIC (22) | Refer to ITEM_SUPP_COUNTRY_CFA_EXT.NUMBER_17. |
| 27 | NUMBER_18 |  |  |  | NUMERIC (22) | Refer to ITEM_SUPP_COUNTRY_CFA_EXT.NUMBER_18. |
| 28 | NUMBER_19 |  |  |  | NUMERIC (22) | Refer to ITEM_SUPP_COUNTRY_CFA_EXT.NUMBER_19. |
| 29 | NUMBER_20 |  |  |  | NUMERIC (22) | Refer to ITEM_SUPP_COUNTRY_CFA_EXT.NUMBER_20. |
| 30 | DATE_21 |  |  |  | Date | Refer to ITEM_SUPP_COUNTRY_CFA_EXT.DATE_21. |
| 31 | DATE_22 |  |  |  | Date | Refer to ITEM_SUPP_COUNTRY_CFA_EXT.DATE_22. |
| 32 | CREATE_ID |  |  |  | VARCHAR (30) | User who created the record. |
| 33 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 34 | LAST_UPD_ID |  |  |  | VARCHAR (30) | User who last updated the record. |
| 35 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |
| 36 | DATE_23 |  |  |  | Date | Refer to SVC_ITEM_SUPP_COUNTRY_CFA_EXT.DATE_23. |
| 37 | DATE_24 |  |  |  | Date | Refer to SVC_ITEM_SUPP_COUNTRY_CFA_EXT.DATE_24. |
| 38 | DATE_25 |  |  |  | Date | Refer to SVC_ITEM_SUPP_COUNTRY_CFA_EXT.DATE_25. |

---

## Table: SVC_ITEM_SUPP_COUNTRY_DIM

**Description:** This is the staging table for Item Induction module. It is used to temporarily hold data before it is uploaded/updated in ITEM_SUPP_COUNTRY_DIM

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The data for a process is split in multiple chunks. The Chunk information is present in SVC_PROCESS_CHUNKS. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | ITEM |  |  |  | VARCHAR (25) | Refer to ITEM_SUPP_COUNTRY_DIM.ITEM. |
| 7 | SUPPLIER |  |  |  | NUMERIC (10) | Refer to ITEM_SUPP_COUNTRY_DIM.SUPPLIER. |
| 8 | ORIGIN_COUNTRY |  |  |  | VARCHAR (3) | Refer to ITEM_SUPP_COUNTRY_DIM.ORIGIN_COUNTRY. |
| 9 | DIM_OBJECT |  |  |  | VARCHAR (6) | Refer to ITEM_SUPP_COUNTRY_DIM.DIM_OBJECT. |
| 10 | PRESENTATION_METHOD |  |  |  | VARCHAR (6) | Refer to ITEM_SUPP_COUNTRY_DIM.PRESENTATION_METHOD. |
| 11 | LENGTH |  |  |  | NUMERIC (12,4) | Refer to ITEM_SUPP_COUNTRY_DIM.LENGTH. |
| 12 | WIDTH |  |  |  | NUMERIC (12,4) | Refer to ITEM_SUPP_COUNTRY_DIM.WIDTH. |
| 13 | HEIGHT |  |  |  | NUMERIC (12,4) | Refer to ITEM_SUPP_COUNTRY_DIM.HEIGHT. |
| 14 | LWH_UOM |  |  |  | VARCHAR (4) | Refer to ITEM_SUPP_COUNTRY_DIM.LWH_UOM. |
| 15 | WEIGHT |  |  |  | NUMERIC (12,4) | Refer to ITEM_SUPP_COUNTRY_DIM.WEIGHT. |
| 16 | NET_WEIGHT |  |  |  | NUMERIC (12,4) | Refer to ITEM_SUPP_COUNTRY_DIM.NET_WEIGHT. |
| 17 | WEIGHT_UOM |  |  |  | VARCHAR (4) | Refer to ITEM_SUPP_COUNTRY_DIM.WEIGHT_UOM. |
| 18 | LIQUID_VOLUME |  |  |  | NUMERIC (12,4) | Refer to ITEM_SUPP_COUNTRY_DIM.LIQUID_VOLUME. |
| 19 | LIQUID_VOLUME_UOM |  |  |  | VARCHAR (4) | Refer to ITEM_SUPP_COUNTRY_DIM.LIQUID_VOLUME_UOM. |
| 20 | STAT_CUBE |  |  |  | NUMERIC (12,4) | Refer to ITEM_SUPP_COUNTRY_DIM.STAT_CUBE. |
| 21 | TARE_WEIGHT |  |  |  | NUMERIC (12,4) | Refer to ITEM_SUPP_COUNTRY_DIM.TARE_WEIGHT. |
| 22 | TARE_TYPE |  |  |  | VARCHAR (6) | Refer to ITEM_SUPP_COUNTRY_DIM.TARE_TYPE. |
| 23 | CREATE_ID |  |  |  | VARCHAR (30) | User who created the record. |
| 24 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 25 | LAST_UPD_ID |  |  |  | VARCHAR (30) | User who last updated the record. |
| 26 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_ITEM_SUPP_COUNTRY_LOC

**Description:** This is the staging table for Item Induction module. It is used to temporarily hold data before it is uploaded/updated in ITEM_SUPP_COUNTRY_LOC

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The data for a process is split in multiple chunks. The Chunk information is present in SVC_PROCESS_CHUNKS. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | ITEM |  |  |  | VARCHAR (25 ) | Refer to ITEM_SUPP_COUNTRY_LOC.ITEM. |
| 7 | SUPPLIER |  |  |  | NUMERIC (10) | Refer to ITEM_SUPP_COUNTRY_LOC.SUPPLIER. |
| 8 | ORIGIN_COUNTRY_ID |  |  |  | VARCHAR (3 ) | Refer to ITEM_SUPP_COUNTRY_LOC.ORIGIN_COUNTRY_ID. |
| 9 | LOC |  |  |  | NUMERIC (10) | Refer to ITEM_SUPP_COUNTRY_LOC.LOC. |
| 10 | LOC_TYPE |  |  |  | VARCHAR (1 BYTE) | Refer to ITEM_SUPP_COUNTRY_LOC.LOC_TYPE. |
| 11 | PRIMARY_LOC_IND |  |  |  | VARCHAR (1 BYTE) | Refer to ITEM_SUPP_COUNTRY_LOC.PRIMARY_LOC_IND. |
| 12 | UNIT_COST |  |  |  | NUMERIC (20,4) | Refer to ITEM_SUPP_COUNTRY_LOC.UNIT_COST. |
| 13 | ROUND_LVL |  |  |  | VARCHAR (6 ) | Refer to ITEM_SUPP_COUNTRY_LOC.ROUND_LVL. |
| 14 | ROUND_TO_INNER_PCT |  |  |  | NUMERIC (12,4) | Refer to ITEM_SUPP_COUNTRY_LOC.ROUND_TO_INNER_PCT. |
| 15 | ROUND_TO_CASE_PCT |  |  |  | NUMERIC (12,4) | Refer to ITEM_SUPP_COUNTRY_LOC.ROUND_TO_CASE_PCT. |
| 16 | ROUND_TO_LAYER_PCT |  |  |  | NUMERIC (12,4) | Refer to ITEM_SUPP_COUNTRY_LOC.ROUND_TO_LAYER_PCT. |
| 17 | ROUND_TO_PALLET_PCT |  |  |  | NUMERIC (12,4) | Refer to ITEM_SUPP_COUNTRY_LOC.ROUND_TO_PALLET_PCT. |
| 18 | SUPP_HIER_TYPE_1 |  |  |  | VARCHAR (6 ) | Refer to ITEM_SUPP_COUNTRY_LOC.SUPP_HIER_TYPE_1. |
| 19 | SUPP_HIER_LVL_1 |  |  |  | VARCHAR (10 ) | Refer to ITEM_SUPP_COUNTRY_LOC.SUPP_HIER_LVL_1. |
| 20 | SUPP_HIER_TYPE_2 |  |  |  | VARCHAR (6 ) | Refer to ITEM_SUPP_COUNTRY_LOC.SUPP_HIER_TYPE_2. |
| 21 | SUPP_HIER_LVL_2 |  |  |  | VARCHAR (10 ) | Refer to ITEM_SUPP_COUNTRY_LOC.SUPP_HIER_LVL_2. |
| 22 | SUPP_HIER_TYPE_3 |  |  |  | VARCHAR (6 ) | Refer to ITEM_SUPP_COUNTRY_LOC.SUPP_HIER_TYPE_3. |
| 23 | SUPP_HIER_LVL_3 |  |  |  | VARCHAR (10 ) | Refer to ITEM_SUPP_COUNTRY_LOC.SUPP_HIER_LVL_3. |
| 24 | PICKUP_LEAD_TIME |  |  |  | NUMERIC (4) | Refer to ITEM_SUPP_COUNTRY_LOC.PICKUP_LEAD_TIME. |
| 25 | CREATE_DATETIME |  |  |  | Date | Refer to ITEM_SUPP_COUNTRY_LOC.CREATE_DATETIME. |
| 26 | LAST_UPD_DATETIME |  |  |  | Date | Refer to ITEM_SUPP_COUNTRY_LOC.LAST_UPD_DATETIME. |
| 27 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | Refer to ITEM_SUPP_COUNTRY_LOC.LAST_UPD_ID. |
| 28 | NEGOTIATED_ITEM_COST |  |  |  | NUMERIC (20,4) | Refer to ITEM_SUPP_COUNTRY_LOC.NEGOTIATED_ITEM_COST. |
| 29 | EXTENDED_BASE_COST |  |  |  | NUMERIC (20,4) | Refer to ITEM_SUPP_COUNTRY_LOC.EXTENDED_BASE_COST. |
| 30 | INCLUSIVE_COST |  |  |  | NUMERIC (20,4) | Refer to ITEM_SUPP_COUNTRY_LOC.INCLUSIVE_COST. |
| 31 | BASE_COST |  |  |  | NUMERIC (20,4) | Refer to ITEM_SUPP_COUNTRY_LOC.BASE_COST. |
| 32 | CREATE_ID |  |  |  | VARCHAR (30 ) | Refer to ITEM_SUPP_COUNTRY_LOC.CREATE_ID. |

---

## Table: SVC_ITEM_SUPP_MANU_COUNTRY

**Description:** This is the staging table for Item Induction module. It is used to temporarily hold data before it is uploaded/updated in ITEM_SUPP_MANU_COUNTRY

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The data for a process is split in multiple chunks. The Chunk information is present in SVC_PROCESS_CHUNKS. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | ITEM |  |  |  | VARCHAR (25) | Refer to ITEM_SUPP_MANU_COUNTRY.ITEM. |
| 7 | SUPPLIER |  |  |  | NUMERIC (10) | Refer to ITEM_SUPP_MANU_COUNTRY.SUPPLIER. |
| 8 | MANU_COUNTRY_ID |  |  |  | VARCHAR (3) | Refer to ITEM_SUPP_MANU_COUNTRY.MANU_COUNTRY_ID. |
| 9 | PRIMARY_MANU_CTRY_IND |  |  |  | VARCHAR (1) | Refer to ITEM_SUPP_MANU_COUNTRY.PRIMARY_MANU_CTRY_IND. |
| 10 | CREATE_ID |  |  |  | VARCHAR (30) | User who created the record. |
| 11 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 12 | LAST_UPD_ID |  |  |  | VARCHAR (30) | User who last updated the record. |
| 13 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_ITEM_SUPP_UOM

**Description:** This is the staging table for Item Induction module. It is used to temporarily hold data before it is uploaded/updated in ITEM_SUPP_UOM

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The data for a process is split in multiple chunks. The Chunk information is present in SVC_PROCESS_CHUNKS. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | ITEM |  |  |  | VARCHAR (25) | Refer to ITEM_SUPP_UOM.ITEM. |
| 7 | SUPPLIER |  |  |  | NUMERIC (10) | Refer to ITEM_SUPP_UOM.SUPPLIER. |
| 8 | UOM |  |  |  | VARCHAR (4) | Refer to ITEM_SUPP_UOM.UOM. |
| 9 | VALUE |  |  |  | NUMERIC (20,4) | Refer to ITEM_SUPP_UOM.VALUE. |
| 10 | CREATE_ID |  |  |  | VARCHAR (30) | User who created the record. |
| 11 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 12 | LAST_UPD_ID |  |  |  | VARCHAR (30) | User who last updated the record. |
| 13 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_ITEM_XFORM_DETAIL

**Description:** This is the staging table for Item Induction module. It is used to temporarily hold data before it is uploaded/updated in ITEM_XFORM_DETAIL

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The data for a process is split in multiple chunks. The Chunk information is present in SVC_PROCESS_CHUNKS. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | ITEM_XFORM_DETAIL_ID |  |  |  | NUMERIC (15) | Refer to ITEM_XFORM_DETAIL.ITEM_XFORM_DETAIL_ID. |
| 7 | HEAD_ITEM |  |  |  | VARCHAR (25) | Refer to ITEM_XFORM_HEAD.HEAD_ITEM. |
| 8 | ITEM_XFORM_HEAD_ID |  |  |  | NUMERIC (10) | Refer to ITEM_XFORM_DETAIL.ITEM_XFORM_HEAD_ID. |
| 9 | DETAIL_ITEM |  |  |  | VARCHAR (25) | Refer to ITEM_XFORM_DETAIL.DETAIL_ITEM. |
| 10 | ITEM_QUANTITY_PCT |  |  |  | NUMERIC (12,4) | Refer to ITEM_XFORM_DETAIL.ITEM_QUANTITY_PCT. |
| 11 | YIELD_FROM_HEAD_ITEM_PCT |  |  |  | NUMERIC (12,4) | Refer to ITEM_XFORM_DETAIL.YIELD_FROM_HEAD_ITEM_PCT. |
| 12 | CREATE_ID |  |  |  | VARCHAR (30) | User who created the record. |
| 13 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 14 | LAST_UPD_ID |  |  |  | VARCHAR (30) | User who last updated the record. |
| 15 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_ITEM_XFORM_HEAD

**Description:** This is the staging table for Item Induction module. It is used to temporarily hold data before it is uploaded/updated in ITEM_XFORM_HEAD

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The data for a process is split in multiple chunks. The Chunk information is present in SVC_PROCESS_CHUNKS. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | ITEM_XFORM_HEAD_ID |  |  |  | NUMERIC (10) | Refer to ITEM_XFORM_HEAD.ITEM_XFORM_HEAD_ID. |
| 7 | HEAD_ITEM |  |  |  | VARCHAR (25) | Refer to ITEM_XFORM_HEAD.HEAD_ITEM. |
| 8 | ITEM_XFORM_TYPE |  |  |  | VARCHAR (6) | Refer to ITEM_XFORM_HEAD.ITEM_XFORM_TYPE. |
| 9 | ITEM_XFORM_DESC |  |  |  | VARCHAR (250) | Refer to ITEM_XFORM_HEAD.ITEM_XFORM_DESC. |
| 10 | PRODUCTION_LOSS_PCT |  |  |  | NUMERIC (12,4) | Refer to ITEM_XFORM_HEAD.PRODUCTION_LOSS_PCT. |
| 11 | COMMENTS_DESC |  |  |  | VARCHAR (2000) | Refer to ITEM_XFORM_HEAD.COMMENTS_DESC. |
| 12 | CREATE_ID |  |  |  | VARCHAR (30) | User who created the record. |
| 13 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 14 | LAST_UPD_ID |  |  |  | VARCHAR (30) | User who last updated the record. |
| 15 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_ITEM_XFORM_HEAD_TL

**Description:** This is a staging table used for item induction spreadsheet upload process. It is used to temporarily hold data before it is uploaded/updated in ITEM_XFORM_HEAD_TL.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | LANG |  |  |  | NUMERIC (6) | Refer to ITEM_XFORM_HEAD_TL.LANG column. |
| 7 | HEAD_ITEM |  |  |  | VARCHAR (25 ) | Refer to ITEM_XFORM_HEAD.HEAD_ITEM. |
| 8 | ITEM_XFORM_HEAD_ID |  |  |  | NUMERIC (10) | Refer to ITEM_XFORM_HEAD_TL.ITEM_XFORM_HEAD_ID column. |
| 9 | ITEM_XFORM_DESC |  |  |  | VARCHAR (250 ) | Refer to ITEM_XFORM_HEAD_TL.ITEM_XFORM_DESC column. |
| 10 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 11 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 12 | LAST_UPDATE_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 13 | LAST_UPDATE_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_UDA

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in UDA.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | UDA_ID |  |  |  | NUMERIC (5) | This field contains a unique number identifying the User Defined Attribute. |
| 7 | UDA_DESC |  |  |  | VARCHAR (120 ) | This field contains a description of the User-Defined Attribute. |
| 8 | MODULE |  |  |  | VARCHAR (20 ) | This field identifies which module the UDA belongs to. Valid value is: ITEM |
| 9 | DISPLAY_TYPE |  |  |  | VARCHAR (2 ) | This field is used to store the display type (how the UDA values will be displayed to the user) for the given UDA. The valid values are DT-Date, FF -Free From, LV - List of values. |
| 10 | DATA_TYPE |  |  |  | VARCHAR (12 ) | This field contains the data type of any valid values for the UDA. This is an optional field used only if specific processing is needed to validate the data type of the UDA values. Valid values are: Number, Alphanumeric and Date. |
| 11 | DATA_LENGTH |  |  |  | NUMERIC (3) | This field contains the data length of any valid values for the UDA. |
| 12 | SINGLE_VALUE_IND |  |  |  | VARCHAR (1 ) | This field indicates whether or not the UDA should be constrained to having at most one value. |
| 13 | FILTER_ORG_ID |  |  |  | NUMERIC (10) | This field contains the ID of the Organizational Hierarchy that the UDA is assigned to. |
| 14 | FILTER_MERCH_ID |  |  |  | NUMERIC (4) | This field contains the ID of the Merchandise Hierarchy that the UDA is assigned to. |
| 15 | FILTER_MERCH_ID_CLASS |  |  |  | NUMERIC (4) | This field contains the class ID of the Merchandise Hierarchy that the UDA is assigned to. |
| 16 | FILTER_MERCH_ID_SUBCLASS |  |  |  | NUMERIC (4) | This field contains the subclass ID of the Merchandise Hierarchy that the UDA is assigned to. |
| 17 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 18 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 19 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 20 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_UDA_ITEM_DATE

**Description:** This is the staging table for Item Induction module. It is used to temporarily hold data before it is uploaded/updated in UDA_ITEM_DATE

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The data for a process is split in multiple chunks. The Chunk information is present in SVC_PROCESS_CHUNKS. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | ITEM |  |  |  | VARCHAR (25) | Refer to UDA_ITEM_DATE.ITEM. |
| 7 | UDA_ID |  |  |  | NUMERIC (5) | Refer to UDA_ITEM_DATE.UDA_ID. |
| 8 | UDA_DATE |  |  |  | Date | Refer to UDA_ITEM_DATE.UDA_DATE. |
| 9 | CREATE_ID |  |  |  | VARCHAR (30) | User who created the record. |
| 10 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 11 | LAST_UPD_ID |  |  |  | VARCHAR (30) | User who last updated the record. |
| 12 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_UDA_ITEM_DEFAULTS

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in UDA_ITEM_DEFAULTS.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | UDA_ID |  |  |  | NUMERIC (5) | This field contains a unique number identifying the User Defined Attribute. |
| 7 | DEPT |  |  |  | NUMERIC (4) | This field contains the department for which the default is being set-up. |
| 8 | CLASS |  |  |  | NUMERIC (4) | This field contains the class for which the default is being set-up. |
| 9 | SUBCLASS |  |  |  | NUMERIC (4) | This field contains the subclass for which the default is being set-up. |
| 10 | UDA_VALUE |  |  |  | NUMERIC (5) | This is an optional field in which a default value can be assigned, such that all items created in the hierarchy level will be assigned this UDA value initially. |
| 11 | UDA_VALUE_UPD |  |  |  | NUMERIC (5) | This column is used to update the UDA_VALUE field. This is an optional field in which a default value can be assigned, such that all items created in the hierarchy level will be assigned this UDA value initially. |
| 12 | REQUIRED_IND |  |  |  | VARCHAR (1 ) | This field indicates whether or not the specified attribute is required. If Y is chosen, then all items within the specified hierarchy must already have a value for this UDA. |
| 13 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 14 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 15 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 16 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_UDA_ITEM_FF

**Description:** This is the staging table for Item Induction module. It is used to temporarily hold data before it is uploaded/updated in UDA_ITEM_FF

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The data for a process is split in multiple chunks. The Chunk information is present in SVC_PROCESS_CHUNKS. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | ITEM |  |  |  | VARCHAR (25) | Refer to UDA_ITEM_FF.ITEM. |
| 7 | UDA_ID |  |  |  | NUMERIC (5) | Refer to UDA_ITEM_FF.UDA_ID. |
| 8 | UDA_TEXT |  |  |  | VARCHAR (250) | Refer to UDA_ITEM_FF.UDA_TEXT. |
| 9 | CREATE_ID |  |  |  | VARCHAR (30) | User who created the record. |
| 10 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 11 | LAST_UPD_ID |  |  |  | VARCHAR (30) | User who last updated the record. |
| 12 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_UDA_ITEM_LOV

**Description:** This is the staging table for Item Induction module. It is used to temporarily hold data before it is uploaded/updated in UDA_ITEM_LOV

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The data for a process is split in multiple chunks. The Chunk information is present in SVC_PROCESS_CHUNKS. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | ITEM |  |  |  | VARCHAR (25) | Refer to UDA_ITEM_LOV.ITEM. |
| 7 | UDA_ID |  |  |  | NUMERIC (5) | Refer to UDA_ITEM_LOV.UDA_ID. |
| 8 | UDA_VALUE |  |  |  | NUMERIC (5) | Refer to UDA_ITEM_LOV.UDA_VALUE. |
| 9 | CREATE_ID |  |  |  | VARCHAR (30) | User who created the record. |
| 10 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 11 | LAST_UPD_ID |  |  |  | VARCHAR (30) | User who last updated the record. |
| 12 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_UDA_TL

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in UDA_TL.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | LANG |  |  |  | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 7 | UDA_ID |  |  |  | NUMERIC (5) | This field contains a unique number identifying the User Defined Attribute. |
| 8 | UDA_DESC |  |  |  | VARCHAR (120) | This field contains a description of the User-Defined Attribute. |

---

## Table: SVC_UDA_VALUES

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in UDA_VALUES.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | UDA_ID |  |  |  | NUMERIC (5) | This field contains a unique number identifying the User Defined Attribute. |
| 7 | UDA_VALUE |  |  |  | NUMERIC (5) | This field contains a unique number identifying the User Defined Attribute value for the UDA. A UDA can have multiple values. For example, Color can be a UDA and it can have different values like Green, Red, Blue, etc. |
| 8 | UDA_VALUE_DESC |  |  |  | VARCHAR (250 ) | This field contains a description of the UDA value. |
| 9 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 10 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 11 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 12 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_UDA_VALUES_TL

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in UDA_VALUES_TL.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | LANG |  |  |  | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 7 | UDA_ID |  |  |  | NUMERIC (5) | This field contains a unique number identifying the User Defined Attribute. |
| 8 | UDA_VALUE |  |  |  | NUMERIC (5) | This field contains a unique number identifying the User Defined Attribute value for the UDA. A UDA can have multiple values. For example, Color can be a UDA and it can have different values like Green, Red, Blue, etc. |
| 9 | UDA_VALUE_DESC |  |  |  | VARCHAR (250) | This field contains a description of the UDA value. |
