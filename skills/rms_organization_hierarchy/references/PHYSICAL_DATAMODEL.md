# RMS Organization & Location Hierarchy Datamodel - Physical Data Model Reference

## Table: ADDR

**Description:** The ADDR table stores the address of the store, ware house, supplier, and partner. Seq_no is required as multiple addresses can exist for each address type.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ADDR_KEY | P |  | Y | NUMERIC (11) | This column contains a unique number used to distinguish between different addresses. |
| 2 | MODULE |  | F | Y | VARCHAR (4) | This column holds the code for the module that the address is attached to. Valid values are supplier (SUPP) and partner (PTNR). |
| 3 | KEY_VALUE_1 |  |  | Y | VARCHAR (20) | This column contains specific ID or type that the address is attached to. If the module is Partner, then key_value_1 holds the type of Partner [BANK (BK), Freight Forwarder (FF), Factory (FA), Agent (AG), Broker (BR), and Importer (IM)], else it will hold the supplier number. |
| 4 | KEY_VALUE_2 |  |  |  | VARCHAR (20) | If the module is Partner (PTNR), then this field will contain the partners ID, else this field will be null. |
| 5 | SEQ_NO |  |  | Y | NUMERIC (4) | This column indicates the sequence that addresses within the same type were entered. |
| 6 | ADDR_TYPE |  | F | Y | VARCHAR (2) | This column indicates the type for the address. Valid values are: 01 - Business, 02 - Postal, 03 - Returns, 04 - Order, 05 - Invoice, 06 - Remittance |
| 7 | PRIMARY_ADDR_IND |  |  | Y | VARCHAR (1) | This column indicates whether the address is the primary address for the address type. |
| 8 | ADD_1 |  |  | Y | VARCHAR (240) | This column contains the first line of the address. |
| 9 | ADD_2 |  |  |  | VARCHAR (240) | This column contains the second line of the address. |
| 10 | ADD_3 |  |  |  | VARCHAR (240) | This column contains the third line of the address. |
| 11 | CITY |  |  | Y | VARCHAR (120) | This column contains the name of the city that is associated with the address. |
| 12 | STATE |  |  |  | VARCHAR (3) | This column contains the state abbreviation for the address. |
| 13 | COUNTRY_ID |  | F | Y | VARCHAR (3) | This column contains the country where the address exists. |
| 14 | POST |  |  |  | VARCHAR (30) | This column contains the zip code for the address. |
| 15 | CONTACT_NAME |  |  |  | VARCHAR (120) | This column contains the name of the contact for the supplier at this address. |
| 16 | CONTACT_PHONE |  |  |  | VARCHAR (20) | This column contains the phone number of the contact person at this address. |
| 17 | CONTACT_TELEX |  |  |  | VARCHAR (20) | This column contains the telex number of the partner or suppliers representative contact. |
| 18 | CONTACT_FAX |  |  |  | VARCHAR (20) | This column contains the fax number of the contact person at this address. |
| 19 | CONTACT_EMAIL |  |  |  | VARCHAR (100) | This column contains the email address of the partner or suppliers representative contact. |
| 20 | ORACLE_VENDOR_SITE_ID |  |  |  | NUMERIC (15) | This column will only be used for the Oracle Financial Interfaces. It holds the value of the Oracle vendor site ID for a supplier address. This Oracle vendor site ID is the unique identifier of the address on the Oracle side, it must be stored on the RMS addr table to allow updates from Oracle. This site ID can be found on the Oracle po_vendor_sites table. |
| 21 | EDI_ADDR_CHG |  |  |  | VARCHAR (1) | This column indicates if the address has been changed. This flag is used by the EDI process. |
| 22 | COUNTY |  |  |  | VARCHAR (250) | This column holds the county name for the location. |
| 23 | PUBLISH_IND |  |  | Y | VARCHAR (1) | This column indicates if the detail has been published. |
| 24 | JURISDICTION_CODE |  |  |  | VARCHAR (10) | Identifies the jurisdiction code for the country-state relationship. |
| 25 | EXTERNAL_REF_ID |  |  |  | VARCHAR (32) | This field holds the unique address ID from the external source system. Although the ADDR_KEY is the unique key in RMS but it is a system generated oneup number. Hence, external systems will not be aware of this number. The purpose of external_ref_id is to store external system provided identifier of the same row. |
| 26 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |
| 27 | CREATE_DATETIME |  |  | Y | Date | This column holds the record creation date. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_ADDR|PK||||ADDR_KEY|ASC|
|ADDR_I4|||||KEY_VALUE_1|ASC|
||||||ADDR_TYPE|ASC|
|ADDR_I1|||||COUNTRY_ID|ASC|
|ADDR_I2|||||STATE|ASC|
|ADDR_I3|||||ADDR_TYPE|ASC|
||||||MODULE|ASC|
|ADDR_I5|||||MODULE|ASC|
||||||PRIMARY_ADDR_IND|ASC|
||||||ADDR_TYPE|ASC|
||||||KEY_VALUE_1|ASC|

### Constraints

|Type|Column / Constraint<br>Name|Details|
|---|---|---|
|Table Level|CHK_ADDR_MODULE|module in ('ST','WH','SUPP','PTNR','WFST') and (module = 'PTNR' and key_value_1 in ('BK','FF','FA','AG','BR','IM','AP','CO','CN','S1', 'S2', 'S3',<br>'EV','IA','EC','ES','E' ) ) or (module IN ( 'SUPP','ST','WH','WFST') and key_value_2 is NULL)<br>|
||CHK_ADDR_PUBLISH_IND|PUBLISH_IND IN ('Y','N')<br>|






|Type|Column / Constraint<br>Name|Details|
|---|---|---|
|Column Level|PUBLISH_IND||

---

## Table: ADDR_CFA_EXT

**Description:** This is the custom attribute extension table for the entity ADDR.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ADDR_KEY | P | F | Y | NUMERIC (11) | This column holds the Address Key this extended data is associated with. |
| 2 | GROUP_ID | P |  | Y | NUMERIC (10) | This column holds the attribute group id that this extended data is associated with. The logical business meaning of the VARCHAR_, NUMBER_ and DATE_ columns on this table are determined by the metadata defined for this attribute. |
| 3 | VARCHAR2_1 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_1 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 4 | VARCHAR2_2 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_2 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 5 | VARCHAR2_3 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_3 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 6 | VARCHAR2_4 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_4 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 7 | VARCHAR2_5 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_5 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 8 | VARCHAR2_6 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_6 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 9 | VARCHAR2_7 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_7 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 10 | VARCHAR2_8 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_8 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 11 | VARCHAR2_9 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_9 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 12 | VARCHAR2_10 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_10 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 13 | NUMBER_11 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_11 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 14 | NUMBER_12 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_12 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 15 | NUMBER_13 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_13 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 16 | NUMBER_14 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_14 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 17 | NUMBER_15 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_15 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 18 | NUMBER_16 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_16 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 19 | NUMBER_17 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_17 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 20 | NUMBER_18 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_18 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 21 | NUMBER_19 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_19 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 22 | NUMBER_20 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_20 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 23 | DATE_21 |  |  |  | Date | This column holds data related to the attribute defined on the CFA_ATTRIB table that references DATE_21 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 24 | DATE_22 |  |  |  | Date | This column holds data related to the attribute defined on the CFA_ATTRIB table that references DATE_22 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 25 | DATE_23 |  |  |  | Date | This column holds data related to the attribute defined on the CFA_ATTRIB table that references DATE_23 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 26 | DATE_24 |  |  |  | Date | This column holds data related to the attribute defined on the CFA_ATTRIB table that references DATE_24 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 27 | DATE_25 |  |  |  | Date | This column holds data related to the attribute defined on the CFA_ATTRIB table that references DATE_25 in CFA_ATTRIB.STORAGE_COL_NAME. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_ADDR_CFA_EXT|PK||||ADDR_KEY|ASC|
||||||GROUP_ID|ASC|

---

## Table: ADDR_TL

**Description:** This is the translation table for ADDR table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | ADDR_KEY | P | F | Y | NUMERIC (11) | This column contains a unique number used to distinguish between different addresses. |
| 3 | ADD_1 |  |  | Y | VARCHAR (240) | This column contains the first line of the address. |
| 4 | ADD_2 |  |  |  | VARCHAR (240) | This column contains the second line of the address. |
| 5 | ADD_3 |  |  |  | VARCHAR (240) | This column contains the third line of the address. |
| 6 | CITY |  |  | Y | VARCHAR (120) | This column contains the name of the city that is associated with the address. |
| 7 | CONTACT_NAME |  |  |  | VARCHAR (120) | This column contains the name of the contact for the supplier at this address. |
| 8 | COUNTY |  |  |  | VARCHAR (250) | This column holds the county name for the location. |
| 9 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 10 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 11 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 12 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_ADDR_TL|PK||||LANG|ASC|
||||||ADDR_KEY|ASC|

---

## Table: ADD_TYPE

**Description:** The ADD_TYPE table contains one row for each address type within the company. It is populated during installation of the system and must be maintained by the database administrator.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ADDRESS_TYPE | P |  | Y | VARCHAR (2) | This column contains a unique number identifying the address type within Oracle Retail. Valid values include: 01 - Business, 02 - Postal, 03 - Returns, 04 - Order, 05 - Invoice, 06 - Remittance |
| 2 | EXTERNAL_ADDR_IND |  |  | Y | VARCHAR (1) | Indicates if the address type is added by an external system. Valid values are Y and N. If Y, the address type cannot be updated in RMS. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_ADD_TYPE|PK||||ADDRESS_TYPE|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_ADD_TYPE_EXTERNAL_ADDR_IND|external_addr_ind in ('Y','N')<br>|
|Column Level|EXTERNAL_ADDR_IND||

---

## Table: ADD_TYPE_MODULE

**Description:** The data that is inserted/updated/deleted in the table should be very carefully managed by following the rules outlined below: Each address type may be flagged as being for a store, warehouse, or both.Each address type may be flagged as being mandatory or non-mandatory.A single address type must be flagged as the mandatory primary address type for each location type (store, warehouse, or both).

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ADDRESS_TYPE | P | F | Y | VARCHAR (2) | This column contains the unique ID identifying the address type within Oracle Retail. It is the primary key of ADD_TYPE table. |
| 2 | MODULE | P |  | Y | VARCHAR (4) | This column contains the code for the module that the address is attached to. Valid values are: ST - Store, WH - Warehouse, SUPP - Supplier, PTNR - Partner |
| 3 | PRIMARY_IND |  |  | Y | VARCHAR (1) | This column indicates if this address type is the primary address type for the module. |
| 4 | MANDATORY_IND |  |  | Y | VARCHAR (1) | This column indicates if this address type is the mandatory address type for the module. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_ADD_TYPE_MODULE|PK||||ADDRESS_TYPE|ASC|
||||||MODULE|ASC|

### Constraints

|Type|Column / Constraint<br>Name|Details|
|---|---|---|
|Table Level|CHK_ATM_MODULE|MODULE in ('ST','WH','SUPP','PTNR','WFST')<br> <br>|
||CHK_ATM_PRIMARY_IND|((PRIMARY_IND = 'Y' and MANDATORY_IND = 'Y') or (PRIMARY_IND = 'N') or (MANDATORY_IND ='N'))<br>|
|Column Level|MODULE||

---

## Table: ADD_TYPE_TL

**Description:** This table holds the translated description of the Address Types in all languages.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ADDRESS_TYPE | P | F | Y | VARCHAR (2) | Contains a number which uniquely identifies the address type within Oracle Retail. |
| 2 | LANG | P | F | Y | NUMERIC (6) | Contains the number which uniquely identifies a language. |
| 3 | TYPE_DESC |  |  | Y | VARCHAR (40 ) | Holds the description of the address types in a given language. |
| 4 | ORIG_LANG_IND |  |  | Y | VARCHAR (1 ) | Indicates if the description is in the original language entered for the address type. It is set to â€˜Yâ€™ when the first record is written to the table for the address type. |
| 5 | REVIEWED_IND |  |  | Y | VARCHAR (1 ) | Indicates if the description needs to be reviewed for translation. It is set to â€˜Nâ€™ when the description in the original language is inserted or updated. We assume that clients will regularly run reports on all strings that are not reviewed (i.e. reviewed_ind = â€˜Nâ€™). When translation either provides a new string, or OKs that the existing string is correct, the reviewed_ind should be set to â€˜Yâ€™. |
| 6 | CREATE_ID |  |  | Y | VARCHAR (30 ) | This field contains the user that created the record. |
| 7 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 8 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30 ) | This field contains the user that last updated the record. |
| 9 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_ADD_TYPE_TL|PK||||ADDRESS_TYPE|ASC|
||||||LANG|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_ADD_TYPE_TL_ORIG_IND|ORIG_LANG_IND IN ('Y','N')<br>|
||CHK_ADD_TYPE_TL_REV_IND|REVIEWED_IND IN ('Y','N')<br>|

---

## Table: AREA

**Description:** This table contains one row for each geographic area within a chain. An area belongs to a chain within the organizational hierarchy.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | AREA | P |  | Y | NUMERIC (10) | This column contains the number which uniquely identifies an area within the system. |
| 2 | AREA_NAME |  |  | Y | VARCHAR (120) | This column contains the name of the area which, along with the area number, identifies the area. |
| 3 | MGR_NAME |  |  |  | VARCHAR (120) | This column contains the name of the manager for the area. |
| 4 | CHAIN |  | F | Y | NUMERIC (10) | This column contains the chain number of which the area is a member. |
| 5 | CURRENCY_CODE |  | F |  | VARCHAR (3) | This column contains the currency code under which the area operates. |
| 6 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |
| 7 | CREATE_DATETIME |  |  | Y | Date | This column holds the record creation date. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_AREA|PK||||AREA|ASC|
|AREA_I1|||||CHAIN|ASC|
|AREA_I2|||||CURRENCY_CODE|ASC|

---

## Table: AREA_TL

**Description:** This is the translation table for AREA table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | AREA | P | F | Y | NUMERIC (10) | This column contains the number which uniquely identifies an area within the system. |
| 3 | AREA_NAME |  |  | Y | VARCHAR (120) | This column contains the name of the area which, along with the area number, identifies the area. |
| 4 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 6 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 7 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_AREA_TL|PK||||LANG|ASC|
||||||AREA|ASC|

---

## Table: BANNER

**Description:** This table will hold the Banner Id and Name for a Banner. A banner is the name for a channel or many channels.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | BANNER_ID | P |  | Y | NUMERIC (4) | The number to uniquely identify a Banner. |
| 2 | BANNER_NAME |  |  | Y | VARCHAR (120) | The name of the Banner for which channels are associated. |
| 3 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |
| 4 | CREATE_DATETIME |  |  | Y | Date | This column holds the record creation date. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_BANNER|PK||||BANNER_ID|ASC|

---

## Table: BANNER_MFQUEUE

**Description:** This table holds banner and channel publication messages in sequence until they are published.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SEQ_NO | P |  | Y | NUMERIC (15) | This column stores the sequence of message creation. |
| 2 | PUB_STATUS |  |  | Y | VARCHAR (1) | This column holds the publication status of the message. Currently, the only valid status for banners and channels is Unprocessed. |
| 3 | MESSAGE_TYPE |  |  | Y | VARCHAR (15) | This holds the type of message. |
| 4 | BANNER_ID |  |  | Y | NUMERIC (4) | This holds the unique identifier for the banner |
| 5 | CHANNEL_ID |  |  |  | NUMERIC (4) | This holds the unique identifier for the channel. |
| 6 | MESSAGE |  |  |  | CLOB | This column holds the actual XML message. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_BANNER_MFQUEUE|PK||||SEQ_NO|ASC|

---

## Table: BANNER_TL

**Description:** This is the translation table for BANNER table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | BANNER_ID | P | F | Y | NUMERIC (4) | The number to uniquely identify a Banner. |
| 3 | BANNER_NAME |  |  | Y | VARCHAR (120) | The name of the Banner for which channels are associated. |
| 4 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 6 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 7 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_BANNER_TL|PK||||LANG|ASC|
||||||BANNER_ID|ASC|

---

## Table: CHAIN

**Description:** Contains one row for each chain and/or format of a store within a company. It is the first level of the organization hierarchy below company.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | CHAIN | P |  | Y | NUMERIC (10) | Contains the number which uniquely identifies the chain. |
| 2 | CHAIN_NAME |  |  | Y | VARCHAR (120) | Contains the name of the chain which, along with the chain number, identifies the chain. |
| 3 | MGR_NAME |  |  |  | VARCHAR (120) | Contains the name of the manager of the chain. |
| 4 | CURRENCY_CODE |  | F |  | VARCHAR (3) | This field contains the currency code under which the chain operates. |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |
| 6 | CREATE_DATETIME |  |  | Y | Date | This column holds the record creation date. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_CHAIN|PK||||CHAIN|ASC|
|CHAIN_I1|||||CURRENCY_CODE|ASC|

---

## Table: CHAIN_TL

**Description:** This is the translation table for CHAIN table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | CHAIN | P | F | Y | NUMERIC (10) | Contains the number which uniquely identifies the chain. |
| 3 | CHAIN_NAME |  |  | Y | VARCHAR (120) | Contains the name of the chain which, along with the chain number, identifies the chain. |
| 4 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 6 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 7 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_CHAIN_TL|PK||||LANG|ASC|
||||||CHAIN|ASC|

---

## Table: CHANNELS

**Description:** This table contains one row for every channel operated within the company. This table will only be used in a multi-channel environment.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | CHANNEL_ID | P |  | Y | NUMERIC (4) | This column will contain the number that uniquely identifies the channel. |
| 2 | CHANNEL_NAME |  |  | Y | VARCHAR (120) | Contains the name of the channel. |
| 3 | CHANNEL_TYPE |  |  | Y | VARCHAR (6) | Specifies the type of channel. |
| 4 | BANNER_ID |  |  | Y | NUMERIC (4) | A banner is the name of a channel of multiple channels |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |
| 6 | CREATE_DATETIME |  |  | Y | Date | This column holds the record creation date. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_CHANNELS|PK||||CHANNEL_ID|ASC|

---

## Table: CHANNELS_TL

**Description:** This is the translation table for CHANNELS table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | CHANNEL_ID | P | F | Y | NUMERIC (4) | This column will contain the number that uniquely identifies the channel. |
| 3 | CHANNEL_NAME |  |  | Y | VARCHAR (120) | Contains the name of the channel. |
| 4 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 6 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 7 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_CHANNELS_TL|PK||||LANG|ASC|
||||||CHANNEL_ID|ASC|

---

## Table: COMPANY_CLOSED

**Description:** This table contains the details for company-wide closings.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | CLOSE_DATE | P |  | Y | Date | This field contains the date that the company is closed. |
| 2 | CLOSE_DESC |  |  |  | VARCHAR (120) | This field contains a description of the close. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_COMPANY_CLOSED|PK||||CLOSE_DATE|ASC|

---

## Table: COMPANY_CLOSED_EXCEP

**Description:** This table contains locations that are open on days which the company is closed.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | CLOSE_DATE | P | F | Y | Date | Contains the date on which activity will not occur. |
| 2 | LOCATION | P |  | Y | NUMERIC (10) | Contains the location number. |
| 3 | LOC_TYPE |  |  | Y | VARCHAR (6) | Contains the location type (S)tore, (W)arehouse |
| 4 | SALES_IND |  |  | Y | VARCHAR (1) | This field indicates in the location is open for sales. |
| 5 | RECV_IND |  |  | Y | VARCHAR (1) | This field indicates in the location is open for receiving. |
| 6 | SHIP_IND |  |  | Y | VARCHAR (1) | This field indicates in the location is open for shipping. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_COMPANY_CLOSED_EXCEP|PK||||CLOSE_DATE|ASC|
||||||LOCATION|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_COMPANY_CLO_EXCEP_LOC_TYPE|LOC_TYPE IN ('S','W')<br>|
||CHK_COMPANY_CLO_EXCEP_RECV_IND|RECV_IND IN ('Y','N')<br>|
||CHK_COMPANY_CLO_EXCEP_SALE_IND|SALES_IND IN ('Y','N')<br>|
||CHK_COMPANY_CLO_EXCEP_SHIP_IND|SHIP_IND IN ('Y','N')<br>|
|Column Level|LOC_TYPE||
||SALES_IND||






|Type|Column / Constraint Name|Details|
|---|---|---|
||RECV_IND||
||SHIP_IND||

---

## Table: COMPANY_CLOSED_TL

**Description:** This is the translation table for COMPANY_CLOSED table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | CLOSE_DATE | P | F | Y | Date | This field contains the date that the company is closed. |
| 3 | CLOSE_DESC |  |  |  | VARCHAR (120) | This field contains a description of the close. |
| 4 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 6 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 7 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_COMPANY_CLOSED_TL|PK||||LANG|ASC|
||||||CLOSE_DATE|ASC|

---

## Table: DISTRICT

**Description:** This table contains one row for each district. Districts are a further breakdown of regions.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DISTRICT | P |  | Y | NUMERIC (10) | Contains the number which uniquely identifies the district. |
| 2 | DISTRICT_NAME |  |  | Y | VARCHAR (120) | Contains the name of the district which, along with the district number, identifies the district. |
| 3 | MGR_NAME |  |  |  | VARCHAR (120) | Contains the name of the manager of the district. |
| 4 | REGION |  | F | Y | NUMERIC (10) | Contains the number of the region of which the district is a member. |
| 5 | CURRENCY_CODE |  | F |  | VARCHAR (3) | This field contains the currency code under which the district operates. |
| 6 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_DISTRICT|PK||||DISTRICT|ASC|
|DISTRICT_I2|||||REGION|ASC|
|DISTRICT_I1|||||CURRENCY_CODE|ASC|

---

## Table: DISTRICT_TL

**Description:** This is the translation table for DISTRICT table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | DISTRICT | P | F | Y | NUMERIC (10) | Contains the number which uniquely identifies the district. |
| 3 | DISTRICT_NAME |  |  | Y | VARCHAR (120) | Contains the name of the district which, along with the district number, identifies the district. |
| 4 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 6 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 7 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_DISTRICT_TL|PK||||LANG|ASC|
||||||DISTRICT|ASC|

---

## Table: LIKE_STORE_DEPT

**Description:** Will hold values for stores and departments that have been successfully processed during likestore processing.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | STORE |  |  | Y | NUMERIC (10) | Contains the number which uniquely identifies the store. |
| 2 | DEPT |  |  | Y | NUMERIC (4) | Contains the numeric identifier of the department |

---

## Table: LOCATION_CLOSED

**Description:** . This table can be used to specify dates on which specific locations are not available for certain functions even though the company as a whole is open.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LOCATION | P |  | Y | NUMERIC (10) | Contain the location number |
| 2 | CLOSE_DATE | P |  | Y | Date | This field contains the date of the closing. |
| 3 | LOC_TYPE |  |  | Y | VARCHAR (6) | This field contains the location type for the location being closed (i.e. store or warehouse) |
| 4 | SALES_IND |  |  | Y | VARCHAR (1) | This field indicates that a location is closed for sales. Only stores can be closed for sales. |
| 5 | RECV_IND |  |  | Y | VARCHAR (1) | This field indicates that a location is closed for receiving. |
| 6 | SHIP_IND |  |  | Y | VARCHAR (1) | This field indicates that a location is closed for shipping. |
| 7 | REASON |  |  |  | VARCHAR (250) | Contains the reason why the store is closed. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_LOCATION_CLOSED|PK||||LOCATION|ASC|
||||||CLOSE_DATE|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_LOCATION_CLOSED_LOC_TYPE|LOC_TYPE IN ('S','W')<br>|
||CHK_LOCATION_CLOSED_RECV_IND|RECV_IND IN ('Y','N')<br>|
||CHK_LOCATION_CLOSED_SALES_IND|SALES_IND IN ('Y','N')<br>|
||CHK_LOCATION_CLOSED_SHIP_IND|SHIP_IND IN ('Y','N')<br>|






|Type|Column / Constraint Name|Details|
|---|---|---|
|Column Level|LOC_TYPE||
||SALES_IND||
||RECV_IND||
||SHIP_IND||

---

## Table: LOCATION_CLOSED_TL

**Description:** This is the translation table for LOCATION_CLOSED table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | LOCATION | P | F | Y | NUMERIC (10) | Contain the location number |
| 3 | CLOSE_DATE | P | F | Y | Date | This field contains the date of the closing. |
| 4 | REASON |  |  |  | VARCHAR (250) | Contains the reason why the store is closed. |
| 5 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 6 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 7 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 8 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_LOCATION_CLOSED_TL|PK||||LANG|ASC|
||||||LOCATION|ASC|
||||||CLOSE_DATE|ASC|

---

## Table: LOCATION_DIST_TEMP

**Description:** This temporary table is used by the location distribution object to temporarily store records before writing them back out to the calling form appropriately.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ORDER_NO |  |  |  | NUMERIC (12) | This field contains the unique number representing the order. |
| 2 | CONTRACT_NO |  |  |  | NUMERIC (6) | This field contains the unique number representing the contract. |
| 3 | LOC_TYPE |  |  | Y | VARCHAR (1) | This field contains the location type of the location. Valid values are: S - Store W - Warehouse |
| 4 | LOCATION |  |  | Y | NUMERIC (10) | This field contains the location specified for distribution. |
| 5 | DIST_QTY |  |  |  | NUMERIC (12,4) | This field contains the quantity that should be distributed for the specified location. |
| 6 | DIST_PCT |  |  |  | NUMERIC (12,4) | This field contains the percentage that should be distributed for the specified location. |
| 7 | DIST_RATIO |  |  |  | NUMERIC (12,4) | This field contains the ratio that should be distributed for the specified location. |

---

## Table: LOC_CLSF_DETAIL

**Description:** This table will hold location ABC classification detail information.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LOC_TYPE |  |  | Y | VARCHAR (1) | This field contains the location type of the classification. Valid values are S for store and W for warehouse. |
| 2 | LOCATION | P | F | Y | NUMERIC (10) | This field contains the valid store or warehouse that is being classified. |
| 3 | CLASS_LEVEL | P |  | Y | VARCHAR (6) | This field contains a valid item classification level (A items, B items, C items, etc.). Valid values are stored on the code_detail table for code_type = CLSF. This is the value that will be used as the ranking value. |
| 4 | CLASS_PCT |  |  | Y | NUMERIC (12,4) | This field contains the percentage of the merchandise hierarchy (or items if retail is used) to include in this classification. |
| 5 | SKULIST |  | F |  | NUMERIC (8) | A valid item list that exists on skulist_head. This will be the associated list of items that meet the given classification. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_LOC_CLSF_DETAIL|PK||||LOCATION|ASC|
||||||CLASS_LEVEL|ASC|
|LOC_CLSF_DETAIL_I1|||||SKULIST|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_LOC_CLSF_DETAIL_CLASS_PCT|class_pct between 0 and 100<br>|
||CHK_LOC_CLSF_DETAIL_LOC_TYPE|loc_type in ('S','W')<br>|
|Column Level|LOC_TYPE||
||CLASS_PCT||

---

## Table: LOC_CLSF_HEAD

**Description:** This table will hold location ABC classification header information.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LOC_TYPE |  |  | Y | VARCHAR (1) | This field contains the location type of the classification. Valid values are S for store and W for warehouse. |
| 2 | LOCATION | P |  | Y | NUMERIC (10) | This field contains the valid store or warehouse that is being classified. |
| 3 | CLASSIFICATION |  |  | Y | VARCHAR (6) | This field contains the rank of classification being created at the location. Valid values are S for sales, H for shrinkage, and R for retail classifications. |
| 4 | CLASSIFICATION_TYPE |  |  |  | VARCHAR (6) | This field contains the type of classification being created. This field will contain A for amount classifications and U for unit classifications (Retail price is considered an amount classification type). |
| 5 | RECALCULATE_IND |  |  | Y | VARCHAR (1) | This indicator will be used to determine if the batch program should overwrite the old classifications with new classifications for the location. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_LOC_CLSF_HEAD|PK||||LOCATION|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_LOC_CLSF_HEAD_CLASSIFICATN|classification in ('R','S','H')<br>|
||CHK_LOC_CLSF_HEAD_CLASSIF_TYPE|classification_type in ('A','U')<br>|
||CHK_LOC_CLSF_HEAD_LOC_TYPE|loc_type in ('S','W')<br>|
||CHK_LOC_CLSF_HEAD_RECALC_IND|recalculate_ind in ('Y','N')<br>|
|Column Level|LOC_TYPE||
||CLASSIFICATION||
||RECALCULATE_IND||

---

## Table: LOC_LIST_CRITERIA

**Description:** This TABLE contains one row FOR EACH step performed TO obtain a store grouping criteria AND a warehouse grouping criteria. FOR EACH step performed, a query WHERE clause IS formed TO include/exclude location IN/FROM the location list. These grouping criteria can be used TO rebuild the location list.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LOC_LIST | P | F | Y | NUMERIC (10) | Contains the NUMBER that uniquely identifies a location list. |
| 2 | LOC_TYPE | P |  | Y | VARCHAR (1) | Indicates whether this criteria IS being used TO query stores FOR the location list OR TO query warehouses FOR the location list. Valid VALUES are: S - Store W - Warehouse |
| 3 | SEQ_NO | P |  | Y | NUMERIC (6) | Indicates the ORDER IN which the criteria should be applied. This NUMBER IS UNIQUE within the location list FOR a given location type. |
| 4 | OPEN_PARENTHESIS |  |  |  | VARCHAR (1) | Puts an OPEN parenthesis ( TO the query WHERE clause IF this field contains a value. |
| 5 | ELEMENT |  |  |  | VARCHAR (6) | Contains the code OF location-related data element that can be used TO CREATE a list OF locations. Together WITH the comparison field AND the value field, it forms one criteria that IS used TO build the location list. The codes are ON the code_detail TABLE WITH code type LLST AND LLWH. Valid VALUES are: SN (Store NUMBER) WN (WH NUMBER) ST (State) CTY (Country ID) ZC (Zip Code) LT (Location Traits) DT (District) DW (DEFAULT WH) VR (Vat Region) PM (Promo Zone) TSF (Transfer Zone) CZG (Cost Zone GROUP) CZ (Cost Zone) PZG (Price Zone GROUP) PZ (Price Zone) SGG (Store Grade GROUP) SG (Store Grade) CUR (Currency) LNG (Language) SC (Store Class) SF (Store Format) TA (Total Area) SA (Selling Area) OD (Store OPEN DATE) AD (Store Acquired DATE) RD (Store Remodel DATE) SL (Store Sales Level FOR Last Closed Week) FL (Store Forecast level FOR Last Closed Week) |
| 6 | COMPARISON |  |  |  | VARCHAR (6) | Defines the relation BETWEEN the criteria element AND the criteria value. Together WITH the element field AND the value field, it forms one criteira that IS used TO build the location list. Valid VALUES are: EQ (=) NE (!=) GT (>) LT (<) GE (>=) LE (<=) |
| 7 | VALUE |  |  |  | VARCHAR (120) | Contains the value OF the location data element. Together WITH the element field AND the comparison field, it forms one criteira that IS used TO build the location list. |
| 8 | CLOSE_PARENTHESIS |  |  |  | VARCHAR (1) | Puts an CLOSE parenthesis ) TO the query WHERE clause IF this field contains a value. |
| 9 | LOGIC_OPERATION |  |  |  | VARCHAR (6) | Indicates the logical relation (AND/OR) BETWEEN the CURRENT criteria AND the NEXT criteria. Valid VALUES are: AND OR |
| 10 | RELATED_VALUE |  |  |  | NUMERIC (8) | This column may contain the cost zone GROUP WHEN the element IS CZ, the price zone GROUP WHEN the element IS PZ, OR the store grade GROUP WHEN the element IS SG. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_LOC_LIST_CRITERIA|PK||||LOC_LIST|ASC|
||||||LOC_TYPE|ASC|
||||||SEQ_NO|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_LOC_LIST_CRIT_LOGIC_OP|logic_operation in ('AND', 'OR', NULL)<br>|
|Column Level|LOC_TYPE||
||OPEN_PARENTHESIS||
||ELEMENT||
||COMPARISON||
||CLOSE_PARENTHESIS||
||LOGIC_OPERATION||

---

## Table: LOC_LIST_CRITERIA_TEMP

**Description:** This IS a TEMPORARY TABLE FOR location list criteria manipulation. It contains the same columns AS those OF LOC_LIST_CRITERIA TABLE, EXCEPT that seq_no IS OF type NUMBER(6,3) FOR inserting extra records. There IS no PRIMARY KEY FOR this table. AFTER processing the location list criteria, records IN this TABLE should be deleted.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LOC_LIST |  |  | Y | NUMERIC (10) | Contains the NUMBER that uniquely identifies a location list. |
| 2 | LOC_TYPE |  |  | Y | VARCHAR (1) | Indicates whether this criteria IS being used TO query stores FOR the location list OR TO query warehouses FOR the location list. Valid VALUES are: S - Store W - Warehouse |
| 3 | SEQ_NO |  |  | Y | NUMERIC (9,3) | Indicates the ORDER IN which the criteria should be applied. This NUMBER IS UNIQUE within the location list FOR a given location type. |
| 4 | OPEN_PARENTHESIS |  |  |  | VARCHAR (1) | Puts an OPEN parenthesis ( TO the query WHERE clause IF this field contains a value. |
| 5 | ELEMENT |  |  |  | VARCHAR (6) | Contains the code OF location-related data element that can be used TO CREATE a list OF locations. Together WITH the comparison field AND the value field, it forms one criteria that IS used TO build the location list. The codes are ON the code_detail TABLE WITH code type LLST AND LLWH. Valid VALUES are: SN (Store NUMBER) WN (WH NUMBER) ST (State) CTY (Country ID) ZC (Zip Code) LT (Location Traits) DT (District) DW (DEFAULT WH) VR (Vat Region) PM (Promo Zone) TSF (Transfer Zone) CZG (Cost Zone GROUP) CZ (Cost Zone) PZG (Price Zone GROUP) PZ (Price Zone) SGG (Store Grade GROUP) SG (Store Grade) CUR (Currency) LNG (Language) SC (Store Class) SF (Store Format) TA (Total Area) SA (Selling Area) OD (Store OPEN DATE) AD (Store Acquired DATE) RD (Store Remodel DATE) SL (Store Sales Level |
| 6 | COMPARISON |  |  |  | VARCHAR (6) | Defines the relation BETWEEN the criteria element AND the criteria value. Together WITH the element field AND the value field, it forms one criteira that IS used TO build the location list. Valid VALUES are: EQ (=) NE (!=) GT (>) LT (<) GE (>=) LE (<=) |
| 7 | VALUE |  |  |  | VARCHAR (120) | Contains the value OF the location data element. Together WITH the element field AND the comparison field, it forms one criteira that IS used TO build the location list. |
| 8 | CLOSE_PARENTHESIS |  |  |  | VARCHAR (1) | Puts an CLOSE parenthesis ) TO the query WHERE clause IF this field contains a value. |
| 9 | LOGIC_OPERATION |  |  |  | VARCHAR (6) | Indicates the logical relation ( AND/ OR) BETWEEN the CURRENT criteria AND the NEXT criteria. Valid VALUES are: AND OR |
| 10 | RELATED_VALUE |  |  |  | NUMERIC (8) | This column may contain the cost zone GROUP WHEN the element IS CZ, the price zone GROUP WHEN the element IS PZ, OR the store grade GROUP WHEN the element IS SG. |

---

## Table: LOC_LIST_DETAIL

**Description:** This table contains one row for each location (store or warehouse) within a location list.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LOC_LIST | P | F | Y | NUMERIC (10) | Contains the number that uniquely identifies a location list. |
| 2 | LOCATION | P |  | Y | NUMERIC (10) | Identifies the location that is on the location list. The location can be either a store or a warehouse. In a multiple channel environment, both |
| 3 | LOC_TYPE |  |  | Y | VARCHAR (1) | Contains the location type of the location included on the location list. Valid values for this field are: S - Store W - Warehouse |
| 4 | ACTION_TYPE |  |  |  | VARCHAR (6) | Indicates whether the detail record is a newly added record or is to be deleted. Valid values for this field are: A - add D - delete |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_LOC_LIST_DETAIL|PK||||LOC_LIST|ASC|
||||||LOCATION|ASC|
|LOC_LIST_DETAIL_I2|||||LOCATION|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_LOC_LIST_DETAIL_ACTION_TY|action_type in ('A','D',NULL)<br>|
||CHK_LOC_LIST_DETAIL_LOC_TYPE|loc_type in ('S','W')<br>|
|Column Level|LOC_TYPE||
||ACTION_TYPE||

---

## Table: LOC_LIST_HEAD

**Description:** This table contains the header level information for each location list set up in the system. A location list can contain store and WH. The information includes the stored grouping criteria for store and for WH. These criteria will be used to rebuild all lists.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LOC_LIST | P |  | Y | NUMERIC (10) | Contains a number to uniquely identify a location list. |
| 2 | LOC_LIST_DESC |  |  | Y | VARCHAR (120) | Contains the description of the location list. |
| 3 | CREATE_DATE |  |  | Y | Date | Contains the date that the location list was created. |
| 4 | CREATE_ID |  |  | Y | VARCHAR (30) | Contains the Oracle user ID of the user that created the location list. |
| 5 | STATIC_IND |  |  | Y | VARCHAR (1) | Indicates whether the location list is static or dynamic. A dynamic list can be rebuilt. Valid values are Y and N. |
| 6 | BATCH_REBUILD_IND |  |  | Y | VARCHAR (1) | Indicates whether the location list is to be rebuilt in the nightly batch process. Valid values are Y and N. |
| 7 | LAST_REBUILD_DATE |  |  | Y | Date | Contains the date that the location list was last rebuilt. A location list can only be rebuilt if the static_ind is N. |
| 8 | USER_SECURITY_IND |  |  | Y | VARCHAR (1) | This field indicates whether security for a location list is on or off. |
| 9 | SOURCE |  |  | Y | VARCHAR (6) | Indicates how the location list was generated. Valid values for this field are: RMS - Oracle Retail Merchandising System RDF - Oracle Retail Data Forecasting RDW - Oracle Retail Data Warehouse |
| 10 | EXTERNAL_REF_NO |  |  |  | NUMERIC (4) | Contains the external reference number for the location list populated by sources like RDF and RDW. |
| 11 | COMMENT_DESC |  |  |  | VARCHAR (2000) | Contains comments about the location list. |
| 12 | FILTER_ORG_ID |  |  |  | NUMERIC (10) | The ID of the Organizational Hierarchy that the Location List is assigned to. This field will be used to control the Location Lists a user can see in the Location List LOV when the link between the user and the Organizational Hierarchy has been established. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_LOC_LIST_HEAD|PK||||LOC_LIST|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_LOC_LIST_HEAD_BATCH_REBLD|batch_rebuild_ind in ('Y','N')<br>|
||CHK_LOC_LIST_HEAD_LOC_LIST|static_ind in ('Y','N')<br>|
||CHK_LOC_LIST_HEAD_SOURCE|source in ('RMS','RDF','RA')<br>|
||CHK_LOC_LIST_HEAD_USER_SECURIT|user_security_ind in ('Y', 'N')<br>|
|Column Level|STATIC_IND||
||BATCH_REBUILD_IND||
||USER_SECURITY_IND||
||SOURCE||

---

## Table: LOC_LIST_HEAD_TL

**Description:** This is the translation table for LOC_LIST_HEAD table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | LOC_LIST | P | F | Y | NUMERIC (10) | Contains a number to uniquely identify a location list. |
| 3 | LOC_LIST_DESC |  |  | Y | VARCHAR (120) | Contains the description of the location list. |
| 4 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 6 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 7 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_LOC_LIST_HEAD_TL|PK||||LANG|ASC|
||||||LOC_LIST|ASC|

---

## Table: LOC_TRAITS

**Description:** This table contains one row for each location trait in the system. Location traits allow stores to be grouped based on common characteristics.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LOC_TRAIT | P |  | Y | NUMERIC (4) | Contains a number which uniquely identifies a location trait. |
| 2 | DESCRIPTION |  |  | Y | VARCHAR (120) | Contains a description which corresponds with the location trait number. |
| 3 | FILTER_ORG_ID |  |  |  | NUMERIC (10) | The ID of the Organizational Hierarchy that the location trait is assigned to. This field will be used to control the location traits a user can see in the location trait LOV when the link between the user and the Organizational Hierarchy has been established. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_LOC_TRAITS|PK||||LOC_TRAIT|ASC|

---

## Table: LOC_TRAITS_MATRIX

**Description:** This table contains store / location trait relationships.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LOC_TRAIT | P | F | Y | NUMERIC (4) | Contains the number which uniquely identifies a location trait. |
| 2 | STORE | P | F | Y | NUMERIC (10) | Contains the number of the store which possesses the location trait. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_LOC_TRAITS_MATRIX|PK||||LOC_TRAIT|ASC|
||||||STORE|ASC|
|LOC_TRAITS_MATRIX_I1|||||STORE|ASC|

---

## Table: LOC_TRAITS_TL

**Description:** This is the translation table for LOC_TRAITS table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | LOC_TRAIT | P | F | Y | NUMERIC (4) | Contains a number which uniquely identifies a location trait. |
| 3 | DESCRIPTION |  |  | Y | VARCHAR (120) | Contains a description which corresponds with the location trait number. |
| 4 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 6 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 7 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_LOC_TRAITS_TL|PK||||LANG|ASC|
||||||LOC_TRAIT|ASC|

---

## Table: ORG_UNIT

**Description:** This table will hold the oracle organizational unit values.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ORG_UNIT_ID | P |  | Y | NUMERIC (15) | holds the oracle organizational unit ID |
| 2 | DESCRIPTION |  |  | Y | VARCHAR (120) | holds the organizational unit description |
| 3 | SET_OF_BOOKS_ID |  | F |  | NUMERIC (15) | Set of Books Id |
| 4 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |
| 5 | CREATE_DATETIME |  |  | Y | Date | This column holds the record creation date. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_ORG_UNIT|PK||||ORG_UNIT_ID|ASC|
|ORG_UNIT_I1|||||SET_OF_BOOKS_ID|ASC|

---

## Table: ORG_UNIT_ADDR_SITE

**Description:** This table will be used to associate Oracles vendor site id with RMS supplier addresses. This will be used for the new oracle financials interface and will allow RMS to receive address updates from Oracle.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ADDR_KEY | P |  | Y | NUMERIC (11) | this column will hold the addr_key value |
| 2 | ORG_UNIT_ID | P | F | Y | NUMERIC (15) | this column will contain the org_unit_id value |
| 3 | ORACLE_VENDOR_SITE_ID |  |  | Y | NUMERIC (15) | this column will contain Oracles vendor site id. this value will be supplied by oracle. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_ORG_UNIT_ADDR_SITE|PK||||ADDR_KEY|ASC|
||||||ORG_UNIT_ID|ASC|
|ORG_UNIT_ADDR_SITE_I1|||||ORG_UNIT_ID|ASC|

---

## Table: ORG_UNIT_TL

**Description:** This is the translation table for ORG_UNIT table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | ORG_UNIT_ID | P | F | Y | NUMERIC (15) | holds the oracle organizational unit ID |
| 3 | DESCRIPTION |  |  | Y | VARCHAR (120) | holds the organizational unit description |
| 4 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 6 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 7 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_ORG_UNIT_TL|PK||||LANG|ASC|
||||||ORG_UNIT_ID|ASC|

---

## Table: OUTLOC

**Description:** This table is used to store skeleton information about locations that fall outside of RMS Organization Hierarchy such as entry ports.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | OUTLOC_TYPE | P |  | Y | VARCHAR (6) | This field holds the type of location, e.g., Discharge Port (DP) or Port of Lading (PL) |
| 2 | OUTLOC_ID | P |  | Y | VARCHAR (5) | This is a unique location identification used so that the location can be referenced in other modules. |
| 3 | OUTLOC_DESC |  |  | Y | VARCHAR (150) | A description or name of the location. |
| 4 | OUTLOC_CURRENCY |  | F |  | VARCHAR (3) | The currency code associated with the Outside Location. |
| 5 | OUTLOC_ADD1 |  |  |  | VARCHAR (240) | The street address of the location. |
| 6 | OUTLOC_ADD2 |  |  |  | VARCHAR (240) | The second line of a street address. |
| 7 | OUTLOC_CITY |  |  |  | VARCHAR (120) | This field holds the name of the city where the location exists. |
| 8 | OUTLOC_STATE |  |  |  | VARCHAR (3) | The name of the state where the location exists. |
| 9 | OUTLOC_COUNTRY_ID |  | F | Y | VARCHAR (3) | The field holds the three letter code of the country where the location exists. |
| 10 | OUTLOC_POST |  |  |  | VARCHAR (30) | The postal code for the area where the location exists. |
| 11 | OUTLOC_VAT_REGION |  | F |  | NUMERIC (4) | Contains the unique identifying number for the VAT region in the system. |
| 12 | CONTACT_NAME |  |  |  | VARCHAR (120) | The name of a person that may be contacted at the particular location. |
| 13 | CONTACT_PHONE |  |  |  | VARCHAR (20) | The phone number of the contact person. |
| 14 | CONTACT_FAX |  |  |  | VARCHAR (20) | The fax number of the contact person. |
| 15 | CONTACT_TELEX |  |  |  | VARCHAR (20) | The telex number of the contact person. |
| 16 | CONTACT_EMAIL |  |  |  | VARCHAR (100) | The email address of the contact person. |
| 17 | PRIMARY_IND |  |  |  | VARCHAR (1) | Applicable only when outloc_type=CZ. Indicates if the current clearing zone is primary for the import country. |
| 18 | OUTLOC_NAME_SECONDARY |  |  |  | VARCHAR (150) | Contains the secondary name of the outside location. |
| 19 | OUTLOC_JURISDICTION_CODE |  |  |  | VARCHAR (10) | Identifies the jurisdiction code for the country-state relationship. |
| 20 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |
| 21 | CREATE_DATETIME |  |  | Y | Date | This column holds the record creation date. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_OUTLOC|PK||||OUTLOC_TYPE|ASC|
||||||OUTLOC_ID|ASC|
|OUTLOC_I2|||||OUTLOC_CURRENCY|ASC|
|OUTLOC_I3|||||OUTLOC_VAT_REGION|ASC|
|OUTLOC_I1|||||OUTLOC_COUNTRY_ID|ASC|

### Constraints

|Type|Column / Constraint<br>Name|Details|
|---|---|---|
|Table Level|CHK_OUTLOC_OUTLOC_TYPE|(outloc_type in ('DP', 'BT', 'RL') and outloc_currency is NOT NULL) or outloc_type not in ('DP', 'BT', 'RL')<br>|
||CHK_OUTLOC_PRIMARY_IND|primary_ind in ('Y','N')|
|Column Level|PRIMARY_IND||

---

## Table: OUTLOC_L10N_EXT

**Description:** This is the LFAS storage table for the entity OUTLOC

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | OUTLOC_TYPE | P | F | Y | VARCHAR (6) | This field holds the type of location, e.g., Discharge Port (DP) or Port of Lading (PL) |
| 2 | OUTLOC_ID | P | F | Y | VARCHAR (5) | This is a unique location identification used so that the location can be referenced in other modules. |
| 3 | L10N_COUNTRY_ID | P | F | Y | VARCHAR (3) | This column holds the country this extended data is associated with. The logical business meaning of the VARCHAR_, NUMBER_ and DATE_ columns on this table are determined by the metadata defined for this country in its localization pack. |
| 4 | GROUP_ID | P | F | Y | NUMERIC (10) | This column holds the attribute group id that this extended data is associated with. The logical business meaning of the VARCHAR_, NUMBER_ and DATE_ columns on this table are determined by the metadata defined for this country/attribute group in the countrys localization pack. |
| 5 | VARCHAR2_1 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references VARCHAR2_1 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 6 | VARCHAR2_2 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references VARCHAR2_2 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 7 | VARCHAR2_3 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references VARCHAR2_3 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 8 | VARCHAR2_4 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references VARCHAR2_4 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 9 | VARCHAR2_5 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references VARCHAR2_5 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 10 | VARCHAR2_6 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references VARCHAR2_6 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 11 | VARCHAR2_7 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references VARCHAR2_7 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 12 | VARCHAR2_8 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references VARCHAR2_8 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 13 | VARCHAR2_9 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references VARCHAR2_9 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 14 | VARCHAR2_10 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references VARCHAR2_10 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 15 | NUMBER_11 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references NUMBER_11 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 16 | NUMBER_12 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references NUMBER_12 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 17 | NUMBER_13 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references NUMBER_13 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 18 | NUMBER_14 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references NUMBER_14 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 19 | NUMBER_15 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references NUMBER_15 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 20 | NUMBER_16 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references NUMBER_16 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 21 | NUMBER_17 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references NUMBER_17 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 22 | NUMBER_18 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references NUMBER_18 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 23 | NUMBER_19 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references NUMBER_19 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 24 | NUMBER_20 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references NUMBER_20 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 25 | DATE_21 |  |  |  | Date | This column holds data related to the attribute defined on the L10N_ATTRIB table that references DATE_21 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 26 | DATE_22 |  |  |  | Date | This column holds data related to the attribute defined on the L10N_ATTRIB table that references DATE_22 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_OUTLOC_L10N_EXT|PK||||OUTLOC_TYPE|ASC|
||||||OUTLOC_ID|ASC|
||||||L10N_COUNTRY_ID|ASC|
||||||GROUP_ID|ASC|

---

## Table: OUTLOC_TL

**Description:** This is the translation table for OUTLOC table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | OUTLOC_TYPE | P | F | Y | VARCHAR (6) | This field holds the type of location, e.g., Discharge Port (DP) or Port of Lading (PL) |
| 3 | OUTLOC_ID | P | F | Y | VARCHAR (5) | This is a unique location identification used so that the location can be referenced in other modules. |
| 4 | OUTLOC_DESC |  |  | Y | VARCHAR (150) | A description or name of the location. |
| 5 | OUTLOC_ADD1 |  |  |  | VARCHAR (240) | The street address of the location. |
| 6 | OUTLOC_ADD2 |  |  |  | VARCHAR (240) | The second line of a street address. |
| 7 | OUTLOC_CITY |  |  |  | VARCHAR (120) | This field holds the name of the city where the location exists. |
| 8 | CONTACT_NAME |  |  |  | VARCHAR (120) | The name of a person that may be contacted at the particular location. |
| 9 | OUTLOC_NAME_SECONDARY |  |  |  | VARCHAR (150) | Contains the secondary name of the outside location. |
| 10 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 11 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 12 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 13 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_OUTLOC_TL|PK||||LANG|ASC|
||||||OUTLOC_TYPE|ASC|
||||||OUTLOC_ID|ASC|

---

## Table: PRIORITY_GROUP

**Description:** Users are allowed to group franchise stores/company stores/warehouse in a Priority Group. Situation where two stores are requesting for the same inventory Priority Group associated with the stores will be used by the system to allocate inventory. Store which has highest priority group will be the first to get inventory. Priority Group1 will be considered highest. This will be basically used in inventory management and replenishment.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PRIORITY_GROUP_ID | P |  | Y | NUMERIC (4) | System generated numeric Column. It is the primary key of the table. It will be unique for each priority. This is a non-editable column. |
| 2 | PRIORITY_GROUP_DESC |  |  | Y | VARCHAR (100) | User entered description for the priority group. Description can be changed |
| 3 | PRIORITY |  |  | Y | NUMERIC (4) | User entered priority for the group. Valid values are numbers (1-9999). This value tells which priority the group belongs to. Priority 1 is the highest priority. This column is updatable. |
| 4 | CREATE_DATE |  |  | Y | Date | Date/time stamp of when the priority group was created. |
| 5 | LAST_UPDATE_DATE |  |  | Y | Date | Holds the date time stamp of the most recent update by the last_update_user_id.This Column is required by the database. |
| 6 | CREATE_USER_ID |  |  | Y | VARCHAR (30) | Holds the user_id who created the priority group. |
| 7 | LAST_UPDATE_USER_ID |  |  | Y | VARCHAR (30) | Holds the last user_id who updated the priority/proiority_desc of the priority group. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_PRIORITY_GROUP|PK||||PRIORITY_GROUP_ID|ASC|

---

## Table: PRIORITY_GROUP_LOCATIONS

**Description:** User is allowed to group franchise stores/company stores/warehouse in a Priority Group. Situation where two stores are requesting for the same inventory Priority Group associated with the stores will be used by the system to allocate inventory. Store which has highest priority group will be the first to get inventory. Priority Group1 will be considered highest. This will be basically used in inventory management and replenishment.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PRIORITY_GROUP_ID | P | F | Y | NUMERIC (4) | System generated numeric value. It is foreign key of the table . The value should be present in the PRIORITY_GROUP table. |
| 2 | LOCATION_TYPE |  |  | Y | VARCHAR (1) | This holds the location type of the location which is associated with the priority group. The valid values are company store (S), Franchise store (F) and warehouse (W). |
| 3 | LOCATION | P |  | Y | NUMERIC (10) | This contains the location which is to be associated with the priority . the location associated should be present in store/wh table. |
| 4 | CREATE_DATE |  |  | Y | Date | Date/time stamp of when the location(s) were added to the priority group. |
| 5 | LAST_UPDATE_DATE |  |  | Y | Date | Holds the date time stamp of the most recent update by the last_update_user_id. |
| 6 | CREATE_USER_ID |  |  | Y | VARCHAR (30) | Holds the user_id who first added the location/locations to the priority group. |
| 7 | LAST_UPDATE_USER_ID |  |  | Y | VARCHAR (30) | Holds the last user_id who updated the locations of the priority group. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_PRIORITY_GROUP_LOCATIONS|PK||||PRIORITY_GROUP_ID|ASC|
||||||LOCATION|ASC|

---

## Table: PRIORITY_GROUP_TL

**Description:** This is the translation table for PRIORITY_GROUP table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | PRIORITY_GROUP_ID | P | F | Y | NUMERIC (4) | System generated numeric Column. It is the primary key of the table. It will be unique for each priority. This is a non-editable column. |
| 3 | PRIORITY_GROUP_DESC |  |  | Y | VARCHAR (100) | User entered description for the priority group. Description can be changed |
| 4 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 6 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 7 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_PRIORITY_GROUP_TL|PK||||LANG|ASC|
||||||PRIORITY_GROUP_ID|ASC|

---

## Table: REGION

**Description:** This table contains one row for each geographic region within the company.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | REGION | P |  | Y | NUMERIC (10) | Contains the number which uniquely identifies the region. |
| 2 | REGION_NAME |  |  | Y | VARCHAR (120) | Contains the name of the region which, along with the region number, identifies the region. |
| 3 | MGR_NAME |  |  |  | VARCHAR (120) | Contains the name of the manager for the region. |
| 4 | AREA |  | F | Y | NUMERIC (10) | Contains the number of the area of which the region is a member. |
| 5 | CURRENCY_CODE |  | F |  | VARCHAR (3) | This field contains the currency code under which the region operates. |
| 6 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |
| 7 | CREATE_DATETIME |  |  | Y | Date | This column holds the record creation date. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_REGION|PK||||REGION|ASC|
|REGION_I2|||||CURRENCY_CODE|ASC|
|REGION_I1|||||AREA|ASC|

---

## Table: REGION_TL

**Description:** This is the translation table for REGION table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | REGION | P | F | Y | NUMERIC (10) | Contains the number which uniquely identifies the region. |
| 3 | REGION_NAME |  |  | Y | VARCHAR (120) | Contains the name of the region which, along with the region number, identifies the region. |
| 4 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 6 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 7 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_REGION_TL|PK||||LANG|ASC|
||||||REGION|ASC|

---

## Table: STORE

**Description:** This table contains one row for each store within the company.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | STORE | P |  | Y | NUMERIC (10) | Contains the number which uniquely identifies the store. |
| 2 | STORE_NAME |  |  | Y | VARCHAR (150) | Contains the name of the store which, along with the store number, identifies the store. |
| 3 | STORE_NAME10 |  |  | Y | VARCHAR (10) | Contains a ten character abbreviation of the store name. |
| 4 | STORE_NAME3 |  |  | Y | VARCHAR (3) | Contains a three character abbreviation of the store name. |
| 5 | STORE_NAME_SECONDARY |  |  |  | VARCHAR (150) | Secondary name of the store. |
| 6 | STORE_CLASS |  |  | Y | VARCHAR (1) | Contains the code letter indicating the class of which the store is a member. Valid values are A through E. |
| 7 | STORE_MGR_NAME |  |  | Y | VARCHAR (120) | Contains the name of the store manager. |
| 8 | STORE_OPEN_DATE |  |  | Y | Date | Contains the date on which the store opened. |
| 9 | STORE_CLOSE_DATE |  |  |  | Date | Contains the date on which the store closed. |
| 10 | ACQUIRED_DATE |  |  |  | Date | Contains the date on which the store was acquired. |
| 11 | REMODEL_DATE |  |  |  | Date | Contains the date on which the store was last remodeled. |
| 12 | FAX_NUMBER |  |  |  | VARCHAR (20) | Contains the fax number for the store. |
| 13 | PHONE_NUMBER |  |  |  | VARCHAR (20) | Contains the phone number for the store. |
| 14 | EMAIL |  |  |  | VARCHAR (100) | Holds the email address for the location |
| 15 | TOTAL_SQUARE_FT |  |  |  | NUMERIC (8) | Contains the total square footage of the store. |
| 16 | SELLING_SQUARE_FT |  |  |  | NUMERIC (8) | Contains the total square footage of the stores selling area. |
| 17 | LINEAR_DISTANCE |  |  |  | NUMERIC (8) | Holds the total merchandisable space of the location. |
| 18 | VAT_REGION |  | F |  | NUMERIC (4) | Contains the number of the Value Added Tax region in which this store is contained. |
| 19 | VAT_INCLUDE_IND |  |  |  | VARCHAR (1) | Indicates whether or not Value Added Tax will be included in the retail prices for the store. Valid values are Y or N. |
| 20 | STOCKHOLDING_IND |  |  | Y | VARCHAR (1) | This column indicates whether the store can hold stock. In a non-multichannel environment this will always be Y. |
| 21 | CHANNEL_ID |  | F |  | NUMERIC (4) | In a multichannel environment this will contain the channel with which the store is associated. Valid values can be found on the channels table. |
| 22 | STORE_FORMAT |  | F |  | NUMERIC (4) | Contains the number indicating the format of the store. Valid values are found on the store format table. |
| 23 | MALL_NAME |  |  |  | VARCHAR (120) | Contains the name of the mall in which the store is located. |
| 24 | DISTRICT |  | F | Y | NUMERIC (10) | Contains the number of the district in which the store is a member. |
| 25 | TRANSFER_ZONE |  | F |  | NUMERIC (4) | Contains the transfer zone in which the store is located. Valid values are located on the tsfzone table. |
| 26 | DEFAULT_WH |  | F |  | NUMERIC (10) | Contains the number of the warehouse that may be used as the default for creating cross-dock masks. This determines which stores are associated with or sourced from a warehouse. Will hold only virtual warehouses in a multi-channel environment. |
| 27 | STOP_ORDER_DAYS |  |  |  | NUMERIC (3) | Contains the number of days before a store closing that the store will stop accepting orders. This column will be used when the store_close_date is defined. |
| 28 | START_ORDER_DAYS |  |  | Y | NUMERIC (3) | Contains the number of days before the store_open_date that the store will begin accepting orders. |
| 29 | CURRENCY_CODE |  | F | Y | VARCHAR (3) | This field contains the currency code under which the store operates. |
| 30 | LANG |  | F | Y | NUMERIC (6) | This column identifies the language to be used for the given store. |
| 31 | TRAN_NO_GENERATED |  |  | Y | VARCHAR (6) | Contains the level at which unique POS transaction numbers are generated. If the store has one sequence number that is used for all registers, then the value in this column will be S (Store). Otherwise the store has unique sequence numbers for each register and the value in this column will be R (Register). These values are defined on the codes table with a code type of UNQT. |
| 32 | INTEGRATED_POS_IND |  |  | Y | VARCHAR (1) | Indicates whether or not the POS system at the Store is integrated. |
| 33 | ORIG_CURRENCY_CODE |  |  | Y | VARCHAR (3) | holds the original currency of a store after its adopted the Euro as its main operating currency |
| 34 | DUNS_NUMBER |  |  |  | VARCHAR (9) | This field holds the Dun and Bradstreet number to identify the store. |
| 35 | DUNS_LOC |  |  |  | VARCHAR (4) | This field holds the Dun and Bradstreet number to identify the location |
| 36 | SISTER_STORE |  | F |  | NUMERIC (10) | This field will hold a store number which will be used to relate the current store to the historical data of an existing store. |
| 37 | TSF_ENTITY_ID |  | F |  | NUMERIC (10) | Foregin key to the TSF_ENTITY table |
| 38 | ORG_UNIT_ID |  | F |  | NUMERIC (15) | Column will contain the organizational unit ID value. |
| 39 | AUTO_RCV |  |  | Y | VARCHAR (1) | This column will indicate whether the client is allowing automatic receipt for the store. Valid Values are Y (Yes), N (No), D (System Default). Default value should be D. |
| 40 | REMERCH_IND |  |  | Y | VARCHAR (1) | Identifies stores that are undergoing a significant remerchandising effort. Used only when AIP is integrated with RMS. |
| 41 | STORE_TYPE |  |  | Y | VARCHAR (6) | This will indicate whether a particular store is a franchise or company store. |
| 42 | WF_CUSTOMER_ID |  | F |  | NUMERIC (10) | Numeric Id of the customer. |
| 43 | TIMEZONE_NAME |  |  | Y | VARCHAR (64) | Indicates the time zone of the store. For example, 'America/New_York'. |
| 44 | CUSTOMER_ORDER_LOC_IND |  |  |  | VARCHAR (1) | This Column determines whether the location is customer order location or not.If the indicator is Y then the location can be used by OMS for sourcing/ fulfillment or both else it cannot be used.It is enabled only for the company stores . |
| 45 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |
| 46 | CREATE_DATETIME |  |  | Y | Date | This column holds the record creation date. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_STORE|PK||||STORE|ASC|
|STORE_I3|||||SISTER_STORE|ASC|
|STORE_I8|||||DEFAULT_WH|ASC|
|STORE_I4|||||STORE_FORMAT|ASC|
|STORE_I2|||||DISTRICT|ASC|
|STORE_I6|||||TRANSFER_ZONE|ASC|
|STORE_I12|||||ORG_UNIT_ID|ASC|
|STORE_I11|||||CHANNEL_ID|ASC|
|STORE_I1|||||CURRENCY_CODE|ASC|
|STORE_I5|||||TSF_ENTITY_ID|ASC|
|STORE_I10|||||LANG|ASC|
|STORE_I7|||||VAT_REGION|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_STORE_AUTO_RCV_IND|AUTO_RCV in ('Y','N','D')|
||CHK_STORE_INTEGRATED_POS_IND|integrated_pos_ind in ('Y','N')<br>|






|Type|Column / Constraint Name|Details|
|---|---|---|
||CHK_STORE_REMERCH_IND|REMERCH_IND in ('Y','N')<br>|
||CHK_STORE_STOCKHOLDING_IND|STOCKHOLDING_IND in ('Y','N')<br>|
||CHK_STORE_STORE_CLASS|STORE_CLASS IN ('A','B','C','D','E','X')<br>|
||CHK_STORE_STORE_TYPE|STORE_TYPE in ('C','F')<br>|
||CHK_STORE_TRAN_NO_GENERATED|tran_no_generated in ('S','R')<br>|
||CHK_STORE_VAT_INCLUDE_IND|VAT_INCLUDE_IND IN ('Y','N')<br>|
||CHK_STORE_WF_CUSTOMER_ID|(store_type in ('F') and wf_customer_id is not null) or (store_type = 'C' and wf_customer_id is null)<br>|
||CHK_STORE_CUS_ORD_LOC_IND|CUSTOMER_ORDER_LOC_IND IN ('Y', 'N')<br>|
||CHK_STORE_WF_CUS_ORD_LOC_IND|NOT(STORE_TYPE = 'F' AND STOCKHOLDING_IND = 'N' AND CUSTOMER_ORDER_LOC_IND = 'Y')<br>|
|Column Level|VAT_INCLUDE_IND||
||STOCKHOLDING_IND||
||TRAN_NO_GENERATED||
||INTEGRATED_POS_IND||
||AUTO_RCV||
||REMERCH_IND||

---

## Table: STORE_ADD

**Description:** This table contains one row for each new store to be created in the merchandising system.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | STORE | P |  | Y | NUMERIC (10) | Contains the number which uniquely identifies the store. |
| 2 | STORE_NAME |  |  | Y | VARCHAR (150) | Contains the name of the store which, along with the store number, identifies the store. |
| 3 | STORE_NAME10 |  |  | Y | VARCHAR (10) | Contains a ten character abbreviation of the store name. |
| 4 | STORE_NAME3 |  |  | Y | VARCHAR (3) | Contains a three character abbreviation of the store name. |
| 5 | STORE_NAME_SECONDARY |  |  |  | VARCHAR (150) | Secondary name of the store. |
| 6 | STORE_CLASS |  |  | Y | VARCHAR (1) | Contains the code letter indicating the class of which the store is a member. Valid values are A through E. |
| 7 | STORE_MGR_NAME |  |  | Y | VARCHAR (120) | Contains the name of the store manager. |
| 8 | STORE_OPEN_DATE |  |  | Y | Date | Contains the date on which the store opened. |
| 9 | STORE_CLOSE_DATE |  |  |  | Date | Contains the date on which the store closed. |
| 10 | ACQUIRED_DATE |  |  |  | Date | Contains the date on which the store was acquired. |
| 11 | REMODEL_DATE |  |  |  | Date | Contains the date on which the store was last remodeled. |
| 12 | FAX_NUMBER |  |  |  | VARCHAR (20) | Contains the fax number for the store. |
| 13 | PHONE_NUMBER |  |  |  | VARCHAR (20) | Contains the phone number for the store. |
| 14 | EMAIL |  |  |  | VARCHAR (100) | Holds the email address for the location |
| 15 | TOTAL_SQUARE_FT |  |  |  | NUMERIC (8) | Contains the total square footage of the store. |
| 16 | SELLING_SQUARE_FT |  |  |  | NUMERIC (8) | Contains the total square footage of the stores selling area. |
| 17 | LINEAR_DISTANCE |  |  |  | NUMERIC (8) | Holds the total merchandisable space of the location. |
| 18 | VAT_REGION |  | F |  | NUMERIC (4) | Contains the number of the Value Added Tax region in which this store is contained. |
| 19 | VAT_INCLUDE_IND |  |  |  | VARCHAR (1) | Indicates whether or not Value Added Tax will be included in the retail prices for the store. Valid values are Y or N. |
| 20 | STOCKHOLDING_IND |  |  | Y | VARCHAR (1) | This column indicates whether the store can hold stock. In a non-multichannel environment this will always be Y. |
| 21 | CHANNEL_ID |  | F |  | NUMERIC (4) | In a multichannel environment this will contain the channel with which the store is associated. Valid values can be found on the channels table. |
| 22 | STORE_FORMAT |  | F |  | NUMERIC (4) | Contains the number indicating the format of the store. Valid values are found on the store format table. |
| 23 | MALL_NAME |  |  |  | VARCHAR (120) | Contains the name of the mall in which the store is located. |
| 24 | DISTRICT |  | F | Y | NUMERIC (10) | Contains the number of the district in which the store is a member. |
| 25 | TRANSFER_ZONE |  | F |  | NUMERIC (4) | Contains the transfer zone in which the store is located. Valid values are located on the tsfzone table. |
| 26 | DEFAULT_WH |  | F |  | NUMERIC (10) | Contains the number of the warehouse that may be used as the default for creating cross-dock masks. This determines which stores are associated with or sourced from a warehouse. |
| 27 | STOP_ORDER_DAYS |  |  |  | NUMERIC (3) | Contains the number of days before a store closing that the store will stop accepting orders. This column will be used when the store_close_date is defined. |
| 28 | START_ORDER_DAYS |  |  | Y | NUMERIC (3) | Contains the number of days before the store_open_date that the store will begin accepting orders. |
| 29 | CURRENCY_CODE |  | F | Y | VARCHAR (3) | This field contains the currency code under which the store operates. |
| 30 | LANG |  | F | Y | NUMERIC (6) | This column identifies the language to be used for the given store. |
| 31 | COPY_REPL_IND |  |  | Y | VARCHAR (1) | Indicator to determine if replenishment info should be copied to the new store. |
| 32 | LIKE_STORE |  | F |  | NUMERIC (10) | Contains the store in which to copy items to the new store. |
| 33 | PRICE_STORE |  | F |  | NUMERIC (10) | Contains the pricing store in which to copy pricing to the new store. |
| 34 | COST_LOCATION |  |  |  | NUMERIC (10) | Contains the cost location in which to copy cost information to the new store. |
| 35 | TRAN_NO_GENERATED |  |  | Y | VARCHAR (6) | Contains the level at which unique POS transaction numbers are generated. If the store has one sequence number that is used for all registers, then the value in this column will be S (Store). Otherwise the store has unique sequence numbers for each register and the value in this column will be R (Register). These values are defined on the codes table with a code type of UNQT. |
| 36 | INTEGRATED_POS_IND |  |  | Y | VARCHAR (1) | Indicates whether or not the POS system at the Store is integrated. |
| 37 | COPY_ACTIVITY_IND |  |  | Y | VARCHAR (1) | This field indicates if the like stores closing date schedule should be copied in the creation of a new store based on a like store. |
| 38 | COPY_DLVRY_IND |  |  | Y | VARCHAR (1) | This field indicates if the like stores delivery schedule should be copied in the creation of a new store based on a like store. |
| 39 | DUNS_NUMBER |  |  |  | VARCHAR (9) | This field holds the Dun and Bradstreet number to identify the store. |
| 40 | DUNS_LOC |  |  |  | VARCHAR (4) | This field holds the Dun and Bradstreet number to identify the location |
| 41 | SISTER_STORE |  | F |  | NUMERIC (10) | This field will hold a store number which will be used to relate the current store to the historical data of an existing store. |
| 42 | TSF_ENTITY_ID |  | F |  | NUMERIC (10) | Transfer Entity ID |
| 43 | ORG_UNIT_ID |  | F |  | NUMERIC (15) | Column will contain the organizational unit ID value. |
| 44 | AUTO_RCV |  |  | Y | VARCHAR (1) | This column will indicate whether the client is allowing automatic receipt for the store. Valid values are Y (Yes), N (No), D (System Default). Default value is D. |
| 45 | REMERCH_IND |  |  | Y | VARCHAR (1) | Identifies stores that are undergoing a significant remerchandising effort. Used only when AIP is integrated with RMS. |
| 46 | STORE_TYPE |  |  | Y | VARCHAR (6) | This will indicate whether a particular store is a franchise or company store. |
| 47 | WF_CUSTOMER_ID |  |  |  | NUMERIC (10) | Numeric Id of the customer. |
| 48 | TIMEZONE_NAME |  |  | Y | VARCHAR (64) | Indicates the time zone of the store. For example, 'America/New_York'. |
| 49 | CUSTOMER_ORDER_LOC_IND |  |  |  | VARCHAR (1) | This Column determines whether the location is customer order location or not.If the indicator is checked then the location can be used by OMS for sourcing/ fulfillment or both else it |
| 50 | RMS_ASYNC_ID |  |  |  | NUMERIC (15) | A numeric value that identifies an asynchronous process in RMS. The asynchronous process in the context of this table is store creation. One or more stores can be associated to a single RMS_ASYNC_ID. |
| 51 | COPY_CLEARANCE_IND |  |  |  | VARCHAR (1) | Indicates if item is on clearance at the store. Valid values are: Y = Yes, the item is on clearance N = No, the item is not on clearance |
| 52 | PROCESS_MODE |  |  |  | VARCHAR (5) | The mode (ASYNC or BATCH) in which the like-store part of this store needs to be processed. |
| 53 | PROCESS_STATUS |  |  |  | VARCHAR (25) | The status of this store add process. It can have four values 00NEW, 01STOREADD, 02STOREADD_POST and 03LIKESTORE. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_STORE_ADD|PK||||STORE|ASC|
|STORE_ADD_I10|||||LANG|ASC|
|STORE_ADD_I2|||||DISTRICT|ASC|
|STORE_ADD_I14|||||ORG_UNIT_ID|ASC|
|STORE_ADD_I6|||||TRANSFER_ZONE|ASC|
|STORE_ADD_I3|||||SISTER_STORE|ASC|
|STORE_ADD_I12|||||PRICE_STORE|ASC|
|STORE_ADD_I4|||||STORE_FORMAT|ASC|
|STORE_ADD_I13|||||CHANNEL_ID|ASC|
|STORE_ADD_I5|||||TSF_ENTITY_ID|ASC|
|STORE_ADD_I8|||||DEFAULT_WH|ASC|
|STORE_ADD_I7|||||VAT_REGION|ASC|
|STORE_ADD_I1|||||CURRENCY_CODE|ASC|
|STORE_ADD_I11|||||LIKE_STORE|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_STORE_ADD_AUTO_RCV_IND|AUTO_RCV in ('Y','N','D')<br>|
||CHK_STORE_ADD_COPY_ACTIVITY_IN|COPY_ACTIVITY_IND IN ('Y','N')<br>|
||CHK_STORE_ADD_COPY_DLVRY_IND|COPY_DLVRY_IND IN ('Y','N')<br>|






|Type|Column / Constraint Name|Details|
|---|---|---|
||CHK_STORE_ADD_COPY_REPL_IND|COPY_REPL_IND in ('Y','N')<br>|
||CHK_STORE_ADD_INTEGRATED_POS_I|integrated_pos_ind in ('Y','N')<br>|
||CHK_STORE_ADD_REMERCH_IND|REMERCH_IND in ('Y','N')<br>|
||CHK_STORE_ADD_STOCKHOLDING_IND|STOCKHOLDING_IND in ('Y','N')<br>|
||CHK_STORE_ADD_STORE_CLASS|STORE_CLASS IN ('A','B','C','D','E','X')<br>|
||CHK_STORE_ADD_STORE_TYPE|STORE_TYPE in ('C','F')<br>|
||CHK_STORE_ADD_TRAN_NO_GENERATE|tran_no_generated in ('S','R')<br>|
||CHK_STORE_ADD_VAT_INCLUDE_IND|VAT_INCLUDE_IND IN ('Y','N')<br>|
||CHK_STORE_ADD_WF_CUSTOMER_ID|(store_type in ('F') and wf_customer_id is not null) or (store_type = 'C' and wf_customer_id is null)<br>|
||CHK_STORE_ADD_CUS_ORD_LOC_IND|CUSTOMER_ORDER_LOC_IND IN ('Y', 'N')<br>|
||CHK_STORE_ADD_WF_CO_LOC_IND|NOT(STORE_TYPE = 'F' AND STOCKHOLDING_IND = 'N' AND CUSTOMER_ORDER_LOC_IND = 'Y')<br>|
|Column Level|VAT_INCLUDE_IND||
||STOCKHOLDING_IND||
||COPY_REPL_IND||
||TRAN_NO_GENERATED||
||INTEGRATED_POS_IND||
||COPY_ACTIVITY_IND||
||COPY_DLVRY_IND||





|Type|Column / Constraint Name|Details|
|---|---|---|
||AUTO_RCV||
||REMERCH_IND||

---

## Table: STORE_ADD_CFA_EXT

**Description:** This is the custom attribute extension table for the entity STORE_ADD.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | STORE | P | F | Y | NUMERIC (10) | This column holds the Store this extended data is associated with. |
| 2 | GROUP_ID | P |  | Y | NUMERIC (10) | This column holds the attribute group id that this extended data is associated with. The logical business meaning of the VARCHAR_, NUMBER_ and DATE_ columns on this table are determined by the metadata defined for this attribute. |
| 3 | VARCHAR2_1 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_1 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 4 | VARCHAR2_2 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_2 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 5 | VARCHAR2_3 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_3 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 6 | VARCHAR2_4 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_4 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 7 | VARCHAR2_5 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_5 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 8 | VARCHAR2_6 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_6 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 9 | VARCHAR2_7 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_7 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 10 | VARCHAR2_8 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_8 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 11 | VARCHAR2_9 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_9 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 12 | VARCHAR2_10 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_10 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 13 | NUMBER_11 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_11 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 14 | NUMBER_12 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_12 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 15 | NUMBER_13 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_13 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 16 | NUMBER_14 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_14 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 17 | NUMBER_15 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_15 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 18 | NUMBER_16 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_16 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 19 | NUMBER_17 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_17 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 20 | NUMBER_18 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_18 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 21 | NUMBER_19 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_19 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 22 | NUMBER_20 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_20 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 23 | DATE_21 |  |  |  | Date | This column holds data related to the attribute defined on the CFA_ATTRIB table that references DATE_21 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 24 | DATE_22 |  |  |  | Date | This column holds data related to the attribute defined on the CFA_ATTRIB table that references DATE_22 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 25 | DATE_23 |  |  |  | Date | This column holds data related to the attribute defined on the CFA_ATTRIB table that references DATE_23 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 26 | DATE_24 |  |  |  | Date | This column holds data related to the attribute defined on the CFA_ATTRIB table that references DATE_24 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 27 | DATE_25 |  |  |  | Date | This column holds data related to the attribute defined on the CFA_ATTRIB table that references DATE_25 in CFA_ATTRIB.STORAGE_COL_NAME. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_STORE_ADD_CFA_EXT|PK||||STORE|ASC|
||||||GROUP_ID|ASC|

---

## Table: STORE_ADD_L10N_EXT

**Description:** This is the LFAS storage table for the entity STORE_ADD

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | STORE | P | F | Y | NUMERIC (10) | Contains the number which uniquely identifies the store. |
| 2 | L10N_COUNTRY_ID | P | F | Y | VARCHAR (3) | This column holds the country this extended data is associated with. The logical business meaning of the VARCHAR_, NUMBER_ and DATE_ columns on this table are determined by the metadata defined for this country in its localization pack. |
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
|PK_STORE_ADD_L10N_EXT|PK||||STORE|ASC|
||||||L10N_COUNTRY_ID|ASC|
||||||GROUP_ID|ASC|

---

## Table: STORE_ADD_TL

**Description:** This is the translation table for STORE_ADD table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | STORE | P | F | Y | NUMERIC (10) | Contains the number which uniquely identifies the store. |
| 3 | STORE_NAME |  |  | Y | VARCHAR (150) | Contains the name of the store which, along with the store number, identifies the store. |
| 4 | STORE_NAME_SECONDARY |  |  |  | VARCHAR (150) | Secondary name of the store. |
| 5 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 6 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 7 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 8 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_STORE_ADD_TL|PK||||LANG|ASC|
||||||STORE|ASC|

---

## Table: STORE_CFA_EXT

**Description:** This is the custom attribute extension table for the entity STORE.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | STORE | P | F | Y | NUMERIC (10) | This column holds the Store this extended data is associated with. |
| 2 | GROUP_ID | P |  | Y | NUMERIC (10) | This column holds the attribute group id that this extended data is associated with. The logical business meaning of the VARCHAR_, NUMBER_ and DATE_ columns on this table are determined by the metadata defined for this attribute. |
| 3 | VARCHAR2_1 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_1 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 4 | VARCHAR2_2 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_2 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 5 | VARCHAR2_3 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_3 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 6 | VARCHAR2_4 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_4 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 7 | VARCHAR2_5 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_5 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 8 | VARCHAR2_6 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_6 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 9 | VARCHAR2_7 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_7 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 10 | VARCHAR2_8 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_8 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 11 | VARCHAR2_9 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_9 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 12 | VARCHAR2_10 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_10 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 13 | NUMBER_11 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_11 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 14 | NUMBER_12 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_12 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 15 | NUMBER_13 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_13 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 16 | NUMBER_14 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_14 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 17 | NUMBER_15 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_15 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 18 | NUMBER_16 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_16 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 19 | NUMBER_17 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_17 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 20 | NUMBER_18 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_18 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 21 | NUMBER_19 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_19 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 22 | NUMBER_20 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_20 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 23 | DATE_21 |  |  |  | Date | This column holds data related to the attribute defined on the CFA_ATTRIB table that references DATE_21 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 24 | DATE_22 |  |  |  | Date | This column holds data related to the attribute defined on the CFA_ATTRIB table that references DATE_22 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 25 | DATE_23 |  |  |  | Date | This column holds data related to the attribute defined on the CFA_ATTRIB table that references DATE_23 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 26 | DATE_24 |  |  |  | Date | This column holds data related to the attribute defined on the CFA_ATTRIB table that references DATE_24 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 27 | DATE_25 |  |  |  | Date | This column holds data related to the attribute defined on the CFA_ATTRIB table that references DATE_25 in CFA_ATTRIB.STORAGE_COL_NAME. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_STORE_CFA_EXT|PK||||STORE|ASC|
||||||GROUP_ID|ASC|

---

## Table: STORE_EXPORT_STG

**Description:** This is table is a staging table for store records as they wait to be extracted. This table is automatically inserted into, as records are processed by Oracle Retail. This table will be scanned by a daily batch job to extract new, updated and deleted RMS store information.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SEQ_NO | P |  | Y | NUMERIC (15) | The sequence in which the records are placed in the table. |
| 2 | STORE |  |  | Y | NUMERIC (10) | Contains the number that uniquely identifies the store. |
| 3 | ADDR_KEY |  |  |  | NUMERIC (11) | Unique number that distinguish between addresses. |
| 4 | ADDR_TYPE |  |  |  | VARCHAR (2) | This column indicates the type for the address. |
| 5 | PRIMARY_ADDR_IND |  |  |  | VARCHAR (1) | This column indicates whether the address is the primary address for the address type. Valid values are Y and N. |
| 6 | ACTION_TYPE |  |  | Y | VARCHAR (15 BYTE) | Indicates if the organizational hierarchy has been added, changed or deleted. Valid values are 'storecre', 'storemod', 'storedel', 'storedtlcre', 'storedtlmod', and 'storedtldel'. |
| 7 | BASE_EXTRACTED_IND |  |  | Y | VARCHAR (1 BYTE) | Indicates whether the record has been extracted or not. Upon record insert, this will be set to 'N'. After running the batch job, this will then be set to 'Y'. |
| 8 | CUSTOM1_EXTRACTED_IND |  |  |  | VARCHAR (1 BYTE) | Indicates whether the record has been extracted or not for a custom extraction. |
| 9 | CUSTOM2_EXTRACTED_IND |  |  |  | VARCHAR (1 BYTE) | Indicates whether the record has been extracted or not for a custom extraction. |
| 10 | CUSTOM3_EXTRACTED_IND |  |  |  | VARCHAR (1 BYTE) | Indicates whether the record has been extracted or not for a custom extraction. |
| 11 | CUSTOM4_EXTRACTED_IND |  |  |  | VARCHAR (1 BYTE) | Indicates whether the record has been extracted or not for a custom extraction. |
| 12 | PROCESS_ID |  |  |  | NUMERIC (15) | Process ID where the record belongs to. |
| 13 | TRANSACTION_DATETIME |  |  | Y | Date (7) | Time of record creation. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_STORE_EXPORT_STG|PK||||SEQ_NO|ASC|

---

## Table: STORE_FORMAT

**Description:** This table contains one row for each valid store type.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | STORE_FORMAT | P |  | Y | NUMERIC (4) | Contains the number which uniquely identifies the store format. |
| 2 | FORMAT_NAME |  |  | Y | VARCHAR (60) | Contains the name or description of the store format. |
| 3 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |
| 4 | CREATE_DATETIME |  |  | Y | Date | This column holds the record creation date. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_STORE_FORMAT|PK||||STORE_FORMAT|ASC|

---

## Table: STORE_FORMAT_TL

**Description:** This is the translation table for STORE_FORMAT table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | STORE_FORMAT | P | F | Y | NUMERIC (4) | Contains the number which uniquely identifies the store format. |
| 3 | FORMAT_NAME |  |  | Y | VARCHAR (60) | Contains the name or description of the store format. |
| 4 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 6 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 7 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_STORE_FORMAT_TL|PK||||LANG|ASC|
||||||STORE_FORMAT|ASC|

---

## Table: STORE_GRADE

**Description:** This table contains store grade information. Each store grade within a group contains one ore more stores.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | STORE_GRADE_GROUP_ID | P | F | Y | NUMERIC (8) | This column holds the store grade group identification number associated with the store grade. |
| 2 | STORE_GRADE | P |  | Y | VARCHAR (120) | This column holds the store grades within each store grade group. |
| 3 | COMMENTS |  |  |  | VARCHAR (2000) | This column holds any comments entered by the buyer describing each store grade entered. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_STORE_GRADE|PK||||STORE_GRADE_GROUP_ID|ASC|
||||||STORE_GRADE|ASC|

### Constraints

|Type|Column / Constraint<br>Name|Details|
|---|---|---|
|Table Level|CHK_STORE_GRADE_UPPER|STORE_GRADE = UPPER(STORE_GRADE)|
|Column Level|STORE_GRADE||

---

## Table: STORE_GRADE_DIST_TEMP

**Description:** This temporary table is used by the store grade distribution object to temporarily store records before writing them back out to the calling form appropriately.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ORDER_NO |  |  |  | NUMERIC (12) | This field contains the unique number representing the order. |
| 2 | CONTRACT_NO |  |  |  | NUMERIC (6) | This field contains the unique number representing the contract. |
| 3 | STORE_GRADE_GROUP_ID |  |  | Y | NUMERIC (8) | This field contains the store grade group specified for distribution. |
| 4 | STORE_GRADE |  |  | Y | VARCHAR (120) | This field contains the store grade specified for distribution. |
| 5 | DIST_QTY |  |  |  | NUMERIC (12,4) | This field contains the quantity that should be distributed for the specified store grade. |
| 6 | DIST_PCT |  |  |  | NUMERIC (12,4) | This field contains the percentage that should be distributed for the specified store grade. |
| 7 | DIST_RATIO |  |  |  | NUMERIC (12,4) | This field contains the ratio that should be distributed for the specified store grade. |

---

## Table: STORE_GRADE_GROUP

**Description:** This table contains store grade group information. It is the header table for store grades. A store grade group is a mechanism to group stores together. A store grade group will consist of multiple store grades, each containing many stores.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | STORE_GRADE_GROUP_ID | P |  | Y | NUMERIC (8) | This column holds the unique store grade group identification number. The id is a unique system generated number. |
| 2 | STORE_GRADE_GROUP_DESC |  |  | Y | VARCHAR (120) | This column will hold the store group description associated with the identification number. |
| 3 | BUYER |  | F | Y | NUMERIC (4) | This column holds the identification number of the buyer who created the store grade group. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_STORE_GRADE_GROUP|PK||||STORE_GRADE_GROUP_ID|ASC|
|STORE_GRADE_GROUP_I1|||||BUYER|ASC|

---

## Table: STORE_GRADE_GROUP_TL

**Description:** This is the translation table for STORE_GRADE_GROUP table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | STORE_GRADE_GROUP_ID | P | F | Y | NUMERIC (8) | This column holds the unique store grade group identification number. The id is a unique system generated number. |
| 3 | STORE_GRADE_GROUP_DESC |  |  | Y | VARCHAR (120) | This column will hold the store group description associated with the identification number. |
| 4 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 6 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 7 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_STORE_GRADE_GROUP_TL|PK||||LANG|ASC|
||||||STORE_GRADE_GROUP_ID|ASC|

---

## Table: STORE_GRADE_STORE

**Description:** This table contains a record for each store grade group.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | STORE_GRADE_GROUP_ID | P | F | Y | NUMERIC (8) | This column holds the store grade_group associated with the stores. |
| 2 | STORE | P | F | Y | NUMERIC (10) | This column holds the store numbers which exist in the store grade groups. A store can exist in multiple store grade groups, but only in one store grade per each store grade group. It is not required that all stores belong to a store grade within every store grade group. |
| 3 | STORE_GRADE |  | F | Y | VARCHAR (120) | This column holds the store grades within each store grade group. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_STORE_GRADE_STORE|PK||||STORE_GRADE_GROUP_ID|ASC|
||||||STORE|ASC|
|STORE_GRADE_STORE_I2|||||STORE_GRADE_GROUP_ID|ASC|
||||||STORE_GRADE|ASC|
|STORE_GRADE_STORE_I1|||||STORE|ASC|

---

## Table: STORE_HIERARCHY

**Description:** This table contains one row for each store in the system, along with the organizational hierarhcy information. This table is updated as entities move their positions within the hierarchy. This table exists for performance purposes only.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | COMPANY | P |  | Y | NUMERIC (4) | This field contains the company that the store belongs to. |
| 2 | CHAIN | P |  | Y | NUMERIC (10) | This field contains the chain that the store belongs to. |
| 3 | AREA | P |  | Y | NUMERIC (10) | This field contains the area that the store belongs to. |
| 4 | REGION | P |  | Y | NUMERIC (10) | This field contains the region that the field belongs to. |
| 5 | DISTRICT | P |  | Y | NUMERIC (10) | This field contains the district that the store belongs to. |
| 6 | STORE | P |  | Y | NUMERIC (10) | This field contains the store. Each store will be represented on this table. |
| 7 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |
| 8 | CREATE_DATETIME |  |  | Y | Date | This column holds the record creation date. |

---

## Table: STORE_L10N_EXT

**Description:** This is the LFAS storage table for the entity STORE

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | STORE | P | F | Y | NUMERIC (10) | Contains the number which uniquely identifies the store. |
| 2 | L10N_COUNTRY_ID | P | F | Y | VARCHAR (3) | This column holds the country this extended data is associated with. The logical business meaning of the VARCHAR_, NUMBER_ and DATE_ columns on this table are determined by the metadata defined for this country in its localization pack. |
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
|PK_STORE_L10N_EXT|PK||||STORE|ASC|
||||||L10N_COUNTRY_ID|ASC|
||||||GROUP_ID|ASC|

---

## Table: STORE_MFQUEUE

**Description:** This table tracks changes in RMS that need to be published to the RIB. It is populated by calls to ADDTOQ. It is updated and deleted from by calls to GETNXT and PUB_RETRY.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SEQ_NO | P |  | Y | NUMERIC (15) | The sequence in which the records was placed in the STORE_MFQUEUE. Used to order the publication of messages to the RIB. |
| 2 | STORE |  |  | Y | NUMERIC (10) | Functional key that uniquely identifies the change to the store table that caused the record to be written to the STORE_MFQUEUE. Store uniquely identifies a store |
| 3 | ADDR_KEY |  |  |  | NUMERIC (11) | Functional key that uniquely identifies the change to the address table that caused the record to be written to the STORE_MFQUEUE. Addr_key uniquely identifies an address. |
| 4 | MESSAGE_TYPE |  |  | Y | VARCHAR (15) | Describes the action in RMS that is causing the message to be published to the RIB. |
| 5 | FAMILY |  |  | Y | VARCHAR (30) | The functional area that this transaction belongs to, in this case, store. |
| 6 | CUSTOM_MESSAGE_TYPE |  |  |  | VARCHAR (1) | Not used by RMS |
| 7 | PUB_STATUS |  |  | Y | VARCHAR (1) | Set to Unpublished upon insertion into the table. Set to Hospital when a non-fatal error is encountered during the publication process. |
| 8 | TRANSACTION_NUMBER |  |  |  | NUMERIC (10) | Business transaction key |
| 9 | TRANSACTION_TIME_STAMP |  |  |  | Date | Time of record creation. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_STORE_MFQUEUE|PK||||SEQ_NO|ASC|

---

## Table: STORE_ORDERS

**Description:** This table is used to hold store order requests. These store order requests will be used during the replenishment process to determine what the recommended order quantity should be, depending on where the need_date falls in the replenishment schedule.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  | F | Y | VARCHAR (25) | Unique alphanumeric value that identifies the item to be requested. |
| 2 | STORE |  | F | Y | NUMERIC (10) | Number of the store that is requesting the item. |
| 3 | NEED_DATE |  |  | Y | Date | The date that the store needs the item by. |
| 4 | NEED_QTY |  |  | Y | NUMERIC (12,4) | The number of items that is being requested. This field is stored in the standard unit of measure. |
| 5 | PROCESSED_DATE |  |  |  | Date | The date that the record was processed by replenishment. |
| 6 | WF_ORDER_NO |  | F |  | NUMERIC (10) | This new column will contain the wf order no, if any, for the associated combination of item/location/wf need date. This is a null-able column. |
| 7 | WF_ORDER_LINE_NO |  | F |  | NUMERIC (20) | This column references the WF_ORDER_LINE_NO from WF_ORDER_DETAIL table. |
| 8 | DELIVERY_SLOT_ID |  | F |  | VARCHAR (15) | This column specifies when the store requested quantity is needed at the store. |
| 9 | ROQ_EXTRACTED_IND |  |  | Y | VARCHAR (1) | This column specifies whether the need quantity of the store order has been extracted and transfer has been created. Default value is N |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|UK_STORE_ORDERS|UK||||ITEM|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
||||||STORE|ASC|
||||||NEED_DATE|ASC|
||||||DELIVERY_SLOT_ID|ASC|
|STORE_ORDERS_I1|||||NEED_DATE|ASC|
|STORE_ORDERS_I2|||||DELIVERY_SLOT_ID|ASC|
|STORE_ORDERS_I3|UN||||WF_ORDER_NO|ASC|
||||||WF_ORDER_LINE_NO|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_STOR_ORDERS_ROQ_EXTRAC_IND|ROQ_EXTRACTED_IND IN ('Y','N')<br>|
|Column Level|ROQ_EXTRACTED_IND||

---

## Table: STORE_PUB_INFO

**Description:** This table helps the publication of store. It does this by tracking the state of the store and holding any information that can be populated at the header level and used in detail level publication.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | STORE | P |  | Y | NUMERIC (10) | This is the business object id to publish by. They uniquely identify the row on the store table. |
| 2 | PUBLISHED |  |  | Y | VARCHAR (1) | indicates whether or not the transaction has been initially published. Set to N upon insertion into the table. When the entire transaction is published, it is set to Y. If some of the details in the transaction are published, but some are not, this indicator is set to I (in progress). |
| 3 | STORE_TYPE |  |  | Y | VARCHAR (6) | This column holds the type of store. Valid values are C - Company and F - Franchise. |
| 4 | PRICING_LOC |  |  |  | NUMERIC (10) | Contains the pricing location used to set up pricing for the store |
| 5 | PRICING_LOC_CURR |  |  |  | VARCHAR (3) | Contains the currency code for the pricing location |
| 6 | STOCKHOLDING_IND |  |  | Y | VARCHAR (1) | This column indicates whether the store can hold stock. In a non-multichannel environment this will always be Y. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_STORE_PUB_INFO|PK||||STORE|ASC|

---

## Table: STORE_TL

**Description:** This is the translation table for STORE table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | STORE | P | F | Y | NUMERIC (10) | Contains the number which uniquely identifies the store. |
| 3 | STORE_NAME |  |  | Y | VARCHAR (150) | Contains the name of the store which, along with the store number, identifies the store. |
| 4 | STORE_NAME_SECONDARY |  |  |  | VARCHAR (150) | Secondary name of the store. |
| 5 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 6 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 7 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 8 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_STORE_TL|PK||||LANG|ASC|
||||||STORE|ASC|

---

## Table: VEHICLE_ROUND

**Description:** this table contains vehicle rounding information. Given a non-integer number of vehicle needed to fulfill an order, it is used to determine the number of whole vehicles that will be used for vendor constraint rounding. For example, if the low and high value for a vehicle quantity of 2 is 2.20 and 3.29, respectively, any order quantity that needs a number of vehicles that falls between 2.20 and 3.29 will result in the order being scaled to fill 2 vehicles. If there are numeric ranges not covered, the program that references this table will assume standard 50% rounding rules. For example, 10.5 would be rounded to 11 and 10.49 would be rounded to 10.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LOW_VALUE | P |  | Y | NUMERIC (12,4) | Contains the low value of the vehicle range. A vehicle quantity greater than or equal to the low value will be rounded to the associated vehicle |
| 2 | HIGH_VALUE | P |  | Y | NUMERIC (12,4) | Contains the high value of the vehicle range. A vehicle quantity less than or equal to the high value will be rounded to the associated vehicle quantity. |
| 3 | VEHICLE_QTY |  |  | Y | NUMERIC (3) | Contains the quantity of whole vehicles. A vehicle quantity between the low and high values will be rounded to this quantity |

---

## Table: WALK_THROUGH_STORE

**Description:** Holds the walk-through store(s) for a store. During the receiving process, goods may come into the receiving area shared by multiple walk-thru stores. If store A is designated as walk-through store for store B, the reverse is not necessarily true.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | STORE | P | F | Y | NUMERIC (10) | Contains a store number which has assigned one or more walk thru store. |
| 2 | WALK_THROUGH_STORE | P | F | Y | NUMERIC (10) | Contains walk thru store number. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_WALK_THROUGH_STORE|PK||||STORE|ASC|
||||||WALK_THROUGH_STORE|ASC|
|WALK_THROUGH_STORE_I1|||||WALK_THROUGH_STORE|ASC|

---

## Table: WH

**Description:** This table contains one row for each warehouse within the company. A warehouse can be either a physical warehouse or a virtual warehouse. Internal finishers are also held on this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | WH | P |  | Y | NUMERIC (10) | Contains the number which uniquely identifies the warehouse. The wh table stores all warehouses in the system. Both virtual and physical warehouses will be stored on this table. The addition of the new column, physical_wh, helps determine which warehouses are physical and which are virtual. All physical warehouses will have a physical_wh column value equal to their wh number. Virtual warehouses will have a valid physical warehouse in this column. |
| 2 | WH_NAME |  |  | Y | VARCHAR (150) | Contains the name of the warehouse which, along with the warehouse number, identifies the warehouse. |
| 3 | WH_NAME_SECONDARY |  |  |  | VARCHAR (150) | Secondary name of the warehouse. |
| 4 | EMAIL |  |  |  | VARCHAR (100) | Holds the email address for the location |
| 5 | VAT_REGION |  | F |  | NUMERIC (4) | warehouse is located. |
| 6 | ORG_HIER_TYPE |  |  |  | NUMERIC (4) | Contains the organization type that will be used in reporting purposes for the warehouse. The type comes from the organizational hierarchy. Valid values are: 1 = Company 10 = Chain 20 = Area 30 = Region 40 = District 50 = Store |
| 7 | ORG_HIER_VALUE |  |  |  | NUMERIC (10) | Contains the code associated with the specific organizational hierarchy type. Valid values include the company number, chain number, area number, etc. |
| 8 | CURRENCY_CODE |  | F | Y | VARCHAR (3) | This field contains the currency code under which the warehouse operates. |
| 9 | PHYSICAL_WH |  | F | Y | NUMERIC (10) | This column will contain the number of the physical warehouse that is assigned to the virtual warehouse. |
| 10 | PRIMARY_VWH |  | F |  | NUMERIC (10) | This field holds the virtual warehouse that will used as the basis for all transactions for which only a physical warehouse and not a virtual warehouse has not been specified. |
| 11 | CHANNEL_ID |  | F |  | NUMERIC (4) | This column will contain the channel for which the virtual warehouse will be assigned. |
| 12 | STOCKHOLDING_IND |  |  | Y | VARCHAR (1) | This column will indicate if the warehouse is a stock holding location. In a non-multichannel environment, this will always be Y. In a multichannel environment it will be N for a physical warehouse and Y for a virtual warehouse. |
| 13 | BREAK_PACK_IND |  |  | Y | VARCHAR (1) | Indicates whether or not the warehouse is capable of distributing less than the supplier case quantity. Valid values are : Y or N. |
| 14 | REDIST_WH_IND |  |  | Y | VARCHAR (1) | Indicates that the warehouse is a Re-Distribution warehouse. Used as a location on Purchase Orders in place of actual locations that are unknown at the time of Purchase Order creation and approval. This value allows the Redistribution Report to identify orders requiring redistribution. A Warehouse with this indicator will not be limited in any RMS transactions. Valid values are Y or N. |
| 15 | DELIVERY_POLICY |  |  | Y | VARCHAR (6) | Contains the delivery policy of the warehouse. Next Day indicates that the if a location is closed, the warehouse will deliver on the next day. Next Valid Delivery Day indicates that the warehouse will wait until the next scheduled delivery day before delivering. Valid values come from the DLVY code on code_head/code_detail. |
| 16 | RESTRICTED_IND |  |  | Y | VARCHAR (1) | Indicator used to restrict virtual warehouses from receiving stock during an inbound type transaction (ex. positive SOH inventory adjustment, PO over-receipt) when stock needs to be prorated across virtual warehouses within a physical warehouse because a virtual warehouse in |
| 17 | PROTECTED_IND |  |  | Y | VARCHAR (1) | Indicator used to determine if the virtual warehouse is affected last in transactions where inventory is removed or affected first in short-shipment type transactions where inventory is being added. The indicator will be used in any outbound or inventory removal type transactions (ex. RTVs, negative SOH inventory adjustments, etc.) when the system has to distribute the transaction quantity across virtual warehouses within a physical warehouse either because a virtual warehouse has not been specified or couldnt be derived or if a virtual warehouse doesnt have enough stock to cover the transaction quantity and stock needs to be pulled from other virtual warehouse within the physical warehouse. The indicator will also be used for inbound type transactions where there is some sort of short-shipment ex. a short-shipment for a PO). The indicator will determine which virtual warehouses will have their order quantity fulfilled first with the receipt quantity. Note that this indicator does not guarantee that stock will not be pulled from the virtual warehouse, it is only used to ensure that the virtual warehouse is affected last. This indicator will only be used in a multi-channel environment. It is always set to No in a single channel environment. |
| 18 | FORECAST_WH_IND |  |  | Y | VARCHAR (1) | This indicator determines if a warehouse is forecastable. The intent of this indicator is to restrict the information being sent to RDF against which to generate forecasts. |
| 19 | ROUNDING_SEQ |  |  |  | NUMERIC (10) | This column determines which virtual warehouses within a physical warehouse should be rounded together as well as determining which virtual warehouse receives the additional stock or decreased stock due to rounding. This value will be a virtual warehouse number. All warehouses will the same rounding seq number will be rounded together with the warehouse that equals the rounding seq receiving any extra stock. |
| 20 | REPL_IND |  |  | Y | VARCHAR (1) | This indicator determines if a warehouse is replenishable. |
| 21 | REPL_WH_LINK |  |  |  | NUMERIC (10) | This field holds the replenishable warehouse that is linked to this virtual |
| 22 | REPL_SRC_ORD |  |  |  | NUMERIC (1) | This field contains the order from which the inventory is sourced from the linked warehouses. |
| 23 | IB_IND |  |  | Y | VARCHAR (1) | This field indicates if the warehouse is an investment buy warehouse. |
| 24 | IB_WH_LINK |  |  |  | NUMERIC (10) | This field contains the investment buy warehouse that is linked to the virtual warehouse. This link implies that the virtual warehouse is included in the net inventory calculations for the investment buy warehouse. |
| 25 | AUTO_IB_CLEAR |  |  | Y | VARCHAR (1) | This indicator determines if the investment buys inventory should be automatically transferred to the turn (replenishable) warehouse when an order is received by the turn warehouse. |
| 26 | DUNS_NUMBER |  |  |  | VARCHAR (9) | This field holds the Dun and Bradstreet number to identify the warehouse |
| 27 | DUNS_LOC |  |  |  | VARCHAR (4) | This field holds the Dun and Bradstreet number to identify the location |
| 28 | TSF_ENTITY_ID |  | F |  | NUMERIC (10) | ID of the transfer entity with which this warehouse is associated. Valid values are found on the TSF_ENTITY table. A transfer entity is a group of locations that share legal requirements around product management. |
| 29 | FINISHER_IND |  |  | Y | VARCHAR (1) | Yes/No value which indicates if this virtual warehouse is an internal finisher. |
| 30 | INBOUND_HANDLING_DAYS |  |  | Y | NUMERIC (2) | Warehouse inbound handling days are defined as the number of days that the warehouse requires to receive any item and get it to the shelf so that it is ready to pick. |
| 31 | ORG_UNIT_ID |  | F |  | NUMERIC (15) | this column will hold the oracle oraganizational unit id value. |
| 32 | VWH_TYPE |  |  |  | VARCHAR (6) | This attribute will be included in the location downloads to AIP. |
| 33 | ORG_ENTITY_TYPE |  |  | Y | VARCHAR (1) | This is the new column that will specify if the warehouse is a legal entity (Importer, Exporter) or a regular warehouse. Valid values are: R - regular warehouse (including finisher); M - importer; X - exporter. Default value is R. |
| 34 | CUSTOMER_ORDER_LOC_IND |  |  |  | VARCHAR (1) | This Column determines if the location is customer order location or not, i.e. if the indicator is checked then the location can be used by OMS for sourcing/ fulfillment or both else it cannot be used. It is enabled only for virtual warehouses. For a physical warehouse, this column would be NULL. For virtual warehouses, the valid values are 'Y' or 'N'. |
| 35 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |
| 36 | CREATE_DATETIME |  |  | Y | Date | This column holds the record creation date. |
| 37 | DEFAULT_WH |  |  |  | NUMERIC (10) | This field contains the default warehouse linked to the virtual warehouse. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_WH|PK||||WH|ASC|
|WH_I7|||||PRIMARY_VWH|ASC|
|WH_I4|||||VAT_REGION|ASC|
|WH_I5|||||CHANNEL_ID|ASC|
|WH_I8|||||ORG_UNIT_ID|ASC|
|WH_I1|||||TSF_ENTITY_ID|ASC|
|WH_I2|||||CURRENCY_CODE|ASC|
|WH_I6|||||PHYSICAL_WH|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_WH_AUTO_IB_CLEAR|AUTO_IB_CLEAR in ('Y','N')<br>|
||CHK_WH_BREAK_PACK_IND|BREAK_PACK_IND IN ('Y','N')<br>|
||CHK_WH_CUS_ORD_LOC_IND|((WH=PHYSICAL_WH and CUSTOMER_ORDER_LOC_IND IS NULL) OR (WH!=PHYSICAL_WH and ((ORG_ENTITY_TYPE= 'R' AND<br>FINISHER_IND= 'N'))and CUSTOMER_ORDER_LOC_IND IS NOT NULL and CUSTOMER_ORDER_LOC_IND IN ('Y','N')) OR (WH!=PHYSICAL_WH<br>and (ORG_ENTITY_TYPE IN ('M','X') OR FINISHER_IND= 'Y') and CUSTOMER_ORDER_LOC_IND IS NOT NULL and<br>CUSTOMER_ORDER_LOC_IND='N') )<br>|
||CHK_WH_DELIVERY_POLICY|DELIVERY_POLICY IN ('NEXT','NDD')<br>|
||CHK_WH_FINISHER_IND|FINISHER_IND IN ('Y','N')<br>|
||CHK_WH_FORECAST_WH_IND|FORECAST_WH_IND in ('Y','N')<br>|
||CHK_WH_IB_IND|IB_IND in ('Y','N')<br>|
||CHK_WH_ORG_ENTITY_TYPE|ORG_ENTITY_TYPE in ('R', 'M', 'X')<br>|
||CHK_WH_ORG_HIER_TYPE|ORG_HIER_TYPE IN (1,10,20,30,40,50)<br>|
||CHK_WH_REDIST_WH_IND|REDIST_WH_IND in ('Y','N')<br>|
||CHK_WH_REPL_IND|REPL_IND in ('Y','N')<br>|
||CHK_WH_STOCKHOLDING_IND|STOCKHOLDING_IND in ('Y','N')<br>|
||CHK_WH_VWH_TYPE|vwh_type in ('XD_RG','XD_GS','CS_RG','CS_NT')|
|Column Level|ORG_HIER_TYPE||
||STOCKHOLDING_IND||
||BREAK_PACK_IND||





|Type|Column / Constraint Name|Details|
|---|---|---|
||DELIVERY_POLICY||
||REPL_IND||
||IB_IND||
||AUTO_IB_CLEAR||
||FINISHER_IND||
||ORG_ENTITY_TYPE||

---

## Table: WH_ADD

**Description:** This is a temporary table that will store warehouse pricing location information used in the new whadd.pc batch program. The data on this table will be purged when whadd.pc batch program is run.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | WH | P | F | Y | NUMERIC (10) | Warehouse number of the newly created warehouse. |
| 2 | WH_CURRENCY |  | F | Y | VARCHAR (3) | The currency code of the new warehouse. |
| 3 | PRICING_LOCATION |  |  | Y | NUMERIC (10) | The location from which pricing records will be copied. |
| 4 | PRICING_LOC_CURR |  | F | Y | VARCHAR (3) | The currency code of the pricing location. |
| 5 | RMS_ASYNC_ID |  |  |  | NUMERIC (15) | A numeric value that identifies an asynchronous process RMS. The asynchronous process in the context of this table is warehouse creation. One of more warehouses can be associated to a single RMS_ASYNC_ID. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_WH_ADD|PK||||WH|ASC|
|WH_ADD_I1|||||WH_CURRENCY|ASC|
|WH_ADD_I2|||||PRICING_LOC_CURR|ASC|

---

## Table: WH_CFA_EXT

**Description:** This is the custom attribute extension table for the entity WH.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | WH | P | F | Y | NUMERIC (10) | This column holds the Warehouse this extended data is associated with. |
| 2 | GROUP_ID | P |  | Y | NUMERIC (10) | This column holds the attribute group id that this extended data is associated with. The logical business meaning of the VARCHAR_, NUMBER_ and DATE_ columns on this table are determined by the metadata defined for this attribute. |
| 3 | VARCHAR2_1 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_1 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 4 | VARCHAR2_2 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_2 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 5 | VARCHAR2_3 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_3 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 6 | VARCHAR2_4 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_4 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 7 | VARCHAR2_5 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_5 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 8 | VARCHAR2_6 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_6 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 9 | VARCHAR2_7 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_7 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 10 | VARCHAR2_8 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_8 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 11 | VARCHAR2_9 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_9 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 12 | VARCHAR2_10 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_10 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 13 | NUMBER_11 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_11 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 14 | NUMBER_12 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_12 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 15 | NUMBER_13 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_13 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 16 | NUMBER_14 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_14 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 17 | NUMBER_15 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_15 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 18 | NUMBER_16 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_16 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 19 | NUMBER_17 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_17 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 20 | NUMBER_18 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_18 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 21 | NUMBER_19 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_19 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 22 | NUMBER_20 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_20 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 23 | DATE_21 |  |  |  | Date | This column holds data related to the attribute defined on the CFA_ATTRIB table that references DATE_21 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 24 | DATE_22 |  |  |  | Date | This column holds data related to the attribute defined on the CFA_ATTRIB table that references DATE_22 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 25 | DATE_23 |  |  |  | Date | This column holds data related to the attribute defined on the CFA_ATTRIB table that references DATE_23 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 26 | DATE_24 |  |  |  | Date | This column holds data related to the attribute defined on the CFA_ATTRIB table that references DATE_24 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 27 | DATE_25 |  |  |  | Date | This column holds data related to the attribute defined on the CFA_ATTRIB table that references DATE_25 in CFA_ATTRIB.STORAGE_COL_NAME. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_WH_CFA_EXT|PK||||WH|ASC|
||||||GROUP_ID|ASC|

---

## Table: WH_DEPT

**Description:** This table will hold data that may be associated with a single warehouse or warehouse/department combination

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | WH | P | F | Y | NUMERIC (10) | This column will contain the virtual warehouse associated with the Investment Buy setup data |
| 2 | SEQ_NO | P |  | Y | NUMERIC (6) | This column will contain the sequence number that uniquely identifies the record when combined with the WH column. |
| 3 | DEPT |  | F |  | NUMERIC (4) | This column will contain the department associated with the Investment Buy setup data. This column is not required as the table will also support the entry of warehouse-level data for which a department will not be specified. |
| 4 | COST_WH_STORAGE_MEAS |  |  |  | VARCHAR (6) | The type of the whs stroage cost. |
| 5 | COST_WH_STORAGE |  |  |  | NUMERIC (20,4) | This column will contain the cost of warehouse storage, expressed in weekly cost per the unit of measure specified in COST_WH_STORAGE_UOM. This value will be held in the currency type held in the CURRENCY_CODE column. |
| 6 | COST_WH_STORAGE_UOM |  | F |  | VARCHAR (4) | This column will contain the unit of measure to which the cost of warehouse storage is applicable. This unit of measure may only be pallet or from the volume class. |
| 7 | COST_OUT_STORAGE_MEAS |  |  |  | VARCHAR (6) | The type of the outside stroage cost. |
| 8 | COST_OUT_STORAGE |  |  |  | NUMERIC (20,4) | This column will contain the cost of outside storage, expressed in weekly cost per the unit of measure specified in COST_OUT_STORAGE_UOM. Outside storage will be used when the regular warehouse is full or if no |
| 9 | COST_OUT_STORAGE_UOM |  | F |  | VARCHAR (4) | This column will contain the unit of measure to which the cost of outside storage is applicable. This unit of measure may only be pallet or from the volume class. |
| 10 | STORAGE_TYPE |  |  | Y | VARCHAR (6) | This column will indicate whether cost_wh_storage or cost_out_storage should be used in the Investment Buy calculation. Its value will be either W to indicate that cost_wh_storage should be used, or O to indicate that cost_out_storage should be used. |
| 11 | MAX_WEEKS_SUPPLY |  |  | Y | NUMERIC (3) | This column will contain the maximum weeks of supply that should be considered for the specific department/warehouse. The Investment Buy calculation will never recommend an order quantity which would cause the warehouse to have more stock than is forecasted to be issued for the number of weeks contained in the column. |
| 12 | TARGET_ROI |  |  | Y | NUMERIC (12,4) | This column will contain the return on investment that must be met or exceeded if the Investment Buy calculation is to recommend an order quantity. |
| 13 | COST_MONEY |  |  | Y | NUMERIC (12,4) | - This column will contain the cost of money for the specific warehouse or warehouse/department, being defined as the annualized percentage cost to borrow capital for investing. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_WH_DEPT|PK||||WH|ASC|
||||||SEQ_NO|ASC|
|WH_DEPT_I4|||||COST_OUT_STORAGE_UOM|ASC|
|WH_DEPT_I2|||||DEPT|ASC|
|WH_DEPT_I1|||||WH|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
||||||DEPT|ASC|
|WH_DEPT_I3|||||COST_WH_STORAGE_UOM|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_WH_DEPT_STORAGE_TYPE|((STORAGE_TYPE = 'W') AND (COST_WH_STORAGE IS NOT NULL)) OR ((STORAGE_TYPE = 'O') AND (COST_OUT_STORAGE IS NOT NULL))<br>|
||CHK_WH_DEPT_TARGET_ROI|TARGET_ROI >= 0<br>|
|Column Level|TARGET_ROI||

---

## Table: WH_DEPT_EXPL

**Description:** This table holds investment buy information exploded to the wh/dept level for all investment buy eligible wh locations in the system. It takes the system_options and wh level wh_dept records and fills in the wh/dept level records that they imply.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | WH |  |  | Y | NUMERIC (10) | This column will contain the warehouse associated with the Investment Buy setup data |
| 2 | PHYSICAL_WH |  |  | Y | NUMERIC (10) | contains the physical wh associated with the wh. |
| 3 | REPL_WH_LINK |  |  |  | NUMERIC (10) | This column contains the replenishable warehouse that is attached to the virtual warehouse. |
| 4 | DEPT |  |  | Y | NUMERIC (4) | This column will contain the department associated with the Investment Buy setup data |
| 5 | BUYER |  |  |  | NUMERIC (4) | Contains the buyer associated with the dept. |
| 6 | COST_WH_STORAGE_MEAS |  |  |  | VARCHAR (6) | The type of the whs stroage cost. |
| 7 | COST_WH_STORAGE |  |  |  | NUMERIC (20,4) | Contains the default cost of warehouse storage, expressed as the weekly cost per the unit of measure specified in COST_WH_STORAGE_UOM. This value is held in the primary system currency and currently used by the investment buy functionality only. |
| 8 | COST_WH_STORAGE_UOM |  |  |  | VARCHAR (4) | Contains the unit of measure to which the default cost of warehouse storage is applicable. The unit of measure may only be pallet or from the volume class. This value is currently used by the investment buy functionality only. |
| 9 | COST_OUT_STORAGE_MEAS |  |  |  | VARCHAR (6) | The type of the whs stroage cost. |
| 10 | COST_OUT_STORAGE |  |  |  | NUMERIC (20,4) | Contains the default cost of outside storage, expressed as the weekly cost per the unit of measure specified in COST_OUT_STORAGE_UOM. This value is held in the primary system currency and currently used by the investment buy functionality only. |
| 11 | COST_OUT_STORAGE_UOM |  |  |  | VARCHAR (4) | Contains the unit of measure to which the default cost of outside storage is applicable. The unit of measure may only be pallet or from the volume class. This value is currently used by the investment buy functionality only. |
| 12 | STORAGE_TYPE |  |  | Y | VARCHAR (6) | Indicates which type of storage cost should be used as the default storage cost when calculating investment buy opportunities. Valid values are Warehouse and Outside. This value is currently used by the investment buy functionality only. |
| 13 | STORAGE_CURRENCY |  |  | Y | VARCHAR (3) | Indicates currency used for storages costs. |
| 14 | MAX_WEEKS_SUPPLY |  |  | Y | NUMERIC (3) | Contains the default maximum weeks of supply to use in the investment buy opportunity calculation. The investment buy opportunity calculation will not recommend an order quantity that would stock the associated location (currently warehouses only) beyond this number of weeks. This value is currently used by the investment buy functionality only. |
| 15 | TARGET_ROI |  |  | Y | NUMERIC (12,4) | Contains the default return on investment that must be met or exceeded for the investment buy opportunity to recommend an order quantity. This value is currently used by the investment buy functionality only. |
| 16 | COST_MONEY |  |  |  | NUMERIC (12,4) | Contains the cost of money, defined as the annualized percentage cost to borrow capital for investing. This value is currently used by the investment buy functionality only. |
| 17 | RECORD_SRC |  |  |  | VARCHAR (10) | Contains SYSTEM if the investment buy parameters were sourced from system_options. Contains WH if the investment buy parameters were sourced from wh_dept at the wh level. Contains WH/DEPT if the investment buy parameters were sourced from wh_dept at the wh/dept level. |

---

## Table: WH_L10N_EXT

**Description:** This is the LFAS storage table for the entity WH

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | WH | P | F | Y | NUMERIC (10) | Contains the number which uniquely identifies the warehouse |
| 2 | L10N_COUNTRY_ID | P | F | Y | VARCHAR (3) | This column holds the country this extended data is associated with. The logical business meaning of the VARCHAR_, NUMBER_ and DATE_ columns on this table are determined by the metadata defined for this country in its localization pack. |
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
| 25 | DATE_22 |  |  |  | Date | This column holds data related to the attribute defined on the L10N_ATTRIB table that references DATE_21 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_WH_L10N_EXT|PK||||WH|ASC|
||||||L10N_COUNTRY_ID|ASC|
||||||GROUP_ID|ASC|

---

## Table: WH_MFQUEUE

**Description:** This table tracks changes in RMS that need to be published to the RIB. It is populated by calls to ADDTOQ. It is updated and deleted from by calls to GETNXT and PUB_RETRY.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SEQ_NO | P |  | Y | NUMERIC (15) | The sequence in which the records was placed in the WH_MFQUEUE. Used to order the publication of messages to the RIB. |
| 2 | WH |  |  | Y | NUMERIC (10) | Functional key that uniquely identifies the change to the wh table that caused the record to be written to the WH_MFQUEUE. WH uniquely identifies a warehouse. |
| 3 | ADDR_KEY |  |  |  | NUMERIC (11) | Functional key that uniquely identifies the change to the wh table that caused the record to be written to the WH_MFQUEUE. Addr_key uniquely identifies an address. |
| 4 | MESSAGE_TYPE |  |  | Y | VARCHAR (15) | Describes the action in RMS that is causing the message to be published to the RIB. |
| 5 | FAMILY |  |  | Y | VARCHAR (30) | Tthe functional area that this transaction belongs to, in this case, wh. |
| 6 | CUSTOM_MESSAGE_TYPE |  |  |  | VARCHAR (1) | Not used by RMS. |
| 7 | PUB_STATUS |  |  | Y | VARCHAR (1) | Set to Unpublished upon insertion into the table. Will be set to Hospital when a non-fatal error is encountered during the publication process. |
| 8 | TRANSACTION_NUMBER |  |  |  | NUMERIC (10) | Business transaction key. |
| 9 | TRANSACTION_TIME_STAMP |  |  |  | Date | Time of record creation. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_WH_MFQUEUE|PK||||SEQ_NO|ASC|

---

## Table: WH_PUB_INFO

**Description:** This table helps the publication of warehouse. It does this by tracking the state of the warehouse and holding any information that can be populated at the header level and used in detail level publication.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | WH | P |  | Y | NUMERIC (10) | This is the business object id to publish by. They uniquely identify the row on the wh table. |
| 2 | PUBLISHED |  |  | Y | VARCHAR (1) | Indicates whether or not the transaction has been initially published. Set to N upon insertion into the table. When the entire transaction is published, it is set to Y. If some of the details in the transaction are published, but some are not, this indicator is set to I (in progress). |
| 3 | WH_TYPE |  |  | Y | VARCHAR (1) | This indicates if the location is a virtual, V, or physical, P location. |
| 4 | PRICING_LOC |  |  |  | NUMERIC (10) | Contains the pricing location used to set up pricing for the warehouse |
| 5 | PRICING_LOC_CURR |  |  |  | VARCHAR (3) | Contains the currency code for the pricing location |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_WH_PUB_INFO|PK||||WH|ASC|

---

## Table: WH_TL

**Description:** This is the translation table for WH table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | WH | P | F | Y | NUMERIC (10) | Contains the number which uniquely identifies the warehouse. The wh table stores all warehouses in the system. Both virtual and physical warehouses will be stored on this table. The addition of the new column, physical_wh, helps determine which warehouses are physical and which are virtual. All physical warehouses will have a physical_wh column value equal to their wh number. Virtual warehouses will have a valid physical warehouse in this column. |
| 3 | WH_NAME |  |  | Y | VARCHAR (150) | Contains the name of the warehouse which, along with the warehouse number, identifies the warehouse. |
| 4 | WH_NAME_SECONDARY |  |  |  | VARCHAR (150) | Secondary name of the warehouse. |
| 5 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 6 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 7 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 8 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_WH_TL|PK||||LANG|ASC|
||||||WH|ASC|
