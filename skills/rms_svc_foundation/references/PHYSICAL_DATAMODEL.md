# RMS Service Uploads - Foundation & Security Datamodel - Physical Data Model Reference

## Table: S9T_CONFIG

**Description:** This table holds the specific configurations used while creating and processing spreadsheets. Clients can change these configurations to customize the behaviour.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DROP_DOWN_DEPTH |  |  |  | NUMERIC (10) | This column is used to control the number of rows till which the spreadsheet drop-down is applied. It can be used to limit the number of rows with drop downs to improve the performance or can be used to eliminate drop downs in the spreadsheet altogether if the spreadsheet software being used does not support drop downs. |
| 2 | REQUIRED_VISUAL_COLOR_CODE |  |  | Y | VARCHAR (255) | This is the color code that will be used to visually distinguish required columns in an spreadsheet. |

---

## Table: S9T_ERRORS

**Description:** This table contains the error messages while processing spreadsheet data into staging tables. Typically data-type and precision type of errors are logged into this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | FILE_ID | P | F | Y | NUMERIC (20) | The file_id to which this error belongs. Maps to s9t_folder.file_id. |
| 2 | ERROR_SEQ_NO | P |  | Y | NUMERIC (20) | Unique sequence number for each error. |
| 3 | TEMPLATE_KEY |  |  |  | VARCHAR<br>(255 BYTE) | The template key for the file. Maps to s9t_template.template_key. |
| 4 | WKSHT_KEY |  |  |  | VARCHAR<br>(255 BYTE) | The worksheet key for the error. Maps to S9t_tmpl_wksht_def.wksht_key. |
| 5 | COLUMN_KEY |  |  |  | VARCHAR<br>(255 BYTE) | the column key for the error. Maps to s9t_tmpl_cols_def.column_key. |
| 6 | ROW_SEQ |  |  |  | NUMERIC (10) | The row_seq for the staging table row. Helps to locate the row that has the error. |
| 7 | ERROR_KEY |  |  | Y | VARCHAR<br>(255 BYTE) | The rtk_error key describing the error. |
| 8 | CREATE_ID |  |  | Y | VARCHAR (50<br>BYTE) | The user -id who inserted this record. |
| 9 | CREATE_DATETIME |  |  | Y | Timestamp<br>(6) | The date and time when the record was inserted. |
| 10 | LAST_UPDATE_ID |  |  | Y | VARCHAR (50<br>BYTE) | The user -id who last updated this record. |
| 11 | LAST_UPDATE_DATETIME |  |  | Y | Timestamp<br>(6) | The date and time when the record was last updated. |
| 12 | ERROR_TYPE |  |  | Y | VARCHAR (6<br>BYTE) | Represents Issue Type, describing the Issue is of the type ERROR or WARNING. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|S9T_ERRORS_PK|PK||||FILE_ID|ASC|
||||||ERROR_SEQ_NO|ASC|
|S9T_ERRORS_PK|UN||||FILE_ID|ASC|
||||||ERROR_SEQ_NO|ASC|

---

## Table: S9T_FOLDER

**Description:** This is a generic table to hold spreadsheets being uploaded and downloaded through RMS.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | FILE_ID | P |  | Y | NUMERIC (20) | unique ID for each spreadsheet file. |
| 2 | FILE_NAME |  |  | Y | VARCHAR (255 BYTE) | Name of the file. |
| 3 | FILE_CLOB |  |  |  | CLOB (4000) | The content_XML for each spreadsheet stored as CLOB. Contains data only temporarily during processing. |
| 4 | TEMPLATE_KEY |  |  |  | VARCHAR (255 BYTE) | The template key. Maps to s9t_template.template_key. |
| 5 | USER_LANG |  |  |  | NUMERIC (6) | The users language in which file contains data. |
| 6 | STATUS |  |  |  | VARCHAR (50 BYTE) | The status of the uploaded file. Reserved for future use. |
| 7 | ACTION |  |  |  | VARCHAR (50 BYTE) | upload or download. |
| 8 | ODS_BLOB |  |  |  | BLOB (4000) | The binary ods file. |
| 9 | ACTION_DATE |  |  |  | Date (7) | The date of last action. |
| 10 | CREATE_ID |  |  |  | VARCHAR (50 BYTE) | The user -id who inserted this record. |
| 11 | CREATE_DATETIME |  |  |  | Date (7) | The date and time when the record was inserted. |
| 12 | CONTENT_XML |  |  |  | XMLType (2000) | The content_XML for each spreadsheet stored as binary parsed XML. Contains data only temporarily during processing. |
| 13 | S9T_FILE_OBJ |  |  |  |  | The S9T_FILE_OBJ instance containing data from the spreadsheet. Acts as a bridge between plsql and file contained in ODS_BLOB. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|S9T_FOLDER_PK|PK||||FILE_ID|ASC|
|S9T_FOLDER_PK|UN||||FILE_ID|ASC|
|S9T_FOLDER_INDEX1|||||FILE_NAME|ASC|
||||||CREATE_ID|ASC|

---

## Table: S9T_LIST_VALS

**Description:** This table contains mapping of spreadsheet columns in S9T_TMPL_COLS_DEF and code-detail code types which can be used to populate drop down list in spreadsheets.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TEMPLATE_CATEGORY | P |  | Y | VARCHAR (255) | The template category. Valid values are stored against code-type S9TC. |
| 2 | SHEET_NAME | P |  | Y | VARCHAR (255) | The sheet-name to which this drop down mapping belongs to. |
| 3 | COLUMN_NAME | P |  | Y | VARCHAR (255) | The column-name to which this drop down mapping belongs to. |
| 4 | CODE |  |  | Y | VARCHAR (255) | The code_detail code from which the drop down values should be obtained from. |

---

## Table: S9T_TEMPLATE

**Description:** This is header table for all spreadsheet upload/download templates used by the system.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TEMPLATE_KEY | P |  | Y | VARCHAR (255) | Unique key identifying the templates. |
| 2 | TEMPLATE_NAME |  |  | Y | VARCHAR (255) | The name of the template. |
| 3 | TEMPLATE_DESC |  |  |  | VARCHAR (4000) | Description of the template. |
| 4 | FILE_ID |  |  |  | NUMERIC (10) | File-id of the spreadsheet file which may contain template definition data. Reserved for future use. |
| 5 | CREATE_ID |  |  |  | VARCHAR (50) | The user -id who inserted this record. |
| 6 | CREATE_DATETIME |  |  |  | Date | The date and time when the record was inserted. |
| 7 | TEMPLATE_TYPE |  |  | Y | VARCHAR (6 ) | The type of the template. Valid values are stored against code type IS9T. |
| 8 | TEMPLATE_CATEGORY |  |  |  | VARCHAR (6 ) | The category to which the templates belong. Valid values are in code_head where code_type = TCAT |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|S9T_TEMPLATE_PK|PK||||TEMPLATE_KEY|ASC|

---

## Table: S9T_TEMPLATE_TL

**Description:** This table contains translations by language for the template definition contained in the S9T_TEMPLATE table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TEMPLATE_KEY | P | F | Y | VARCHAR (255) | The template key. Maps to s9t_template.template_key. |
| 2 | LANG | P | F | Y | NUMERIC (6) | The RMS language code the template name and description is in. Maps to lang.lang. |
| 3 | TEMPLATE_NAME |  |  | Y | VARCHAR (255 ) | The translated name of the template. |
| 4 | TEMPLATE_DESC |  |  |  | VARCHAR (4000 ) | The translated description of the template. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|S9T_TEMPLATE_TL_PK|PK||||TEMPLATE_KEY|ASC|
||||||LANG|ASC|

---

## Table: S9T_TMPL_COLS_DEF

**Description:** This table contains column definition for spreadsheet templates used by RMS. E.g. spreadsheet templates for item Induction and other spreadsheet import modules.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TEMPLATE_KEY | P | F | Y | VARCHAR (255) | The template key for the file. Maps to s9t_template.template_key. |
| 2 | WKSHT_KEY | P | F | Y | VARCHAR (255) | The worksheet key. Maps to S9t_tmpl_wksht_def.wksht_key. |
| 3 | COLUMN_KEY | P |  | Y | VARCHAR (255) | The column key. Maps to s9t_tmpl_cols_def.column_key. |
| 4 | COLUMN_NAME |  |  | Y | VARCHAR (255) | The name of the column. |
| 5 | MANDATORY |  |  | Y | CHAR (1) | Indicates if the column should be part of the template or not. |
| 6 | CREATE_ID |  |  | Y | VARCHAR (50) | The user -id who inserted this record. |
| 7 | CREATE_DATETIME |  |  | Y | Timestamp (6) | The date and time when the record was inserted. |
| 8 | LAST_UPDATE_ID |  |  | Y | VARCHAR (50) | The user -id who last updated this record. |
| 9 | LAST_UPDATE_DATETIME |  |  | Y | Timestamp (6) | The date and time when the record was last updated. |
| 10 | DEFAULT_VALUE |  |  |  | VARCHAR (4000) | The default value to be used if user does not provide a value for a new record. |
| 11 | REQUIRED_VISUAL_IND |  |  |  | VARCHAR (1 ) | This column is used to visually distinguish required columns in generated spreadsheets. A value of Y indicates that this column will appear with background color (s9t_config.reqired_visual_color_code) in the spreadsheets. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|S9T_TMPL_COLS_DEF_PK|PK||||TEMPLATE_KEY|ASC|
||||||WKSHT_KEY|ASC|
||||||COLUMN_KEY|ASC|
|S9T_TMPL_COLS_DEF_INDEX1|||||TEMPLATE_KEY|ASC|
||||||WKSHT_KEY|ASC|

---

## Table: S9T_TMPL_COLS_DEF_TL

**Description:** This table contains translations by language for template column definition contained in S9T_TMPL_COLS_DEF table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TEMPLATE_KEY | P | F | Y | VARCHAR (255) | The template key for the file. Maps to s9t_template.template_key. |
| 2 | WKSHT_KEY | P | F | Y | VARCHAR (255) | The worksheet key for the column. Maps to S9t_tmpl_wksht_def.wksht_key. |
| 3 | COLUMN_KEY | P | F | Y | VARCHAR (255) | The column key for the translation. Maps to s9t_tmpl_cols_def.column_key. |
| 4 | LANG | P |  | Y | NUMERIC (6) | Language |
| 5 | COLUMN_NAME |  |  | Y | VARCHAR (255 ) | The translated name of the column. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|S9T_TMPL_COLS_DEF_TL_PK|PK||||TEMPLATE_KEY|ASC|
||||||WKSHT_KEY|ASC|
||||||COLUMN_KEY|ASC|
||||||LANG|ASC|

---

## Table: S9T_TMPL_WKSHT_DEF

**Description:** This table contains worksheet definitions for spreadsheet templates used by system for upload/download.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TEMPLATE_KEY | P | F | Y | VARCHAR (255) | The template key. Maps to s9t_template.template_key. |
| 2 | WKSHT_KEY | P |  | Y | VARCHAR (255) | The worksheet key for the error. Maps to S9t_tmpl_wksht_def.wksht_key. |
| 3 | WKSHT_NAME |  |  | Y | VARCHAR (255) | the translated name of the worksheet. |
| 4 | MANDATORY |  |  |  | CHAR (1) | Indicates if the worksheet should be part of the template or not. |
| 5 | SEQ_NO |  |  | Y | NUMERIC (4) | The sequence of the worksheet as it appears on the spreadsheet. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|S9T_TMPL_WKSHT_DEF_PK1|PK||||TEMPLATE_KEY|ASC|
||||||WKSHT_KEY|ASC|

---

## Table: S9T_TMPL_WKSHT_DEF_TL

**Description:** This table contains translations by language for worksheet definition contained in S9T_TMPL_WKSHT_DEF table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TEMPLATE_KEY | P | F | Y | VARCHAR (255) | The template key. Maps to s9t_template.template_key. |
| 2 | WKSHT_KEY | P | F | Y | VARCHAR (255) | The worksheet key for the error. Maps to S9t_tmpl_wksht_def.wksht_key. |
| 3 | LANG | P |  | Y | NUMERIC (6) | Language |
| 4 | WKSHT_NAME |  |  | Y | VARCHAR (255 ) | The translated worksheet name in the LANG. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|S9T_TMPL_WKSHT_DEF_TL_PK|PK||||TEMPLATE_KEY|ASC|
||||||WKSHT_KEY|ASC|
||||||LANG|ASC|

---

## Table: SVC_ADMIN_UPLD_ER

**Description:** This table contains errors encountered while uploading data to core tables from Admin API.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC | The process Id to which this error belongs. |
| 2 | ERROR_SEQ | P |  | Y | NUMERIC | Unique sequence number for each error. |
| 3 | CHUNK_ID |  |  | Y | NUMERIC | The chunk Id to which this error belongs. |
| 4 | TABLE_NAME |  |  | Y | VARCHAR (255 ) | The staging table-name to which the error belongs. |
| 5 | ROW_SEQ |  |  | Y | NUMERIC | The row_seq for the staging table row. Helps to locate the row that has the error. |
| 6 | COLUMN_NAME |  |  |  | VARCHAR (255 ) | The column key for the error. Maps to s9t_tmpl_cols_def.column_key. |
| 7 | ERROR_MSG |  |  | Y | VARCHAR (4000) | This holds the error message. |
| 8 | ERROR_TYPE |  |  | Y | VARCHAR (6) | Represents Issue Type, describing the Issue is of the type ERROR or WARNING. Default Value is 'E' |

---

## Table: SVC_ATTRIB_GROUP

**Description:** This is the staging table for CFAS attribute group information.It is used to temporarily hold data before it is uploaded/updated in CFA_ATTRIB_GROUP.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk.The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10<br>) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10<br>) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | GROUP_ID |  |  |  | NUMERIC (10) | This column holds a generated ID that distinguishes the custom attribute group. |
| 7 | GROUP_SET_ID |  |  |  | NUMERIC (10) | This column holds id of the set where the group belongs to. |
| 8 | GROUP_VIEW_NAME |  |  |  | VARCHAR (30<br>) | This column holds the name of the database view that will be generated to make access to user entered data easier. |
| 9 | DISPLAY_SEQ |  |  |  | NUMERIC (2) | This column holds the order the attribute groups will be displayed in on the CFAS UI when multiple groups exist for a single attribute group set. |
| 10 | CREATE_ID |  |  |  | VARCHAR (30<br>) | User who created the record. |
| 11 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 12 | LAST_UPD_ID |  |  |  | VARCHAR (30<br>) | User who last updated the record. |
| 13 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_ATTRIB_GROUP_LABELS

**Description:** This is the staging table for CFAS attrib group labels information.It is used to temporarily hold data before it is uploaded/updated in CFA_ATTRIB_GROUP_LABELS.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk.The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10<br>) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10<br>) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | GROUP_ID |  |  |  | NUMERIC (10) | This column holds a generated ID that distinguishes the custom attribute group. |
| 7 | LANG |  |  |  | NUMERIC (6) | The attribute group labels language. |
| 8 | LABEL |  |  |  | VARCHAR<br>(255 ) | The attribute group label as displayed on the UI. |
| 9 | CREATE_ID |  |  |  | VARCHAR (30<br>) | User who created the record. |
| 10 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 11 | LAST_UPD_ID |  |  |  | VARCHAR (30<br>) | User who last updated the record. |
| 12 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_ATTRIB_GROUP_SET

**Description:** This is the staging table for CFAS attribute group set setup information.It is used to temporarily hold data before it is uploaded/updated in CFA_ATTRIB_GROUP_SET.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC<br>(10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC<br>(10) | Uniquely identifies a chunk.The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC<br>(20) | The rows sequence. Should be unique within a process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10<br>) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10<br>) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | GROUP_SET_ID |  |  |  | NUMERIC<br>(30) | Unique idenfier for the for the attribute group set. |
| 7 | BASE_RMS_TABLE |  |  |  | VARCHAR (30<br>) | RMS table where the group set belongs to. |
| 8 | DISPLAY_SEQ |  |  |  | NUMERIC (2) | The order at which the group set entries are displayed on the UI. |
| 9 | GROUP_SET_VIEW_NAME |  |  |  | VARCHAR (30<br>) | This column holds the name of the database view that will be generated to make access to user entered data easier. |
| 10 | STAGING_TABLE_NAME |  |  |  | VARCHAR<br>(30) | The name of the staging area where data from an external source can be stored and exported to the CFA extension table linked to this group set. |
| 11 | QUALIFIER_FUNC |  |  |  | VARCHAR<br>(61) | This column holds the name of the stored procedure (package and function) that should be called to check if required information is supplied to the base UI to access the attributes within the group set. |
| 12 | VALIDATION_FUNC |  |  |  | VARCHAR<br>(61) | This column holds the name of the stored procedure (package and function) that should be called to validate the attribute group set. |
| 13 | DEFAULT_FUNC |  |  |  | VARCHAR<br>(61) | This column holds the name of the stored procedure (package and function) that should be called on startup of the CFAS UI to pre-populate attribute fields with default values (can be in any group within the set). |
| 14 | CREATE_ID |  |  |  | VARCHAR (30<br>) | User who created the record. |
| 15 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 16 | LAST_UPD_ID |  |  |  | VARCHAR (30<br>) | User who last updated the record. |
| 17 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_ATTRIB_GROUP_SET_LABELS

**Description:** This is the staging table for CFAS attribute group set labels information.It is used to temporarily hold data before it is uploaded/updated in CFA_ATTRIBUTE_GROUP_SET_LABELS.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk.The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10<br>) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10<br>) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | GROUP_SET_ID |  |  |  | NUMERIC (10) | Unique identifier for the attribute group set. |
| 7 | LANG |  |  |  | NUMERIC (6) | The group set label language. |
| 8 | LABEL |  |  |  | VARCHAR<br>(255 ) | The group set label value. |
| 9 | CREATE_ID |  |  |  | VARCHAR (30<br>) | User who created the record. |
| 10 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 11 | LAST_UPD_ID |  |  |  | VARCHAR (30<br>) | User who last updated the record. |
| 12 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_BRAND

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in BRAND.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | BRAND_NAME |  |  |  | VARCHAR (30 ) | This column holds the Brand name. |
| 7 | BRAND_DESCRIPTION |  |  |  | VARCHAR (120 ) | This column holds the description of the Brand. |
| 8 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 9 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 10 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 11 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_BRAND_TL

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in BRAND_TL.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 BYTE) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 BYTE) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | LANG |  |  |  | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 7 | BRAND_NAME |  |  |  | VARCHAR (30 BYTE) | This column holds the Brand name. |
| 8 | BRAND_DESCRIPTION |  |  |  | VARCHAR (120 BYTE) | This column holds the description of the Brand. |

---

## Table: SVC_BRFULFILORD

**Description:** This table is a parameter table used in integration services (e.g. web service, bulk interfaces) that will hold customer records for the customer order transfer Brazil attributes. The table definition reflects the business object definition of BrCustOrdTsfRBO.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID |  |  | Y | NUMERIC (10) | Unique identifier for a group of records to be processed by a single thread. |
| 2 | PROCESS_STATUS |  |  | Y | VARCHAR (1) | This field will indicate the process status of the record. Valid values inlcude 'N'ew, 'P'ending Batch, and 'C'ompleted. |
| 3 | ACTION_TYPE |  |  | Y | VARCHAR (30) | This field contains the operation type (e.g. create, update, or delete) associated with the transaction. |
| 4 | BRFULFILORD_ID |  |  | Y | NUMERIC (10) | Unique identifier for customer extension records. |
| 5 | FULFILORD_ID |  |  | Y | NUMERIC (15) | Unique identifier for customer order transfer head records. It serves as a reference to the parent record. |
| 6 | CUST_NEIGHBORHOOD |  |  |  | VARCHAR (120) | This will contain the customer neighborhood. |
| 7 | CUST_CPF |  |  |  | VARCHAR (120) | This will contain CPF infrormation. |
| 8 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 9 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 10 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 11 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |
| 12 | TAXPAYER_TYPE |  |  |  | VARCHAR (1) | Taxpayer Type. |
| 13 | FISCAL_ADDRESS_INFORMATION |  |  |  | VARCHAR (20) | This column holds the information about the Fiscal Address. |
| 14 | INDIVIDUAL_TAXPAYER_ID |  |  |  | VARCHAR (20) | This Column holds the Uniqe ID of the Individual Tax Payer. |
| 15 | CORPORATE_TAXPAYER_ID |  |  |  | VARCHAR (20) | This Column holds the Uniqe ID of the Corporate Tax Payer. |
| 16 | FREE_ZONE_MANAUS_INSCRPTN_ID |  |  |  | VARCHAR (20) | This Column holds the information about the Free Zone Manaus Inscription ID. |
| 17 | CITY_INSCRIPTION_ID |  |  |  | VARCHAR (20) | City ID. |
| 18 | STATE_INSCRIPTION_ID |  |  |  | VARCHAR (20) | State ID. |
| 19 | CONTRIBUTOR_TYPE |  |  |  | VARCHAR (2) | This column holds the information about the Contributor Type. |
| 20 | TAX_EXCEPTION_TYPE |  |  |  | VARCHAR (2) | This column holds the information about the Tax Exception type. |
| 21 | ISS_CONTRIBUTOR |  |  |  | VARCHAR (1) | ISS contributor indicator. ISS is services tax. |
| 22 | IPI_CONTRIBUTOR |  |  |  | VARCHAR (1) | IPI contributor indicator. IPI is federal excise tax. |
| 23 | ICMS_CONTRIBUTOR |  |  |  | VARCHAR (1) | ICMI contributor indicator. ICMI is state sales tax. |
| 24 | PIS_CONTRIBUTOR |  |  |  | VARCHAR (1) | This Column hods the information about the PIS contributor. |
| 25 | COFINS_CONTRIBUTOR |  |  |  | VARCHAR (1) | This Column holds the information about the COFINS contributor. |
| 26 | INCOME_RANGE_ELIGIBLE |  |  |  | VARCHAR (1) | Applicable only to supplier entities. Indicates whether the supplier income range is eligible for a reduction in tax basis. |
| 27 | DISTRIBUTOR_MANUFACTURER |  |  |  | VARCHAR (1) | Indicates if the distributor is also a manufacturer. Distributors have similar treatment for tax calculation as the manufacturer. |
| 28 | CUSTOMER_CNAE |  |  |  | VARCHAR (20) | This Column holds the information about the Customer CNAE number. |
| 29 | ERROR_MSG |  |  |  | VARCHAR (2000) | Holds the validation errors of the record. If multiple validation errors are found on a record, the error messages are concatenated. |
| 30 | PRESENCE_IND |  |  |  | NUMERIC (4) | The Field holds the information of the Presence Indicator in case of Indivdual Tax Payers. |

---

## Table: SVC_CALENDAR

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in CALENDAR.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | NO_OF_WEEKS |  |  |  | NUMERIC (1) | Indicates whether there are 4 or 5 calendar weeks in the 4-5-4 month. |
| 7 | MONTH_454 |  |  |  | NUMERIC (2) | Contains the number ranging from 1 to 12 which indicates the 4-5-4 month. |
| 8 | YEAR_454 |  |  |  | NUMERIC (4) | Contains the year that the 4-5-4 month falls in. The 4-5-4 year begins on the first day of the first 4-5-4 month regardless of when the calendar year begins. |
| 9 | FIRST_DAY |  |  |  | Date | Contains the first day of the 4-5-4 month. |
| 10 | CREATE_ID |  |  |  | VARCHAR (30) | User who created the record. |
| 11 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 12 | LAST_UPD_ID |  |  |  | VARCHAR (30) | User who last updated the record. |
| 13 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_CFA_EXT

**Description:** This is the staging table for the custom flex attributes It is used to temporarily hold data before it is uploaded/updated in ITEM_MASTER_CFA_EXT, ITEM_)

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID |  |  | Y | NUMERIC (20) | This is the process ID as part of which the row has been uploaded. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | The data set within a process-id is dIvided into smaller chunks for processing. This is the chunk-id of the chunk this row is assigned to. |
| 3 | ROW_SEQ |  |  | Y | NUMERIC (20) | The row sequence in which the rows were sent as input as part of the spreadsheet upload. |
| 4 | ACTION |  |  |  | VARCHAR (10 BYTE) | This denotes the Create, update or delete action. |
| 5 | BASE_RMS_TABLE |  |  | Y | VARCHAR (255 BYTE) | The base rms extended table to which this row belongs to. |
| 6 | GROUP_SET_VIEW_NAME |  |  | Y | VARCHAR (255 BYTE) | The group set view name to which the row belongs to. |
| 7 | KEYS_COL |  |  |  |  | The set of key value pairs for the key columns. E.g. in case of item_supplier_cfa_ext this will contain values of item and supplier. |
| 8 | ATTRS_COL |  |  |  |  | The set of key value pairs for the attribute columns. |
| 9 | PROCESS$STATUS |  |  |  | VARCHAR (10 BYTE) | The status of the row i.e. N New, E Error, P Processed |
| 10 | CREATE_ID |  |  |  | VARCHAR (30 BYTE) | User who created the record. |
| 11 | CREATE_DATETIME |  |  |  | Date (7) | Date time when record was inserted. |
| 12 | LAST_UPD_ID |  |  |  | VARCHAR (30 BYTE) | User who last updated the record. |
| 13 | LAST_UPD_DATETIME |  |  |  | Date (7) | Date time when record was last updated. |

---

## Table: SVC_CODE_DETAIL

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in CODE_DETAIL.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | CODE_TYPE |  |  |  | VARCHAR (4 ) | This field will contain a valid code type for the row. The valid code types are defined on the CODE_HEAD table. |
| 7 | CODE |  |  |  | VARCHAR (6 ) | This field contains the code used in Oracle Retail which must be decoded for display in the on-line forms. |
| 8 | CODE_DESC |  |  |  | VARCHAR (250 ) | This field contains the description associated with the code and code type. |
| 9 | REQUIRED_IND |  |  |  | VARCHAR (1 ) | This field indicates whether or not the code is required. If the code is specified as required, then the user will not be able to delete the rows in the table for that code. |
| 10 | CODE_SEQ |  |  |  | NUMERIC (4) | This is a number used to order the elements so that they appear consistently when using them to populate a list. |
| 11 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 12 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 13 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 14 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_CODE_DETAIL_TL

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded to CODE_DETAIL_TL

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | LANG |  |  |  | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 7 | CODE_TYPE |  |  |  | VARCHAR (4 ) | This field will contain a valid code type for the row. The valid code types are defined on the CODE_HEAD table. |
| 8 | CODE |  |  |  | VARCHAR (6 ) | This field contains the code used in Oracle Retail which must be decoded for display in the on-line forms. |
| 9 | CODE_DESC |  |  |  | VARCHAR (250 ) | This field contains the description associated with the code and code type. |

---

## Table: SVC_CODE_HEAD

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in CODE_HEAD.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | CODE_TYPE |  |  |  | VARCHAR (4 ) | This field contains the code type which will serve as a grouping mechanism for the multiple codes stored on the CODE_DETAIL table. |
| 7 | CODE_TYPE_DESC |  |  |  | VARCHAR (120 ) | This field will contain the description of the code type. |
| 8 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 9 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 10 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 11 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_COMPANY_CLOSED

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in COMPANY_CLOSED.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | CLOSE_DATE |  |  |  | Date | This field contains the date when the company is closed. |
| 7 | CLOSE_DESC |  |  |  | VARCHAR (120 ) | This field contains a description of the close. |
| 8 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 9 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 10 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 11 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_COMPANY_CLOSED_EXCEP

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in COMPANY_CLOSED_EXCEP.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | CLOSE_DATE |  |  |  | Date | Contains the date on which activity will not occur. |
| 7 | LOCATION |  |  |  | NUMERIC (10) | Contains the location number. |
| 8 | LOC_TYPE |  |  |  | VARCHAR (6 ) | Contains the location type (S)tore, (W)arehouse |
| 9 | SALES_IND |  |  |  | VARCHAR (1 ) | This field indicates the location is open for sales. |
| 10 | RECV_IND |  |  |  | VARCHAR (1 ) | This field indicates the location is open for receiving. |
| 11 | SHIP_IND |  |  |  | VARCHAR (1 ) | This field indicates the location is open for shipping. |
| 12 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 13 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 14 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 15 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_COMPANY_CLOSED_TL

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in COMPANY_CLOSED_TL.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 BYTE) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 BYTE) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | LANG |  |  |  | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 7 | CLOSE_DATE |  |  |  | Date (7) | This field contains the date that the company is closed. |
| 8 | CLOSE_DESC |  |  |  | VARCHAR (120 BYTE) | This field contains a description of the close. |

---

## Table: SVC_COMPETITOR

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in COMPETITOR.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | COMPETITOR |  |  |  | NUMERIC (10) | Contains the number to uniquely identify a competitor. |
| 7 | COMP_NAME |  |  |  | VARCHAR (120 ) | Contains the name of the competitor. |
| 8 | ADDRESS_1 |  |  |  | VARCHAR (240 ) | Contains the address for the competitors home office. |
| 9 | ADDRESS_2 |  |  |  | VARCHAR (240 ) | Contains the address for the competitors home office. |
| 10 | ADDRESS_3 |  |  |  | VARCHAR (240 ) | Contains the address for the competitors home office. |
| 11 | CITY |  |  |  | VARCHAR (120 ) | Contains the city of the competitors home office. |
| 12 | STATE |  |  |  | VARCHAR (3 ) | Contains the state of the competitors home office. |
| 13 | COUNTRY_ID |  |  |  | VARCHAR (3 ) | Contains the country of the competitors home office. |
| 14 | POST_CODE |  |  |  | VARCHAR (30 ) | Contains the postal code of the competitors home office. |
| 15 | PHONE |  |  |  | VARCHAR (20 ) | Contains the telephone number of the competitors home office. |
| 16 | FAX |  |  |  | VARCHAR (20 ) | Contains the fax number of the competitors home office. |
| 17 | WEBSITE |  |  |  | VARCHAR (40 ) | Contains the competitors internet address. |
| 18 | JURISDICTION_CODE |  |  |  | VARCHAR (10 ) | Identifies the jurisdiction code for the country-state relationship. |
| 19 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 20 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 21 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 22 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_COMPHEAD

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in COMPHEAD.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | COMPANY |  |  |  | NUMERIC (4) | Contains the unique number identifying the company. |
| 7 | CO_NAME |  |  |  | VARCHAR (120 ) | Contains the company name. |
| 8 | CO_ADD1 |  |  |  | VARCHAR (240 ) | The address of the company headquarters. |
| 9 | CO_ADD2 |  |  |  | VARCHAR (240 ) | The second line of the company headquarters address. |
| 10 | CO_ADD3 |  |  |  | VARCHAR (240 ) | The third line of the company headquarters address. |
| 11 | CO_CITY |  |  |  | VARCHAR (120 ) | The city of the company headquarters. |
| 12 | CO_STATE |  |  |  | VARCHAR (3 ) | The state of the company headquarters. |
| 13 | CO_COUNTRY |  |  |  | VARCHAR (3 ) | The country of the company headquarters. |
| 14 | CO_POST |  |  |  | VARCHAR (30 ) | The postal code of the company headquarters. |
| 15 | CO_NAME_SECONDARY |  |  |  | VARCHAR (120 ) | Contains the secondary name of the company. |
| 16 | CO_JURISDICTION_CODE |  |  |  | VARCHAR (10 ) | Identifies the jurisdiction code for the country-state relationship. |
| 17 | CREATE_ID |  |  |  | VARCHAR (30 ) | Use who created the record. |
| 18 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 19 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 20 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_COMPHEAD_TL

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in COMPHEAD_TL.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 BYTE) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 BYTE) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | LANG |  |  |  | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 7 | COMPANY |  |  |  | NUMERIC (4) | Contains the unique number identifying the company the for which the system is running. This is the highest level in the merchandise hierarchy. |
| 8 | CO_NAME |  |  |  | VARCHAR (120 BYTE) | Contains the company name for which the system is running. |
| 9 | CO_ADD1 |  |  |  | VARCHAR (240 BYTE) | The address of the company headquarters. |
| 10 | CO_ADD2 |  |  |  | VARCHAR (240 BYTE) | The second line of the company headquarters address. |
| 11 | CO_ADD3 |  |  |  | VARCHAR (240 BYTE) | The third line of the company headquarters address. |
| 12 | CO_CITY |  |  |  | VARCHAR (120 BYTE) | The city of the company headquarters. |
| 13 | CO_NAME_SECONDARY |  |  |  | VARCHAR (120 BYTE) | Contains the secondary name of the company. |

---

## Table: SVC_COMP_PRICE_HIST

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in COMP_PRICE_HIST.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | ITEM |  |  |  | VARCHAR (25 ) | This field identifies the unique alphanumeric value for the transaction level item that was competitively shopped. |
| 7 | REF_ITEM |  |  |  | VARCHAR (25 ) | This field contains the reference item (e.g. UPC, PLU, etc.) for the item that was competitively shopped. |
| 8 | COMP_STORE |  |  |  | NUMERIC (10) | Contains the number to uniquely identify a competitors store. |
| 9 | REC_DATE |  |  |  | Date | The date that the items price was recorded at the competitors store. |
| 10 | COMP_RETAIL |  |  |  | NUMERIC (20,4) | The retail price at the competitors store. |
| 11 | COMP_RETAIL_TYPE |  |  |  | VARCHAR (6 ) | Contains the price type which was recorded. Valid values are: R = regular P = promotional C = clearance |
| 12 | MULTI_UNITS |  |  |  | NUMERIC (12,4) | Contains the total quantity for multi unit pricing (e.g. 2 for, 3 for) |
| 13 | MULTI_UNIT_RETAIL |  |  |  | NUMERIC (20,4) | Contains the total price for multi unit pricing (e.g. 2 for $10) |
| 14 | PROM_START_DATE |  |  |  | Date | Contains the effective start date of the competitors promotional price. |
| 15 | PROM_END_DATE |  |  |  | Date | Contains the effective end date of the competitors promotional price. |
| 16 | OFFER_TYPE |  |  |  | VARCHAR (6 ) | This field identifies the offer type of the competitors regular (e.g. pre-priced) or promotional retail (e.g. bonus card). Valid values are stored on the codes table with a code type of OFTP. |
| 17 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 18 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 19 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 20 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_COMP_SHOPPER

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in COMP_SHOPPER.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | SHOPPER |  |  |  | NUMERIC (4) | Contains the number to uniquely identify a shopper. |
| 7 | SHOPPER_NAME |  |  |  | VARCHAR (120 ) | Contains the name of the shopper. |
| 8 | SHOPPER_PHONE |  |  |  | VARCHAR (20 ) | Contains the telephone number of the shopper. |
| 9 | SHOPPER_FAX |  |  |  | VARCHAR (20 ) | Contains the fax number of the shopper. |
| 10 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 11 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 12 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 13 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_COMP_SHOP_LIST

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in COMP_SHOP_LIST.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | SHOPPER |  |  |  | NUMERIC (4) | Contains the shopper number to which the competitive shopping list is assigned. |
| 7 | SHOP_DATE |  |  |  | Date | Contains the date that the competitive shopping should be performed. |
| 8 | ITEM |  |  |  | VARCHAR (25 ) | This field identifies the unique alphanumeric value for the transaction level item that was competitively shopped. |
| 9 | ITEM_DESC |  |  |  | VARCHAR (250 ) | Contains the description of the SKU. |
| 10 | REF_ITEM |  |  |  | VARCHAR (25 ) | This field contains the reference item (e.g. UPC, PLU, etc.) for the item that was competitively shopped. |
| 11 | COMPETITOR |  |  |  | NUMERIC (10) | Contains the number to uniquely identify a competitor. |
| 12 | COMP_NAME |  |  |  | VARCHAR (120 ) | Contains the description of the competitor. |
| 13 | COMP_STORE |  |  |  | NUMERIC (10) | Contains the number to uniquely identify a competitors store. |
| 14 | COMP_STORE_NAME |  |  |  | VARCHAR (150 ) | Contains the description of the competitive store. |
| 15 | REC_DATE |  |  |  | Date | The date that the items price was recorded at the competitors store. |
| 16 | COMP_RETAIL |  |  |  | NUMERIC (20,4) | The retail price at the competitors store. |
| 17 | COMP_RETAIL_TYPE |  |  |  | VARCHAR (6 ) | Contains the price type which was recorded. Valid values are: R = regular, P = promotional, C = clearance |
| 18 | MULTI_UNITS |  |  |  | NUMERIC (12,4) | Contains the total quantity for multi unit pricing (e.g. 2 for, 3 for ). |
| 19 | MULTI_UNIT_RETAIL |  |  |  | NUMERIC (20,4) | Contains the price for multi unit pricing (e.g. 2 for $10) |
| 20 | PROM_START_DATE |  |  |  | Date | Contains the effective start date of the competitors price. |
| 21 | PROM_END_DATE |  |  |  | Date | Contains the effective end date of the competitors price. |
| 22 | OFFER_TYPE |  |  |  | VARCHAR (6 ) | This field identifies the offer type of the competitors regular (e.g. pre-priced) or promotional retail (e.g. bonus card). Valid values are stored on the codes table with a code type of OFTP. |
| 23 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 24 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 25 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 26 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_COMP_STORE

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in COMP_STORE.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | STORE |  |  |  | NUMERIC (10) | Contains the number to uniquely identify a competitors store. |
| 7 | COMPETITOR |  |  |  | NUMERIC (10) | Contains the number to uniquely identify a competitor. |
| 8 | STORE_NAME |  |  |  | VARCHAR (150 ) | Contains the name of the competitors store. |
| 9 | ADDRESS_1 |  |  |  | VARCHAR (240 ) | Contains the address for the competitors store. |
| 10 | ADDRESS_2 |  |  |  | VARCHAR (240 ) | Contains the address for the competitors store. |
| 11 | ADDRESS_3 |  |  |  | VARCHAR (240 ) | Contains the address for the competitors store. |
| 12 | CITY |  |  |  | VARCHAR (120 ) | Contains the city of the competitors store. |
| 13 | STATE |  |  |  | VARCHAR (3 ) | Contains the state of the competitors store. |
| 14 | COUNTRY_ID |  |  |  | VARCHAR (3 ) | Contains the country of the competitors store. |
| 15 | POST_CODE |  |  |  | VARCHAR (30 ) | Contains the postal code of the competitors store. |
| 16 | PHONE |  |  |  | VARCHAR (20 ) | Contains the telephone number of the competitors store. |
| 17 | FAX |  |  |  | VARCHAR (20 ) | Contains the fax number of the competitors store. |
| 18 | STORE_FORMAT |  |  |  | NUMERIC (4) | Contains a code describing the format of the competitor store. |
| 19 | CURRENCY_CODE |  |  |  | VARCHAR (3 ) | Contains the currency which the store operates in. |
| 20 | TOTAL_SQUARE_FEET |  |  |  | NUMERIC (8) | Contains the size of the competitor store. |
| 21 | SELLING_SQUARE_FEET |  |  |  | NUMERIC (8) | Contains the size of the selling area in the competitor store. |
| 22 | OPEN_DATE |  |  |  | Date | Contains the opening date of the competitor store. |
| 23 | CLOSE_DATE |  |  |  | Date | Contains the closing date of the competitor store. |
| 24 | ESTIMATED_VOLUME |  |  |  | NUMERIC (20,4) | This field holds the estimated yearly volume for a given competitors store. |
| 25 | JURISDICTION_CODE |  |  |  | VARCHAR (10 ) | Identifies the jurisdiction code for the country-state relationship. |
| 26 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 27 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 28 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 29 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_COMP_STORE_LINK

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in COMP_STORE_LINK.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | STORE |  |  |  | NUMERIC (10) | Contains the number to uniquely identify a Merchandising store. |
| 7 | COMP_STORE |  |  |  | NUMERIC (10) | Contains the number to uniquely identify the competitors store. |
| 8 | RANK |  |  |  | NUMERIC (2) | This field captures the rank of each competitor store when compared to the other stores. |
| 9 | DISTANCE |  |  |  | NUMERIC (4) | This field captures the distance between the retailers store and the competitors store. |
| 10 | UOM |  |  |  | VARCHAR (6 ) | This field captures the unit of measure the distance is captured in. Valid values are stored on the codes table with a code type of MIKI. |
| 11 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 12 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 13 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 14 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |
| 15 | TAR_COMP_IND |  |  |  | VARCHAR (1 ) | This field identifies the target competitor of a retailers store. This competitors retail will be used along with the primary store within a zone when calculating a recommended retail in Price Management. |

---

## Table: SVC_CORESVC_ITEM_CONFIG

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in CORESVC_ITEM_CONFIG.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | CASCADE_IUD_ITEM_SUPPLIER |  |  |  | VARCHAR (1) | This field indicates whether the inserts, updates or deletes on item/supplier details should be cascaded to the child items or not. |
| 7 | MAX_THREADS |  |  |  | NUMERIC (10) | This is the maximum number of threads that should be spawned for coresvc_item package. |
| 8 | WAIT_BTWN_THREADS |  |  |  | NUMERIC (10) |  |
| 9 | CASCADE_IIM_DETAILS |  |  |  | VARCHAR (1) |  |
| 10 | MAX_CHUNK_SIZE |  |  |  | NUMERIC (10) | The maximum number of items that should be processed in one chunk. |
| 11 | PROC_ERR_RETENTION_DAYS |  |  |  | NUMERIC (5) | Number of days the errors for a process should be retained before purge. |
| 12 | CASCADE_UDA_DETAILS |  |  |  | VARCHAR (1) | This field indicates whether the inserts, updates or deletes on uda details should be cascaded to the child items or not. |
| 13 | CASCADE_IUD_ITEM_SUPP_COUNTRY |  |  |  | VARCHAR (1) | This field indicates whether the inserts, updates or deletes on item/supplier/country details should be cascaded to the child items or not. |
| 14 | CASCADE_IUD_ISC_DIMENSIONS |  |  |  | VARCHAR (1) | This field indicates whether the inserts, updates or deletes on item/supplier/country/dimension details should be cascaded to the child items or not. |
| 15 | CASCADE_IUD_ISMC |  |  |  | VARCHAR (1) | This field indicates whether the inserts, updates or deletes on item/supplier/manufacturing country details should be cascaded to the child items or not. |
| 16 | ISC_UPDATE_ALL_LOCS |  |  |  | VARCHAR (1) | This field indicates whether the updated default location information should be cascaded to all locations for the item/supplier/country relationship or not. |
| 17 | ISC_UPDATE_ALL_CHILD_LOCS |  |  |  | VARCHAR (1) | This field indicates whether the updated default locaiton ifnormation should be cascaded to all child item locations for the item/supplier/country relationship or not. |
| 18 | CASCADE_VAT_ITEM |  |  |  | VARCHAR (1) | This field indicates whether the inserts or deletes of item VAT information should be cascaded to the child items or not. |
| 19 | MAX_ITEM_RESV_QTY |  |  |  | NUMERIC (4) | The maximum number of item numbers that can be reserved. |
| 20 | MAX_ITEM_EXPIRY_DAYS |  |  |  | NUMERIC (4) | The number of days before the reserved item number expires. |
| 21 | CREATE_ID |  |  |  | VARCHAR (30) | User who created the record. |
| 22 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 23 | LAST_UPD_ID |  |  |  | VARCHAR (30) | User who last updated the record. |
| 24 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_COUNTRY_ATTR

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in COUNTRY and COUNTRY_ATTRIB.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | COUNTRY_ID |  |  |  | VARCHAR (3 ) | Contains a number which uniquely identifies the country. |
| 7 | COUNTRY_DESC |  |  |  | VARCHAR (120 ) | Contains the name of the country. |
| 8 | LOCALIZED_IND |  |  |  | VARCHAR (1 ) | This will indicate if a certain country is localized or not. This will determine if localized attributes will be required. Valid values are Yes or |
| 9 | ITEM_COST_TAX_INCL_IND |  |  |  | VARCHAR (1 ) | This will indicate if the costs defined for items in that country is inclusive or exclusive of tax. Default value is No. |
| 10 | DEFAULT_PO_COST |  |  |  | VARCHAR (6 ) | This will indicate at which cost the purchasing would be done in a country. This is the cost at which the Purchase orders would be raised. Default value is BC - Base Cost. Valid values are, Base Cost (BC) and Negotiated Item Cost (NIC). |
| 11 | DEFAULT_DEAL_COST |  |  |  | VARCHAR (6 ) | This will indicate at which cost the deals would be applied in a country.Default value is BC - Base Cost. Valid values are, Base Cost (BC) and Negotiated Item Cost (NIC). |
| 12 | DEFAULT_COST_COMP_COST |  |  |  | VARCHAR (6 ) | This will indicate which cost system a country will use during cost component definition. Default value is BC. |
| 13 | DEFAULT_LOC |  |  |  | NUMERIC (10) | Default location, whose fiscal attributes would be used to to set the initial item retail when no locations have been ranged for the item. The location should belong to the given country. This can either be a store or a warehouse. |
| 14 | DEFAULT_LOC_TYPE |  |  |  | VARCHAR (1 ) | This column will hold the type of the Default location of a particular country. |
| 15 | CREATE_ID |  |  |  | VARCHAR (30 ) | This column holds the User id of the user who created the record. |
| 16 | CREATE_DATETIME |  |  |  | Date | This column holds the record creation date. |
| 17 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 18 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_COUNTRY_TARIFF_TREATMENT

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in COUNTRY_TARIFF_TREATMENT.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | COUNTRY_ID |  |  |  | VARCHAR (3 ) | Contains a number that uniquely identifies the country. |
| 7 | TARIFF_TREATMENT |  |  |  | VARCHAR (10 ) | Contains a code to identify a specific tariff program for the country. |
| 8 | EFFECTIVE_FROM |  |  |  | Date | Contains the date that this particular tariff treatment becomes active for the country. |
| 9 | EFFECTIVE_TO |  |  |  | Date | Contains the date that this particular tariff treatment becomes inactive for the country. |
| 10 | CREATE_ID |  |  |  | VARCHAR (30 ) | This column holds the User id of the user who created the record. |
| 11 | CREATE_DATETIME |  |  |  | Date | This column holds the record creation date. |
| 12 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 13 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_COUNTRY_TL

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded to COUNTRY_TL

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | LANG |  |  |  | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 7 | COUNTRY_ID |  |  |  | VARCHAR (3 ) | Contains a number which uniquely identifies the country. |
| 8 | COUNTRY_DESC |  |  |  | VARCHAR (120 ) | Contains the name of the country. |

---

## Table: SVC_CURRENCIES

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in CURRENCIES.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | CURRENCY_CODE |  |  |  | VARCHAR (3 ) | Contains a number which uniquely identifies the type of currency. |
| 7 | CURRENCY_DESC |  |  |  | VARCHAR (120 ) | Contains a description of the currency. |
| 8 | CURRENCY_COST_FMT |  |  |  | VARCHAR (35 ) | Contains the format in which to express the cost figures within Oracle Retail. |
| 9 | CURRENCY_RTL_FMT |  |  |  | VARCHAR (35 ) | Contains the format in which to express the retail figures within Oracle Retail. |
| 10 | CURRENCY_COST_DEC |  |  |  | NUMERIC (1) | Contains the number of decimals supported by the currency for costs. |
| 11 | CURRENCY_RTL_DEC |  |  |  | NUMERIC (1) | Contains the number of decimals supported by the currency for retails. |
| 12 | CREATE_ID |  |  |  | VARCHAR (30 ) | This column holds the User id of the user who created the record. |
| 13 | CREATE_DATETIME |  |  |  | Date | This column holds the record creation date. |
| 14 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 15 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_CURRENCIES_TL

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in CURRENCIES_TL.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 BYTE) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 BYTE) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | LANG |  |  |  | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 7 | CURRENCY_CODE |  |  |  | VARCHAR (3 BYTE) | Contains a number which uniquely identifies the type of currency. |
| 8 | CURRENCY_DESC |  |  |  | VARCHAR (120 BYTE) | Contains a description of the currency. |

---

## Table: SVC_CURRENCY_RATES

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in CURRENCY_RATES.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | CURRENCY_CODE |  |  |  | VARCHAR (3 ) | Contains the currency code for which the history applies. |
| 7 | EFFECTIVE_DATE |  |  |  | Date | Date on which the currency rate became or will become active. |
| 8 | EXCHANGE_TYPE |  |  |  | VARCHAR (1 ) | Identifies the type of exchange rate the history exists for. Valid values are:C (Consolidation) O (Operational) L (Letter of Credit/Bank) P (Purchase Order) U (Customs Entry) G (Logistics). |
| 9 | EXCHANGE_RATE |  |  |  | NUMERIC (20,10) | Contains the exchange rate for the specified currency/type/effective date combination. |
| 10 | CREATE_ID |  |  |  | VARCHAR (30 ) | This column holds the User id of the user who created the record. |
| 11 | CREATE_DATETIME |  |  |  | Date | This column holds the record creation date. |
| 12 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 13 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_CUSTCREDITCHK

**Description:** This is an interface staging table that holds information related to franchise customer update request from the financials to RMS.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID |  |  | Y | NUMERIC (15) | Unique identifier for a set of rows that are staged for a credit check update request service call. This is generated by a sequence. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (15) | This is used to divide data associated with the same process_id into multiple chunks to facilitate parallel processing. For the same process_id, chunk_id starts with 1 and increment by 1 for each new chunk. |
| 3 | PROCESS_STATUS |  |  | Y | VARCHAR (1) | Indicates the processing status of a credit check update request. Valid values are: N (new), V (validated), E (error), C(completed). |
| 4 | CUSTCREDITCHK_ID | P |  | Y | NUMERIC (15) | Unique identifier for a franchise customer update request. |
| 5 | ACTION_TYPE |  |  | Y | VARCHAR (10) | Indicates the action type of a credit check equest. Currently only update request is supported. |
| 6 | WF_CUSTOMER_ID |  |  | Y | NUMERIC (10) | Unique Identifier for the customer. |
| 7 | WF_CUSTOMER_GROUP_ID |  |  | Y | NUMERIC (10) | Indicates the customer group to which the customer belongs to. |
| 8 | CREDIT_IND |  |  | Y | VARCHAR (1) | Determines if the customer has good credit. Valid values are Y and N. |
| 9 | ERROR_MSG |  |  |  | VARCHAR (2000) | Holds the validation errors of the record. If multiple validation errors are found on a record, the error messages are concatenated and separated by. |
| 10 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 11 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 12 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 13 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SVC_CUSTCREDITCHK|PK||||CUSTCREDITCHK_ID|ASC|

---

## Table: SVC_CUSTOMER_SEGMENTS

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in CUSTOMER_SEGMENTS.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | CUSTOMER_SEGMENT_ID |  |  |  | NUMERIC (10) | The customer segment id of a given customer segment type, referenced and attached to promotions in RPM. They will be available in RPM promotion UI screen for customer segment promotions. |
| 7 | CUSTOMER_SEGMENT_DESC |  |  |  | VARCHAR (120 ) | The description of customer segment id. |
| 8 | CUSTOMER_SEGMENT_TYPE |  |  |  | VARCHAR (6 ) | The customer segment type of a given customer segment, referenced and attached to promotions in RPM. They will be available in RPM promotion UI screen for customer segment promotions. For example: Electrician. |
| 9 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 10 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 11 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 12 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_CUSTOMER_SEGMENTS_TL

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in CUSTOMER_SEGMENTS_TL.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 BYTE) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 BYTE) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | LANG |  |  |  | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 7 | CUSTOMER_SEGMENT_ID |  |  |  | NUMERIC (10) | The customer segment id of a given customer segment type, referenced and attached to promotions in RPM. They will be available in RPM promotion UI screen for customer segment promotions. |
| 8 | CUSTOMER_SEGMENT_DESC |  |  |  | VARCHAR (120 BYTE) | The description of customer segment id. |

---

## Table: SVC_CUSTOMER_SEGMENT_TYPES

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in CUSTOMER_SEGMENT_TYPES.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | CUSTOMER_SEGMENT_TYPE |  |  |  | VARCHAR (6 ) | The customer segment type of a given customer segment, referenced and attached to promotions in RPM. They will be available in RPM promotion UI screen for customer segment promotions. For example: Electrician. |
| 7 | CUSTOMER_SEGMENT_TYPE_DESC |  |  |  | VARCHAR (120 ) | The customer segment type description. |
| 8 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 9 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 10 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 11 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_CUSTOMER_SEGMENT_TYPES_TL

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in CUSTOMER_SEGMENT_TYPES_TL.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 BYTE) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 BYTE) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | LANG |  |  |  | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 7 | CUSTOMER_SEGMENT_TYPE |  |  |  | VARCHAR (6 BYTE) | The customer segment type of a given customer segment, referenced and attached to promotions in RPM. They will be available in RPM promotion UI screen for customer segment promotions. For example: Electrician. |
| 8 | CUSTOMER_SEGMENT_TYPE_DESC |  |  |  | VARCHAR (120 BYTE) | The customer segment type description. |

---

## Table: SVC_CUSTORDSUB

**Description:** This table is a parameter table used in integration services (e.g. web service, bulk interfaces). The table definition reflects the business object definition of RIB_CustOrdSubDesc_REC. This table holds customer order substitution header information.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | CUSTORDSUB_ID | P |  | Y | NUMERIC (15) | Holds the unique identifier for this table. |
| 2 | PROCESS_ID |  |  | Y | NUMERIC (15) | Unique identifier for a set of rows that are staged for a customer order substitution request service call. This is generated by a sequence. |
| 3 | CHUNK_ID |  |  | Y | NUMERIC (15) | This is used to divide data associated with the same process_id into multiple chunks to facilitate parallel processing. For the same process_id, chunk_id starts with 1 and increment by 1 for each new chunk. |
| 4 | PROCESS_STATUS |  |  | Y | VARCHAR (1) | Indicates the processing status of a customer order substitution request. Valid values are: 'N' (new), 'V' (validated), 'E' (error), 'C' (completed). |
| 5 | ACTION_TYPE |  |  | Y | VARCHAR (10) | Indicates the action type of a customer order substitution request. Currently only 'create' is supported. |
| 6 | CUSTOMER_ORDER_NO |  |  | Y | VARCHAR (48) | Holds the master customer order number from OMS. |
| 7 | FULFILL_ORDER_NO |  |  | Y | VARCHAR (48) | Unique number from OMS related to the fulfillment details. One or more fulfillment orders could relate back to a single customer order in OMS. |
| 8 | ITEM |  |  | Y | VARCHAR (25) | This contains the original item in the customer order which is getting substituted. |
| 9 | ITEM_QTY |  |  | Y | NUMERIC (12,4) | This contains the updated order quantity for the original item. This field can be 0 when the entire item has been substituted or will have value less than the originally ordered quantity when it is partially fulfilled. |
| 10 | QTY_UOM |  |  | Y | VARCHAR (4) | This contains the uom for the revised ordered quantity of the original item. This will be same as standard UOM of the item. |
| 11 | LOC_ID |  |  | Y | NUMERIC (10) | Indicates the location where the substitution is being made. |
| 12 | LOC_TYPE |  |  | Y | VARCHAR (1) | Indicates the location type. Only 'S' (Store) is supported. |
| 13 | ERROR_MSG |  |  |  | VARCHAR (2000) | Holds the validation errors for the record. If multiple validation errors are found on a record, the error messages are concatenated and separated by ";". |
| 14 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 15 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user who created the record. |
| 16 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 17 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user who last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SVC_CUSTORDSUB|PK||||CUSTORDSUB_ID|ASC|

### Constraints

|Type|Column / Constraint<br>Name|Details|
|---|---|---|
|Table Level|CHK_SVC_CUSTORDSUB|PROCESS_STATUS IN ('N','V','E','C')<br>|
|Column Level|PROCESS_STATUS||

---

## Table: SVC_CUSTORDSUBDTL

**Description:** This table is a parameter table used in integration services (e.g. web service, bulk interfaces). The table definition reflects the business object definition of RIB_SubItemDetails_REC. This table holds customer order substitution detail information.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID |  |  | Y | NUMERIC (15) | Unique identifier for a group of records to be processed by a single thread. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (15) | This is used to divide data associated with the same process_id into multiple chunks to facilitate parallel processing. For the same process_id, chunk_id starts with 1 and increment by 1 for each new chunk. |
| 3 | CUSTORDSUB_ID |  | F | Y | NUMERIC (15) | Unique identifier for a customer order substitution request. It serves as a reference to the parent record. |
| 4 | SUB_ITEM |  |  | Y | VARCHAR (25) | Indicates the item substituted for the customer order. |
| 5 | SUB_ITEM_QTY |  |  | Y | NUMERIC (12,4) | Indicates the substituted quantity for the substitute item. |
| 6 | SUB_QTY_UOM |  |  | Y | VARCHAR (4) | Indicates the unit of measure in which substituted item quantity is held. This should be standard uom of the substitute item. |
| 7 | ERROR_MSG |  |  |  | VARCHAR (2000) | Holds the validation errors of the record. If multiple validation errors are found on a record, the error messages are concatenated and separated by ";". |
| 8 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 9 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user who created the record. |
| 10 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 11 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user who last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|SVC_CUSTORDSUBDTL_I1|||||CUSTORDSUB_ID|ASC|

---

## Table: SVC_CVB_DETAIL

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in CVB_DETAIL.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | CVB_CODE |  |  |  | VARCHAR (10 ) | Contains a user specified code representing a computation base that will be used by expenses and assessments. |
| 7 | COMP_ID |  |  |  | VARCHAR (10 ) | Contains a user specified code representing a specific expense. This code must exist on the LCST_COMP table where the comp_type is Expense (E). |
| 8 | COMBO_OPER |  |  |  | VARCHAR (1 ) | Contains a flag indicating whether to add or subtract this expense to the value base. Valid values are Add (+) or Subtract (-). |
| 9 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 10 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 11 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 12 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_CVB_HEAD

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in CVB_HEAD.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | CVB_CODE |  |  |  | VARCHAR (10 ) | Contains a user specified code representing a computation base that will be used by expenses. |
| 7 | CVB_DESC |  |  |  | VARCHAR (250 ) | Contains the description or name of the Computation Value Base. |
| 8 | NOM_FLAG_1 |  |  |  | VARCHAR (1 ) | Contains a flag that is used to indicate whether or not to include expenses in the value base with the corresponding Nomination Flag on the Expense record turned on (i.e. set to + or -). Valid values are Y - include expenses with this flag set, or N - do not include expenses with this flag set. |
| 9 | NOM_FLAG_2 |  |  |  | VARCHAR (1 ) | Contains a flag that is used to indicate whether or not to include expenses in the value base with the corresponding Nomination Flag on the Expense record turned on (i.e. set to + or -). Valid values are Y - include expenses with this flag set, or N - do not include expenses with this flag set. |
| 10 | NOM_FLAG_3 |  |  |  | VARCHAR (1 ) | Contains a flag that is used to indicate whether or not to include expenses in the value base with the corresponding Nomination Flag on the Expense record turned on (i.e. set to + or -). Valid values are Y - include expenses with this flag set, or N - do not include expenses with this flag set. |
| 11 | NOM_FLAG_4 |  |  |  | VARCHAR (1 ) | Contains a flag that is used to indicate whether or not to include expenses in the value base with the corresponding Nomination Flag on the Expense record turned on (i.e. set to + or -). Valid values are Y - include expenses with this flag set, or N - do not include expenses with this flag set. |
| 12 | NOM_FLAG_5 |  |  |  | VARCHAR (1 ) | Contains a flag that is used to indicate whether or not to include expenses in the value base with the corresponding Nomination Flag on the Expense record turned on (i.e. set to + or -). Valid values are Y - include expenses with this flag set, or N - do not include expenses with this flag set. |
| 13 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 14 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 15 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 16 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_CVB_HEAD_TL

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in CVB_HEAD_TL.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | LANG |  |  |  | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 7 | CVB_CODE |  |  |  | VARCHAR (10) | Contains a user specified code representing a computation base that will be used by expenses. |
| 8 | CVB_DESC |  |  |  | VARCHAR (250) | Contains the description or name of the Computation Value Base. |

---

## Table: SVC_DEAL_COMP_TYPE

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in DEAL_COMP_TYPE.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | DEAL_COMP_TYPE |  |  |  | VARCHAR (6) | Code identifying the type of a deal component. These codes are user-defined and assigned to each deal component. |
| 7 | DEAL_COMP_TYPE_DESC |  |  |  | VARCHAR (250) | Holds the description of the deal type code in a given language. |
| 8 | CREATE_ID |  |  |  | VARCHAR (30) | User who created the record. |
| 9 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 10 | LAST_UPD_ID |  |  |  | VARCHAR (30) | User who last updated the record. |
| 11 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_DEAL_COMP_TYPE_TL

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in DEAL_COMP_TYPE_TL.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | DEAL_COMP_TYPE_DESC |  |  |  | VARCHAR (250) | Holds the description of the deal type code in a given language. |
| 7 | LANG |  |  |  | NUMERIC (6) | Contains the number which uniquely identifies a language. |
| 8 | DEAL_COMP_TYPE |  |  |  | VARCHAR (6) | Code identifying the type of a deal component. These codes are user-defined and assigned to each deal component. |
| 9 | CREATE_ID |  |  |  | VARCHAR (30) | User who created the record. |
| 10 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 11 | LAST_UPD_ID |  |  |  | VARCHAR (30) | User who last updated the record. |
| 12 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_DEAL_PASSTHRU

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in DEAL_PASSTHRU.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | DEPT |  |  |  | NUMERIC (4) | This field contains the department for which the deal passthru is defined. |
| 7 | SUPPLIER |  |  |  | NUMERIC (10) | This field contains the Supplier ID of the supplier applicable to the deal passthru. |
| 8 | COSTING_LOC |  |  |  | NUMERIC (10) | This field contains the location for the franchise store that is used for franchise costing. |
| 9 | LOCATION |  |  |  | NUMERIC (10) | This field contains the location id of franchise stores applicable to the deal passthru. |
| 10 | LOC_TYPE |  |  |  | VARCHAR (1 ) | This field contains the type of location.This will always be S - Store. |
| 11 | PASSTHRU_PCT |  |  |  | NUMERIC (12,4) | This field contains the percentage of the suppliers off-invoice deals that will be passed to the franchise store. |
| 12 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 13 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 14 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 15 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_DELIVERY_SLOT

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in DELIVERY_SLOT.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | DELIVERY_SLOT_ID |  |  |  | VARCHAR (15 ) | This column specifies when the store requested quantity is needed at the store. |
| 7 | DELIVERY_SLOT_DESC |  |  |  | VARCHAR (240 ) | Description of the delivery slot.This could contain the time element for the delivery schedule. |
| 8 | DELIVERY_SLOT_SEQUENCE |  |  |  | NUMERIC (8) | This column will specify the precedence of the delivery slot on a particular day. |
| 9 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 10 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 11 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 12 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_DELIVERY_SLOT_TL

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in DELIVERY_SLOT_TL.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | LANG |  |  |  | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 7 | DELIVERY_SLOT_ID |  |  |  | VARCHAR (15) | This column specifies when the store requested quantity is needed at the store. For example, it defines whether the stock is designated for AM or PM delivery. |
| 8 | DELIVERY_SLOT_DESC |  |  |  | VARCHAR (240) | Description of the delivery slot. This could contain the time element for the delivery schedule (i.e. Afternoon Slot 3 PM). |

---

## Table: SVC_DOC

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in DOC.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | DOC_ID |  |  |  | NUMERIC (6) | An assigned sequence number to distinguish between the different documents. |
| 7 | DOC_DESC |  |  |  | VARCHAR (120 ) | A full description or name of the document type. |
| 8 | DOC_TYPE |  |  |  | VARCHAR (6 ) | Specifies the type of document. Valid values are: REQ - Required Documents, SI - Special Instructions Additional types can be added using the codes table. |
| 9 | LC_IND |  |  |  | VARCHAR (1 ) | This column indicates whether or not the document is a Letter of Credit document. Letter of Credit documents are not modifiable in any other |
| 10 | SEQ_NO |  |  |  | NUMERIC (4) | This number is an indicator of what order documents should go in on any given Letter of Credit. |
| 11 | TEXT |  |  |  | VARCHAR (2000 ) | Contains the actual text of the document. |
| 12 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 13 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 14 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 15 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_DOC_TL

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in DOC_TL.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 BYTE) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 BYTE) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | LANG |  |  |  | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 7 | DOC_ID |  |  |  | NUMERIC (6) | An assigned sequence number to distinguish between the different documents. |
| 8 | DOC_DESC |  |  |  | VARCHAR (120 BYTE) | A full description or name of the document type. |

---

## Table: SVC_ELC_COMP

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in ELC_COMP.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | COMP_ID |  |  |  | VARCHAR (10 ) | Contains a unique user specified code representing the Component. |
| 7 | COMP_DESC |  |  |  | VARCHAR (250 ) | Contains the name or description of the Component. |
| 8 | COMP_TYPE |  |  |  | VARCHAR (1 ) | Contains a code used to distinguish between Expenses, Assessments, and Up Charges. The valid values are Expense (E), Assessment (A), or Up Charge (U). |
| 9 | ASSESS_TYPE |  |  |  | VARCHAR (3 ) | Contains a code representing what type of tariff this expense component is related to. The assessment type must exist on the HTS_FEE or HTS_TAX table.This field is only populated when the Component Type is A (Assessment). |
| 10 | IMPORT_COUNTRY_ID |  |  |  | VARCHAR (3 ) | Contains the country that the assessment applies to. This field will only have a value if the Component Type is A (Assessment). |
| 11 | EXPENSE_TYPE |  |  |  | VARCHAR (6 ) | Contains a code used to classify and group this expense. The code_type for this field is EXPT. Valid values are user defined. This field will only be populated if the Component Type is E (Expense). |
| 12 | UP_CHRG_TYPE |  |  |  | VARCHAR (6 ) | Contains the type of Up Charge component. Valid values are E (Expense) or P (Profit). Expense Up Charges are charges incurred by the sending location when transferring goods from to the receiving location, like Freight or Insurance.The receiving location will have to pay these charges to the sending location.Profit Up Charges are used when the sending location is trying to become a profit center. Examples of Profit charges are Storage Fees and Processing Fees. |
| 13 | UP_CHRG_GROUP |  |  |  | VARCHAR (6 ) | Contains the group of the Up Charge, used for grouping Up Charges together for display in the Transfer diaolg. |
| 14 | CVB_CODE |  |  |  | VARCHAR (10 ) | Contains a code representing the base value for calculating a component. These codes must exist on the Computation Value Base Header table (cvb_head). If this field is NULL and the Calculation Basis is V (Value), calculation of the Component will use the Suppliers unit cost (if the cost_basis is Supplier), or order cost (if the cost_basis is Order) as the base. However, if the Component Type is Up Charge, then the Item/Locations Weighted Average Cost will be used, and this field will always be NULL. |
| 15 | CALC_BASIS |  |  |  | VARCHAR (6 ) | Contains a one character code indicating whether the component is calculated on a per-unit (Specific) or ad valorem (Value) basis. Valid values are Value (V) or Specific (S). |
| 16 | COST_BASIS |  |  |  | VARCHAR (1 ) | Contains the basis the expense will be calculated against if there is no CVB code attached to the expense. Valid values are S (Supplier) or O (Order). If the Cost Basis is S then when calculating the expense, the items supplier cost will be used. If the Cost Basis is O then the total order cost of the item on the order will be used to calculate the expense. This field will be NULL if the CVB code field is NULL or if the Component Type is Assessment or Up Charge. |
| 17 | EXP_CATEGORY |  |  |  | VARCHAR (6 ) | Contains a code that is used to classify and group expenses. The codes are user defined. Two example expense categories are Admin (A) and Misc (M). These codes are on the code detail table with a code type of EXPC. |
| 18 | COMP_RATE |  |  |  | NUMERIC (20,4) | Contains the rate to be charged against the calculation base. The value in this field will be a percentage if the Calculation Basis is V (Value), and a monetary amount if the Calculation Basis is S (Specific). |
| 19 | COMP_LEVEL |  |  |  | NUMERIC (2) | Contains a numeric value that determines component calculation order. Components that have the same comp_level will be calculated in the order they appear in the table. |
| 20 | DISPLAY_ORDER |  |  |  | NUMERIC (2) | Contains a numeric value that determines the display order of the components when used in other modules. |
| 21 | ALWAYS_DEFAULT_IND |  |  |  | VARCHAR (1 ) | Contains a flag indicating that the component should always default to every item. Valid values are Yes (Y) or No (N). |
| 22 | COMP_CURRENCY |  |  |  | VARCHAR (3 ) | Contains the currency code for the cost component that is being entered in the Cost Component Maintenance Form. |
| 23 | PER_COUNT |  |  |  | NUMERIC (12,4) | Contains a count indicating the amount of the Per Count Unit of Measure to which the rate applies. This field will be NULL if the calc_basis is Value (V). This field is required If the calc_basis is Specific (S). |
| 24 | PER_COUNT_UOM |  |  |  | VARCHAR (4 ) | Contains the unit of measure in which the Per Count is specified. This field will be NULL if the calc_basis is Value (V). This field is required If the calc_basis is Specific (S). |
| 25 | NOM_FLAG_1 |  |  |  | VARCHAR (1 ) | Indicates whether or not the value of the Component should be added to or subtracted from the corresponding CVB. If a different component exists with a CVB, and that CVB has the first nomination flag checked. Then any other component with the first nomination flag set to + or - will be added to or subtracted from the value of that CVB, which is then used to calculate the component to which it is attached. This flag is completely user definable, including the corresponding label which is defined on the System Options table. |
| 26 | NOM_FLAG_2 |  |  |  | VARCHAR (1 ) | Also referred to as the In Duty flag. Indicates whether or not the value of the Component should be added to or subtracted from Total Duty. This flag is system defined and should only be used to include or subtract values to or from Duty. |
| 27 | NOM_FLAG_3 |  |  |  | VARCHAR (1 ) | Indicates whether or not the value of the Component should be added to or subtracted from the corresponding CVB. If a different component exists with a CVB, and that CVB has the third nomination flag checked. Then any other component with the third nomination flag set to + or - will be added to or subtracted from the value of that CVB, which is then |
| 28 | NOM_FLAG_4 |  |  |  | VARCHAR (1 ) | Also referred to as the In Exp. flag. Indicates whether or not the value of the Component should be added to or subtracted from Total Expenses. This flag is system defined and should only be used to include or subtract values to or from the Total Expense value. |
| 29 | NOM_FLAG_5 |  |  |  | VARCHAR (1 ) | Also referred to as the In ALC flag. Indicates whether or not the value of the Component should be added to or subtracted from Total Actual Landed Cost. This flag is system defined and should only be used to include or subtract values to or from ALC when the client is not expecting to receive an Invoice for the amount, (i.e. internal fees). |
| 30 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 31 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 32 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 33 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_ELC_COMP_TL

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in ELC_COMP_TL.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | LANG |  |  |  | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 7 | COMP_ID |  |  |  | VARCHAR (10) | Contains a unique user specified code representing the Component. |
| 8 | COMP_DESC |  |  |  | VARCHAR (250) | Contains the name or description of the Component. |

---

## Table: SVC_ENTRY_STATUS

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in ENTRY_STATUS.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | ENTRY_STATUS_DESC |  |  |  | VARCHAR (250) | This column will hold the description of the entry status. |
| 7 | IMPORT_COUNTRY_ID |  |  |  | VARCHAR (3) | This column will hold the import country. |
| 8 | ENTRY_STATUS |  |  |  | VARCHAR (6) | This will hold the unique identifier for the custom defined entry status. |
| 9 | CREATE_ID |  |  |  | VARCHAR (30) | User who created the record. |
| 10 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 11 | LAST_UPD_ID |  |  |  | VARCHAR (30) | User who last updated the record. |
| 12 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_ENTRY_STATUS_TL

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in ENTRY_STATUS_TL.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | ENTRY_STATUS_DESC |  |  |  | VARCHAR (250) | This column will hold the description of the entry status. |
| 7 | IMPORT_COUNTRY_ID |  |  |  | VARCHAR (3) | This column will hold the import country. |
| 8 | ENTRY_STATUS |  |  |  | VARCHAR (6) | This will hold the unique identifier for the custom defined entry status. |
| 9 | LANG |  |  |  | NUMERIC (6) | Contains the number which uniquely identifies a language. |
| 10 | CREATE_ID |  |  |  | VARCHAR (30) | User who created the record. |
| 11 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 12 | LAST_UPD_ID |  |  |  | VARCHAR (30) | User who last updated the record. |
| 13 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_ENTRY_TYPE

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in ENTRY_TYPE.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | ENTRY_TYPE_DESC |  |  |  | VARCHAR (250) | This column will hold the description of the entry type. |
| 7 | IMPORT_COUNTRY_ID |  |  |  | VARCHAR (3) | This column will hold the import country. |
| 8 | ENTRY_TYPE |  |  |  | VARCHAR (6) | This will hold the unique identifier for the custom defined entry type. |
| 9 | CREATE_ID |  |  |  | VARCHAR (30) | User who created the record. |
| 10 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 11 | LAST_UPD_ID |  |  |  | VARCHAR (30) | User who last updated the record. |
| 12 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_ENTRY_TYPE_TL

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in ENTRY_TYPE_TL.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | ENTRY_TYPE_DESC |  |  |  | VARCHAR (250) | This column will hold the description of the entry type. |
| 7 | IMPORT_COUNTRY_ID |  |  |  | VARCHAR (3) | This column will hold the import country. |
| 8 | ENTRY_TYPE |  |  |  | VARCHAR (6) | This will hold the unique identifier for the custom defined entry type. |
| 9 | LANG |  |  |  | NUMERIC (6) | This column will hold the import country. |
| 10 | CREATE_ID |  |  |  | VARCHAR (30) | User who created the record. |
| 11 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 12 | LAST_UPD_ID |  |  |  | VARCHAR (30) | User who last updated the record. |
| 13 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_EXT_ENTITY

**Description:** This is the staging table for CFAS ext entity information.It is used to temporarily hold data before it is uploaded/updated in CFA_EXT_ENTITY.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk.The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10<br>) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10<br>) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | BASE_RMS_TABLE |  |  |  | VARCHAR (30<br>) | The physical database table in RMS to be extended. |
| 7 | VALIDATION_FUNC |  |  |  | VARCHAR<br>(61) | This contains the name of the stored validation procedure (package.function name) executed in the entitys main UI to check data consistencies covering all extended attributes defined under the entity. |
| 8 | CREATE_ID |  |  |  | VARCHAR (30<br>) | User who created the record. |
| 9 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 10 | LAST_UPD_ID |  |  |  | VARCHAR (30<br>) | User who last updated the record. |
| 11 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_FCUSTUPLD_FHEAD

**Description:** This is an interface table used for franchise customer upload process. It holds file header information.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID |  |  |  | NUMERIC (15) | Automatically generated unique id that identifies a franchise customer upload. |
| 2 | FCUST_SEQ_NO |  |  |  | NUMERIC (15) | Automatically generated id that uniquely identifies a transcation in a franchise customer upload process. For file header record fcust_seq_no will be 0. |
| 3 | FILE_RECORD_DESCRIPTOR |  |  |  | VARCHAR (5) | Describes the file line type. Valid rows have the value FHEAD. |
| 4 | FILE_LINE_ID |  |  |  | NUMERIC (10) | Identifies a unique line in the RMS franchise customer upload file. |
| 5 | FILE_TYPE |  |  |  | VARCHAR (5) | Identifies the file type. Files for franchise customer upload are identified as FCUST. |
| 6 | FILE_CREATE_DATE |  |  |  | Date | The date the franchise customer upload file was created. |
| 7 | STATUS |  |  |  | VARCHAR (1) | Contains the status of the file header record. Valid values are N = New, E = Error, R = Rejected and P = Processed. |
| 8 | ERROR_MSG |  |  |  | VARCHAR (4000) | Contains the FATAL error message if any during the franchise customer upload process. Errors in this table are specific to file header information. |
| 9 | LAST_UPDATE_DATETIME |  |  |  | Date | Contains the date and time the status was updated. |

---

## Table: SVC_FCUSTUPLD_FTAIL

**Description:** This table is an interface table used for franchise customer upload process. It serves as the end-of-file marker in an RMS franchise customer upload file. There should only be a single row in this table for a specific process id. The fields of this table map to the FTAIL record layout in an RMS franchise customer upload file with the exception of some process-related fields.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID |  |  |  | NUMERIC (15) | Automatically generated unique id that identifies a franchise customer upload. |
| 2 | FCUST_SEQ_NO |  |  |  | NUMERIC (15) | Automatically generated id that uniquely identifies a transcation in a franchise customer upload process. For file tail record fcust_seq_no will be 0. |
| 3 | FILE_RECORD_DESCRIPTOR |  |  |  | VARCHAR (5) | Describes the file line type. Valid rows have the value FTAIL. |
| 4 | FILE_LINE_ID |  |  |  | NUMERIC (10) | Identifies a unique line in the RMS franchise customer upload file. |
| 5 | FILE_RECORD_COUNTER |  |  |  | NUMERIC (10) | Contains the total number of transaction records in the tables SVC_FCUSTUPLD_THEAD, SVC_FCUSTUPLD_TDETL and SVC_FCUSTUPLD_TTAIL for this process ID. |
| 6 | STATUS |  |  |  | VARCHAR (1) | Contains the status of the file tail record. Valid values are N = New, E = Error, R = Rejected and P = Processed. |
| 7 | ERROR_MSG |  |  |  | VARCHAR (4000) | Contains the FATAL error message if any during the franchise customer upload process. |

---

## Table: SVC_FCUSTUPLD_STATUS

**Description:** This table is an interface table used in the franchise customer upload process. It is used for status tracking and program control.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID |  |  |  | NUMERIC (15) | Automatically generated unique id that identifies a franchise customer upload. |
| 2 | CHUNK_ID |  |  |  | NUMERIC (10) | This is used to divide data associated with the same process_id into multiple chunks to facilitate parallel processing. For the same process_id, chunk_id starts with 1 and increment by 1 for each new chunk. |
| 3 | REFERENCE_ID |  |  |  | VARCHAR (255) | Contains a value that references the source for the data in the parameter tables. |
| 4 | STATUS |  |  |  | VARCHAR (1) | Status of the franchise customer upload execution for a particular process ID . Valid values are N = New, E = Error, R = Rejected, and P = Processed. |
| 5 | ERROR_MSG |  |  |  | VARCHAR (4000) | Contains the error message if any during the franchise customer upload process. |
| 6 | LAST_UPDATE_DATETIME |  |  |  | Date | Contains the date and time this status row was updated. |

---

## Table: SVC_FCUSTUPLD_TDETL

**Description:** This is an interface table used for franchise customer upload process. Each record in this table signifies a transaction detail record which holds the franchise customer information. The fields of this table map to the TDETL record in the RMS franchise customer upload file layout.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID |  |  |  | NUMERIC (15) | Automatically generated unique id that identifies a franchise customer upload. |
| 2 | FCUST_SEQ_NO |  |  |  | NUMERIC (15) | Automatically generated id that uniquely identifies a transcation in a franchise customer upload process. |
| 3 | FILE_RECORD_DESCRIPTOR |  |  |  | VARCHAR (5) | Describes the file line type. Valid rows have the value TDETL. |
| 4 | FILE_LINE_ID |  |  |  | NUMERIC (10) | Identifies a unique line in the RMS franchise customer upload file. |
| 5 | MESSAGE_TYPE |  |  |  | VARCHAR (30) | Identifies the action that will be performed on the franchise customer transaction detail record. It can be either create or update or delete a franchise customer. |
| 6 | F_CUSTOMER_ID |  |  |  | NUMERIC (10) | This field will hold the franchise customer ID. |
| 7 | F_CUSTOMER_NAME |  |  |  | VARCHAR (120) | This field will hold the franchise customer description. |
| 8 | CREDIT_IND |  |  |  | VARCHAR (1) | This field will determine if the franchise customer has good credit.Valid values are Y and N. |
| 9 | AUTO_APPROVE_IND |  |  |  | VARCHAR (1) | This indicator is used to auto approve the externally uploaded orders and returns if all the validations are passed. Valid values are Y and N. |
| 10 | STATUS |  |  |  | VARCHAR (1) | Contains the status of the transaction detail record. Valid values are N = New, E = Error, R = Rejected, and P = Processed. |
| 11 | ERROR_MSG |  |  |  | VARCHAR (4000) | Contains the non FATAL error message if any during the franchise customer upload process. Errors in this table are specific to transaction details and multiple error messages are concatenated together. |

---

## Table: SVC_FCUSTUPLD_THEAD

**Description:** This is an interface table used for franchise customer upload process. Each record in this table signifies a unique transaction header and each transaction header holds franchise customer group information. The fields of this table map to the THEAD record in the RMS franchise customer upload file layout. A unique transaction in this table is identified by the process id and the transaction seq no combination.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID |  |  |  | NUMERIC (15) | Automatically generated unique id that identifies a franchise customer upload. |
| 2 | FCUST_SEQ_NO |  |  |  | NUMERIC (15) | Automatically generated id that uniquely identifies a transcation in a franchise customer upload process. |
| 3 | CHUNK_ID |  |  |  | NUMERIC (10) | This is used to divide data associated with the same process_id into multiple chunks to facilitate parallel processing. For the same process_id, chunk_id starts with 1 and increment by 1 for each new chunk. |
| 4 | FILE_RECORD_DESCRIPTOR |  |  |  | VARCHAR (5) | Describes the file line type. Valid rows have the value THEAD. |
| 5 | FILE_LINE_ID |  |  |  | NUMERIC (10) | Identifies a unique line in the RMS franchise customer upload file. |
| 6 | MESSAGE_TYPE |  |  |  | VARCHAR (30) | Identifies the action that will be performed on the franchise customer transaction header record. It can be either create or update or delete a franchise customer group. |
| 7 | F_CUSTOMER_GROUP_ID |  |  |  | NUMERIC (10) | This field will hold the customer group ID. |
| 8 | F_CUSTOMER_GROUP_NAME |  |  |  | VARCHAR (120) | This field will hold the customer group description. |
| 9 | STATUS |  |  |  | VARCHAR (1) | Contains the status of the transaction header record. Valid values are N = New, E = Error, R = Rejected and P = Processed. |
| 10 | ERROR_MSG |  |  |  | VARCHAR (4000) | Contains the non FATAL error message if any during the franchise customer upload process. Errors in this table are specific to transaction header information and multiple error messages are concatenated together. |

---

## Table: SVC_FCUSTUPLD_TTAIL

**Description:** This table is an interface table used for the franchise customer upload process. It serves as the end-of-transaction marker in an RMS franchise customer upload file layout. There should only be a single row in this table for a specific transaction. The fields of this table map to the TTAIL record layout in an RMS franchise customer upload file with the exception of some process-related fields.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID |  |  |  | NUMERIC (15) | Automatically generated unique id that identifies a franchise customer upload. |
| 2 | FCUST_SEQ_NO |  |  |  | NUMERIC (15) | Automatically generated id that uniquely identifies a transcation in a franchise customer upload process. |
| 3 | FILE_RECORD_DESCRIPTOR |  |  |  | VARCHAR (5) | Describes the file line type. Valid rows have the value TTAIL. |
| 4 | FILE_LINE_ID |  |  |  | NUMERIC (10) | Identifies a unique line in the RMS franchise customer upload file. |
| 5 | TRAN_RECORD_COUNTER |  |  |  | NUMERIC (10) | Contains the total number of transaction detail records in the SVC_FCUSTUPLD_TDETL table for this process ID sequence no combination. |
| 6 | STATUS |  |  |  | VARCHAR (1) | Contains the status of the transaction tail record. Valid values are N = New, E = Error, R = Rejected, and P = Processed. |
| 7 | ERROR_MSG |  |  |  | VARCHAR (4000) | Contains the non FATAL error message if any during the franchise customer upload process. Errors in this table are specific to transaction tail and multiple error messages are concatenated together. |

---

## Table: SVC_FIF_CURRENCY_XREF

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in FIF_CURRENCY_XREF.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | FIF_EXCHANGE_TYPE |  |  |  | VARCHAR (30 ) | This field contains the type of exchange rate defined by the external financial system interfacing with RMS. |
| 7 | RMS_EXCHANGE_TYPE |  |  |  | VARCHAR (1 ) | This field contains the cross referenced type of exchange rate defined by RMS. |
| 8 | CREATE_ID |  |  |  | VARCHAR (30 ) | This column holds the User id of the user who created the record. |
| 9 | CREATE_DATETIME |  |  |  | Date | This column holds the record creation date. |
| 10 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 11 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_FIF_GL_CROSS_REF

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in FIF_GL_CROSS_REF.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 BYTE) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 BYTE) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | SET_OF_BOOKS_ID |  |  |  | NUMERIC (15) | Set Of Books ID. |
| 7 | DEPT |  |  |  | NUMERIC (4) | Oracle Retail department. A value of -1 will be used as a wildcard to mean all departments. |
| 8 | CLASS |  |  |  | NUMERIC (4) | Oracle Retail Class. A value of -1 will be used as a wildcard to mean all classes. |
| 9 | SUBCLASS |  |  |  | NUMERIC (4) | Oracle Retail Subclass. A value of -1 will be used as a wildcard to mean all SUBCLASS. |
| 10 | LOCATION |  |  |  | NUMERIC (10) | Oracle Retail Location. A value of -1 will be used as a wildcard to mean all LOCATION. |
| 11 | TRAN_CODE |  |  |  | NUMERIC (4) | Oracle Retail Transaction code. A value of -1 will be used as a wildcard to mean all tran codes. A tran code of zero will be used to refer to purchase order accounts. |
| 12 | COST_RETAIL_FLAG |  |  |  | VARCHAR (1 BYTE) | Cost C or Retail R Flag. |
| 13 | LINE_TYPE |  |  |  | VARCHAR (6 BYTE) | This indicates whether the account code of this record is for an Item, Freight,Tax, or Miscellaneous. This information will be necessary when choosing which Oracle Financials account to associate with each line in the invoice. Without this field, we are only able to choose an account code for an item, not for freight, tax, or miscellaneous charges. |
| 14 | TRAN_REF_NO |  |  |  | VARCHAR (25 BYTE) | Contains the intercompany transfer from/to location (tran code = 37, 38), the work order activity ID (tran code = 51, 52), or the inv_adj_reason (tran code = 22, 23). If the tran code is Intercompany Out, the field will contain the transfer To Location. If the tran code is Intercompany In, the field will contain the transfer From Location. |
| 15 | DR_CCID |  |  |  | NUMERIC (15) | Oracle debit account combination code ID, determined from the 10 sequence numbers. |
| 16 | DR_SEQUENCE1 |  |  |  | VARCHAR (25 BYTE) | Oracle debit account mapping field1, maps to Oracle side GL_Code _combinations table. |
| 17 | DR_SEQUENCE2 |  |  |  | VARCHAR (25 BYTE) | Oracle debit account mapping field2, maps to Oracle side GL_Code _combinations table. |
| 18 | DR_SEQUENCE3 |  |  |  | VARCHAR (25 BYTE) | Oracle debit account mapping field3, maps to Oracle side GL_Code _combinations table. |
| 19 | DR_SEQUENCE4 |  |  |  | VARCHAR (25 BYTE) | Oracle debit account mapping field4, maps to Oracle side GL_Code _combinations table. |
| 20 | DR_SEQUENCE5 |  |  |  | VARCHAR (25 BYTE) | Oracle debit account mapping field5, maps to Oracle side GL_Code _combinations table. |
| 21 | DR_SEQUENCE6 |  |  |  | VARCHAR (25 BYTE) | Oracle debit account mapping field6, maps to Oracle side GL_Code _combinations table. |
| 22 | DR_SEQUENCE7 |  |  |  | VARCHAR (25 BYTE) | Oracle debit account mapping field7, maps to Oracle side GL_Code _combinations table. |
| 23 | DR_SEQUENCE8 |  |  |  | VARCHAR (25 BYTE) | Oracle debit account mapping field8, maps to Oracle side GL_Code _combinations table. |
| 24 | DR_SEQUENCE9 |  |  |  | VARCHAR (25 BYTE) | Oracle debit account mapping field9, maps to Oracle side GL_Code _combinations table. |
| 25 | DR_SEQUENCE10 |  |  |  | VARCHAR (25 BYTE) | Oracle debit account mapping field10, maps to Oracle side GL_Code _combinations table. |
| 26 | CR_CCID |  |  |  | NUMERIC (15) | Oracle credit account combination code ID, determined from the 10 sequence numbers. |
| 27 | CR_SEQUENCE1 |  |  |  | VARCHAR (25 BYTE) | Oracle credit account mapping field1, maps to Oracle side GL_Code _combinations table. |
| 28 | CR_SEQUENCE2 |  |  |  | VARCHAR (25 BYTE) | Oracle credit account mapping field2, maps to Oracle side GL_Code _combinations table. |
| 29 | CR_SEQUENCE3 |  |  |  | VARCHAR (25 BYTE) | Oracle credit account mapping field3, maps to Oracle side GL_Code _combinations table. |
| 30 | CR_SEQUENCE4 |  |  |  | VARCHAR (25 BYTE) | Oracle credit account mapping field4, maps to Oracle side GL_Code _combinations table. |
| 31 | CR_SEQUENCE5 |  |  |  | VARCHAR (25 BYTE) | Oracle credit account mapping field5, maps to Oracle side GL_Code _combinations table. |
| 32 | CR_SEQUENCE6 |  |  |  | VARCHAR (25 BYTE) | Oracle credit account mapping field6, maps to Oracle side GL_Code _combinations table. |
| 33 | CR_SEQUENCE7 |  |  |  | VARCHAR (25 BYTE) | Oracle credit account mapping field7, maps to Oracle side GL_Code _combinations table. |
| 34 | CR_SEQUENCE8 |  |  |  | VARCHAR (25 BYTE) | Oracle credit account mapping field8, maps to Oracle side GL_Code _combinations table. |
| 35 | CR_SEQUENCE9 |  |  |  | VARCHAR (25 BYTE) | Oracle credit account mapping field9, maps to Oracle side GL_Code _combinations table. |
| 36 | CR_SEQUENCE10 |  |  |  | VARCHAR (25 BYTE) | Oracle credit account mapping field10, maps to Oracle side GL_Code _combinations table. |
| 37 | CREATE_ID |  |  |  | VARCHAR (30 BYTE) | This column holds the User id of the user who created the record. |
| 38 | CREATE_DATETIME |  |  |  | Date (7) | This column holds the record creation date. |
| 39 | LAST_UPD_ID |  |  |  | VARCHAR (30 BYTE) | User who last updated the record. |
| 40 | LAST_UPD_DATETIME |  |  |  | Date (7) | Date time when record was last updated. |

---

## Table: SVC_FILTER_GROUP_MERCH

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in FILTER_GROUP_MERCH.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | FILTER_MERCH_ID_SUBCLASS |  |  |  | NUMERIC (4) | Subclass ID of the Merchandise hierarchy level assigned to the user security group. |
| 7 | FILTER_MERCH_ID_CLASS |  |  |  | NUMERIC (4) | Class ID of the Merchandise hierarchy level assigned to the user security group. |
| 8 | FILTER_MERCH_ID |  |  |  | NUMERIC (4) | ID of the Merchandise hierarchy level assigned to the User Security Group. |
| 9 | FILTER_MERCH_LEVEL |  |  |  | VARCHAR (1 ) | The Merchandise hierarchy level assigned to the User Security Group. |
| 10 | SEC_GROUP_ID |  |  |  | NUMERIC (4) | ID of the User Security group |
| 11 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 12 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 13 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 14 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_FILTER_GROUP_ORG

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in FILTER_GROUP_ORG.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | FILTER_ORG_ID |  |  |  | NUMERIC (15) | ID of the Organization hierarchy level assigned to the User Security Group. |
| 7 | FILTER_ORG_LEVEL |  |  |  | VARCHAR (1 ) | The Organization hierarchy level assigned to the User Security Group. Valid values are contained in the CODE_DETIAL table with a CODE_TYPE of FLOW. |
| 8 | SEC_GROUP_ID |  |  |  | NUMERIC (4) | ID of the User Security group |
| 9 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 10 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 11 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 12 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_FREIGHT_SIZE

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in FREIGHT_SIZE.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | FREIGHT_SIZE |  |  |  | VARCHAR (6 ) | This field contains the unique identifier for the freight size record. |
| 7 | FREIGHT_SIZE_DESC |  |  |  | VARCHAR (250 ) | This field contains the description of the freight size. |
| 8 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 9 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 10 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 11 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_FREIGHT_SIZE_TL

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated to FREIGHT_SIZE_TL

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | LANG |  |  |  | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 7 | FREIGHT_SIZE |  |  |  | VARCHAR (6 ) | This field contains the unique identifier for the freight size record. |
| 8 | FREIGHT_SIZE_DESC |  |  |  | VARCHAR (250 ) | This field contains the description of the freight size in a given language. |
| 9 | ORIG_LANG_IND |  |  |  | VARCHAR (1 ) | Indicates if the description is in the original language entered for the inventory status type. It is set to ''Y'' when the first record is written to the table for the inventory status types. |
| 10 | REVIEWED_IND |  |  |  | VARCHAR (1 ) | Indicates if the description needs to be reviewed for translation. It is set to ''N'' when the description in the original language is inserted or updated. We assume that clients will regularly run reports on all strings that are not reviewed (i.e. reviewed_ind = ''N''). When translation either provides a new string, or OKs that the existing string is correct, the reviewed_ind should be set to ''Y''. |

---

## Table: SVC_FREIGHT_TERMS

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in SVC_FREIGHT_TERMS.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1 |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | ENABLED_FLAG |  |  |  | VARCHAR (1 ) | Indicates whether the freight terms are valid or invalid within the respective application. The values would be either (Y)es or (N)o. |
| 7 | END_DATE_ACTIVE |  |  |  | Date | Indicates the date for assigning an inactive date to the Freight Terms. |
| 8 | START_DATE_ACTIVE |  |  |  | Date | Indicates the date for assigning an active date to the Freight Terms. |
| 9 | FREIGHT_TERMS |  |  |  | VARCHAR (30 ) | Contains a number that uniquely identifies the freight terms. |
| 10 | CREATE_ID |  |  |  | VARCHAR (30 ) | This column holds the user id created the record. |
| 11 | CREATE_DATETIME |  |  |  | Date | This column holds the timestamp when the record is created. |
| 12 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | This column holds the user id Last Updated the record. |
| 13 | LAST_UPD_DATETIME |  |  |  | Date | This column holds the timestamp when the record is Last Updated. |
| 14 | TERM_DESC |  |  |  | VARCHAR (240 ) | Contains a description of the freight terms used in the system. Examples include a specified percent of total cost, free, or a specified percentage added to the invoice. |

---

## Table: SVC_FREIGHT_TERMS_TL

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in FREIGHT_TERMS_TL.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1 |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | REVIEWED_IND |  |  |  | VARCHAR (1 ) | Indicates if the description needs to be reviewed for translation. It is set to 'N' when the description in the original language is inserted or updated. We assume that clients will regularly run reports on all strings that are not reviewed (i.e. reviewed_ind = 'N'). When translation either provides a new string, or OKs that the existing string is correct, the reviewed_ind should be set to 'Y'. |
| 7 | ORIG_LANG_IND |  |  |  | VARCHAR (1 ) | Indicates if the description is in the original language entered for the freight terms code. It is set to 'Y' when the first record is written to the table for the freight terms code. |
| 8 | TERM_DESC |  |  |  | VARCHAR (240 ) | Contains a description of the freight terms used in the system. Examples include a specified percent of total cost, free, or a specified percentage added to the invoice. |
| 9 | LANG |  |  |  | NUMERIC (6) | Contains the number which uniquely identifies a language. |
| 10 | FREIGHT_TERMS |  |  |  | VARCHAR (30 ) | Contains a number that uniquely identifies the freight terms. |
| 11 | CREATE_ID |  |  |  | VARCHAR (30 ) | This column holds the user id created the record. |
| 12 | CREATE_DATETIME |  |  |  | Date | This column holds the timestamp when the record is created. |
| 13 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | This column holds the user id Last Updated the record. |
| 14 | LAST_UPD_DATETIME |  |  |  | Date | This column holds the timestamp when the record is Last Updated. |

---

## Table: SVC_FREIGHT_TYPE

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in FREIGHT_TYPE.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | FREIGHT_TYPE |  |  |  | VARCHAR (6 ) | Contains the unique key that identifies the freight type record. |
| 7 | FREIGHT_TYPE_DESC |  |  |  | VARCHAR (250 ) | Contains the description of the freight type. |
| 8 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 9 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 10 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 11 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_FREIGHT_TYPE_TL

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated to FREIGHT_TYPE_TL

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | LANG |  |  |  | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 7 | FREIGHT_TYPE |  |  |  | VARCHAR (6 ) | This field contains the unique identifier for the freight type record. |
| 8 | FREIGHT_TYPE_DESC |  |  |  | VARCHAR (250 ) | This field contains the description of the freight type in a given language. |
| 9 | ORIG_LANG_IND |  |  |  | VARCHAR (1 ) | Indicates if the description is in the original language entered for the inventory status type. It is set to ''Y'' when the first record is written to the table for the inventory status types. |
| 10 | REVIEWED_IND |  |  |  | VARCHAR (1 ) | Indicates if the description needs to be reviewed for translation. It is set to ''N'' when the description in the original language is inserted or updated. We assume that clients will regularly run reports on all strings that are not reviewed (i.e. reviewed_ind = ''N''). When translation either provides a new string, or OKs that the existing string is correct, the reviewed_ind should be set to ''Y''. |

---

## Table: SVC_FULFILORD

**Description:** This is an interface staging table that holds header level information related to a customer order fulfillment request from an external order management system (OMS) to RMS.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID |  |  | Y | NUMERIC (15) | Unique identifier for a set of rows that are staged for a customer order fulfillment create request. This is generated by a sequence. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (15) | This is used to divide data associated with the same process_id into multiple chunks to facilitate parallel processing. For the same process_id, chunk_id starts with 1 and increment by 1 for each new |
| 3 | PROCESS_STATUS |  |  | Y | VARCHAR (1) | Indicates the processing status of a customer order fulfillment request. Valid values are: 'N' (new), 'V' (validated), 'E' (error), 'I' (inactive), 'C' (completed). After validation, ORDCUST will be created in 'C' (order fully created) or 'P' (order partially created) status for staged records in 'V'alidated status; ORDCUST will be created in 'X' (order not created) status for staged records in 'I'nactive status. |
| 4 | ACTION_TYPE |  |  | Y | VARCHAR (10) | Indicates the action type of a customer order fulfillment request. Currently only 'create' request is supported. |
| 5 | TRAN_TYPE |  |  | Y | VARCHAR (1) | Indicates the transaction type of a customer order fulfillment request. Valid values are: 'T' (create transfer), 'P' (create PO), 'I' (reserve inventory). The value is derived from source_loc_type and fulfill_loc_type of the record. |
| 6 | FULFILORD_ID |  |  | Y | NUMERIC (15) | Unique identifier for a customer order fulfillment request. |
| 7 | CUSTOMER_ORDER_NO |  |  | Y | VARCHAR (48) | Holds the master customer order number from OMS. |
| 8 | FULFILL_ORDER_NO |  |  | Y | VARCHAR (48) | Unique number from OMS related to the fulfillment details. One or more fulfillment orders could relate back to a single customer order in OMS. |
| 9 | SOURCE_LOC_TYPE |  |  |  | VARCHAR (2) | Indicates the source location type. Valid values are: 'SU' for supplier, 'ST' for store, 'WH' for warehouse. This would only be populated for vendor, warehouse or multi-site fulfillment orders. |
| 10 | SOURCE_LOC_ID |  |  |  | NUMERIC (10) | Indicates the supplier, store or warehouse number associated with sourcing the customer order. Only populated for vendor, warehouse or multi-site fulfillment orders. |
| 11 | FULFILL_LOC_TYPE |  |  | Y | VARCHAR (1) | Indicates the fulfillment location type. Valid values are: 'S' (for physical store) or 'V' (for virtual store). |
| 12 | FULFILL_LOC_ID |  |  | Y | NUMERIC (10) | Indicates the store or warehouse number associated with fulfilling the customer order. For this release, this should always be populated with a virtual or physical store number. |
| 13 | PARTIAL_DELIVERY_IND |  |  | Y | VARCHAR (1) | Indicates if the order can be picked and shipped partially (Y) or if it should be shipped only when complete (N). It is not applicable to customer order fulfillment requests sourced from a vendor. Default value is N. |
| 14 | DELIVERY_TYPE |  |  |  | VARCHAR (1) | Indicates the fulfillment method - ship to customer or store pickup. Expected values are 'S' (ship direct) and 'C' (customer pickup). |
| 15 | CARRIER_CODE |  |  |  | VARCHAR (4) | Indicates the carrier the order is to be shipped with, if specified on the order. |
| 16 | CARRIER_SERVICE_CODE |  |  |  | VARCHAR (6) | Indicates the method that was selected for shipping by the customer placing the order (e.g. Standard Shipping, Overnight, etc.). |
| 17 | CONSUMER_DELIVERY_DATE |  |  |  | Date | Indicates the desired date the delivery is required by the customer. This will be the GMT time. It is used when consumer_delivery_time is not defined. |
| 18 | CONSUMER_DELIVERY_TIME |  |  |  | Date | Indicates the desired date and time the delivery is required by the customer. This will be the GMT time. |
| 19 | DELIVERY_CHARGES |  |  |  | NUMERIC (20,4) | Contains the delivery charges on drop ship. Mostly relevant for Brazil. |
| 20 | DELIVERY_CHARGES_CURR |  |  |  | VARCHAR (3) | Contains the currency of the delivery charges. |
| 21 | COMMENTS |  |  |  | VARCHAR (2000) | Any comments sent by OMS about the order. |
| 22 | ERROR_MSG |  |  |  | VARCHAR (2000) | Holds the validation errors of the record. If multiple validation errors are found on a record, the error messages are concatenated and separated by .;.. |
| 23 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 24 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 25 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 26 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|UK_SVC_FULFILORD|UK||||FULFILORD_ID|ASC|

### Constraints

|Type|Column / Constraint<br>Name|Details|
|---|---|---|
|Table Level|SVC_FULFILORD_CHK1|PROCESS_STATUS IN ('N','V','E','I','C')<br>|
||SVC_FULFILORD_CHK2|ACTION_TYPE IN ('create')<br>|
||SVC_FULFILORD_CHK3|TRAN_TYPE IN ('T','P','I')<br>|
|Column Level|PROCESS_STATUS||
||ACTION_TYPE||
||TRAN_TYPE||

---

## Table: SVC_FULFILORDCUST

**Description:** This is an interface staging table that holds customer information related to a customer order fulfillment request from an external order management system (OMS) to RMS.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID |  |  | Y | NUMERIC (15) | Unique identifier for a group of records to be processed together. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (15) | This is used to divide data associated with the same process_id into multiple chunks to facilitate parallel processing. For the same process_id, chunk_id starts with 1 and increment by 1 for each new chunk. |
| 3 | FULFILORD_ID |  | F | Y | NUMERIC (15) | Unique identifier for a customer order fulfillment request. It serves as a reference to the parent record. |
| 4 | CUSTOMER_NO |  |  |  | VARCHAR (14) | Indicates the number that uniquely identifies the customer in OMS. |
| 5 | DELIVER_FIRST_NAME |  |  |  | VARCHAR (120) | Contains the first name for the delivery address on the order. |
| 6 | DELIVER_PHONETIC_FIRST |  |  |  | VARCHAR (120) | Contains the phonetic first name for the delivery address on the order. |
| 7 | DELIVER_LAST_NAME |  |  |  | VARCHAR (120) | Contains the last name for the delivery address on the order. |
| 8 | DELIVER_PHONETIC_LAST |  |  |  | VARCHAR (120) | Contains the phonetic last name for the delivery address on the order. |
| 9 | DELIVER_PREFERRED_NAME |  |  |  | VARCHAR (120) | Contains the preferred name for the delivery address on the order. |
| 10 | DELIVER_COMPANY_NAME |  |  |  | VARCHAR (120) | Contains the company name for the delivery address on the order. |
| 11 | DELIVER_ADD1 |  |  |  | VARCHAR (240) | First line of the delivery address for the customer. |
| 12 | DELIVER_ADD2 |  |  |  | VARCHAR (240) | Second line of the delivery address for the customer. |
| 13 | DELIVER_ADD3 |  |  |  | VARCHAR (240) | Third line of the delivery address for the customer. |
| 14 | DELIVER_COUNTY |  |  |  | VARCHAR (250) | County portion of the delivery address. |
| 15 | DELIVER_CITY |  |  |  | VARCHAR (120) | City portion of the delivery address. |
| 16 | DELIVER_STATE |  |  |  | VARCHAR (3) | State portion of the delivery address. |
| 17 | DELIVER_COUNTRY_ID |  |  |  | VARCHAR (3) | Country portion of the delivery address. |
| 18 | DELIVER_POST |  |  |  | VARCHAR (30) | Postal code portion of the delivery address. |
| 19 | DELIVER_JURISDICTION |  |  |  | VARCHAR (10) | Identifies the jurisdiction code for the delivery country-state relationship. |
| 20 | DELIVER_PHONE |  |  |  | VARCHAR (20) | Contains the delivery phone number. |
| 21 | BILL_FIRST_NAME |  |  |  | VARCHAR (120) | Contains the first name for the billing address on the order. |
| 22 | BILL_PHONETIC_FIRST |  |  |  | VARCHAR (120) | Contains the phonetic first name for the billing address on the order. |
| 23 | BILL_LAST_NAME |  |  |  | VARCHAR (120) | Contains the last name for the billing address on the order. |
| 24 | BILL_PHONETIC_LAST |  |  |  | VARCHAR (120) | Contains the phonetic last name for the billing address on the order. |
| 25 | BILL_PREFERRED_NAME |  |  |  | VARCHAR (120) | Contains the preferred name for the billing address on the order. |
| 26 | BILL_COMPANY_NAME |  |  |  | VARCHAR (120) | Contains the company name for the billing address on the order. |
| 27 | BILL_ADD1 |  |  |  | VARCHAR (240) | First line of the billing address for the customer. |
| 28 | BILL_ADD2 |  |  |  | VARCHAR (240) | Second line of the billing address for the customer. |
| 29 | BILL_ADD3 |  |  |  | VARCHAR (240) | Third line of the billing address for the customer. |
| 30 | BILL_COUNTY |  |  |  | VARCHAR (250) | County portion of the billing address. |
| 31 | BILL_CITY |  |  |  | VARCHAR (120) | City portion of the billing address. |
| 32 | BILL_STATE |  |  |  | VARCHAR (3) | State portion of the billing address. |
| 33 | BILL_COUNTRY_ID |  |  |  | VARCHAR (3) | Country portion of the billing address. |
| 34 | BILL_POST |  |  |  | VARCHAR (30) | Postal code portion of the billing address. |
| 35 | BILL_JURISDICTION |  |  |  | VARCHAR (10) | Identifies the jurisdiction code for the billing country-state relationship. |
| 36 | BILL_PHONE |  |  |  | VARCHAR (20) | Contains the billing phone number. |
| 37 | ERROR_MSG |  |  |  | VARCHAR (2000) | Holds the validation errors of the record. If multiple validation errors are found on a record, the error messages are concatenated and separated by .;.. |
| 38 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 39 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 40 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 41 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that user that last updated the record. |
| 42 | DELIVER_EMAIL |  |  |  | VARCHAR (120 ) | Contains the delivery email address. |
| 43 | BILL_EMAIL |  |  |  | VARCHAR (120 ) | Contains the billing email address. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|SVC_FULFILORDCUST_I1|||||FULFILORD_ID|ASC|

---

## Table: SVC_FULFILORDDTL

**Description:** This is an interface staging table that holds item level information related to a customer order fulfillment request from an external order management system (OMS) to RMS.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID |  |  | Y | NUMERIC (15) | Unique identifier for a group of records to be processed together. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (15) | This is used to divide data associated with the same process_id into multiple chunks to facilitate parallel processing. For the same process_id, chunk_id starts with 1 and increment by 1 for each new chunk. |
| 3 | FULFILORD_ID |  | F | Y | NUMERIC (15) | Unique identifier for a customer order fulfillment request. It serves as a reference to the parent record. |
| 4 | ITEM_STATUS |  |  |  | VARCHAR (1) | This helper column would indicate if the item is valid to be added to the order or not. It is set to 'I' (inactive) when the item on the customer order cannot be sourced from the vendor. |
| 5 | ITEM |  |  | Y | VARCHAR (25) | Indicates the item ordered by the customer. |
| 6 | REF_ITEM |  |  |  | VARCHAR (25) | Indicates the reference item ordered by the customer. Used only if a specific UPC is ordered. This is supported for vendor drop-ships orders only as we don't support transfer requests for a specific reference item. |
| 7 | ORDER_QTY_SUOM |  |  | Y | NUMERIC (12,4) | Indicates the quantity of the item ordered by the customer in item's standard unit of measure. |
| 8 | STANDARD_UOM |  |  | Y | VARCHAR (4) | Indicates item's standard unit of measure. |
| 9 | TRANSACTION_UOM |  |  | Y | VARCHAR (4) | Indicates the original transaction unit of measure the order is placed in. |
| 10 | SUBSTITUTE_IND |  |  | Y | VARCHAR (1) | Indicates if substitutes are allowed on a customer order. Valid values are 'Y' (yes) or 'N' (no). This will only be used by orders passed to SIM. |
| 11 | UNIT_RETAIL |  |  |  | NUMERIC (20,4) | Indicates the unit retail of item on the customer order and is maintained in standard UOM. |
| 12 | RETAIL_CURR |  |  |  | VARCHAR (3) | Indicates the currency of the unit retail. |
| 13 | COMMENTS |  |  |  | VARCHAR (2000) | Used to indicate any special instructions for the item, such as services (monograms, engrave, etc). |
| 14 | AVAILABLE_QTY |  |  |  | NUMERIC (12,4) | Used to store available quantity in item's standard UOM at item/source location. This field is not expected to be part of the input message. It is computed and stored to facilitate bulk processing. |
| 15 | ERROR_MSG |  |  |  | VARCHAR (2000) | Holds the validation errors of the record. If multiple validation errors are found on a record, the error messages are concatenated and separated by .;.. |
| 16 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 17 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 18 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 19 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|SVC_FULFILORDDTL_I1|||||FULFILORD_ID|ASC|

---

## Table: SVC_FULFILORDDTLREF

**Description:** This is an interface staging table that holds item level information related to a customer order fulfillment cancellation request from an external order management system (OMS) to RMS.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID |  |  | Y | NUMERIC (15) | Unique identifier for a group of records to be processed together. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (15) | This is used to divide data associated with the same process_id into multiple chunks to facilitate parallel processing. For the same process_id, chunk_id starts with 1 and increment by 1 for each new chunk. |
| 3 | FULFILORDREF_ID |  | F | Y | NUMERIC (15) | Unique identifier for a customer order fulfillment cancellation request. It serves as a reference to the parent record. |
| 4 | ITEM |  |  | Y | VARCHAR (25) | Indicates the item ordered by the customer. |
| 5 | REF_ITEM |  |  |  | VARCHAR (25) | Indicates the reference item ordered by the customer. Used only if a specific UPC is ordered. This is supported for vendor drop-ships orders only as we don't support transfer requests for a specific reference item. |
| 6 | CANCEL_QTY_SUOM |  |  | Y | NUMERIC (12,4) | Indicates the quantity that should be cancelled from the order in item's standard unit of measure. |
| 7 | STANDARD_UOM |  |  | Y | VARCHAR (4) | Indicates item's standard unit of measure. |
| 8 | TRANSACTION_UOM |  |  | Y | VARCHAR (4) | Indicates the original transaction unit of measure the order is placed in. |
| 9 | ERROR_MSG |  |  |  | VARCHAR (2000) | Holds the validation errors of the record. If multiple validation errors are found on a record, the error messages are concatenated and separated |
| 10 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 11 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 12 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 13 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|SVC_FULFILORDDTLREF_I1|||||FULFILORDREF_ID|ASC|

---

## Table: SVC_FULFILORDDTL_COMP_ITEM

**Description:** This is an interface staging helper table that holds component item level information related to a customer order fulfillment request from an external order management system (OMS) to RMS. It is populated by internal processing for a fulfillment request containing pack items sourced from a store.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID |  |  | Y | NUMERIC (15) | Unique identifier for a group of records to be processed together. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (15) | This is used to divide data associated with the same process_id into multiple chunks to facilitate parallel processing. |
| 3 | FULFILORD_ID |  |  | Y | NUMERIC (15) | Unique identifier for a customer order fulfillment request. It serves as a reference to the parent record. |
| 4 | ITEM |  |  | Y | VARCHAR (25) | Indicates the pack item (sourced from store) ordered by the customer. |
| 5 | COMPONENT_ITEM |  |  | Y | VARCHAR (25) | Indicates the component item of a pack item ordered by the customer. |
| 6 | COMPONENT_QTY |  |  | Y | NUMERIC (12,4) | Indicates the quantity of the component item in the pack. |
| 7 | AVAILABLE_QTY |  |  |  | NUMERIC (12,4) | Used to store available quantity in component item''s standard UOM at the store. This field is not expected to be part of the input message. It is computed and stored to facilitate bulk processing. |

---

## Table: SVC_FULFILORDREF

**Description:** This is an interface staging table that holds header level information related to a customer order fulfillment cancellation request from an external order management system (OMS) to RMS.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID |  |  | Y | NUMERIC (15) | Unique identifier for a set of rows that are staged for a customer order fulfillment cancellation request. This is generated by a sequence. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (15) | This is used to divide data associated with the same process_id into multiple chunks to facilitate parallel processing. For the same process_id, chunk_id starts with 1 and increment by 1 for each new chunk. |
| 3 | PROCESS_STATUS |  |  | Y | VARCHAR (1) | Indicates the processing status of a customer order fulfillment cancellation request. Valid values are: 'N' (new), 'V' (validated), 'E' (error), 'C' (completed). |
| 4 | ACTION_TYPE |  |  | Y | VARCHAR (10) | Indicates the action type of a customer order fulfillment request. Currently only 'cancel' request is supported. |
| 5 | TRAN_TYPE |  |  | Y | VARCHAR (1) | Indicates the transaction type of a customer order fulfillment cancellation request. Valid values are: 'T' (transfer), 'P' (PO), 'I' (reverse inventory). The value is derived from source_loc_type and fulfill_loc_type of the record. |
| 6 | FULFILORDREF_ID |  |  | Y | NUMERIC (15) | Unique identifier for a customer order fulfillment cancellation request. |
| 7 | CUSTOMER_ORDER_NO |  |  | Y | VARCHAR (48) | Holds the master customer order number from OMS. |
| 8 | FULFILL_ORDER_NO |  |  | Y | VARCHAR (48) | Unique number from OMS related to the fulfillment details. One or more fulfillment orders could relate back to a single customer order in OMS. |
| 9 | SOURCE_LOC_TYPE |  |  |  | VARCHAR (2) | Indicates the source location type. Valid values are: 'SU' for supplier, 'ST' for store, 'WH' for warehouse. This would only be populated for cancellation of vendor, warehouse or multi-site fulfillment orders. |
| 10 | SOURCE_LOC_ID |  |  |  | NUMERIC (10) | Indicates the supplier, store or warehouse number associated with sourcing the customer order. Only populated for cancellation of vendor, warehouse or multi-site fulfillment orders. |
| 11 | FULFILL_LOC_TYPE |  |  | Y | VARCHAR (1) | Indicates the fulfillment location type. Valid values are: 'S' (for physical store) or 'V' (for virtual store). |
| 12 | FULFILL_LOC_ID |  |  | Y | NUMERIC (10) | Indicates the store or warehouse number associated with fulfilling the customer order. For this release, this should always be populated with a virtual or physical store number. |
| 13 | ERROR_MSG |  |  |  | VARCHAR (2000) | Holds the validation errors of the record. If multiple validation errors are found on a record, the error messages are concatenated and separated by .;.. |
| 14 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 15 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 16 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 17 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|UK_SVC_FULFILORDREF|UK||||FULFILORDREF_ID|ASC|

### Constraints

|Type|Column / Constraint<br>Name|Details|
|---|---|---|
|Table Level|SVC_FULFILORDREF_CHK1|PROCESS_STATUS IN ('N','V','E','I','C')<br>|
||SVC_FULFILORDREF_CHK2|ACTION_TYPE IN ('cancel')<br>|
||SVC_FULFILORDREF_CHK3|TRAN_TYPE IN ('T','P','I')<br>|
|Column Level|PROCESS_STATUS||
||ACTION_TYPE||
||TRAN_TYPE||

---

## Table: SVC_HALF

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in HALF.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | HALF_DATE |  |  |  | VARCHAR (120) | This field contains the description of the month span for the half. For example: Aug 2012 to Jan 2013. |
| 7 | HALF_NAME |  |  |  | VARCHAR (120) | This field contains the season name and year for the half. For example: Summer 2013. |
| 8 | HALF_NO |  |  |  | NUMERIC (5) | This field contains the year and the half number (1 or 2) for each half. For example: 20131 or 20132. |
| 9 | CREATE_ID |  |  |  | VARCHAR (30) | User who created the record. |
| 10 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 11 | LAST_UPD_ID |  |  |  | VARCHAR (30) | User who last updated the record. |
| 12 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_HALF_DATA_BUDGET

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in HALF_DATA_BUDGET.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | DEPT |  |  |  | NUMERIC (4) | This field contains the unique identifier for the department for which the budget information for the half is being stored. |
| 7 | HALF_NO |  |  |  | NUMERIC (5) | This field contains the half number for which the budget information is being stored. |
| 8 | LOC_TYPE |  |  |  | VARCHAR (1 ) | This field contains Location Type.Valid Values are : S = Store, W = Warehouse or Internal Finisher, E = External Finisher |
| 9 | LOCATION |  |  |  | NUMERIC (10) | This field contains the unique identifier for the location for which the half budget data is stored. The location will be a Store if Loc_type = S, the Warehouse or Internal Finisher if Loc_type = W, the External Finisher if Loc_type = E. |
| 10 | SET_OF_BOOKS_ID |  |  |  | NUMERIC (15) | This field contains unique identifier for Set Of Books with which the location is attached. |
| 11 | CUM_MARKON_PCT |  |  |  | NUMERIC (12,4) | This field contains the budget value for the half for cumulative markon percent. This value is used in the retail method of accounting only. |
| 12 | SHRINKAGE_PCT |  |  |  | NUMERIC (12,4) | This field contains budget for the half for shrinkage amount as a percent of sales for the subclass/location. This field is used in the calculation of the shrinkage amount if budgeted shrink indicator option is selected as Y. |
| 13 | MARKDOWN_PCT |  |  |  | NUMERIC (12,4) | This field contains the budget for the half for markdowns as a percent of sales for the subclass/location. |
| 14 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 15 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 16 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 17 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_HALF_TL

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in HALF_TL.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | HALF_NAME |  |  |  | VARCHAR (120) | This field contains the season name and year for the half. For example: Summer 2013. |
| 7 | HALF_NO |  |  |  | NUMERIC (5) | This field contains the year and the half number (1 or 2) for each half. For example: 20131 or 20132. |
| 8 | LANG |  |  |  | NUMERIC (6) | Contains the number which uniquely identifies a language. |
| 9 | CREATE_ID |  |  |  | VARCHAR (30) | User who created the record. |
| 10 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 11 | LAST_UPD_ID |  |  |  | VARCHAR (30) | User who last updated the record. |
| 12 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_HTS

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in HTS.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | HTS |  |  |  | VARCHAR (25 ) | Contains the unique HTS item classification number. This number is standard for the importing country. |
| 7 | IMPORT_COUNTRY_ID |  |  |  | VARCHAR (3 ) | Contains the country id of the importing country. |
| 8 | EFFECT_FROM |  |  |  | Date | Denotes the beginning of the time period that the HTS classification is valid. |
| 9 | EFFECT_TO |  |  |  | Date | Denotes the end of the time period that the HTS classification is valid. |
| 10 | HTS_DESC |  |  |  | VARCHAR (2000 ) | The HTS description of the item classification. |
| 11 | UNITS |  |  |  | NUMERIC (2) | Contains the number of units, defined by the Units_1, Units_2 and Units_3 column, by which customs wants to view the goods. This number will more than likely be 1. |
| 12 | UNITS_1 |  |  |  | VARCHAR (4 ) | Contains the first unit of measure that the importing countrys customs agency needs to see the goods in. |
| 13 | UNITS_2 |  |  |  | VARCHAR (4 ) | Contains the second unit of measure that the importing countrys customs agency needs to see the goods in. |
| 14 | UNITS_3 |  |  |  | VARCHAR (4 ) | Contains the third unit of measure that the importing countrys customs agency needs to see the goods in. |
| 15 | DUTY_COMP_CODE |  |  |  | VARCHAR (1 ) | Contains the duty computation code number which is the formula for calculating duty. |
| 16 | MORE_HTS_IND |  |  |  | VARCHAR (1 ) | This column indicates if another HTS is required to completely classify the entire object. |
| 17 | QUOTA_CAT |  |  |  | VARCHAR (6 ) | This column contains the quota category for this HTS classification. |
| 18 | QUOTA_IND |  |  |  | VARCHAR (1 ) | Indicates whether there is a quota imposed on the HTS classification. |
| 19 | AD_IND |  |  |  | VARCHAR (1 ) | Indicates whether the HTS is likely to be subject to Anti-dumping duties. |
| 20 | CVD_IND |  |  |  | VARCHAR (1 ) | Indicates whether the HTS is likely to be subject to Countervailing duties. |
| 21 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 22 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 23 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 24 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_HTS_AD

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in HTS_AD.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | HTS |  |  |  | VARCHAR (25 ) | Contains the unique HTS item classification number. This number is standard for the importing country. |
| 7 | IMPORT_COUNTRY_ID |  |  |  | VARCHAR (3 ) | Contains the country id of the importing country. |
| 8 | EFFECT_FROM |  |  |  | Date | Denotes the beginning of the time period that the HTS classification is valid. |
| 9 | EFFECT_TO |  |  |  | Date | Denotes the end of the time period that the HTS classification is valid. |
| 10 | MFG_ID |  |  |  | VARCHAR (18 ) | Contains the manufacturers identification number. Anti-Dumping cases are manufacturer specific and are not imposed at just the country level. |
| 11 | ORIGIN_COUNTRY_ID |  |  |  | VARCHAR (3 ) | Origin_country_id |
| 12 | CASE_NO |  |  |  | VARCHAR (10 ) | Contains the case number assigned to the AD by a customs agency. |
| 13 | SHIPPER_ID |  |  |  | VARCHAR (18 ) | Contains the shipper identification for the situation in which a AD rate is applied only to specific shippers, when the shipper is different from the manufacturer for the entry. |
| 14 | SUPPLIER |  |  |  | NUMERIC (10) | Contains the supplier identification number of the items. |
| 15 | RATE |  |  |  | NUMERIC (12,8) | Contains the rate of duty to be added upon the base rate of the item. |
| 16 | RELATED_CASE_NO |  |  |  | VARCHAR (10 ) | Contains a related case identification of the AD instance. |
| 17 | EFFECTIVE_ENTRY_DATE |  |  |  | Date | Contains the effective entry date which is used to establish the start date on which the AD becomes effective for that particular case number. |
| 18 | EFFECTIVE_EXPORT_DATE |  |  |  | Date | Contains the effective export date which is used to establish the start date on which the AD becomes effective for that particular case number. |
| 19 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 20 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 21 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 22 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_HTS_CHAPTER

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in HTS_CHAPTER.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | CHAPTER |  |  |  | VARCHAR (4 ) | Contains the unique HTS Chapter number. The unique number is defined by the HTS schedule for all GATT signatories. |
| 7 | CHAPTER_DESC |  |  |  | VARCHAR (2000 ) | Contains the description of the HTS Chapter. |
| 8 | IMPORT_COUNTRY_ID |  |  |  | VARCHAR (3 ) | This Column holds the import country. |
| 9 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 10 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 11 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 12 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_HTS_CHAPTER_RESTRAINTS

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in HTS_CHAPTER_RESTRAINTS.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | CHAPTER |  |  |  | VARCHAR (4 ) | Contains the unique HTS Chapter number. The unique chapter is defined by the HTS schedule for all GATT signatories. |
| 7 | IMPORT_COUNTRY_ID |  |  |  | VARCHAR (3 ) | Contains the country id of the importing country. |
| 8 | ORIGIN_COUNTRY_ID |  |  |  | VARCHAR (3 ) | Contains the country id of the country of origin. |
| 9 | RESTRAINT_TYPE |  |  |  | VARCHAR (6 ) | Contains the type of restraint imposed on certain items. |
| 10 | RESTRAINT_TYPE_UPD |  |  |  | VARCHAR (6 ) | This field is used to update the RESTRAINT_TYPE column. |
| 11 | RESTRAINT_DESC |  |  |  | VARCHAR (120 ) | Contains the description of the chapter restraint. |
| 12 | RESTRAINT_QTY |  |  |  | NUMERIC (12,4) | Contains the amount of goods that may be brought into the importing country before the quota category is filled. |
| 13 | UOM |  |  |  | VARCHAR (4 ) | Contains the unit of measure of the value stored in the quantity column. |
| 14 | CLOSING_DATE |  |  |  | Date | Contains the date when the quota is reset. |
| 15 | QUOTA_CAT |  |  |  | VARCHAR (6 ) | Contains the quota category to which the HTS chapter belongs. |
| 16 | RESTRAINT_SUFFIX |  |  |  | VARCHAR (6 ) | Contains the suffix of the restraint. |
| 17 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 18 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 19 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 20 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_HTS_CHAPTER_RESTRAINTS_TL

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in HTS_CHAPTER_RESTRAINTS_TL.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | LANG |  |  |  | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 7 | CHAPTER |  |  |  | VARCHAR (4) | Contains the unique HTS Chapter number. The unique chapter is defined by the HTS schedule for all GATT signatories. |
| 8 | IMPORT_COUNTRY_ID |  |  |  | VARCHAR (3) | Contains the country id of the importing country. |
| 9 | ORIGIN_COUNTRY_ID |  |  |  | VARCHAR (3) | Contains the country id of the country of origin. |
| 10 | RESTRAINT_TYPE |  |  |  | VARCHAR (6) | Contains the type of restraint imposed on certain items. |
| 11 | RESTRAINT_DESC |  |  |  | VARCHAR (120) | Contains the description of the chapter restraint. |

---

## Table: SVC_HTS_CHAPTER_TL

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in HTS_CHAPTER_TL.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | LANG |  |  |  | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 7 | CHAPTER |  |  |  | VARCHAR (4) | Contains the unique HTS Chapter number. The unique number is defined by the HTS schedule for all GATT signatories. |
| 8 | IMPORT_COUNTRY_ID |  |  |  | VARCHAR (3) | This Column holds the import country |
| 9 | CHAPTER_DESC |  |  |  | VARCHAR (2000) | Contains the description of the HTS Chapter. |

---

## Table: SVC_HTS_CVD

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in HTS_CVD.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | HTS |  |  |  | VARCHAR (25 ) | Contains the unique HTS item classification number. This number is standard for the importing country. |
| 7 | IMPORT_COUNTRY_ID |  |  |  | VARCHAR (3 ) | Contains the country id of the importing country. |
| 8 | EFFECT_FROM |  |  |  | Date | Denotes the beginning of the time period that the HTS classification is valid. |
| 9 | EFFECT_TO |  |  |  | Date | Denote the end of the time period that the HTS classification is valid. |
| 10 | ORIGIN_COUNTRY_ID |  |  |  | VARCHAR (3 ) | Contains the country id of the country where the product was produced. |
| 11 | CASE_NO |  |  |  | VARCHAR (10 ) | Contains the case number assigned to the CVD by a customs agency. |
| 12 | MFG_ID |  |  |  | VARCHAR (18 ) | Contains the manufacturers tax identification number. |
| 13 | SHIPPER_ID |  |  |  | VARCHAR (18 ) | Contains the shipper identification for the situation in which a CVD rate is applied only to specified shippers, when the shipper is different from the manufacturer for the entry. |
| 14 | SUPPLIER |  |  |  | NUMERIC (10) | Contains the supplier identification of the supplier of the items. |
| 15 | RATE |  |  |  | NUMERIC (12,8) | Contains the rate of duty to be added upon the base rate of the item. |
| 16 | RELATED_CASE_NO |  |  |  | VARCHAR (10 ) | Contains a related case identification of the CVD instance. |
| 17 | EFFECTIVE_ENTRY_DATE |  |  |  | Date | Contains the effective entry date which is used to establish the start date on which the CVD becomes effective for that particular case number. |
| 18 | EFFECTIVE_EXPORT_DATE |  |  |  | Date | Contains the effective export date which is used to establish the start date on which the CVD becomes effective for that particular case number. |
| 19 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 20 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 21 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 22 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_HTS_FEE

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in HTS_FEE.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | HTS |  |  |  | VARCHAR (25 ) | This field contains the unique HTS item classification number. This number is standard for the importing country. |
| 7 | IMPORT_COUNTRY_ID |  |  |  | VARCHAR (3 ) | This field contains the country id of the importing country. |
| 8 | EFFECT_FROM |  |  |  | Date | This field denotes the beginning of the time period that the HTS classification is valid. |
| 9 | EFFECT_TO |  |  |  | Date | This field denotes the end of the time period that the HTS classification is valid. |
| 10 | FEE_TYPE |  |  |  | VARCHAR (3 ) | This field contains a customs defined fee code. |
| 11 | FEE_COMP_CODE |  |  |  | VARCHAR (1 ) | This column contains code of the formula for calculating the exact fee on an HTS classification. This formula may call for a tax_specific_rate, tax_av_rate or a combination of the two. |
| 12 | FEE_SPECIFIC_RATE |  |  |  | NUMERIC (12,8) | This column contains the rate of a fee for a specific unit of measure of the item. |
| 13 | FEE_AV_RATE |  |  |  | NUMERIC (12,8) | This field contains the rate of the fee for the ad valorem measure of the item. |
| 14 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 15 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 16 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 17 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_HTS_FEE_ZONE

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in HTS_FEE_ZONE.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | HTS |  |  |  | VARCHAR (25 ) | Contains the unique HTS item classification number. This number is standard for the importing country. |
| 7 | IMPORT_COUNTRY_ID |  |  |  | VARCHAR (3 ) | This field contains the country id of the importing country. |
| 8 | EFFECT_FROM |  |  |  | Date | Denotes the beginning of the time period that the HTS classification is valid. |
| 9 | EFFECT_TO |  |  |  | Date | Denotes the end of the time period that the HTS classification is valid. |
| 10 | FEE_TYPE |  |  |  | VARCHAR (3 ) | This field contains a customs defined fee code. |
| 11 | CLEARING_ZONE_ID |  |  |  | VARCHAR (5 ) | This field contains the clearing zone id. |
| 12 | FEE_SPECIFIC_RATE |  |  |  | NUMERIC (12,8) | This column contains the rate of a fee for a specific unit of measure of the item. |
| 13 | FEE_AV_RATE |  |  |  | NUMERIC (12,8) | This field contains the rate of the fee for the ad valorem measure of the item. |
| 14 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 15 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 16 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 17 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_HTS_IMPORT_COUNTRY_SETUP

**Description:** This is a staging table used for Admin API spreadsheet upload process. It is used to temporarily hold data before it is uploaded/updated in HTS_IMPORT_COUNTRY_SETUP.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | IMPORT_COUNTRY_ID |  |  |  | VARCHAR (3 ) | Holds the import country. |
| 7 | HTS_FORMAT_MASK |  |  |  | VARCHAR (50 ) | Holds the format mask of HTS for the import country. The value should start with FM and the separator should be in double quotes, Example: FMXXXX"."XX"."XXXX |
| 8 | HTS_HEADING_LENGTH |  |  |  | NUMERIC (2) | Holds the number of characters that forms the chapter in the HTS. |
| 9 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 10 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 11 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 12 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_HTS_OGA

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in HTS_OGA.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | HTS |  |  |  | VARCHAR (25 ) | Contains the unique HTS classification number. This number is standard for the importing country. |
| 7 | IMPORT_COUNTRY_ID |  |  |  | VARCHAR (3 ) | Contains the country id of the importing country. |
| 8 | EFFECT_FROM |  |  |  | Date | Denotes the beginning of the time period that the HTS classification is valid. |
| 9 | EFFECT_TO |  |  |  | Date | Denotes the end of the time period that the HTS classification is valid. |
| 10 | OGA_CODE |  |  |  | VARCHAR (3 ) | Contains the code for the government agency that has jurisdiction along Customs over the HTS classification. |
| 11 | REFERENCE_ID |  |  |  | VARCHAR (30 ) | Contains a user-defined reference to the Other Government_Agency. |
| 12 | COMMENTS |  |  |  | VARCHAR (2000 ) | Contains users comments. |
| 13 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 14 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 15 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 16 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_HTS_REF

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in HTS_REFERENCE.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | HTS |  |  |  | VARCHAR (25 ) | Contains the unique HTS item classification number. This number is standard for the importing country. |
| 7 | IMPORT_COUNTRY_ID |  |  |  | VARCHAR (3 ) | This field contains the country id of the importing country. |
| 8 | EFFECT_FROM |  |  |  | Date | Denotes the beginning of the time period that the HTS classification is valid. |
| 9 | EFFECT_TO |  |  |  | Date | Denotes the end of the time period that the HTS classification is valid. |
| 10 | REFERENCE_ID |  |  |  | VARCHAR (30 ) | This field contains the user-defined identification code, which will uniquely identify a reference. |
| 11 | REFERENCE_DESC |  |  |  | VARCHAR (2000 ) | This field contains the description of the reference identification code. |
| 12 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 13 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 14 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 15 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_HTS_TARIFF_TREATMENT

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in HTS_TARIFF_TREATMENT.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | HTS |  |  |  | VARCHAR (25 ) | Contains the unique HTS item classification number. This number is standard for the importing country. |
| 7 | IMPORT_COUNTRY_ID |  |  |  | VARCHAR (3 ) | Contains the country id of the importing country. |
| 8 | EFFECT_FROM |  |  |  | Date | Denotes the beginning of the time period that the HTS classification is valid. |
| 9 | EFFECT_TO |  |  |  | Date | Denotes the end of the time period that the HTS classification is valid. |
| 10 | TARIFF_TREATMENT |  |  |  | VARCHAR (10 ) | Contains the country id of the importing country. |
| 11 | SPECIFIC_RATE |  |  |  | NUMERIC (12,8) | Contains the tariff rate based on a specific unit of measure. |
| 12 | AV_RATE |  |  |  | NUMERIC (12,8) | Contains the tariff rate based on the amount of the product being imported. |
| 13 | OTHER_RATE |  |  |  | NUMERIC (12,8) | Contains any tariff rate that cannot be held by the specific_rate and av_rate columns. This field is usually used for products that are produced in Communist countries. |
| 14 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 15 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 16 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 17 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_HTS_TARIFF_TREATMENT_ZONE

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in HTS_TARIFF_TREATMENT_ZONE.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | HTS |  |  |  | VARCHAR (25 ) | Contains the unique HTS item classification number. This number is standard for the importing country. |
| 7 | IMPORT_COUNTRY_ID |  |  |  | VARCHAR (3 ) | This field contains the country id of the importing country. |
| 8 | EFFECT_FROM |  |  |  | Date | Denotes the beginning of the time period that the HTS classification is valid. |
| 9 | EFFECT_TO |  |  |  | Date | Denotes the end of the time period that the HTS classification is valid. |
| 10 | TARIFF_TREATMENT |  |  |  | VARCHAR (10 ) | Contains the tariff treatment identification that applies to the HTS classification.. |
| 11 | CLEARING_ZONE_ID |  |  |  | VARCHAR (5 ) | This field contains the clearing zone id. |
| 12 | SPECIFIC_RATE |  |  |  | NUMERIC (12,8) | Contains the tariff rate based on a specific unit of measure. |
| 13 | AV_RATE |  |  |  | NUMERIC (12,8) | Contains the tariff rate based on the amount of the product being imported. |
| 14 | OTHER_RATE |  |  |  | NUMERIC (12,8) | Contains any tariff rate that cannot be held by the specific_rate and av_rate columns. This field is usually used for products that are produced in Communist countries. |
| 15 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 16 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 17 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 18 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_HTS_TAX

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in HTS_TAX.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | HTS |  |  |  | VARCHAR (25 ) | Contains the unique HTS item classification number. This number is standard for the importing country. |
| 7 | IMPORT_COUNTRY_ID |  |  |  | VARCHAR (3 ) | This field contains the country id of the importing country. |
| 8 | EFFECT_FROM |  |  |  | Date | Denotes the beginning of the time period that the HTS classification is valid. |
| 9 | EFFECT_TO |  |  |  | Date | Denotes the end of the time period that the HTS classification is valid. |
| 10 | TAX_TYPE |  |  |  | VARCHAR (3 ) | This field contains a customs defined tax code. |
| 11 | TAX_COMP_CODE |  |  |  | VARCHAR (1 ) | This column contains code of the formula for calculating the exact tax on an HTS classification. |
| 12 | TAX_SPECIFIC_RATE |  |  |  | NUMERIC (12,8) | This column contains the rate of tax for a specific unit of measure of the item. |
| 13 | TAX_AV_RATE |  |  |  | NUMERIC (12,8) | This column contains the rate of tax for the ad valorem measure of the item. |
| 14 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 15 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 16 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 17 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_HTS_TAX_ZONE

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in HTS_TAX_ZONE.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | HTS |  |  |  | VARCHAR (25 ) | Contains the unique HTS item classification number. This number is standard for the importing country. |
| 7 | IMPORT_COUNTRY_ID |  |  |  | VARCHAR (3 ) | This field contains the country id of the importing country. |
| 8 | EFFECT_FROM |  |  |  | Date | Denotes the beginning of the time period that the HTS classification is valid. |
| 9 | EFFECT_TO |  |  |  | Date | Denotes the end of the time period that the HTS classification is valid. |
| 10 | TAX_TYPE |  |  |  | VARCHAR (3 ) | This field contains a customs defined tax code. |
| 11 | CLEARING_ZONE_ID |  |  |  | VARCHAR (5 ) | This field contains the clearing zone id. |
| 12 | TAX_SPECIFIC_RATE |  |  |  | NUMERIC (12,8) | This column contains the rate of tax for a specific unit of measure of the item. |
| 13 | TAX_AV_RATE |  |  |  | NUMERIC (12,8) | This column contains the rate of tax for the ad valorem measure of the item. |
| 14 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 15 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 16 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 17 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_HTS_TL

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in HTS_TL.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | LANG |  |  |  | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 7 | HTS |  |  |  | VARCHAR (25) | Contains the unique HTS item classification number. This number is standard for the importing country. |
| 8 | IMPORT_COUNTRY_ID |  |  |  | VARCHAR (3) | Contains the country id of the importing country. |
| 9 | EFFECT_FROM |  |  |  | Date | Denotes the beginning of the time period that the HTS classification is valid. |
| 10 | EFFECT_TO |  |  |  | Date | Denotes the end of the time period that the HTS classification is valid. |
| 11 | HTS_DESC |  |  |  | VARCHAR (2000) | The HTS description of the item classification. |

---

## Table: SVC_HTS_TT_EXCLUSIONS

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in HTS_TT_EXCLUSIONS.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | HTS |  |  |  | VARCHAR (25 ) | Contains the unique HTS item classification number. This number is standard for the importing country. |
| 7 | IMPORT_COUNTRY_ID |  |  |  | VARCHAR (3 ) | Contains the country id of the importing country. |
| 8 | EFFECT_FROM |  |  |  | Date | Denotes the beginning of the time period that the HTS classification is valid. |
| 9 | EFFECT_TO |  |  |  | Date | Denotes the end of the time period that the HTS classification is valid. |
| 10 | TARIFF_TREATMENT |  |  |  | VARCHAR (10 ) | Contains the tariff treatment identification that applies to the HTS classification. |
| 11 | ORIGIN_COUNTRY_ID |  |  |  | VARCHAR (3 ) | Contains the country id for the country where the item is manufactured. |
| 12 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 13 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 14 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 15 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_INVBACKORD

**Description:** This is an interface staging table that holds information related to backorder request from an external order management system (OMS) to RMS.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID |  |  | Y | NUMERIC (15) | Unique identifier used to identify a set of rows in a single RIB message. This number is generated by a new sequence. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (15) | This is used to divide data associated with the same process_id into multiple chunks to facilitate parallel processing. For the same process_id, chunk_id starts with 1 and increment by 1 for each new chunk. |
| 3 | BACKORD_ID |  |  | Y | NUMERIC (15) | Unique identifier within a process_id for a particular backorder request. |
| 4 | PROCESS_STATUS |  |  | Y | VARCHAR (1) | Indicates the current processing status for a particular row in the staging table. Processing status can be N - New, V - Validated, E - Error or C - Completed. |
| 5 | ACTION_TYPE |  |  | Y | VARCHAR (10) | Indicates the action type of a backorder request. Currently only create request is supported. Reserving and releasing is handled in the same message by positive and negative quantities respectively. Valid value is 'create'. |
| 6 | ITEM |  |  | Y | VARCHAR (25) | Indicates the item for which OMS sends the backorder quantity. |
| 7 | LOCATION |  |  | Y | NUMERIC (10) | Indicates the location (store or warehouse) for which OMS sends the backorder quantity. |
| 8 | LOC_TYPE |  |  | Y | VARCHAR (1) | Indicates if the location is a S - Store or a W - Warehouse. |
| 9 | CHANNEL_ID |  |  |  | NUMERIC (4) | Indicates the channel with which a store or a virtual warehouse is associated. |
| 10 | BACKORDER_QTY |  |  | Y | NUMERIC (12,4) | This field indicates the backorder quantity from OMS. |
| 11 | BACKORDER_UOM |  |  | Y | VARCHAR (4) | Indicates the UOM in which the backorder quantity is received in RMS. |
| 12 | ERROR_MSG |  |  |  | VARCHAR (2000) | This field contains the error messages identified during the validation process. |
| 13 | CREATE_DATETIME |  |  | Y | Date | Contains the timestamp when the record is created. |
| 14 | CREATE_ID |  |  | Y | VARCHAR (30) | Contains the USER that created the record. |
| 15 | LAST_UPDATE_DATETIME |  |  | Y | Date | Contains the timestamp when the record is last updated. |
| 16 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | Contains the USER that last updated the record. |

---

## Table: SVC_LANG

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in LANG.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | LANG |  |  |  | NUMERIC (6) | Contains a number which uniquely identifies a language. |
| 7 | DESCRIPTION |  |  |  | VARCHAR (120 ) | Contains a description or name for the language. |
| 8 | WEBHELP_SERVER |  |  |  | VARCHAR (200 ) | Contains a web help server for the particular language. |
| 9 | REPORTS_SERVER |  |  |  | VARCHAR (200 ) | Contains the name of the reports server for a particular language. |
| 10 | WEBREPORTS_SERVER |  |  |  | VARCHAR (200 ) | Contains the URL of the web reports server. |
| 11 | ISO_CODE |  |  |  | VARCHAR (6 ) | This field holds the ISO code associated with the given language. |
| 12 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 13 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 14 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 15 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_LANG_TL

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in LANG_TL.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 BYTE) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 BYTE) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | LANG |  |  |  | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 7 | LANG_LANG |  |  |  | NUMERIC (6) | Contains a number which uniquely identifies a language. |
| 8 | DESCRIPTION |  |  |  | VARCHAR (120 BYTE) | Contains a description or name for the language. |

---

## Table: SVC_LOCATION_CLOSED

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in LOCATION_CLOSED.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | LOCATION |  |  |  | NUMERIC (10) | Contain the location number. |
| 7 | CLOSE_DATE |  |  |  | Date | This field contains the date of the closing. |
| 8 | LOC_TYPE |  |  |  | VARCHAR (6 ) | This field contains the location type for the location being closed (i.e. store or warehouse). |
| 9 | SALES_IND |  |  |  | VARCHAR (1 ) | This field indicates that a location is closed for sales. Only stores can be closed for sales. |
| 10 | RECV_IND |  |  |  | VARCHAR (1 ) | This field indicates that a location is closed for receiving. |
| 11 | SHIP_IND |  |  |  | VARCHAR (1 ) | This field indicates that a location is closed for shipping. |
| 12 | REASON |  |  |  | VARCHAR (250 ) | Contains the reason why the store is closed. |
| 13 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 14 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 15 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 16 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_LOCATION_CLOSED_TL

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in LOCATION_CLOSED_TL.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 BYTE) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 BYTE) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | LANG |  |  |  | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 7 | LOCATION |  |  |  | NUMERIC (10) | Contain the location number |
| 8 | CLOSE_DATE |  |  |  | Date (7) | This field contains the date of the closing. |
| 9 | REASON |  |  | <br> | VARCHAR (250 BYTE) | Contains the reason why the store is closed. |

---

## Table: SVC_MERCHANT

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in MERCHANT.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | MERCH |  |  |  | NUMERIC (4) | Contains the number which uniquely identifies the merchandiser within the system. |
| 7 | MERCH_NAME |  |  |  | VARCHAR (120 ) | Contains the name of the merchandiser. |
| 8 | MERCH_PHONE |  |  |  | VARCHAR (20 ) | Contains the phone number of the merchandiser. |
| 9 | MERCH_FAX |  |  |  | VARCHAR (20 ) | Contains the fax number of the merchandiser. |
| 10 | CREATE_ID |  |  |  | VARCHAR (30 ) | This column holds the User id of the user who created the record. |
| 11 | CREATE_DATETIME |  |  |  | Date | This column holds the record creation date. |
| 12 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 13 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_MONTH_DATA_BUDGET

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in MONTH_DATA_BUDGET.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | DEPT |  |  |  | NUMERIC (4) | Contains the department for which the monthly budget exists. |
| 7 | MONTH_NO |  |  |  | NUMERIC (1) | Contains the class for which the monthly budget exists. |
| 8 | HALF_NO |  |  |  | NUMERIC (5) | Contains the half number for which the monthly budget exists. |
| 9 | LOC_TYPE |  |  |  | VARCHAR (1 ) | This field contains Location Type. Valid Values are : S = Store, W = Warehouse, E = External Finisher |
| 10 | LOCATION |  |  |  | NUMERIC (10) | This field contains the Store if Loc_type = S, the Warehouse or Internal Finisher if Loc_type = W, the External Finisher if Loc_type = E. |
| 11 | SET_OF_BOOKS_ID |  |  |  | NUMERIC (15) | Oracle set of books for Oracle Retail transactions. |
| 12 | OPN_STK_RETAIL |  |  |  | NUMERIC (20,4) | Monthly budget for the beginning of month stock on hand dollar values at retail for a department/location. This field is stored in the primary currency. |
| 13 | OPN_STK_COST |  |  |  | NUMERIC (20,4) | Beginning of month stock on hand dollar values at cost for a subclass/location. It is equal to cls_stk_cost of the previous month. |
| 14 | PURCH_RETAIL |  |  |  | NUMERIC (20,4) | Monthly budget for the dollar values at retail of purchases received for a |
| 15 | PURCH_COST |  |  |  | NUMERIC (20,4) | Monthly budget for the dollar values at cost of purchases received for a department/location during a month. This field is stored in the primary currency. |
| 16 | RTV_RETAIL |  |  |  | NUMERIC (20,4) | Monthly budget for merchandise expected to be returned to vendor valued at retail. This field is stored in the primary currency. |
| 17 | RTV_COST |  |  |  | NUMERIC (20,4) | Monthly budget for merchandise expected to be returned to vendor valued at cost. This field is stored in the primary currency. |
| 18 | NET_SALES_RETAIL |  |  |  | NUMERIC (20,4) | Monthly budget for dollar values at retail of net merchandise sold for a department/location during a month. This field is stored in the primary currency. |
| 19 | NET_SALES_COST |  |  |  | NUMERIC (20,4) | Monthly budget for dollar values at cost of net merchandise sold for a department/location during a month. This field is stored in the primary currency. |
| 20 | CLEAR_MARKDOWN_RETAIL |  |  |  | NUMERIC (20,4) | Expected clearance markdowns to taken valued at retail. This field is stored in the primary currency. |
| 21 | PERM_MARKDOWN_RETAIL |  |  |  | NUMERIC (20,4) | Expected permanent markdowns to be taken valued at retail. This field is stored in the primary currency. |
| 22 | PROM_MARKDOWN_RETAIL |  |  |  | NUMERIC (20,4) | Expected promotions to be marked down at the register valued at retail. This field is stored in the primary currency. |
| 23 | SHRINKAGE_RETAIL |  |  |  | NUMERIC (20,4) | Monthly budget for shrinkage at retail for the department/location. This field is stored in the primary currency. |
| 24 | SHRINKAGE_COST |  |  |  | NUMERIC (20,4) | Monthly budget for shrinkage at cost for the department/location. This field is stored in the primary currency. |
| 25 | EMPL_DISC_RETAIL |  |  |  | NUMERIC (20,4) | Expected employee discounts to be taken at the register. This field is stored in the primary currency. |
| 26 | CLS_STK_RETAIL |  |  |  | NUMERIC (20,4) | Monthly budget for the end of month stock on hand dollar values at retail for the department/location. This field is stored in the primary currency. |
| 27 | CLS_STK_COST |  |  |  | NUMERIC (20,4) | Monthly budget for the end of month stock on hand dollar values at cost for the department/location. This field is stored in the primary currency. |
| 28 | GROSS_MARGIN |  |  |  | NUMERIC (20,4) | Monthly budget for the gross margin dollar amount for the department/location. This field is stored in the primary currency. |
| 29 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 30 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 31 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 32 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_NONMERCH_CODE_HEAD_LTL

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded to NON_MERCH_CODE_HEAD_TL.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | LANG |  |  |  | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 7 | NON_MERCH_CODE |  |  |  | VARCHAR (6 ) | Code identifying a non-merchandise cost that can be added to an invoice. |
| 8 | NON_MERCH_CODE_DESC |  |  |  | VARCHAR (120 ) | Description of the non-merchandise cost code. |

---

## Table: SVC_NON_MERCH_CODE_COMP

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in NON_MERCH_CODE_COMP.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | NON_MERCH_CODE |  |  |  | VARCHAR (6 ) | Code identifying a non-merchandise cost that can be added to an invoice. |
| 7 | COMP_ID |  |  |  | VARCHAR (10 ) | Code identifying a landed cost component that will be invoiced under the specified non-merchandise code. |
| 8 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 9 | CREATE_DATETIME |  |  |  | Date | Date time when record was last updated. |
| 10 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | This column holds the User id of the user who created the record. |
| 11 | LAST_UPD_DATETIME |  |  |  | Date | This column holds the record creation date. |

---

## Table: SVC_NON_MERCH_CODE_HEAD_TL

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in NON_MERCH_CODE_HEAD.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | NON_MERCH_CODE |  |  |  | VARCHAR (6 ) | Code identifying a non-merchandise cost that can be added to an invoice. |
| 7 | NON_MERCH_CODE_DESC |  |  |  | VARCHAR (120 ) | Description of the non-merchandise cost code. |
| 8 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 9 | CREATE_DATETIME |  |  |  | Date | Date time when record was last updated. |
| 10 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | This column holds the User id of the user who created the record. |
| 11 | LAST_UPD_DATETIME |  |  |  | Date | This column holds the record creation date. |

---

## Table: SVC_OGA

**Description:** This is a staging table used for Admin API spreadsheet upload process. It is used to temporarily hold data before it is uploaded/updated in OGA.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | OGA_CODE |  |  |  | VARCHAR (3 ) | Contains a unique code which will identify the government agency. The codes are provided by customs. |
| 7 | OGA_DESC |  |  |  | VARCHAR (250 ) | Contains a description of the government agency. |
| 8 | REQ_FORM |  |  |  | VARCHAR (30 ) | Contains a description of the government agency. |
| 9 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 10 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 11 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 12 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_OGA_TL

**Description:** This is a staging table used for Admin API spreadsheet upload process. It is used to temporarily hold data before it is uploaded/updated in OGA_TL.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | LANG |  |  |  | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 7 | OGA_CODE |  |  |  | VARCHAR (3 ) | Contains the customs approved code to uniquely identify a special tariff program. |
| 8 | OGA_DESC |  |  |  | VARCHAR (250 ) | Contains the description for the tariff treatment ID. Example: NAFTA is North American Free Trade Agreement. |
| 9 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 10 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 11 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 12 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_ORDDETAIL

**Description:** This is the staging table for PO Induction module which is used to temporarily hold data before it is uploaded in the ORDSKU, ORDLOC, ALLOC_HEADER, and ALLOC_DETAIL tables.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The data for a process is split in multiple chunks. The chunk information is present in SVC_PROCESS_CHUNKS. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | This is the unique row sequence within a process ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes the type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Indicates the status of the record i.e. N-New, P-Processed, E-Error. |
| 6 | ORDER_NO |  |  |  | NUMERIC (12) | Contains the number that uniquely identifies an order within the system. |
| 7 | ITEM |  |  |  | VARCHAR (25 ) | Unique alphanumeric value that identifies the item. |
| 8 | ITEM_DESC |  |  |  | VARCHAR (250 ) | Long description of the item. This description is used through out the system to help online users identify the item. |
| 9 | VPN |  |  |  | VARCHAR (30 ) | This field contains the Vendor Product Number associated with this item. |
| 10 | ITEM_PARENT |  |  |  | VARCHAR (25 ) | Alphanumeric value that uniquely identifies the item/group at the level above the item. |
| 11 | REF_ITEM |  |  |  | VARCHAR (25 ) | Unique alphanumeric value that identifies the reference item. |
| 12 | DIFF_1 |  |  |  | VARCHAR (10 ) | Diff_group or diff_id that differentiates the current item from its item_parent. |
| 13 | DIFF_2 |  |  |  | VARCHAR (10 ) | Diff_group or diff_id that differentiates the current item from its item_parent. |
| 14 | DIFF_3 |  |  |  | VARCHAR (10 ) | Diff_group or diff_id that differentiates the current item from its item_parent. |
| 15 | DIFF_4 |  |  |  | VARCHAR (10 ) | Diff_group or diff_id that differentiates the current item from its item_parent. |
| 16 | ORIGIN_COUNTRY_ID |  |  |  | VARCHAR (3 ) | The identifier of the country into which the items on the order are being imported. |
| 17 | SUPP_PACK_SIZE |  |  |  | NUMERIC (12,4) | Supplier pack size for this order/item. |
| 18 | LOC_TYPE |  |  |  | VARCHAR (1 ) | This field contains the type of location in the location field. Valid values are: S - Store, W - Warehouse |
| 19 | LOCATION |  |  |  | NUMERIC (10) | This field contains the location that item will be ordered to. This field may contain a store or a warehouse. |
| 20 | LOCATION_DESC |  |  |  | VARCHAR (250 ) | Contains the description of the location. |
| 21 | UNIT_COST |  |  |  | NUMERIC (20,4) | This field contains the unit cost for the Item/Location on the order, including discounts (deal/bracket/allowance), but not landed cost components. This field is stored in order currency. |
| 22 | QTY_ORDERED |  |  |  | NUMERIC (12,4) | Contains the total number of items ordered for the SKU to this location. |
| 23 | DELIVERY_DATE |  |  |  | Date | The date by which goods are to be delivered. |
| 24 | NON_SCALE_IND |  |  |  | VARCHAR (1 ) | Indicator to determine if the item/locations order quantity should not be scaled during the order scaling process. Valid values include: Y - Yes. Fix the order quantity to ensure that the item/location order quantity is not adjusted during the order scaling process. N - No. Do not fix the order quantity to ensure that the item/location order quantity will be adjusted during the order scaling process. |
| 25 | PROCESSING_TYPE |  |  |  | VARCHAR (1 ) | Indicates the processing action on the record. A processing type value of 'Consolidation' will drive consolidation of line demand to a processing warehouse level while a processing type value of 'Cross Dock' will both drive consolidation to a processing warehouse level as well as create allocations to distribute the consolidated demand to the individual store or warehouse locations. |
| 26 | PROCESSING_WH |  |  |  | NUMERIC (10) | Holds the location used in consolidation or cross-dock processing type. |
| 27 | ALLOC_NO |  |  |  | NUMERIC (10) | This column contains the number that uniquely identifies the allocation within the system that is associated to this order. |
| 28 | QTY_TRANSFERRED |  |  |  | NUMERIC (12,4) | This column contains the number of items that have already been transferred under this allocation. |
| 29 | QTY_CANCELLED |  |  |  | NUMERIC (12,4) | This field contains the quantity that was left to be ordered when the line item was cancelled. |
| 30 | CANCEL_CODE |  |  |  | VARCHAR (1 ) | This field contains the reason that the line item was cancelled. This field is required if a line item is cancelled. |
| 31 | RELEASE_DATE |  |  |  | Date | This column contains the date on which the allocation should be released from the warehouse for delivery to the store or warehouse locations. |
| 32 | CREATE_ID |  |  |  | VARCHAR (30 ) | Indicates the user that created the record. |
| 33 | CREATE_DATETIME |  |  |  | Date | Indicates the date the record was created. |
| 34 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | Indicates the user that last updated the record. |
| 35 | LAST_UPD_DATETIME |  |  |  | Date | Indicates the date the record was last updated. |
| 36 | RE_APPROVE |  |  |  | VARCHAR (1 BYTE) | This field is used for XOrder processing to facilitate updates on approved PO. It indicates whether the order should be reapproved or not. Default to "N" if passed as NULL |
| 37 | SET_TO_WORKSHEET |  |  |  | VARCHAR (1 BYTE) | This field is used for XOrder processing to facilitate updates on approved orders. It indicates whether the order should be set back to worksheet status or not. Default to "N" if passed as NULL |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|SVC_ORDDETAIL_PK|PK||||PROCESS_ID|ASC|
||||||ROW_SEQ|ASC|
|SVC_ODT_UK|UK||||ORDER_NO|ASC|
||||||ITEM|ASC|
||||||LOC_TYPE|ASC|
||||||LOCATION|ASC|
||||||DELIVERY_DATE|ASC|
||||||PROCESSING_TYPE|ASC|
||||||PROCESSING_WH|ASC|
||||||ALLOC_NO|ASC|

---

## Table: SVC_ORDER_PARAMETER_CONFIG

**Description:** This table contains configuration information that is referenced by the PO creation templates for PO induction. This table should only hold one record.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | MAX_CHUNK_SIZE |  |  | Y | NUMERIC (10) | The maximum number of orders that should be processed in one chunk. |
| 2 | MAX_THREADS |  |  | Y | NUMERIC (10) | This is the maximum number of threads that should be spawned for the coresvc_po package. |
| 3 | WAIT_BTWN_THREADS |  |  | Y | NUMERIC (10) | This is the number of milliseconds between submission of two threads |
| 4 | MAX_ORDER_NO_QTY |  |  | Y | NUMERIC (4) | The maximum number of order numbers that can be preissued in one request. |
| 5 | MAX_ORDER_EXPIRY_DAYS |  |  | Y | NUMERIC (4) | Contains the maximum number of days that can be set for the order expiry days. |
| 6 | APPLY_SCALING |  |  | Y | VARCHAR (1 ) | Indicates whether or not scaling are to be performed on the quantities in the purchase order. Valid values are Y or N. |
| 7 | APPLY_DEALS |  |  | Y | VARCHAR (1 ) | Indicates whether or not deals are to be applied on the purchase order. Valid values are Y or N. |
| 8 | APPLY_BRACKETS |  |  | Y | VARCHAR (1 ) | Indicates whether or not brackets are to be applied to the purchase order. Valid values are Y or N. |
| 9 | OTB_OVERRIDE |  |  | Y | VARCHAR (1 ) | Indicates whether or not PO approval will be allowed even if OTB limits have been exceeded. Valid values are Y or N. |
| 10 | RECALC_REPLENISHMENT |  |  | Y | VARCHAR (1 ) | Indicates whether or not replenishment results are to be recalculated. Valid values are Y or N. |
| 11 | CANCEL_ALLOC |  |  | Y | VARCHAR (1 ) | Indicates whether or not PO linked allocations will be cancelled when the order is cancelled or set to worksheet status. |
| 12 | SKIP_OPEN_SHIPMENT |  |  | Y | VARCHAR (1 ) | Indicates whether or not open shipments linked to the PO will be cancelled when the order is cancelled. Cancelled shipments cannot be reinstated. Valid values are Y or N. |
| 13 | OVERRIDE_MANL_COST_SRC |  |  | Y | VARCHAR (1 ) | Indicates whether or not manual costs will be overridden when deals are applied. Valid values are Y or N. |

---

## Table: SVC_ORDHEAD

**Description:** This is the staging table for PO Induction module which is used to temporarily hold data before it is uploaded in the ORDHEAD table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The data for a process is split in multiple chunks. The chunk information is present in SVC_PROCESS_CHUNKS. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | This is the unique row sequence within a process ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes the type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Indicates the status of the record i.e. N-New, P-Processed, E-Error. |
| 6 | ORDER_NO |  |  |  | NUMERIC (12) | Contains the number that uniquely identifies an order within the system. |
| 7 | ORDER_TYPE |  |  |  | VARCHAR (3 ) | Indicates the type of order and which Open To Buy bucket will be updated. Valid values include: N/B - Non Basic, ARB - Automatic Reorder of Basic, BRB - Buyer Reorder of Basic. |
| 8 | DEPT |  |  |  | NUMERIC (4) | Contains the department number for orders limited to a single department and will be NULL for orders involving items in more than one department. |
| 9 | BUYER |  |  |  | NUMERIC (4) | Contains the number associated with the buyer for the order. |
| 10 | SUPPLIER |  |  |  | NUMERIC (10) | Contains the vendor number who will provide the merchandise specified in the order. |
| 11 | SUPP_ADD_SEQ_NO |  |  |  | NUMERIC (4) | Supplier address sequence number differentiates supplier address within the same type. |
| 12 | LOC_TYPE |  |  |  | VARCHAR (1 ) | This field contains the type of location in the location field. Valid values are S (Store) or W (Warehouse). |
| 13 | LOCATION |  |  |  | NUMERIC (10) | This field contains the location all items on the order will be delivered to if populated. i.e. It will mean a single location order. |
| 14 | PROMOTION |  |  |  | NUMERIC (10) | Contains the ad number associated with the order to provide a link between the order dialog and the promotions dialog. |
| 15 | QC_IND |  |  |  | VARCHAR (1 ) | Determines whether or not quality control will be required when items for this order are received. Valid values are Y or N. |
| 16 | WRITTEN_DATE |  |  |  | Date | Contains the date the order was created within the system. |
| 17 | NOT_BEFORE_DATE |  |  |  | Date | Contains the first date that delivery of the order will be accepted. |
| 18 | NOT_AFTER_DATE |  |  |  | Date | Contains the last date that delivery of the order will be accepted. |
| 19 | OTB_EOW_DATE |  |  |  | Date | This field contains the OTB budget bucket the order amount should be placed into. |
| 20 | EARLIEST_SHIP_DATE |  |  |  | Date | The date before which the items on the purchase order cannot be shipped by the supplier. Represents the earliest earliest ship date of all the items on the order. |
| 21 | LATEST_SHIP_DATE |  |  |  | Date | The date after which the items on the purchase order can not be shipped by the supplier. Represents the greatest latest ship date of all the items on the order. |
| 22 | CLOSE_DATE |  |  |  | Date | Contains the date when the order is closed. |
| 23 | TERMS |  |  |  | VARCHAR (15 ) | Indicator identifying the sales terms for the order. These terms specify when payment is due and if any discounts exist for early payment. |
| 24 | FREIGHT_TERMS |  |  |  | VARCHAR (30 ) | Indicator that references what freight terms are related to the order. |
| 25 | ORIG_IND |  |  |  | NUMERIC (1) | Indicates where the order originated. Valid values include: 0 - Current system generated (used by automatic replenishment), 2 - Manual, 3 - Buyer Worksheet, 4 - Consignment, 5 - Vendor Generated. |
| 26 | PAYMENT_METHOD |  |  |  | VARCHAR (6 ) | Indicates how the purchase order will be paid. Valid options are LC (Letter of Credit), WT (Wire Transfer), OA (Open Account). |
| 27 | BACKHAUL_TYPE |  |  |  | VARCHAR (6) | This field contains the type of backhaul allowance that will be applied to the order. Some examples are Calculated or Flat Rate. |
| 28 | BACKHAUL_ALLOWANCE |  |  |  | NUMERIC (20,4) | This field will contain the backhaul allowance value. |
| 29 | SHIP_METHOD |  |  |  | VARCHAR (6 ) | The method used to ship the items on the purchase order from the country of origin to the country of import. Valid values include 10 (Vessel, Noncontainer), 11 (Vessel, Container), 12 (Border Water-borne (Only Mexico and Canada)), 20 (Rail, Non-container), 21 (Rail, Container), 30 (Truck, Noncontainer), 31 (Truck, Container), 32 (Auto), 33 (Pedestrian), 34 (Road, other, includes foot and animal borne), 40 (Air, Non-container), 41 (Air, Container), 50 (Mail), 60 (Passenger, Hand carried), 70 (Fixed Transportation Installation), 80 (Not used at this time). |
| 30 | PURCHASE_TYPE |  |  |  | VARCHAR (6 ) | Indicates whats included in the suppliers cost of the item. Valid values include C (Cost), CI (Cost and Insurance), CIF (Cost, Insurance and Freight), FOB (Free on Board). |
| 31 | STATUS |  |  |  | VARCHAR (1 ) | Indicates the current status of the order. |
| 32 | SHIP_PAY_METHOD |  |  |  | VARCHAR (2 ) | Code indicating the payment terms for freight charges associated with the order. Valid values include: CC - Collect, CF - Collect Freight Credited Back to Customer, DF - Defined by Buyer and Seller, MX - Mixed, PC - Prepaid but Charged to Customer, PO - Prepaid Only, PP - Prepaid by Seller. |
| 33 | FOB_TRANS_RES |  |  |  | VARCHAR (2 ) | Contains the code indicating the type of the location that is responsible for the transportation of the order. |
| 34 | FOB_TRANS_RES_DESC |  |  |  | VARCHAR (250 ) | User entered field describing the code for the location responsible for the transportation of the order. |
| 35 | FOB_TITLE_PASS |  |  |  | VARCHAR (2 ) | Indicator used to determine where the title for goods is passed from the vendor to the purchaser. Examples include city, factory, or origin. |
| 36 | FOB_TITLE_PASS_DESC |  |  |  | VARCHAR (250 ) | User entered field describing the code where the title of the merchandise is to be passed. Could be a city name, factory name, or place of origin. |
| 37 | EDI_PO_IND |  |  |  | VARCHAR (1 ) | Indicates whether or not the order will be transmitted to the supplier via an Electronic Data Exchange transaction. Valid values are: Y = Submit via EDI, N = Do not use EDI |
| 38 | IMPORT_ORDER_IND |  |  |  | VARCHAR (1 ) | Indicates if the purchase order is an import order. Valid values are Y (Yes) and N (No). |
| 39 | IMPORT_COUNTRY_ID |  |  |  | VARCHAR (3 ) | The identifier of the country into which the items on the order are being imported. |
| 40 | INCLUDE_ON_ORDER_IND |  |  |  | VARCHAR (1 ) | Indicator to determine if the order should be included in on-order calculations. Valid values include Yes (include the order in the on-order calculations), No (do not include the order in the on-order calculations). |
| 41 | VENDOR_ORDER_NO |  |  |  | VARCHAR (15 ) | Contains the vendors unique identifying number for an order. |
| 42 | EXCHANGE_RATE |  |  |  | NUMERIC (20,10) | The rate of exchange used for the purchase order between the order and primary currencies. |
| 43 | FACTORY |  |  |  | VARCHAR (10 ) | The factory at which the items on the purchase order are made. This field is only available when the system is running Import functionality. |
| 44 | AGENT |  |  |  | VARCHAR (10 ) | The agent that is used in the purchase of the items on the purchase order. This field is only available when the system is running Import functionality. |
| 45 | DISCHARGE_PORT |  |  |  | VARCHAR (5 ) | The port at which the items on the purchase order will enter the country of import. This field is only available when the system is running Import functionality. |
| 46 | LADING_PORT |  |  |  | VARCHAR (5 ) | The port from which the items on the purchase order are shipped. This field is only available when the system is running Import functionality. |
| 47 | FREIGHT_CONTRACT_NO |  |  |  | VARCHAR (10 ) | The number of the contract with a shipper that will give specific freight rates. This field is only available when the system is running Import functionality. |
| 48 | PO_TYPE |  |  |  | VARCHAR (4 ) | Contains the value associated with the PO_TYPE for the order. |
| 49 | PRE_MARK_IND |  |  |  | VARCHAR (1 ) | This field indicates whether or not a supplier has agreed to break an order into separate boxes so that the boxes can be sent directly to stores. |
| 50 | CURRENCY_CODE |  |  |  | VARCHAR (3 ) | Contains the currency code for the order. When creating an order within Oracle Retail, this field will always default to the currency of the supplier, but it can be overwritten. |
| 51 | REJECT_CODE |  |  |  | VARCHAR (6 ) | Contains a code for the reason why the order was rejected during the automatic replenishment approval process. Valid values include: VM (Vendor minimum not met), NC (Negative cost calculated on an item), UOM (UOM convert error due to incomplete data). |
| 52 | CONTRACT_NO |  |  |  | NUMERIC (6) | This is an optional field which contains the contract number associated with this order. |
| 53 | PICKUP_LOC |  |  |  | VARCHAR (250 ) | Contains the location at which the order will be picked up, if the order is a Pickup order. |
| 54 | PICKUP_NO |  |  |  | VARCHAR (25 ) | Contains the reference number of the Pickup order. |
| 55 | PICKUP_DATE |  |  |  | Date | Contains the date when the order can be picked up from the Supplier. This field is only required if the Purchase Type of the order is Pickup. |
| 56 | COMMENT_DESC |  |  |  | VARCHAR (2000 ) | Any miscellaneous comments attached to the purchase order. |
| 57 | PARTNER_TYPE_1 |  |  |  | VARCHAR (6 ) | Partner 1 Type |
| 58 | PARTNER1 |  |  |  | VARCHAR (10 ) | Additional Partner 1 |
| 59 | PARTNER_TYPE_2 |  |  |  | VARCHAR (6 ) | Partner 2 Type |
| 60 | PARTNER2 |  |  |  | VARCHAR (10 ) | Additional Partner 2 |
| 61 | PARTNER_TYPE_3 |  |  |  | VARCHAR (6 ) | Partner 3 Type |
| 62 | PARTNER3 |  |  |  | VARCHAR (10 ) | Additional Partner 3 |
| 63 | IMPORT_TYPE |  |  |  | VARCHAR (1 ) | This is the default importer/exporter assigned to the supplier of the purchase order. Valid values are IMporter and EXporter. |
| 64 | IMPORT_ID |  |  |  | NUMERIC (10) | This identifies the importer/exporter assigned to the supplier. |
| 65 | CLEARING_ZONE_ID |  |  |  | VARCHAR (5 ) | This column will hold the clearing zone id. |
| 66 | ROUTING_LOC_ID |  |  |  | VARCHAR (5 ) | This is the default routing location for the import order. |
| 67 | EXT_REF_NO |  |  |  | NUMERIC (10) | Holds a dummy order number entered by the user or specified by the source system that is used for key cross reference across tables. This will be NULL in case a pre-issued number is used. |
| 68 | MASTER_PO_NO |  |  |  | NUMERIC (12) | Holds the master PO number from which child orders will be created. This will only be used to group orders together and will not be used for any purchase order processing. |
| 69 | RE_APPROVE_IND |  |  |  | VARCHAR (1 ) | Indicates if the order will be re-approved after an update is made. |
| 70 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | Indicates the user that last updated the record. |
| 71 | LAST_UPD_DATETIME |  |  |  | Date | Indicates the date the record was last updated. |
| 72 | NEXT_UPD_ID |  |  |  | VARCHAR (30 ) | Holds the user ID which is expected to work next on this order. |
| 73 | CREATE_ID |  |  |  | VARCHAR (30 ) | Indicates the user that created the record. |
| 74 | CREATE_DATETIME |  |  |  | Date | Indicates the date the record was created. |

---

## Table: SVC_ORDHEAD_CFA_EXT

**Description:** This is the staging table for PO Induction module which is used to temporarily hold data before it is uploaded in the ORDHEAD_CFA_EXT table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The data for a process is split in multiple chunks. The chunk information is present in SVC_PROCESS_CHUNKS. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | This is the unique row sequence within a process ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes the type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Indicates the status of the record i.e. N-New, P-Processed, E-Error. |
| 6 | ORDER_NO |  |  |  | NUMERIC (12) | This column holds the Order Number this extended data is associated with. |
| 7 | GROUP_ID |  |  |  | NUMERIC (10) | This column holds the attribute group id that this extended data is associated with. The logical business meaning of the VARCHAR_, NUMBER_ and DATE_ columns on this table are determined by the metadata defined for this attribute. |
| 8 | VARCHAR2_1 |  |  |  | VARCHAR (250 ) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_1 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 9 | VARCHAR2_2 |  |  |  | VARCHAR (250 ) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_2 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 10 | VARCHAR2_3 |  |  |  | VARCHAR (250 ) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_3 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 11 | VARCHAR2_4 |  |  |  | VARCHAR (250 ) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_4 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 12 | VARCHAR2_5 |  |  |  | VARCHAR (250 ) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_5 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 13 | VARCHAR2_6 |  |  |  | VARCHAR (250 ) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_6 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 14 | VARCHAR2_7 |  |  |  | VARCHAR (250 ) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_7 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 15 | VARCHAR2_8 |  |  |  | VARCHAR (250 ) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_8 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 16 | VARCHAR2_9 |  |  |  | VARCHAR (250 ) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_9 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 17 | VARCHAR2_10 |  |  |  | VARCHAR (250 ) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_10 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 18 | NUMBER_11 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_11 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 19 | NUMBER_12 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_12 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 20 | NUMBER_13 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_13 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 21 | NUMBER_14 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_14 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 22 | NUMBER_15 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_15 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 23 | NUMBER_16 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_16 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 24 | NUMBER_17 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_17 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 25 | NUMBER_18 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_18 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 26 | NUMBER_19 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_19 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 27 | NUMBER_20 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_20 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 28 | DATE_21 |  |  |  | Date | This column holds data related to the attribute defined on the CFA_ATTRIB table that references DATE_21 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 29 | DATE_22 |  |  |  | Date | This column holds data related to the attribute defined on the CFA_ATTRIB table that references DATE_22 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 30 | CREATE_ID |  |  |  | VARCHAR (30 ) | Indicates the user that created the record. |
| 31 | CREATE_DATETIME |  |  |  | Date | Indicates the date the record was created. |
| 32 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | Indicates the user that last updated the record. |
| 33 | LAST_UPD_DATETIME |  |  |  | Date | Indicates the date the record was last updated. |

---

## Table: SVC_ORDLC

**Description:** This is the staging table for PO Induction module which is used to temporarily hold data before it is uploaded in the ORDLC table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The data for a process is split in multiple chunks. The chunk information is present in SVC_PROCESS_CHUNKS. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | This is the unique row sequence within a process ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes the type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Indicates the status of the record i.e. N-New, P-Processed, E-Error. |
| 6 | ORDER_NO |  |  |  | NUMERIC (12) | Contains the number that uniquely identifies an order within the system. |
| 7 | LC_REF_ID |  |  |  | NUMERIC (8) | This field contains the ID of the LC to which the order is attached. |
| 8 | LC_GROUP_ID |  |  |  | VARCHAR (10 ) | This field contains an ID that can be used to group orders together so that they can be attached to a single Letter of Credit. |
| 9 | APPLICANT |  |  |  | VARCHAR (10 ) | This field contains the ID of the applicant being used for the LC process. |
| 10 | BENEFICIARY |  |  |  | NUMERIC (10) | This field contains the ID of the beneficiary being used for the LC process. |
| 11 | MERCH_DESC |  |  |  | VARCHAR (2000 ) | This field holds a description of the merchandise on the order. |
| 12 | TRANSSHIPMENT_IND |  |  |  | VARCHAR (1 ) | This field indicates whether or not the LC to which the order is attached will allow the order to be transshipped. Valid values are Yes and No. |
| 13 | PARTIAL_SHIPMENT_IND |  |  |  | VARCHAR (1 ) | This field indicates whether or not the LC to which the order is attached will allow the order to be partially shipped. Valid values are Yes and No. |
| 14 | LC_IND |  |  |  | VARCHAR (1 ) | This field will indicate whether or not the order has been attached to a Letter of Credit. |
| 15 | CREATE_ID |  |  |  | VARCHAR (30 ) | Indicates the user that created the record. |
| 16 | CREATE_DATETIME |  |  |  | Date | Indicates the date the record was created. |
| 17 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | Indicates the user that last updated the record. |
| 18 | LAST_UPD_DATETIME |  |  |  | Date | Indicates the date the record was last updated. |

---

## Table: SVC_ORDLOC_EXP

**Description:** This is the staging table for PO Induction module which is used to temporarily hold data before it is uploaded in the ORDLOC_EXP table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The data for a process is split in multiple chunks. The chunk information is present in SVC_PROCESS_CHUNKS. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | This is the unique row sequence within a process ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes the type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Indicates the status of the record i.e. N-New, P-Processed, E-Error. |
| 6 | ORDER_NO |  |  |  | NUMERIC (12) | Contains the number that uniquely identifies an order within the system. |
| 7 | ITEM |  |  |  | VARCHAR (25 ) | Unique alphanumeric value that identifies the item. |
| 8 | PACK_ITEM |  |  |  | VARCHAR (25 ) | Alphanumeric value that uniquely identifies the pack. |
| 9 | LOCATION |  |  |  | NUMERIC (10) | This field contains the location that item will be ordered to. This field may contain a store or a warehouse. |
| 10 | LOC_TYPE |  |  |  | VARCHAR (1 ) | This field contains the type of location in the location field. Valid values are: S - Store, W - Warehouse |
| 11 | COMP_ID |  |  |  | VARCHAR (10 ) | Contains a user specified code representing a specific expense found on the ELC_COMP table. |
| 12 | CVB_CODE |  |  |  | VARCHAR (10 ) | Contains a code representing the base value for calculating an expense. |
| 13 | COST_BASIS |  |  |  | VARCHAR (1 ) | Contains the basis the expense will be calculated against if there is no CVB code attached to the expense. Valid values are S (Supplier) or O (Order). If the Cost Basis is S then when calculating the expense, the items supplier cost will be used. If the Cost Basis is O then the order unit cost of the item on the order will be used to calculate the expense. The |
| 14 | COMP_RATE |  |  |  | NUMERIC (20,4) | Contains the rate to be charged against the calculation base of the component (either value or specific). |
| 15 | COMP_CURRENCY |  |  |  | VARCHAR (3 ) | Contains the currency the expense or assessment is to be entered in. If the Calculation Basis is V (Value), then this field will be NULL. |
| 16 | EXCHANGE_RATE |  |  |  | NUMERIC (20,10) | Contains the exchange rate of the individual expense. |
| 17 | PER_COUNT |  |  |  | NUMERIC (12,4) | Contains a count indicating the amount of the Per Count Unit of Measure to which the rate applies. When creating an expense that is defined as $.20 for every 10 kilograms of an item ordered, the Per Count would be 10. |
| 18 | PER_COUNT_UOM |  |  |  | VARCHAR (4 ) | Contains the unit of measure in which the Per Count is specified. When creating an expense that is defined as $.20 for every 10 kilograms of an item ordered, the Per Count UOM would be the Unit of Measure code for Kilograms. |
| 19 | EST_EXP_VALUE |  |  |  | NUMERIC (26,10) | Contains the estimated value of the expense in the expenses component currency. |
| 20 | NOM_FLAG_1 |  |  |  | VARCHAR (1 ) | Contains a flag that is used to indicate the status of this particular nomination flag for a given expense. Nomination flags are used in the subsequent formation of Computation Value Bases (CVBs). Valid values are: N (N/A) (this expense will not be included in CVBs which look at User Defined Nomination Flag 1), Add (+) (this expense will be added to the CVBs which look at User Defined Nomination Flag 1), and Subtract (-) (this expense will be deducted from the CVBs which look at User Defined Nomination Flag 1). For example, if expense ABC has a + in Nomination Flag 1, then all CVBs (Computation Value Bases) that include Nomination Flag 1 will add this expense in their calculation basis. |
| 21 | NOM_FLAG_2 |  |  |  | VARCHAR (1 ) | See description for nom_flag_1. If ALC is turned on (i.e. system_options.import_ind = Y), nom_flag_2 is used to indicate the status of a component in duty calculation nom_flag_4 is used to indicate the status of a component in ELC calculation nom_flag_5 is used to indicate the status of a component in ALC calculation i.e. these 3 flags can not be used for any other purposes if LC is turned on. |
| 22 | NOM_FLAG_3 |  |  |  | VARCHAR (1 ) | See description for nom_flag_1. |
| 23 | NOM_FLAG_4 |  |  |  | VARCHAR (1 ) | See description for nom_flag_1. If ALC is turned on (i.e. system_options.import_ind = Y), nom_flag_2 is used to indicate the status of a component in duty calculation nom_flag_4 is used to indicate the status of a component in ELC calculation nom_flag_5 is used to indicate the status of a component in ALC calculation i.e. these 3 flags can not be used for any other purposes if ALC is turned on. |
| 24 | NOM_FLAG_5 |  |  |  | VARCHAR (1 ) | See description for nom_flag_1. If ALC is turned on (i.e. system_options.import_ind = Y), nom_flag_2 is used to indicate the status of a component in duty calculation nom_flag_4 is used to indicate the status of a component in ELC calculation nom_flag_5 is used to indicate the status of a component in ALC calculation i.e. these 3 flags can not be used for any other purposes if ALC is turned on. |
| 25 | ORIGIN |  |  |  | VARCHAR (1 ) | Indicates how any given expense record was inserted into the table. Valid values are (S)ystem generated or (M)anual input. |
| 26 | DEFAULTED_FROM |  |  |  | VARCHAR (6 ) | This field specifies the source from which the expense has been defaulted to the item. Valid values are: P - defaulted from a partner expense profile, S - defaulted from a supplier expense profile, C - defaulted from a country expense profile, E - defaulted due to a always default expense, M - manually added expenses. |
| 27 | KEY_VALUE_1 |  |  |  | VARCHAR (10 ) | This will hold either the supplier value or origin country id or the partner type, depending on the value of the defaulted_from column. |
| 28 | KEY_VALUE_2 |  |  |  | VARCHAR (10 ) | When the expense is defaulted from a partner, this column will hold the value of the partner id. |
| 29 | CREATE_ID |  |  |  | VARCHAR (30 ) | Indicates the user that created the record. |
| 30 | CREATE_DATETIME |  |  |  | Date | Indicates the date the record was created. |
| 31 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | Indicates the user that last updated the record. |
| 32 | LAST_UPD_DATETIME |  |  |  | Date | Indicates the date the record was last updated. |

---

## Table: SVC_ORDSKU_HTS

**Description:** This is the staging table for PO Induction module which is used to temporarily hold data before it is uploaded in the ORDSKU_HTS table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The data for a process is split in multiple chunks. The chunk information is present in SVC_PROCESS_CHUNKS. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | This is the unique row sequence within a process ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes the type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Indicates the status of the record i.e. N-New, P-Processed, E-Error. |
| 6 | ORDER_NO |  |  |  | NUMERIC (12) | Contains the number that uniquely identifies an order within the system. |
| 7 | ITEM |  |  |  | VARCHAR (25 ) | Unique alphanumeric value that identifies the item. |
| 8 | PACK_ITEM |  |  |  | VARCHAR (25 ) | Alphanumeric value that uniquely identifies the pack. |
| 9 | HTS |  |  |  | VARCHAR (25 ) | The identifier for the Harmonized Tariff Schedule code. |
| 10 | IMPORT_COUNTRY_ID |  |  |  | VARCHAR (3 ) | The unique identifier for the country that the item will be imported in to. |
| 11 | EFFECT_FROM |  |  |  | Date | The date from which the Item/HTS relationship is valid. |
| 12 | EFFECT_TO |  |  |  | Date | The date until which the Item/HTS relationship is valid. |
| 13 | STATUS |  |  |  | VARCHAR (1 ) | Used to indicate the status of the Purchase Order/Item/HTS relationship. Valid values are (W)orksheet and (A)pproved. |
| 14 | ORIGIN_COUNTRY_ID |  |  |  | VARCHAR (3 ) | This column stores the country of manufacture when the HTS tracking level is M. When the HTS tracking level is S, this stores the country of sourcing. |
| 15 | CREATE_ID |  |  |  | VARCHAR (30 ) | Indicates the user that created the record. |
| 16 | CREATE_DATETIME |  |  |  | Date | Indicates the date the record was created. |
| 17 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | Indicates the user that last updated the record. |
| 18 | LAST_UPD_DATETIME |  |  |  | Date | Indicates the date the record was last updated. |

---

## Table: SVC_ORDSKU_HTS_ASSESS

**Description:** This is the staging table for PO Induction module which is used to temporarily hold data before it is uploaded in the ORDSKU_HTS_ASSESS table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The data for a process is split in multiple chunks. The chunk information is present in SVC_PROCESS_CHUNKS. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | This is the unique row sequence within a process ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes the type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Indicates the status of the record i.e. N-New, P-Processed, E-Error. |
| 6 | ORDER_NO |  |  |  | NUMERIC (12) | Contains the number that uniquely identifies an order within the system. |
| 7 | ITEM |  |  |  | VARCHAR (25 ) | Unique alphanumeric value that identifies the item. |
| 8 | PACK_ITEM |  |  |  | VARCHAR (25 ) | Alphanumeric value that uniquely identifies the pack. |
| 9 | HTS |  |  |  | VARCHAR (25 ) | The identifier for the Harmonized Tariff Schedule code. |
| 10 | COMP_ID |  |  |  | VARCHAR (10 ) | The code representing the specific assessment component. |
| 11 | CVB_CODE |  |  |  | VARCHAR (10 ) | The Computation Value Base representing the base value for calculating the assessment. |
| 12 | COMP_RATE |  |  |  | NUMERIC (20,4) | The rate to be charged against the calculation base. This field will hold a percentage value if the Calculation Basis of the Component is Value or a monetary amount in the currency defined for the assessment (usually the import countrys currency) if the Calculation Basis is Specific. |
| 13 | PER_COUNT |  |  |  | NUMERIC (12,4) | Contains a count indicating the amount of the Per Count Unit of Measure to which the rate applies. When creating an expense that is defined as $.20 for every 10 kilograms of an item ordered, the Per Count would be 10. |
| 14 | PER_COUNT_UOM |  |  |  | VARCHAR (4 ) | Contains the unit of measure in which the Per Count is specified. When creating an expense that is defined as $.20 for every 10 kilograms of an item ordered, the Per Count UOM would be the Unit of Measure code for Kilograms. |
| 15 | EST_ASSESS_VALUE |  |  |  | NUMERIC (26,10) | Contains the estimated value of the Assessment in the currency defined for the assessment (usually the import countrys currency). |
| 16 | NOM_FLAG_1 |  |  |  | VARCHAR (1 ) | Contains a flag that is used to indicate the status of this particular nomination flag for a given assessment. Nomination flags are used in the subsequent formation of Computation Value Bases (CVBs). Valid values are N (N/A) (this assessment will not be included in CVBs which look at User Defined Nomination Flag 1), Add (+) (this assessment will be added to the CVBs which look at User Defined Nomination Flag 1), and Subtract (-) (this assessment will be deducted from the CVBs which look at User Defined Nomination Flag 1). For example, if assessment ABC has a + in Nomination Flag 1, then all CVBs (Computation Value Bases) that include Nomination Flag 1 will add this assessment in their calculation basis. |
| 17 | NOM_FLAG_2 |  |  |  | VARCHAR (1 ) | See description for nom_flag_1. If ALC is turned on (i.e. system_options.import_ind = Y), nom_flag_2 is used to indicate the status of a component in duty calculation nom_flag_4 is used to indicate the status of a component in ELC calculation nom_flag_5 is used to indicate the status of a component in ALC calculation i.e. these 3 flags can not be used for any other purposes if ALC is turned on. |
| 18 | NOM_FLAG_3 |  |  |  | VARCHAR (1 ) | See description for nom_flag_1. |
| 19 | NOM_FLAG_4 |  |  |  | VARCHAR (1 ) | See description for nom_flag_1. If ALC is turned on (i.e. system_options.import_ind = Y), nom_flag_2 is used to indicate the status of a component in duty calculation nom_flag_4 is used to indicate the status of a component in ELC calculation nom_flag_5 is used to indicate the status of a component in ALC calculation i.e. these 3 flags can not be used for any other purposes if ALC is turned on. |
| 20 | NOM_FLAG_5 |  |  |  | VARCHAR (1 ) | See description for nom_flag_1. If ALC is turned on (i.e. system_options.import_ind = Y), nom_flag_2 is used to indicate the status of a component in duty calculation nom_flag_4 is used to indicate the status of a component in ELC calculation nom_flag_5 is used to indicate the status of a component in ALC calculation i.e. these 3 flags can not be used for any other purposes if ALC is turned on. |
| 21 | CREATE_ID |  |  |  | VARCHAR (30) | Indicates the user that created the record. |
| 22 | CREATE_DATETIME |  |  |  | Date | Indicates the date the record was created. |
| 23 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | Indicates the user that last updated the record. |
| 24 | LAST_UPD_DATETIME |  |  |  | Date | Indicates the date the record was last updated. |

---

## Table: SVC_OTB

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in OTB.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | DEPT |  |  |  | NUMERIC (4) | Contains the department number for the Open To Buy budget. |
| 7 | CLASS |  |  |  | NUMERIC (4) | Contains the class number for the Open To Buy budget. |
| 8 | SUBCLASS |  |  |  | NUMERIC (4) | Contains the subclass number for the Open To Buy budget. |
| 9 | EOW_DATE |  |  |  | Date | Contains the last day of the week the Open To Buy budget. |
| 10 | N_BUDGET_AMT |  |  |  | NUMERIC (20,4) | Contains the total Open to Buy budget amount for non-replenishment orders (N/B type orders) for that subclass in the period. This field is stored in the primary currency. |
| 11 | B_BUDGET_AMT |  |  |  | NUMERIC (20,4) | Contains the total Open to Buy budget amount for system-generated replenishment with buyer approval orders (BRB type orders) for that subclass in the period. This field is stored in the primary currency. |
| 12 | A_BUDGET_AMT |  |  |  | NUMERIC (20,4) | Contains the total Open to Buy budget amount for automatic replenishment orders (ARB type orders) for that subclass in the period. This field is stored in the primary currency. |
| 13 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 14 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 15 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 16 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_OUTLOC

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in OUTLOC.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | OUTLOC_TYPE |  |  |  | VARCHAR (6 ) | This field holds the type of location, e.g., Discharge Port (DP) or Port of Lading (PL). |
| 7 | OUTLOC_ID |  |  |  | VARCHAR (5 ) | This is a unique location identification used so that the location can be referenced in other modules. |
| 8 | OUTLOC_DESC |  |  |  | VARCHAR (150 ) | A description or name of the location. |
| 9 | OUTLOC_CURRENCY |  |  |  | VARCHAR (3 ) | The currency code associated with the Outside Location. |
| 10 | OUTLOC_ADD1 |  |  |  | VARCHAR (240 ) | The street address of the location. |
| 11 | OUTLOC_ADD2 |  |  |  | VARCHAR (240 ) | The second line of a street address. |
| 12 | OUTLOC_CITY |  |  |  | VARCHAR (120 ) | This field holds the name of the city where the location exists. |
| 13 | OUTLOC_STATE |  |  |  | VARCHAR (3 ) | The name of the state where the location exists. |
| 14 | OUTLOC_COUNTRY_ID |  |  |  | VARCHAR (3 ) | The field holds the three letter code of the country where the location exists. |
| 15 | OUTLOC_POST |  |  |  | VARCHAR (30 ) | The postal code for the area where the location exists. |
| 16 | OUTLOC_VAT_REGION |  |  |  | NUMERIC (4) | Contains the unique identifying number for the VAT region in the system. |
| 17 | CONTACT_NAME |  |  |  | VARCHAR (120 ) | The name of a person that may be contacted at the particular location. |
| 18 | CONTACT_PHONE |  |  |  | VARCHAR (20 ) | The phone number of the contact person. |
| 19 | CONTACT_FAX |  |  |  | VARCHAR (20 ) | The fax number of the contact person. |
| 20 | CONTACT_TELEX |  |  |  | VARCHAR (20 ) | The telex number of the contact person. |
| 21 | CONTACT_EMAIL |  |  |  | VARCHAR (100 ) | The email address of the contact person. |
| 22 | PRIMARY_IND |  |  |  | VARCHAR (1 ) | Applicable only when outloc_type=CZ. Indicates if the current clearing zone is primary for the import country. |
| 23 | OUTLOC_NAME_SEC |  |  |  | VARCHAR (150 ) | Contains the secondary name of the outside location. |
| 24 | OUTLOC_JUR_CODE |  |  |  | VARCHAR (10 ) | Identifies the jurisdiction code for the country-state relationship. |
| 25 | CREATE_ID |  |  |  | VARCHAR (30 ) | This column holds the User id of the user who created the record. |
| 26 | CREATE_DATETIME |  |  |  | Date | This column holds the record creation date. |
| 27 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 28 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_OUTLOC_TL

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in OUTLOC_TL.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 BYTE) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 BYTE) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | LANG |  |  |  | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 7 | OUTLOC_TYPE |  |  |  | VARCHAR (6 BYTE) | This field holds the type of location, e.g., Discharge Port (DP) or Port of Lading (PL) |
| 8 | OUTLOC_ID |  |  |  | VARCHAR (5 BYTE) | This is a unique location identification used so that the location can be referenced in other modules. |
| 9 | OUTLOC_DESC |  |  |  | VARCHAR (150 BYTE) | A description or name of the location. |
| 10 | OUTLOC_ADD1 |  |  |  | VARCHAR (240 BYTE) | The street address of the location. |
| 11 | OUTLOC_ADD2 |  |  |  | VARCHAR (240 BYTE) | The second line of a street address. |
| 12 | OUTLOC_CITY |  |  |  | VARCHAR (120 BYTE) | This field holds the name of the city where the location exists. |
| 13 | CONTACT_NAME |  |  |  | VARCHAR (120 BYTE) | The name of a person that may be contacted at the particular location. |
| 14 | OUTLOC_NAME_SECONDARY |  |  |  | VARCHAR (150 BYTE) | Contains the secondary name of the outside location. |

---

## Table: SVC_PACKITEM

**Description:** This is the staging table for Item Induction module. It is used to temporarily hold data before it is uploaded/updated in PACKITEM

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The data for a process is split in multiple chunks. The Chunk information is present in SVC_PROCESS_CHUNKS. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | PACK_NO |  |  |  | VARCHAR (25) | Identifies the pack for which details are held in this table. |
| 7 | SEQ_NO |  |  |  | NUMERIC (4) | Contains a sequence number used to uniquely identify a row in this table. |
| 8 | ITEM |  |  |  | VARCHAR (25) | Identifies the component item within the pack. If pack item is created using a pack template, this field is null. |
| 9 | ITEM_PARENT |  |  |  | VARCHAR (25) | Contains the parent item (if any) associated with the component item of the pack or the pack template. |
| 10 | PACK_TMPL_ID |  |  |  | NUMERIC (8) | Contains the pack template ID associated with the pack item. |
| 11 | PACK_QTY |  |  |  | NUMERIC (12,4) | Contains the quantity of component items within the pack. |
| 12 | CREATE_ID |  |  |  | VARCHAR (30) | User who created the record. |
| 13 | CREATE_DATETIME |  |  |  | Date | Date/timestamp of when record the record was created. |
| 14 | LAST_UPD_ID |  |  |  | VARCHAR (30) | User who last updated the record. |
| 15 | LAST_UPD_DATETIME |  |  |  | Date | Date/timestamp when the record was last updated. |

---

## Table: SVC_PHASES

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in PHASES.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | SEASON_ID |  |  |  | NUMERIC (3) | This field contains the unique identifier for season that the phase is part of. |
| 7 | PHASE_ID |  |  |  | NUMERIC (3) | This field contains the identifier for phase. This number is not unique without the associated season identifier. |
| 8 | PHASE_DESC |  |  |  | VARCHAR (120 ) | This field holds the description of the phase. |
| 9 | START_DATE |  |  |  | Date | This field holds the starting date of the phase. |
| 10 | END_DATE |  |  |  | Date | This field holds the ending date of the phase. |
| 11 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 12 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 13 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 14 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_PHASES_TL

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in PHASES_TL.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 BYTE) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 BYTE) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | LANG |  |  |  | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 7 | SEASON_ID |  |  |  | NUMERIC (3) | This field contains the unique identifier for season that the phase is part of. |
| 8 | PHASE_ID |  |  |  | NUMERIC (3) | This field contains the identifier for phase. This number is not unique without the associated season identifier. |
| 9 | PHASE_DESC |  |  |  | VARCHAR (120 BYTE) | This field holds the description of the phase. |

---

## Table: SVC_POSUPLD_CONS_HELPER_GTT

**Description:** Consignment working table. Holds lookup data needed to process a consignment sale.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | POSUPLD_CONSIGNMENT_HELPER_ID |  |  | Y | NUMERIC (10) | A unique key for each record in the POSUPLD_ CONSIGNMENT_HELPER table. |
| 2 | POSUPLD_LINE_ITEM_ID |  |  | Y | NUMERIC (10) | A unique key for each record in the SVC_POSUPLD_LINE_ITEM_GTT table. |
| 3 | SALES_PROCESS_ID |  |  | Y | NUMERIC (10) | A unique key for each input file. |
| 4 | SALES_THEAD_ID |  |  | Y | NUMERIC (10) | A unique key for each THEAD record from the input file. |
| 5 | TRAN_TYPE |  |  |  | VARCHAR (1) | Transaction type code to specify whether transaction is a sale or a return; S - sales, R - return. |
| 6 | SALES_SIGN |  |  |  | NUMERIC (2) | Specifies if sales is 'P'ositive or 'N'egative. |
| 7 | IM_ITEM |  |  |  | VARCHAR (25) | Item value. |
| 8 | IM_PACK_IND |  |  |  | VARCHAR (1) | Item pack indicator. |
| 9 | IM_DEPT |  |  |  | NUMERIC (4) | Item department value. |
| 10 | IM_CLASS |  |  |  | NUMERIC (4) | Item class value. |
| 11 | IM_SUBCLASS |  |  |  | NUMERIC (4) | Item subclass value. |
| 12 | LOC_VALUE |  |  |  | NUMERIC (10) | Store identifier. |
| 13 | IS_SUPPLIER |  |  |  | NUMERIC (10) | Supplier of the item. |
| 14 | IS_CONSIGNMENT_RATE |  |  |  | NUMERIC (12,4) | Rate for an item under consignment relationship. |
| 15 | SUPS_CURRENCY_CODE |  |  |  | VARCHAR (3) | Currency Code used by the supplier. |
| 16 | SUPS_TERMS |  |  |  | VARCHAR (15) | Contains the sales terms of the supplier associated with the investment buy opportunity. |
| 17 | SUPS_EDI_SALES_RPT_FREQ |  |  |  | VARCHAR (1) | This field contains the EDI sales report frequency for this supplier. Valid values are: D - Sales and stock information will be downloaded daily W - Sales and stock information will be downloaded weekly |
| 18 | SUPS_RET_COURIER |  |  |  | VARCHAR (250) | Contains the name of the courier that should be used for all returns to the supplier. |
| 19 | SUPS_HANDLING_PCT |  |  |  | NUMERIC (12,4) | Percentage multiplied by the total order cost to determine the handling cost for the return. |
| 20 | SUPS_RET_ALLOW_IND |  |  |  | VARCHAR (1) | Indicates whether or not the supplier will accept returns. |
| 21 | SUPS_AUTO_APPR_INVC_IND |  |  |  | VARCHAR (1) | Indicates whether or not the suppliers invoice matches can be automatically approved for payment. |
| 22 | TERMS_PERCENT |  |  |  | NUMERIC (12,4) | Contains the percent of discount if payment is made within the specified time frame. |
| 23 | VI_VAT_CODE |  |  |  | VARCHAR (6) | VAT code associated to the item. |
| 24 | VI_VAT_RATE |  |  |  | NUMERIC (20,10) | VAT rate applied to an item. |
| 25 | TERMS_DUEDAYS |  |  |  | NUMERIC (3) | Contains the number of days until payment is due. |
| 26 | EOW_DATE |  |  |  | Date | Current End of Week Date |
| 27 | EOM_DATE |  |  |  | Date | Current End of Month Date |
| 28 | PO_INVC_DATE |  |  |  | Date | Based on the values of EDI sales report frequency for this supplier, to determine the invoice date: D and P - current vdate W - end of week date M - end of month date |
| 29 | SALES_VALUE_WITHOUT_VAT |  |  |  | NUMERIC (24,4) | VAT exclusive sales value |
| 30 | TOTAL_WASTAGE_QTY |  |  |  | NUMERIC (12,4) | Total number of wastage quantity for an item sold or returned. |
| 31 | ORDER_NO |  |  |  | NUMERIC (12) | Order number associated with a consignment. |
| 32 | EXISTING_ORDER_IND |  |  |  | VARCHAR (1) | Indicates if an order is associated with a consignment. |
| 33 | RTV_ORDER_NO |  |  |  | NUMERIC (10) | RTV order number associated with the consignement. |
| 34 | EXISTING_RTV_IND |  |  |  | VARCHAR (1) | Indicates if an RTV order is associated with a consignment. |
| 35 | INVC_ID |  |  |  | NUMERIC (10) | Invoice number associated with a consignment order. |
| 36 | EXISTING_INVC_IND |  |  |  | VARCHAR (1) | Indicates if an invoice is associated with a consignment order. |
| 37 | TOTAL_UNIT_COST_LOC |  |  |  | NUMERIC (20,6) | Total Unit Cost associated for item at a particular location. |
| 38 | TOTAL_AV_COST_LOC |  |  |  | NUMERIC (20,6) | Total Average Cost associated for item at a particular location. |
| 39 | CHUNK_ID |  |  | Y | NUMERIC (10) | A unique key for each chunk to be processed as one unit. |

---

## Table: SVC_POSUPLD_DSD_HELPER_GTT

**Description:** Daily sales discount working table. Used to help in the population of DAILY_SALES_DISCOUNT rows resulting from the sale.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SALES_PROCESS_ID |  |  | Y | NUMERIC (10) | A unique key for each input file. |
| 2 | ITEM |  |  |  | VARCHAR (25) | Item identifier |
| 3 | STORE |  |  |  | NUMERIC (10) | Store location Identifier. |
| 4 | PROM_TYPE |  |  |  | VARCHAR (6) | Type of promotion associated with the sale. |
| 5 | TRAN_TYPE |  |  |  | VARCHAR (1) | Type of transaction - Sales or Returns. |
| 6 | SALES_QTY |  |  |  | NUMERIC (12,4) | Sales Quantity for the item |
| 7 | SALES_RETAIL |  |  |  | NUMERIC (24,6) | Total sales amount value |
| 8 | DISCOUNT_AMT |  |  |  | NUMERIC (24,6) | Total Discount Value applied to the item given the promotion. |
| 9 | EXPECTED_RETAIL |  |  |  | NUMERIC (24,6) | This field contains the retail that RMS expected the item to be sold at. Values are held in the local currency. This field will only contain a value if the promotion is an in-store promotion type. |
| 10 | ACTUAL_RETAIL |  |  |  | NUMERIC (24,6) | This field contains the retail that the item was actually sold at. Values are held in the local currency. This field will only contain a value if the |
| 11 | PROMOTION |  |  |  | NUMERIC (10) | This field contains the promotion that the item was sold under. This field will only contain a value if the promotion is an in-store promotion type. |
| 12 | GROSS_PROFIT_AMT |  |  |  | NUMERIC (24,4) | Captured for each promotional sale. It is calculated as sales retail - cost of sales, where sales retail is the actual retail sold for this item and cost of sales is either av_cost or unit cost depending on system option std_av_ind = A or S, respectively |
| 13 | PROM_COMPONENT |  |  |  | NUMERIC (10) | This field contains the promotion component ID that the item was sold under. |
| 14 | DATA_DATE |  |  |  | Date | This field contains the date on which the discount occurred. |
| 15 | CHUNK_ID |  |  | Y | NUMERIC (10) | A unique key for each chunk to be processed as one unit. |

---

## Table: SVC_POSUPLD_FHEAD_GTT

**Description:** Staging table to hold the FHEAD lines from the posupld input file.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SALES_PROCESS_ID |  |  | Y | NUMERIC (10) | A unique key for each input file. This is automatically generated and is associated per unique run for a specific POSU file. |
| 2 | FDATE |  |  |  | VARCHAR (14) | Date file was written by external system. |
| 3 | LOC_VALUE |  |  |  | VARCHAR (10) | Store Identifier |
| 4 | VAT_INCLUDE |  |  |  | VARCHAR (1) | Determines whether or not the store stores values including vat. Not required but populated by Oracle Retail sales audit |
| 5 | VAT_REGION |  |  |  | VARCHAR (4) | Vat region the given location is in. Not required but populated by Oracle Retail Sales Audit. |
| 6 | CURRENCY_CODE |  |  |  | VARCHAR (3) | Currency of the given location. Not required but populated by Oracle Retail sales audit. |
| 7 | CURRENCY_RTL_DEC |  |  |  | VARCHAR (1) | Number of decimals supported by given currency for retails. Not required but populated by Oracle Retail sales audit. |
| 8 | ERROR_MSG |  |  |  | VARCHAR (255) | Errors encountered for all the record values. |

---

## Table: SVC_POSUPLD_ITEM_DISC_GTT

**Description:** Holds a row for each THEAD line with lookups for data related to the input record. It also holds some aggregation values, for example totals across the TDETL lines that belong to the THEAD record.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | POSUPLD_LINE_ITEM_DISCOUNT_ID |  |  | Y | NUMERIC (10) | A unique key for each record in the SVC_POSUPLD_ITEM_DISC_GTT table. |
| 2 | POSUPLD_LINE_ITEM_ID |  |  | Y | NUMERIC (10) | A unique key for each record in the SVC_POSUPLD_LINE_ITEM_GTT table. |
| 3 | SALES_PROCESS_ID |  |  | Y | NUMERIC (10) | A unique key for each input file. |
| 4 | SALES_THEAD_ID |  |  | Y | NUMERIC (10) | A unique key for each THEAD record from the input file. |
| 5 | SALES_TDETL_ID |  |  | Y | NUMERIC (10) | A unique key for each TDETL record from the input file. |
| 6 | IM_ITEM |  |  |  | VARCHAR (25) | Item Identifier. |
| 7 | PROM_TRAN_TYPE |  |  |  | VARCHAR (6) | Promotion code |
| 8 | PROM_NO |  |  |  | VARCHAR (10) | Promotion number. |
| 9 | SALES_QTY |  |  |  | NUMERIC (12,4) | Sales quantity sold for the promotion |
| 10 | SALES_VALUE |  |  |  | NUMERIC (20,4) | Sales value for the promotion. |
| 11 | DISCOUNT_VALUE |  |  |  | NUMERIC (20,4) | Discount value for the promotion |
| 12 | PROM_COMPONENT |  |  |  | VARCHAR (10) | Links the promotion to additional pricing attributes |
| 13 | SALES_VALUE_WITH_VAT |  |  |  | NUMERIC (24,4) | VAT inclusive sales value |
| 14 | SALES_VALUE_WITHOUT_VAT |  |  |  | NUMERIC (24,4) | VAT exclusive sales value |
| 15 | DISC_AMT_WITH_VAT |  |  |  | NUMERIC (24,4) | VAT inclusive discount amount. |
| 16 | DISC_AMT_WITHOUT_VAT |  |  |  | NUMERIC (24,4) | VAT exclusive discount amount. |
| 17 | PROM_CONSIGNMENT_RATE |  |  |  | NUMERIC (12,4) | Value extracted from RPM the consignment rate |
| 18 | TOTAL_DISC_QTY |  |  |  | NUMERIC (12,4) | Total sales quantity for the promotion. |
| 19 | TOTAL_DISC_AMT_WITH_VAT |  |  |  | NUMERIC (24,4) | Total discount VAT inclusive for the promotion. |
| 20 | TOTAL_DISC_AMT_WITHOUT_VAT |  |  |  | NUMERIC (24,4) | Total discount VAT exclusive for the promotion. |
| 21 | EMP_DISC_AMT_WITH_VAT |  |  |  | NUMERIC (24,4) | Total employee discount VAT inclusive for the promotion. |
| 22 | EMP_DISC_AMT_WITHOUT_VAT |  |  |  | NUMERIC (24,4) | Total employee discount VAT exclusive for the promotion. |
| 23 | CHUNK_ID |  |  | Y | NUMERIC (10) | A unique key for each chunk to be processed as one unit. |

---

## Table: SVC_POSUPLD_LINE_ITEM_GTT

**Description:** Holds a row for each THEAD line with lookups for data related to the input record. It also holds some aggregation values, for example totals across the TDETL lines that belong to the THEAD record.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | POSUPLD_LINE_ITEM_ID |  |  | Y | NUMERIC (10) | A unique key for each record in the table. |
| 2 | SALES_PROCESS_ID |  |  | Y | NUMERIC (10) | A unique key for each input file. |
| 3 | SALES_THEAD_ID |  |  | Y | NUMERIC (10) | A unique key for each THEAD record from the input file. |
| 4 | CHUNK_ID |  |  | Y | NUMERIC (10) | A unique key for each chunk to be processed as one unit. |
| 5 | PACK_NO |  |  |  | VARCHAR (25) | Pack item value. |
| 6 | PACK_COMP_IND |  |  |  | VARCHAR (1) | Pack component indicator. |
| 7 | PACK_COMP_ITEM |  |  |  | VARCHAR (25) | Component item of pack. |
| 8 | PACK_QTY |  |  |  | NUMERIC (12,4) | Pack Quantity |
| 9 | PACK_PRICE_RATIO |  |  |  | NUMERIC (20,10) | Proportional ratio of the component item for a particular pack item. Ratio dependent on the number of components assigned to a particular pack item. |
| 10 | FDATE |  |  |  | Date | Date file was written by external system. |
| 11 | LOC_VALUE |  |  |  | NUMERIC (10) | Store Identifier |
| 12 | TRAN_DATE |  |  |  | Date | Date sale/return transaction was processed at the POS. |
| 13 | ITEM_TYPE |  |  |  | VARCHAR (3) | Item type will be represented as a REF or ITM. |
| 14 | ITEM_VALUE |  |  |  | VARCHAR (25) | Item identifier. |
| 15 | TRAN_TYPE_CHAR |  |  |  | VARCHAR (1) | Transaction type code to specify whether transaction is a sale or a return; S - sales, R - return. |
| 16 | TRAN_TYPE_NUM |  |  |  | NUMERIC (2) | If transaction type is RETURN, this has a value of -1. This has a value of 1 if transaction is SALES. |
| 17 | DROPSHIP_IND |  |  |  | VARCHAR (1) | Indicates whether the transaction is a drop shipment or not. If it is a drop shipment, indicator will be Y. This field is not required, but will be defaulted to N if blank. |
| 18 | SALES_QTY |  |  |  | NUMERIC (12,4) | Total sales quantity * 10000 (4 implied decimal places), number of units sold at a particular location. |
| 19 | SELLING_UOM |  |  |  | VARCHAR (4) | UOM at which this item was sold. |
| 20 | SALES_SIGN_CHAR |  |  |  | VARCHAR (1) | Specifies if sales is 'P'ositive or 'N'egative. |
| 21 | SALES_SIGN_NUM |  |  |  | NUMERIC (2) | Determines if the Total Sales Quantity and Total Sales Value are positive or negative |
| 22 | SALES_VALUE |  |  |  | NUMERIC (20,4) | Total Sales Value * 10000 (4 implied decimal places), sales value, net sales value of goods sold. |
| 23 | LAST_MODIFIED_DATE |  |  |  | Date | 'For VBO future use. Used as timestamp to record last update on this table. |
| 24 | CATCHWEIGHT_IND |  |  |  | VARCHAR (1) | Indicates if the item is a catch weight item. Valid values are Y or NULL. |
| 25 | ACTUALWEIGHT_QTY |  |  |  | NUMERIC (12,4) | Actual Weight Quantity*10000 (4 implied decimal places), the actual weight of the item, only populated if catchweight_ind = Y. |
| 26 | SUBTRANS_TYPE_IND |  |  |  | VARCHAR (1) | Tran type for ReSA Valid values are A, D, NULL. |
| 27 | ST_VAT_INCLUDE_IND |  |  |  | VARCHAR (1) | Determines if store has vat include indicator enabled. |
| 28 | ST_CURRENCY_CODE |  |  |  | VARCHAR (3) | Store Currency Code |
| 29 | ST_STORE_TYPE |  |  |  | VARCHAR (6) | Type of Store |
| 30 | ST_CURRENCY_RTL_DEC |  |  |  | NUMERIC (1) | Number of decimals supported by given currency for retails for a specified store. |
| 31 | ST_CURRENCY_COST_DEC |  |  |  | NUMERIC (1) | Holds the number of decimals supported by the store currency for costs. |
| 32 | ST_VAT_REGION |  |  |  | NUMERIC (4) | VAT region of the store. |
| 33 | IM_ITEM |  |  |  | VARCHAR (25) | Item Identifier. |
| 34 | IM_REF_ITEM |  |  |  | VARCHAR (25) | Reference Item identifier |
| 35 | IM_STATUS |  |  |  | VARCHAR (1) | Status of the item (i.e. Worksheet, Submitted, Approved). |
| 36 | IM_DEPT |  |  |  | NUMERIC (4) | Department in which the item belongs. |
| 37 | IM_CLASS |  |  |  | NUMERIC (4) | Class in which the item belongs. |
| 38 | IM_SUBCLASS |  |  |  | NUMERIC (4) | Subclass in which the item belongs. |
| 39 | IM_PACK_IND |  |  |  | VARCHAR (1) | Item Pack indicator - specifies if item is a pack. |
| 40 | IM_ITEM_LEVEL |  |  |  | NUMERIC (1) | Item Level of an item. |
| 41 | IM_TRAN_LEVEL |  |  |  | NUMERIC (1) | Transaction Level of an item. |
| 42 | IM_STANDARD_UOM |  |  |  | VARCHAR (4) | Standard Unit of Measure of an item. |
| 43 | IM_WASTE_TYPE |  |  |  | VARCHAR (6) | Wastage type of item sold or returned. Not required but populated by Oracle Retail Sales Audit. |
| 44 | IM_WASTE_PCT |  |  |  | NUMERIC (12,6) | Wastage Percent*10000 (4 implied decimal places.), wastage percent of item sold or returned. Not required but populated by Oracle Retail Sales Audit. |
| 45 | IM_INVENTORY_IND |  |  |  | VARCHAR (1) | This indicator is used to determine if an item holds inventory or not. |
| 46 | IM_ITEM_XFORM_IND |  |  |  | VARCHAR (1) | Indicator will show that an item is associated an item transformation. |
| 47 | IM_DEPOSIT_ITEM_TYPE |  |  |  | VARCHAR (6) | This is the deposit item component type. |
| 48 | IM_SELLABLE_IND |  |  |  | VARCHAR (1) | Indicates if the item is sellable. |
| 49 | IM_ORDERABLE_IND |  |  |  | VARCHAR (1) | Indicates if the item is orderable. |
| 50 | DEPS_PURCHASE_TYPE |  |  |  | NUMERIC (1) | Attribute of a department that will specify if it's a regular item, consession or consignment. |
| 51 | CLASS_CLASS_VAT_IND |  |  |  | VARCHAR (1) | Class VAT indictor (class level). Specifies if VAT is being added to the retail of the item on the ITEM_LOC record. |
| 52 | SELLING_UOM_CLASS |  |  |  | VARCHAR (6) | Unit of Measure for sales for a particular class. |
| 53 | UOM_RATIO |  |  |  | NUMERIC (20,6) | Unit of measure ratio used in UOM conversion. |
| 54 | IL_STATUS |  |  |  | VARCHAR (1) | Status of the item at a locaiton. (ITEM_LOC.STATUS). |
| 55 | IL_PRIMARY_SUPP |  |  |  | NUMERIC (10) | The primary supplier of an item at a particular store. |
| 56 | IL_PRIMARY_CNTRY |  |  |  | VARCHAR (3) | Primary country of the item at a particular location. |
| 57 | IL_UNIT_RETAIL |  |  |  | NUMERIC (20,6) | This column contains the unit retail for item at a particular location. |
| 58 | ILS_UNIT_COST |  |  |  | NUMERIC (20,4) | This column contains the unit cost for item at a particular location. |
| 59 | ILS_AV_COST |  |  |  | NUMERIC (20,4) | This column contains the average cost for item at a particular location. |
| 60 | ILS_AVERAGE_WEIGHT |  |  |  | NUMERIC (12,4) | The average simple pack weight for a catch weight simple pack item. |
| 61 | ILS_LAST_HIST_EXPORT_DATE |  |  |  | Date | This field contains most recent date up to which sales/issues have been exported to an external system for the item/store. |
| 62 | VI_VAT_RATE |  |  |  | NUMERIC (20,10) | Holds the denormalized value of the tax rate associated with the line item. |
| 63 | VI_VAT_CODE |  |  |  | VARCHAR (6) | Holds the denormalized value of the tax code associated with the line item. |
| 64 | VI_VAT_AMT |  |  |  | NUMERIC (20,4) | Holds the denormalized value of the total tax amount associated with the line item. |
| 65 | CUM_TAX_PCT |  |  |  | NUMERIC (8,4) | It holds the consolidated tax rate across different tax codes applicable to the item/locations unit retail when the calculation basis is Value. |
| 66 | CUM_TAX_VALUE |  |  |  | NUMERIC (12,10) | Specifies the consolidated tax value across different tax codes applicable to theitem/locations unit retail when the calculation basis is Value (V). |
| 67 | IS_SUPPLIER |  |  |  | NUMERIC (10) | Supplier of the item. |
| 68 | IS_CONSIGNMENT_RATE |  |  |  | NUMERIC (12,4) | Rate for an item under consignment relationship. |
| 69 | IS_CONCESSION_RATE |  |  |  | NUMERIC (12,4) | Rate for an item under concession relationship. |
| 70 | SUPS_CURRENCY_CODE |  |  |  | VARCHAR (3) | Currency Code used by the supplier. |
| 71 | SUPS_TERMS |  |  |  | VARCHAR (15) | Contains the sales terms of the supplier associated with the investment buy opportunity. |
| 72 | SUPS_AUTO_APPR_INVC_IND |  |  |  | VARCHAR (1) | Indicates whether or not the suppliers invoice matches can be automatically approved for payment. |
| 73 | SUPS_EDI_SALES_RPT_FREQ |  |  |  | VARCHAR (1) | This field contains the EDI sales report frequency for this supplier. Valid values are: D - Sales and stock information will be downloaded daily W - Sales and stock information will be downloaded weekly |
| 74 | SUPS_RET_COURIER |  |  |  | VARCHAR (250) | Contains the name of the courier that should be used for all returns to the supplier. |
| 75 | SUPS_HANDLING_PCT |  |  |  | NUMERIC (12,4) | Percentage multiplied by the total order cost to determine the handling cost for the return. |
| 76 | SUPS_RET_ALLOW_IND |  |  |  | VARCHAR (1) | Indicates whether or not the supplier will accept returns. |
| 77 | TERMS_DUEDAYS |  |  |  | NUMERIC (3) | Contains the number of days until payment is due. |
| 78 | TERMS_PERCENT |  |  |  | NUMERIC (12,4) | Contains the percent of discount if payment is made within the specified time frame. |
| 79 | PH_CURR_RETAIL |  |  |  | NUMERIC (20,6) | Current Selling Retail of the item at the PRICE_HIST table. |
| 80 | PH_REG_RETAIL |  |  |  | NUMERIC (20,6) | Regular Retail of the item at the PRICE_HIST table. |
| 81 | PH_PROM_RETAIL |  |  |  | NUMERIC (20,6) | Promotional Retail of the item at the PRICE_HIST table. |
| 82 | PH_PROM_IND |  |  |  | VARCHAR (1) | Promotional Indicator stored at the Price history table. |
| 83 | PH_CLEAR_IND |  |  |  | VARCHAR (1) | Clearance indicator at the price_hist table. |
| 84 | XFORM_SELLABLE_ITEM |  |  |  | VARCHAR (25) | The transformable sellable item associated to an transformed orderable item. |
| 85 | XFORM_PROD_LOSS_PCT |  |  |  | NUMERIC (12,4) | This is the percentage value of wastage of the orderable ingredient during the manufacture of the sellable items. |
| 86 | XFORM_YIELD_PCT |  |  |  | NUMERIC (12,4) | Contains the percentage yield information of the detail item from the header items associated with it |
| 87 | XFORM_ORDERABLE_UNIT_COST |  |  |  | NUMERIC (20,6) | The unit cost associated to the transformable orderable item associated with the transformable sellable item. |
| 88 | CW_NOMINAL_WT |  |  |  | NUMERIC (12,4) | Nominal Weight of the catchweight item. |
| 89 | EOW_DATE |  |  |  | Date | Current End of Week Date |
| 90 | EOW_DATE_454_WEEK |  |  |  | NUMERIC (2) | Week Number for end of week 454 calendar. |
| 91 | EOW_DATE_454_MONTH |  |  |  | NUMERIC (2) | Month Number for end of week 454 calendar. |
| 92 | EOW_DATE_454_YEAR |  |  |  | NUMERIC (4) | Year Number for end of week 454 calendar. |
| 93 | EOM_DATE |  |  |  | Date | Current End of Month Date |
| 94 | EOM_DATE_454_WEEK |  |  |  | NUMERIC (2) | Week number of the end of month date. |
| 95 | EOM_DATE_454_MONTH |  |  |  | NUMERIC (2) | Month number of the end of month in a 454 calendar. |
| 96 | EOM_DATE_454_YEAR |  |  |  | NUMERIC (4) | Year number of the end of month date in a 454 calendar. |
| 97 | SALES_TYPE |  |  |  | VARCHAR (1) | Indicates the type of sale which generated the sales. |
| 98 | SALES_QTY_STD_UOM |  |  |  | NUMERIC (12,4) | Sales Quantity rounded to the standard Unit of Measure |
| 99 | TOTAL_WASTAGE_QTY |  |  |  | NUMERIC (12,4) | Total number of wastage quantity for an item sold or returned. |
| 100 | OLD_RETAIL_WITH_VAT |  |  |  | NUMERIC (24,6) | Old retail with VAT (before applying price change) |
| 101 | OLD_RETAIL_WITHOUT_VAT |  |  |  | NUMERIC (24,6) | Old retail without VAT (before applying price change) |
| 102 | WASTAGE_AMT_WITH_VAT |  |  |  | NUMERIC (24,6) | Total wastage amount (VAT inclusive) |
| 103 | WASTAGE_AMT_WITHOUT_VAT |  |  |  | NUMERIC (24,6) | Total wastage amount (VAT exclusive) |
| 104 | ACTUALWGHT_RETAIL_WITH_VAT |  |  |  | NUMERIC (24,6) | Actual weight retail amount (VAT inclusive) |
| 105 | ACTUALWGHT_RETAIL_WITHOUT_VAT |  |  |  | NUMERIC (24,6) | Actual weight retail amount (VAT exclusive) |
| 106 | SALES_VALUE_WITH_VAT |  |  |  | NUMERIC (24,6) | Total Sales Amount (VAT inclusive) |
| 107 | SALES_VALUE_WITHOUT_VAT |  |  |  | NUMERIC (24,6) | Total Sales Amount (VAT exclusive) |
| 108 | TOTAL_UNIT_COST_LOC |  |  |  | NUMERIC (24,6) | Total Unit Cost associated for item at a particular location. |
| 109 | TOTAL_AV_COST_LOC |  |  |  | NUMERIC (24,6) | Total Average Cost associated for item at a particular location. |
| 110 | GTAX_VALUE |  |  |  | NUMERIC (20,4) | Total VAT amount computed on a GTAX configuration. |
| 111 | GTAX_UNIT_VALUE |  |  |  | NUMERIC (20,4) | Total VAT amount per unit computed on a GTAX configuration. |
| 112 | RESA_SALES_TYPE |  |  |  | VARCHAR (1) | This column indicates whether the line item is a Regular Sale, a customer order serviced by OMS (External CO) or a customer order serviced by a store (In Store CO). Expected values are stored in the CODE_DETAIL table, under the SASY code type. |
| 113 | NO_INV_RET_IND |  |  |  | VARCHAR (1) | This column contains an indicator that identifies a return without inventory. This is generally a non-required column, but in case of Returns, this column is required. Expected values are: Y - Yes, N - No. |
| 114 | RETURN_DISPOSITION |  |  |  | VARCHAR (10) | This column will contain the disposition code published by RWMS as part of the Returns upload to OMS. This will contain a value in case of returns with inventory to a warehouse. OMS will include this disposition code in the RTLOG while creating return transactions for processing by ReSA. When these returns are uploaded in RMS, the specific inventory buckets will be updated based on this value. This is a generally non-required column, but in case of an external customer order return serviced by OMS (i.e. Sales Type = E) and return with inventory (i.e. Return Without Inventory = N) in the virtual store RTLOG, it is required. |
| 115 | RETURN_WH |  |  |  | VARCHAR (10) | This column contains the physical warehouse ID for the warehouse identifier where the item was returned. This is generally not required, but in cases of external customer order returns (i.e. Sales Type= E) it is required. |
| 116 | ERROR_MSG |  |  |  | VARCHAR (255) | Error Message associated with processing this record. |
| 117 | NEW_ITEM_LOC_IND |  |  |  | VARCHAR (1) | This colum indicates if the line item has a newly created item-loc relationship. |

---

## Table: SVC_POSUPLD_LOAD

**Description:** Table where raw POSU file is uploaded. This is populated through the uploadsales.ksh script

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | FILE_TYPE |  |  | Y | VARCHAR (5) | Determines the POSU section in which this is uploaded from. Valid values are FHEAD, THEAD, TTAX, TDETL, TTAIL and FTAIL. |
| 2 | SALES_PROCESS_ID |  |  |  | NUMERIC (10) | A unique key for each input file. |
| 3 | LINE_ID |  |  | Y | NUMERIC (10) | Line Identifier directly derived from POSU file. |
| 4 | LINE_SEQ_ID |  |  | Y | NUMERIC (15) | Line Sequence Identifier which is automatically generated to uniquely identify a line record. |
| 5 | LINE_TEXT |  |  | Y | VARCHAR (199) | The record contents directly uploaded from POSU file. Raw version of POSU file. |
| 6 | THREAD_VAL |  |  |  | NUMERIC (10) | The thread value associated with original POSU file. |
| 7 | FILENAME |  |  |  | VARCHAR (250) | Complete filename for the POSU file uploaded into RMS. |
| 8 | ERROR_MSG |  |  |  | VARCHAR (255) | Error Message associated with this line item. |

---

## Table: SVC_POSUPLD_LOAD_ARCH

**Description:** Contains the historical records of records processed successfully for sales transactions.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | FILE_TYPE |  |  | Y | VARCHAR (5) | Determines the POSU section in which this is uploaded from. Valid values are FHEAD, THEAD, TTAX, TDETL, TTAIL and FTAIL. |
| 2 | SALES_PROCESS_ID |  |  |  | NUMERIC (10) | A unique key for each input file. |
| 3 | LINE_ID |  |  | Y | NUMERIC (10) | Line identifier associated with the raw POSU file uploaded into RMS. |
| 4 | LINE_SEQ_ID |  |  | Y | NUMERIC (15) | Automatically generated line sequence ID to identify a line item for an imported records into the RMS table. |
| 5 | LINE_TEXT |  |  |  | VARCHAR (199) | Raw text from POSU file uploaded. |
| 6 | THREAD_VAL |  |  |  | NUMERIC (10) | Thread number associated with the POSU file uploaded into the system. |
| 7 | FILENAME |  |  |  | VARCHAR (250) | POSU filename |
| 8 | PROCESS_DATE |  |  |  | Date | Date that the sales records were successully processed by the sales batch programs. |

---

## Table: SVC_POSUPLD_NIL

**Description:** This table holds the new items to be ranged from the sales upload.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SALES_PROCESS_ID |  |  |  | NUMERIC (10) | The process id for the specific sales upload file. |
| 2 | ITEM |  |  |  | VARCHAR (25 ) | The item to be ranged. |
| 3 | LOC |  |  |  | NUMERIC (10) | The location where the item will be ranged. |

---

## Table: SVC_POSUPLD_REJ_RECS

**Description:** This table will hold all rejected records as a result of the sales batch processing.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | FILE_TYPE |  |  |  | VARCHAR (5) | Determines the POSU section in which this is uploaded from. Valid values are FHEAD, THEAD, TTAX, TDETL, TTAIL and FTAIL. |
| 2 | SALES_PROCESS_ID |  |  |  | NUMERIC (10) | A unique key for each input file. |
| 3 | LINE_SEQ_ID |  |  |  | NUMERIC (15) | The line sequence number that dictates the chronological order of the file. This will be followed in generating the reject file. |
| 4 | CHUNK_ID |  |  |  | NUMERIC (10) | A unique key for each chunk to be processed as one unit. |
| 5 | LINE_TEXT |  |  |  | VARCHAR (199) | The raw data contained on the original POSU file. |
| 6 | FILENAME |  |  |  | VARCHAR (250) | This is the original filename used to upload the data into the RMS database. |
| 7 | ERROR_MSG |  |  |  | VARCHAR (255) | Error Message for the current item being processed. |
| 8 | REJECT_DATE |  |  |  | Date | This column indicates the date that the sales records were rejected by the system. |

---

## Table: SVC_POSUPLD_STAGING

**Description:** This table holds the records coming from v_svc_posupld_load view for processing.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | FILE_TYPE |  |  | Y | VARCHAR (5) | File type of the record associated with the POSU file uploaded. Valid values include FHEAD, THEAD, TTAX, TDETL, TTAIL, FTAIL. |
| 2 | FILENAME |  |  |  | VARCHAR (250) | POSU filename |
| 3 | LINE_SEQ_ID |  |  | Y | NUMERIC (15) | Automatically generated line sequence ID to identify a line item for an imported records into the RMS table. |
| 4 | THREAD_VAL |  |  |  | NUMERIC (10) | Thread number associated with the POSU file uploaded into the system. |
| 5 | SALES_PROCESS_ID |  |  |  | NUMERIC (10) | A unique key for each input file. |
| 6 | CHUNK_ID |  |  |  | NUMERIC (10) | A unique key for each chunk to be processed as one unit |
| 7 | THEAD_ID |  |  |  | NUMERIC (10) | A unique id for a specific THEAD |
| 8 | HEAD_DETL_ID |  |  |  | NUMERIC (10) | Links the thead id with the tdetl id. |
| 9 | TTAX_ID |  |  |  | NUMERIC (10) | A unique id for a TTAX line. |
| 10 | TDETL_ID |  |  |  | NUMERIC (10) | A unique id for a tdetl |
| 11 | COL_1 |  |  |  | VARCHAR (56) | Column to hold delimited data from the file. |
| 12 | COL_2 |  |  |  | VARCHAR (40) | Column to hold delimited data from the file. |
| 13 | COL_3 |  |  |  | VARCHAR (100) | Column to hold delimited data from the file. |
| 14 | COL_4 |  |  |  | VARCHAR (80) | Column to hold delimited data from the file. |
| 15 | COL_5 |  |  |  | VARCHAR (80) | Column to hold delimited data from the file. |
| 16 | COL_6 |  |  |  | VARCHAR (40) | Column to hold delimited data from the file. |
| 17 | COL_7 |  |  |  | VARCHAR (4) | Column to hold delimited data from the file. |
| 18 | COL_8 |  |  |  | VARCHAR (4) | Column to hold delimited data from the file. |
| 19 | COL_9 |  |  |  | VARCHAR (4) | Column to hold delimited data from the file. |
| 20 | COL_10 |  |  |  | VARCHAR (24) | Column to hold delimited data from the file. |
| 21 | COL_11 |  |  |  | VARCHAR (48) | Column to hold delimited data from the file. |
| 22 | COL_12 |  |  |  | VARCHAR (4) | Column to hold delimited data from the file. |
| 23 | COL_13 |  |  |  | VARCHAR (4) | Column to hold delimited data from the file. |
| 24 | COL_14 |  |  |  | VARCHAR (48) | Column to hold delimited data from the file. |
| 25 | COL_15 |  |  |  | VARCHAR (16) | Column to hold delimited data from the file. |
| 26 | COL_16 |  |  |  | VARCHAR (4) | Column to hold delimited data from the file. |
| 27 | COL_17 |  |  |  | VARCHAR (80) | Column to hold delimited data from the file. |
| 28 | COL_18 |  |  |  | VARCHAR (56) | Column to hold delimited data from the file. |
| 29 | COL_19 |  |  |  | VARCHAR (4) | Column to hold delimited data from the file. |
| 30 | COL_20 |  |  |  | VARCHAR (48) | Column to hold delimited data from the file. |
| 31 | COL_21 |  |  |  | VARCHAR (4) | Column to hold delimited data from the file. |
| 32 | COL_22 |  |  |  | VARCHAR (80) | Column to hold delimited data from the file. |
| 33 | COL_23 |  |  |  | VARCHAR (1) | This will hold the SALES_TYPE value. |
| 34 | COL_24 |  |  |  | VARCHAR (1) | This will hold the NO_INV_RET_IND value. |
| 35 | COL_25 |  |  |  | VARCHAR (10) | This will hold the RETURN_DISPOSITION value. |
| 36 | COL_26 |  |  |  | VARCHAR (10) | This will hold the RETURN_WH value. |
| 37 | ERROR_MSG |  |  |  | VARCHAR (255) | All the errors in a given record. |
| 38 | LOCATION |  |  |  | NUMERIC (10) | This column has Location ID of the POSU file. |

---

## Table: SVC_POSUPLD_STAGING_REJ

**Description:** This table holds the records coming from v_svc_posupld_load view for processing.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | FILE_TYPE |  |  | Y | VARCHAR (5 ) | File type of the record associated with the POSU file uploaded. Valid values include (FHEAD,THEAD, TDETL). |
| 2 | FILENAME |  |  |  | VARCHAR (250 ) | POSU filename |
| 3 | LINE_SEQ_ID |  |  | Y | NUMERIC (15) | Automatically generated line sequence ID to identify a line item for an imported records into the RMS table. |
| 4 | THREAD_VAL |  |  |  | NUMERIC (10) | Thread number associated with the POSU file uploaded into the system. |
| 5 | LOCATION |  |  |  | NUMERIC (10) | Location ID of the store to which the POSU file belongs to. |
| 6 | SALES_PROCESS_ID |  |  |  | NUMERIC (10) | A unique key for each input file. |
| 7 | CHUNK_ID |  |  |  | NUMERIC (10) | A unique key for each chunk to be processed as one unit. |
| 8 | THEAD_ID |  |  |  | NUMERIC (10) | A unique id for a specific THEAD. |
| 9 | HEAD_DETL_ID |  |  |  | NUMERIC (10) | Links the thead id with the tdetl id. |
| 10 | TDETL_ID |  |  |  | NUMERIC (10) | A unique id for a TDETL. |
| 11 | COL_1 |  |  |  | VARCHAR (56 ) | Column to hold delimited data from the file. |
| 12 | COL_2 |  |  |  | VARCHAR (40 ) | Column to hold delimited data from the file. |
| 13 | COL_3 |  |  |  | VARCHAR (100 ) | Column to hold delimited data from the file. |
| 14 | COL_4 |  |  |  | VARCHAR (80 ) | Column to hold delimited data from the file. |
| 15 | COL_5 |  |  |  | VARCHAR (80 ) | Column to hold delimited data from the file. |
| 16 | COL_6 |  |  |  | VARCHAR (40 ) | Column to hold delimited data from the file. |
| 17 | COL_7 |  |  |  | VARCHAR (4 ) | Column to hold delimited data from the file. |
| 18 | COL_8 |  |  |  | VARCHAR (4 ) | Column to hold delimited data from the file. |
| 19 | COL_9 |  |  |  | VARCHAR (4 ) | Column to hold delimited data from the file. |
| 20 | COL_10 |  |  |  | VARCHAR (24 ) | Column to hold delimited data from the file. |
| 21 | COL_11 |  |  |  | VARCHAR (48 ) | Column to hold delimited data from the file. |
| 22 | COL_12 |  |  |  | VARCHAR (4 ) | Column to hold delimited data from the file. |
| 23 | COL_13 |  |  |  | VARCHAR (4 ) | Column to hold delimited data from the file. |
| 24 | COL_14 |  |  |  | VARCHAR (48 ) | Column to hold delimited data from the file. |
| 25 | COL_15 |  |  |  | VARCHAR (16 ) | Column to hold delimited data from the file. |
| 26 | COL_16 |  |  |  | VARCHAR (4 ) | Column to hold delimited data from the file. |
| 27 | COL_17 |  |  |  | VARCHAR (80 ) | Column to hold delimited data from the file. |
| 28 | COL_18 |  |  |  | VARCHAR (56 ) | Column to hold delimited data from the file. |
| 29 | COL_19 |  |  |  | VARCHAR (4 ) | Column to hold delimited data from the file. |
| 30 | COL_20 |  |  |  | VARCHAR (48 ) | Column to hold delimited data from the file. |
| 31 | COL_21 |  |  |  | VARCHAR (4 ) | Column to hold delimited data from the file. |
| 32 | COL_22 |  |  |  | VARCHAR (80 ) | Column to hold delimited data from the file. |
| 33 | COL_23 |  |  |  | VARCHAR (1 ) | This will hold the SALES_TYPE value. |
| 34 | COL_24 |  |  |  | VARCHAR (1 ) | This will hold the NO_INV_RET_IND value. |
| 35 | COL_25 |  |  |  | VARCHAR (10 ) | This will hold the RETURN_DISPOSITION value. |
| 36 | COL_26 |  |  |  | VARCHAR (10 ) | This will hold the RETURN_WH value. |
| 37 | ERROR_MSG |  |  |  | VARCHAR (255 ) | All the errors in a given record. |
| 38 | TTAX_ID |  |  |  | NUMERIC (10) | A unique id for a TTAX line. |

---

## Table: SVC_POSUPLD_STATUS

**Description:** This table holds the status of each chunk being processed.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | REFERENCE_ID |  |  |  | VARCHAR (50) | Holds the POSU file name. |
| 2 | THREAD_VAL |  |  |  | NUMERIC (10) | Holds the thread value for the record. |
| 3 | PROCESS_ID |  |  |  | NUMERIC (10) | A unique key for each input file. |
| 4 | CHUNK_ID |  |  |  | NUMERIC (10) | A unique key for each chunk to be processed as one unit. |
| 5 | STATUS |  |  |  | VARCHAR (1) | Holds the status of the chunk per process id. N - not started, R - has rejected lines, E - error raised. No processing happened with the chunk. |
| 6 | ERROR_MSG |  |  |  | VARCHAR (255) | Error Message for the current item being processed. |
| 7 | LAST_UPDATE_DATETIME |  |  |  | Date | Timestamp when the record was last updated. |
| 8 | LOCATION |  |  |  | NUMERIC (10) | This column has Location ID of the POSU file. |

---

## Table: SVC_POSUPLD_TDETL_GTT

**Description:** Staging table to hold the TDETL lines from the posupld input file.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SALES_PROCESS_ID |  |  | Y | NUMERIC (10) | A unique key for each input file. |
| 2 | SALES_THEAD_ID |  |  | Y | NUMERIC (10) | A unique key for each THEAD record from the input file. |
| 3 | SALES_TDETL_ID |  |  | Y | NUMERIC (10) | A unique key for each TDETL record from the input file. |
| 4 | PROM_TRAN_TYPE |  |  |  | VARCHAR (6) | Code for promotional type from code_detail, code_type = PRMT. |
| 5 | PROM_NO |  |  |  | VARCHAR (10) | Promotion number from the RPM.' |
| 6 | SALES_QTY |  |  |  | VARCHAR (12) | Sales quantity*10000 (4 implied decimal places.), number of units sold in this prom type. |
| 7 | SALES_VALUE |  |  |  | VARCHAR (20) | Sales value*10000 (4 implied decimal places.), value of units sold in this prom type. |
| 8 | DISCOUNT_VALUE |  |  |  | VARCHAR (20) | Discount quantity*10000 (4 implied decimal places.), value of discount given in this prom type. |
| 9 | PROM_COMPONENT |  |  |  | VARCHAR (10) | Links the promotion to additional pricing attributes. |
| 10 | ERROR_MSG |  |  |  | VARCHAR (255) | Error message for invalid records at TDETL line. |
| 11 | CHUNK_ID |  |  | Y | NUMERIC (10) | A unique key for each chunk to be processed as one unit. |

---

## Table: SVC_POSUPLD_THEAD_GTT

**Description:** Staging table to hold the THEAD lines from the posupld input file.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SALES_PROCESS_ID |  |  | Y | NUMERIC (10) | A unique key for each run of the process for a specific input file. |
| 2 | SALES_THEAD_ID |  |  | Y | NUMERIC (10) | A unique key for each THEAD record from the input file. |
| 3 | CHUNK_ID |  |  | Y | NUMERIC (10) | A unique key for each chunk to be processed as one unit |
| 4 | RUN_SEQ |  |  | Y | NUMERIC (10) | The sequence to be followed in processing the records. |
| 5 | TRAN_DATE |  |  |  | VARCHAR (14) | Date sale/return transaction was processed at the POS. |
| 6 | ITEM_TYPE |  |  |  | VARCHAR (3) | Item type will be represented as a REF (subtransaction level) or ITM (transaction item). |
| 7 | ITEM_VALUE |  |  |  | VARCHAR (25) | The item number of an ITM or REF. |
| 8 | DEPT |  |  |  | VARCHAR (4) | Department of an item sold or returned. Not required but populated by Oracle Retail Sales Audit. |
| 9 | CLASS |  |  |  | VARCHAR (4) | Class of item sold or returned. Not required but populated by Oracle Retail Sales Audit. |
| 10 | SUBCLASS |  |  |  | VARCHAR (4) | Subclass of item sold or returned. Not required but populated by Oracle Retail Sales Audit. |
| 11 | PACK_IND |  |  |  | VARCHAR (1) | Pack indicator of item sold or returned. Not required but populated by Oracle Retail Sales Audit. |
| 12 | ITEM_LEVEL |  |  |  | VARCHAR (1) | Item level of item sold or returned. Not required but populated by Oracle Retail Sales Audit. |
| 13 | TRAN_LEVEL |  |  |  | VARCHAR (1) | Tran level of item sold or returned. Not required but populated by Oracle Retail Sales Audit. |
| 14 | WASTE_TYPE |  |  |  | VARCHAR (6) | Wastage type of item sold or returned. Not required but populated by Oracle Retail Sales Audit. |
| 15 | WASTE_PCT |  |  |  | VARCHAR (12) | Wastage Percent*10000 (4 implied decimal places.), wastage percent of item sold or returned. Not required but populated by Oracle Retail Sales Audit. |
| 16 | TRAN_TYPE |  |  |  | VARCHAR (1) | Transaction type code to specify whether transaction is a sale or a return; 'S'- sales, 'R'- return. |
| 17 | DROPSHIP_IND |  |  |  | VARCHAR (1) | Indicates whether the transaction is a drop shipment or not. If it is a drop shipment, indicator will be Y. This field is not required, but will be defaulted to N if blank. |
| 18 | SALES_QTY |  |  |  | VARCHAR (12) | Total sales quantity * 10000 (4 implied decimal places), number of units sold at a particular location. |
| 19 | SELLING_UOM |  |  |  | VARCHAR (4) | UOM at which this item was sold. |
| 20 | SALES_SIGN |  |  |  | VARCHAR (1) | Determines if the Total Sales Quantity and Total Sales Value are positive or negative. |
| 21 | SALES_VALUE |  |  |  | VARCHAR (20) | Total Sales Value * 10000 (4 implied decimal places), sales value, net sales value of goods sold. |
| 22 | LAST_MODIFIED_DATE |  |  |  | VARCHAR (14) | For VBO future use. This is used to accoun for timestamp when records was modified. |
| 23 | CATCHWEIGHT_IND |  |  |  | VARCHAR (1) | Indicates if the item is a catch weight item. Valid values are Y or NULL. |
| 24 | ACTUALWEIGHT_QTY |  |  |  | VARCHAR (12) | Actual Weight Quantity*10000 (4 implied decimal places), the actual weight of the item, only populated if catchweight_ind = Y. |
| 25 | SUBTRANS_TYPE_IND |  |  |  | VARCHAR (1) | Tran type for ReSA Valid values are A, D, NULL. |
| 26 | GTAX_VALUE |  |  |  | VARCHAR (20) | Total gtax value goods sold or returned. |
| 27 | RESA_SALES_TYPE |  |  |  | VARCHAR (1) | This column indicates whether the line item is a Regular Sale, a customer order serviced by OMS (External CO) or a customer order serviced by a store (In Store CO). Expected values are stored in the CODE_DETAIL table, under the SASY code type. |
| 28 | NO_INV_RET_IND |  |  |  | VARCHAR (1) | This column contains an indicator that identifies a return without inventory. This is generally a non-required column, but in case of Returns, this column is required. Expected values are: Y - Yes, N - No |
| 29 | RETURN_DISPOSITION |  |  |  | VARCHAR (10) | This column will contain the disposition code published by RWMS as part of the Returns upload to OMS. This will contain a value in case of returns with inventory to a warehouse. OMS will include this disposition code in the RTLOG while creating return transactions for processing by ReSA. When these returns are uploaded in RMS, the specific inventory buckets will be updated based on this value. This is a generally non-required column, but in case of an external customer order return serviced by OMS (i.e. Sales Type = E) and return with inventory (i.e. Return Without Inventory = N) in the virtual store RTLOG, it is required. |
| 30 | RETURN_WH |  |  |  | VARCHAR (10) | This column contains the physical warehouse ID for the warehouse identifier where the item was returned. This is generally not required, but in cases of external customer order returns (i.e. Sales Type= E) it is required. |
| 31 | ERROR_MSG |  |  |  | VARCHAR (255) | All the errors of any of the records values. |

---

## Table: SVC_POSUPLD_THREAD_LOOKUP

**Description:** Helper table used by the uploadsales.ksh batch program that contains values used for validation of inputted parameters for the batch run.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | THREAD_ID |  |  |  | NUMERIC (10) | This is the thread value based on the file suffix of the POSU file. This will pertain to the thread number recommended from ReSA. |
| 2 | FILENAME |  |  |  | VARCHAR (250) | POSU filename that contains sales item information such as store, item, sales quantity and amount. |
| 3 | SALES_PROCESS_ID |  |  |  | NUMERIC (10) | System generated sales process ID that will uniquely identiy the sales batch data that will be used for salesprocess.ksh processing. |

---

## Table: SVC_POSUPLD_TTAX_GTT

**Description:** This sales upload staging table holds the transaction level tax prorated to items based on the item's total discounted retail value. The data is populated based on the TTAX lines in a POSU file.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SALES_PROCESS_ID |  |  | Y | NUMERIC (10) | A unique key for each input POSU file. |
| 2 | SALES_THEAD_ID |  |  | Y | NUMERIC (10) | A unique key for each THEAD record from the input file. This holds a reference back to the THEAD line the TTAX line belongs to. |
| 3 | SALES_TTAX_ID |  |  | Y | NUMERIC (10) | A unique key for each TTAX record from the input file. |
| 4 | TAX_CODE |  |  |  | VARCHAR (6) | Holds the tax code. |
| 5 | TAX_RATE |  |  |  | VARCHAR (20) | Holds the tax rate for the tax code. |
| 6 | TAX_AMT |  |  |  | VARCHAR (20) | Holds the total tax amount for the tax code. |
| 7 | ERROR_MSG |  |  |  | VARCHAR (255) | Error message for invalid records at TTAX line. |
| 8 | CHUNK_ID |  |  | Y | NUMERIC (10) | A unique key for each chunk to be processed as one unit. |

---

## Table: SVC_POS_TENDER_TYPE_HEAD

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in POS_TENDER_TYPE_HEAD.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | TENDER_TYPE_ID |  |  |  | NUMERIC (6) | Contains the code which uniquely identifies the tender type. |
| 7 | TENDER_TYPE_DESC |  |  |  | VARCHAR (120 ) | Contains the description of the tender type. |
| 8 | TENDER_TYPE_GROUP |  |  |  | VARCHAR (6 ) | Contains the tender type classification. |
| 9 | EFFECTIVE_DATE |  |  |  | Date | Contains the date the tender type is first effective. |
| 10 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 11 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 12 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 13 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_POS_TENDER_TYPE_HEAD_TL

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in POS_TENDER_TYPE_HEAD_TL.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 BYTE) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 BYTE) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | LANG |  |  |  | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 7 | TENDER_TYPE_ID |  |  |  | NUMERIC (6) | This field contains the code which uniquely identifies the tender type. |
| 8 | TENDER_TYPE_DESC |  |  |  | VARCHAR (120 BYTE) | This field contains the description of the tender type. |

---

## Table: SVC_PRICING_EVENT_HEAD

**Description:** This is a table used for staging the pricing events from the external system

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | EVENT_ID | P |  | Y | NUMERIC (15) | Event Id for the Price Change Event. |
| 2 | EVENT_TYPE | P |  | Y | VARCHAR (6 ) | Event Type for Price Change Event |
| 3 | PROCESS_ID |  |  | Y | NUMERIC (10) | This corresponds to the unique value in svc_pricing_event_head table |
| 4 | PROCESS_STATUS |  |  | Y | VARCHAR (6 ) | Status of current row. Could be N - New, P-Processed, E-Error, S - Skipped, or I - In Progress |
| 5 | ITEM_LEVEL |  |  |  | NUMERIC (1) | Item level from Item_master table |
| 6 | ITEM |  |  |  | VARCHAR (25 ) | Alphanumeric value that identifies the item. |
| 7 | DIFF_ID |  |  |  | VARCHAR (6 ) | Diff_id that differentiates the current item from its item_parent. |
| 8 | HIER_LEVEL |  |  |  | VARCHAR (4 ) | This field indicates the organization hierarchy level. |
| 9 | EFFECTIVE_DATE |  |  |  | Date | Effective date for Price Change Event |
| 10 | CURRENCY_CODE |  |  |  | VARCHAR (3 ) | Currency code for the Price Change Event. |
| 11 | SELLING_UNIT_RETAIL |  |  |  | NUMERIC (20,4) | New Selling Unit Retail for the price change event |
| 12 | SELLING_UOM |  |  |  | VARCHAR (4 ) | New Selling UOM for the price change event |
| 13 | MULTI_UNITS |  |  |  | NUMERIC (12,4) | New Multi Units for the price change event |
| 14 | MULTI_UNIT_RETAIL |  |  |  | NUMERIC (20,4) | New Multi Unit Retail for the price change event |
| 15 | MULTI_SELLING_UOM |  |  |  | VARCHAR (4 ) | New Multi Selling UOM for the price change event |
| 16 | PROMO_SELLING_RETAIL |  |  |  | NUMERIC (20,4) | New Promo Selling Retail for the price change event |
| 17 | PROMO_SELLING_UOM |  |  |  | VARCHAR (4 ) | New Promo Selling UOM for the price change event |

---

## Table: SVC_PRICING_EVENT_LOCS

**Description:** This is a table used for explosion of the hierarchy level to the lowest possible level at store or warehouse

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | This corresponds to the unique value in svc_pricing_event_head table |
| 2 | HIER_VALUE | P |  | Y | NUMERIC (10) | Contains the organization hierarchy value at which the price is changing. It can be a store, warehouse, district, region, area, or chain. |

---

## Table: SVC_PRICING_EVENT_TEMP

**Description:** This is a table used for explosion and Processing of External Pricing Events in RMS

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID |  |  | Y | NUMERIC (10) | This corresponds to the unique value in svc_pricing_event_head table |
| 2 | THREAD_VAL |  |  |  | NUMERIC (10) | This contains the thead number to be used during multithreading |
| 3 | CHUNK_ID |  |  |  | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1 for online processing or calculated based on item |
| 4 | PROCESS_STATUS |  |  | Y | VARCHAR (6 ) | Status of current row. Could be N - New, P-Processed, E-Error, S - Skipped, or I - In Progress |
| 5 | EVENT_TYPE |  |  | Y | VARCHAR (6 ) | Event Type for Price Change Event |
| 6 | EVENT_ID |  |  | Y | NUMERIC (12) | Event_Id for Price Change Event |
| 7 | EFFECTIVE_DATE |  |  |  | Date | Effective date for Price Change Event |
| 8 | CURRENCY_CODE |  |  |  | VARCHAR (6 ) | Currency code for Price Change Event |
| 9 | ITEM_RANK |  |  |  | NUMERIC (2) | Rank Value calculated based on Item Level for that process |
| 10 | ITEM |  |  |  | VARCHAR (25 ) | Alphanumeric value that identifies the item. |
| 11 | ITEM_PARENT |  |  |  | VARCHAR (25 ) | Item Parent Value fetched from Item_master |
| 12 | ITEM_GRANDPARENT |  |  |  | VARCHAR (25 ) | Item Grandparent Value from Item_master table |
| 13 | DEPT |  |  |  | NUMERIC (4) | Dept value from Item_master table |
| 14 | CLASS |  |  |  | NUMERIC (4) | Class Value from Item_master table |
| 15 | SUBCLASS |  |  |  | NUMERIC (4) | Subclass Value from Item_master table |
| 16 | ITEM_LEVEL |  |  |  | NUMERIC (1) | Item level from Item_master table |
| 17 | TRAN_LEVEL |  |  |  | NUMERIC (1) | Tran Level from Item_master table |
| 18 | STATUS |  |  |  | VARCHAR (1 ) | Item status from from Item_master table |
| 19 | PACK_IND |  |  |  | VARCHAR (1 ) | Pack Indicator from Item_master table |
| 20 | SELLABLE_IND |  |  |  | VARCHAR (1 ) | Sellable Indicator from Item_master table |
| 21 | ORDERABLE_IND |  |  |  | VARCHAR (1 ) | Orderable Indicator from Item_master table |
| 22 | CATCH_WEIGHT_IND |  |  |  | VARCHAR (1 ) | Catch Weight Indicator from Item_master table |
| 23 | PACK_TYPE |  |  |  | VARCHAR (1 ) | Pack Type value from Item_master table |
| 24 | STANDARD_UOM |  |  |  | VARCHAR (4 ) | Standard Uom of Item from Item_master table |
| 25 | HIER_RANK |  |  |  | NUMERIC (2) | Hierachy rank value calculated based in Hier Level for that process |
| 26 | LOCATION |  |  |  | NUMERIC (10) | Location to which Price change is applicable |
| 27 | LOC_TYPE |  |  |  | VARCHAR (1 ) | Location type for the location id, can be 'S'tore or 'W'arehouse |
| 28 | ITEM_SOH |  |  |  | NUMERIC (12,4) | Sum of Item's Stock_on_hand, in_transit_qty, pack_comp_soh and pack_comp_intran at the location.This column is used during processing of Pricing Event. |
| 29 | CLEAR_IND |  |  |  | VARCHAR (1 ) | Clearance Indicator from Item_loc table |
| 30 | IL_PROMO_SELLING_RETAIL |  |  |  | NUMERIC (20,4) | Current Promo_selling_retail of Item from item_loc table |
| 31 | PRIMARY_SUPP |  |  |  | NUMERIC (10) | Primary supplier from Item_loc table |
| 32 | IL_SELLING_UNIT_RETAIL |  |  |  | NUMERIC (20,4) | Current Selling_Unit_retail value from Item_loc table |
| 33 | IL_SELLING_UOM |  |  |  | VARCHAR (4 ) | Current Selling_UOM value from Item_loc table |
| 34 | ORIG_UNIT_RETAIL |  |  |  | NUMERIC (20,4) | Original Unit Retail value used in Tran Data postings.This column is used during processing of Pricing Event. |
| 35 | OLD_UNIT_RETAIL |  |  |  | NUMERIC (20,4) | Current Value of Unit_retail from Item_loc table. |
| 36 | NEW_UNIT_RETAIL |  |  |  | NUMERIC (20,4) | Selling_unit_retail value in Standard UOM.This column is used during processing of Pricing Event. |
| 37 | SELLING_UNIT_RETAIL |  |  |  | NUMERIC (20,4) | New Selling Unit Retail for the price change event |
| 38 | SELLING_UOM |  |  |  | VARCHAR (4 ) | New Selling UOM for the price change event |
| 39 | MULTI_UNITS |  |  |  | NUMERIC (12,4) | New Multi Units for the price change event |
| 40 | MULTI_UNIT_RETAIL |  |  |  | NUMERIC (20,4) | New Multi Unit Retail for the price change event |
| 41 | MULTI_SELLING_UOM |  |  |  | VARCHAR (4 ) | New Multi Selling UOM for the price change event |
| 42 | PROMO_SELLING_RETAIL |  |  |  | NUMERIC (20,4) | New Promo Selling Retail for the price change event |
| 43 | PROMO_SELLING_UOM |  |  |  | VARCHAR (4 ) | New Promo Selling UOM for the price change event |
| 44 | PROMO_RETAIL |  |  |  | NUMERIC (20,4) | Promo_selling_retail value in standard UOM.This column is used during processing of Pricing Event. |
| 45 | LOC_CURRENCY_CODE |  |  |  | VARCHAR (6 ) | Location Currency code from store or wh table. This column is used during processing of Pricing Event. |
| 46 | EVENT_SIMILARITY |  |  |  | NUMERIC (2) | Similarity of event_types to identify processing path. This column is used during processing of Pricing Event. |
| 47 | PRICE_HIST_TRAN_TYPE |  |  |  | NUMERIC (2) | Tran type value to be inserted in Price_Hist table. |
| 48 | ERROR_MESSAGE |  |  |  | VARCHAR (2000 ) | Error Message populated during the validation phase of Processing. |

---

## Table: SVC_PROCESS_CHUNKS

**Description:** This table is used to contain information about chunks that are used to process coresvc_item service data.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | The process Id to which the chunk belongs. |
| 2 | CHUNK_ID | P |  | Y | NUMERIC (10) | The unique ID for each chunk. |
| 3 | ITEM_COUNT |  |  | Y | NUMERIC (10) | The count of items which are part of this chunk. Informational only. |
| 4 | STATUS |  |  | Y | VARCHAR (5) | The processing status of the chunk. |

---

## Table: SVC_PROCESS_ITEMS

**Description:** This table holds all item numbers and the corresponding process IDs.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The data for a process is split in multiple chunks. The chunk information is present in SVC_PROCESS_CHUNKS. |
| 3 | ROW_SEQ |  |  | Y | NUMERIC (20) | This is the unique row sequence within a process ID. |
| 4 | ITEM |  |  |  | VARCHAR (25 ) | Unique alphanumeric value that identifies the item. |
| 5 | ORIG_REF_NO |  |  |  | VARCHAR (25 ) | When new item numbers are expected to be generated, this column holds the original reference number that can be used to tie data between this table and other SVC item tables. |

---

## Table: SVC_PROCESS_POS

**Description:** This table holds all order numbers and the corresponding process IDs.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The data for a process is split in multiple chunks. The chunk information is present in SVC_PROCESS_CHUNKS. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | This is the unique row sequence within a process ID. |
| 4 | ORDER_NO |  |  |  | NUMERIC (12) | Contains the number that uniquely identifies an order within the system. |

---

## Table: SVC_PROCESS_TRACKER

**Description:** This is the master table for all spreadsheet upload/download processes.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (20) | Unique identifier for each process. |
| 2 | PROCESS_DESC |  |  | Y | VARCHAR (255) | The process description,. |
| 3 | FILE_ID |  |  |  | NUMERIC (20) | The file_id of the spreadsheet which is uploaded/downloaded as part of this process. |
| 4 | TEMPLATE_KEY |  |  | Y | VARCHAR (255) | The template key for the file. Maps to s9t_template.template_key. |
| 5 | ACTION_TYPE |  |  | Y | VARCHAR (255) | The type of action i.e. upload or download. |
| 6 | PROCESS_SOURCE |  |  |  | VARCHAR (255) | The source of the process. Valid values are stored against code-type IISL. . |
| 7 | PROCESS_DESTINATION |  |  |  | VARCHAR (255) | The destination of the process. Valid values are stored against code-type IISL. . |
| 8 | ACTION_DATE |  |  | Y | Date | The date of last action. |
| 9 | STATUS |  |  |  | VARCHAR (255) | Status of the process. |
| 10 | USER_ID |  |  | Y | VARCHAR (30) | The user id who initiated the process. |
| 11 | RMS_ASYNC_ID |  |  |  | NUMERIC (15) | The rms async id in case the proces is submitted as an asynchronous process. |
| 12 | FILE_PATH |  |  |  | VARCHAR (4000) | The file path provided by the user for spreadsheet upload/download. |
| 13 | MODULE_TYPE |  |  | Y | VARCHAR (255 ) | This will differentiate between Item Induction and Admin API upload processes. |

---

## Table: SVC_QUOTA_CATEGORY

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in QUOTA_CATEGORY.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | QUOTA_CAT |  |  |  | VARCHAR (6 ) | Contains the unique code identification. |
| 7 | IMPORT_COUNTRY_ID |  |  |  | VARCHAR (3 ) | Contains the country identifier for the country that is receiving the product. |
| 8 | CATEGORY_DESC |  |  |  | VARCHAR (120 ) | Contains the description of the quota category. |
| 9 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 10 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 11 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 12 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_QUOTA_CATEGORY_TL

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in QUOTA_CATEGORY_TL.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | LANG |  |  |  | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 7 | QUOTA_CAT |  |  |  | VARCHAR (6) | Contains the unique code identification. |
| 8 | IMPORT_COUNTRY_ID |  |  |  | VARCHAR (3) | Contains the country identifier for the country that is receiving the product. |
| 9 | CATEGORY_DESC |  |  |  | VARCHAR (120) | Contains the description of the quota category. |

---

## Table: SVC_REC_GROUP

**Description:** This is the staging table for CFAS record group information.It is used to temporarily hold data before it is uploaded/updated in CFA_REC_GROUP.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk.The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10<br>) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10<br>) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | REC_GROUP_ID |  |  |  | NUMERIC (10) | Unique identifier for the reference record group query. |
| 7 | REC_GROUP_NAME |  |  |  | VARCHAR (30<br>) | The name of the record group query. This is optional. |
| 8 | QUERY_TYPE |  |  |  | VARCHAR (6 ) | Contains the query type value. Valid values are Simple and Complex. Simple queries can be created/maintained online. Complex queries must be entered/maintained by a DBA and can be viewed online. |
| 9 | TABLE_NAME |  |  |  | VARCHAR<br>(30) | Contains the table value for simple queries. |
| 10 | COLUMN_1 |  |  |  | VARCHAR<br>(30) | Contains the first column to be selected in the query. Generally, this should be a value column (ex. item). this column will only contain a value for simple queries. |
| 11 | COLUMN_2 |  |  |  | VARCHAR<br>(30) | Contains the second column to be selected in the query. Generally, this should be a description type column (ex. item_desc). this column will only contain a value for simple queries. |
| 12 | WHERE_COL_1 |  |  |  | VARCHAR<br>(30) | Contains the first column used in the querys where clause. This should contain a value for Simple queries. |
| 13 | WHERE_OPERATOR_1 |  |  |  | VARCHAR (6) | Contains the operator for the first condition in the where clause. Valid values are codes within code type CFWH. This will contain a value for Simple queries. |
| 14 | WHERE_COND_1 |  |  |  | VARCHAR<br>(120) | Contains the condition value for the first condition statement in the where clause. It can be a constant value or bind variable. This will contain a value for Simple queries. |
| 15 | WHERE_COL_2 |  |  |  | VARCHAR<br>(30) | Contains the column used in the second condition statment of querys where clause. This should contain a value for Simple queries. |
| 16 | WHERE_OPERATOR_2 |  |  |  | VARCHAR (6) | Contains the operator for the second condition in the where clause. Valid values are codes within code type CFWH. This will contain a value for Simple queries. |
| 17 | WHERE_COND_2 |  |  |  | VARCHAR<br>(120) | Contains the condition value for the second condition statement in the where clause. It can be a constant value or bind variable. This will contain a value for Simple queries. |
| 18 | CREATE_ID |  |  |  | VARCHAR (30<br>) | User who created the record. |
| 19 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 20 | LAST_UPD_ID |  |  |  | VARCHAR (30<br>) | User who last updated the record. |
| 21 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_REC_GROUP_LABELS

**Description:** This is the staging table for CFAS rec group labels information.It is used to temporarily hold data before it is uploaded/updated in CFA_REC_GROUP.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk.The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10<br>) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10<br>) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | REC_GROUP_ID |  |  |  | NUMERIC (10) | Unique identifier to reference the record group. |
| 7 | LANG |  |  |  | VARCHAR (6 ) | The LOV labels language. |
| 8 | LOV_TITLE |  |  |  | VARCHAR<br>(255 ) | Holds the LOV title label. |
| 9 | LOV_COL1_HEADER |  |  |  | VARCHAR<br>(255 ) | Holds the LOVs first column header label. |
| 10 | LOV_COL2_HEADER |  |  |  | VARCHAR<br>(255) | Holds the LOVs second column header label. |
| 11 | CREATE_ID |  |  |  | VARCHAR (30<br>) | User who created the record. |
| 12 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 13 | LAST_UPD_ID |  |  |  | VARCHAR (30<br>) | User who last updated the record. |
| 14 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_REPL_ITEM_LOC_SUPP_DIST

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in REPL_ITEM_LOC_SUPP_DIST.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | ITEM |  |  |  | VARCHAR (25 ) | Item to be replenished according to the supplier ratio specified. |
| 7 | LOCATION |  |  |  | NUMERIC (10) | Location of the item where the order needs to be placed from the supplier. |
| 8 | SUPPLIER |  |  |  | NUMERIC (10) | This specifies the supplier to whom the order should be placed according to the ratio specified. |
| 9 | ORIGIN_COUNTRY_ID |  |  |  | VARCHAR (3 ) | The origin country of the order that will be placed. |
| 10 | DIST_PCT |  |  |  | NUMERIC (12,4) | This specifies the percentage of the ROQ at an item/location that should be ordered from this supplier/origin country. |
| 11 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 12 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 13 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 14 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_REPL_ROQ

**Description:** This is a working table that will serve as temporary placeholder for bulk processing of recommended order quantity for item/loc level.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | I_NEXT_DELIVERY_DATE |  |  |  | Date | This field contains the next delivery date calculated for the next review cycle. If, for the next review cycle, an order will be created that is calculated to arrive on Thursday, this field will be updated with Thursdays date. |
| 2 | I_SUPP_LEAD_TIME |  |  |  | NUMERIC (4) | This field contains the expected number of days required to send the order to the supplier and have the item ready for pickup to the initial receiving location. |
| 3 | I_PICKUP_LEAD_TIME |  |  |  | NUMERIC (4) | This field contains the expected number of days required to ship the item from the supplier to the initial receiving location, which may be a store or warehouse defined on this record or the cross-dock warehouse through which the item will flow to get to the store defined on this record. |
| 4 | I_WH_LEAD_TIME |  |  |  | NUMERIC (4) | This field contains the expected number of days required to move the item from the warehouse to the store defined on this record. |
| 5 | I_LAST_DELIVERY_DATE |  |  |  | Date | This field contains the last delivery date that replenishment was run for. If replenishment is run on Monday and an order is created that will arrive on Friday, this field will be updated with Fridays date. |
| 6 | I_ITEM |  |  |  | VARCHAR (25) | This field contains the item that is on replenishment. |
| 7 | I_LOCN_TYPE |  |  |  | VARCHAR (6) | This field contains the type of the location on replenishment. Valid values include Store, Warehouse. |
| 8 | I_LOCN |  |  |  | NUMERIC (10) | This field contains the numeric identifier of the location that is on replenishment. |
| 9 | I_PRIMARY_REPL_SUPPLIER |  |  |  | NUMERIC (10) | This field contains the numeric identifier of the supplier from which the specified location will source the replenishment demand for the specified item location. |
| 10 | I_ORIGIN_COUNTRY_ID |  |  |  | VARCHAR (3) | This field contains the country code of the supplier country that will be used to supply the replenishment demand for the specified item location. |
| 11 | I_REVIEW_CYCLE |  |  |  | VARCHAR (6) | This field contains the number representing when the specified item location will be reviewed for replenishment. Valid values are 0 - 14. A 0 represents a weekly review cycle, a 1 represents a daily review cycle, a 2 represents a review cycle of every 2 weeks, a 3 represents a review cycle of every 3 weeks, etc. |
| 12 | I_SUB_ITEM_LOC |  |  |  | NUMERIC (10) | This field contains the Location associated with the Substitute Item record. It should be a valid Oracle Retail Location (STORE.STORE or WH.WH). It will hold only virtual warehouse in a multi-channel environment. |
| 13 | I_STORE_NEED |  |  |  | NUMERIC (12,4) | This field contains the number of items that is being ordered to this location. This field is stored in the standard unit of measure. |
| 14 | I_PRES_STOCK |  |  |  | NUMERIC (12,4) | This field contains the minimum amount of stock that needs to be on store shelves. The presentation stock is nor expected to satisfy consumer demand but is expected to remain in the fixture. |
| 15 | I_DEMO_STOCK |  |  |  | NUMERIC (12,4) | This field contains the amount of stock that cannot be sold as new and is not counted as part of inventory in the replenishment calculations. The value in this field is the amount of stock used strictly for demonstration purposes. |
| 16 | I_REPL_METHOD |  |  |  | VARCHAR (6) | This field contains the character code for the algorithm that will be used to calculate the recommended order quantity for the item location. Valid values include Constant, Min/Max, Floating point, Time Supply, Dynamic, SO Store Orders. |
| 17 | I_MIN_STOCK |  |  |  | NUMERIC (12,4) | This field contains the required minimum number of units available for sale. Used in the Min/Max replenishment method algorithm. |
| 18 | I_MAX_STOCK |  |  |  | NUMERIC (12,4) | This field contains the required maximum number of units available for sale. Used in the Constant, Min/Max and Floating Point replenishment method algorithms. |
| 19 | I_INCR_PCT |  |  |  | NUMERIC (12,4) | This field contains the percentage by which the min and max stock levels will be multiplied when calculating the recommended order quantity. Ex. Actual max stock = max stock * increment percent. |
| 20 | I_MIN_SUPPLY_DAYS |  |  |  | NUMERIC (3) | This field contains the minimum number of days of supply of stock to maintain. Used in the Time Supply replenishment method algorithm. |
| 21 | I_MAX_SUPPLY_DAYS |  |  |  | NUMERIC (3) | This field contains the maximum number of days of supply of stock to maintain. Used in the Time Supply replenishment method algorithm. |
| 22 | I_TIME_SUPPLY_HORIZON |  |  |  | NUMERIC (3) | This field contains the number of days over which an average sales rate is calculated to be used in the Time Supply replenishment method algorithm. |
| 23 | I_INV_SELLING_DAYS |  |  |  | NUMERIC (3) | This field contains the number of required days of on hand inventory to satisfy demand. Used in the Dynamic replenishment method algorithm. |
| 24 | I_SERVICE_LEVEL |  |  |  | NUMERIC (5,2) | This field contains the required measure of probability that demand is satisfied from on hand inventory. Used in the Dynamic replenishment method algorithm. |
| 25 | I_LOST_SALES_FACTOR |  |  |  | NUMERIC (5,2) | This field contains the percentage of sales that could have occurred if inventory had been available through the order lead time. Used in the Dynamic replenishment method algorithm. |
| 26 | I_TERMINAL_STOCK_QTY |  |  |  | NUMERIC (12,4) | This field contains the desired stock on hand for the item location when the end of season is reached. Used in the Seasonal Dynamic and Seasonal Time Supply replenishment methods. |
| 27 | I_UNIT_COST |  |  |  | NUMERIC (20,4) | This field contains the unit cost for the item (or simple pack if a replenishment simple pack is being used) for the replenishment supplier/country. This field is stored in the suppliers currency. |
| 28 | I_UNIT_RETAIL |  |  |  | NUMERIC (20,4) | This field contains the unit retail for the item (or simple pack if a replenishment simple pack is being used) for the replenishment supplier/country. |
| 29 | I_DUE_ORD_PROCESS_IND |  |  |  | VARCHAR (1) | This field contains an indicator used to determine if Due Order Processing will be used when creating orders for the supplier or supplier/department. This indicator will only be used for replenishment orders. Valid values include: Y - Yes. Due order processing will be used. N - No. Due order processing will not be used. |
| 30 | I_REPL_RESULTS_ALL_IND |  |  |  | VARCHAR (1) | This field contains an indicator to determine if results should be written to the Replenishment Results table (REPL_RESULTS) even if no recommended order quantity (ROQ) is generated (i.e. ROQ is <= 0). |
| 31 | I_SEASON_ID |  |  |  | NUMERIC (3) | This field contains the numeric identifier of the season for which this item location is being replenished. Used in the Seasonal Dynamic and Seasonal Time Supply replenishment methods. |
| 32 | I_PHASE_ID |  |  |  | NUMERIC (3) | This field contains the numeric identifier of the phase within the season for which this item location is being replenished. Used in the Seasonal Dynamic and Seasonal Time Supply replenishment methods. |
| 33 | I_DOMAIN_ID |  |  |  | NUMERIC (3) | This field contains the unique number representing the domain. This domain number is used when interfacing data to external systems using domains. |
| 34 | I_REJECT_STORE_ORD_IND |  |  |  | VARCHAR (1) | This field contains an indicator that determines if uploaded store orders should be rejected. If the indicator is N, then store orders for all need dates are valid. If Y, store orders with needs date on or after the NEXT_DELIVERY_DATE are valid. |
| 35 | I_DATE |  |  |  | Date | This field contains the current system date. It will have the vdate value from the period table. |
| 36 | I_LAST_RUN_OF_THE_DAY |  |  |  | VARCHAR (1) | This field contains the indicates if it is the last replenishment that will run for the day. Default value is N. |
| 37 | I_STOCK_CAT |  |  |  | VARCHAR (6) | This field contains the sourcing strategy for the item/location relationship. Valid values are Direct to store (supplier to store), Cross-docked (supplier to store flowing through the warehouse), Warehouse stocked (warehouse to store), L for WH/Cross Link (warehouse to store and supplier to warehouse if insufficient warehouse stock). |
| 38 | I_SOURCE_WH |  |  |  | NUMERIC (10) | This field contains the numeric identifier of the warehouse through which the specified item will cross-dock to the specified store for a stock category of Crossdocked; or the numeric identifier of the warehouse from which the specified item will be sourced for the specified store for a stock category of Warehouse Stocked. |
| 39 | I_SOURCE_PHYSICAL_WH |  |  |  | NUMERIC (10) | This field contains the numeric identifier of the physical warehouse that is assigned to the virtual warehouse. |
| 40 | I_SERVICE_LEVEL_TYPE |  |  |  | VARCHAR (2) | This field contains the character code for the algorithm that will drive the safety stock calculation algorithm, valid values are Simple Sales and Standard. |
| 41 | I_WH_DELIVERY_POLICY |  |  |  | VARCHAR (6) | This field contains the delivery policy of the warehouse. Next Day indicates that the if a location is closed, the warehouse will deliver on the next day. Next Valid Delivery Day indicates that the warehouse will wait until the next scheduled delivery day before delivering. Valid values come from the DLVY code on code_head/code_detail. |
| 42 | I_SUP_DELIVERY_POLICY |  |  |  | VARCHAR (6) | This field contains the delivery policy of the supplier. Next Day indicates that the if a location is closed, the supplier will deliver on the next day. Next Valid Delivery Day indicates that the supplier will wait until the next scheduled delivery day before delivering. Valid values come from the DLVY code on code_head/code_detail. |
| 43 | I_ITEM_PARENT |  |  |  | VARCHAR (25) | This field contains the parent/group of the item on replenishment. |
| 44 | I_ITEM_GRANDPARENT |  |  |  | VARCHAR (25) | This field contains the grandparent/master group of the item on replenishment. |
| 45 | I_PACK_IND |  |  |  | VARCHAR (1) | This field contains an indicator that determines if the item is a pack. A pack item is a collection of items that may be either ordered or sold as a unit. Packs require details (i.e. component items and qtys, etc.) tha other items do not. |
| 46 | I_ITEM_LEVEL |  |  |  | NUMERIC (1) | This field contains the number indicating which of the three levels the item resides. The item level determines if the item stands alone or if it is part of a family of related items. The item level also determines how the item may be used throughout the system. |
| 47 | I_TRAN_LEVEL |  |  |  | NUMERIC (1) | This field contains the number indicating which of the three levels transactions occurs for the items group. The transaction level is the level at which the items inventory is tracked in the system. The transaction level item will be counted, transferred, shipped, etc. The transaction level may be at the current item or up to 2 levels above or below the current item. Only one level of the hierarchy of an item family may contain transaction level items. |
| 48 | I_SUB_FORECAST_IND |  |  |  | VARCHAR (1) | This field contains an indicator that determines if this field is set to Y, then substitute items will be used in calculating the need at a location when a forecasting replenishment method is used for the main item. If it is set to N, substitute items will not be used in the calculations. Valid values are Y and N. |
| 49 | I_SUB_STOCK_IND |  |  |  | VARCHAR (1) | This field contains an indicator that determines if this field is set to Y, then substitute items will be used in calculating the net inventory at a location when determining the locations need for the main item. As well, if set to Y, substitute items stock can be used to fulfill a locations warehouse demands for the main item. If set to N, substitute items will not be used in the calculations and will not be used to fulfill demand. |
| 50 | I_ALL_ORDERS |  |  |  | VARCHAR (1) | This field contains an indicator used to determine if all type of orders (back-orders, import, etc.) is to be included for calculating the recommended order quantity for item/location combination. Valid values are (Y)es and (N)o. |
| 51 | I_ORDER_POINT |  |  |  | NUMERIC (12,4) | This field contains the level below which a recommended order quantity is generated if the net inventory is lower than the order point, for the item/location. |
| 52 | I_REPL_IND |  |  |  | VARCHAR (1) | This field contains an indicator used to determine if the source warehouse is replenishable. |
| 53 | I_STORE_TYPE |  |  |  | VARCHAR (6) | This field contains the type of the store. This will have a value only if the location type is a store. Valid values are, F - Franchise, C - Company |
| 54 | THREAD_ID |  |  |  | NUMERIC (10) | This field contains the identifier that groups possible millions of records into chunks of hundreds-thousands or less for processing. This is for performance gain. |
| 55 | I_REPL_ORDER_CTRL |  |  |  | VARCHAR (6) | Determines if the replenishment process will create an actual order/transfer line item for the item location if there is a need for the item location or if only a record is written to the Replenishment Results table. Valid values are Manual (a record is written to the Replenishment Results table - no order/transfer line item is created), Semi-Automatic (an order/transfer line item is created - the order line item will be added to an order in Worksheet status, the transfer line item will be added to a transfer in Approved status with a freight type of Hold), Automatic (an order/transfer line item is created - the order line item will be added to an order in Approved status, the transfer line item will be added to a transfer in Approved status), Buyer Worksheet (a record is written to the Replenishment Results table and can be added to a purchase order on the Buyer Worksheet form/a transfer line item is added to a transfer in Approved status with a freight type of Hold). |
| 56 | I_SUPP_PACK_SIZE |  |  |  | NUMERIC (12,4) | This field contains the quantity that orders must be placed in multiples of for the Supplier for the item. |
| 57 | I_DEPT |  |  |  | NUMERIC (4) | Contains the number of the department in which the item is located. This fieldis used for performance purposes during the batch replenishment process. |
| 58 | I_TSF_PO_LINK_NO |  |  |  | NUMERIC (12) | A reference number to link the item on the transfer to any purchase orders that have been created to allow the from location (i.e. warehouse) on the transfer to fulfill the transfer quantity to the to |
| 59 | I_ORDER_NO |  |  |  | NUMERIC (12) | Contains the number that uniquely identifies an order within the system. |
| 60 | I_ALLOC_NO |  |  |  | NUMERIC (10) | This column contains the number that uniquely identifies the allocation within the system. |
| 61 | I_CLASS |  |  |  | NUMERIC (4) | Contains the number of the class in which the item is located. This field is used for performance purposes during the batch replenishment process. |
| 62 | I_SUBCLASS |  |  |  | NUMERIC (4) | Contains the number of the class in which the item is located. This field is used for performance purposes during the batch replenishment process. |
| 63 | I_BUYER |  |  |  | NUMERIC (4) | Contains the unique number identifying a person authorized to create purchase orders within the system. |
| 64 | I_POOL_SUPPLIER |  |  |  | NUMERIC (10) | This column will link the supplier, supplier/department, supplier/location, or the supplier/department/location to a master supplier. |
| 65 | I_ACTIVATE_DATE |  |  |  | Date | Contains the date on which the item location will start to be reviewed for replenishment. |
| 66 | I_DEACTIVATE_DATE |  |  |  | Date | Contains the date at which time the item location will no longer be reviewed for replenishment. |
| 67 | I_NON_SCALING_IND |  |  |  | VARCHAR (1) | Indicator used to determine if the item/location should be exempt from scaling during the order scaling process of the replenishment process. |
| 68 | I_MAX_SCALE_VALUE |  |  |  | NUMERIC (12,4) | Contains the limit up to which order scaling can increase the order quantity for the item/location during the replenishment process. |
| 69 | I_INNER_PACK_SIZE |  |  |  | NUMERIC (12,4) | This field contains the break pack size for this item from the supplier. |
| 70 | I_TI |  |  |  | NUMERIC (12,4) | This field contains the number of shipping units (cases) that make up one tier of a pallet. Multiply TI x HI to get total number of units (cases) for a pallet. |
| 71 | I_HI |  |  |  | NUMERIC (12,4) | This field contains the number of tiers that make up a complete pallet (height).Multiply TI x HI to get total number of units (cases) for a pallet. |
| 72 | I_STORE_ORD_MULT |  |  |  | VARCHAR (1) | Contains the pack size level at which the item (or primary replenishment pack)is shipped between warehouses and stores. |
| 73 | I_LAST_REVIEW_DATE |  |  |  | Date | Contains the date on which the item location was last reviewed. |
| 74 | I_DUE_IND |  |  |  | VARCHAR (1) | Indicator to determine if the item/location is Due. This is where the estimated stock out (ESO) value of the item/location is greater than the accepted stock out (ASO) value of the item/location. |
| 75 | I_ASO |  |  |  | NUMERIC (20,4) | Contains the accepted stock out (ASO) quantity for the item/location. |
| 76 | I_ESO |  |  |  | NUMERIC (20,4) | Contains the estimated stock out (ESO) quantity for the item/location. |
| 77 | I_PHYSICAL_LOCN |  |  |  | NUMERIC (10) | For warehouses, this will contain the whs physical warehouse. For stores, this will contain the store. |
| 78 | I_REPL_PACK |  |  |  | VARCHAR (25) | Contains the numeric identifier of the primary simple pack that will be used to replenish the item. If the I_pack_ind = "Y"es then this field is NOT NULL, otherwise its NULL. If not NULL then this indicates that this simple pack will be used to replenish the item. This field is used for performance purposes during the batch replenishment process. |
| 79 | I_REPL_PACK_QTY |  |  |  | NUMERIC (12,4) | Contains the quantity of the item in the simple pack if a primary replenishment pack is being used to replenish the item. This field is used for performance purposes during the batch replenishment process. |
| 80 | I_ROUND_TO_INNER_PCT |  |  |  | NUMERIC (12,4) | This column will hold the Inner Rounding Threshold value. During rounding, this value is used to determine whether to round partial Inner quantities up or down. If the Inner-fraction in question is less than the Threshold proportion, it is rounded down; if not, it is rounded up. For instance, with an Inner size of 10 and a Threshold of 80%, Inner |
| 81 | I_ROUND_TO_PALLET_PCT |  |  |  | NUMERIC (12,4) | This column will hold the Pallet Rounding Threshold value. During rounding, this value is used to determine whether to round partial Pallet quantities up or down. If the Pallet -fraction in question is less than the Threshold proportion, it is rounded down; if not, it is rounded up. For instance, with an Pallet size of 10 and a Threshold of 80%, Pallet quantities such as 18, 29 and 8 would be rounded up to 20, 30 and 10 respectively, while quantities of 12, 27 and 35 would be rounded down to 10, 20 and 30 respectively. Quantities are never rounded down to zero; a quantity of 7, in the example above, would be rounded up to 10. This column will be maintained solely for purposes of defaulting to the Item/Supplier/Country and Item/Supplier/Country/Location levels. |
| 82 | I_ROUND_TO_CASE_PCT |  |  |  | NUMERIC (12,4) | This column will hold the Case Rounding Threshold value. During rounding, this value is used to determine whether to round partial Case quantities up or down. If the Case-fraction in question is less than the Threshold proportion, it is rounded down; if not, it is rounded up. For instance, with an Case size of 10 and a Threshold of 80%, Case quantities such as 18, 29 and 8 would be rounded up to 20, 30 and 10 respectively, while quantities of 12, 27 and 35 would be rounded down to 10, 20 and 30 respectively. Quantities are never rounded down to zero; a quantity of 7, in the example above, would be rounded up to 10. This column will be maintained solely for purposes of defaulting to the Item/Supplier/Country and Item/Supplier/Country/Location levels. |
| 83 | I_SUP_DEPT_LVL_ORD |  |  |  | VARCHAR (6) | Indicator that determines whether supplier inventory management information can be set up at the supplier/department level or just at the supplier level. Also determines if orders created through replenishment for this supplier should be split by department or not. If the supplier is returns-only, this field will be null. Otherwise, this field must have value. Values include: D - Department. Split orders by department. S - Supplier. Split orders by supplier. |
| 84 | I_DRC_STORE_ORD_MULT |  |  |  | VARCHAR (1) | Contains the pack size level at which the item (or primary replenishment pack) is shipped between warehouses and stores. Valid values are Case, Inner, Each. If the item is being replenished using a primary replenishment pack (i.e. I_repl_pack is not NULL), the store order |
| 85 | I_MBR_ORDER_QTY |  |  |  | NUMERIC (12,4) | This field is only populated if the item on replenishment is using the Warehouse Stocked/Cross-Docked stock category. It will store the portion of the recommended order quantity that cannot be fulfilled by warehouse stock. This quantity will be the quantity that is ordered when an order is created. |
| 86 | I_DEPOSIT_ITEM_TYPE |  |  |  | VARCHAR (6) | This is the deposit item component type. A NULL value in this field indicates that this item is not part of a deposit item relationship. The possible values are: E - Contents, A - Container, Z - Crate, T - Returned Item (Empty bottle), P - Complex pack (with deposit items). |
| 87 | I_CONTAINER_ITEM |  |  |  | VARCHAR (25) | This holds the container item number for a contents item. This field is only populated and required if the I_DEPOSIT_ITEM_TYPE = E. |
| 88 | I_ADD_LEAD_TIME_IND |  |  |  | VARCHAR (1) | This indicator will determine if the supplier lead time will be considered in the calculation of time supply order points and order up to point. |

---

## Table: SVC_REPL_ROQ_GTT

**Description:** Notes

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | O_ORDER_QTY |  |  |  | NUMERIC (12,4) | This field contains the actual recommended order quantity (ROQ) for the item/location after all inventory and replenishment calculation is performed. |
| 2 | O_ORDER_POINT |  |  |  | NUMERIC (12,4) | This field contains the level below which a recommended order quantity is generated if the net inventory is lower than the order point, for the item/location. |
| 3 | O_ORDER_UP_TO_POINT |  |  |  | NUMERIC (12,4) | This field contains the level up to which a recommended order quantity should bring the net inventory of the item. |
| 4 | O_NET_INVENTORY |  |  |  | NUMERIC (12,4) | This field contains the net inventory for the item/location. Includes stock on hand, orders, transfers, allocations, unavailable inventory, reserved inventory, etc. |
| 5 | O_STOCK_ON_HAND |  |  |  | NUMERIC (12,4) | This field contains the current snapshot of stock on hand for the item at the location. |
| 6 | O_PACK_COMP_SOH |  |  |  | NUMERIC (12,4) | This field contains the current stock on hand for pack component item at the location. |
| 7 | O_ON_ORDER |  |  |  | NUMERIC (12,4) | This field contains the current on-order position of the item at the location. |
| 8 | O_IN_TRANSIT_QTY |  |  |  | NUMERIC (12,4) | This field contains the quantity of the item that is currently in transit to the location. |
| 9 | O_PACK_COMP_INTRAN |  |  |  | NUMERIC (12,4) | This field contains the quantity of item that is currently in transit to the location as a component of a pack. |
| 10 | O_TSF_RESV_QTY |  |  |  | NUMERIC (12,4) | This field contains the quantity of the item reserved for transfers from the location. |
| 11 | O_PACK_COMP_RESV |  |  |  | NUMERIC (12,4) | This field contains the quantity of the item reserved for transfers from the location as a component of a pack. |
| 12 | O_TSF_EXPECTED_QTY |  |  |  | NUMERIC (12,4) | This field contains the quantity of the item expected for transfers to the location. |
| 13 | O_PACK_COMP_EXP |  |  |  | NUMERIC (12,4) | This field contains the quantity of the item expected for transfers to the location as a component of a pack. |
| 14 | O_RTV_QTY |  |  |  | NUMERIC (12,4) | This field contains the quantity of the item waiting to be returned from the location. |
| 15 | O_ALLOC_IN_QTY |  |  |  | NUMERIC (12,4) | This field contains the quantity of the item on allocations to the location. |
| 16 | O_ALLOC_OUT_QTY |  |  |  | NUMERIC (12,4) | This field contains the quantity of the item on allocations out of the location. |
| 17 | O_CO_TSF_OUT_QTY |  |  |  | NUMERIC (12,4) | This field contains the transfer expected and in-transit quantity that is designated for customers at the location. It will be excluded from the locations future available inventory. |
| 18 | O_NON_SELLABLE_QTY |  |  |  | NUMERIC (12,4) | This field contains the quantity of the item that is non-sellable at the location. |
| 19 | O_CUSTOMER_RESV |  |  |  | NUMERIC (12,4) | This field contains the quantity of the item that is reserved for customer orders. |
| 20 | O_CUSTOMER_BACKORDER |  |  |  | NUMERIC (12,4) | This field contains the quantity of the item that is held for customer back orders. |
| 21 | O_PACK_COMP_CUST_RESV |  |  |  | NUMERIC (12,4) | This field contains the quantity of the pack component item that is reserved for customer orders. |
| 22 | O_PACK_COMP_CUST_BACK |  |  |  | NUMERIC (12,4) | This field contains the quantity of the pack component item that is held for customer back orders. |
| 23 | O_SAFETY_STOCK |  |  |  | NUMERIC (12,4) | This field contains the quantity of the calculated safety stock for the item/location. |
| 24 | O_LOST_SALES |  |  |  | NUMERIC (12,4) | This field contains the quantity of the calculated lost sales for the item/location. |
| 25 | O_DUE_IND |  |  |  | VARCHAR (1 BYTE) | This field contains an indicator to determine if the item/location is Due. This is where the estimated stock out (ESO) value of the item/location is greater than the accepted stock out (ASO) value of the item/location. Valid values include: Y - Yes. The item/location is due. N - No. The item/location is not due. |
| 26 | O_ASO |  |  |  | NUMERIC (20,4) | This field contains the accepted stock out (ASO) quantity for the item/location. |
| 27 | O_ESO |  |  |  | NUMERIC (20,4) | This field contains the estimated stock out (ESO) quantity for the item/location. |
| 28 | O_MIN_SUPPLY_DAYS_FORECAST |  |  |  | NUMERIC (12,4) | This field contains the forecasted amount over the minimum time supply days. Used for the time supply replenishment methods. |
| 29 | O_MAX_SUPPLY_DAYS_FORECAST |  |  |  | NUMERIC (12,4) | This field contains the forecasted amount over the maximum time supply days. Used for the time supply replenishment methods. |
| 30 | O_TSH_FORECAST |  |  |  | NUMERIC (12,4) | This field contains the forecasted amount over the time supply horizon. Used for the time supply replenishment methods. |
| 31 | O_CURR_OLT_FORECAST |  |  |  | NUMERIC (12,4) | This field contains the forecasted amount over the order lead time. Used for the dynamic replenishment methods. |
| 32 | O_NEXT_OLT_FORECAST |  |  |  | NUMERIC (12,4) | This field contains the Next review cycles lead time forecast. This value is used in the dynamic order quantity calculations. |
| 33 | O_REVIEW_TIME_FORECAST |  |  |  | NUMERIC (12,4) | This field contains the forecasted amount over the review time. Used for the dynamic replenishment methods. |
| 34 | O_ISD_FORECAST |  |  |  | NUMERIC (12,4) | This field contains the forecasted amount over the inventory selling days. Used for the dynamic replenishment methods. |
| 35 | I_CURR_ORDER_LEAD_TIME |  |  |  | NUMERIC (5) | This field contains the calculated lead time for the current review cycle used in the replenishment calculations. |
| 36 | I_NEXT_ORDER_LEAD_TIME |  |  |  | NUMERIC (5) | This field contains the calculated lead time for the next review cycle used in the replenishment calculations. |
| 37 | I_DAYS_ADDED_TO_COLT |  |  |  | NUMERIC (3) | This field contains the number of days added to the current lead time during the replenishment calculation due to a location being closed for delivery. |
| 38 | I_DAYS_ADDED_TO_NOLT |  |  |  | NUMERIC (3) | This field contains the number of days added to the next order lead time during the replenishment calculation due to a location being closed for delivery. |
| 39 | I_REVIEW_LEAD_TIME |  |  |  | NUMERIC (4) | This field contains the number of days in the review time used in the recommended order quantity calculations |
| 40 | I_CURR_DELIVERY_DATE |  |  |  | Date | This field contains the current delivery date calculated for the review cycle. |
| 41 | I_NEXT_DELIVERY_DATE |  |  |  | Date | This field contains the next delivery date calculated for the next review cycle. If, for the next review cycle, an order will be created that is calculated to arrive on Thursday, this field will be updated with Thursdays date. |
| 42 | I_NEXT_REVIEW_DATE |  |  |  | Date | This field contains the date on which the item location will be reviewed next. |
| 43 | I_SUPP_LEAD_TIME |  |  |  | NUMERIC (4) | This field contains the expected number of days required to send the order to the supplier and have the item ready for pickup to the initial receiving location. |
| 44 | I_PICKUP_LEAD_TIME |  |  |  | NUMERIC (4) | This field contains the expected number of days required to ship the item from the supplier to the initial receiving location, which may be a store or warehouse defined on this record or the cross-dock warehouse through which the item will flow to get to the store defined on this record. |
| 45 | I_WH_LEAD_TIME |  |  |  | NUMERIC (4) | This field contains the expected number of days required to move the item from the warehouse to the store defined on this record. |
| 46 | I_LAST_DELIVERY_DATE |  |  |  | Date | This field contains the last delivery date that replenishment was run for. If replenishment is run on Monday and an order is created that will arrive on Friday, this field will be updated with Fridays date. |
| 47 | I_ITEM |  |  |  | VARCHAR (25 BYTE) | This field contains the item that is on replenishment. |
| 48 | I_LOCN_TYPE |  |  |  | VARCHAR (6 BYTE) | This field contains the type of the location on replenishment. Valid values include Store, Warehouse. |
| 49 | I_LOCN |  |  |  | NUMERIC (10) | This field contains the numeric identifier of the location that is on replenishment. |
| 50 | I_PRIMARY_REPL_SUPPLIER |  |  |  | NUMERIC (10) | This field contains the numeric identifier of the supplier from which the specified location will source the replenishment demand for the specified item location. |
| 51 | I_ORIGIN_COUNTRY_ID |  |  |  | VARCHAR (3 BYTE) | This field contains the country code of the supplier country that will be used to supply the replenishment demand for the specified item location. |
| 52 | I_REVIEW_CYCLE |  |  |  | VARCHAR (6 BYTE) | This field contains the number representing when the specified item location will be reviewed for replenishment. Valid values are 0 - 14. A 0 represents a weekly review cycle, a 1 represents a daily review cycle, a 2 represents a review cycle of every 2 weeks, a 3 represents a review cycle of every 3 weeks, etc. |
| 53 | I_SUB_ITEM_LOC |  |  |  | NUMERIC (10) | This field contains the Location associated with the Substitute Item record. It should be a valid Oracle Retail Location (STORE.STORE or WH.WH). It will hold only virtual warehouse in a multi-channel environment. |
| 54 | I_STORE_NEED |  |  |  | NUMERIC (12,4) | This field contains the number of items that is being ordered to this location. This field is stored in the standard unit of measure. |
| 55 | I_PRES_STOCK |  |  |  | NUMERIC (12,4) | This field contains the minimum amount of stock that needs to be on store shelves. The presentation stock is nor expected to satisfy consumer demand but is expected to remain in the fixture. |
| 56 | I_DEMO_STOCK |  |  |  | NUMERIC (12,4) | This field contains the amount of stock that cannot be sold as new and is not counted as part of inventory in the replenishment calculations. The value in this field is the amount of stock used strictly for demonstration purposes. |
| 57 | I_REPL_METHOD |  |  |  | VARCHAR (6 BYTE) | This field contains the character code for the algorithm that will be used to calculate the recommended order quantity for the item location. Valid values include Constant, Min/Max, Floating point, Time Supply, Dynamic, SO Store Orders. |
| 58 | I_MIN_STOCK |  |  |  | NUMERIC (12,4) | This field contains the required minimum number of units available for sale. Used in the Min/Max replenishment method algorithm. |
| 59 | I_MAX_STOCK |  |  |  | NUMERIC (12,4) | This field contains the required maximum number of units available for sale. Used in the Constant, Min/Max and Floating Point replenishment method algorithms. |
| 60 | I_INCR_PCT |  |  |  | NUMERIC (12,4) | This field contains the percentage by which the min and max stock levels will be multiplied when calculating the recommended order quantity. Ex. Actual max stock = max stock * increment percent. |
| 61 | I_MIN_SUPPLY_DAYS |  |  |  | NUMERIC (3) | This field contains the minimum number of days of supply of stock to maintain. Used in the Time Supply replenishment method algorithm. |
| 62 | I_MAX_SUPPLY_DAYS |  |  |  | NUMERIC (3) | This field contains the maximum number of days of supply of stock to maintain. Used in the Time Supply replenishment method algorithm. |
| 63 | I_TIME_SUPPLY_HORIZON |  |  |  | NUMERIC (3) | This field contains the number of days over which an average sales rate is calculated to be used in the Time Supply replenishment method algorithm. |
| 64 | I_INV_SELLING_DAYS |  |  |  | NUMERIC (3) | This field contains the number of required days of on hand inventory to satisfy demand. Used in the Dynamic replenishment method algorithm. |
| 65 | I_SERVICE_LEVEL |  |  |  | NUMERIC (5,2) | This field contains the required measure of probability that demand is satisfied from on hand inventory. Used in the Dynamic replenishment method algorithm. |
| 66 | I_LOST_SALES_FACTOR |  |  |  | NUMERIC (5,2) | This field contains the percentage of sales that could have occurred if inventory had been available through the order lead time. Used in the Dynamic replenishment method algorithm. |
| 67 | I_TERMINAL_STOCK_QTY |  |  |  | NUMERIC (12,4) | This field contains the desired stock on hand for the item location when the end of season is reached. Used in the Seasonal Dynamic and Seasonal Time Supply replenishment methods. |
| 68 | I_DUE_ORD_SERV_BASIS |  |  |  | VARCHAR (6 BYTE) | This field determines whether the safety stock comparisons for Due order determination should be performed in units (standard unit of measures) or currency (ex. $US). Only be used for replenishment orders when the Due Order Indicator is set to Yes. Valid values include: C - Currency based service levels. Safety stock amounts are calculated as the safety stock in units multiplied by the items cost. U - Unit based service levels. Safety stock amounts calculated in units (standard unit of measures). |
| 69 | I_UNIT_COST |  |  |  | NUMERIC (20,4) | This field contains the unit cost for the item (or simple pack if a replenishment simple pack is being used) for the replenishment supplier/country. This field is stored in the suppliers currency. |
| 70 | I_UNIT_RETAIL |  |  |  | NUMERIC (20,4) | This field contains the unit retail for the item (or simple pack if a replenishment simple pack is being used) for the replenishment supplier/country. |
| 71 | I_DUE_ORD_PROCESS_IND |  |  |  | VARCHAR (1 BYTE) | This field contains an indicator used to determine if Due Order Processing will be used when creating orders for the supplier or supplier/department. This indicator will only be used for replenishment orders. Valid values include: Y - Yes. Due order processing will be used. N - No. Due order processing will not be used. |
| 72 | I_REPL_RESULTS_ALL_IND |  |  |  | VARCHAR (1 BYTE) | This field contains an indicator to determine if results should be written to the Replenishment Results table (REPL_RESULTS) even if no recommended order quantity (ROQ) is generated (i.e. ROQ is <= 0). |
| 73 | I_SEASON_ID |  |  |  | NUMERIC (3) | This field contains the numeric identifier of the season for which this item location is being replenished. Used in the Seasonal Dynamic and Seasonal Time Supply replenishment methods. |
| 74 | I_PHASE_ID |  |  |  | NUMERIC (3) | This field contains the numeric identifier of the phase within the season for which this item location is being replenished. Used in the Seasonal Dynamic and Seasonal Time Supply replenishment methods. |
| 75 | I_DOMAIN_ID |  |  |  | NUMERIC (3) | This field contains the unique number representing the domain. This domain number is used when interfacing data to external systems using domains. |
| 76 | I_REJECT_STORE_ORD_IND |  |  |  | VARCHAR (1 BYTE) | This field contains an indicator that determines if uploaded store orders should be rejected. If the indicator is N, then store orders for all need dates are valid. If Y, store orders with needs date on or after the NEXT_DELIVERY_DATE are valid. |
| 77 | I_DATE |  |  |  | Date | This field contains the current system date. It will have the vdate value from the period table. |
| 78 | I_LAST_RUN_OF_THE_DAY |  |  |  | VARCHAR (1 BYTE) | This field contains the indicates if it is the last replenishment that will run for the day. Default value is N. |
| 79 | I_STOCK_CAT |  |  |  | VARCHAR (6 BYTE) | This field contains the sourcing strategy for the item/location relationship. Valid values are Direct to store (supplier to store), Cross-docked (supplier to store flowing through the warehouse), Warehouse stocked (warehouse to store), L for WH/Cross Link (warehouse to store and supplier to warehouse if insufficient warehouse stock). |
| 80 | I_SOURCE_WH |  |  |  | NUMERIC (10) | This field contains the numeric identifier of the warehouse through which the specified item will cross-dock to the specified store for a stock category of Crossdocked; or the numeric identifier of the warehouse from which the specified item will be sourced for the specified store for a stock category of Warehouse Stocked. |
| 81 | I_SOURCE_PHYSICAL_WH |  |  |  | NUMERIC (10) | This field contains the numeric identifier of the physical warehouse that is assigned to the virtual warehouse. |
| 82 | I_SERVICE_LEVEL_TYPE |  |  |  | VARCHAR (2 BYTE) | This field contains the character code for the algorithm that will drive the safety stock calculation algorithm, valid values are Simple Sales and Standard. |
| 83 | I_WH_DELIVERY_POLICY |  |  |  | VARCHAR (6 BYTE) | This field contains the delivery policy of the warehouse. Next Day indicates that the if a location is closed, the warehouse will deliver on the next day. Next Valid Delivery Day indicates that the warehouse will wait until the next scheduled delivery day before delivering. Valid values come from the DLVY code on code_head/code_detail. |
| 84 | I_SUP_DELIVERY_POLICY |  |  |  | VARCHAR (6 BYTE) | This field contains the delivery policy of the supplier. Next Day indicates that the if a location is closed, the supplier will deliver on the next day. Next Valid Delivery Day indicates that the supplier will wait until the next scheduled delivery day before delivering. Valid values come from the DLVY code on code_head/code_detail. |
| 85 | I_ITEM_PARENT |  |  |  | VARCHAR (25 BYTE) | This field contains the parent/group of the item on replenishment. |
| 86 | I_ITEM_GRANDPARENT |  |  |  | VARCHAR (25 BYTE) | This field contains the grandparent/master group of the item on replenishment. |
| 87 | I_PACK_IND |  |  |  | VARCHAR (1 BYTE) | This field contains an indicator that determines if the item is a pack. A pack item is a collection of items that may be either ordered or sold as a unit. Packs require details (i.e. component items and qtys, etc.) tha other items do not. |
| 88 | I_ITEM_LEVEL |  |  |  | NUMERIC (1) | This field contains the number indicating which of the three levels the item resides. The item level determines if the item stands alone or if it is part of a family of related items. The item level also determines how the |
| 89 | I_TRAN_LEVEL |  |  |  | NUMERIC (1) | This field contains the number indicating which of the three levels transactions occurs for the items group. The transaction level is the level at which the items inventory is tracked in the system. The transaction level item will be counted, transferred, shipped, etc. The transaction level may be at the current item or up to 2 levels above or below the current item. Only one level of the hierarchy of an item family may contain transaction level items. |
| 90 | I_PHASE_START |  |  |  | Date | This field contains the starting date of the phase (sub-seasons) for the RMS. |
| 91 | I_PHASE_END |  |  |  | Date | This field contains the ending date of the phase (sub-seasons) for the RMS. |
| 92 | I_SUB_ITEM_MASTER |  |  |  | VARCHAR (25 BYTE) | This field contains the alphanumeric identifier for the substitute item. This item must be a valid item on the item_master table. |
| 93 | I_SUB_FORECAST_IND |  |  |  | VARCHAR (1 BYTE) | This field contains an indicator that determines if this field is set to Y, then substitute items will be used in calculating the need at a location when a forecasting replenishment method is used for the main item. If it is set to N, substitute items will not be used in the calculations. Valid values are Y and N. |
| 94 | I_SUB_STOCK_IND |  |  |  | VARCHAR (1 BYTE) | This field contains an indicator that determines if this field is set to Y, then substitute items will be used in calculating the net inventory at a location when determining the locations need for the main item. As well, if set to Y, substitute items stock can be used to fulfill a locations warehouse demands for the main item. If set to N, substitute items will not be used in the calculations and will not be used to fulfill demand. |
| 95 | I_LEAD_LINKED_WH |  |  |  | NUMERIC (10) | This field contains the number which uniquely identifies the main warehouse that linked with other warehouses used for replenishment. |
| 96 | I_REPL_PACK |  |  |  | VARCHAR (25 BYTE) | Contains the numeric identifier of the primary simple pack that will be used to replenish the item. If the I_pack_ind = "Y"es then this field is NOT NULL, otherwise its NULL. If not NULL then this indicates that this simple pack will be used to replenish the item. This field is used for performance purposes during the batch replenishment process. |
| 97 | I_REPL_PACK_QTY |  |  |  | NUMERIC (12,4) | Contains the quantity of the item in the simple pack if a primary replenishment pack is being used to replenish the item. This field is used for performance purposes during the batch replenishment process. |
| 98 | I_ALL_ORDERS |  |  |  | VARCHAR (1 BYTE) | This field contains an indicator used to determine if all type of orders (back-orders, import, etc.) is to be included for calculating the recommended order quantity for item/location combination. Valid values are (Y)es and (N)o. |
| 99 | I_ORDER_POINT |  |  |  | NUMERIC (12,4) | This field contains the level below which a recommended order quantity is generated if the net inventory is lower than the order point, for the item/location. |
| 100 | I_REPL_IND |  |  |  | VARCHAR (1 BYTE) | This field contains an indicator used to determine if the source warehouse is replenishable. |
| 101 | I_STORE_TYPE |  |  |  | VARCHAR (6 BYTE) | This field contains the type of the store. This will have a value only if the location type is a store. Valid values are, F - Franchise, C - Company |
| 102 | I_SO_TO_DATE |  |  |  | Date | This field contains the store order computed date adding of days (I_next_order_lead_time and I_review_lead_time) to the period.vdate. |
| 103 | I_SO_FROM_DATE |  |  |  | Date | This field contains the store order computed date adding of days (I_curr_order_lead_time) to the period.vdate. |
| 104 | I_SO_NO_FROM_DATE |  |  |  | Date | This field contains the store order computed date adding of days (I_next_order_lead_time) to the period.vdate if the I_reject_store_ord_ind value is N, otherwise it will contain a default date value of to_date('19010101','YYYYMMDD'). |
| 105 | I_SO_ORDER_ROQ |  |  |  | NUMERIC (12,4) | This field contains the number of items that is being requested. This field is stored in the standard unit of measure. |
| 106 | I_SO_DUE_IND |  |  |  | VARCHAR (1 BYTE) | This field contains an indicator to determine if the store order is due. This field will be Y if I_so_order_roq have zero or negative values, otherwise N. |
| 107 | I_SO_WF_NOT_AFTER_DATE |  |  |  | Date | This field contains the date represents the last date by which the wholesaler or franchisee will accept the item on this order. |
| 108 | I_SO_WF_NEED_DATE |  |  |  | Date | This field contains the date represents the initial date by which the wholesaler or franchisee wants the item on this order. |
| 109 | I_TRUE_START_DATE |  |  |  | Date | This field contains the starting date of the delivery for the particular store/location. |
| 110 | I_DELIV_CYCLE |  |  |  | VARCHAR (6 BYTE) | This field contains the delivery frequency, can be daily, weekly, every two weeks, etc. |
| 111 | I_DAY_1 |  |  |  | NUMERIC (1) | This field holds the value "Sunday" of the week. This will serve as helper in the computation of order lead times. Valid values: 1 or 0 |
| 112 | I_DAY_2 |  |  |  | NUMERIC (1) | This field holds the value "Monday" of the week. This will serve as helper in the computation of order lead times. Valid values: 2 or 0 |
| 113 | I_DAY_3 |  |  |  | NUMERIC (1) | This field holds the value "Tuesday" of the week. This will serve as helper in the computation of order lead times. Valid values: 3 or 0 |
| 114 | I_DAY_4 |  |  |  | NUMERIC (1) | This field holds the value "Wednesday" of the week. This will serve as helper in the computation of order lead times. Valid values: 4 or 0 |
| 115 | I_DAY_5 |  |  |  | NUMERIC (1) | This field holds the value "Thursday" of the week. This will serve as helper in the computation of order lead times. Valid values: 5 or 0 |
| 116 | I_DAY_6 |  |  |  | NUMERIC (1) | This field holds the value "Friday" of the week. This will serve as helper in the computation of order lead times. Valid values: 6 or 0 |
| 117 | I_DAY_7 |  |  |  | NUMERIC (1) | This field holds the value "Saturday" of the week. This will serve as helper in the computation of order lead times. Valid values: 7 or 0 |
| 118 | O_SS_TSF_EXPECTED_QTY |  |  |  | NUMERIC (12,4) | This field contains the sum of all expected quantities of an item that have not been shipped on all transfers and stand alone allocations for the |
| 119 | O_SS_PACK_COMP_EXP |  |  |  | NUMERIC (12,4) | This field contains the sum of all expected quantities of a component item that have not been shipped on all transfers and stand alone allocations for the destination location. |
| 120 | O_SS_ALLOC_OUT_QTY |  |  |  | NUMERIC (12,4) | This field contains the safety stock field is the sum of the items allocated, including the pack components, minus the sum of the items transferred. |
| 121 | O_SS_ON_ORDER |  |  |  | NUMERIC (12,4) | This field contains the safety stock field is the sum of the items ordered, including the pack components and item groups, minus the sum of the items received. |
| 122 | O_SS_ALLOC_IN_QTY |  |  |  | NUMERIC (12,4) | This field contains the safety stock field is the sum of the items allocated, including the pack components and item groups, minus the sum of the items transferred |
| 123 | O_SS_NET_INVENTORY |  |  |  | NUMERIC (12,4) | This field contains the safety stock net inventory for the item/location. Includes stock on hand, orders, transfers, allocations, unavailable inventory, and reserved inventory. |
| 124 | O_SS_FORECAST |  |  |  | NUMERIC (12,4) | This field contains the safety stock forecasted sales for the given sku/store/date combination. |
| 125 | O_REVIEW_STD_DEV |  |  |  | NUMERIC (12,4) | This field contains the safety stock standard deviation value for the given sku/store/date combination. This value represents the confidence level in the sales forecast. This field is used in the safety stock calculations for the Dynamic replenishment method. |
| 126 | THREAD_ID |  |  |  | NUMERIC (10) | The thread number associated to the cost event. |
| 127 | O_NO_ROUND_ORDER_QTY |  |  |  | NUMERIC (12,4) | This field contains the actual recommended order quantity (ROQ) that is not rounded for the item/location after all inventory and replenishment calculation is performed. |
| 128 | I_REPL_ORDER_CTRL |  |  |  | VARCHAR (6 BYTE) | Determines if the replenishment process will create an actual order/transfer line item for the item location if there is a need for the item location or if only a record is written to the Replenishment Results |
| 129 | I_SUPP_PACK_SIZE |  |  |  | NUMERIC (12,4) | This field contains the quantity that orders must be placed in multiples of for the Supplier for the item. |
| 130 | I_DEPT |  |  |  | NUMERIC (4) | Contains the number of the department in which the item is located. This fieldis used for performance purposes during the batch replenishment process. |
| 131 | I_TSF_PO_LINK_NO |  |  |  | NUMERIC (12) | A reference number to link the item on the transfer to any purchase orders that have been created to allow the from location (i.e. warehouse) on the transfer to fulfill the transfer quantity to the to location (i.e store) on the transfer. |
| 132 | I_ORDER_NO |  |  |  | NUMERIC (12) | Contains the number that uniquely identifies an order within the system. |
| 133 | I_ALLOC_NO |  |  |  | NUMERIC (10) | This column contains the number that uniquely identifies the allocation within the system. |
| 134 | I_CLASS |  |  |  | NUMERIC (4) | Contains the number of the class in which the item is located. This field is used for performance purposes during the batch replenishment process. |
| 135 | I_SUBCLASS |  |  |  | NUMERIC (4) | Contains the number of the class in which the item is located. This field is used for performance purposes during the batch replenishment process. |
| 136 | I_BUYER |  |  |  | NUMERIC (4) | Contains the unique number identifying a person authorized to create purchase orders within the system. |
| 137 | I_POOL_SUPPLIER |  |  |  | NUMERIC (10) | This column will link the supplier, supplier/department, supplier/location, or the supplier/department/location to a master supplier. |
| 138 | I_ACTIVATE_DATE |  |  |  | Date | Contains the date on which the item location will start to be reviewed for replenishment. |
| 139 | I_DEACTIVATE_DATE |  |  |  | Date | Contains the date at which time the item location will no longer be reviewed for replenishment. |
| 140 | I_NON_SCALING_IND |  |  |  | VARCHAR (1 BYTE) | Indicator used to determine if the item/location should be exempt from scaling during the order scaling process of the replenishment process. |
| 141 | I_MAX_SCALE_VALUE |  |  |  | NUMERIC (12,4) | Contains the limit up to which order scaling can increase the order quantity for the item/location during the replenishment process. |
| 142 | I_INNER_PACK_SIZE |  |  |  | NUMERIC (12,4) | This field contains the break pack size for this item from the supplier. |
| 143 | I_TI |  |  |  | NUMERIC (12,4) | This field contains the number of shipping units (cases) that make up one tier of a pallet. Multiply TI x HI to get total number of units (cases) for a pallet. |
| 144 | I_HI |  |  |  | NUMERIC (12,4) | This field contains the number of tiers that make up a complete pallet (height).Multiply TI x HI to get total number of units (cases) for a pallet. |
| 145 | I_STORE_ORD_MULT |  |  |  | VARCHAR (1 BYTE) | Contains the pack size level at which the item (or primary replenishment pack)is shipped between warehouses and stores. |
| 146 | I_LAST_REVIEW_DATE |  |  |  | Date | Contains the date on which the item location was last reviewed. |
| 147 | I_DUE_IND |  |  |  | VARCHAR (1 BYTE) | Indicator to determine if the item/location is Due. This is where the estimated stock out (ESO) value of the item/location is greater than the accepted stock out (ASO) value of the item/location. |
| 148 | I_ASO |  |  |  | NUMERIC (20,4) | Contains the accepted stock out (ASO) quantity for the item/location. |
| 149 | I_ESO |  |  |  | NUMERIC (20,4) | Contains the estimated stock out (ESO) quantity for the item/location. |
| 150 | I_PHYSICAL_LOCN |  |  |  | NUMERIC (10) | For warehouses, this will contain the whs physical warehouse. For stores, this will contain the store. |
| 151 | I_ROUND_TO_INNER_PCT |  |  |  | NUMERIC (12,4) | This column will hold the Inner Rounding Threshold value. During rounding, this value is used to determine whether to round partial Inner quantities up or down. If the Inner-fraction in question is less than the Threshold proportion, it is rounded down; if not, it is rounded up. For instance, with an Inner size of 10 and a Threshold of 80%, Inner quantities such as 18, 29 and 8 would be rounded up to 20, 30 and 10 respectively, while quantities of 12, 27 and 35 would be rounded down to 10, 20 and 30 respectively. Quantities are never rounded down to zero; a quantity of 7, in the example above, would be rounded up to 10. This column will be maintained solely for purposes of defaulting to the Item/Supplier/Country and Item/Supplier/Country/Location levels. |
| 152 | I_ROUND_TO_PALLET_PCT |  |  |  | NUMERIC (12,4) | This column will hold the Pallet Rounding Threshold value. During rounding, this value is used to determine whether to round partial Pallet quantities up or down. If the Pallet -fraction in question is less than the Threshold proportion, it is rounded down; if not, it is rounded up. For instance, with an Pallet size of 10 and a Threshold of 80%, Pallet quantities such as 18, 29 and 8 would be rounded up to 20, 30 and 10 respectively, while quantities of 12, 27 and 35 would be rounded down to 10, 20 and 30 respectively. Quantities are never rounded down to zero; a quantity of 7, in the example above, would be rounded up to 10. This column will be maintained solely for purposes of defaulting to the Item/Supplier/Country and Item/Supplier/Country/Location levels. |
| 153 | I_ROUND_TO_CASE_PCT |  |  |  | NUMERIC (12,4) | This column will hold the Case Rounding Threshold value. During rounding, this value is used to determine whether to round partial Case quantities up or down. If the Case-fraction in question is less than the Threshold proportion, it is rounded down; if not, it is rounded up. For instance, with an Case size of 10 and a Threshold of 80%, Case quantities such as 18, 29 and 8 would be rounded up to 20, 30 and 10 respectively, while quantities of 12, 27 and 35 would be rounded down to 10, 20 and 30 respectively. Quantities are never rounded down to zero; a quantity of 7, in the example above, would be rounded up to 10. This column will be maintained solely for purposes of defaulting to the Item/Supplier/Country and Item/Supplier/Country/Location levels. |
| 154 | I_SUP_DEPT_LVL_ORD |  |  |  | VARCHAR (6 BYTE) | Indicator that determines whether supplier inventory management information can be set up at the supplier/department level or just at the supplier level. Also determines if orders created through replenishment for this supplier should be split by department or not. If the supplier is returns-only, this field will be null. Otherwise, this field must have value. Values include: D - Department. Split orders by department. S - Supplier. Split orders by supplier. |
| 155 | I_DRC_STORE_ORD_MULT |  |  |  | VARCHAR (1 BYTE) | Contains the pack size level at which the item (or primary replenishment pack) is shipped between warehouses and stores. Valid values are Case, Inner, Each. If the item is being replenished using a primary replenishment pack (i.e. I_repl_pack is not NULL), the store order multiple will represent the packs store order multiple. Otherwise, the field will contain the items store order multiple. This field is used for performance purposes during the batch replenishment process. |
| 156 | I_DEPOSIT_ITEM_TYPE |  |  |  | VARCHAR (6 BYTE) | This is the deposit item component type. A NULL value in this field indicates that this item is not part of a deposit item relationship. The possible values are: E - Contents, A - Container, Z - Crate, T - Returned Item (Empty bottle), P - Complex pack (with deposit items). |
| 157 | I_CONTAINER_ITEM |  |  |  | VARCHAR (25 BYTE) | This holds the container item number for a contents item. This field is only populated and required if the I_DEPOSIT_ITEM_TYPE = E. |
| 158 | I_ORD_TEMP_SEQ_NO |  |  |  | NUMERIC (10) | This field will allow a link to be created between repl_results and ord_temp. It will be used by rplbld.pc when calculating due orders. Rplbld needs to have visibility to ASO and ESO from repl_results. |
| 159 | I_ADD_LEAD_TIME_IND |  |  |  | VARCHAR (1 BYTE) | This indicator will determine if the supplier lead time will be considered in the calculation of time supply order points and order up to point. |
| 160 | O_PACK_COMP_NON_SELLABLE |  |  |  | NUMERIC (12,4) | This field contains the quantity of the pack component item that is non-sellable at the location. |

---

## Table: SVC_RTK_ERRORS

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in RTK_ERRORS.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | RTK_TYPE |  |  |  | VARCHAR (2 ) | This column will represent the type of error that each key and message is describing. Valid values are BL - business logic, OR - API sequencing out of order, LK - record locked, OE - oracle error. |
| 7 | RTK_KEY |  |  |  | VARCHAR (25 ) | Contains a key that will be used to access an error message from a form. This key is used to call the message from inside the emessage or F_YES_NO message. |
| 8 | RTK_LANG |  |  |  | NUMERIC (6) | Contains a number which indicates the language in which the message was written. This number corresponds to a record on the language table. |
| 9 | RTK_TEXT |  |  |  | VARCHAR (255 ) | Contains the actual text of the message. This text will be written to the screen when the message box appears. |
| 10 | RTK_APPROVED |  |  |  | VARCHAR (1 ) | Indicates whether or not the message has been approved. Valid values are: Y or N. |
| 11 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 12 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 13 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 14 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_RTK_ERRORS_TL

**Description:** This is a staging table used for rtk_errors_tl spreadsheet upload process. It is used to temporarily hold data before it is uploaded/updated in RTK_ERRORS_TL.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | LANG |  |  |  | NUMERIC (6) | Refer to RTK_ERRORS_TL.LANG column |
| 7 | RTK_KEY |  |  |  | VARCHAR (25 ) | Refer to RTK_ERRORS_TL.RTK_KEY column |
| 8 | RTK_TEXT |  |  |  | VARCHAR (255 ) | Refer to RTK_ERRORS_TL.RTK_TEXT column |

---

## Table: SVC_RTK_ROLE_PRIVS

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in RTK_ROLE_PRIVS.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1 |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | ORD_APPR_AMT |  |  |  | NUMERIC (20,4) | This field contains the upper limit that the role is able to approve on an order. This value is expressed in primary currency. |
| 7 | ROLE |  |  |  | VARCHAR (30 ) | This field contains the Oracle role for which the record will pertain to. |
| 8 | CREATE_ID |  |  |  | VARCHAR (30 ) | This column holds the user id created the record. |
| 9 | CREATE_DATETIME |  |  |  | Date | This column holds the timestamp when the record is created. |
| 10 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | This column holds the user id Last Updated the record. |
| 11 | LAST_UPD_DATETIME |  |  |  | Date | This column holds the timestamp when the record is Last Updated. |

---

## Table: SVC_S9T_LIST_VALS

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in S9T_LIST_VALS.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | CODE |  |  |  | VARCHAR (255) | The code_detail code from which the drop down values should be obtained from. |
| 7 | COLUMN_NAME |  |  |  | VARCHAR (255) | The column-name to which this drop downmapping belongs to. |
| 8 | SHEET_NAME |  |  |  | VARCHAR (255) | The sheet-name to which this drop down mapping belongs to. |
| 9 | TEMPLATE_CATEGORY |  |  |  | VARCHAR (255) | The template category. Valid values are stored against code-type S9TC. |
| 10 | CREATE_ID |  |  |  | VARCHAR (30) | User who created the record. |
| 11 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 12 | LAST_UPD_ID |  |  |  | VARCHAR (30) | User who last updated the record. |
| 13 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_SA_CONSTANTS

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in SA_CONSTANTS.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1 |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | DELETE_IND |  |  |  | VARCHAR (1 ) | This field contains whether or not the constant can be deleted. |
| 7 | VALUE_DATA_TYPE |  |  |  | VARCHAR (6 ) | This field contains the data type of the constant value. Valid values are on the code tables with a code type of DTTP. |
| 8 | CONSTANT_VALUE |  |  |  | VARCHAR (14 ) | This field contains the value of the constant. |
| 9 | CONSTANT_NAME |  |  |  | VARCHAR (250 ) | This field contains a name for the constant. |
| 10 | CONSTANT_ID |  |  |  | VARCHAR (30 ) | This field contains a unique identifier for the constant. |
| 11 | CREATE_ID |  |  |  | VARCHAR (30 ) | This column holds the user id created the record. |
| 12 | CREATE_DATETIME |  |  |  | Date | This column holds the timestamp when the record is created. |
| 13 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | This column holds the user id Last Updated the record. |
| 14 | LAST_UPD_DATETIME |  |  |  | Date | This column holds the timestamp when the record is Last Updated. |

---

## Table: SVC_SA_CONSTANTS_TL

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in SA_CONSTANTS_TL.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1 |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | CONSTANT_NAME |  |  |  | VARCHAR (250 ) | This field contains a name for the constant. |
| 7 | CONSTANT_ID |  |  |  | VARCHAR (30 ) | This field contains a unique identifier for the constant. |
| 8 | LANG |  |  |  | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 9 | CREATE_ID |  |  |  | VARCHAR (30 ) | This column holds the user id created the record. |
| 10 | CREATE_DATETIME |  |  |  | Date | This column holds the timestamp when the record is created. |
| 11 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | This column holds the user id Last Updated the record. |
| 12 | LAST_UPD_DATETIME |  |  |  | Date | This column holds the timestamp when the record is Last Updated. |

---

## Table: SVC_SA_ERROR_CODES

**Description:** This is the staging table for the error code information. It is used to temporarily hold data before it is uploaded/updated in SA_ERROR_CODES

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk.The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | ERROR_CODE |  |  |  | VARCHAR (25 ) | This field contains a unique error code. |
| 7 | ERROR_DESC |  |  |  | VARCHAR (255 ) | This field contains the error description. |
| 8 | TARGET_FORM |  |  |  | VARCHAR (6 ) | This field contains the form that the user should navigate to in order to fix the current error. Valid values are on the code tables with a code |
| 9 | TARGET_TAB |  |  |  | VARCHAR (6 ) | This field contains the tab to navigate to in the given form. This field is only used if the form field contains a form that contains a tabular canvas. Valid values are on the code tables with a code type of TABS. |
| 10 | REC_SOLUTION |  |  |  | VARCHAR (255 ) | This field contains the recommended solution for the error. |
| 11 | REQUIRED_IND |  |  |  | VARCHAR (1 ) | Indicates whether or not the error code is system required. |
| 12 | HQ_OVERRIDE_IND |  |  |  | VARCHAR (1 ) | This field indicates whether or not a head office employee can override the error. |
| 13 | STORE_OVERRIDE_IND |  |  |  | VARCHAR (1 ) | This field indicates whether or not a store employee can override the error. |
| 14 | CREATE_ID |  |  |  | VARCHAR (30) | User who created the record. |
| 15 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 16 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 17 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |
| 18 | SHORT_DESC |  |  |  | VARCHAR (40 BYTE) | This field contains the short error description. |

---

## Table: SVC_SA_ERROR_IMPACT

**Description:** This is the staging table for Error Impact data. It is used to temporarily hold data before it is uploaded/updated in SA_ERROR_IMPACT

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk.The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | ERROR_CODE |  |  |  | VARCHAR (25 ) | This field contains a unique error code. |
| 7 | SYSTEM_CODE |  |  |  | VARCHAR (6 ) | This field contains the error category code. Error categories are defined based on the types of exports in the system. For example, an RMS Export category, or an RA Export category, etc. All errors for a particular category must be passed before any associated data can be exported. Valid values are defined on the code tables with a code type of SYSE. |
| 8 | REQUIRED_IND |  |  |  | VARCHAR (1 ) | Indicates whether or not the system impacted by the error is required. |
| 9 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 10 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 11 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 12 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_SA_FIF_GL_CROSS_REF

**Description:** This is the staging table for the data that is used to associate an Oracle account code with the different types of totals that can be calculated by Sales Audit. It is used to temporarily hold data before it is uploaded/updated in SA_FIF_GL_CROSS_REF

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk.The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | STORE |  |  |  | NUMERIC (10) | Location that account code is valid for. |
| 7 | TOTAL_ID |  |  |  | VARCHAR (10 ) | Which type of total the account is valid for. |
| 8 | ROLLUP_LEVEL_1 |  |  |  | VARCHAR (30 ) | First rollup level of total. |
| 9 | ROLLUP_LEVEL_2 |  |  |  | VARCHAR (30 ) | Second rollup level of total. |
| 10 | ROLLUP_LEVEL_3 |  |  |  | VARCHAR (30 ) | Third rollup level of total. |
| 11 | SET_OF_BOOKS_ID |  |  |  | NUMERIC (15) | Oracle set of books for Oracle Retail transactions. |
| 12 | DR_CCID |  |  |  | NUMERIC (15) | Debit CCID (Oracle Financials account code). |
| 13 | DR_SEQUENCE1 |  |  |  | VARCHAR (25 ) | Oracle debit account mapping field1, maps to Oracle side GL_Code _combinations table |
| 14 | DR_SEQUENCE2 |  |  |  | VARCHAR (25 ) | Oracle debit account mapping field2, maps to Oracle side GL_Code _combinations table |
| 15 | DR_SEQUENCE3 |  |  |  | VARCHAR (25 ) | Oracle debit account mapping field3, maps to Oracle side GL_Code _combinations table |
| 16 | DR_SEQUENCE4 |  |  |  | VARCHAR (25 ) | Oracle debit account mapping field4, maps to Oracle side GL_Code _combinations table |
| 17 | DR_SEQUENCE5 |  |  |  | VARCHAR (25 ) | Oracle debit account mapping field5, maps to Oracle side GL_Code _combinations table |
| 18 | DR_SEQUENCE6 |  |  |  | VARCHAR (25 ) | Oracle debit account mapping field6, maps to Oracle side GL_Code _combinations table |
| 19 | DR_SEQUENCE7 |  |  |  | VARCHAR (25 ) | Oracle debit account mapping field7, maps to Oracle side GL_Code _combinations table |
| 20 | DR_SEQUENCE8 |  |  |  | VARCHAR (25 ) | Oracle debit account mapping field8, maps to Oracle side GL_Code _combinations table |
| 21 | DR_SEQUENCE9 |  |  |  | VARCHAR (25 ) | Oracle debit account mapping field9, maps to Oracle side GL_Code _combinations table |
| 22 | DR_SEQUENCE10 |  |  |  | VARCHAR (25 ) | Oracle debit account mapping field10, maps to Oracle side GL_Code _combinations table |
| 23 | DR_SEQUENCE11 |  |  |  | VARCHAR (25 ) | Oracle debit account mapping field11, maps to Oracle side GL_Code _combinations table |
| 24 | DR_SEQUENCE12 |  |  |  | VARCHAR (25 ) | Oracle debit account mapping field12, maps to Oracle side GL_Code _combinations table |
| 25 | DR_SEQUENCE13 |  |  |  | VARCHAR (25 ) | Oracle debit account mapping field13, maps to Oracle side GL_Code _combinations table |
| 26 | DR_SEQUENCE14 |  |  |  | VARCHAR (25 ) | Oracle debit account mapping field14, maps to Oracle side GL_Code _combinations table |
| 27 | DR_SEQUENCE15 |  |  |  | VARCHAR (25 ) | Oracle debit account mapping field15, maps to Oracle side GL_Code _combinations table |
| 28 | DR_SEQUENCE16 |  |  |  | VARCHAR (25 ) | Oracle debit account mapping field16, maps to Oracle side GL_Code _combinations table |
| 29 | DR_SEQUENCE17 |  |  |  | VARCHAR (25 ) | Oracle debit account mapping field17, maps to Oracle side GL_Code _combinations table |
| 30 | DR_SEQUENCE18 |  |  |  | VARCHAR (25 ) | Oracle debit account mapping field18, maps to Oracle side GL_Code _combinations table |
| 31 | DR_SEQUENCE19 |  |  |  | VARCHAR (25 ) | Oracle debit account mapping field19, maps to Oracle side GL_Code _combinations table |
| 32 | DR_SEQUENCE20 |  |  |  | VARCHAR (25 ) | Oracle debit account mapping field20, maps to Oracle side GL_Code _combinations table |
| 33 | CR_CCID |  |  |  | NUMERIC (15) | Credit CCID (Oracle Financials account code). |
| 34 | CR_SEQUENCE1 |  |  |  | VARCHAR (25 ) | Oracle credit account mapping field1, maps to Oracle side GL_Code _combinations table |
| 35 | CR_SEQUENCE2 |  |  |  | VARCHAR (25 ) | Oracle credit account mapping field2, maps to Oracle side GL_Code _combinations table |
| 36 | CR_SEQUENCE3 |  |  |  | VARCHAR (25 ) | Oracle credit account mapping field3, maps to Oracle side GL_Code _combinations table |
| 37 | CR_SEQUENCE4 |  |  |  | VARCHAR (25 ) | Oracle credit account mapping field4, maps to Oracle side GL_Code _combinations table |
| 38 | CR_SEQUENCE5 |  |  |  | VARCHAR (25 ) | Oracle credit account mapping field5, maps to Oracle side GL_Code _combinations table |
| 39 | CR_SEQUENCE6 |  |  |  | VARCHAR (25 ) | Oracle credit account mapping field6, maps to Oracle side GL_Code _combinations table |
| 40 | CR_SEQUENCE7 |  |  |  | VARCHAR (25 ) | Oracle credit account mapping field7, maps to Oracle side GL_Code _combinations table |
| 41 | CR_SEQUENCE8 |  |  |  | VARCHAR (25 ) | Oracle credit account mapping field8, maps to Oracle side GL_Code _combinations table |
| 42 | CR_SEQUENCE9 |  |  |  | VARCHAR (25 ) | Oracle credit account mapping field9, maps to Oracle side GL_Code _combinations table |
| 43 | CR_SEQUENCE10 |  |  |  | VARCHAR (25 ) | Oracle credit account mapping field10, maps to Oracle side GL_Code _combinations table |
| 44 | CR_SEQUENCE11 |  |  |  | VARCHAR (25 ) | Oracle credit account mapping field11, maps to Oracle side GL_Code _combinations table |
| 45 | CR_SEQUENCE12 |  |  |  | VARCHAR (25 ) | Oracle credit account mapping field12, maps to Oracle side GL_Code _combinations table |
| 46 | CR_SEQUENCE13 |  |  |  | VARCHAR (25 ) | Oracle credit account mapping field13, maps to Oracle side GL_Code _combinations table |
| 47 | CR_SEQUENCE14 |  |  |  | VARCHAR (25 ) | Oracle credit account mapping field14, maps to Oracle side GL_Code _combinations table |
| 48 | CR_SEQUENCE15 |  |  |  | VARCHAR (25 ) | Oracle credit account mapping field15, maps to Oracle side GL_Code _combinations table |
| 49 | CR_SEQUENCE16 |  |  |  | VARCHAR (25 ) | Oracle credit account mapping field16, maps to Oracle side GL_Code _combinations table |
| 50 | CR_SEQUENCE17 |  |  |  | VARCHAR (25 ) | Oracle credit account mapping field17, maps to Oracle side GL_Code _combinations table |
| 51 | CR_SEQUENCE18 |  |  |  | VARCHAR (25 ) | Oracle credit account mapping field18, maps to Oracle side GL_Code _combinations table |
| 52 | CR_SEQUENCE19 |  |  |  | VARCHAR (25 ) | Oracle credit account mapping field19, maps to Oracle side GL_Code _combinations table |
| 53 | CR_SEQUENCE20 |  |  |  | VARCHAR (25 ) | Oracle credit account mapping field20, maps to Oracle side GL_Code _combinations table |
| 54 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 55 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 56 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 57 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_SA_REFERENCE

**Description:** This is the staging table for Reference Field. It is used to temporarily hold data before it is uploaded/updated in SA_REFERENCE

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk.The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | REF_LABEL_CODE |  |  | Y | VARCHAR (6 ) | Contains the code of the label to be displayed for the reference field with the corresponding reference number. The decode of the label is on the code detail table with a code type of REFL. |
| 7 | REF_NO |  |  |  | NUMERIC (2) | Which ref_no field the value is mapped to. |
| 8 | REASON_CODE |  |  |  | VARCHAR (6 ) | If the transaction type field has a value, this field may contain a reason code for certain Transaction Types. Valid values are defined on the code tables with a code type of REAC. |
| 9 | SUB_TRAN_TYPE |  |  |  | VARCHAR (6 ) | If the transaction type field has a value, this field may contain the transaction sub type for certain Transaction Types. Valid values are defined on the code tables with a code type of TRAS. |
| 10 | TRAN_TYPE |  |  |  | VARCHAR (6 ) | Type of transaction. Valid values are defined on the code tables with a code type of TRAT. |
| 11 | CREATE_ID |  |  |  | VARCHAR (30 ) | Holds the user id of the user who created the record. |
| 12 | CREATE_DATETIME |  |  |  | Date | This column holds the record creation date. |
| 13 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | Holds the Oracle user-id of the user who most recently updated this record. |
| 14 | LAST_UPD_DATETIME |  |  |  | Date | This column holds the record updation date. |

---

## Table: SVC_SA_ROUNDING_RULE_DETAIL

**Description:** This is the staging table for holding the details of the rounding rules. It is used to temporarily hold data before it is uploaded/updated in SA_ROUNDING_RULE_DETAIL

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk.The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 BYTE) | Describes type of action i.e. NEW, MOD or DEL |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 BYTE) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | ROUNDING_RULE_ID |  |  |  | VARCHAR (10 BYTE) | This field contains the rounding rule id. |
| 7 | LOW_ENDING_AMT |  |  |  | NUMERIC (20,4) | This field contatins the low ending amount of the rounding rule. |
| 8 | HIGH_ENDING_AMT |  |  |  | NUMERIC (20,4) | This field contains the high ending amount of the rounding rule. |
| 9 | ROUND_AMT |  |  |  | NUMERIC (20,4) | This file contains the rounded amount of the rounding rule. |
| 10 | CREATE_ID |  |  |  | VARCHAR (30 BYTE) | User who created the record. |
| 11 | CREATE_DATETIME |  |  |  | Date (7) | Date time when record was inserted. |
| 12 | LAST_UPD_ID |  |  |  | VARCHAR (30 BYTE) | User who last updated the record. |
| 13 | LAST_UPD_DATETIME |  |  |  | Date (7) | Date time when record was last updated. |

---

## Table: SVC_SA_ROUNDING_RULE_HEAD

**Description:** This is the staging table for holding the header information of the rounding rules. It is used to temporarily hold data before it is uploaded/updated in SA_ROUNDING_RULE_HEAD

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk.The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | ROUNDING_RULE_ID |  |  |  | VARCHAR (10 ) | This field contains the rounding rule id. |
| 7 | ROUNDING_RULE_NAME |  |  |  | VARCHAR (255 ) | This field contains the description of the rounding rule. |
| 8 | CURRENCY_CODE |  |  |  | VARCHAR (3 ) | This field contains the currency code of the rounding rule. |
| 9 | COUNTRY_ID |  |  |  | VARCHAR (3 ) | This field contains the country id of the rounding rule. |
| 10 | START_BUSINESS_DATE |  |  |  | Date | This field contains the effective business date of the rounding rule. |
| 11 | STATUS |  |  |  | VARCHAR (1 ) | This field contains the status of the rounding rule. |
| 12 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 13 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 14 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 15 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_SA_ROUNDING_RULE_HEAD_TL

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated to SA_ROUNDING_RULE_HEAD_TL

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ |  |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | LANG |  |  |  | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 7 | ROUNDING_RULE_ID |  |  |  | VARCHAR (10 ) | This field contains the rounding rule id. |
| 8 | ROUNDING_RULE_NAME |  |  |  | VARCHAR (255 ) | This field contains the description of the rounding rule. |

---

## Table: SVC_SA_STORE_DATA

**Description:** This is the staging table for the Store Data. It is used to temporarily hold data before it is uploaded/updated in SA_STORE_DATA

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk.The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | STORE |  |  |  | NUMERIC (10) | This field contains the Store that the data is related to. |
| 7 | SYSTEM_CODE |  |  |  | VARCHAR (6 ) | This field will hold the name of the external system that produced the file. Valid values can be found on the code_detail table with the code_type of SYSI or SYSE. |
| 8 | IMP_EXP |  |  |  | VARCHAR (6 ) | This field indicates whether the file expected is an import (I) files or and export (E) file. Valid values are on the code tables with a code type of IMEX. |
| 9 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 10 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 11 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 12 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_SCAC

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in SCAC.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | SCAC_CODE |  |  |  | VARCHAR (6 ) | Contains the unique key that identifies the scac record. |
| 7 | SCAC_CODE_DESC |  |  |  | VARCHAR (120 ) | Contains the description of the SCAC Code. |
| 8 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 9 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 10 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 11 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_SCAC_TL

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in SCAC_TL.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | LANG |  |  |  | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 7 | SCAC_CODE |  |  |  | VARCHAR (6) | Contains the unique key that identifies the scac record. |
| 8 | SCAC_CODE_DESC |  |  |  | VARCHAR (120) | Contains the description of the SCAC Code. |

---

## Table: SVC_SEASONS

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in SEASONS.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | SEASON_ID |  |  |  | NUMERIC (3) | This field contains the unique identifier for season. |
| 7 | SEASON_DESC |  |  |  | VARCHAR (120 ) | This field contains the description associated with the season. |
| 8 | START_DATE |  |  |  | Date | This field contains the starting date for the season. |
| 9 | END_DATE |  |  |  | Date | This field contains the ending date for the season. |
| 10 | FILTER_ORG_ID |  |  |  | NUMERIC (10) | The ID of the organziational hierarchy to which the season is assigned. |
| 11 | FILTER_MERCH_ID |  |  |  | NUMERIC (4) | The ID of the merchandise hierarchy to which the season is assigned. |
| 12 | FILTER_MERCH_ID_CLASS |  |  |  | NUMERIC (4) | If SECURITY_CONFIG_OPTIONS.SEASON_MERCH_LEVEL_CODE is C (class) or S (subclass), then the FILTER_MERCH_ID column on this table will hold the department and the class associated with that department is held in this column. |
| 13 | FILTER_MERCH_ID_SUBCLASS |  |  |  | NUMERIC (4) | If SECURITY_CONFIG_OPTIONS.SEASON_MERCH_LEVEL_CODE is S (subclass), then the FILTER_MERCH_ID column on this table will hold the department, FILTER_MERCH_ID_CLASS will hold the class and the subclass associated with that department is held in this column. |
| 14 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 15 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 16 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 17 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_SEASONS_TL

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in SEASONS_TL.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 BYTE) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 BYTE) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | LANG |  |  |  | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 7 | SEASON_ID |  |  |  | NUMERIC (3) | This field contains the unique identifier for season. |
| 8 | SEASON_DESC |  |  |  | VARCHAR (120 BYTE) | This field contains the description associated with the season. |

---

## Table: SVC_SEC_GROUP

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in SEC_GROUP.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | GROUP_ID |  |  |  | NUMERIC (4) | Contains the unique identifier associated with the group. |
| 7 | GROUP_NAME |  |  |  | VARCHAR (40 ) | Contains the name of the security group. |
| 8 | ROLE |  |  |  | VARCHAR (30 ) | This field contains the role that a client wants to assign to this group. This field is referenced in the code type ROLE. There are no pre-defined values for this field and it is completely user-defined. |
| 9 | COMMENTS |  |  |  | VARCHAR (2000 ) | Comments. |
| 10 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 11 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 12 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 13 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_SEC_GROUP_LOC_MATRIX

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in SEC_GROUP_LOC_MATRIX.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | UPDATE_IND |  |  |  | VARCHAR (1 ) | Value of this column indicates whether the user has insert, update and delete privileges. |
| 7 | SELECT_IND |  |  |  | VARCHAR (1 ) | Value of this column indicates whether the user has select privileges. |
| 8 | WH |  |  |  | NUMERIC (10) | Contains the unique number identifying the warehouse in the organisational hierarchy. |
| 9 | STORE |  |  |  | NUMERIC (10) | Contains the unique number identifying the store in the organisational hierarchy. |
| 10 | DISTRICT |  |  |  | NUMERIC (10) | Contains the unique number identifying the district in the organisational hierarchy. |
| 11 | REGION |  |  |  | NUMERIC (10) | Contains the unique number identifying the region in the organisational hierarchy. |
| 12 | GROUP_ID |  |  |  | NUMERIC (4) | Contains the unique identifier associated with the group. |
| 13 | COLUMN_CODE |  |  |  | VARCHAR (6 ) | Contains a 6 digit code which identifies the functional area to which the security applies. |
| 14 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 15 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 16 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 17 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_SEC_GROUP_TL

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in SEC_GROUP_TL.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | LANG |  |  |  | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 7 | GROUP_ID |  |  |  | NUMERIC (4) | Contains the unique identifier associated with the group. |
| 8 | GROUP_NAME |  |  |  | VARCHAR (40 ) | Contains the name of the security group. |
| 9 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 10 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 11 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 12 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_SEC_USER

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in SEC_USER.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | APPLICATION_USER_ID |  |  |  | VARCHAR (30 ) | This column holds the application user id set up in enterprise LDAP for the security user. |
| 7 | DATABASE_USER_ID |  |  |  | VARCHAR (30 ) | This column holds the database user login id assigned to the security user. It is used to login to applications like RMS. All database user ids must be defined on the USER_ATTRIB table. |
| 8 | USER_SEQ |  |  |  | NUMERIC (15) | This is a sequence generated number that uniquely identifies a security user. |
| 9 | ALLOCATION_USER_IND |  |  |  | VARCHAR (1 ) | This field will indicate whether the user is an Allocation User. Valid values are Y/N. |
| 10 | REIM_USER_IND |  |  |  | VARCHAR (1 ) | This field will indicate whether the user is a ReIM User. Valid values are Y/N. |
| 11 | RESA_USER_IND |  |  |  | VARCHAR (1 ) | This field will indicate whether the user is a ReSA User. Valid values are Y/N. |
| 12 | RMS_USER_IND |  |  |  | VARCHAR (1 ) | This field will indicate whether the user is a RMS User. Valid values are Y/N. |
| 13 | MANAGER |  |  |  | NUMERIC (15) | This field holds the user_seq of the manager for the application. Manager should be entered as a user earlier on. |
| 14 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 15 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 16 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 17 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_SEC_USER_GROUP

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in SEC_USER_GROUP.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1 |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | USER_SEQ |  |  |  | NUMERIC (15) | This column holds the security user assigned to the security group. It references the user sequence defined on the SEC_USER table. |
| 7 | GROUP_ID |  |  |  | NUMERIC (4) | This column holds the security group the security user belongs to. It references the group id defined on the SEC_GROUP table. |
| 8 | CREATE_ID |  |  |  | VARCHAR (30 ) | This column holds the user id created the record. |
| 9 | CREATE_DATETIME |  |  |  | Date | This column holds the timestamp when the record is created. |
| 10 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | This column holds the user id Last Updated the record. |
| 11 | LAST_UPD_DATETIME |  |  |  | Date | This column holds the timestamp when the record is Last Updated. |

---

## Table: SVC_SEC_USER_ROLE

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in SEC_USER_ROLE.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | USER_SEQ |  |  |  | NUMERIC (15) | This is a sequence generated number that uniquely identifies a security user. |
| 7 | ROLE |  |  |  | VARCHAR (30 ) | This field contains the role the user belongs to. |
| 8 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 9 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 10 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 11 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_STATE

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in STATE.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | COUNTRY_ID |  |  |  | VARCHAR (3) | Contains the unique code which identifies the country where the state belongs. |
| 7 | DESCRIPTION |  |  |  | VARCHAR (120) | Contains the full name of the state. |
| 8 | STATE |  |  |  | VARCHAR (3) | This column contains the state abbreviation for the address. |
| 9 | CREATE_ID |  |  |  | VARCHAR (30) | User who created the record. |
| 10 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 11 | LAST_UPD_ID |  |  |  | VARCHAR (30) | User who last updated the record. |
| 12 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_STATE_TL

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in STATE_TL.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | DESCRIPTION |  |  |  | VARCHAR (120) | Contains the full name of the state. |
| 7 | COUNTRY_ID |  |  |  | VARCHAR (3) | Contains the unique code which identifies the country where the state belongs. |
| 8 | STATE |  |  |  | VARCHAR (3) | This column contains the state abbreviation for the address. |
| 9 | LANG |  |  |  | NUMERIC (6) | Contains the number which uniquely identifies a language. |
| 10 | CREATE_ID |  |  |  | VARCHAR (30) | User who created the record. |
| 11 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 12 | LAST_UPD_ID |  |  |  | VARCHAR (30) | User who last updated the record. |
| 13 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_STKUPLD_FDETL

**Description:** This table is an interface tables in the stock upload process. It holds item-related information for a stock count. The fields of this table maps to the FDETL record layout in an RMS stock upload file with the exception of some process-related fields.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID |  |  |  | NUMERIC (15) | Unique id that identifies a stock upload process. It can either be manually provided or automatically provided. The value in this table maps to a single STKUPLD_FHEAD record. |
| 2 | CHUNK_ID |  |  |  | NUMERIC (10) | This is used to divide data associated with the same process_id into multiple chunks to facilitate parallel processing. For the same process_id, chunk_id starts with 1 and increment by 1 for each new chunk. |
| 3 | FILE_RECORD_DESCRIPTOR |  |  |  | VARCHAR (5) | Describes the file line type. Valid rows have the value FDETL. |
| 4 | FILE_LINE_ID |  |  |  | NUMERIC (10) | Identifies a unique line in the RMS stock upload file. These are sequential for a single file. |
| 5 | ITEM_TYPE |  |  |  | VARCHAR (3) | The type of item in the stock count. Transaction-level items are identified with "ITM". Items below transaction-level are identified with REF. |
| 6 | ITEM_VALUE |  |  |  | VARCHAR (25) | The item in the stock count. |
| 7 | INVENTORY_QUANTITY |  |  |  | NUMERIC (12) | Total quantity count * 10000 (4 implied decimal places) for the store or warehouse. |
| 8 | LOCATION_DESCRIPTION |  |  |  | VARCHAR (150) | Description of the location where the stock count was done. |
| 9 | STATUS |  |  |  | VARCHAR (1) | Contains the status of the detail record. Valid values are N = New, E = Error, R = Rejected, and P = Processed. |
| 10 | ERROR_MSG |  |  |  | VARCHAR (255) | Contains the error message if any during the stock upload process. Error |

---

## Table: SVC_STKUPLD_FHEAD

**Description:** This table is an interface tables in the stock upload process. It holds header-related information for a stock count. The fields of this table maps to the FHEAD record layout in an RMS stock upload file with the exception of some process-related fields. A unique stock count is identified by the process id.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID |  |  |  | NUMERIC (15) | Unique id that identifies a stock upload process. It can either be manually provided or automatically provided. |
| 2 | FILE_RECORD_DESCRIPTOR |  |  |  | VARCHAR (5) | Describes the file line type. Valid rows have the value FHEAD. |
| 3 | FILE_LINE_ID |  |  |  | NUMERIC (10) | Identifies a unique line in the RMS stock upload file. These are sequential for a single file. |
| 4 | FILE_TYPE |  |  |  | VARCHAR (4) | Identifies the file type. Files for stock upload are identified as STKU. |
| 5 | FILE_CREATE_DATE |  |  |  | Date | The date the stock upload file was created in YYYYMMDDHH24MISS format. |
| 6 | STOCK_TAKE_DATE |  |  |  | Date | The date the stock count took place in YYYYMMDDHH24MISS format. |
| 7 | CYCLE_COUNT |  |  |  | NUMERIC (8) | Unique number that identifies a stock count in RMS. |
| 8 | LOCATION_TYPE |  |  |  | VARCHAR (1) | The location type of the location where the stock count was taken. Valid values are: S = store, W = warehouse, E = external finisher. |
| 9 | LOCATION |  |  |  | NUMERIC (10) | The location where the stock count was done. |
| 10 | STATUS |  |  |  | VARCHAR (1) | Contains the status of the header record. Valid values are N = New, E = Error, R = Rejected, and P = Processed. |
| 11 | ERROR_MSG |  |  |  | VARCHAR (255) | Contains the error message if any during the stock upload process. Error in this table are specific to stock count header information. Error messages are stored as the output the SQL_LIB.CREATE_MSG function. Multiple error messages are possible for a single record if the error is non-fatal. Multiple error messages are concatenated together. |

---

## Table: SVC_STKUPLD_FTAIL

**Description:** This table is an interface tables in the stock upload process. It serves as the end-of-file marker in an RMS stock count file. There should only be a single row in this table for a specific stock count. The fields of this table maps to the FTAIL record layout in an RMS stock upload file with the exception of some process-related fields.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID |  |  |  | NUMERIC (15) | Unique id that identifies a stock upload process. It can either be manually provided or automatically provided. |
| 2 | FILE_RECORD_DESCRIPTOR |  |  |  | VARCHAR (5) | Describes the file line type. Valid rows have the value FTAIL. |
| 3 | FILE_LINE_ID |  |  |  | NUMERIC (10) | Identifies a unique line in the RMS stock upload file. These are sequential for a single file. |
| 4 | FILE_RECORD_COUNT |  |  |  | NUMERIC (10) | Contains the total number of detail records in the SVC_STKUPLD_FDETL table for this process ID. |
| 5 | STATUS |  |  |  | VARCHAR (1) | Contains the status of the tail record. Valid values are N = New, E = Error, R = Rejected, and P = Processed. |
| 6 | ERROR_MSG |  |  |  | VARCHAR (255) | Contains the error message if any during the stock upload process. Error in this table are specific to stock count tail information. Error messages are stored as the output the SQL_LIB.CREATE_MSG function. Multiple error messages are possible for a single record if the error is non-fatal. Multiple error messages are concatenated together. |

---

## Table: SVC_STKUPLD_STATUS

**Description:** This table is an interface tables used in the stock upload process. It is used for status tracking and program control.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID |  |  |  | NUMERIC (15) | Unique id that identifies a stock upload process. It can either be manually provided or automatically generated. |
| 2 | CHUNK_ID |  |  |  | NUMERIC (10) | This is used to divide data associated with the same process_id into multiple chunks to facilitate parallel processing. For the same process_id, chunk_id starts with 1 and increment by 1 for each new chunk. |
| 3 | REFERENCE_ID |  |  |  | VARCHAR (255) | Contains a value that references the source for the data in the parameter tables. In batch execution, this is the filename of the stock upload file. |
| 4 | STATUS |  |  |  | VARCHAR (1) | Status of the stock upload execution for a particular process ID and chunk ID. Valid values are: N - New, R = Reprocess, P = Processed, J = Reject, E = Error. |
| 5 | ERROR_MSG |  |  |  | VARCHAR (255) | Contains the error message for this record. Error messages are stored as the output the SQL_LIB.CREATE_MSG function. Multiple error messages are possible for a single record if the error is non-fatal. Multiple error messages are concatenated together. |
| 6 | LAST_UPDATE_DATETIME |  |  |  | Date | Contains the date and time this status row was updated. |

---

## Table: SVC_SUP_AVAIL

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in SUP_AVAIL.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | SUPPLIER |  |  |  | NUMERIC (10) | This field contains the vendor number who will declare the merchandise available. |
| 7 | ITEM |  |  |  | VARCHAR (25 ) | Unique identifier for the item. |
| 8 | REF_ITEM |  |  |  | VARCHAR (25 ) | Unique alphanumeric value that identifies the reference item. |
| 9 | QTY_AVAIL |  |  |  | NUMERIC (12,4) | This field contains the total number of items for this SKU that the supplier has agreed as available. |
| 10 | LAST_UPDATE_DATE |  |  |  | Date | This field contains the last date the availability for this item has been manually modified. |
| 11 | LAST_DECLARED_DATE |  |  |  | Date | This field contains the last date the supplier has declared availability via EDI. |
| 12 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 13 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 14 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 15 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_SUP_TRAITS

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in SUP_TRAITS.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | SUP_TRAIT |  |  |  | NUMERIC (4) | This field contains the number that uniquely identifies the supplier trait. |
| 7 | DESCRIPTION |  |  |  | VARCHAR (120 ) | This field contains the description associated with the supplier trait. |
| 8 | MASTER_SUP_IND |  |  |  | VARCHAR (1 ) | This field indicates whether the trait is a master supplier trait or not. Valid values for this field are Y and N. |
| 9 | MASTER_SUP |  |  |  | VARCHAR (10 ) | If this supplier trait is a master supplier trait, then this field can contain the number of the master supplier. |
| 10 | CREATE_ID |  |  |  | VARCHAR (30 ) | This column holds the User id of the user who created the record. |
| 11 | CREATE_DATETIME |  |  |  | Date | This column holds the record creation date. |
| 12 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 13 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_SUP_TRAITS_TL

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in SUP_TRAITS_TL.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 BYTE) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 BYTE) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | LANG |  |  |  | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 7 | SUP_TRAIT |  |  |  | NUMERIC (4) | This field contains the number that uniquely identifies the supplier trait. |
| 8 | DESCRIPTION |  |  |  | VARCHAR (120 BYTE) | This field contains the description associated with the supplier trait. |

---

## Table: SVC_SVC_ORDER_PARAMETER_CONFIG

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in SVC_CORESVC_ITEM_CONFIG.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | APPLY_DEALS |  |  |  | VARCHAR (1) | Indicates whether or not deals are to be applied on the purchase order. Valid values are Y or N. |
| 7 | APPLY_SCALING |  |  |  | VARCHAR (1) | Indicates whether or not scaling are to be performed on the quantities in the purchase order. Valid values are Y or N. |
| 8 | SKIP_OPEN_SHIPMENT |  |  |  | VARCHAR (1) | Indicates whether or not open shipments linked to the PO will be cancelled when the order is cancelled. Cancelled shipments cannot be reinstated. Valid values are Y or N. |
| 9 | CANCEL_ALLOC |  |  |  | VARCHAR (1) | Indicates whether or not PO linked allocations will be cancelled when the order is cancelled or set to worksheet status. |
| 10 | RECALC_REPLENISHMENT |  |  |  | VARCHAR (1) | Indicates whether or not replenishment results are to be recalculated. Valid values are Y or N. |
| 11 | OTB_OVERRIDE |  |  |  | VARCHAR (1) | Indicates whether or not PO approval will be allowed even if OTB limits have been exceeded. Valid values are Y or N. |
| 12 | MAX_ORDER_EXPIRY_DAYS |  |  |  | NUMERIC (4) | Contains the maximum number of days that can be set for the order expiry days. |
| 13 | MAX_ORDER_NO_QTY |  |  |  | NUMERIC (4) | The maximum number of order numbers that can be preissued in one request. |
| 14 | WAIT_BTWN_THREADS |  |  |  | NUMERIC (10) | This is the number of milliseconds between submission of two threads. |
| 15 | MAX_THREADS |  |  |  | NUMERIC (10) | This is the maximum number of threads that should be spawned for the coresvc_po package. |
| 16 | MAX_CHUNK_SIZE |  |  |  | NUMERIC (10) | The maximum number of orders that should be processed in one chunk. |
| 17 | APPLY_BRACKETS |  |  |  | VARCHAR (1) | Indicates whether or not brackets are to be applied to the purchase order. Valid values are Y or N. |
| 18 | OVERRIDE_MANL_COST_SRC |  |  |  | VARCHAR (1) | Indicates whether or not manual costs will be overridden when deals are applied. Valid values are Y or N. |
| 19 | CREATE_ID |  |  |  | VARCHAR (30) | User who created the record. |
| 20 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 21 | LAST_UPD_ID |  |  |  | VARCHAR (30) | User who last updated the record. |
| 22 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_TARIFF_TREATMENT

**Description:** This is a staging table used for Admin API spreadsheet upload process. It is used to temporarily hold data before it is uploaded/updated in TARIFF_TREATMENT.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | TARIFF_TREATMENT |  |  |  | VARCHAR (10 ) | Contains the customs approved code to uniquely identify a special tariff program. |
| 7 | TARIFF_TREATMENT_DESC |  |  |  | VARCHAR (120 ) | Contains the description for the tariff treatment ID. Example: NAFTA is North American Free Trade Agreement. |
| 8 | CONDITIONAL_IND |  |  |  | VARCHAR (1 ) | Indicates whether items to be imported must be manually declared eligible for the tariff treatment. |
| 9 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 10 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 11 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 12 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_TARIFF_TREATMENT_TL

**Description:** This is a staging table used for Admin API spreadsheet upload process. It is used to temporarily hold data before it is uploaded/updated in TARIFF_TREATMENT_TL.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | LANG |  |  |  | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 7 | TARIFF_TREATMENT |  |  |  | VARCHAR (10 ) | Contains the customs approved code to uniquely identify a special tariff program. |
| 8 | TARIFF_TREATMENT_DESC |  |  |  | VARCHAR (120 ) | Contains the description for the tariff treatment ID. Example: NAFTA is North American Free Trade Agreement. |
| 9 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 10 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 11 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 12 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_TERMS_HEAD

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in TERMS_HEAD.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1 |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | RANK |  |  |  | NUMERIC (10) | Unique rank to rate invoice payment terms against purchase order terms (header table). |
| 7 | TERMS |  |  |  | VARCHAR (15 ) | Contains a number uniquely identifying the supplier terms. |
| 8 | CREATE_ID |  |  |  | VARCHAR (30 ) | This column holds the user id created the record. |
| 9 | CREATE_DATETIME |  |  |  | Date | This column holds the timestamp when the record is created. |
| 10 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | This column holds the user id Last Updated the record. |
| 11 | LAST_UPD_DATETIME |  |  |  | Date | This column holds the timestamp when the record is Last Updated. |
| 12 | TERMS_DESC |  |  |  | VARCHAR (240 ) | Contains a description of the supplier terms. For example: 2.5% 30 days. |
| 13 | TERMS_CODE |  |  |  | VARCHAR (50 ) | Indicates the Alphanumeric representation of Term Name which acts as the Term code in Oracle Financials. |

---

## Table: SVC_TERMS_HEAD_TL

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in TERMS_HEAD_TL.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1 |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | REVIEWED_IND |  |  |  | VARCHAR (1 ) | Indicates if the description needs to be reviewed for translation. It is set to 'N' when the description in the original language is inserted or updated. We assume that clients will regularly run reports on all strings that are not reviewed (i.e. reviewed_ind = 'N'). When translation either provides a new string, or OKs that the existing string is correct, the reviewed_ind should be set to 'Y'. |
| 7 | ORIG_LANG_IND |  |  |  | VARCHAR (1 ) | Indicates if the description is in the original language entered for the freight terms code. It is set to 'Y' when the first record is written to the table for the freight terms code. |
| 8 | TERMS_DESC |  |  |  | VARCHAR (240 ) | Contains a description of the supplier terms. For example: 2.5% 30 days. |
| 9 | TERMS_CODE |  |  |  | VARCHAR (50 ) | Indicates the Alphanumeric representation of Term Name which acts as the Term code in Oracle Financials. |
| 10 | LANG |  |  |  | NUMERIC (6) | Contains the number which uniquely identifies a language. |
| 11 | TERMS |  |  |  | VARCHAR (15 ) | Contains a number uniquely identifying the supplier terms. |
| 12 | CREATE_ID |  |  |  | VARCHAR (30 ) | This column holds the user id created the record. |
| 13 | CREATE_DATETIME |  |  |  | Date | This column holds the timestamp when the record is created. |
| 14 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | This column holds the user id Last Updated the record. |
| 15 | LAST_UPD_DATETIME |  |  |  | Date | This column holds the timestamp when the record is Last Updated. |

---

## Table: SVC_TICKET_TYPE_DETAIL

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in TICKET_TYPE_DETAIL.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | TICKET_TYPE_ID |  |  |  | VARCHAR (4 ) | This field contains a character string which uniquely identifies the ticket type and ties it to the appropriate TICKET_TYPE_HEAD record. |
| 7 | SEQ_NO |  |  |  | NUMERIC (4) | This field contains a number which along with the TICKET_TYPE_ID will make up the primary key for this table. A sequence number is required on this table because TICKET_TYPE_ID, TICKET_ITEM_ID, and UDA_ID, the fields that make a row unique, can have NULL values in both TICKET_ITEM_ID and UDA_ID. A unique index has been placed on these three items. |
| 8 | TICKET_ITEM_ID |  |  |  | VARCHAR (4 ) | This field contains a character string which uniquely identifies an attribute which will appear on a ticket or label such as retail price or price per unit of measure. Valid values for this field will come from the CODE_DETAIL table with CODE_TYPE = TCKT. |
| 9 | UDA_ID |  |  |  | NUMERIC (5) | This field contains a number which uniquely defines a user-defined attribute which is to be printed on this ticket type. Valid values for this field come from the UDA table. |

---

## Table: SVC_TICKET_TYPE_HEAD

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in TICKET_TYPE_HEAD.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | TICKET_TYPE_ID |  |  |  | VARCHAR (4 ) | This field contains a character string which uniquely identifies the ticket or label type. |
| 7 | TICKET_TYPE_DESC |  |  |  | VARCHAR (120 ) | This field contains a description of the ticket or label type. |
| 8 | SEL_IND |  |  |  | VARCHAR (1 ) | Indicates if the ticket type is a shelf edge label. |
| 9 | FILTER_ORG_ID |  |  |  | NUMERIC (10) | The ID of the Organizational Hierarchy that the Ticket Type is assigned to.This field will be used to control the Ticket Types a user can see in the |
| 10 | FILTER_MERCH_ID |  |  |  | NUMERIC (4) | The ID of the Merchandise Hierarchy that the Ticket Type is assigned to. This field will be used to control the Ticket Types a user can see in the Ticket Type LOV when the link between the user and the Merchandise Hierarchy has been established. |
| 11 | FILTER_MERCH_ID_CLASS |  |  |  | Date | The class ID of the merchandise hierarchy that the ticket type is assigned to. |
| 12 | FILTER_MERCH_ID_SUBCLASS |  |  |  | NUMERIC (4) | The sublass ID of the merchandise hierarchy that the ticket type is assigned to. |
| 13 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 14 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 15 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 16 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_TICKET_TYPE_HEAD_TL

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in TICKET_TYPE_HEAD_TL.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | LANG |  |  |  | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 7 | TICKET_TYPE_ID |  |  |  | VARCHAR (4) | This field contains a character string which uniquely identifies the ticket or label type. |
| 8 | TICKET_TYPE_DESC |  |  |  | VARCHAR (120) | This field contains a description of the ticket or label type. Indicates if the ticket type is a shelf edge label. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|SVC_TICKET_TYPE_HEAD_TL_PK|PK||||PROCESS_ID|ASC|
||||||ROW_SEQ|ASC|
|SVC_TICKET_TYPE_HEAD_TL_UK|UK||||LANG|ASC|
||||||TICKET_TYPE_ID|ASC|

---

## Table: SVC_TIMELINE_HEAD

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in TIMELINE_HEAD.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | TIMELINE_NO |  |  |  | NUMERIC (6) | This field contains a number that uniquely identifies the timeline. |
| 7 | TIMELINE_DESC |  |  |  | VARCHAR (120 ) | This field contains the description of the timeline. |
| 8 | TIMELINE_TYPE |  |  |  | VARCHAR (6 ) | This field will hold the module the timeline is referring to. Valid values are: PO - Purchase Orders at the Header Level POIT - Purchase Orders at the Item Level IT - Item Maintenance CE - Customs Entry LO - Logistics at the Header Level LOBL - Logistics at the Bill of Lading Level LOCO - Logistics at the Container Level LOPI - Logistics at the Purchase Order/Item Level LOCI - Logistics at the Commercial Invoice Level |
| 9 | TIMELINE_BASE |  |  |  | VARCHAR (3 ) | This field contains the basis for the timeline. The basis for the timeline will determine which date the timelines steps completion date is based on. Valid values for this field are: APD - based on the PO approval date NBD - based on the PO not before date NAD - based on the PO not after |
| 10 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 11 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 12 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 13 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_TIMELINE_HEAD_TL

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in TIMELINE_HEAD_TL.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | LANG |  |  |  | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 7 | TIMELINE_NO |  |  |  | NUMERIC (6) | This field contains a number that uniquely identifies the timeline. |
| 8 | TIMELINE_DESC |  |  |  | VARCHAR (120) | This field contains the description of the timeline. |

---

## Table: SVC_TIMELINE_STEPS

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in TIMELINE_STEPS.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | TIMELINE_NO |  |  |  | NUMERIC (6) | This field contains the number that uniquely defines the timeline. |
| 7 | STEP_NO |  |  |  | NUMERIC (4) | This field contains the number that uniquely defines the timeline step. |
| 8 | TIMELINE_TYPE |  |  |  | VARCHAR (6 ) | This field will hold the module the timeline is referring to. Valid values are: PO - Purchase Orders at the Header Level POIT - Purchase Orders at the Item Level IT - Item Maintenance CE - Customs Entry LO - Logistics at the Header Level LOBL - Logistics at the Bill of Lading Level LOCO - Logistics at the Container Level LOPI - Logistics at the Purchase Order/Item Level LOCI - Logistics at the Commercial Invoice Level |
| 9 | DAYS_COMPLETED |  |  |  | NUMERIC (3) | This field contains the estimated number of days for this timeline step to be completed based on the TIMELINE_BASE field on the TIMELINE |
| 10 | DISPLAY_SEQ |  |  |  | NUMERIC (4) | This field contains a number which will determine the display order of the steps. |
| 11 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 12 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 13 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 14 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_TIMELINE_STEP_COMP

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in TIMELINE_STEP_COMP.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | TIMELINE_TYPE |  |  |  | VARCHAR (6 ) | This field will hold the module the timeline is referring to. Valid values are: PO - Purchase Orders at the Header Level POIT - Purchase Orders at the Item Level IT - Item Maintenance CE - Customs Entry LO - Logistics at the Header Level LOBL - Logistics at the Bill of Lading Level LOCO - Logistics at the Container Level LOPI - Logistics at the Purchase Order/Item Level LOCI - Logistics at the Commercial Invoice Level. |
| 7 | STEP_NO |  |  |  | NUMERIC (4) | This field contains the number that uniquely defines the timeline step. |
| 8 | STEP_DESC |  |  |  | VARCHAR (120 ) | This field contains the description of the timeline step. |
| 9 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 10 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 11 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 12 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_TIMELINE_STEP_COMP_TL

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in TIMELINE_STEP_COMP_TL.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | LANG |  |  |  | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 7 | TIMELINE_TYPE |  |  |  | VARCHAR (6) | This field will hold the module the timeline is referring to. Valid values are: PO - Purchase Orders at the Header Level POIT - Purchase Orders at the Item Level IT - Item Maintenance CE - Customs Entry LO - Logistics at the Header Level LOBL - Logistics at the Bill of Lading Level LOCO - Logistics at the Container Level LOPI - Logistics at the Purchase Order/Item Level LOCI - Logistics at the Commercial Invoice Level |
| 8 | STEP_NO |  |  |  | NUMERIC (4) | This field contains the number that uniquely defines the timeline step. |
| 9 | STEP_DESC |  |  |  | VARCHAR (120) | This field contains the description of the timeline step. |

---

## Table: SVC_TMPL_API_MAP

**Description:** This table holds the mapping information between the template keys and their corresponding Admin APIs.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TEMPLATE_KEY | P | F | Y | VARCHAR (255) | Contains the unique key that identifies the template. |
| 2 | DNLD_API |  |  | Y | VARCHAR (255 ) | Contains the function name which will be invoked to download data from base RMS table to template spreadsheet. |
| 3 | UPLD_API |  |  | Y | VARCHAR (255 ) | Contains the function name which will be invoked to upload data from the template spreadsheet into the corresponding staging table. |
| 4 | PROCESS_API |  |  | Y | VARCHAR (255 ) | Contains the function name which will be invoked to validate and process data in the staging table. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|SVC_TMPL_API_MAP_PK|PK||||TEMPLATE_KEY|ASC|

---

## Table: SVC_TRANSIT_TIMES

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in TRANSIT_TIMES.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | DEPT |  |  |  | NUMERIC (4) | The field holds the unique identifier for the department for which the transit time is defined. |
| 7 | CLASS |  |  |  | NUMERIC (4) | The field holds the unique identifier for the class for which the transit time is defined. |
| 8 | SUBCLASS |  |  |  | NUMERIC (4) | The field holds the unique identifier for the subclass for which the transit time is defined. |
| 9 | ORIGIN |  |  |  | NUMERIC (10) | This field holds the unique identifier for the origin location for which transit time is defined. |
| 10 | DESTINATION |  |  |  | NUMERIC (10) | This field holds the unique identifier for the destination location for which transit time is defined. |
| 11 | ORIGIN_TYPE |  |  |  | VARCHAR (2 ) | This field holds the type of origin location for which transit time is defined.Valid values are ST-Store, WH-Warehouse, SU-Supplier, LLS-Location List Store, LLW-Location List Warehouse and are held in code type TTOT on CODE_DETAIL. |
| 12 | DESTINATION_TYPE |  |  |  | VARCHAR (2 ) | This field holds the type of destination location for which transit time is defined.Valid values are ST-Store or WH-Warehouseand are held in code type TTDT on CODE_DETAIL. |
| 13 | TRANSIT_TIME |  |  |  | NUMERIC (4) | This field holds the transit time in days. |
| 14 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 15 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 16 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 17 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_TSFZONE

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in TSFZONE.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | TRANSFER_ZONE |  |  |  | NUMERIC (4) | This field contains the number which uniquely identifies the transfer zone. |
| 7 | DESCRIPTION |  |  |  | VARCHAR (120 ) | This field contains the name of the transfer zone. |
| 8 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 9 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 10 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 11 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_TSFZONE_TL

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in TSFZONE_TL.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | LANG |  |  |  | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 7 | TRANSFER_ZONE |  |  |  | NUMERIC (4) | This field contains the number which uniquely identifies the transfer zone. |
| 8 | DESCRIPTION |  |  |  | VARCHAR (120) | This field contains the name of the transfer zone. |

---

## Table: SVC_UOM_CLASS

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in UOM_CLASS.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | UOM_DESC_TRANS |  |  |  | VARCHAR (120) | Contains UOM Description. |
| 7 | UOM_TRANS |  |  |  | VARCHAR (4) | Contains UOM Translation. |
| 8 | UOM_CLASS |  |  |  | VARCHAR (6) | Contains the unit of measure type used as a grouping mechanism for the many UOM options. When converting from one UOM to another, the class is used to determine how the system proceeds with the conversion, whether it is an in-class or across-class conversion. |
| 9 | UOM |  |  |  | VARCHAR (4) | Contains a string that uniquely identifies the unit of measure. Example: LBS for pounds. |
| 10 | CREATE_ID |  |  |  | VARCHAR (30) | User who created the record. |
| 11 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 12 | LAST_UPD_ID |  |  |  | VARCHAR (30) | User who last updated the record. |
| 13 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_UOM_CLASS_TL

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in UOM_CLASS_TL.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | UOM_DESC_TRANS |  |  |  | VARCHAR (120) | Contains UOM Description. |
| 7 | UOM_TRANS |  |  |  | VARCHAR (4) | Contains UOM Translation. |
| 8 | UOM |  |  |  | VARCHAR (4) | Contains a string that uniquely identifies the unit of measure. Example: LBS for pounds. |
| 9 | LANG |  |  |  | NUMERIC (6) | Contains the number which uniquely identifies a language. |
| 10 | CREATE_ID |  |  |  | VARCHAR (30) | User who created the record. |
| 11 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 12 | LAST_UPD_ID |  |  |  | VARCHAR (30) | User who last updated the record. |
| 13 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_UOM_CONVERSION

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in UOM_CONVERSION.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | OPERATOR |  |  |  | VARCHAR (1) | Contains a character that identifies the operation required to convert from the from_UOM to the to_UOM. Valid Values are: M = Multiply and D= Divide. |
| 7 | FACTOR |  |  |  | NUMERIC (20,10) | Contains a number that is the conversion factor from the from_UOM to the to_UOM. |
| 8 | TO_UOM |  |  |  | VARCHAR (4) | Contains a string that uniquely identifies the unit of measure to which the conversion is to occur. |
| 9 | FROM_UOM |  |  |  | VARCHAR (4) | Contains a string that uniquely identifies the unit of measure from which the conversion is to occur. |
| 10 | CREATE_ID |  |  |  | VARCHAR (30) | User who created the record. |
| 11 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 12 | LAST_UPD_ID |  |  |  | VARCHAR (30) | User who last updated the record. |
| 13 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_UOM_X_CONVERSION

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in UOM_X_CONVERSION.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | CONVERT_SQL |  |  |  | VARCHAR (2000) | Contains the actual select statement to perform the conversion. |
| 7 | TO_UOM_CLASS |  |  |  | VARCHAR (6) | Contains the type of the UOM that is required for the product in question, and to which the conversion takes place (in the above example, the To_Class is Volume). |
| 8 | FROM_UOM_CLASS |  |  |  | VARCHAR (6) | Contains the class of the UOM currently used on the product in question (for example, in a conversion from weight to volume, the From_Class is weight). |
| 9 | CREATE_ID |  |  |  | VARCHAR (30) | User who created the record. |
| 10 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 11 | LAST_UPD_ID |  |  |  | VARCHAR (30) | User who last updated the record. |
| 12 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_USER_ATTRIB

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in USER_ATTRIB.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | USER_ID |  |  |  | VARCHAR (30) | Contains the unique identifier for the user. |
| 7 | USER_NAME |  |  |  | VARCHAR (120) | Contains the name of the user. |
| 8 | LANG |  |  |  | NUMERIC (6) | Contains the language that the Oracle user prefers to use in Oracle Retail. |
| 9 | STORE_DEFAULT |  |  |  | NUMERIC (10) | Contains the default store for the user. |
| 10 | USER_PHONE |  |  |  | VARCHAR (20) | Contains the telephone number of the user. |
| 11 | USER_FAX |  |  |  | VARCHAR (20) | Contains the fax number of the user. |
| 12 | USER_PAGER |  |  |  | VARCHAR (20) | Contains the pager number of the user. |
| 13 | USER_EMAIL |  |  |  | VARCHAR (250) | Contains the email address for the user. |
| 14 | DEFAULT_PRINTER |  |  |  | VARCHAR (20) | stores users default printer. valid values found on printer_head.printer |
| 15 | CREATE_ID |  |  |  | VARCHAR (30) | User who created the record. |
| 16 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 17 | LAST_UPD_ID |  |  |  | VARCHAR (30) | User who last updated the record. |
| 18 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_VAT_CODES

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in VAT_CODES.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | VAT_CODE |  |  |  | VARCHAR (6 ) | This field contains the alphanumeric identification for the VAT code. Valid values include: S - Standard C - Composite Z - Zero E - Exempt Other values may also be entered. These are the default VAT Rates that are set-up upon installation of the RMS. |
| 7 | VAT_CODE_DESC |  |  |  | VARCHAR (120 ) | Contains a description identifying the VAT code. |
| 8 | INCL_NIC_IND |  |  |  | VARCHAR (1 ) | This will determine if the tax code will be included in the calculation of the Negotiated Item Cost or not. |
| 9 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 10 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 11 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 12 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_VAT_CODES_TL

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in VAT_CODES_TL.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | LANG |  |  |  | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 7 | VAT_CODE |  |  |  | VARCHAR (6) | This field contains the alphanumeric identification for the VAT code. Valid values include: S - Standard C - Composite Z - Zero E - Exempt Other values may also be entered. These are the default VAT Rates that are set-up upon installation of the RMS. |
| 8 | VAT_CODE_DESC |  |  |  | VARCHAR (120) | Contains a description identifying the VAT code. |

---

## Table: SVC_VAT_CODE_RATES

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in VAT_CODE_RATES.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | VAT_CODE |  |  |  | VARCHAR (6 ) | Code to uniquely identify a VAT rate. |
| 7 | ACTIVE_DATE |  |  |  | Date | Date on which the VAT rate becomes active. |
| 8 | ACTIVE_DATE_S9T |  |  |  | Date | Date on which the VAT rate becomes active. It holds the value to update ACITVE_DATE. |
| 9 | VAT_RATE |  |  |  | NUMERIC (20,10) | VAT rate associated with a given VAT code. |
| 10 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 11 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 12 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 13 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_VAT_ITEM

**Description:** This is the staging table for Item Induction module. It is used to temporarily hold data before it is uploaded/updated in VAT_ITEM

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The data for a process is split in multiple chunks. The Chunk information is present in SVC_PROCESS_CHUNKS. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | ITEM |  |  |  | VARCHAR (25) | Refer to VAT_ITEM.ITEM. |
| 7 | VAT_REGION |  |  |  | NUMERIC (4) | Refer to VAT_ITEM.VAT_REGION. |
| 8 | ACTIVE_DATE |  |  |  | Date | Refer to VAT_ITEM.ACTIVE_DATE. |
| 9 | VAT_TYPE |  |  |  | VARCHAR (1) | Refer to VAT_ITEM.VAT_TYPE. |
| 10 | VAT_CODE |  |  |  | VARCHAR (6) | Refer to VAT_ITEM.VAT_CODE. |
| 11 | VAT_RATE |  |  |  | NUMERIC (20,10) | Refer to VAT_ITEM.VAT_RATE. |
| 12 | CREATE_ID |  |  |  | VARCHAR (30) | User who created the record. |
| 13 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 14 | LAST_UPD_ID |  |  |  | VARCHAR (30) | User who last updated the record. |
| 15 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |
| 16 | REVERSE_VAT_IND |  |  |  | VARCHAR (1 ) | Indicates if the item is subject to reverse charge VAT at the vat region. Valid values are Y and N. |

---

## Table: SVC_VAT_REGION

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in VAT_REGION.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | VAT_REGION |  |  |  | NUMERIC (4) | Contains the unique identifying number for the VAT region in the system. |
| 7 | VAT_REGION_NAME |  |  |  | VARCHAR (120 ) | Contains the name associated with the VAT region. |
| 8 | VAT_REGION_TYPE |  |  |  | VARCHAR (6 ) | Will hold the type of VAT region. Valid values include E for the base EU region, M for EU member and N for Non-members. |
| 9 | ACQUISITION_VAT_IND |  |  |  | VARCHAR (1 ) | Indicates if acquisition VAT is applicable to the vat region. Valid values are Y and N. |
| 10 | REVERSE_VAT_THRESHOLD |  |  |  | NUMERIC (20,4) | This holds the invoice-level total value limit. The reverse charge VAT rule only applies if the total value of items that are subject to reverse charge VAT exceeds the threshold for an invoice. This value is expressed in the country currency of the vat_region, which typically only belongs to one country. |
| 11 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 12 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 13 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 14 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |
| 15 | VAT_CALC_TYPE |  |  |  | VARCHAR (6 ) | This column holds the tax calculation type and can be ''''S''''imple, ''''E''''xempt or ''''C''''ustom. |

---

## Table: SVC_VAT_REGION_TL

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in VAT_REGION_TL.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | LANG |  |  |  | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 7 | VAT_REGION |  |  |  | NUMERIC (4) | Contains the unique identifying number for the VAT region in the system. |
| 8 | VAT_REGION_NAME |  |  |  | VARCHAR (120) | Contains the name associated with the VAT region. |

---

## Table: SVC_WF_COST_TMPL_UPLD_FHEAD

**Description:** This is an interface table used in the franchise cost template upload process. It holds file header information.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID |  |  |  | NUMERIC (15) | Automatically generated id that uniquely identifies a cost template upload process. |
| 2 | SEQ_NO |  |  |  | NUMERIC (15) | Automatically generated id that uniquely identifies a transcation in a franchise cost template upload process. For file header record seq_no will be 0. |
| 3 | FILE_RECORD_DESCRIPTOR |  |  |  | VARCHAR (5) | Describes the file line type. Valid rows have the value FHEAD. |
| 4 | FILE_LINE_ID |  |  |  | NUMERIC (10) | Identifies a unique line in the RMS franchise cost template upload file. |
| 5 | FILE_TYPE |  |  |  | VARCHAR (5) | Identifies the file type. Files for cost template upload are identified as CTMPL. |
| 6 | FILE_CREATE_DATE |  |  |  | Date | The date the cost template upload file was created (in YYYYMMDDHH24MISS format). |
| 7 | STATUS |  |  |  | VARCHAR (1) | Contains the status of the file header record. Valid values are N = New, E = Error, R = Rejected and P = Processed. |
| 8 | ERROR_MSG |  |  |  | VARCHAR (4000) | Contains the fatal error message for this record(if any) during the franchise cost template upload process. |
| 9 | LAST_UPDATE_DATETIME |  |  |  | Date | Contains the date and time this status row was updated. |

---

## Table: SVC_WF_COST_TMPL_UPLD_FTAIL

**Description:** This is an interface table used in the franchise cost template upload process. Every record in this table serves as the end-of-file marker in an RMS franchise cost template upload file. There should only be a single row in this table for a given process id. The fields of this table map to the FTAIL record in an RMS franchise cost template upload file layout with the exception of some process-related fields.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID |  |  |  | NUMERIC (15) | Automatically generated id that uniquely identifies a cost template upload process. |
| 2 | SEQ_NO |  |  |  | NUMERIC (15) | Automatically generated id that uniquely identifies a transcation in a franchise cost template upload process. For file tail record seq_no will be 0. |
| 3 | FILE_RECORD_DESCRIPTOR |  |  |  | VARCHAR (5) | Describes the file line type. Valid rows have the value FTAIL. |
| 4 | FILE_LINE_ID |  |  |  | NUMERIC (10) | Identifies a unique line in the RMS franchise cost template upload file. |
| 5 | FILE_RECORD_COUNTER |  |  |  | NUMERIC (10) | Contains the total number of transaction records in a franchise cost template upload file for a given process id. |
| 6 | STATUS |  |  |  | VARCHAR (1) | Contains the status of the file tail record. Valid values are N = New, E = Error, R = Rejected and P = Processed. |
| 7 | ERROR_MSG |  |  |  | VARCHAR (4000) | Contains the fatal error message for this record(if any) during the franchise cost template upload process. |

---

## Table: SVC_WF_COST_TMPL_UPLD_STATUS

**Description:** This is an interface table used in the franchise cost template upload process. It is used for status tracking and program control.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID |  |  |  | NUMERIC (15) | Automatically generated id that uniquely identifies a cost template upload process. |
| 2 | CHUNK_ID |  |  |  | NUMERIC (10) | This is used to divide data associated with the same process_id into multiple chunks to facilitate parallel processing. For the same process_id, chunk_id starts with 1 and increment by 1 for each new chunk. |
| 3 | REFERENCE_ID |  |  |  | VARCHAR (255) | Contains a value that references the source for the data in the parameter tables. In batch execution, this is the filename of the cost template upload file. |
| 4 | STATUS |  |  |  | VARCHAR (1) | Status of the cost template upload execution for a particular process ID and chunk ID. Valid values are: N = New, P = Processed, J = Reject, E = Error. |
| 5 | ERROR_MSG |  |  |  | VARCHAR (4000) | Contains the error message (if any) for a given process ID and chunk ID encountered during franchise cost template upload process. |
| 6 | LAST_UPDATE_DATETIME |  |  |  | Date | Contains the date and time this status row was updated. |

---

## Table: SVC_WF_COST_TMPL_UPLD_TDETL

**Description:** This is an interface table used in the franchise cost template upload process. It holds transaction detail information.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID |  |  |  | NUMERIC (15) | Automatically generated id that uniquely identifies a cost template upload process. |
| 2 | SEQ_NO |  |  |  | NUMERIC (15) | Automatically generated id that uniquely identifies a transcation in a franchise cost template upload process. |
| 3 | FILE_RECORD_DESCRIPTOR |  |  |  | VARCHAR (5) | Describes the file line type. Valid rows have the value TDETL. |
| 4 | FILE_LINE_ID |  |  |  | NUMERIC (10) | Identifies a unique line in the RMS franchise cost template upload file. |
| 5 | MESSAGE_TYPE |  |  |  | VARCHAR (30) | Identifies the action that will be performed on the franchise cost template relationship record. It can be either create or update or delete a cost relationship. |
| 6 | DEPT |  |  |  | NUMERIC (4) | Department ID. |
| 7 | CLASS |  |  |  | NUMERIC (4) | Class ID. |
| 8 | SUBCLASS |  |  |  | NUMERIC (4) | Subclass ID. |
| 9 | ITEM |  |  |  | VARCHAR (25) | Unique number that identifies an item. |
| 10 | LOCATION |  |  |  | NUMERIC (10) | Franchise store. |
| 11 | START_DATE |  |  |  | Date | Date on which a cost relationship would have been effective (required for update or delete of a cost relationship). |
| 12 | END_DATE |  |  |  | Date | Date on which a cost relationship would have been terminated (required for update or delete of a cost relationship). |
| 13 | NEW_START_DATE |  |  |  | Date | New Date on which cost relationship will be effective (required for update of a cost relationship). |
| 14 | NEW_END_DATE |  |  |  | Date | New Date on which cost relationship will be terminated (required for update of a cost relationship). |
| 15 | COST_COMP_ID |  |  |  | VARCHAR (10) | Contains a unique code which signifies the Upcharge cost component when First_Applied is 'U' |
| 16 | STATUS |  |  |  | VARCHAR (1) | Contains the status of the transaction detail record. Valid values are N = New, E = Error, R = Rejected and P = Processed. |
| 17 | ERROR_MSG |  |  |  | VARCHAR (4000) | Contains the non fatal error message for this record (if any) during the franchise cost template upload process. Multiple error messages are concatenated together. |

---

## Table: SVC_WF_COST_TMPL_UPLD_THEAD

**Description:** This is an interface table used in the franchise cost template upload process. It holds the transaction header information.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID |  |  |  | NUMERIC (15) | Automatically generated id that uniquely identifies a cost template upload process. |
| 2 | SEQ_NO |  |  |  | NUMERIC (15) | Automatically generated id that uniquely identifies a transcation in a franchise cost template upload process. |
| 3 | CHUNK_ID |  |  |  | NUMERIC (10) | This is used to divide data associated with the same process_id into multiple chunks to facilitate parallel processing. For the same process_id, chunk_id starts with 1 and increment by 1 for each new chunk. |
| 4 | FILE_RECORD_DESCRIPTOR |  |  |  | VARCHAR (5) | Describes the file line type. Valid rows have the value THEAD. |
| 5 | FILE_LINE_ID |  |  |  | NUMERIC (10) | Identifies a unique line in the RMS franchise cost template upload file. |
| 6 | MESSAGE_TYPE |  |  |  | VARCHAR (30) | Identifies the action that will be performed on the franchise cost template header record. It can be either create or update or delete a cost template. |
| 7 | TEMPLATE_ID |  |  |  | NUMERIC (10) | Unique cost buildup template ID number. |
| 8 | TEMPLATE_DESC |  |  |  | VARCHAR (120) | Description of the cost buildup template. |
| 9 | FIRST_APPLIED |  |  |  | VARCHAR (1) | Indicates whether Margin % or Up-charges or % of Retail or Item level cost is applied first in the cost buildup process. Valid Values are M = |
| 10 | PERCENTAGE |  |  |  | NUMERIC (12,4) | The margin percent or percent of retail to be applied to the acquisition cost. |
| 11 | COST |  |  |  | NUMERIC (20,4) | Indicates the customer cost for an item when first_applied is 'C' |
| 12 | FINAL_COST |  |  |  | VARCHAR (1) | Flag which signifies if the cost is the final cost for the item/franchise location or deal pass through should be applied on this cost to derive the final customer cost for the item/franchise location. Valid Values are 'Y' or 'N'. |
| 13 | STATUS |  |  |  | VARCHAR (1) | Contains the status of the transaction header record. Valid values are N = New, E = Error, R = Rejected and P = Processed. |
| 14 | ERROR_MSG |  |  |  | VARCHAR (4000) | Contains the non fatal error message for this record(if any) during the franchise cost template upload process. Multiple error messages are concatenated together. |

---

## Table: SVC_WF_COST_TMPL_UPLD_TTAIL

**Description:** This is an interface table used in the franchise cost template upload process. Every record in this table serves as the end-of-transaction marker in an RMS franchise cost template upload file. There should only be a single row in this table for a specific transaction. The fields of this table map to the TTAIL record in an RMS franchise cost template upload file layout with the exception of some process-related fields.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID |  |  |  | NUMERIC (15) | Automatically generated id that uniquely identifies a cost template upload process. |
| 2 | SEQ_NO |  |  |  | NUMERIC (15) | Automatically generated id that uniquely identifies a transcation in a franchise cost template upload process. |
| 3 | FILE_RECORD_DESCRIPTOR |  |  |  | VARCHAR (5) | Describes the file line type. Valid rows have the value TTAIL. |
| 4 | FILE_LINE_ID |  |  |  | NUMERIC (10) | Identifies a unique line in the RMS franchise cost template upload file. |
| 5 | TRAN_RECORD_COUNTER |  |  |  | NUMERIC (6) | Contains the total number of transaction detail records in the SVC_WF_COST_TMPL_UPLD_TDETL table for a process id and sequence number. |
| 6 | STATUS |  |  |  | VARCHAR (1) | Contains the status of the transaction tail record. Valid values are N = New, E = Error, R = Rejected and P = Processed. |
| 7 | ERROR_MSG |  |  |  | VARCHAR (4000) | Contains the non fatal error message for this record(if any) during the franchise cost template upload process. Multiple error messages are concatenated together. |

---

## Table: SVC_WF_CUST

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in WF_CUSTOMER.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | WF_CUSTOMER_NAME |  |  |  | VARCHAR (120 ) | This field will hold the customer description. |
| 7 | WF_CUSTOMER_ID |  |  |  | NUMERIC (10) | This field will hold the unique identifier for the customer. |
| 8 | CREDIT_IND |  |  |  | VARCHAR (1 ) | This field will determine if the customer has good credit. |
| 9 | WF_CUSTOMER_GROUP_ID |  |  |  | NUMERIC (10) | This field will indicate which customer group this customer belongs to. |
| 10 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 11 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 12 | AUTO_APPROVE_IND |  |  |  | VARCHAR (1 ) | This indicator is used to auto approve the externally uploaded orders and returns if all the validations are passed. Valid values are Y and N. |
| 13 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 14 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_WF_CUSTOMER_GROUP_TL

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in WF_CUSTOMER_GROUP_TL.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | LANG |  |  |  | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 7 | WF_CUSTOMER_GROUP_ID |  |  |  | NUMERIC (10) | This field will hold the unique identifier for the customer group. |
| 8 | WF_CUSTOMER_GROUP_NAME |  |  |  | VARCHAR (120) | This field will hold the customer group description |

---

## Table: SVC_WF_CUSTOMER_TL

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in WF_CUSTOMER_TL.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | LANG |  |  |  | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 7 | WF_CUSTOMER_NAME |  |  |  | VARCHAR (120) | This field will hold the customer description. |
| 8 | WF_CUSTOMER_ID |  |  |  | NUMERIC (10) | This field will hold the unique identifier for the customer. |

---

## Table: SVC_WF_CUST_GRP

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in WF_CUSTOMER_GROUP.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | WF_CUSTOMER_GROUP_ID |  |  |  | NUMERIC (10) | This field will hold the unique identifier for the customer group. |
| 7 | WF_CUSTOMER_GROUP_NAME |  |  |  | VARCHAR (120 ) | This field will hold the customer group description. |
| 8 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 9 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 10 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 11 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_WF_ORD_DETAIL

**Description:** This table is a staging table that holds detail level data for a franchisee order upload.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | WF_ORDER_ID |  |  |  | NUMERIC (15) | Holds the unique identifier for a single franchisee order upload request. |
| 2 | PROCESS_ID |  |  |  | NUMERIC (15) | Unique identifier for a group of franchisee orders. This is generated by a sequence. |
| 3 | CHUNK_ID |  |  |  | NUMERIC (15) | This is used to divide data associated with the same process_id into multiple chunks to facilitate parallel processing. For the same process_id, chunk_id starts with 1 and increment by 1 for each new chunk. |
| 4 | RECORD_DESCRIPTOR |  |  |  | VARCHAR (5) | Applicable for file upload. Valid value is FDETL. |
| 5 | LINE_NO |  |  |  | NUMERIC (10) | Applicable for file upload. Identifies a unique line in the franchisee order upload file. These are sequential for a single file. |
| 6 | ITEM |  |  |  | VARCHAR (25) | This field contains the Item that is being ordered by the franchisee. |
| 7 | CUSTOMER_LOC |  |  |  | NUMERIC (10) | The customer location requesting the item. |
| 8 | SOURCE_LOC_TYPE |  |  |  | VARCHAR (2) | This field contains the source location type. Valid values are ''ST'' - Store, ''WH'' - Warehouse and ''SU'' - Supplier. |
| 9 | SOURCE_LOC_ID |  |  |  | NUMERIC (10) | This is the source location identifier. |
| 10 | REQUESTED_QTY |  |  |  | NUMERIC (12,4) | This containes the ordered quantity for an item. The value is in the mentioned UOP |
| 11 | UOP |  |  |  | VARCHAR (3) | This field contains the unit of purchase information. |
| 12 | FIXED_COST |  |  |  | NUMERIC (20,4) | This is a user defined item cost. If this is populated, this will override the pricing cost for the item. |
| 13 | NEED_DATE |  |  |  | Date | This date represents the initial date by which the franchisee wants the item on this order. |
| 14 | NOT_AFTER_DATE |  |  |  | Date | This date represents the last date by which the franchisee will accept the item on the order. |
| 15 | ERROR_MSG |  |  |  | VARCHAR (2000) | Holds the validation errors for the record. If multiple validation errors are found on a record, the error messages are concatenated and separated by '';''. |
| 16 | CREATE_DATETIME |  |  |  | Date | This field contains the timestamp when the record is created. |
| 17 | CREATE_ID |  |  |  | VARCHAR (30) | This field contains the user who created the record. |
| 18 | LAST_UPDATE_DATETIME |  |  |  | Date | This field contains the timestamp when the record is last updated. |
| 19 | LAST_UPDATE_ID |  |  |  | VARCHAR (30) | This field contains the user who last updated the record. |

---

## Table: SVC_WF_ORD_HEAD

**Description:** This is a staging table that holds header level data for a franchisee order.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | WF_ORDER_ID |  |  |  | NUMERIC (15) | Holds the unique identifier for a single franchisee order upload request. |
| 2 | PROCESS_ID |  |  |  | NUMERIC (15) | Unique identifier for a group of franchisee orders. This is generated by a sequence. |
| 3 | CHUNK_ID |  |  |  | NUMERIC (15) | This is used to divide data associated with the same process_id into multiple chunks to facilitate parallel processing. For the same process_id, chunk_id starts with 1 and increment by 1 for each new chunk. |
| 4 | RECORD_DESCRIPTOR |  |  |  | VARCHAR (5) | Applicable for file upload. Valid value is FHEAD. |
| 5 | LINE_NO |  |  |  | NUMERIC (10) | Applicable for file upload. Identifies a unique line in the franchisee order upload file. These are sequential for a single file. |
| 6 | WF_CUSTOMER_ID |  |  |  | NUMERIC (10) | Numeric id of the franchisee customer for which the franchisee order had to be created. |
| 7 | CUST_ORD_REF_NO |  |  |  | VARCHAR (20) | This a reference number that should be be provided by the franchisee. This will help in tracking the franchisee order created in RMS with any internal reference number the Franchisee have for the upload request. |
| 8 | CURRENCY_CODE |  |  |  | VARCHAR (3) | This field contains the order currency for franchisee order. |
| 9 | DEFAULT_BILL_TO_LOC |  |  |  | NUMERIC (10) | This field represents the default billing location for an order. This is used if all_location_billing is No. |
| 10 | COMMENTS |  |  |  | VARCHAR (2000) | Comments associated with franchisee order uploaded. |
| 11 | PROCESS_STATUS |  |  |  | VARCHAR (1) | Indicates the processing status of a franchisee order upload. Processing status can be N - New, V - Validated, E - Error, R- Rejected, C - Completed. |
| 12 | ERROR_MSG |  |  |  | VARCHAR (2000) | Holds the validation errors for the record. If multiple validation errors are found on a record, the error messages are concatenated and separated by '';''. |
| 13 | CREATE_DATETIME |  |  |  | Date | This field contains the timestamp when the record is created. |
| 14 | CREATE_ID |  |  |  | VARCHAR (30) | This field contains the user who created the record. |
| 15 | LAST_UPDATE_DATETIME |  |  |  | Date | This field contains the timestamp when the record was last updated. |
| 16 | LAST_UPDATE_ID |  |  |  | VARCHAR (30) | This field contains the user who last updated the record. |

---

## Table: SVC_WF_ORD_TAIL

**Description:** This is a staging table that holds tail level data for franchisee order upload.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | WF_ORDER_ID |  |  |  | NUMERIC (15) | Holds the unique identifier for a single franchisee order upload request. |
| 2 | PROCESS_ID |  |  |  | NUMERIC (15) | Unique identifier for a group of franchisee orders. This is generated by a sequence. |
| 3 | RECORD_DESCRIPTOR |  |  |  | VARCHAR (5) | Applicable for file upload. Valid value is FTAIL. |
| 4 | LINE_NO |  |  |  | NUMERIC (10) | Applicable for file upload. Identifies a unique line in the franchisee order upload file. These are sequential for a single file. |
| 5 | TOTAL_RECORD_COUNT |  |  |  | NUMERIC (10) | Applicable for file upload. This contains the total number of detail records for the given wf_order_id. |
| 6 | ERROR_MSG |  |  |  | VARCHAR (2000) | Holds the validation errors for the record. If multiple validation errors are found on a record, the error messages are concatenated and separated by '';''. |
| 7 | CREATE_DATETIME |  |  |  | Date | This field contains the timestamp when the record is created. |
| 8 | CREATE_ID |  |  |  | VARCHAR (30) | This field contains the user who created the record. |
| 9 | LAST_UPDATE_DATETIME |  |  |  | Date | This field contains the timestamp when the record is last updated. |
| 10 | LAST_UPDATE_ID |  |  |  | VARCHAR (30) | This field contains the user who last updated the record. |

---

## Table: SVC_WF_RET_DETAIL

**Description:** Staging table that holds detail level data of a franchise return file.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | WF_RETURN_ID |  |  |  | NUMERIC (15) | Holds the unique identifier for a single wf return file. |
| 2 | PROCESS_ID |  |  |  | NUMERIC (15) | Unique identifier for a set of rows that are staged for a wf return upload . This is generated by a sequence. |
| 3 | CHUNK_ID |  |  |  | NUMERIC (15) | This is used to divide data associated with the same process_id into multiple chunks to facilitate parallel processing. For the same process_id, chunk_id starts with 1 and increment by 1 for each new chunk. |
| 4 | RECORD_DESCRIPTOR |  |  |  | VARCHAR (5) | Describes the file line type. Valid rows have the value FDETL. |
| 5 | LINE_NO |  |  |  | NUMERIC (10) | Identifies a unique line in the wf return file. These are sequential for a single file. |
| 6 | ITEM |  |  |  | VARCHAR (25) | This field contains the Item that is being returned by the franchise location. |
| 7 | WF_ORDER_NO |  |  |  | NUMERIC (10) | This field contains the franchise order no against which the return is made. |
| 8 | CUSTOMER_LOC |  |  |  | NUMERIC (10) | This is the franchise location from where the goods are being returned. |
| 9 | RETURN_LOC_TYPE |  |  |  | VARCHAR (1) | This field contains the return location type. |
| 10 | RETURN_LOC_ID |  |  |  | NUMERIC (10) | This is the location where the returned goods will be delivered. |
| 11 | RETURN_METHOD |  |  |  | VARCHAR (1) | This field contains the type of the return. The valid values are R - Return to Company location, D - Destroy at site. |
| 12 | UNIT_OF_MEASURE |  |  |  | VARCHAR (3) | This filed contains the unit of measure information. |
| 13 | RETURNED_QTY |  |  |  | NUMERIC (12,4) | Quantity of the item that is being returned. |
| 14 | RETURN_REASON |  |  |  | VARCHAR (6) | Reason describing why the item is being returned. |
| 15 | RETURN_UNIT_COST |  |  |  | NUMERIC (20,4) | Cost at which the item is being returned. |
| 16 | RESTOCK_TYPE |  |  |  | VARCHAR (1) | This field represents Restocking fee type. |
| 17 | UNIT_RESTOCK_FEE |  |  |  | NUMERIC (20,4) | Restocking fee per unit level. If RESTOCK_TYPE is V then this value will be a percentage of return unit cost else this will be a monetary value. |
| 18 | ERROR_MSG |  |  |  | VARCHAR (2000) | Holds the validation errors for the record. If multiple validation errors are found on a record, the error messages are concatenated and separated by ";". |
| 19 | CREATE_DATETIME |  |  |  | Date | This field contains the timestamp when the record is created. |
| 20 | CREATE_ID |  |  |  | VARCHAR (30) | This field contains the user who created the record. |
| 21 | LAST_UPDATE_DATETIME |  |  |  | Date | This field contains the timestamp when the record is last updated. |
| 22 | LAST_UPDATE_ID |  |  |  | VARCHAR (30) | This field contains the user who last updated the record. |

---

## Table: SVC_WF_RET_HEAD

**Description:** Staging table that holds header level data for a franchise return file.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | WF_RETURN_ID |  |  |  | NUMERIC (15) | Holds the unique identifier for a single wf return file. |
| 2 | PROCESS_ID |  |  |  | NUMERIC (15) | Unique identifier for a set of rows that are staged for a wf return upload. This is generated by a sequence. |
| 3 | CHUNK_ID |  |  |  | NUMERIC (15) | This is used to divide data associated with the same process_id into multiple chunks to facilitate parallel processing. For the same process_id, chunk_id starts with 1 and increment by 1 for each new chunk. |
| 4 | RECORD_DESCRIPTOR |  |  |  | VARCHAR (5) | Describes the file line type. Valid rows have the value FHEAD. |
| 5 | LINE_NO |  |  |  | NUMERIC (10) | Identifies a unique line in the wf return upload file. These are sequential for a single file. |
| 6 | WF_CUSTOMER_ID |  |  |  | NUMERIC (10) | Numeric Id of the customer. |
| 7 | CUST_RET_REF_NO |  |  |  | VARCHAR (20) | This a reference number that would be provided by the franchise location for their tracking purpose. |
| 8 | CURRENCY_CODE |  |  |  | VARCHAR (3) | This field contains the return currency for the wf return upload. |
| 9 | COMMENTS |  |  |  | VARCHAR (2000) | Comments assosciated with franchise returns. |
| 10 | PROCESS_STATUS |  |  |  | VARCHAR (1) | Indicates the processing status of a wf return file. Processing status can be N - New, V - Validated, E - Error, R- Rejected, C - Completed. |
| 11 | ERROR_MSG |  |  |  | VARCHAR (2000) | Holds the validation errors for the record. If multiple validation errors are found on a record, the error messages are concatenated and separated by ";". |
| 12 | CREATE_DATETIME |  |  |  | Date | This field contains the timestamp when the record is created. |
| 13 | CREATE_ID |  |  |  | VARCHAR (30) | This field contains the user who created the record. |
| 14 | LAST_UPDATE_DATETIME |  |  |  | Date | This field contains the timestamp when the record is last updated. |
| 15 | LAST_UPDATE_ID |  |  |  | VARCHAR (30) | This field contains the user who last updated the record. |

---

## Table: SVC_WF_RET_TAIL

**Description:** This table is a staging table that holds tail level data of a franchise return file.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | WF_RETURN_ID |  |  |  | NUMERIC (15) | Holds the unique identifier for a single wf return file. |
| 2 | PROCESS_ID |  |  |  | NUMERIC (15) | Unique identifier for a set of rows that are staged for a wf return upload . This is generated by a sequence. |
| 3 | RECORD_DESCRIPTOR |  |  |  | VARCHAR (5) | Describes the file line type. Valid rows have the value FTAIL. |
| 4 | LINE_NO |  |  |  | NUMERIC (10) | Identifies a unique line in the wf return file. These are sequential for a single file. |
| 5 | TOTAL_RECORD_COUNT |  |  |  | NUMERIC (10) | Contains the total number of detail records in the SVC_WF_RET_DETAIL table for a single wf return file. |
| 6 | ERROR_MSG |  |  |  | VARCHAR (2000) | Holds the validation errors for the record. If multiple validation errors are found on a record, the error messages are concatenated and separated by ";". |
| 7 | CREATE_DATETIME |  |  |  | Date | This field contains the timestamp when the record is created. |
| 8 | CREATE_ID |  |  |  | VARCHAR (30) | This field contains the user who created the record. |
| 9 | LAST_UPDATE_DATETIME |  |  |  | Date | This field contains the timestamp when the record is last updated. |
| 10 | LAST_UPDATE_ID |  |  |  | VARCHAR (30) | This field contains the user who last updated the record. |

---

## Table: SVC_WO_ACTIVITY

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in WO_ACTIVITY.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | ACTIVITY_CODE |  |  |  | VARCHAR (10 ) | This field holds a unique, user-defined identifier for a particular activity to be carried out through a work order at the finisher location. |
| 7 | ACTIVITY_DESC |  |  |  | VARCHAR (250 ) | This field holds the description of the activity that is to take place at the finisher location. |
| 8 | UNIT_COST |  |  |  | NUMERIC (20,4) | This field holds the per-unit monetary value for carrying out the activity. |
| 9 | COST_TYPE |  |  |  | VARCHAR (6 ) | This field holds the accounting method, which determines how the cost for this activity should be handled.Valid values for this field are P - Post to Financial and U- Update Inventory Cost and is stored on the code tables for code_type ACTP. |
| 10 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 11 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 12 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 13 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_WO_ACTIVITY_TL

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in WO_ACTIVITY_TL.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | LANG |  |  |  | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 7 | ACTIVITY_ID |  |  |  | NUMERIC (10) | This field contains the key uniquely identifying each row on the table. This key is generated by the WO_ACTIVITY_ID_SEQ database sequence and is not editable by the user. |
| 8 | ACTIVITY_DESC |  |  |  | VARCHAR (250) | This field holds the description of the activity that is to take place at the finisher location. |
| 9 | ACTIVITY_CODE |  |  |  | VARCHAR (10 ) | This field holds a unique, user-defined identifier for a particular activity to be carried out through a work order at the finisher location. |

---

## Table: SVC_WO_TMPL_DETAIL

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in WO_TMPL_DETAIL.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | WO_TMPL_ID |  |  |  | NUMERIC (10) | This field contains the unique identifier for work order template from the table WO_TMPL_HEAD. |
| 7 | ACTIVITY_CODE |  |  |  | VARCHAR (10) | This field contains the unique code of the finishing activity. |
| 8 | UNIT_COST |  |  |  | NUMERIC (25,7) | This field contains the per-unit cost of the finishing activity.This value is stored in the primary currency. |
| 9 | COMMENTS |  |  |  | VARCHAR (2000) | This field contains any additional information associated with the finishing activity. |
| 10 | CREATE_ID |  |  |  | VARCHAR (30) | User who created the record. |
| 11 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 12 | LAST_UPD_ID |  |  |  | VARCHAR (30) | User who last updated the record. |
| 13 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_WO_TMPL_HEAD

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in WO_TMPL_HEAD.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10 ) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10 ) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | WO_TMPL_ID |  |  |  | NUMERIC (10) | This field holds a System-generated ID for the work order template. |
| 7 | WO_TMPL_DESC |  |  |  | VARCHAR (120 ) | This field contains the description of a work order template. |
| 8 | CREATE_ID |  |  |  | VARCHAR (30 ) | User who created the record. |
| 9 | CREATE_DATETIME |  |  |  | Date | Date time when record was inserted. |
| 10 | LAST_UPD_ID |  |  |  | VARCHAR (30 ) | User who last updated the record. |
| 11 | LAST_UPD_DATETIME |  |  |  | Date | Date time when record was last updated. |

---

## Table: SVC_WO_TMPL_HEAD_TL

**Description:** This is a staging table used for Admin API spreadsheet upload process.It is used to temporarily hold data before it is uploaded/updated in WO_TMPL_HEAD_TL.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | Uniquely identifies a process in SVC_PROCESS_TRACKER. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Uniquely identifies a chunk. The value will always be 1. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The rows sequence. Should be unique within a Process-ID. |
| 4 | ACTION |  |  |  | VARCHAR (10) | Describes type of action i.e. NEW, MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10) | Status of current row. Could be N - New, P-Processed, E-Error. |
| 6 | LANG |  |  |  | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 7 | WO_TMPL_ID |  |  |  | NUMERIC (10) | This field holds a System-generated ID for the work order template. |
| 8 | WO_TMPL_DESC |  |  |  | VARCHAR (120) | This field contains the description of a work order template. |

---

## Table: SVC_XITEM_RIZP

**Description:** This table holds XITEM message's IZP_TBL records.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | The process-id of the process to which this record is associated to. Maps to SVC_PROCESS_TRACKER.PROCESS_ID. |
| 2 | CHUNK_ID |  |  | Y | NUMERIC (10) | Chunk-id to which this item and related records have been assigned to. |
| 3 | ROW_SEQ | P |  | Y | NUMERIC (20) | The relative sequence number for this row. |
| 4 | ACTION |  |  |  | VARCHAR (10) | The action-type i.e. ADD,MOD or DEL. |
| 5 | PROCESS$STATUS |  |  |  | VARCHAR (10) | The status of the process i.e. 'P'rocessed or 'E'rror etc. |
| 6 | ITEM |  |  |  | VARCHAR (25) | The item number |
| 7 | UNIT_RETAIL |  |  |  | NUMERIC (20,4) | The unit_retail, same as rpm_item_zone_price.unit_retail. |
| 8 | SELLING_UNIT_RETAIL |  |  |  | NUMERIC (20,4) | Same as RPM_ITEM_ZONE_PRICE.SELLING_UNIT_RETAIL |
| 9 | SELLING_UOM |  |  |  | VARCHAR (4) | Same as RPM_ITEM_ZONE_PRICE.SELLING_UOM |
| 10 | MULTI_SELLING_UOM |  |  |  | VARCHAR (4) | Same as RPM_ITEM_ZONE_PRICE.MULTI_SELLING_UOM |
| 11 | MULTI_UNITS |  |  |  | NUMERIC (12,4) | Same as RPM_ITEM_ZONE_PRICE.MULTI_UNITS |
| 12 | MULTI_UNIT_RETAIL |  |  |  | NUMERIC (20,4) | Same as RPM_ITEM_ZONE_PRICE.MULTI_UNIT_RETAIL |
| 13 | CURRENCY_CODE |  |  |  | VARCHAR (3) | Same as RPM_ITEM_ZONE_PRICE.CURRENCY_CODE |
| 14 | CREATE_ID |  |  |  | VARCHAR (30) | The user who created this record. |
| 15 | CREATE_DATETIME |  |  |  | Date | The date and time when the record was created. |
| 16 | LAST_UPD_ID |  |  |  | VARCHAR (30) | The user who last updated the record. |
| 17 | LAST_UPD_DATETIME |  |  |  | Date | The date and time when the record was last updated. |

---

## Table: SVC_XITEM_RIZP_LOCS

**Description:** This table holds the locations corresponding to records in SVC_XITEM_RIZP.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | The process-id of the process to which this record is associated to. Maps to SVC_PROCESS_TRACKER.PROCESS_ID. |
| 2 | HEAD_ROW_SEQ | P |  | Y | NUMERIC (20) | The sequence number of the parent row in SVC_XITEM_RIZP. |
| 3 | ITEM | P |  | Y | VARCHAR (25) | The item number. |
| 4 | LOC | P |  | Y | NUMERIC (10) | The location |
