# RMS Import Management, Customs & Letters of Credit Datamodel - Physical Data Model Reference

## Table: COND_TARIFF_TREATMENT

**Description:** This table is used to store the list of conditional tariff treatments that relate to a particular module and key values.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM | P | F | Y | VARCHAR (25) | Alphanumeric value that identifies the item. |
| 2 | TARIFF_TREATMENT | P | F | Y | VARCHAR (10) | This field contains the US customs approved code to uniquely identify the special conditional tariff program that will be attached to the module and key values. |
| 3 | CREATE_DATETIME |  |  | Y | Date | Date/time stamp of when the record was created. This date/time will be used in export processing. This value should only be populated on insert - it should never be updated. |
| 4 | LAST_UPDATE_DATETIME |  |  | Y | Date | Holds the date time stamp of the most recent update by the last_update_id. This field is required by the database. |
| 5 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | Holds the Oracle user-id of the user who most recently updated this record. This field is required by the database. |
| 6 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_COND_TARIFF_TREATMENT|PK||||ITEM|ASC|
||||||TARIFF_TREATMENT|ASC|
|COND_TARIFF_TREATMENT_I1|||||TARIFF_TREATMENT|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_COND_TARIFF_TRMT_TTRMT|tariff_treatment = upper(tariff_treatment)<br>|
|Column Level|TARIFF_TREATMENT||

---

## Table: COUNTRY

**Description:** This table contains one row for each country defined within Oracle Retail.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | COUNTRY_ID | P |  | Y | VARCHAR (3) | Contains a number which uniquely identifies the country. |
| 2 | COUNTRY_DESC |  |  | Y | VARCHAR (120) | Contains the name of the country. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_COUNTRY|PK||||COUNTRY_ID|ASC|

---

## Table: COUNTRY_ATTRIB

**Description:** This table will be created to hold the country level attributes.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | COUNTRY_ID | P | F | Y | VARCHAR (3) | This contains the code which uniquely identifies the country. |
| 2 | LOCALIZED_IND |  |  | Y | VARCHAR (1) | This will indicate if a certain country is localized or not. This will determine if localized attributes will be required. Valid values are Yes or No. Default value is No. |
| 3 | ITEM_COST_TAX_INCL_IND |  |  | Y | VARCHAR (1) | This will indicate if the costs defined for items in that country is inclusive or exclusive of tax. Default value is No. |
| 4 | DEFAULT_PO_COST |  |  |  | VARCHAR (6) | This will indicate at which cost the purchasing would be done in a country. This is the cost at which the Purchase orders would be raised. Default value is BC - Base Cost. Valid values are, Base Cost (BC) and Negotiated Item Cost (NIC). |
| 5 | DEFAULT_DEAL_COST |  |  |  | VARCHAR (6) | This will indicate at which cost the deals would be applied in a country. Default value is BC - Base Cost. Valid values are, Base Cost (BC) and Negotiated Item Cost (NIC). |
| 6 | DEFAULT_COST_COMP_COST |  |  |  | VARCHAR (6) | This will indicate which cost system a country will use during cost component definition. Default value is BC. |
| 7 | DEFAULT_LOC |  |  |  | NUMERIC (10) | Default location, whose fiscal attributes would be used to to set the initial item retail when no locations have been ranged for the item. The location should belong to the given country. This can either be a store or a warehouse. |
| 8 | DEFAULT_LOC_TYPE |  |  |  | VARCHAR (1) | This column will hold the type of the Default location of a particular country. |
| 9 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |
| 10 | CREATE_DATETIME |  |  | Y | Date | This column holds the record creation date. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_COUNTRY_ATTRIB|PK||||COUNTRY_ID|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_CA_DEFAULT_LOC_TYPE|DEFAULT_LOC_TYPE IN ('S','W','E')<br>|
||CHK_COUNTRY_ATTRIB_DEFAULT_COS|DEFAULT_COST_COMP_COST IN ('NIC','BC')<br>|
||CHK_COUNTRY_ATTRIB_DEFAULT_PO|DEFAULT_PO_COST IN ('NIC','BC')<br>|
||CHK_COUNTRY_ATTRIB_DEFA_DL_COS|DEFAULT_DEAL_COST IN ('NIC','BC')<br>|
||CHK_COUNTRY_ATTRIB_ITEM_COST_T|ITEM_COST_TAX_INCL_IND IN ('Y','N')<br>|
||CHK_COUNTRY_ATTRIB_LOCAL_IND|LOCALIZED_IND IN ('Y','N')<br>|
|Column Level|LOCALIZED_IND||
||ITEM_COST_TAX_INCL_IND||
||DEFAULT_PO_COST||
||DEFAULT_DEAL_COST||
||DEFAULT_COST_COMP_COST||

---

## Table: COUNTRY_L10N_EXT

**Description:** This is the LFAS storage table for the entity COUNTRY

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | COUNTRY_ID | P | F | Y | VARCHAR (3) | This column holds the country this extended data is associated with. The logical business meaning of the VARCHAR_, NUMBER_ and DATE_ columns on this table are determined by the metadata defined for this country in its localization pack. |
| 2 | L10N_COUNTRY_ID | P | F | Y | VARCHAR (3) | Contains the unique code that identifies the country. |
| 3 | GROUP_ID | P | F | Y | NUMERIC (10) | This column holds the attribute group id that this extended data is associated with. The logical business meaning of the VARCHAR_, |
| 4 | VARCHAR2_1 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references VARCHAR2_1 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 5 | VARCHAR2_2 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references VARCHAR2_2 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 6 | VARCHAR2_3 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references VARCHAR2_3 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 7 | VARCHAR2_4 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references VARCHAR2_4 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 8 | VARCHAR2_5 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references VARCHAR2_5 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 9 | VARCHAR2_6 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references VARCHAR2_6 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 10 | VARCHAR2_7 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references VARCHAR2_7 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 11 | VARCHAR2_8 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references VARCHAR2_8 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 12 | VARCHAR2_9 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references VARCHAR2_9 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 13 | VARCHAR2_10 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references VARCHAR2_10 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 14 | NUMBER_11 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references NUMBER_11 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 15 | NUMBER_12 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references NUMBER_12 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 16 | NUMBER_13 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references NUMBER_13 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 17 | NUMBER_14 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references NUMBER_14 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 18 | NUMBER_15 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references NUMBER_15 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 19 | NUMBER_16 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references NUMBER_16 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 20 | NUMBER_17 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references NUMBER_17 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 21 | NUMBER_18 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references NUMBER_18 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 22 | NUMBER_19 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references NUMBER_19 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 23 | NUMBER_20 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references NUMBER_20 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 24 | DATE_21 |  |  |  | Date | This column holds data related to the attribute defined on the L10N_ATTRIB table that references DATE_21 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 25 | DATE_22 |  |  |  | Date | This column holds data related to the attribute defined on the L10N_ATTRIB table that references DATE_22 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_COUNTRY_L10N_EXT|PK||||COUNTRY_ID|ASC|
||||||L10N_COUNTRY_ID|ASC|
||||||GROUP_ID|ASC|

---

## Table: COUNTRY_TARIFF_TREATMENT

**Description:** Contains a number that uniquely identifies the country.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | COUNTRY_ID | P |  | Y | VARCHAR (3) | Contains a number that uniquely identifies the country. |
| 2 | TARIFF_TREATMENT | P | F | Y | VARCHAR (10) | Contains a code to identify a specific tariff program for the country. |
| 3 | EFFECTIVE_FROM | P |  | Y | Date | Contains the date that this particular tariff treatment becomes active for the country. |
| 4 | EFFECTIVE_TO |  |  |  | Date | Contains the date that this particular tariff treatment becomes inactive for the country. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_COUNTRY_TARIFF_TREATMENT|PK||||COUNTRY_ID|ASC|
||||||TARIFF_TREATMENT|ASC|
||||||EFFECTIVE_FROM|ASC|
|COUNTRY_TARIFF_TREATMENT_I1|||||TARIFF_TREATMENT|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_COUNTRY_TARIFF_TRMT_TTRMT|tariff_treatment = upper(tariff_treatment)<br>|
|Column Level|TARIFF_TREATMENT||

---

## Table: COUNTRY_TAX_JURISDICTION

**Description:** This table will hold tax jurisdiction information for a country-state relationship.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | COUNTRY_ID | P | F | Y | VARCHAR (3) | The country id of the jurisdiction code. |
| 2 | STATE | P | F | Y | VARCHAR (3) | The state related to the country id of the jurisdiction code. |
| 3 | JURISDICTION_CODE | P |  | Y | VARCHAR (10) | Identifies the jurisdiction code for the country-state relationship. |
| 4 | JURISDICTION_DESC |  |  | Y | VARCHAR (120) | Description of the jurisdiction code. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_COUNTRY_TAX_JURISDICTION|PK||||COUNTRY_ID|ASC|
||||||STATE|ASC|
||||||JURISDICTION_CODE|ASC|

---

## Table: COUNTRY_TL

**Description:** This is the translation table for COUNTRY table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | COUNTRY_ID | P | F | Y | VARCHAR (3) | Contains a number which uniquely identifies the country. |
| 3 | COUNTRY_DESC |  |  | Y | VARCHAR (120) | Contains the name of the country. |
| 4 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 6 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 7 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_COUNTRY_TL|PK||||LANG|ASC|
||||||COUNTRY_ID|ASC|

---

## Table: CVB_DETAIL

**Description:** This table holds the Computation Value Base header information.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | CVB_CODE | P | F | Y | VARCHAR (10) | Contains a user specified code representing a computation base that will be used by expenses and assessments. |
| 2 | COMP_ID | P | F | Y | VARCHAR (10) | Contains a user specified code representing a specific expense. This code must exist on the LCST_COMP table where the comp_type is Expense (E). |
| 3 | COMBO_OPER |  |  |  | VARCHAR (1) | Contains a flag indicating whether to add or subtract this expense to the value base. Valid values are Add (+) or Subtract (-). |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_CVB_DETAIL|PK||||CVB_CODE|ASC|
||||||COMP_ID|ASC|
|CVB_DETAIL_I1|||||COMP_ID|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_CVB_DETAIL_COMBO_OPER|combo_oper in ('+','-','>','<')<br>|
|Column Level|COMBO_OPER||

---

## Table: CVB_HEAD

**Description:** This table holds the Computation Value Base detail information. This information indicates what expenses make of the Computation Value Base used in the calculations of other expenses.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | CVB_CODE | P |  | Y | VARCHAR (10) | Contains a user specified code representing a computation base that will be used by expenses. |
| 2 | CVB_DESC |  |  | Y | VARCHAR (250) | Contains the description or name of the Computation Value Base. |
| 3 | NOM_FLAG_1 |  |  | Y | VARCHAR (1) | Contains a flag that is used to indicate whether or not to include expenses in the value base with the corresponding Nomination Flag on the Expense record turned on (i.e. set to + or -). Valid values are Y - include expenses with this flag set, or N - do not include expenses with this flag set. |
| 4 | NOM_FLAG_2 |  |  | Y | VARCHAR (1) | Contains a flag that is used to indicate whether or not to include expenses in the value base with the corresponding Nomination Flag on the Expense record turned on (i.e. set to + or -). Valid values are Y - include expenses with this flag set, or N - do not include expenses with this flag set. |
| 5 | NOM_FLAG_3 |  |  | Y | VARCHAR (1) | Contains a flag that is used to indicate whether or not to include expenses in the value base with the corresponding Nomination Flag on the Expense record turned on (i.e. set to + or -). Valid values are Y - include expenses with this flag set, or N - do not include expenses with this flag set. |
| 6 | NOM_FLAG_4 |  |  | Y | VARCHAR (1) | Contains a flag that is used to indicate whether or not to include expenses in the value base with the corresponding Nomination Flag on the Expense record turned on (i.e. set to + or -). Valid values are Y - include expenses with this flag set, or N - do not include expenses with this flag set. |
| 7 | NOM_FLAG_5 |  |  | Y | VARCHAR (1) | Contains a flag that is used to indicate whether or not to include expenses in the value base with the corresponding Nomination Flag on the Expense record turned on (i.e. set to + or -). Valid values are Y - include expenses with this flag set, or N - do not include expenses with this flag set. |
| 8 | COMBO_OPER |  |  |  | VARCHAR (1) | Contains a flag indicating the operation to be performed. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_CVB_HEAD|PK||||CVB_CODE|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_CVB_HEAD_COMBO_OPER|combo_oper in ('+','-','>','<') OR combo_oper IS NULL<br>|
||CHK_CVB_HEAD_NOM_FLAG_1|nom_flag_1 in ('Y','N')<br>|
||CHK_CVB_HEAD_NOM_FLAG_2|nom_flag_2 in ('Y','N')<br>|
||CHK_CVB_HEAD_NOM_FLAG_3|nom_flag_3 in ('Y','N')<br>|
||CHK_CVB_HEAD_NOM_FLAG_4|nom_flag_4 in ('Y','N')|
||CHK_CVB_HEAD_NOM_FLAG_5|nom_flag_5 in ('Y','N')<br>|
|Column Level|NOM_FLAG_1||
||NOM_FLAG_2||
||NOM_FLAG_3||
||NOM_FLAG_4||
||NOM_FLAG_5||
||COMBO_OPER||

---

## Table: CVB_HEAD_TL

**Description:** This is the translation table for CVB_HEAD table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | CVB_CODE | P | F | Y | VARCHAR (10) | Contains a user specified code representing a computation base that will be used by expenses. |
| 3 | CVB_DESC |  |  | Y | VARCHAR (250) | Contains the description or name of the Computation Value Base. |
| 4 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 6 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 7 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_CVB_HEAD_TL|PK||||LANG|ASC|
||||||CVB_CODE|ASC|

---

## Table: ENTRY_STATUS

**Description:** This table will hold the possible entry status for any import country.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ENTRY_STATUS | P |  | Y | VARCHAR (6) | This will hold the unique identifier for the custom defined entry status. |
| 2 | IMPORT_COUNTRY_ID | P |  | Y | VARCHAR (3) | This column will hold the import country. |
| 3 | ENTRY_STATUS_DESC |  |  | Y | VARCHAR (250) | This column will hold the description of the entry status. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_ENTRY_STATUS|PK||||ENTRY_STATUS|ASC|
||||||IMPORT_COUNTRY_ID|ASC|

---

## Table: ENTRY_STATUS_TL

**Description:** This is the translation table for ENTRY_STATUS table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | ENTRY_STATUS | P | F | Y | VARCHAR (6) | This will hold the unique identifier for the custom defined entry status. |
| 3 | IMPORT_COUNTRY_ID | P | F | Y | VARCHAR (3) | This column will hold the import country. |
| 4 | ENTRY_STATUS_DESC |  |  | Y | VARCHAR (250) | This column will hold the description of the entry status. |
| 5 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 6 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 7 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 8 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_ENTRY_STATUS_TL|PK||||LANG|ASC|
||||||ENTRY_STATUS|ASC|
||||||IMPORT_COUNTRY_ID|ASC|

---

## Table: ENTRY_TYPE

**Description:** This table will hold the possible entry types for any import country.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ENTRY_TYPE | P |  | Y | VARCHAR (6) | This will hold the unique identifier for the custom defined entry type. |
| 2 | IMPORT_COUNTRY_ID | P |  | Y | VARCHAR (3) | This column will hold the valid of the import country. |
| 3 | ENTRY_TYPE_DESC |  |  | Y | VARCHAR (250) | This column will hold the description of the entry type. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_ENTRY_TYPE|PK||||ENTRY_TYPE|ASC|
||||||IMPORT_COUNTRY_ID|ASC|

---

## Table: ENTRY_TYPE_TL

**Description:** This is the translation table for ENTRY_TYPE table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | ENTRY_TYPE | P | F | Y | VARCHAR (6) | This will hold the unique identifier for the custom defined entry type. |
| 3 | IMPORT_COUNTRY_ID | P | F | Y | VARCHAR (3) | This column will hold the valid of the import country. |
| 4 | ENTRY_TYPE_DESC |  |  | Y | VARCHAR (250) | This column will hold the description of the entry type. |
| 5 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 6 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 7 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 8 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_ENTRY_TYPE_TL|PK||||LANG|ASC|
||||||ENTRY_TYPE|ASC|
||||||IMPORT_COUNTRY_ID|ASC|

---

## Table: FREIGHT_SIZE

**Description:** This table is used to store freight sizes that will be attached to Transportation records.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | FREIGHT_SIZE | P |  | Y | VARCHAR (6) | This field contains the unique identifier for the freight size record. |
| 2 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |
| 3 | CREATE_DATETIME |  |  | Y | Date | This column holds the record creation date. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_FREIGHT_SIZE|PK||||FREIGHT_SIZE|ASC|

---

## Table: FREIGHT_SIZE_TL

**Description:** This table holds the translated descriptions of freight size description in all languages.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | FREIGHT_SIZE | P | F | Y | VARCHAR (6) | This field contains the unique identifier for the freight size record. |
| 2 | LANG | P | F | Y | NUMERIC (6) | This field contains the number which uniquely identifies a language. |
| 3 | FREIGHT_SIZE_DESC |  |  | Y | VARCHAR (250) | This field contains the description of the freight size in a given language. |
| 4 | ORIG_LANG_IND |  |  | Y | VARCHAR (1) | This field indicates if the description is in the original language entered for the freight size description. It is set to 'Y' when the first record is written to the table for the freight size. |
| 5 | REVIEWED_IND |  |  | Y | VARCHAR (1) | Indicates if the description needs to be reviewed for translation. It is set to 'N' when the description in the original language is inserted or updated. We assume that clients will regularly run reports on all strings that are not reviewed (i.e. reviewed_ind = 'N'). When translation either provides a new string, or OKs that the existing string is correct, the reviewed_ind should be set to 'Y'. |
| 6 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 7 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 8 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |
| 9 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_FREIGHT_SIZE_TL|PK||||FREIGHT_SIZE|ASC|
||||||LANG|ASC|

### Constraints

|Type|Column / Constraint<br>Name|Details|
|---|---|---|
|Table Level|CHK_FS_TL_ORIG_LANG_IND|ORIG_LANG_IND IN ('Y','N')<br>|
|Column Level|REVIEWED_IND||

---

## Table: FREIGHT_TERMS

**Description:** This table contains one row for each set of freight terms allowed in the company. The table is populated during installation and must be maintained by the database administrator.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | FREIGHT_TERMS | P |  | Y | VARCHAR (30) | Contains a number that uniquely identifies the freight terms. |
| 2 | START_DATE_ACTIVE |  |  |  | Date | Indicates the date for assigning an active date to the Freight Terms. |
| 3 | END_DATE_ACTIVE |  |  |  | Date | Indicates the date for assigning an inactive date to the Freight Terms. |
| 4 | ENABLED_FLAG |  |  | Y | VARCHAR (1) | Indicates whether the freight terms are valid or invalid within the respective application. The values would be either (Y)es or (N)o. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_FREIGHT_TERMS|PK||||FREIGHT_TERMS|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_FREIGHT_TERMS_ENABLED_FLAG|ENABLED_FLAG in ('Y', 'N')<br>|
|Column Level|ENABLED_FLAG||

---

## Table: FREIGHT_TERMS_TL

**Description:** This table holds the translated descriptions of freight terms in all languages.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | FREIGHT_TERMS | P | F | Y | VARCHAR (30) | Contains a number that uniquely identifies the freight terms. |
| 2 | LANG | P | F | Y | NUMERIC (6) | Contains the number which uniquely identifies a language. |
| 3 | TERM_DESC |  |  | Y | VARCHAR (240) | Contains a description of the freight terms used in the system. Examples include a specified percent of total cost, free, or a specified percentage added to the invoice. |
| 4 | ORIG_LANG_IND |  |  | Y | VARCHAR (1) | Indicates if the description is in the original language entered for the freight terms code. It is set to 'Y' when the first record is written to the table for the freight terms code. |
| 5 | REVIEWED_IND |  |  | Y | VARCHAR (1) | Indicates if the description needs to be reviewed for translation. It is set to 'N' when the description in the original language is inserted or updated. We assume that clients will regularly run reports on all strings that are not reviewed (i.e. reviewed_ind = 'N'). When translation either provides a new string, or OKs that the existing string is correct, the reviewed_ind should be set to 'Y'. |
| 6 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 7 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 8 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 9 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_FREIGHT_TERMS_TL|PK||||FREIGHT_TERMS|ASC|
||||||LANG|ASC|

### Constraints

|Type|Column / Constraint<br>Name|Details|
|---|---|---|
|Table Level|CHK_FTL_ORIG_LANG_IND|ORIG_LANG_IND IN ('N','Y')<br>|
|Column Level|REVIEWED_IND||

---

## Table: FREIGHT_TYPE

**Description:** This table is used to store freight types that will be attached to Transportation records.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | FREIGHT_TYPE | P |  | Y | VARCHAR (6) | Contains the unique key that identifies the freight type record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_FREIGHT_TYPE|PK||||FREIGHT_TYPE|ASC|

---

## Table: FREIGHT_TYPE_TL

**Description:** This table holds the translated descriptions of freight type description in all languages.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | FREIGHT_TYPE | P | F | Y | VARCHAR (6) | This field contains the unique identifier for the freight type record. |
| 2 | LANG | P | F | Y | NUMERIC (6) | This field contains the number which uniquely identifies a language. |
| 3 | FREIGHT_TYPE_DESC |  |  | Y | VARCHAR (250 ) | This field contains the description of the freight type in a given language. |
| 4 | ORIG_LANG_IND |  |  | Y | VARCHAR (1 ) | This field indicates if the description is in the original language entered for the freight type description. It is set to 'Y' when the first record is written to the table for the freight type. |
| 5 | REVIEWED_IND |  |  | Y | VARCHAR (1 ) | Indicates if the description needs to be reviewed for translation. It is set to â€˜Nâ€™ when the description in the original language is inserted or updated. We assume that clients will regularly run reports on all strings that are not reviewed (i.e. reviewed_ind = â€˜Nâ€™). When translation either provides a new string, or OKs that the existing string is correct, the reviewed_ind should be set to â€˜Yâ€™. |
| 6 | CREATE_ID |  |  | Y | VARCHAR (30 ) | This field contains the user that created the record. |
| 7 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 8 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30 ) | This field contains the user that last updated the record. |
| 9 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_FREIGHT_TYPE_TL|PK||||FREIGHT_TYPE|ASC|
||||||LANG|ASC|

### Constraints

|Type|Column / Constraint<br>Name|Details|
|---|---|---|
|Table Level|CHK_FT_TL_ORIG_LANG_IND|ORIG_LANG_IND IN ('Y','N')<br>|
||CHK_FT_TL_REVIEWED_IND|REVIEWED_IND IN ('Y','N')<br>|

---

## Table: LC_ACTIVITY

**Description:** This table will hold the LC activity information. This includes any amendments sent to the bank, drawdowns, bank fees and charges, or when a LC is issued by the issuing bank for the first time.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LC_REF_ID |  | F | Y | NUMERIC (8) | The internal RMS Letter of Credit number. |
| 2 | ORDER_NO |  |  |  | NUMERIC (12) | This field identifies the order that is attached to this Letter of Credit. |
| 3 | INVOICE_NO |  |  |  | VARCHAR (15) | This field identifies the Issuing Banks invoice number to which the drawdown refers. |
| 4 | TRANS_NO |  |  |  | VARCHAR (10) | This field identifies the amendment number or actual transaction number assigned by the bank. |
| 5 | TRANS_CODE |  |  |  | VARCHAR (6) | This field identifies the type of transaction that occurred. |
| 6 | AMOUNT |  |  |  | NUMERIC (20,4) | This field will be used to hold the amount of the activity. This amount will be stored in the currency that the Letter of Credit is in. |
| 7 | ACTIVITY_DATE |  |  |  | Date | This field will hold the date that the activity took place. |
| 8 | CURRENCY_CODE |  | F |  | VARCHAR (3) | This field contains the activity currency code |
| 9 | EXCHANGE_RATE |  |  |  | NUMERIC (20,10) | This field contains the rate of exchange for the activity currency. |
| 10 | COMMENTS |  |  |  | VARCHAR (2000) | This field will hold any comments for the activity. |

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_LC_ACTIVITY_AMOUNT|(AMOUNT is NOT NULL and currency_code is NOT NULL and exchange_rate is NOT NULL) or (AMOUNT is NULL and currency_code is NULL<br>and exchange_rate is NULL)<br>|
||CHK_LC_ACTIVITY_CURRENCY_CODE|(currency_code is NOT NULL and AMOUNT is NOT NULL and exchange_rate is NOT NULL) or (currency_code is NULL and AMOUNT is NULL<br>and exchange_rate is NULL)<br>|
||CHK_LC_ACTIVITY_EXCHANGE_RATE|(exchange_rate is NOT NULL and AMOUNT is NOT NULL and currency_code is NOT NULL) or (exchange_rate is NULL and AMOUNT is NULL<br>and currency_code is NULL)<br>|
||CHK_LC_ACTIVITY_TRANS_CODE|trans_code in ('A','B','D','L','O','P')|
|Column Level|TRANS_CODE||

---

## Table: LC_AMENDMENTS

**Description:** This table will hold amendments made to the Letter of Credit that will be downloaded to the issuing bank.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LC_REF_ID |  | F | Y | NUMERIC (8) | The internal RMS Letter of Credit number. There is an index on this field. |
| 2 | ORDER_NO |  |  |  | NUMERIC (12) | This field identifies the order that is attached to this Letter of Credit that is being amended. |
| 3 | ITEM |  | F |  | VARCHAR (25) | This field contains the item being amended. |
| 4 | AMENDED_FIELD |  |  |  | VARCHAR (6) | This field will determine what field is being amended. |
| 5 | ORIGINAL_VALUE |  |  |  | VARCHAR (45) | This field will hold the current value of the field that is being amended. |
| 6 | NEW_VALUE |  |  |  | VARCHAR (2000) | This field will hold the new value of the field that is being amended. |
| 7 | EFFECT |  |  |  | NUMERIC (20,4) | This field will hold the effect that the amendment will have on the Letter of Credit if the amendment is done to the quantity or cost of a PO or the amount of the LC itself. |
| 8 | STATUS |  |  | Y | VARCHAR (1) | This field will hold the status of the amendment. Valid values are New, Accept, Hold, and Download. |
| 9 | ACCEPT_DATE |  |  |  | Date | This field will hold the date the record was accepted as an amendment. |
| 10 | CONFIRM_DATE |  |  |  | Date | This field hold the date that the amendment was confirmed by the bank. |
| 11 | AMEND_NO |  |  |  | NUMERIC (8) | This field will hold the amendment number for the amendment once it is generated. |
| 12 | COMMENTS |  |  |  | VARCHAR (2000) | This field will hold any comments for the amendment. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|LC_AMENDMENTS_I2|||||ITEM|ASC|
|LC_AMENDMENTS_I1|||||LC_REF_ID|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_LC_AMENDMENT_AMENDED_FIELD|amended_field in ('LSD','ESD','TSF','TFF',<br>'PSF','C','OQ','NA','ED','PE','PRT','ND',<br>'OC','RO','AO','AI','RI','ARQD','RRQD','TRT','NC')<br>|
||CHK_LC_AMENDMENT_STATUS|status in ('N','A','H','D')<br>|
|Column Level|AMENDED_FIELD||
||STATUS||

---

## Table: LC_DETAIL

**Description:** This table will hold Letter of Credit detail information. This includes the PO number, SKU, quantities, packing information, cost, and ship dates.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LC_REF_ID | P | F | Y | NUMERIC (8) | The internal RMS Letter of Credit number. |
| 2 | SEQ_NO | P |  | Y | NUMERIC (4) | This field will be used as a primary key for the lc_detail records since there can be multiple instances of the same lc_no/order_no and item_no is not a required field. |
| 3 | ORDER_NO |  |  | Y | NUMERIC (12) | This field identifies the order that is attached to this Letter of Credit. |
| 4 | ITEM |  | F |  | VARCHAR (25) | This field contains the item on the letter of credit. |
| 5 | COST |  |  | Y | NUMERIC (20,4) | This is either the unit cost of the Item on the order (if LC form type is Long) or the total cost of the order (if LC form type is Short) on the Letter of Credit. |
| 6 | QTY |  |  |  | NUMERIC (12,4) | Total quantity of the Item for the order on the Letter of Credit. |
| 7 | EARLIEST_SHIP_DATE |  |  |  | Date | The earliest date an order on the Letter of Credit can be shipped. |
| 8 | LATEST_SHIP_DATE |  |  |  | Date | The latest date an order on the Letter of Credit can be shipped. |
| 9 | MERCH_DESC |  |  |  | VARCHAR (2000) | This field contains the merchandise description of the order. |
| 10 | COMMENTS |  |  |  | VARCHAR (2000) | This field holds any user-defined comments associated with the Letter of Credit detail. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_LC_DETAIL|PK||||LC_REF_ID|ASC|
||||||SEQ_NO|ASC|
|LC_DETAIL_I1|||||ITEM|ASC|

---

## Table: LC_DOWNLOAD

**Description:** This table contains the letter of credits that have been flagged to be downloaded in the next LC download run. The table will be truncated after the LC download run.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LC_REF_ID | P | F | Y | NUMERIC (8) | Contains the internal RMS number of the letter of credit that needs to be downloaded |
| 2 | LC_DOWNLOAD_TYPE | P |  | Y | VARCHAR (1) | Contains the type of LC information that will be downloaded Valid values include: A - Download the LC application. M - Download the LC amendments. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_LC_DOWNLOAD|PK||||LC_DOWNLOAD_TYPE|ASC|
||||||LC_REF_ID|ASC|
|LC_DOWNLOAD_I1|||||LC_REF_ID|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_LC_DOWNLOAD_LC_DWNLD_TYPE|LC_DOWNLOAD_TYPE in ('A', 'M')<br>|
|Column Level|LC_DOWNLOAD_TYPE||

---

## Table: LC_HEAD

**Description:** This table contains one row for each Letter of Credit that has been placed by the company.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LC_REF_ID | P |  | Y | NUMERIC (8) | The internal RMS Letter of Credit number. |
| 2 | BANK_LC_ID |  |  |  | VARCHAR (16) | The letter of credit number given by the issuing bank and should be used for any reference made to the Letter of Credit. |
| 3 | STATUS |  |  | Y | VARCHAR (6) | This will determine what status the Letter of Credit is in. Valid values are Worksheet, Submitted, Approved, Extracted, Confirmed and Closed. |
| 4 | FORM_TYPE |  |  | Y | VARCHAR (6) | This determines the level of detail the Letter of Credit will send to the issuing bank. L = Long form or S = Short form. |
| 5 | LC_TYPE |  |  | Y | VARCHAR (6) | This is the type of Letter of Credit that is being applied for. M = Master (One Letter of Credit to many PO); N = Normal (One Letter of Credit to one PO); or R = Revolving (Continually adding POs to an Letter of Credit. Letter of Credit never closes). |
| 6 | CURRENCY_CODE |  | F | Y | VARCHAR (3) | This is the ID for the country of origin of the orders on the Letter of Credit. |
| 7 | EXCHANGE_RATE |  |  | Y | NUMERIC (20,10) | This is the exchange rate used to convert the Letter of Credit amount from the Letter of Credit currency to the systems primary currency. |
| 8 | ORIGIN_COUNTRY_ID |  | F |  | VARCHAR (3) | This is the ID for the country of origin of the orders on the Letter of Credit. |
| 9 | APPLICANT |  |  | Y | VARCHAR (10) | This is the ID of the party applying for the Letter of Credit. |
| 10 | BENEFICIARY |  |  | Y | NUMERIC (10) | This is the ID for the party that the Letter of Credit is issued to. |
| 11 | APPLICATION_DATE |  |  | Y | Date | This is the date the Letter of Credit is considered an application for Letter of Credit and is sent to the issuing bank. |
| 12 | CONFIRMED_DATE |  |  |  | Date | This is the date that the Letter of Credit is confirmed by the issuing bank and the Bank LC ID is populated. |
| 13 | EXPIRATION_DATE |  |  | Y | Date | This is the earliest date for all POs included in the Letter of Credit. |
| 14 | EARLIEST_SHIP_DATE |  |  | Y | Date | This is the earliest date for all POs included in the Letter of Credit. |
| 15 | LATEST_SHIP_DATE |  |  | Y | Date | This is the latest ship date for all POs included in the Letter of Credit. |
| 16 | CREDIT_AVAIL_WITH |  |  |  | VARCHAR (10) | Code for bank with which credit is available. |
| 17 | ISSUING_BANK |  |  | Y | VARCHAR (10) | This is the ID for the bank issuing the Letter of Credit. |
| 18 | ADVISING_BANK |  |  |  | VARCHAR (10) | This is the ID for the bank advising the Letter of Credit. |
| 19 | CONFIRMING_BANK |  |  |  | VARCHAR (10) | This is the ID for the bank which guarantees the Letter of Credit funds by confirming the Letter of Credit. |
| 20 | TRANSFERRING_BANK |  |  |  | VARCHAR (10) | This is the ID for the bank transferring funds for the Letter of Credit. If funds need to be transferred between banks a transferring bank will handle this activity. |
| 21 | NEGOTIATING_BANK |  |  |  | VARCHAR (10) | This is the ID for bank responsible for negotiating a Letter of Credit between the seller and advising bank. A default will be set up in the Bank dialogue. LOV will be used to display valid banks. |
| 22 | PAYING_BANK |  |  |  | VARCHAR (10) | This is the ID for bank responsible for paying the Letter of Credit to the exporter. |
| 23 | VARIANCE_PCT |  |  | Y | NUMERIC (12,4) | Allowed currency variance percentage for the Letter of Credit. e.g. If the variance pct is 5, this means that Letter of Credit can be under or over paid by 5 percent. The standard for percent fields is (12,4). However, due to the SWIFT file download restriction of a 2 digit integer, the field will be restricted on-line to 0 - 99. Therefore, if data is inserted into this table through a conversion process, the inserted data should also be limited to 0 - 99. |
| 24 | SPECIFICATION |  |  |  | VARCHAR (6) | Defines any condition for the credit, e.g. maximum, or insurance to be paid additionally. |
| 25 | AMOUNT_TYPE |  |  | Y | VARCHAR (6) | Indicates the amount type. Must be either Exact or Approximately. If the amount type specifies Exact then the amount of the Letter of Credit must be exactly what it indicates. If the amount type is Approximately, then the amount of the Letter of Credit may be within the variance percentage of the amount. |
| 26 | AMOUNT |  |  | Y | NUMERIC (20,4) | The original total value of the purchase order(s) placed against the Letter of Credit. This value will be in the currency that is selected for the LC. |
| 27 | PRESENTATION_TERMS |  |  | Y | VARCHAR (6) | Terms of presentation. e.g. to the order of any bank, or to XYZ Bank. P= by Payment A=by acceptance N=by negotiation |
| 28 | PURCHASE_TYPE |  |  | Y | VARCHAR (6) | Purchase terms from the PO. e.g. FOB, CIF. |
| 29 | PLACE_OF_EXPIRY |  |  | Y | VARCHAR (6) | This is the ID for the place where the Letter of Credit will expire. |
| 30 | ADVICE_METHOD |  |  |  | VARCHAR (6) | Advice method used for the Letter of Credit, e.g. Full Wire, Mail, Overnight. |
| 31 | ISSUANCE |  |  |  | VARCHAR (6) | Issuance for the Letter of Credit, e.g. Cable, Telex. |
| 32 | DRAFTS_AT |  |  |  | VARCHAR (6) | This field specifies the terms of draft (or when payment is to be made) for the Letter of Credit. e.g. Sight, 30 days from receipt of B/L. |
| 33 | FOB_TITLE_PASS |  |  |  | VARCHAR (6) | Indicator used to determine where the title for goods is passed from the vendor to the purchaser. Examples include city, factory. |
| 34 | FOB_TITLE_PASS_DESC |  |  |  | VARCHAR (250) | User entered field describing the code where the title of the merchandise is to be passed. Could be a city name, factory name, or place of origin. |
| 35 | WITH_RECOURSE_IND |  |  | Y | VARCHAR (1) | Indicates conditional payment on the part of the bank as instructed by the buyer. Valid values are Y and N. |
| 36 | TRANSFERABLE_IND |  |  | Y | VARCHAR (1) | Indicates if the Letter of Credit is transferable. Valid values are Y and N. |
| 37 | TRANSSHIPMENT_IND |  |  | Y | VARCHAR (1) | Indicates if goods covered by the Letter of Credit can be transferred to another vessel midway through the voyage during shipping. Valid values are Y and N. |
| 38 | PARTIAL_SHIPMENT_IND |  |  | Y | VARCHAR (1) | Indicates if goods covered by the Letter of Credit can be partially shipped. Valid values are Y and N. |
| 39 | LC_NEG_DAYS |  |  |  | NUMERIC (3) | The number of days to negotiate documents. |
| 40 | TRANSPORT_TO |  |  |  | VARCHAR (5) | This field contains the transport to lcation for the goods being shipped for the specified letter of credit. |
| 41 | COMMENTS |  |  |  | VARCHAR (2000) | The field will hold any comments the user wants to add to the Letter of Credit. |
| 42 | APPLICABLE_RULE |  |  |  | VARCHAR (30) | This column contains the letter of credit bank applicable rules. These are predefined values as specified by the 2008 SWIFT Standards. Descriptions of these codes will be held on the CODE_DETAIL table under a code_type ofLCRL. |
| 43 | APP_OTHER_TEXT |  |  |  | VARCHAR (35) | This column contains a user specified letter of credit applicable rule other than the predefined values specified by the 2008 SWIFT Standards. |
| 44 | LADING_PORT |  |  |  | VARCHAR (5) | The port from which the items on the purchase order are shipped. This field is only available when the system is running Import functionality. |
| 45 | DISCHARGE_PORT |  |  |  | VARCHAR (5) | The port at which the items on the purchase order will enter the country of import. This field is only available when the system is running Import functionality. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_LC_HEAD|PK||||LC_REF_ID|ASC|
|LC_HEAD_I2|||||ORIGIN_COUNTRY_ID|ASC|
|LC_HEAD_I1|||||BANK_LC_ID|ASC|
|LC_HEAD_I3|||||CURRENCY_CODE|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_LC_HEAD_ADVICE_METHOD|advice_method in ('F','M','O')<br>|
||CHK_LC_HEAD_AMOUNT_TYPE|(AMOUNT_TYPE = 'A' and VARIANCE_PCT IS NOT NULL and specification is NULL) OR (AMOUNT_TYPE = 'E' and VARIANCE_PCT = 0 and<br>SPECIFICATION IS NOT NULL)<br>|
||CHK_LC_HEAD_DRAFTS_AT|drafts_at in ('01','02','03')|






|Type|Column / Constraint Name|Details|
|---|---|---|
||||
||CHK_LC_HEAD_FOB_TITLE_PASS|fob_title_pass in ('AC','CA','CC','CI','CO','CS','CY','DE',<br>'FA','FE','FF','MI','NS','OA','OR','OV','SP','TL','WH')<br>|
||CHK_LC_HEAD_FORM_TYPE|form_type in ('L','S')<br>|
||CHK_LC_HEAD_ISSUANCE|issuance in ('C','T')<br>|
||CHK_LC_HEAD_LC_TYPE|lc_type in ('M','N','R','O')<br>|
||CHK_LC_HEAD_PARTIAL_SHIPMP_IND|partial_shipment_ind in ('Y','N')<br>|
||CHK_LC_HEAD_PLACE_OF_EXPIRY|place_of_expiry in ('01','02','03','04','05')<br>|
||CHK_LC_HEAD_PRESENT_TERMS|presentation_terms in ('01','02','03','04','05','06','P','A','N')<br>|
||CHK_LC_HEAD_SPECIFICATION|specification in ('M','I','U','N')<br>|
||CHK_LC_HEAD_STATUS|status in ('W','S','A','E', 'C','L')<br>|
||CHK_LC_HEAD_TRANSFERABLE_IND|transferable_ind in ('Y','N')<br>|
||CHK_LC_HEAD_TRANSSHIPMENT_IND|transshipment_ind in ('Y','N')|
||CHK_LC_HEAD_WITH_RECOURSE_IND|with_recourse_ind in ('Y','N')<br>|
|Column Level|STATUS||
||FORM_TYPE||
||LC_TYPE||
||SPECIFICATION||






|Type|Column / Constraint Name|Details|
|---|---|---|
||PRESENTATION_TERMS||
||PLACE_OF_EXPIRY||
||ADVICE_METHOD||
||ISSUANCE||
||DRAFTS_AT||
||FOB_TITLE_PASS||
||WITH_RECOURSE_IND||
||TRANSFERABLE_IND||
||TRANSSHIPMENT_IND||
||PARTIAL_SHIPMENT_IND||

---

## Table: LC_ORDAPPLY

**Description:** This table will be used as a staging area during the process of attaching Purchase Orders to Letters of Credit. Data will be written to this table as Purchase Orders are Approved and will be removed as the Purchase Order is attached to a Letter of Credit or the Order is Unapproved.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ORDER_NO | P | F | Y | NUMERIC (12) | The Purchase Order to be attached to a Letter of Credit. |
| 2 | LC_REF_ID |  |  |  | NUMERIC (8) | The Origin Country of the Purchase Order. |
| 3 | FORM_TYPE |  |  |  | VARCHAR (6) | This determines the level of detail the Letter of Credit will send to the issuing bank. L = Long form or S = Short form. |
| 4 | LC_TYPE |  |  |  | VARCHAR (6) | This is the type of Letter of Credit that is being applied for. M = Master (One Letter of Credit to many PO); N = Normal (One Letter of Credit to one PO); or R = Revolving (Continually adding POs to an Letter of Credit. Letter of Credit never closes). |
| 5 | ERROR_CODE |  |  |  | VARCHAR (25) | This field will hold a code identifying any error found by the system while trying to attach the Purchase Order to the Letter of Credit. This field will be an error code on the rtk_errors table. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_LC_ORDAPPLY|PK||||ORDER_NO|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_LC_ORDAPPLY_FORM_TYPE|form_type in ('L','S')<br>|
||CHK_LC_ORDAPPLY_LC_TYPE|lc_type in ('M','N','R','O')<br>|
|Column Level|FORM_TYPE||
||LC_TYPE||

---

## Table: OBLIGATION

**Description:** This table holds the header level information found on an obligation (i.e. bill or invoice) sent to the client for expenses incurred while bringing goods into an origin country and to its final destination. The table below shows which values are needed for the different modules.Obligation level Obligation level Code Key Value 1 Key Value 2 Key Value 3 Key Value 4 Key Value 5 Key Value 6Customs Entry Header CUST entry_no NULL NULL NULL NULL NULLCustoms Entry Detail CEDT entry_no vessel_id voyage_flt_id estmated_depart_date order_no itemPurchase Order Header PO order_no NULL NULL NULL NULL NULLPurchase Order/Item POIT order_no item NULL NULL NULL NULLTransportation Container TRCO container_id vessel_id voyage_flt_id estmated_depart_date order_no itemTransportation Container PO/Item TRCP container_id vessel_id voyage_flt_id estmated_depart_date order_no itemTrans. BL/AWB TRBL bl_awb_id vessel_id voyage_flt_id estmated_depart_date NULL NULLTrans. BL/AWB PO/Item TRBP bl_awb_id vessel_id voyage_flt_id estmated_depart_date order_no itemTrans. Vessel/Voyage/ETD TRVV vessel_id voyage_flt_id estimated_depart_date NULL NULL NULLTrans. Vessel/Voyage/ETD PO/Item TRVP vessel_id voyage_flt_id estimated_depart_date order_no item NULL

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | OBLIGATION_KEY | P |  | Y | NUMERIC (10) | Contains the unique sequence number that is used to distinguish between the different obligations. |
| 2 | OBLIGATION_LEVEL |  |  | Y | VARCHAR (6) | Contains the level that the obligation comes in at. The possible levels are CUST (Customs Entry Header), PO (Purchase Order Header), POIT (Purchase Order/Item), TRCO (Transportation Container), TRCP (Transportation Container PO/Item), TRBL (Transportation Bill of Lading/Airway Bill), TRBP (Transportation BL/AWB PO/Item), TRVV (Transportation Vessel/Voyage/ETD), and TRVP (Transportation Vessel/Voyage/ETD PO/Item). |
| 3 | KEY_VALUE_1 |  |  | Y | VARCHAR (40) | This field will hold the specific id or type that the obligation is based on. If the obligation level is Customs Entry Header, this field will contain the Customs Entry number. If the obligation level is Purchase Order Header or Purchase Order/Item, this field will contain an Order number. If the obligation level is Transportation Container or Transportation Container/PO/Item, this field will hold a container id. If the obligation level is Tansportation Bill of Lading/Airway Bill or Tansportation Bill of Lading/Airway Bill/PO/Item this field will hold a BL/AWB id. If the obligation level is Transportation Vessel/Voyage/ETD or Transportation Vessel/Voyage/ETD/PO/Item this field will hold the vessel id number. |
| 4 | KEY_VALUE_2 |  |  |  | VARCHAR (30) | This field will hold the specific id or type that the obligation is based on. If the obligation level is Customs Entry Header or Purchase Order Header this field will be null. If the obligation level is Transportation Container, Transportation Container/PO/Item, Tansportation Bill of Lading/Airway Bill or Tansportation Bill of Lading/Airway Bill/PO/Item this field will hold a Vessel id. If the obligation level is Transportation Vessel/Voyage/ETD or Transportation Vessel/Voyage/ETD/PO/Item this field will hold the voyage/flight id. If the obligation level is Purchase Order/Item, this field will contain an item number. If the obligation level is Customs Entry Header or Purchase Order Header this field will be null. |
| 5 | KEY_VALUE_3 |  |  |  | VARCHAR (30) | This field will hold the specific id or type that the obligation is based on. If the obligation level is Transportation Vessel/Voyage/ETD or Trans. Vessel/Voyage/ETD/PO/Item, this field will contain an estimated departure date. If the obligation level is Transportation Container, Transportation Container/PO/Item, Tansportation Bill of Lading/Airway Bill or Tansportation Bill of Lading/Airway Bill/PO/Item this field will contain a Voyage/Flight ID. If the obligation level is Customs Entry Header, Purchase Order Header, or Purchase Order/Item this field will be null. |
| 6 | KEY_VALUE_4 |  |  |  | VARCHAR (30) | This field will hold the specific id or type that the obligation is based on. If the obligation level is Transportation Vessel/Voyage/ETD PO/Item, this field will contain an order number. If the obligation level is |
| 7 | KEY_VALUE_5 |  |  |  | VARCHAR (30) | This field will hold the specific id or type that the obligation is based on. If the obligation level is Transportation Vessel/Voyage/ETD PO/Item, this field will contain an item number. If the obligation level is Transportation Vessel/Voyage/ETD, Transportation Container, Tansportation Bill of Lading/Airway Bill, Customs Entry Header, Purchase Order Header, or Purchase Order/Item this field will be null. If the obligation level is Transportation Container/PO/Item or Tansportation Bill of Lading/Airway Bill/PO/Item this field will contain a Purchase Order number. |
| 8 | KEY_VALUE_6 |  |  |  | VARCHAR (30) | This field will hold the specific id or type that the obligation is based on. If the obligation level is Transportation Container/PO/Item or Tansportation Bill of Lading/Airway Bill/PO/Item this field will contain an Item number. If the obligation level is any other level, this field will be null. |
| 9 | PARTNER_TYPE |  | F |  | VARCHAR (6) | Contains the type of partner that sent the obligation. |
| 10 | PARTNER_ID |  | F |  | VARCHAR (10) | Contains the identification number of the partner that sent the obligation. |
| 11 | SUPPLIER |  |  |  | NUMERIC (10) | Contains the identification number of the supplier that sent the obligation. |
| 12 | EXT_INVC_NO |  |  | Y | VARCHAR (30) | Contains the identification code of the obligation. |
| 13 | EXT_INVC_DATE |  |  | Y | Date | Contains the date on the obligation. |
| 14 | PAID_DATE |  |  |  | Date | Contains the date that the obligation was paid. |
| 15 | PAID_AMT |  |  |  | NUMERIC (20,4) | Contains amount of the obligation that was paid. This is stored in the currency of the obligation. |
| 16 | PAYMENT_METHOD |  |  |  | VARCHAR (6) | Contains the method used to pay the obligation. |
| 17 | CHECK_AUTH_NO |  |  |  | VARCHAR (20) | Contains the number on the check that is used to pay the obligation. |
| 18 | CURRENCY_CODE |  | F | Y | VARCHAR (3) | Contains the currency that the obligation amount is in. |
| 19 | EXCHANGE_RATE |  |  | Y | NUMERIC (20,10) | Contains rate of exchange used on the obligation. |
| 20 | STATUS |  |  | Y | VARCHAR (6) | Contains the status of the obligation. Possible choices are P (Pending), or A (Approved). This status is used to determine when the obligation information can be used by accounts payable. |
| 21 | COMMENT_DESC |  |  |  | VARCHAR (2000) | Contains user comments. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_OBLIGATION|PK||||OBLIGATION_KEY|ASC|
|OBLIGATION_I1|||||CURRENCY_CODE|ASC|
|OBLIGATION_I2|||||PARTNER_TYPE|ASC|
||||||PARTNER_ID|ASC|

### Constraints

|Type|Column / Constraint<br>Name|Details|
|---|---|---|
|Table Level|CHK_OBLIGATION_OB_LEVEL|obligation_level in<br>('ASN','ASNP','ASNC','CUST','CEPO','CEDT','PO','POIT','TRCO','TRBL',<br>'TRVV','TRCP','TRBP','TRVP','TRVVEP','TRCPO','TRBLP','POT')<br>|
||CHK_OBLIGATION_PARTNER|partner_type is NOT NULL and partner_id is NOT NULL and supplier is NULL or partner_type is NULL and partner_id is NULL and supplier is NOT<br>NULL or partner_id is NOT NULL and partner_type is NOT NULL and supplier is NULL or partner_id is NULL and partner_type is NULL and supplier|






|Type|Column / Constraint<br>Name|Details|
|---|---|---|
|||is NOT NULL or supplier is NOT NULL and partner_type is NULL and partner_id is NULL or supplier is NULL and partner_type is NOT NULL and<br>partner_id is NOT NULL<br>|
||CHK_OBLIGATION_STATUS|status in ('P','A')<br>|
|Column Level|OBLIGATION_LEVEL||
||STATUS||

---

## Table: OBLIGATION_COMP

**Description:** This table holds the detail level information found on an obligation (i.e. bill or invoice) sent to the client for expenses or assessments incurred while bringing goods from point A to point B.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | OBLIGATION_KEY | P | F | Y | NUMERIC (10) | Contains the unique sequence number that is used to distinguish between the different obligations. |
| 2 | COMP_ID | P | F | Y | VARCHAR (10) | Contains a user specified code representing a specific expense or assessment found on the ELC_COMP table. |
| 3 | AMT |  |  | Y | NUMERIC (20,4) | Contains the amount charged for the particular component stored in the Obligation currency. |
| 4 | QTY |  |  | Y | NUMERIC (12,4) | Contains the quantity that the obligation is charged against. |
| 5 | ALLOC_BASIS_UOM |  | F |  | VARCHAR (4) | Contains basis for allocating the obligation amount across all of the appropriate items. If there is a value in this field, then allocation is occurring across a unit of measure. If this field is null, then allocation is across a monetary amount. |
| 6 | RATE |  |  |  | NUMERIC (20,4) | Contains the rate used to calculate the expense charged. Stored in the Obligation currency. |
| 7 | PER_COUNT |  |  |  | NUMERIC (12,4) | Contains a count indicating the amount of the Per Count Unit of Measure to which the rate applies. |
| 8 | PER_COUNT_UOM |  | F |  | VARCHAR (4) | Contains the unit of measure in which the Per Count is specified. |
| 9 | IN_ALC_IND |  |  | Y | VARCHAR (1) | This field will contain Y (Yes) or N (No). If the field is set to yes then the obligation components will be carried through into ALC calculations. Otherwise the obligation component will only be viewed on the obligation and will not factor into the ALC value. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_OBLIGATION_COMP|PK||||OBLIGATION_KEY|ASC|
||||||COMP_ID|ASC|
|OBLIGATION_COMP_I1|||||COMP_ID|ASC|
|OBLIGATION_COMP_I2|||||ALLOC_BASIS_UOM|ASC|
|OBLIGATION_COMP_I3|||||PER_COUNT_UOM|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_OB_COMP_IND_ALC_IND<br>|in_alc_ind in ('Y','N')<br>|
|Column Level|IN_ALC_IND<br>||

---

## Table: OBLIGATION_COMP_LOC

**Description:** This table holds the location level information found on an obligation (i.e. bill or invoice) sent to the client for expenses or assessments incurred while bringing goods into an origin country and to its final destination.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | OBLIGATION_KEY | P | F | Y | NUMERIC (10) | Contains the unique sequence number that is used to distinguish between the different obligations. |
| 2 | COMP_ID | P | F | Y | VARCHAR (10) | Contains a user specified code representing a specific expense or assessment found on the ELC_COMP table. |
| 3 | LOCATION | P |  | Y | NUMERIC (10) | Contains the location where the item is sent. |
| 4 | LOC_TYPE | P |  | Y | VARCHAR (1) | Contains the type of location where the item is sent. Possible choices are W Warehouse, and S Store. |
| 5 | AMT |  |  | Y | NUMERIC (20,4) | Contains the amount charged for the particular component stored in the Obligation currency. |
| 6 | QTY |  |  | Y | NUMERIC (12,4) | Contains the quantity of an item that the obligation is charged against. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_OBLIGATION_COMP_LOC|PK||||OBLIGATION_KEY|ASC|
||||||COMP_ID|ASC|
||||||LOCATION|ASC|
||||||LOC_TYPE|ASC|

---

## Table: QUOTA_CATEGORY

**Description:** This table holds all quota categories to be used in the HTS Chapter dialog.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | QUOTA_CAT | P |  | Y | VARCHAR (6) | Contains the unique code identification. |
| 2 | IMPORT_COUNTRY_ID | P | F | Y | VARCHAR (3) | Contains the country identifier for the country that is receiving the product. |
| 3 | CATEGORY_DESC |  |  | Y | VARCHAR (120) | Contains the description of the quota category. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_QUOTA_CATEGORY|PK||||QUOTA_CAT|ASC|
||||||IMPORT_COUNTRY_ID|ASC|
|QUOTA_CATEGORY_I1|||||IMPORT_COUNTRY_ID|ASC|

---

## Table: QUOTA_CATEGORY_TL

**Description:** This is the translation table for QUOTA_CATEGORY table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | QUOTA_CAT | P | F | Y | VARCHAR (6) | Contains the unique code identification. |
| 3 | IMPORT_COUNTRY_ID | P | F | Y | VARCHAR (3) | Contains the country identifier for the country that is receiving the product. |
| 4 | CATEGORY_DESC |  |  | Y | VARCHAR (120) | Contains the description of the quota category. |
| 5 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 6 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 7 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 8 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_QUOTA_CATEGORY_TL|PK||||LANG|ASC|
||||||QUOTA_CAT|ASC|
||||||IMPORT_COUNTRY_ID|ASC|

---

## Table: REQ_DOC

**Description:** This table is used to store required documents and the module and key values they should be attached to.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DOC_KEY | P |  | Y | NUMERIC (6) | This field holds a unique sequence number to distinguish between the records. |
| 2 | MODULE |  |  | Y | VARCHAR (6) | This field holds the code for the module that the documents are attached to, e.g., supplier SUPP, bank BANK, partner PTNR, customs entry CE, contracting CNTR, contracting at the item level CTIT, purchase orders PO, purchase orders at the item level POIT, country CTRY, payments (LOC) PYMT, HTS at the Chapter level HTSC, item maintenance IT, HTSC HTS Chapter, LC and LCA. |
| 3 | KEY_VALUE_1 |  |  | Y | VARCHAR (25) | This value will hold the specific id that the documents are attached to e.g., for Supplier, the key_value_1 would be the supplier identification number. However if the module is BANK or PNTR, this field will hod the Partner Type (e.g., Bank, Importer, Freight Forwarder, etc). |
| 4 | KEY_VALUE_2 |  |  |  | VARCHAR (25) | This field is only used for modules that attach documents at two different levels. The current modules that will do this are Contracting and Purchase Orders. These modules will have documents at both the header level, and the item level. When attaching documents at the item level,key_value_1 would contain the contract or order number, and key_value_2 would hod the SKU number. |
| 5 | DOC_ID |  |  | Y | NUMERIC (6) | This field is the unique number used to distinguish the different documents. |
| 6 | DOC_TEXT |  |  |  | VARCHAR (2000) | This field holds the actual text of the document IF the module is CNTR, CTIT, PO, POIT, or PYMT. Otherwise this field will be NULL. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_REQ_DOC|PK||||DOC_KEY|ASC|
|REQ_DOC_I2|||||KEY_VALUE_1|ASC|
|REQ_DOC_I3|||||KEY_VALUE_2|ASC|
|REQ_DOC_I4|||||DOC_ID|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|REQ_DOC_I1|||||MODULE|ASC|

---

## Table: REQ_DOC_TEMP

**Description:** This table is used to store required documents and the module and key values they should be attached to.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DOC_KEY | P |  | Y | NUMERIC (6) | This field holds a unique sequence number to distinguish between the records. |
| 2 | MODULE |  |  | Y | VARCHAR (6) | This field holds the code for the module that the documents are attached to, e.g., supplier SUPP, bank BANK, partner PTNR, customs entry CE, contracting CNTR, contracting at the item level CTIT, purchase orders PO, purchase orders at the item level POIT, country CTRY, payments (LOC) PYMT, HTS at the Chapter level HTSC, item maintenance IT, HTSC HTS Chapter, LC and LCA. |
| 3 | KEY_VALUE_1 |  |  | Y | VARCHAR (25) | This value will hold the specific id that the documents are attached to e.g., for Supplier, the key_value_1 would be the supplier identification number. However if the module is BANK or PNTR, this field will hod the Partner Type (e.g., Bank, Importer, Freight Forwarder, etc) |
| 4 | KEY_VALUE_2 |  |  |  | VARCHAR (25) | This field is only used for modules that attach documents at two different levels. The current modules that will do this are Contracting and Purchase Orders. These modules will have documents at both the header level, and the item level. When attaching documents at the item level,key_value_1 would contain the contract or order number, and key_value_2 would hod the SKU number. |
| 5 | DOC_ID |  |  | Y | NUMERIC (6) | This field is the unique number used to distinguish the different documents. |
| 6 | DOC_TEXT |  |  |  | VARCHAR (2000) | This field holds the actual text of the document IF the module is CNTR, CTIT, PO, POIT, or PYMT. Otherwise this field will be NULL. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_REQ_DOC_TEMP|PK||||DOC_KEY|ASC|
|REQ_DOC_TEMP_I4|||||DOC_ID|ASC|
|REQ_DOC_TEMP_I1|||||MODULE|ASC|
|REQ_DOC_TEMP_I3|||||KEY_VALUE_2|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|REQ_DOC_TEMP_I2|||||KEY_VALUE_1|ASC|

---

## Table: RTM_UNIT_OPTIONS

**Description:** This table will contain the attributes used for import and export activities.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | FOB_TITLE_PASS |  |  |  | VARCHAR (2) | Indicator used to determine where the title for goods is passed from the vendor to the purchaser. Examples include city, factory, or origin. This can be changed at the PO level. |
| 2 | FOB_TITLE_PASS_DESC |  |  |  | VARCHAR (250) | Contains the default description that should be used when title pass location is defaulted onto a PO. This can be changed at the PO level. |
| 3 | HTS_TRACKING_LEVEL |  |  | Y | VARCHAR (1) | Indicates the level at which HTS is tracked in RMS. Valid values are M or S. If the value is M, HTS is tracked at item/supplier/country of manufacture level. If the value is S, HTS is tracked at item/supplier/country of sourcing level. |
| 4 | IMPORT_HTS_DATE |  |  |  | VARCHAR (1) | It is the date that is used to calculate the effective date range for applicability of HTS on a PO. Valid values are W (written date of the PO ), and N (not after date of the PO). |
| 5 | LC_EXP_DAYS |  |  |  | NUMERIC (3) | Indicates the default number of days after the latest ship date that the Letter of Credit will expire. |
| 6 | LC_FORM_TYPE |  |  | Y | VARCHAR (6) | Contains the default Letter of Credit Form Type which determines the level of detail the Letter of Credit will send to the issuing bank. Valid values include L = Long form or S = Short form. A long form LC contains |
| 7 | LC_TYPE |  |  | Y | VARCHAR (6) | Indicates the default Letter of Credit type that will be used during creation of LCs. Valid values are M(Master), N(Normal), R(Revolving) and O(Open). |
| 8 | ORDER_HTS_IND |  |  | Y | VARCHAR (1) | Indicates whether HTS should be required for import orders. Valid values are Y and N. If set to Y, then all the items on order should have HTS code associated prior to PO approval. For packs, all the component items should have HTS code associated. |
| 9 | RTM_SIMPLIFIED_IND |  |  | Y | VARCHAR (1) | Indicates if full RTM functionality is available or limited functionality. Limited or simplified RTM functionality means the user will not have access to transportation, customs entry, ALC, Freight maintenance, SCAC codes. The user will have access to HTS and Assessments. Letter of credit information will be accessible but no longer required. |
| 10 | RTM_TRNSPRT_OBL_ALLOC_METHOD |  |  | Y | VARCHAR (10) | RTM Transportation Obligation Allocation Method describes how the merchandise is transported from the manufacturers through the customs clearance in the importing country. The transport type used for an allocation from obligations. Valid values are (ASN,TRNSPRT). If the value is TRNSPRT, the transportation quantity will drive the allocation process. This is appropriate if the transportation quantities will be maintained at the item level to accurately reflect the quantities passing through customs. If the value is ASN, the receipt quantity will drive the allocation process. This is appropriate if the accurate transportation quantities will not be attained in the system. In this case, it will not be possible to accurately allocate obligations at the Container or BOL/AWB(air way bill) level since these identifiers are not present on the ASN. |
| 11 | UPDATE_ITEM_HTS_IND |  |  | Y | VARCHAR (1) | Indicates whether, during HTS upload, if items should be automatically updated using new HTS information. This column is used only if the IMPORT_IND is Y. If the UPDATE_ITEM_HTS_IND is Y the items will be updated during HTS upload. If it is set to N, the items will not be updated during HTS upload. |
| 12 | UPDATE_ORDER_HTS_IND |  |  | Y | VARCHAR (1) | Indicates if, during HTS upload, order/items should be automatically updated using new HTS information. This field is used only if the IMPORT_IND on SYSTEM_OPTIONS table is Y. If the UPDATE_ORDER_HTS_IND is Y then order/items will be updated during HTS upload. If it is set to N, then order/items will not be updated during |
| 13 | CREATE_ID |  |  | Y | VARCHAR (30) | Stores the Oracle username of the one who inserted the first record. This field is required by the database. |
| 14 | CREATE_DATETIME |  |  | Y | Date | The date and time of when the record was created in the table. This value should only be populated on insert - it should never be updated. |
| 15 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | The Oracle username of the one who most recently updated this record. |
| 16 | LAST_UPDATE_DATETIME |  |  | Y | Date | The date time stamp of the most recent update by the user. |
| 17 | HTS_UPLD_ORDER_STATUS |  |  | Y | VARCHAR (1) | Indicates the order status. Valid values are W(Worksheet) and A(Approved). |

---

## Table: SCAC

**Description:** This table is used to store SCAC Codes that will be attached to Transportation records.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SCAC_CODE | P |  | Y | VARCHAR (6) | Contains the unique key that identifies the scac record. |
| 2 | SCAC_CODE_DESC |  |  | Y | VARCHAR (120) | Contains the description of the SCAC Code. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SCAC|PK||||SCAC_CODE|ASC|

---

## Table: SCAC_TL

**Description:** This is the translation table for SCAC table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | SCAC_CODE | P | F | Y | VARCHAR (6) | Contains the unique key that identifies the scac record. |
| 3 | SCAC_CODE_DESC |  |  | Y | VARCHAR (120) | Contains the description of the SCAC Code. |
| 4 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 6 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 7 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SCAC_TL|PK||||LANG|ASC|
||||||SCAC_CODE|ASC|

---

## Table: TARIFF_TREATMENT

**Description:** This table is used to store the tariff treatments, their descriptions and whether or not the tariff is conditional.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TARIFF_TREATMENT | P |  | Y | VARCHAR (10) | Contains the customs approved code to uniquely identify a special tariff program. |
| 2 | TARIFF_TREATMENT_DESC |  |  | Y | VARCHAR (120) | Contains the description for the tariff treatment ID. Example: NAFTA is North American Free Trade Agreement. |
| 3 | CONDITIONAL_IND |  |  | Y | VARCHAR (1) | Indicates whether items to be imported must be manually declared eligible for the tariff treatment. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_TARIFF_TREATMENT|PK||||TARIFF_TREATMENT|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_TARIFF_TRTMT_CONDITION_IND|conditional_ind in ('Y','N')<br>|
||CHK_TARIFF_TRTMT_TARIFF_TRMT|tariff_treatment = upper(tariff_treatment)<br>|
|Column Level|TARIFF_TREATMENT||
||CONDITIONAL_IND||

---

## Table: TARIFF_TREATMENT_TL

**Description:** This is the translation table for TARIFF_TREATMENT table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | TARIFF_TREATMENT | P | F | Y | VARCHAR (10) | Contains the customs approved code to uniquely identify a special tariff program. |
| 3 | TARIFF_TREATMENT_DESC |  |  | Y | VARCHAR (120) | Contains the description for the tariff treatment ID. Example: NAFTA is North American Free Trade Agreement. |
| 4 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 6 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 7 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_TARIFF_TREATMENT_TL|PK||||LANG|ASC|
||||||TARIFF_TREATMENT|ASC|

---

## Table: TRANSIT_TIMES

**Description:** This table holds transit time in number of days between an origin and destination location. An origin can be a supplier, warehouse or store. A destination is either a store or warehouse. This information is primarily used by Allocation.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TRANSIT_TIMES_ID | P |  | Y | NUMERIC (10) | This field holds the unique id for the origin and destination location transit time combination. It is automatically generated by the system. |
| 2 | DEPT |  | F | Y | NUMERIC (4) | The field holds the unique identifier for the department for which the transit time is defined. |
| 3 | CLASS |  | F | Y | NUMERIC (4) | The field holds the unique identifier for the class for which the transit time is defined. |
| 4 | SUBCLASS |  | F | Y | NUMERIC (4) | The field holds the unique identifier for the subclass for which the transit time is defined. |
| 5 | ORIGIN |  |  | Y | NUMERIC (10) | This field holds the unique identifier for the origin location for which transit time is defined. It can be a supplier, store or physical wh ID based on origin type field. |
| 6 | DESTINATION |  |  | Y | NUMERIC (10) | This field holds the unique identifier for the destination location for which transit time is defined. It can be a store or physical wh ID based on destination type field. |
| 7 | ORIGIN_TYPE |  |  | Y | VARCHAR (2) | This field holds the type of destination location for which transit time is defined. Valid values are ST - Store, WH - Warehouse, SU - Supplier, LLS - Location List - Store, LLW - Location List - Warehouse and are held in code type TTOT on CODE_DETAIL. |
| 8 | DESTINATION_TYPE |  |  | Y | VARCHAR (2) | This field holds the type of destination location for which transit time is defined. Valid values are ST - Store or WH - Warehouse and are held in code type TTDT on CODE_DETAIL. |
| 9 | TRANSIT_TIME |  |  | Y | NUMERIC (4) | This field holds the transit time in days. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_TRANSIT_TIMES|PK||||TRANSIT_TIMES_ID|ASC|
|TRANSIT_TIMES_I1|UN||||DEPT|ASC|
||||||CLASS|ASC|
||||||SUBCLASS|ASC|
||||||ORIGIN|ASC|
||||||DESTINATION|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_TTI_DESTINATION_TYPE<br>|DESTINATION_TYPE in ('ST','WH')<br>|
||CHK_TTI_ORIGIN_TYPE<br><br>|ORIGIN_TYPE in ('SU','ST','WH')<br>|
