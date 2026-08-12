# RMS Custom Flex Attributes Datamodel - Physical Data Model Reference

## Table: CFA_ATTRIB

**Description:** This table holds the metadata that defines custom attributes for all extended entities. The information stored in this table tells how each attribute is stored, basic data restrictions and how the attribute is displayed in the CFAS UI.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ATTRIB_ID | P |  | Y | NUMERIC (10) | This column holds the generated ID of the attribute. |
| 2 | GROUP_ID |  | F | Y | NUMERIC (10) | This column holds the ID of the group this attribute belongs to. |
| 3 | VIEW_COL_NAME |  |  | Y | VARCHAR (30) | This column holds the description of the attribute. The value should be a qualified SQL name |
| 4 | STORAGE_COL_NAME |  |  | Y | VARCHAR (11) | This column maps the attribute to a storage column on the entity specific CFAS Storage/Extension table. The value should be a qualified SQL name |
| 5 | DISPLAY_SEQ |  |  | Y | NUMERIC (2) | This column determines the order which the attribute will be displayed on the CFAS UI. |
| 6 | DATA_TYPE |  |  | Y | VARCHAR (10) | This column holds the data type of the attribute |
| 7 | UI_WIDGET |  |  | Y | VARCHAR (2) | This column holds the UI item type that should be displayed on the Custom Data Entry UI. Valid values are TI (text item), RG (record group), LI (list item), CB (check box) and DT (date). |
| 8 | REC_GROUP_ID |  | F |  | NUMERIC (10) | This column holds the ID of the record group associated with the attribute. Record groups are only needed when the attribute uses the record group (RG) UI item type. Record groups are defined on the CFA_REC_GROUP table. CFA record groups must be defined before an attribute using the record group is defined. |
| 9 | CODE_TYPE |  | F |  | VARCHAR (4) | This column holds the specific custom code type associated with the attribute. Code types are only needed when the attribute uses the list item (LI) UI item type. |
| 10 | ENABLE_IND |  |  | Y | VARCHAR (1) | This column determines if the field is disabled (display only) or editable. The value of the attribute should be sourced from CFA_ATTRIB_GROUP_SET.DEFAULT_FUNC if the attribute is disabled. |
| 11 | VALUE_REQ |  |  | Y | VARCHAR (1) | This column determines if the field is required to be not null when a record is created in the custom extension storage table. |
| 12 | MAXIMUM_LENGTH |  |  |  | NUMERIC (20) | This column determines the maximum valid length the user can enter for field on the UI. A value is recommended for Char and Number attributes, and not valid for date attributes. |
| 13 | LOWEST_ALLOWED_VALUE |  |  |  | NUMERIC (20,4) | This value determines if the lowest numeric value that can be entered in the field. This value is optional and should only be populated when the data type of the attribute is NUMBER or DATE. |
| 14 | HIGHEST_ALLOWED_VALUE |  |  |  | NUMERIC (20,4) | This value determines if the highest numeric value that can be entered in the field. This value is optional and should only be populated when the data type of the attribute is NUMBER or DATE. |
| 15 | VALIDATION_FUNC |  |  |  | VARCHAR (61) | This column holds the name (package and function) of code that should be called to validate this attribute. |
| 16 | ACTIVE_IND |  |  | Y | VARCHAR (1) | This column indicates whether the attribute is displayed in the CFAS UI when accessed from the base UI. Used for simulation purposes. |
| 17 | BASE_IND |  |  | Y | VARCHAR (1) | This indicates if the attribute is Oracle defined. Oracle defined attributes can not be further customized. |
| 18 | EDITOR_REQ |  |  | Y | VARCHAR (1) | This column indicates whether the editor is required for the attribute. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_CFA_ATTRIB|PK||||ATTRIB_ID|ASC|
|CFA_ATTRIB_UK1|UK||||GROUP_ID|ASC|
||||||VIEW_COL_NAME|ASC|
|CFA_ATTRIB_UK2|UK||||GROUP_ID|ASC|
||||||STORAGE_COL_NAME|ASC|
|CFA_ATTRIB_UK3|UK||||GROUP_ID|ASC|
||||||DISPLAY_SEQ|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_CFA_ATTRIB_ACTIVE_IND|ACTIVE_IND in ('Y','N')<br>|
||CHK_CFA_ATTRIB_ALLOWED_VALUE|LOWEST_ALLOWED_VALUE is NULL or HIGHEST_ALLOWED_VALUE is NULL or LOWEST_ALLOWED_VALUE <=<br>HIGHEST_ALLOWED_VALUE<br>|
||CHK_CFA_ATTRIB_BASE_IND|BASE_IND in ('Y','N')<br>|
||CHK_CFA_ATTRIB_DATA_TYPE|DATA_TYPE in ('VARCHAR2', 'NUMBER', 'DATE')<br>|
||CHK_CFA_ATTRIB_DISPLAY_SEQ|DISPLAY_SEQ BETWEEN 1 AND 25<br>|






|Type|Column / Constraint Name|Details|
|---|---|---|
||CHK_CFA_ATTRIB_EDITOR_REQ|EDITOR_REQ IN ('Y','N')<br>|
||CHK_CFA_ATTRIB_ENABLE_IND|ENABLE_IND in ('Y','N')<br>|
||CHK_CFA_ATTRIB_MAXIMUM_LENGTH|MAXIMUM_LENGTH > 0<br>|
||CHK_CFA_ATTRIB_STORAGE_COL_NAM|STORAGE_COL_NAME IN ('VARCHAR2_1', 'VARCHAR2_2', 'VARCHAR2_3','VARCHAR2_4', 'VARCHAR2_5', 'VARCHAR2_6', 'VARCHAR2_7',<br>'VARCHAR2_8', 'VARCHAR2_9', 'VARCHAR2_10', 'NUMBER_11', 'NUMBER_12', 'NUMBER_13', 'NUMBER_14', 'NUMBER_15',<br>'NUMBER_16', 'NUMBER_17', 'NUMBER_18', 'NUMBER_19', 'NUMBER_20', 'DATE_21', 'DATE_22','DATE_23','DATE_24','DATE_25'))<br>|
||CHK_CFA_ATTRIB_UI_WIDGET|UI_WIDGET in ('TI', 'LI', 'CB', 'RG', 'DT')<br>|
||CHK_CFA_ATTRIB_VALUE_REQ|VALUE_REQ in ('Y', 'N')<br>|
|Column Level|STORAGE_COL_NAME||
||DISPLAY_SEQ||
||DATA_TYPE||
||UI_WIDGET||
||ENABLE_IND||
||VALUE_REQ||
||MAXIMUM_LENGTH||
||ACTIVE_IND||
||BASE_IND||
||EDITOR_REQ||

---

## Table: CFA_ATTRIB_GROUP

**Description:** This table holds the metadata that defines attributes groups for group sets for all extended entities

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | GROUP_ID | P |  | Y | NUMERIC (10) | This column holds a generated ID that distinguishes the custom attribute group. |
| 2 | GROUP_SET_ID |  | F | Y | NUMERIC (10) | This column holds id of the set where the group belongs to. |
| 3 | GROUP_VIEW_NAME |  |  | Y | VARCHAR (30) | This column holds the name of the database view that will be generated to make access to user entered data easier. |
| 4 | DISPLAY_SEQ |  |  | Y | NUMERIC (2) | This column holds the order the attribute groups will be displayed in on the CFAS UI when multiple groups exist for a single attribute group set. |
| 5 | VALIDATION_FUNC |  |  |  | VARCHAR (61) | This column holds the name (package and function) of code that should be called to validate this attribute group. The inputs and outputs of this attribute group level validation code are tightly controlled. |
| 6 | ACTIVE_IND |  |  | Y | VARCHAR (1) | This column indicates whether the group is visible in the CFAS UI when accessed from the base UI. Used for simulation purposes |
| 7 | BASE_IND |  |  | Y | VARCHAR (1) | This indicates if the attribute group is defined by Oracle. Oracle defined groups cannot be further customized |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_CFA_ATTRIB_GROUP|PK||||GROUP_ID|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_CFA_ATRIB_GROUP_ACTIVE_IND|ACTIVE_IND in ('Y','N')<br>|
||CHK_CFA_ATRIB_GROUP_BASE_IND|BASE_IND in ('Y','N')<br>|
|Column Level|ACTIVE_IND||






|Type|Column / Constraint Name|Details|
|---|---|---|
||BASE_IND||

---

## Table: CFA_ATTRIB_GROUP_LABELS

**Description:** This holds the attribute group labels as displayed on the CFAS UI

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | GROUP_ID | P | F | Y | NUMERIC (10) | This column holds a generated ID that distinguishes the custom attribute group |
| 2 | LANG | P | F | Y | NUMERIC (6) | The attribute group labels language |
| 3 | DEFAULT_LANG_IND |  |  | Y | VARCHAR (1) | This column indicates that the current records description should be considered the default and displayed in the UI if a translation for the end users language does not exist. This column should be Y for only one language for the GROUP_ID |
| 4 | LABEL |  |  | Y | VARCHAR (255) | The attribute group label as displayed on the UI |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_CFA_ATTRIB_GROUP_LABELS|PK||||GROUP_ID|ASC|
||||||LANG|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CFA_ATT_GRP_L_DEFAULT_LANG_IND|DEFAULT_LANG_IND in ('Y','N')<br>|

---

## Table: CFA_ATTRIB_GROUP_SET

**Description:** This table holds the metadata definitions for the attribute group set. The group set is a higher grouping of attributes

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | GROUP_SET_ID | P |  | Y | NUMERIC (10) | Unique idenfier for the for the attribute group set |
| 2 | EXT_ENTITY_ID |  | F | Y | NUMERIC (10) | Entity ID where the group set belongs to |
| 3 | GROUP_SET_VIEW_NAME |  |  | Y | VARCHAR (30) | This column holds the name of the database view that will be generated to make access to user entered data easier. |
| 4 | DISPLAY_SEQ |  |  | Y | NUMERIC (2) | The order at which the group set entries are displayed on the UI. |
| 5 | QUALIFIER_FUNC |  |  |  | VARCHAR (61) | This column holds the name of the stored procedure (package and function) that should be called to check if required information is supplied to the base UI to access the attributes within the group set. |
| 6 | DEFAULT_FUNC |  |  |  | VARCHAR (61) | This column holds the name of the stored procedure (package and function) that should be called on startup of the CFAS UI to pre-populate attribute fields with default values (can be in any group within the set). |
| 7 | VALIDATION_FUNC |  |  |  | VARCHAR (61) | This column holds the name of the stored procedure (package and function) that should be called to validate the attribute group set. |
| 8 | STAGING_TABLE_NAME |  |  |  | VARCHAR (30) | The name of the staging area where data from an external source can be stored and exported to the CFA extension table linked to this group set |
| 9 | ACTIVE_IND |  |  | Y | VARCHAR (1) | Indicates that the group set can be used by base UIs or for simulation purposes |
| 10 | BASE_IND |  |  | Y | VARCHAR (1) | This indicates if the attribute group set is defined by Oracle. Oracle defined group sets cannot be further customized. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_CFA_ATTRIB_GROUP_SET|PK||||GROUP_SET_ID|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_ATTR_GRP_SET_ACTIVE_IND|ACTIVE_IND in ('Y','N')<br>|
||CHK_ATTR_GRP_SET_BASE_IND|BASE_IND in ('Y','N')<br>|
|Column Level|ACTIVE_IND||
||BASE_IND||

---

## Table: CFA_ATTRIB_GROUP_SET_LABELS

**Description:** This table contains the labels displayed in the options menu representing the attribute group sets.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | GROUP_SET_ID | P | F | Y | NUMERIC (10) | Unique identifier for the attribute group set |
| 2 | LANG | P | F | Y | NUMERIC (6) | The group set label language |
| 3 | DEFAULT_LANG_IND |  |  | Y | VARCHAR (1) | This indicates whether this language is used by default if there are no language sets that match the users language profile. |
| 4 | LABEL |  |  | Y | VARCHAR (255) | The group set label value |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_CFA_ATTRIB_GROUP_SET_LABELS|PK||||GROUP_SET_ID|ASC|
||||||LANG|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_CFA_ATTR_GRP_ST_LBL_DEFAUL|DEFAULT_LANG_IND in ('Y','N')<br>|

---

## Table: CFA_ATTRIB_LABELS

**Description:** This table will hold the prompt labels for each flexible attribute and its corresponding translated value

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ATTRIB_ID | P | F | Y | NUMERIC (10) | Holds the referenced attribute ID |
| 2 | LANG | P | F | Y | NUMERIC (6) | Language of the attribute prompt label |
| 3 | DEFAULT_LANG_IND |  |  | Y | VARCHAR (1) | This indicates whether the labels for this language is used by default if there are no language sets that match the users language profile. |
| 4 | LABEL |  |  | Y | VARCHAR (255) | The prompt label for the attribute displayed in the CFAS UI |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_CFA_ATTRIB_LABELS|PK||||ATTRIB_ID|ASC|
||||||LANG|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_CFA_ATTR_LBL_DFLT_LNG_IND|DEFAULT_LANG_IND in ('Y','N')<br>|

---

## Table: CFA_EXT_ENTITY

**Description:** This table contains the RMS entitys base table and custom extension table relationship

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | EXT_ENTITY_ID | P |  | Y | NUMERIC (10) | Unique number to associate an RMS entity to be extended |
| 2 | BASE_RMS_TABLE |  |  | Y | VARCHAR (30 BYTE) | The physical database table in RMS to be extended |
| 3 | CUSTOM_EXT_TABLE |  |  | Y | VARCHAR (30 BYTE) | The name of the extension table related to the base RMS table |
| 4 | ACTIVE_IND |  |  | Y | VARCHAR (1 BYTE) | Indicates if the entitys extension attributes are activated for display on extended base RMS forms |
| 5 | BASE_IND |  |  | Y | VARCHAR (1 BYTE) | Indicates if the metadata is Oracle defined. Oracle defined metadata cannot be further customized |
| 6 | VALIDATION_FUNC |  |  |  | VARCHAR (61 BYTE) | This contains the name of the stored validation procedure <package.function name> executed in the entitys main UI to check data consistencies covering all extended attributes defined under the entity. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_CFA_EXT_ENTITY|PK||||EXT_ENTITY_ID|ASC|
|CFA_EXT_ENTITY_UK1|UK||||BASE_RMS_TABLE|ASC|
|CFA_EXT_ENTITY_UK2|UK||||CUSTOM_EXT_TABLE|ASC|
|PK_CFA_EXT_ENTITY|UN||||EXT_ENTITY_ID|ASC|
|CFA_EXT_ENTITY_UK2|UN||||CUSTOM_EXT_TABLE|ASC|
|CFA_EXT_ENTITY_UK1|UN||||BASE_RMS_TABLE|ASC|

### Constraints

|Type|Column /<br>Constraint Name|Details|
|---|---|---|
|Column Level|ACTIVE_IND|Value List|
|Column Level|ACTIVE_IND|Value List|






|Type|Column /<br>Constraint Name|Details|Col4|Col5|
|---|---|---|---|---|
|||Value|Description||
|||'N'|||
|||'Y'|||
||BASE_IND|<br>Value List<br>Value<br>Description<br>'N'<br> <br>'Y'<br>|<br>Value List<br>Value<br>Description<br>'N'<br> <br>'Y'<br>|<br>Value List<br>Value<br>Description<br>'N'<br> <br>'Y'<br>|
||BASE_IND|Value List|Value List|Value List|
||BASE_IND|Value|Description|Description|
||BASE_IND|'N'|||
||BASE_IND|'Y'|||

---

## Table: CFA_EXT_ENTITY_KEY

**Description:** This table holds the entitys primary reference keys used to link the entitys base RMS table to the CFAS extension table

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | BASE_RMS_TABLE | P |  | Y | VARCHAR (30) | Contains the reference base RMS table |
| 2 | KEY_COL | P |  | Y | VARCHAR (30) | Contains the base tables primary key column name |
| 3 | KEY_NUMBER |  |  | Y | NUMERIC (2) | Holds the columns key sequence |
| 4 | DATA_TYPE |  |  | Y | VARCHAR (10) | The data type of the key column |
| 5 | DESCRIPTION_CODE |  |  |  | VARCHAR (61) | The name of an optional stored procedure used to return the description values associated to the key columns value. e.g. Store: 1 - Store description: Minneapolis Store. The function will return Minneapolis Store in the description field if the key value (in this case STORE) is 1 |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_CFA_EXT_ENTITY_KEY|PK||||BASE_RMS_TABLE|ASC|
||||||KEY_COL|ASC|
|CFA_EXT_ENT_KEY_UK1|UK||||BASE_RMS_TABLE|ASC|
||||||KEY_NUMBER|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_CFA_EXT_ENT_KEY_DATA_TYPE|DATA_TYPE in ('VARCHAR2', 'NUMBER', 'DATE')|
|Column Level|DATA_TYPE||

---

## Table: CFA_EXT_ENTITY_KEY_LABELS

**Description:** This table holds the prompt labels for each of the entity key columns and corresponding translated values in other languages supported by Oracle Retail.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | BASE_RMS_TABLE | P | F | Y | VARCHAR (30) | Contains the reference base table |
| 2 | KEY_COL | P | F | Y | VARCHAR (30) | Contains the reference base tables key column name |
| 3 | LANG | P | F | Y | NUMERIC (6) | Holds the labels language |
| 4 | DEFAULT_LANG_IND |  |  | Y | VARCHAR (1) | This indicates whether this language is used by default if there are no language sets that match the users language profile. |
| 5 | LABEL |  |  | Y | VARCHAR (255) | The displayed prompt label for the key column |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_CFA_EXT_ENTITY_KEY_LABELS|PK||||BASE_RMS_TABLE|ASC|
||||||KEY_COL|ASC|
||||||LANG|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_CFA_KEY_LABEL_DEF_LANG_IND|DEFAULT_LANG_IND in ('Y','N')<br>|

---

## Table: CFA_REC_GROUP

**Description:** This table will hold the queries used by LOVs in the CFA UI.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | REC_GROUP_ID | P |  | Y | NUMERIC (10) | Unique identifier for the reference record group query. |
| 2 | REC_GROUP_NAME |  |  |  | VARCHAR (30) | The name of the record group query. This is optional. |
| 3 | QUERY |  |  | Y | VARCHAR (2000) | Holds the record groups reference query. This may contain bind variables that may reference the key columns (CFA_EXT_ENTITY_KEY.KEY_COL) or the extension attributes (CFA_ATTRIB.VIEW_COL_NAME) that are available on the UI. The bind variable format is :<column name> e.g. :STORE for key columns or :QTY_LIMIT for extension attributes |
| 4 | BASE_IND |  |  | Y | VARCHAR (1) | Indicates whether this entry is defined by Oracle. Oracle defined RGs cannot be further customized |
| 5 | QUERY_TYPE |  |  | Y | VARCHAR (6) | Contains the query type value. Valid values are Simple and Complex. Simple queries can be created/maintained online. Complex queries must be entered/maintained by a DBA and can be viewed online. |
| 6 | TABLE_NAME |  |  |  | VARCHAR (30) | Contains the table value for simple queries. |
| 7 | COLUMN_1 |  |  |  | VARCHAR (30) | CONTAINS THE FIRST COLUMN TO BE SELECTED IN THE QUERY. GENERALLY, THIS SHOULD BE A VALUE COLUMN (EX. ITEM). THIS COLUMN WILL ONLY CONTAIN A VALUE FOR SIMPLE QUERIES. |
| 8 | COLUMN_2 |  |  |  | VARCHAR (30) | CONTAINS THE SECOND COLUMN TO BE SELECTED IN THE QUERY. GENERALLY, THIS SHOULD BE A DESCRIPTION TYPE COLUMN (EX. ITEM_DESC). THIS COLUMN WILL ONLY CONTAIN A VALUE FOR SIMPLE QUERIES. |
| 9 | WHERE_COL_1 |  |  |  | VARCHAR (30) | Contains the first column used in the querys where clause. This should contain a value for Simple queries. |
| 10 | WHERE_OPERATOR_1 |  |  |  | VARCHAR (6) | Contains the operator for the first condition in the where clause. Valid values are codes within code type CFWH. This will contain a value for Simple queries. |
| 11 | WHERE_COND_1 |  |  |  | VARCHAR (120) | Contains the condition value for the first condition statement in the where clause. It can be a constant value or bind variable. This will contain a value for Simple queries. |
| 12 | WHERE_COL_2 |  |  |  | VARCHAR (30) | Contains the column used in the second condition statment of querys where clause. This should contain a value for Simple queries. |
| 13 | WHERE_OPERATOR_2 |  |  |  | VARCHAR (6) | Contains the operator for the second condition in the where clause. Valid values are codes within code type CFWH. This will contain a value for Simple queries. |
| 14 | WHERE_COND_2 |  |  |  | VARCHAR (120) | Contains the condition value for the second condition statement in the where clause. It can be a constant value or bind variable. This will contain a value for Simple queries. |
| 15 | COL_1_DATA_TYPE |  |  |  | VARCHAR (106) | THIS WILL CONTAIN THE DATA TYPE ASSOCIATED WITH COLUMN_1. THIS SHOULD CONTAIN A VALUE FOR BOTH SIMPLE AND COMPLEX QUERIES. IT IS USED TO ENSURE THE FIELD ASSOCIATED WITH THIS RECORD GROUP HAS THE CORRECT DATA TYPE. |
| 16 | COL_1_DATA_LENGTH |  |  |  | NUMERIC (10) | THIS WILL CONTAIN THE DATA LENGTH ASSOCIATED WITH COLUMN_1. THIS SHOULD CONTAIN A VALUE FOR BOTH SIMPLE AND COMPLEX QUERIES. IT IS USED TO ENSURE THE FIELD ASSOCIATED WITH THIS RECORD GROUP HAS THE CORRECT LENGTH. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_CFA_REC_GROUP|PK||||REC_GROUP_ID|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_CFA_REC_GROUP_BASE_IND|BASE_IND in ('Y','N')<br>|
||CHK_CFA_REC_GROUP_QUERY_TYPE|QUERY_TYPE IN ('S','C')<br>|
|Column Level|BASE_IND||

---

## Table: CFA_REC_GROUP_LABELS

**Description:** This will contain the labels and corresponding transalated values displayed at the LOV title and column headers.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | REC_GROUP_ID | P | F | Y | NUMERIC (10) | Unique identifier to reference the record group |
| 2 | LANG | P | F | Y | NUMERIC (6) | The LOV labels language |
| 3 | DEFAULT_LANG_IND |  |  | Y | VARCHAR (1) | This indicates whether this language is used by default if there are no language sets that match the users language profile. |
| 4 | LOV_TITLE |  |  | Y | VARCHAR (255) | Holds the LOV title label |
| 5 | LOV_COL1_HEADER |  |  | Y | VARCHAR (255) | Holds the LOVs first column header label |
| 6 | LOV_COL2_HEADER |  |  |  | VARCHAR (255) | Holds the LOVs second column header label |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_CFA_REC_GROUP_LABELS|PK||||REC_GROUP_ID|ASC|
||||||LANG|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_CFA_RC_GRP_LBL_DFLT_LNG_IN|DEFAULT_LANG_IND in ('Y','N')|

---

## Table: L10N_ATTRIB

**Description:** This table holds the metadata that defines country specific localization attributes for all entities.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | GROUP_ID |  | F | Y | NUMERIC (10) | This column holds the ID of the group this attribute belongs to. |
| 2 | ATTRIB_ID | P |  | Y | NUMERIC (10) | This column holds the generated ID of the attribute. |
| 3 | VIEW_COL_NAME |  |  | Y | VARCHAR (30) | This column holds the description of the attribute. This description is limited to 30 characters so it can be referenced in the easy access views. This text string should not contain spaces or special characters |
| 4 | DATA_TYPE |  |  | Y | VARCHAR (10) | This column holds the data type of the attribute. Valid values are limited to V,N and D. |
| 5 | ATTRIB_STORAGE_COL |  |  | Y | VARCHAR (11) | This column holds the text string that corresponds to the storage column on the entity specific LFAS Storage table. |
| 6 | VALUE_REQ |  |  | Y | VARCHAR (1) | This column determines if the field is required to be not null when a record is created in the localization extension storage table. |
| 7 | DISPLAY_SEQ |  |  | Y | NUMERIC (2) | This column determines where the attribute will be displayed on the LFAS UI Widget. |
| 8 | UI_WIDGET |  |  | Y | VARCHAR (2) | This column holds the UI item type that should be displayed on the Localization Data Entry UI Widget. Valid values are TI (text item), RG |
| 9 | MAXIMUM_LENGTH |  |  |  | NUMERIC (20) | This column determines the maximum valid length the user can enter for field on the UI. A value is recommended for Char and Number attributes, and not valid for date attributes. |
| 10 | LOWEST_ALLOWED_VALUE |  |  |  | NUMERIC (20) | This value determines if the lowest numeric value that can be entered in the field. This value is optional and should only be populated when the data type of the attribute is Number. |
| 11 | HIGHEST_ALLOWED_VALUE |  |  |  | NUMERIC (20) | This value determines if the highest numeric value that can be entered in the field. This value is optional and should only be populated when the data type of the attribute is Number. |
| 12 | L10N_REC_GROUP_ID |  | F | Y | NUMERIC (10) | This column holds the ID of the record group associated with the attribute. Record groups are only needed when the attribute uses the record group (RG) UI item type. LFAS record groups are defined on the L10N_REC_GROUP table. LFAS record groups must be defined before an attribute using the record group is defined. |
| 13 | L10N_CODE_TYPE |  | F | Y | VARCHAR (4) | This column holds the localization specific code type associated with the attribute. Code types are only needed when the attribute uses the list item (LI) UI item type. |
| 14 | VALIDATION_CODE |  |  |  | VARCHAR (500) | This column holds the name (package and function) of code that should be called to validate this attribute. The validation code must be written as part of the localization process. The inputs and outputs of this field level validation code are tightly controlled. |
| 15 | BASE_IND |  |  | Y | VARCHAR (1) | This column determines if the attribute is created in the base installation. |
| 16 | ENABLE_IND |  |  | Y | VARCHAR (1) | This column determines if the field is disabled (display only) or editable. The value of the attribute should be sourced from L10N_ATTRIB_GROUP.DEFAULT_FUNC if the attribute is disabled. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_L10N_ATTRIB|PK||||ATTRIB_ID|ASC|
|UK_LATTRIB_GA|UK||||GROUP_ID|ASC|
||||||ATTRIB_STORAGE_COL|ASC|
|UK_LATTRIB_GD|UK||||GROUP_ID|ASC|
||||||DISPLAY_SEQ|ASC|
|UK_LATTRIB_GV|UK||||GROUP_ID|ASC|
||||||VIEW_COL_NAME|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_LATTRIB_ATTRIB_STORAGE_COL|(ATTRIB_STORAGE_COL LIKE DATA_TYPE||'%')<br>|
||CHK_LATTRIB_BASE_IND|BASE_IND IN ('Y','N')<br>|
||CHK_LATTRIB_DATA_TYPE|DATA_TYPE IN ('VARCHAR2','NUMBER','DATE')<br>|
||CHK_LATTRIB_DISPLAY_SEQ|(DISPLAY_SEQ > 0)<br>|
||CHK_LATTRIB_ENABLE_IND|ENABLE_IND IN ('Y','N')<br>|
||CHK_LATTRIB_LOWEST_ALLOWED_VAL|(LOWEST_ALLOWED_VALUE is NULL or HIGHEST_ALLOWED_VALUE is NULL or LOWEST_ALLOWED_VALUE <<br>HIGHEST_ALLOWED_VALUE)<br>|
||CHK_LATTRIB_MAXIMUM_LENGTH|(MAXIMUM_LENGTH > 0)<br>|
||CHK_LATTRIB_UI_WIDGET|UI_WIDGET IN ('TI', 'RG', 'LI', 'CB', 'DT')<br>|
||CHK_LATTRIB_UI_WIDGET1|((UI_WIDGET = 'LI' and L10N_CODE_TYPE is NOT NULL) or (UI_WIDGET != 'LI' and L10N_CODE_TYPE is NULL))<br>|






|Type|Column / Constraint Name|Details|
|---|---|---|
||CHK_LATTRIB_UI_WIDGET2|((UI_WIDGET = 'RG' and L10N_REC_GROUP_ID is NOT NULL) or (UI_WIDGET != 'RG' and L10N_REC_GROUP_ID is NULL))<br>|
||CHK_LATTRIB_VALUE_REQ|VALUE_REQ IN ('Y','N')<br>|
||CHK_LATTRIB_VIEW_COL_NAME|(VIEW_COL_NAME=upper(replace(VIEW_COL_NAME,' ','')))<br>|
|Column Level|VIEW_COL_NAME||
||DATA_TYPE||
||VALUE_REQ||
||DISPLAY_SEQ||
||UI_WIDGET||
||MAXIMUM_LENGTH||
||BASE_IND||
||ENABLE_IND||

---

## Table: L10N_ATTRIB_DESCS

**Description:** This table holds descriptions that will be used to label the attribute on the LFAS UI Widget.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ATTRIB_ID | P | F | Y | NUMERIC (10) | This column holds the attribute id of the attribute being described. |
| 2 | LANG | P | F | Y | NUMERIC (6) | This column holds the language the description is in. |
| 3 | DEFAULT_LANG_IND |  |  | Y | VARCHAR (1) | This column indicates that the current records description should be considered the default and displayed in the UI if a translation for the end users language does not exist. This column should be for only one language for the GROUP_ID |
| 4 | DESCRIPTION |  |  |  | VARCHAR (255) | This column holds the text that will be used to label the attribute on the LFAS UI Widget. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_L10N_ATTRIB_DESCS|PK||||ATTRIB_ID|ASC|
||||||LANG|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_L10N_AD_DEFAULT_LANG_IND|DEFAULT_LANG_IND IN ('Y','N')<br>|

---

## Table: L10N_ATTRIB_GROUP

**Description:** This table holds the metadata that defines country specific localization attributes groups for all entities.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | GROUP_ID | P |  | Y | NUMERIC (10) | This column holds a generated ID that distinguishes the localization attribute group. |
| 2 | EXT_ENTITY_ID |  | F | Y | NUMERIC (10) | This column holds id of the extension point being extended by this localization. |
| 3 | COUNTRY_ID |  | F | Y | VARCHAR (3) | This column holds the country code this extension applies to. |
| 4 | DISPLAY_ORDER |  |  | Y | NUMERIC (2) | This column holds the order the attribute groups will be displayed in on the LFAS UI Widget when multiple groups exist for a single ext_entity_id. |
| 5 | GROUP_VIEW_NAME |  |  | Y | VARCHAR (30) | This column holds the name of the database view that will be generated to make access to user entered data easier. |
| 6 | GROUP_VALIDATION_CODE |  |  |  | VARCHAR (500) | This column holds the name (package and function) of code that should be called to validate this attribute group.The validation code must be written as part of the localization process. The inputs and outputs of this attribute group level validation code are tightly controlled. |
| 7 | BASE_IND |  |  | Y | VARCHAR (1) | This column determines if the attribute group is created in the base installation. |
| 8 | DEFAULT_FUNC |  |  |  | VARCHAR (500) | This column holds the name of the stored procedure (package and function) that should be called on startup of the LFAS UI to pre-populate attribute fields with default values (for a particular attribute group). |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_L10N_ATTRIB_GROUP|PK||||GROUP_ID|ASC|
|UK_LAG|UK||||EXT_ENTITY_ID|ASC|
||||||COUNTRY_ID|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
||||||DISPLAY_ORDER|ASC|
|UK_LAG_GROUP_VIEW_NAME|UK||||GROUP_VIEW_NAME|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_LAG_BASE_IND|BASE_IND IN ('Y','N')<br>|
||CHK_LAG_GROUP_VIEW_NAME|GROUP_VIEW_NAME=upper(replace(GROUP_VIEW_NAME,' ',''))<br>|
|Column Level|GROUP_VIEW_NAME||
||BASE_IND||

---

## Table: L10N_ATTRIB_GROUP_DESCS

**Description:** This table holds the language specific descriptions that will be used to depict each specific group in the attribute groups section of the LFAS UIWidget. At least one record must exist on this table for each attribute group.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | GROUP_ID | P | F | Y | NUMERIC (10) | This column holds a generated ID that distinguishes the localization attribute group. |
| 2 | LANG | P | F | Y | NUMERIC (6) | This column holds the language the of the UI description. |
| 3 | DEFAULT_LANG_IND |  |  | Y | VARCHAR (1) | This column indicates that the current records description should be considered the default and displayed in the UI if a translation for the end users language does not exist. This column should be Y for only one language for the GROUP_ID |
| 4 | DESCRIPTION |  |  | Y | VARCHAR (255) | This column holds the text that will be used to identify the attribute group on the LFAS UI Widget. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_L10N_ATTRIB_GROUP_DESCS|PK||||GROUP_ID|ASC|
||||||LANG|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_LAGD_DEFAULT_LANG_IND|DEFAULT_LANG_IND IN ('Y','N')<br>|

---

## Table: L10N_BASE_FORM_ACTION

**Description:** This table holds the country specific item attributes in a form

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | FM_NAME | P |  | Y | VARCHAR (60) | This column holds the form name. |
| 2 | BLOCK_NAME | P |  | Y | VARCHAR (60) | This column holds the block within the form that the item is in. If the item is not in a block, this value is NONE. |
| 3 | ITEM_NAME | P |  | Y | VARCHAR (60) | This column holds the name of the form item. |
| 4 | ITEM_TYPE |  |  | Y | VARCHAR (60) | This column holds the type of the form item. |
| 5 | COUNTRY_ID | P | F | Y | VARCHAR (3) | This column holds the country code this extension applies to. |
| 6 | DISPLAYED_IND |  |  | Y | VARCHAR (1) | This column determines if the form item is to be displayed. |
| 7 | ENABLED_IND |  |  | Y | VARCHAR (1) | This column determines if the form item is to be enabled. |
| 8 | VALUE_REQ |  |  | Y | VARCHAR (1) | This column determines if the form item value is required. |
| 9 | MAXIMUM_LENGTH |  |  |  | NUMERIC (20) | This column determines the maximum valid length the user can enter for field on the UI. |
| 10 | LOWEST_VALUE_ALLOWED |  |  |  | NUMERIC (20) | This value determines the lowest numeric value that can be entered in the field. |
| 11 | HIGHEST_VALUE_ALLOWED |  |  |  | NUMERIC (20) | This value determines the highest numeric value that can be entered in the field. |
| 12 | VALIDATION_CODE |  |  |  | VARCHAR (20) | This column holds the name (package and function) of code that should be called to validate this field. |
| 13 | BASE_IND |  |  | Y | VARCHAR (1) | This column indicates whether the string is a base-release string. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_L10N_BASE_FORM_ACTION|PK||||FM_NAME|ASC|
||||||BLOCK_NAME|ASC|
||||||ITEM_NAME|ASC|
||||||COUNTRY_ID|ASC|
|L10N_BASE_FORM_ACTION_I1|||||COUNTRY_ID|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_L10N_BASE_FRM_ACT_ITEM_TYP|ITEM_TYPE in ('Bean Area', 'Chart Item', 'Check Box', 'Display Item',<br> 'Hierarchical Tree', 'Image', 'LOV', 'LOV Column Mapping', 'List Item',<br> 'Push Button', 'Radio Button', 'Tab Page', 'Text Item', 'User Area',<br> 'Window','Window Minimized')<br>|
|Column Level|ITEM_TYPE||

---

## Table: L10N_BATCH_CONFIG

**Description:** This table holds the function name for each key and country_id

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | FUNCTION_KEY |  |  | Y | VARCHAR (30) | This column contains the key identifier to the localized function. The combination of this field and the country ID determines the localized function. |
| 2 | COUNTRY_ID |  | F | Y | VARCHAR (3) | This column contains the country code of the localized function. |
| 3 | FUNCTION_NAME |  |  | Y | VARCHAR (60) | This column will hold the name of the function for the function_key and country_id. |
| 4 | USER_ID |  |  | Y | VARCHAR (30) | This column will contain the ORACLE User ID of the user who has inserted/updated the record. This field is poplulated by trigger. |
| 5 | LAST_UPDATE_DATETIME |  |  | Y | Date | This column holds the date of the most recent update by the user_id. This field is populated by trigger. |
| 6 | BASE_IND |  |  | Y | VARCHAR (1) | This column will hold value Y if the function is packaged along with product release and N if the function is customized by client. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|LBC_UK|UK||||FUNCTION_KEY|ASC|
||||||COUNTRY_ID|ASC|

### Constraints

|Type|Column / Constraint<br>Name|Details|
|---|---|---|
|Table Level|CHK_LBC_BASE_IND|BASE_IND IN ('Y','N')<br>|
||CHK_LBC_FUNCTION_NAME|FUNCTION_NAME = upper(replace(FUNCTION_NAME, ' ', '_'))<br>|
|Column Level|FUNCTION_NAME||
||BASE_IND||

---

## Table: L10N_CODE_DETAIL_DESCS

**Description:** This table holds the code/descriptions within a code type that will displayed as individual choices within the list items on the LFAS UIWidget.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | L10N_CODE_TYPE | P | F | Y | VARCHAR (4) | This column holds the distinct code type.This code type can be related to a list item on the LFAS UI Widget. |
| 2 | L10N_CODE | P |  | Y | VARCHAR (6) | This column holds a code within the code type. This code will be an individual item within the list on the LFAS UI Widget. |
| 3 | LANG | P | F | Y | NUMERIC (6) | This column defines the language of the code description. |
| 4 | DEFAULT_LANG_IND |  |  | Y | VARCHAR (1) | This column indicates that the current records description should be considered the default and displayed in the UI if a translation for the end users language does not exist. This column should be Y for only one language for the L10N_CODE_TYPE/L10N_CODE combination. |
| 5 | L10N_CODE_DESC |  |  | Y | VARCHAR (250) | This column holds the text value that will be displayed within the list to the end user. |
| 6 | SEQ_NO |  |  | Y | NUMERIC (4) | This column determines the order the code values will be displayed within the list. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_L10N_CODE_DETAIL_DESCS|PK||||L10N_CODE_TYPE|ASC|
||||||L10N_CODE|ASC|
||||||LANG|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_L10N_CD_DET_DESC_DEFT_LNG|DEFAULT_LANG_IND in ('Y','N')<br>|

---

## Table: L10N_CODE_HEAD

**Description:** This table holds the code types that will be used as the basis for defining list items in the LFAS UIWidget.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | L10N_CODE_TYPE | P |  | Y | VARCHAR (4) | This column holds the distinct code type.This code type can be related to a list item on the LFAS UI Widget. |
| 2 | COUNTRY_ID |  | F | Y | VARCHAR (3) | This column holds the country code this extension applies to. |
| 3 | CODE_TYPE_DESC |  |  | Y | VARCHAR (120) | This column holds a description of the code type. The code type description is never displayed to end users, so no translation is necessary. This data exists only to make it easier for developers to ensure they have selected the correct L10N_CODE_TYPE when creating the metadata for a list item LFAS attribute. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_L10N_CODE_HEAD|PK||||L10N_CODE_TYPE|ASC|

---

## Table: L10N_DOC_DETAILS_GTT

**Description:** This table holds the doc details related to order, mrt and transfer. This table is used for decoupling.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DOC_ID |  |  |  | NUMERIC (12) | Holds the value for the doc_id i.e the order_no or transfer_no or mrt. |
| 2 | DOC_TYPE |  |  |  | VARCHAR (6) | This field specifies the doc_type for the doc_id enered. |
| 3 | COUNTRY_ID |  |  |  | VARCHAR (3) | This field hold the country of the doc_id entered. |
| 4 | TSF_TYPE |  |  |  | VARCHAR (6) | If the doc_id entered is a transfer, then this column will hold the transfer type |
| 5 | ITEM |  |  |  | VARCHAR (25) | This field holds the item id. |
| 6 | SUPPLIER |  |  |  | NUMERIC (10) | This field holds the supplier of the item. |
| 7 | LOCATION |  |  |  | NUMERIC (10) | This field holds the location of the order or the item |
| 8 | LOC_TYPE |  |  |  | VARCHAR (1) | This field holds the Location type. |
| 9 | UNIT_COST |  |  |  | NUMERIC (20,4) | This field holds the unit cost of the item. This will hold either NIC or BC based on the settings of the item. |
| 10 | ORIGIN_COUNTRY_ID |  |  |  | VARCHAR (3) | This field holds the origin country id of the item. |

---

## Table: L10N_EXT_ENTITY_VAL

**Description:** This table holds the code that should be executed to perform inter-attribute group validations.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | EXT_ENTITY_ID |  | F | Y | NUMERIC (10) | This column holds a generated ID that distinguishes the model extension point. |
| 2 | COUNTRY_ID |  | F | Y | VARCHAR (3) | This column holds the country code this extension applies to. |
| 3 | CROSS_GROUP_VALIDATION_CODE |  |  |  | VARCHAR (500) | This column holds the name (package and function) of code that should be called to validate across attribute groups. A generic wrapper that calls the appropriate cross group validation code is called from the OK button on the LFAS UI Widget. The validation code must be written as part of the localization process. The inputs and outputs of this attribute group level validation code are tightly controlled. |
| 4 | CUSTOM_VALIDATION_CODE |  |  |  | VARCHAR (500) | This contains the name of the stored validation procedure <package.function name> to check data consistencies covering all custom attributes defined under the entity. |
| 5 | STAGING_TABLE |  |  |  | VARCHAR (30) | This column will hold the staging table name for an entity. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|UK_L10N_EXT_ENTITY_VAL|UK||||EXT_ENTITY_ID|ASC|
||||||COUNTRY_ID|ASC|
||||||CROSS_GROUP_VALIDATION_CODE|ASC|

---

## Table: L10N_MENU

**Description:** This table holds the menu elements for the LFAS UI, to allow access to other localized forms

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | L10N_MENU_ID | P |  | Y | NUMERIC (10) | System generated menu object ID |
| 2 | MENU_OBJECT_NAME |  |  | Y | VARCHAR (60) | Name of Menu Object |
| 3 | EXT_ENTITY_ID |  |  | Y | NUMERIC (10) | Contains the extended entity ID |
| 4 | COUNTRY_ID |  |  | Y | VARCHAR (3) | Th country of localization |
| 5 | MENU_SEQ |  |  |  | NUMERIC (2) | The order which the menu element is displayed at run time |
| 6 | CALLED_UI |  |  |  | VARCHAR (60) | Name of the called form |
| 7 | SHARED_SESSION_IND |  |  |  | VARCHAR (1) | Indicates whether the session is shared or not |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_L10N_MENU|PK||||L10N_MENU_ID|ASC|
|L10N_MENU_I1|||||MENU_OBJECT_NAME|ASC|
||||||EXT_ENTITY_ID|ASC|
||||||COUNTRY_ID|ASC|
|L10N_MENU_I2|||||EXT_ENTITY_ID|ASC|
||||||COUNTRY_ID|ASC|
||||||MENU_SEQ|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_LNM_SHARED_SESSION_IND|SHARED_SESSION_IND IN ('Y','N')<br>|






|Type|Column / Constraint Name|Details|
|---|---|---|
|Column Level|SHARED_SESSION_IND||

---

## Table: L10N_MENU_DESCS

**Description:** This table contains the translated menu labels, to each supported languages

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | L10N_MENU_ID | P | F | Y | NUMERIC (10) | Holds the referenced menu object ID |
| 2 | LANG | P |  | Y | NUMERIC (6) | Contains the menu label language |
| 3 | DESCRIPTION |  |  |  | VARCHAR (255) | Holds the menu label for the language |
| 4 | DEFAULT_LANG_IND |  |  | Y | VARCHAR (1) | Indicates whether the description will be used for languages other than those supported |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_L10N_MENU_DESCS|PK||||L10N_MENU_ID|ASC|
||||||LANG|ASC|

### Constraints

|Type|Column / Constraint<br>Name|Details|
|---|---|---|
|Table Level|CHK_DEFAULT_LANG_IND|DEFAULT_LANG_IND IN ('Y','N')<br>|

---

## Table: L10N_MENU_PARAMETER

**Description:** This table contains the list of parameters to be used by the LFAS UI menu, to access the localized forms.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | L10N_MENU_ID | P | F | Y | NUMERIC (10) | Referenced Menu ID |
| 2 | PARAMETER_NAME | P |  | Y | VARCHAR (60) | Contains the parameter name as defined in the called localized form |
| 3 | VALUE_SOURCE_TYPE |  |  | Y | VARCHAR (6) | Value of type of source. Either Fixed or Bind variable. |
| 4 | PARAMETER_VALUE |  |  |  | VARCHAR (250) | Contains the parameter value. Fixed can be any VARCHAR2 value while bind references any data field in the LFAS UI |
| 5 | VALUE_REQ_IND |  |  |  | VARCHAR (1) | This indicates whether a value on the LFAS UI needs to be supplied before the called localized form can be invoked. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_L10N_MENU_PARAMETER|PK||||L10N_MENU_ID|ASC|
||||||PARAMETER_NAME|ASC|

### Constraints

|Type|Column / Constraint<br>Name|Details|
|---|---|---|
|Table Level|CHK_VALUE_SOURCE_TYPE|VALUE_SOURCE_TYPE IN ('B','F')<br>|
|Column Level|VALUE_SOURCE_TYPE||

---

## Table: L10N_PKG_CONFIG

**Description:** This table holds the function name that should be executed dynamically for each key and country_id

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCEDURE_KEY |  |  | Y | VARCHAR (30) | This column contains the key identifier to the localized procedure. The combination of this field and the country ID determines the localized procedure to execute. |
| 2 | COUNTRY_ID |  | F |  | VARCHAR (3) | This column contains the country code of the localized procedure to dynamically execute |
| 3 | SCHEMA_NAME |  |  | Y | VARCHAR (30) | This column holds the schema name where the package is available. |
| 4 | PACKAGE_NAME |  |  | Y | VARCHAR (30) | This column holds the package name where the function is available. |
| 5 | FUNCTION_NAME |  |  | Y | VARCHAR (30) | This column will hold the name of the function which should be executed dynamically for the procedure_key and country_id. |
| 6 | USER_ID |  |  | Y | VARCHAR (30) | This column will contain the ORACLE User ID of the user who has inserted/updated the record. This field is poplulated by trigger. |
| 7 | LAST_UPDATE_DATETIME |  |  | Y | Date | This column holds the date of the most recent update by the user_id. This field is populated by trigger. |
| 8 | BASE_IND |  |  | Y | VARCHAR (1) | This column indicates whether the record came from a localization pack or customized installation |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|L10PC_UK|UK||||PROCEDURE_KEY|ASC|
||||||COUNTRY_ID|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_L10PC_BASE_IND<br><br>|BASE_IND IN ('Y','N')<br>|






|Type|Column / Constraint Name|Details|
|---|---|---|
||CHK_L10PC_FUNCTION_NAME|FUNCTION_NAME = upper(replace(FUNCTION_NAME, ' ', '_'))<br>|
||CHK_L10PC_PACKAGE_NAME|PACKAGE_NAME = upper(replace(PACKAGE_NAME, ' ', '_'))<br>|
||CHK_L10PC_SCHEMA_NAME|SCHEMA_NAME = upper(replace(SCHEMA_NAME, ' ', '_'))<br>|
|Column Level|SCHEMA_NAME||
||PACKAGE_NAME||
||FUNCTION_NAME||
||BASE_IND||

---

## Table: L10N_REC_GROUP

**Description:** This table holds the localization record group entries

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | L10N_REC_GROUP_ID | P |  | Y | NUMERIC (10) | This column holds generated ID of the localization record group. |
| 2 | COUNTRY_ID |  | F | Y | VARCHAR (3) | This column holds the country code this extension applies to. |
| 3 | QUERY |  |  | Y | VARCHAR (2000) | This column holds the query that will be executed when the record group is associated with an attribute and displayed on the LFAS UI Widget. The query must adhere to several rules: 1. It must be a complete, valid query that is capable of executing in a SQL*Plus session. 2. It must follow RGBU translation standards. 3. can have no more than two columns in the SELECT portion of its statement, one ID column and one description column. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_L10N_REC_GROUP|PK||||L10N_REC_GROUP_ID|ASC|

---

## Table: L10N_REC_GROUP_DESCS

**Description:** This table holds the column descriptions that should be displayed to end users when a specific record group list of values is invoked from the LFAS UIWidget.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | L10N_REC_GROUP_ID | P | F | Y | NUMERIC (10) | This column holds generated ID of the localization record group. |
| 2 | LANG | P | F | Y | NUMERIC (6) | This column holds the language the of the UI description. |
| 3 | DEFAULT_LANG_IND |  |  | Y | VARCHAR (1) | This column indicates that the current records description should be considered the default and displayed in the UI if a translation for the end users language does not exist. This column should be Y for only one language for the L10N_REC_GROUP_ID. |
| 4 | LOV_TITLE |  |  | Y | VARCHAR (255) | This column holds the language specific value for the LOV title. This value will be displayed in the LOV header when the record group is invoked from the LFAS UI Widget. |
| 5 | LOV_COL1_HEADER |  |  | Y | VARCHAR (255) | This column holds the language specific value for the first LOV column header. This value will be displayed in the LOV header when the record group is invoked from the LFAS UI Widget. |
| 6 | LOV_COL2_HEADER |  |  | Y | VARCHAR (255) | This column holds the language specific value for the second LOV column header. This value will be displayed in the LOV header when the record group is invoked from the LFAS UI Widget. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_L10N_REC_GROUP_DESCS|PK||||L10N_REC_GROUP_ID|ASC|
||||||LANG|ASC|

---

## Table: L10N_TAX_OBJECT_CONFIG

**Description:** This table holds the configuration for tax calculation.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TAX_OBJECT_MAX_SIZE | P |  | Y | NUMERIC (10) | Defines the maximum number of records of type OBJ_TAX_REC that is passed to the L10 tax integration layer. |
| 2 | THREAD_ITEM_LOC_COUNT |  |  | Y | NUMERIC (10) | Column to help with threading of work in RTIL. Determines how much data should be added to a thread. |

---

## Table: LOCALIZATION_CONFIG_OPTIONS

**Description:** This table contains attributes that impact how localization functions, such as tax, is configured in RMS.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | CLASS_LEVEL_VAT_IND |  |  | Y | VARCHAR (1) | Determines whether the retailer wants the ability to control at the class level whether retail values in RMS are displayed as VAT inclusive or not. |
| 2 | DEFAULT_TAX_TYPE |  |  | Y | VARCHAR (6) | This determines what type of taxation is being used by the company. Valid values are: 'SVAT' Simple VAT (VAT information is configured in RMS) 'GTAX' Global Taxation (Used for Brazil localized solution having external tax engine) 'SALES' Sales and Use Tax |
| 3 | DEFAULT_VAT_REGION |  |  |  | NUMERIC (4) | The default VAT region is used when a VAT region cannot be determined for a transaction. |
| 4 | NWP_IND |  |  |  | VARCHAR (1) | Indicates if NWP processing is turned on in the system. This feature will enable a retailer to determine the end of year inventory values in each store as of December 31st of the previous year position with the assumption that a stock count must be executed |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | Stores the Oracle username of the one who inserted the first record. This field is required by the database. |
| 6 | CREATE_DATETIME |  |  | Y | Date | The date and time of when the record was created in the table. This value should only be populated on insert - it should never be updated. |
| 7 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | The Oracle username of the one who most recently updated this record. |
| 8 | LAST_UPDATE_DATETIME |  |  | Y | Date | The date time stamp of the most recent update by the user. |

---

## Table: TRANSLATE_METADATA

**Description:** This table is used by the application to dynamically render and process the global translation screen. This table contains the metadata of how the translation tables have been designed and the content of this table should be kept in sync with any change in structure of translation table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | BASE_TABLE | P |  | Y | VARCHAR (30) | Contains the base system of record RMS table for this entity. |
| 2 | BASE_COLUMN | P |  | Y | VARCHAR (30 ) | The base column name in translate table for this field. |
| 3 | TRANSLATE_TABLE |  |  | Y | VARCHAR (30 ) | Contains the translate table name for this entity |
| 4 | TRANSLATE_COLUMN |  |  | Y | VARCHAR (30 ) | Contain the column name in translate table |
| 5 | VARIABLE_NAME |  |  | Y | VARCHAR (30 ) | The data shared between ADF and the DB layer is identified by this column. The signature of the database package will be having generic key variables and generic text variables. This field maps the variable being passed in the package to the column being referred in the translation tables. The column will contain values for primary key and values for text fields. Valid values are KEY_NUMBER_1 to KEY_NUMBER_4, KEY_VARCHAR2_5 to KEY_VARCHAR2_9, KEY_DATE_10 to KEY_DATE_11, TEXT_1 to TEXT_9. |
| 6 | KEY |  |  | Y | VARCHAR (1 ) | Identifies if this field is part of the primary or unique key in the translate table. |
| 7 | COLUMN_SEQUENCE |  |  | Y | NUMERIC (2) | The sequence of column in which the data has to be presented to the user |
| 8 | NULLABLE |  |  | Y | VARCHAR (1 ) | Is this field nullable |
| 9 | DATA_TYPE |  |  | Y | VARCHAR (10 ) | indicates the data type. Should be one of VARCHAR2 or DATE or NUMBER |
| 10 | DATA_LENGTH |  |  |  | NUMERIC (6) | Indicates the maximum length for data in this field. Can be null only in case of Date |
| 11 | LABEL |  |  | Y | VARCHAR (6) | This contains the default UI label to be used for this field if the label is not available in the UI layer. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_TRANSLATE_METADATA|PK||||BASE_TABLE|ASC|
||||||BASE_COLUMN|ASC|

---

## Table: TRANSLATE_METADATA_TABLE

**Description:** This contains the code of default UI label to be used for base system of record RMS table for this entity.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | BASE_TABLE | P |  | Y | VARCHAR (30 ) | Contains the base system of record RMS table for this entity. |
| 2 | LABEL |  |  | Y | VARCHAR (6 ) | Contains the code of default UI label to be used for base system of record RMS table for this entity. |

---

## Table: TRANSLATE_VIEW_STRUCTURE

**Description:** This is dummy table and will always be empty. This table along with translate_metadata table is used by the global translation screen to dynamically render the screen. This table defines the structure of how the translation data is held by the programmatic view object. The actual data is fetched through package call in the application code.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TRANSLATE_TABLE | P |  | Y | VARCHAR (30 ) | Contains the translation table name |
| 2 | LANG | P |  | Y | NUMERIC (6) | Indicates the language code. |
| 3 | KEY_NUMBER_1 |  |  |  | NUMERIC (20) | Numeric key field |
| 4 | KEY_NUMBER_2 |  |  |  | NUMERIC (20) | Numeric key field |
| 5 | KEY_NUMBER_3 |  |  |  | NUMERIC (20) | Numeric key field |
| 6 | KEY_NUMBER_4 |  |  |  | NUMERIC (20) | Numeric key field |
| 7 | KEY_VARCHAR2_5 |  |  |  | VARCHAR (255 ) | Text key field |
| 8 | KEY_VARCHAR2_6 |  |  |  | VARCHAR (255 ) | Text key field |
| 9 | KEY_VARCHAR2_7 |  |  |  | VARCHAR (255 ) | Text key field |
| 10 | KEY_VARCHAR2_8 |  |  |  | VARCHAR (255 ) | Text key field |
| 11 | KEY_VARCHAR2_9 |  |  |  | VARCHAR (255 ) | Text key field |
| 12 | KEY_DATE_10 |  |  |  | Date | Date key field |
| 13 | KEY_DATE_11 |  |  |  | Date | Date key field |
| 14 | TEXT_1 |  |  |  | VARCHAR (2000 ) | Text field |
| 15 | TEXT_2 |  |  |  | VARCHAR (2000 ) | Text field |
| 16 | TEXT_3 |  |  |  | VARCHAR (2000 ) | Text field |
| 17 | TEXT_4 |  |  |  | VARCHAR (2000 ) | Text field |
| 18 | TEXT_5 |  |  |  | VARCHAR (2000 ) | Text field |
| 19 | TEXT_6 |  |  |  | VARCHAR (2000 ) | Text field |
| 20 | TEXT_7 |  |  |  | VARCHAR (2000 ) | Text field |
| 21 | TEXT_8 |  |  |  | VARCHAR (2000 ) | Text field |
| 22 | TEXT_9 |  |  |  | VARCHAR (2000 ) | Text field |
