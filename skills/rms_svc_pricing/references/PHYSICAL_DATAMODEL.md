# RMS Service Uploads - Pricing & Promotions Datamodel - Physical Data Model Reference

## Table: SVC_COST_CHG_REASON_TL

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated to COST_CHG_REASON_TL.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | LANG |  |  |  | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 7 | REASON |  |  |  | NUMERIC (2) | Contains the number which uniquely identifies the reason for the cost change. |
| 8 | REASON_DESC |  |  |  | VARCHAR (120 ) | Holds the description of the cost change reason code in a given language. |
| 9 | ORIG_LANG_IND |  |  |  | VARCHAR (1 ) | Indicates if the description is in the original language entered for the inventory status type. It is set to ''Y'' when the first record is written to the table for the inventory status types. |
| 10 | REVIEWED_IND |  |  |  | VARCHAR (1 ) | Indicates if the description needs to be reviewed for translation. It is set to ''N'' when the description in the original language is inserted or updated. We assume that clients will regularly run reports on all strings that are not reviewed (i.e. reviewed_ind = ''N''). When translation either provides a new string, or OKs that the existing string is correct, the reviewed_ind should be set to ''Y''. |

---

## Table: SVC_COST_CHG_RSN_TL

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in COST_CHG_REASON and COST_CHG_REASON_TL.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | REASON |  |  |  | NUMERIC (2) | Contains the number which uniquely identifies the reason for the cost change. |
| 7 | REASON_DESC |  |  |  | VARCHAR (120 ) | Contains the description which, along with the reason number, identifies the cost change reason. |
| 8 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 9 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 10 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 11 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_COST_CHG_SEARCH_TEMP

**Description:** This table temporarily stores the cost changes searched by the user using item induction form.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (20) | The process id against which the cost change search is performed. |
| 2 | COST_CHANGE | P |  | Y | NUMERIC (8) | The cost change number retrieved from search. |

---

## Table: SVC_COST_COMP_UPD_STG

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in COST_COMP_UPD_STG.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | COMP_ID |  |  |  | VARCHAR (10 ) | Contains a unique user specified code representing the cost Component. |
| 7 | COMP_TYPE |  |  |  | VARCHAR (1 ) | Contains a code used to distinguish between Expenses, Assessments, and Up Charges. |
| 8 | EXPENSE_TYPE |  |  |  | VARCHAR (6 ) | This field will be populated only when the component type is Expense and it defines the type of the expense. |
| 9 | NEW_COMP_RATE |  |  |  | NUMERIC (20,4) | Contains the new rate to be charged against the calculation base. |
| 10 | NEW_COMP_CURRENCY |  |  |  | VARCHAR (3 ) | Contains the new currency the expense or assessment is to be entered in. |
| 11 | NEW_PER_COUNT |  |  |  | NUMERIC (12,4) | Contains the new count indicating the amount of the Per Count Unit of Measure to which the rate applies. |
| 12 | NEW_PER_COUNT_UOM |  |  |  | VARCHAR (4 ) | Contains the new unit of measure in which the Per Count is specified. |
| 13 | EFFECTIVE_DATE |  |  |  | Date | The date from which the new values are effective in the system. If the defaulting level is I then the date is equal to the vdate. |
| 14 | EFFECTIVE_DATE_UPD |  |  |  | Date | The date from which the new values are effective in the system. If the defaulting level is I then the date is equal to the vdate. This holds the value to update column EFFECTIVE_DATE with. |
| 15 | CNTRY_DEFAULT_IND |  |  |  | VARCHAR (1 ) | Indicator to specify if this cost component change is to be cascaded to countries. |
| 16 | SUPP_DEFAULT_IND |  |  |  | VARCHAR (1 ) | Indicator to specify if this cost component change is to be cascaded to suppliers. |
| 17 | PTNR_DEFAULT_IND |  |  |  | VARCHAR (1 ) | Indicator to specify if this cost component change is to be cascaded to partners. |
| 18 | ITEM_DEFAULT_IND |  |  |  | VARCHAR (1 ) | Indicator to specify if this cost component change is to be cascaded to items. |
| 19 | ORDER_DEFAULT_IND |  |  |  | VARCHAR (1 ) | Indicator to specify if this cost component change is to be cascaded to orders. |
| 20 | TSF_ALLOC_DEFAULT_IND |  |  |  | VARCHAR (1 ) | Indicator to specify if this cost component change is to be cascaded to transfers and allocations. |
| 21 | DEPT_DEFAULT_IND |  |  |  | VARCHAR (1 ) | Indicator to specify if this cost component change is to be cascaded to departments. |
| 22 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 23 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 24 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 25 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_COST_SUSP_SUP_DETAIL

**Description:** This is the staging table for Item Induction moduleâ€™s cost change functionality. It is used to temporarily hold data before it is uploaded/updated in COST_SUSP_SUP_DETAIL.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The data for a process is split in multiple chunks. The Chunk information is present in SVC_PROCESS_CHUNKS. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a process-ID |
| 4 | ACTION |  |  |  | VARCHAR (10) | Describes type of action i.e. NEW, MOD or DEL |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10) | Status of current row. Could be N - New, P-Processed, E-Error |
| 6 | COST_CHANGE |  |  |  | NUMERIC (8) | Refer to COST_SUSP_SUP_DETAIL.COST_CHANGE. |
| 7 | SUPPLIER |  |  |  | NUMERIC (10) | Refer to COST_SUSP_SUP_DETAIL.SUPPLIER. |
| 8 | ORIGIN_COUNTRY_ID |  |  |  | VARCHAR (3) | Refer to COST_SUSP_SUP_DETAIL.ORIGIN_COUNTRY_ID. |
| 9 | ITEM |  |  |  | VARCHAR (25) | Refer to COST_SUSP_SUP_DETAIL.ITEM. |
| 10 | BRACKET_VALUE1 |  |  |  | NUMERIC (12,4) | Refer to COST_SUSP_SUP_DETAIL.BRACKET_VALUE1. |
| 11 | BRACKET_UOM1 |  |  |  | VARCHAR (4) | Refer to COST_SUSP_SUP_DETAIL.BRACKET_UOM1. |
| 12 | BRACKET_VALUE2 |  |  |  | NUMERIC (12,4) | Refer to COST_SUSP_SUP_DETAIL.BRACKET_VALUE2. |
| 13 | UNIT_COST |  |  |  | NUMERIC (20,4) | Refer to COST_SUSP_SUP_DETAIL.UNIT_COST. |
| 14 | COST_CHANGE_TYPE |  |  |  | VARCHAR (2) | Refer to COST_SUSP_SUP_DETAIL.COST_CHANGE_TYPE. |
| 15 | COST_CHANGE_VALUE |  |  |  | NUMERIC (20,4) | Refer to COST_SUSP_SUP_DETAIL.COST_CHANGE_VALUE. |
| 16 | RECALC_ORD_IND |  |  |  | VARCHAR (1) | Refer to COST_SUSP_SUP_DETAIL.RECALC_ORD_IND. |
| 17 | DEFAULT_BRACKET_IND |  |  |  | VARCHAR (1) | Refer to COST_SUSP_SUP_DETAIL.DEFAULT_BRACKET_IND. |
| 18 | DEPT |  |  |  | NUMERIC (4) | Refer to COST_SUSP_SUP_DETAIL.DEPT. |
| 19 | SUP_DEPT_SEQ_NO |  |  |  | NUMERIC (10) | Refer to COST_SUSP_SUP_DETAIL.SUP_DEPT_SEQ_NO. |
| 20 | DELIVERY_COUNTRY_ID |  |  |  | VARCHAR (3) | Refer to COST_SUSP_SUP_DETAIL.DELIVERY_COUNTRY_ID. |
| 21 | CREATE_ID |  |  |  | VARCHAR (30) | The user -id who inserted this record. |
| 22 | CREATE_DATETIME |  |  |  | Date | The date and time when the record was inserted. |
| 23 | LAST_UPD_ID |  |  |  | VARCHAR (30) | The user -id who last updated this record. |
| 24 | LAST_UPD_DATETIME |  |  |  | Date | The date and time when the record was last updated. |

---

## Table: SVC_COST_SUSP_SUP_DETAIL_LOC

**Description:** This table holds data coming from Item Induction, to be inserted to COST_SUSP_SUP_DETAIL_LOC table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The data for a process is split in multiple chunks. The Chunk information is present in SVC_PROCESS_CHUNKS |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a process-ID |
| 4 | ACTION |  |  |  | VARCHAR (10) | The rows sequence. Should be unique within a process-ID |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10) | Status of current row. Could be N - New, P-Processed, E-Error |
| 6 | BRACKET_UOM1 |  |  |  | VARCHAR (4) | Refer to COST_SUSP_SUP_DETAIL_LOC.BRACKET_UOM1. |
| 7 | BRACKET_VALUE2 |  |  |  | NUMERIC (12,4) | Refer to COST_SUSP_SUP_DETAIL_LOC.BRACKET_VALUE2. |
| 8 | UNIT_COST |  |  |  | NUMERIC (20,4) | COST_SUSP_SUP_DETAIL_LOC.UNIT_COST. |
| 9 | COST_CHANGE_TYPE |  |  |  | VARCHAR (2) | Refer to COST_SUSP_SUP_DETAIL_LOC.COST_CHANGE_TYPE. |
| 10 | COST_CHANGE_VALUE |  |  |  | NUMERIC (20,4) | Refer to COST_SUSP_SUP_DETAIL_LOC.COST_CHANGE_VALUE. |
| 11 | RECALC_ORD_IND |  |  |  | VARCHAR (1) | Refer to COST_SUSP_SUP_DETAIL_LOC.RECALC_ORD_IND. |
| 12 | DEFAULT_BRACKET_IND |  |  |  | VARCHAR (1) | Refer to COST_SUSP_SUP_DETAIL_LOC.DEFAULT_BRACKET_IND. |
| 13 | DEPT |  |  |  | NUMERIC (4) | Refer to COST_SUSP_SUP_DETAIL_LOC.DEPT. |
| 14 | SUP_DEPT_SEQ_NO |  |  |  | NUMERIC (10) | Refer to COST_SUSP_SUP_DETAIL_LOC.SUP_DEPT_SEQ_NO. |
| 15 | DELIVERY_COUNTRY_ID |  |  |  | VARCHAR (3) | Refer to COST_SUSP_SUP_DETAIL_LOC.DELIVERY_COUNTRY_ID. |
| 16 | COST_CHANGE |  |  |  | NUMERIC (8) | Refer to COST_SUSP_SUP_DETAIL_LOC.COST_CHANGE. |
| 17 | SUPPLIER |  |  |  | NUMERIC (10) | Refer to COST_SUSP_SUP_DETAIL_LOC.SUPPLIER. |
| 18 | ORIGIN_COUNTRY_ID |  |  |  | VARCHAR (3) | Refer to COST_SUSP_SUP_DETAIL_LOC.ORIGIN_COUNTRY_ID. |
| 19 | ITEM |  |  |  | VARCHAR (25) | Refer to COST_SUSP_SUP_DETAIL_LOC.ITEM. |
| 20 | LOC_TYPE |  |  |  | VARCHAR (1) | Refer to COST_SUSP_SUP_DETAIL_LOC.LOC_TYPE. |
| 21 | LOC |  |  |  | NUMERIC (10) | Refer to COST_SUSP_SUP_DETAIL_LOC.LOC. |
| 22 | BRACKET_VALUE1 |  |  |  | NUMERIC (12,4) | Refer to COST_SUSP_SUP_DETAIL_LOC.BRACKET_VALUE1. |
| 23 | CREATE_ID |  |  |  | VARCHAR (30) | The user -id who inserted this record. |
| 24 | CREATE_DATETIME |  |  |  | Date | The date and time when the record was inserted. |
| 25 | LAST_UPD_ID |  |  |  | VARCHAR (30) | The user -id who last updated this record. |
| 26 | LAST_UPD_DATETIME |  |  |  | Date | The date and time when the record was last updated. |

---

## Table: SVC_COST_SUSP_SUP_HEAD

**Description:** This table holds data coming from Item Induction, to be inserted to COST_SUSP_SUP_HEAD table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The data for a process is split in multiple chunks. The Chunk information is present in SVC_PROCESS_CHUNKS.' |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a process-ID |
| 4 | ACTION |  |  |  | VARCHAR (10) | Describes type of action i.e. NEW, MOD or DEL |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10) | Status of current row. Could be N - New, P-Processed, E-Error |
| 6 | COST_CHANGE |  |  |  | NUMERIC (8) | Refer to COST_SUSP_SUP_HEAD.COST_CHANGE. |
| 7 | COST_CHANGE_DESC |  |  |  | VARCHAR (120) | Refer to COST_SUSP_SUP_HEAD.COST_CHANGE_DESC |
| 8 | REASON |  |  |  | NUMERIC (2) | Refer to COST_SUSP_SUP_HEAD.REASON. |
| 9 | ACTIVE_DATE |  |  |  | Date | Refer to COST_SUSP_SUP_HEAD.ACTIVE_DATE. |
| 10 | STATUS |  |  |  | VARCHAR (1) | Refer to COST_SUSP_SUP_HEAD.STATUS. |
| 11 | COST_CHANGE_ORIGIN |  |  |  | VARCHAR (3) | Refer to COST_SUSP_SUP_HEAD.COST_CHANGE_ORIGIN. |
| 12 | APPROVAL_DATE |  |  |  | Date | Refer to COST_SUSP_SUP_HEAD.APPROVAL_DATE. |
| 13 | APPROVAL_ID |  |  |  | VARCHAR (30) |  |
| 14 | CREATE_ID |  |  |  | VARCHAR (30) | The user -id who inserted this record. |
| 15 | CREATE_DATETIME |  |  |  | Date | The date and time when the record was inserted. |
| 16 | LAST_UPD_ID |  |  |  | VARCHAR (30) | The user -id who last updated this record. |
| 17 | LAST_UPD_DATETIME |  |  |  | Date | The date and time when the record was last updated. |

---

## Table: SVC_COST_SUSP_SUP_HEAD_CFA_EXT

**Description:** This is the staging table for Item Induction module. It is used to temporarily hold data before it is uploaded/updated in COST_SUSP_SUP_HEAD_CFA_EXT

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The data for a process is split in multiple chunks. The Chunk information is present in SVC_PROCESS_CHUNKS. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10<br>BYTE) | Describes type of action i.e. NEW, MOD or DEL |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10<br>BYTE) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | COST_CHANGE |  |  |  | NUMERIC (8) | Refer to SVC_COST_SUSP_SUP_HEAD_CFA_EXT.COST_CHANGE. |
| 7 | GROUP_ID |  |  |  | NUMERIC (10) | Refer to SVC_COST_SUSP_SUP_HEAD_CFA_EXT.GROUP_ID. |
| 8 | VARCHAR2_1 |  |  |  | VARCHAR<br>(250 BYTE) | Refer to SVC_COST_SUSP_SUP_HEAD_CFA_EXT.VARCHAR2_1. |
| 9 | VARCHAR2_2 |  |  |  | VARCHAR<br>(250 BYTE) | Refer to SVC_COST_SUSP_SUP_HEAD_CFA_EXT.VARCHAR2_2. |
| 10 | VARCHAR2_3 |  |  |  | VARCHAR<br>(250 BYTE) | Refer to SVC_COST_SUSP_SUP_HEAD_CFA_EXT.VARCHAR2_3. |
| 11 | VARCHAR2_4 |  |  |  | VARCHAR<br>(250 BYTE) | Refer to SVC_COST_SUSP_SUP_HEAD_CFA_EXT.VARCHAR2_4. |
| 12 | VARCHAR2_5 |  |  |  | VARCHAR<br>(250 BYTE) | Refer to SVC_COST_SUSP_SUP_HEAD_CFA_EXT.VARCHAR2_5. |
| 13 | VARCHAR2_6 |  |  |  | VARCHAR<br>(250 BYTE) | Refer to SVC_COST_SUSP_SUP_HEAD_CFA_EXT.VARCHAR2_6. |
| 14 | VARCHAR2_7 |  |  |  | VARCHAR<br>(250 BYTE) | Refer to SVC_COST_SUSP_SUP_HEAD_CFA_EXT.VARCHAR2_7. |
| 15 | VARCHAR2_8 |  |  |  | VARCHAR<br>(250 BYTE) | Refer to SVC_COST_SUSP_SUP_HEAD_CFA_EXT.VARCHAR2_8. |
| 16 | VARCHAR2_9 |  |  |  | VARCHAR<br>(250 BYTE) | Refer to SVC_COST_SUSP_SUP_HEAD_CFA_EXT.VARCHAR2_9. |
| 17 | VARCHAR2_10 |  |  |  | VARCHAR<br>(250 BYTE) | Refer to SVC_COST_SUSP_SUP_HEAD_CFA_EXT.VARCHAR2_10. |
| 18 | NUMBER_11 |  |  |  | NUMERIC (22) | Refer to SVC_COST_SUSP_SUP_HEAD_CFA_EXT.NUMBER_11. |
| 19 | NUMBER_12 |  |  |  | NUMERIC (22) | Refer to SVC_COST_SUSP_SUP_HEAD_CFA_EXT.NUMBER_12. |
| 20 | NUMBER_13 |  |  |  | NUMERIC (22) | Refer to SVC_COST_SUSP_SUP_HEAD_CFA_EXT.NUMBER_13. |
| 21 | NUMBER_14 |  |  |  | NUMERIC (22) | Refer to SVC_COST_SUSP_SUP_HEAD_CFA_EXT.NUMBER_14. |
| 22 | NUMBER_15 |  |  |  | NUMERIC (22) | Refer to SVC_COST_SUSP_SUP_HEAD_CFA_EXT.NUMBER_15. |
| 23 | NUMBER_16 |  |  |  | NUMERIC (22) | Refer to SVC_COST_SUSP_SUP_HEAD_CFA_EXT.NUMBER_16. |
| 24 | NUMBER_17 |  |  |  | NUMERIC (22) | Refer to SVC_COST_SUSP_SUP_HEAD_CFA_EXT.NUMBER_17. |
| 25 | NUMBER_18 |  |  |  | NUMERIC (22) | Refer to SVC_COST_SUSP_SUP_HEAD_CFA_EXT.NUMBER_18. |
| 26 | NUMBER_19 |  |  |  | NUMERIC (22) | Refer to SVC_COST_SUSP_SUP_HEAD_CFA_EXT.NUMBER_19. |
| 27 | NUMBER_20 |  |  |  | NUMERIC (22) | Refer to SVC_COST_SUSP_SUP_HEAD_CFA_EXT.NUMBER_20. |
| 28 | DATE_21 |  |  |  | Date | Refer to SVC_COST_SUSP_SUP_HEAD_CFA_EXT.DATE_21. |
| 29 | DATE_22 |  |  |  | Date | Refer to SVC_COST_SUSP_SUP_HEAD_CFA_EXT.DATE_22. |
| 30 | DATE_23 |  |  |  | Date | Refer to SVC_COST_SUSP_SUP_HEAD_CFA_EXT.DATE_23. |
| 31 | DATE_24 |  |  |  | Date | Refer to SVC_COST_SUSP_SUP_HEAD_CFA_EXT.DATE_24. |
| 32 | DATE_25 |  |  |  | Date | Refer to SVC_COST_SUSP_SUP_HEAD_CFA_EXT.DATE_25. |
| 33 | CREATE_ID |  |  |  | VARCHAR (30<br>BYTE) | User who created the record. |
| 34 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 35 | LAST_UPD_ID |  |  |  | VARCHAR (30<br>BYTE) | User who last updated the record. |
| 36 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_RPM_ITEM_ZONE_PRICE

**Description:** This is the staging table for Item Induction module. It is used to temporarily hold data before it is uploaded/updated in RPM_ITEM_ZONE_PRICE

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The data for a process is split in multiple chunks. The Chunk information is present in SVC_PROCESS_CHUNKS. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | ITEM_ZONE_PRICE_ID |  |  |  | NUMERIC (15) | Refer to RPM_ITEM_ZONE_PRICE.ITEM_ZONE_PRICE_ID. |
| 7 | ITEM |  |  |  | VARCHAR (25) | Refer to RPM_ITEM_ZONE_PRICE.ITEM. |
| 8 | ZONE_ID |  |  |  | NUMERIC (10) | Refer to RPM_ITEM_ZONE_PRICE.ZONE_ID. |
| 9 | STANDARD_RETAIL |  |  |  | NUMERIC (20,4) | Refer to RPM_ITEM_ZONE_PRICE.STANDARD_RETAIL. |
| 10 | STANDARD_RETAIL_CURRENCY |  |  |  | VARCHAR (3) | Refer to RPM_ITEM_ZONE_PRICE.STANDARD_RETAIL_CURRENCY. |
| 11 | STANDARD_UOM |  |  |  | VARCHAR (4) | Refer to RPM_ITEM_ZONE_PRICE.STANDARD_UOM. |
| 12 | SELLING_RETAIL |  |  |  | NUMERIC (20,4) | Refer to RPM_ITEM_ZONE_PRICE.SELLING_RETAIL. |
| 13 | SELLING_UOM |  |  |  | VARCHAR (4) | Refer to RPM_ITEM_ZONE_PRICE.SELLING_UOM. |
| 14 | MULTI_UNITS |  |  |  | NUMERIC (12,4) | Refer to RPM_ITEM_ZONE_PRICE.MULTI_UNITS. |
| 15 | MULTI_UNIT_RETAIL |  |  |  | NUMERIC (20,4) | Refer to RPM_ITEM_ZONE_PRICE.MULTI_UNIT_RETAIL. |
| 16 | MULTI_UNIT_RETAIL_CURRENCY |  |  |  | VARCHAR (3) | Refer to RPM_ITEM_ZONE_PRICE.MULTI_UNIT_RETAIL_CURRENCY. |
| 17 | MULTI_SELLING_UOM |  |  |  | VARCHAR (4) | Refer to RPM_ITEM_ZONE_PRICE.MULTI_SELLING_UOM. |
| 18 | LOCK_VERSION |  |  |  | NUMERIC (18) | Refer to RPM_ITEM_ZONE_PRICE.LOCK_VERSION. |
| 19 | CREATE_ID |  |  |  | VARCHAR (30) | User who created the record. |
| 20 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 21 | LAST_UPD_ID |  |  |  | VARCHAR (30) | User who last updated the record. |
| 22 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |
