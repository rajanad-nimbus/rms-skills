# RMS Tariffs & Customs Duties (HTS) Datamodel - Physical Data Model Reference

## Table: HTS

**Description:** This table holds HTS classification information.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | HTS | P |  | Y | VARCHAR (25) | Contains the unique HTS item classification number. This number is standard for the importing country. |
| 2 | IMPORT_COUNTRY_ID | P | F | Y | VARCHAR (3) | Contains the country id of the importing country. |
| 3 | EFFECT_FROM | P |  | Y | Date | Denotes the beginning of the time period that the HTS classification is valid. |
| 4 | EFFECT_TO | P |  | Y | Date | Denotes the end of the time period that the HTS classification is valid. |
| 5 | HTS_DESC |  |  | Y | VARCHAR (2000) | The HTS description of the item classification. |
| 6 | CHAPTER |  | F | Y | VARCHAR (4) | The chapter number in which the HTS classification exists. |
| 7 | UNITS |  |  | Y | NUMERIC (2) | Contains the number of units, defined by the Units_1, Units_2 and Units_3 column, by which customs wants to view the goods. This number will more than likely be 1. |
| 8 | UNITS_1 |  | F | Y | VARCHAR (4) | Contains the first unit of measure that the importing countrys customs agency needs to see the goods in. |
| 9 | UNITS_2 |  | F |  | VARCHAR (4) | Contains the second unit of measure that the importing countrys customs agency needs to see the goods in. |
| 10 | UNITS_3 |  | F |  | VARCHAR (4) | Contains the third unit of measure that the importing countrys customs agency needs to see the goods in. |
| 11 | DUTY_COMP_CODE |  |  | Y | VARCHAR (1) | Contains the duty computation code number which is the formula for calculating duty. |
| 12 | MORE_HTS_IND |  |  | Y | VARCHAR (1) | This column indicates if another HTS is required to completely classify the entire object. |
| 13 | QUOTA_CAT |  | F |  | VARCHAR (6) | This column contains the quota category for this HTS classification. |
| 14 | QUOTA_IND |  |  | Y | VARCHAR (1) | Indicates whether there is a quota imposed on the HTS classification. |
| 15 | AD_IND |  |  | Y | VARCHAR (1) | Indicates whether the HTS is likely to be subject to Anti-dumping duties. |
| 16 | CVD_IND |  |  | Y | VARCHAR (1) | Indicates whether the HTS is likely to be subject to Countervailing duties. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_HTS|PK||||HTS|ASC|
||||||IMPORT_COUNTRY_ID|ASC|
||||||EFFECT_FROM|ASC|
||||||EFFECT_TO|ASC|
|HTS_I6|||||UNITS_2|ASC|
|HTS_I5|||||QUOTA_CAT|ASC|
||||||IMPORT_COUNTRY_ID|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|HTS_I1|||||EFFECT_FROM|ASC|
|HTS_I7|||||UNITS_3|ASC|
|HTS_I8|||||UNITS_1|ASC|
|HTS_I2|||||EFFECT_TO|ASC|
|HTS_I3|||||CHAPTER|ASC|
||||||IMPORT_COUNTRY_ID|ASC|

### Constraints

|Type|Column / Constraint<br>Name|Details|
|---|---|---|
|Table Level|CHK_HTS_AD_IND|ad_ind in ('Y','N')<br>|
||CHK_HTS_CVD_IND|cvd_ind in ('Y','N')<br>|
||CHK_HTS_MORE_HTS_IND|more_hts_ind in ('Y','N')<br>|
||CHK_HTS_QUOTA_IND|QUOTA_IND IN ('Y','N')<br>|
|Column Level|QUOTA_IND||
||AD_IND||
||CVD_IND||

---

## Table: HTS_AD

**Description:** This table contains anti-dumping information for a given HTS classification and country of origin.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | HTS | P | F | Y | VARCHAR (25) | Contains the unique HTS item classification number. This number is standard for the importing country. |
| 2 | IMPORT_COUNTRY_ID | P | F | Y | VARCHAR (3) | Contains the country id of the importing country. |
| 3 | EFFECT_FROM | P | F | Y | Date | Denotes the beginning of the time period that the HTS classification is valid. |
| 4 | EFFECT_TO | P | F | Y | Date | Denotes the end of the time period that the HTS classification is valid. |
| 5 | MFG_ID | P |  | Y | VARCHAR (18) | Contains the manufacturers identification number. Anti-Dumping cases are manufacturer specific and are not imposed at just the country level. |
| 6 | ORIGIN_COUNTRY_ID | P | F | Y | VARCHAR (3) | Origin_country_id |
| 7 | CASE_NO |  |  | Y | VARCHAR (10) | Contains the case number assigned to the AD by a customs agency. |
| 8 | SHIPPER_ID |  |  | Y | VARCHAR (18) | Contains the shipper identification for the situation in which a AD rate is applied only to specific shippers, when the shipper is different from the manufacturer for the entry. |
| 9 | SUPPLIER |  | F | Y | NUMERIC (10) | Contains the supplier identification number of the items. |
| 10 | RATE |  |  | Y | NUMERIC (12,8) | Contains the rate of duty to be added upon the base rate of the item. |
| 11 | RELATED_CASE_NO |  |  |  | VARCHAR (10) | Contains a related case identification of the AD instance. |
| 12 | EFFECTIVE_ENTRY_DATE |  |  |  | Date | Contains the effective entry date which is used to establish the start date on which the AD becomes effective for that particular case number. |
| 13 | EFFECTIVE_EXPORT_DATE |  |  |  | Date | Contains the effective export date which is used to establish the start date on which the AD becomes effective for that particular case number. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_HTS_AD|PK||||HTS|ASC|
||||||IMPORT_COUNTRY_ID|ASC|
||||||EFFECT_FROM|ASC|
||||||EFFECT_TO|ASC|
||||||MFG_ID|ASC|
||||||ORIGIN_COUNTRY_ID|ASC|
|HTS_AD_I3|||||SUPPLIER|ASC|
|HTS_AD_I1|||||ORIGIN_COUNTRY_ID|ASC|

---

## Table: HTS_CHAPTER

**Description:** This table is the parent table to HTS Chapter level information.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | CHAPTER | P |  | Y | VARCHAR (4) | Contains the unique HTS Chapter number. The unique number is defined by the HTS schedule for all GATT signatories. |
| 2 | CHAPTER_DESC |  |  | Y | VARCHAR (2000) | Contains the description of the HTS Chapter. |
| 3 | IMPORT_COUNTRY_ID | P | F | Y | VARCHAR (3) | This Column holds the import country |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_HTS_CHAPTER|PK||||CHAPTER|ASC|
||||||IMPORT_COUNTRY_ID|ASC|

---

## Table: HTS_CHAPTER_RESTRAINTS

**Description:** This table holds all HTS chapter level restraints to importing goods into a given country. The most common restraint will be quotas at the chapter level.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | CHAPTER | P | F | Y | VARCHAR (4) | Contains the unique HTS Chapter number. The unique chapter is defined by the HTS schedule for all GATT signatories. |
| 2 | IMPORT_COUNTRY_ID | P | F | Y | VARCHAR (3) | Contains the country id of the importing country. |
| 3 | ORIGIN_COUNTRY_ID | P | F | Y | VARCHAR (3) | Contains the country id of the country of origin. |
| 4 | RESTRAINT_TYPE | P |  | Y | VARCHAR (6) | Contains the type of restraint imposed on certain items. |
| 5 | RESTRAINT_DESC |  |  | Y | VARCHAR (120) | Contains the description of the chapter restraint. |
| 6 | RESTRAINT_QTY |  |  | Y | NUMERIC (12,4) | Contains the amount of goods that may be brought into the importing country before the quota category is filled. |
| 7 | UOM |  |  | Y | VARCHAR (4) | Contains the unit of measure of the value stored in the quantity column. |
| 8 | CLOSING_DATE |  |  | Y | Date | Contains the date when the quota is reset. |
| 9 | QUOTA_CAT |  | F | Y | VARCHAR (6) | Contains the quota category to which the HTS chapter belongs. |
| 10 | RESTRAINT_SUFFIX |  |  |  | VARCHAR (6) | Contains the suffix of the restraint. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_HTS_CHAPTER_RESTRAINTS|PK||||CHAPTER|ASC|






|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
||||||IMPORT_COUNTRY_ID|ASC|
||||||ORIGIN_COUNTRY_ID|ASC|
||||||RESTRAINT_TYPE|ASC|
|HTS_CHAPTER_RESTRAINTS_I2|||||ORIGIN_COUNTRY_ID|ASC|
|HTS_CHAPTER_RESTRAINTS_I3|||||QUOTA_CAT|ASC|
||||||IMPORT_COUNTRY_ID|ASC|
|HTS_CHAPTER_RESTRAINTS_I1|||||IMPORT_COUNTRY_ID|ASC|
||||||CHAPTER|ASC|

---

## Table: HTS_CHAPTER_RESTRAINTS_TL

**Description:** This is the translation table for HTS_CHAPTER_RESTRAINTS table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | CHAPTER | P | F | Y | VARCHAR (4) | Contains the unique HTS Chapter number. The unique chapter is defined by the HTS schedule for all GATT signatories. |
| 3 | IMPORT_COUNTRY_ID | P | F | Y | VARCHAR (3) | Contains the country id of the importing country. |
| 4 | ORIGIN_COUNTRY_ID | P | F | Y | VARCHAR (3) | Contains the country id of the country of origin. |
| 5 | RESTRAINT_TYPE | P | F | Y | VARCHAR (6) | Contains the type of restraint imposed on certain items. |
| 6 | RESTRAINT_DESC |  |  | Y | VARCHAR (120) | Contains the description of the chapter restraint. |
| 7 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 8 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 9 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 10 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_HTS_CHAPTER_RESTRAINTS_TL|PK||||LANG|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
||||||CHAPTER|ASC|
||||||IMPORT_COUNTRY_ID|ASC|
||||||ORIGIN_COUNTRY_ID|ASC|
||||||RESTRAINT_TYPE|ASC|

---

## Table: HTS_CHAPTER_TL

**Description:** This is the translation table for HTS_CHAPTER table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | CHAPTER | P | F | Y | VARCHAR (4) | Contains the unique HTS Chapter number. The unique number is defined by the HTS schedule for all GATT signatories. |
| 3 | IMPORT_COUNTRY_ID | P | F | Y | VARCHAR (3) | This Column holds the import country |
| 4 | CHAPTER_DESC |  |  | Y | VARCHAR (2000) | Contains the description of the HTS Chapter. |
| 5 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 6 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 7 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 8 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_HTS_CHAPTER_TL|PK||||LANG|ASC|
||||||CHAPTER|ASC|
||||||IMPORT_COUNTRY_ID|ASC|

---

## Table: HTS_COMPUTATION

**Description:** Table to handle processing of new duty comp codes (K,J)

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | COMPUTATION_CODE | P |  | Y | VARCHAR (1) | Contains the HTS duty comp code. |
| 2 | IMPORT_COUNTRY_ID | P |  | Y | VARCHAR (3) | Contains import country ID. |
| 3 | COMP_SEQ | P |  | Y | VARCHAR (1) | Contains the field which differentiates the cost components(('A', 'B', 'C', ..). |
| 4 | COMP_RATE_CODE |  |  |  | VARCHAR (1) | Contains the field which Indicates which rate to use from HTS_TARIFF_TREATMENT table i.e. 'A': AV_RATE, 'S': SPECIFIC_RATE, 'O': OTHER_RATE. |
| 5 | COMP_UOM_CODE |  |  |  | VARCHAR (1) | Contains the field which Indicates which UOM to use from HTS table i.e. '1': UNITS_1, '2': UNITS_2, '3': UNITS_3. |
| 6 | KEY_RATE_IND |  |  |  | VARCHAR (1) | Contains the field will be checked when searching for the best tariff treatment. |

---

## Table: HTS_CVD

**Description:** This table contains countervailing duty information for a given HTS classification and country of origin.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | HTS | P | F | Y | VARCHAR (25) | Contains the unique HTS item classification number. This number is standard for the importing country. |
| 2 | IMPORT_COUNTRY_ID | P | F | Y | VARCHAR (3) | Contains the country id of the importing country. |
| 3 | EFFECT_FROM | P | F | Y | Date | Denotes the beginning of the time period that the HTS classification is valid. |
| 4 | EFFECT_TO | P | F | Y | Date | Denote the end of the time period that the HTS classification is valid. |
| 5 | ORIGIN_COUNTRY_ID | P | F | Y | VARCHAR (3) | Contains the country id of the country where the product was produced. |
| 6 | CASE_NO |  |  | Y | VARCHAR (10) | Contains the case number assigned to the CVD by a customs agency. |
| 7 | MFG_ID |  |  | Y | VARCHAR (18) | Contains the manufacturers tax identification number. |
| 8 | SHIPPER_ID |  |  | Y | VARCHAR (18) | Contains the shipper identification for the situation in which a CVD rate is applied only to specified shippers, when the shipper is different from the manufacturer for the entry. |
| 9 | SUPPLIER |  | F | Y | NUMERIC (10) | Contains the supplier identification of the supplier of the items. |
| 10 | RATE |  |  |  | NUMERIC (12,8) | Contains the rate of duty to be added upon the base rate of the item. |
| 11 | RELATED_CASE_NO |  |  |  | VARCHAR (10) | Contains a related case identification of the CVD instance. |
| 12 | EFFECTIVE_ENTRY_DATE |  |  |  | Date | Contains the effective entry date which is used to establish the start date on which the CVD becomes effective for that particular case number. |
| 13 | EFFECTIVE_EXPORT_DATE |  |  |  | Date | Contains the effective export date which is used to establish the start date on which the CVD becomes effective for that particular case number. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_HTS_CVD|PK||||HTS|ASC|
||||||IMPORT_COUNTRY_ID|ASC|
||||||EFFECT_FROM|ASC|
||||||EFFECT_TO|ASC|
||||||ORIGIN_COUNTRY_ID|ASC|
|HTS_CVD_I1|||||ORIGIN_COUNTRY_ID|ASC|
|HTS_CVD_I3|||||SUPPLIER|ASC|

---

## Table: HTS_FEE

**Description:** This table contains all of the information needed to calculate the customs fees for a given hts classification.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | HTS | P | F | Y | VARCHAR (25) | This field contains the unique HTS item classification number. This number is standard for the importing country. |
| 2 | IMPORT_COUNTRY_ID | P | F | Y | VARCHAR (3) | This field contains the country id of the importing country. |
| 3 | EFFECT_FROM | P | F | Y | Date | This field denotes the beginning of the time period that the HTS classification is valid. |
| 4 | EFFECT_TO | P | F | Y | Date | This field denotes the end of the time period that the HTS classification is valid. |
| 5 | FEE_TYPE | P |  | Y | VARCHAR (3) | This field contains a customs defined fee code. |
| 6 | FEE_COMP_CODE |  |  | Y | VARCHAR (1) | This column contains code of the formula for calculating the exact fee on an HTS classification. This formula may call for a tax_specific_rate, tax_av_rate or a combination of the two. |
| 7 | FEE_SPECIFIC_RATE |  |  | Y | NUMERIC (12,8) | This column contains the rate of a fee for a specific unit of measure of the item. |
| 8 | FEE_AV_RATE |  |  | Y | NUMERIC (12,8) | This field contains the rate of the fee for the ad valorem measure of the item. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_HTS_FEE|PK||||HTS|ASC|
||||||IMPORT_COUNTRY_ID|ASC|
||||||EFFECT_FROM|ASC|
||||||EFFECT_TO|ASC|
||||||FEE_TYPE|ASC|

---

## Table: HTS_FEE_ZONE

**Description:** A table that will hold rates for HTS/fee/clearing zone.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | HTS | P | F | Y | VARCHAR (25) | Contains the unique HTS item classification number. This number is standard for the importing country. |
| 2 | IMPORT_COUNTRY_ID | P | F | Y | VARCHAR (3) | This field contains the country id of the importing country. |
| 3 | EFFECT_FROM | P | F | Y | Date | Denotes the beginning of the time period that the HTS classification is valid. |
| 4 | EFFECT_TO | P | F | Y | Date | Denotes the end of the time period that the HTS classification is valid. |
| 5 | FEE_TYPE | P | F | Y | VARCHAR (3) | This field contains a customs defined fee code. |
| 6 | CLEARING_ZONE_ID | P |  | Y | VARCHAR (5) | This field contains the clearing zone id. |
| 7 | FEE_SPECIFIC_RATE |  |  | Y | NUMERIC (12,8) | This column contains the rate of a fee for a specific unit of measure of the item. |
| 8 | FEE_AV_RATE |  |  | Y | NUMERIC (12,8) | This field contains the rate of the fee for the ad valorem measure of the item. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_HTS_FEE_ZONE|PK||||HTS|ASC|
||||||IMPORT_COUNTRY_ID|ASC|
||||||EFFECT_FROM|ASC|
||||||EFFECT_TO|ASC|
||||||FEE_TYPE|ASC|
||||||CLEARING_ZONE_ID|ASC|

---

## Table: HTS_IMPORT_COUNTRY_SETUP

**Description:** This table will hold the attributes of HTS by Import country

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | IMPORT_COUNTRY_ID | P | F | Y | VARCHAR (3) | Holds the import country |
| 2 | HTS_FORMAT_MASK |  |  | Y | VARCHAR (50) | Holds the format mask of HTS for the import country. The value should start with FM and the separator should be in double quotes, Example: FMXXXX"."XX"."XXXX |
| 3 | HTS_HEADING_LENGTH |  |  | Y | NUMERIC (2) | Holds the number of characters that forms the chapter in the HTS |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_HTS_IMPORT_COUNTRY_SETUP|PK||||IMPORT_COUNTRY_ID|ASC|

---

## Table: HTS_OGA

**Description:** This table contains all of the codes that identify an agency outside of customs that are responsible for a given item classification.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | HTS | P | F | Y | VARCHAR (25) | Contains the unique HTS classification number. This number is standard for the importing country. |
| 2 | IMPORT_COUNTRY_ID | P | F | Y | VARCHAR (3) | Contains the country id of the importing country. |
| 3 | EFFECT_FROM | P | F | Y | Date | Denotes the beginning of the time period that the HTS classification is valid. |
| 4 | EFFECT_TO | P | F | Y | Date | Denotes the end of the time period that the HTS classification is valid. |
| 5 | OGA_CODE | P | F | Y | VARCHAR (3) | Contains the code for the government agency that has jurisdiction along Customs over the HTS classification. |
| 6 | REFERENCE_ID |  |  |  | VARCHAR (30) | Contains a user-defined reference to the Other Government_Agency. |
| 7 | COMMENTS |  |  |  | VARCHAR (2000) | Contains users comments. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_HTS_OGA|PK||||HTS|ASC|
||||||IMPORT_COUNTRY_ID|ASC|
||||||EFFECT_FROM|ASC|
||||||EFFECT_TO|ASC|
||||||OGA_CODE|ASC|
|HTS_OGA_I2|||||OGA_CODE|ASC|

---

## Table: HTS_REFERENCE

**Description:** This table contains user-defined references. These references are not validated against any table and do not drive processes.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | HTS | P | F | Y | VARCHAR (25) | Contains the unique HTS item classification number. This number is standard for the importing country. |
| 2 | IMPORT_COUNTRY_ID | P | F | Y | VARCHAR (3) | This field contains the country id of the importing country. |
| 3 | EFFECT_FROM | P | F | Y | Date | Denotes the beginning of the time period that the HTS classification is valid. |
| 4 | EFFECT_TO | P | F | Y | Date | Denotes the end of the time period that the HTS classification is valid. |
| 5 | REFERENCE_ID | P |  | Y | VARCHAR (30) | This field contains the user-defined identification code, which will uniquely identify a reference. |
| 6 | REFERENCE_DESC |  |  | Y | VARCHAR (2000) | This field contains the description of the reference identification code. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_HTS_REFERENCE|PK||||IMPORT_COUNTRY_ID|ASC|
||||||HTS|ASC|
||||||EFFECT_FROM|ASC|
||||||EFFECT_TO|ASC|
||||||REFERENCE_ID|ASC|
|HTS_REFERENCE_I1|||||HTS|ASC|
||||||IMPORT_COUNTRY_ID|ASC|
||||||EFFECT_FROM|ASC|
||||||EFFECT_TO|ASC|

---

## Table: HTS_TARIFF_TREATMENT

**Description:** This table contains tariff treatment for a given HTS classification. The tariff treatment must be figured into the items ELC.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | HTS | P | F | Y | VARCHAR (25) | Contains the unique HTS item classification number. This number is standard for the importing country. |
| 2 | IMPORT_COUNTRY_ID | P | F | Y | VARCHAR (3) | Contains the country id of the importing country. |
| 3 | EFFECT_FROM | P | F | Y | Date | Denotes the beginning of the time period that the HTS classification is valid. |
| 4 | EFFECT_TO | P | F | Y | Date | Denotes the end of the time period that the HTS classification is valid. |
| 5 | TARIFF_TREATMENT | P | F | Y | VARCHAR (10) | Contains the country id of the importing country. |
| 6 | SPECIFIC_RATE |  |  | Y | NUMERIC (12,8) | Contains the tariff rate based on a specific unit of measure. |
| 7 | AV_RATE |  |  | Y | NUMERIC (12,8) | Contains the tariff rate based on the amount of the product being imported. |
| 8 | OTHER_RATE |  |  | Y | NUMERIC (12,8) | Contains any tariff rate that cannot be held by the specific_rate and av_rate columns. This field is usually used for products that are produced in Communist countries. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_HTS_TARIFF_TREATMENT|PK||||HTS|ASC|
||||||IMPORT_COUNTRY_ID|ASC|
||||||EFFECT_FROM|ASC|
||||||EFFECT_TO|ASC|
||||||TARIFF_TREATMENT|ASC|
|HTS_TARIFF_TREATMENT_I2|||||TARIFF_TREATMENT|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_HTS_TARIFF_TRTMT_TTRTMT|tariff_treatment = upper(tariff_treatment)<br>|
|Column Level|TARIFF_TREATMENT||

---

## Table: HTS_TARIFF_TREATMENT_ZONE

**Description:** A table that will hold rates for HTS/tariff/clearing zone.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | HTS | P | F | Y | VARCHAR (25) | Contains the unique HTS item classification number. This number is standard for the importing country. |
| 2 | IMPORT_COUNTRY_ID | P | F | Y | VARCHAR (3) | This field contains the country id of the importing country. |
| 3 | EFFECT_FROM | P | F | Y | Date | Denotes the beginning of the time period that the HTS classification is valid. |
| 4 | EFFECT_TO | P | F | Y | Date | Denotes the end of the time period that the HTS classification is valid. |
| 5 | TARIFF_TREATMENT | P | F | Y | VARCHAR (10) | Contains the tariff treatment identification that applies to the HTS classification.. |
| 6 | CLEARING_ZONE_ID | P |  | Y | VARCHAR (5) | This field contains the clearing zone id. |
| 7 | SPECIFIC_RATE |  |  | Y | NUMERIC (12,8) | Contains the tariff rate based on a specific unit of measure. |
| 8 | AV_RATE |  |  | Y | NUMERIC (12,8) | Contains the tariff rate based on the amount of the product being imported. |
| 9 | OTHER_RATE |  |  | Y | NUMERIC (12,8) | Contains any tariff rate that cannot be held by the specific_rate and av_rate columns. This field is usually used for products that are produced in Communist countries. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_HTS_TARIFF_TREATMENT_ZONE|PK||||HTS|ASC|
||||||IMPORT_COUNTRY_ID|ASC|
||||||EFFECT_FROM|ASC|
||||||EFFECT_TO|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
||||||TARIFF_TREATMENT|ASC|
||||||CLEARING_ZONE_ID|ASC|

---

## Table: HTS_TAX

**Description:** This table contains all of the information needed to calculate the customs tax for a given hts classification.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | HTS | P | F | Y | VARCHAR (25) | Contains the unique HTS item classification number. This number is standard for the importing country. |
| 2 | IMPORT_COUNTRY_ID | P | F | Y | VARCHAR (3) | This field contains the country id of the importing country. |
| 3 | EFFECT_FROM | P | F | Y | Date | Denotes the beginning of the time period that the HTS classification is valid. |
| 4 | EFFECT_TO | P | F | Y | Date | Denotes the end of the time period that the HTS classification is valid. |
| 5 | TAX_TYPE | P |  | Y | VARCHAR (3) | This field contains a customs defined tax code. |
| 6 | TAX_COMP_CODE |  |  | Y | VARCHAR (1) | This column contains code of the formula for calculating the exact tax on an HTS classification. |
| 7 | TAX_SPECIFIC_RATE |  |  | Y | NUMERIC (12,8) | This column contains the rate of tax for a specific unit of measure of the item. |
| 8 | TAX_AV_RATE |  |  | Y | NUMERIC (12,8) | This column contains the rate of tax for the ad valorem measure of the item. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_HTS_TAX|PK||||HTS|ASC|
||||||IMPORT_COUNTRY_ID|ASC|
||||||EFFECT_FROM|ASC|
||||||EFFECT_TO|ASC|
||||||TAX_TYPE|ASC|

---

## Table: HTS_TAX_ZONE

**Description:** A table that will hold rates for HTS/tax/clearing zone.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | HTS | P | F | Y | VARCHAR (25) | Contains the unique HTS item classification number. This number is standard for the importing country. |
| 2 | IMPORT_COUNTRY_ID | P | F | Y | VARCHAR (3) | This field contains the country id of the importing country. |
| 3 | EFFECT_FROM | P | F | Y | Date | Denotes the beginning of the time period that the HTS classification is valid. |
| 4 | EFFECT_TO | P | F | Y | Date | Denotes the end of the time period that the HTS classification is valid. |
| 5 | TAX_TYPE | P | F | Y | VARCHAR (3) | This field contains a customs defined tax code. |
| 6 | CLEARING_ZONE_ID | P |  | Y | VARCHAR (5) | This field contains the clearing zone id. |
| 7 | TAX_SPECIFIC_RATE |  |  | Y | NUMERIC (12,8) | This column contains the rate of tax for a specific unit of measure of the item. |
| 8 | TAX_AV_RATE |  |  | Y | NUMERIC (12,8) | This column contains the rate of tax for the ad valorem measure of the item. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_HTS_TAX_ZONE|PK||||HTS|ASC|
||||||IMPORT_COUNTRY_ID|ASC|
||||||EFFECT_FROM|ASC|
||||||EFFECT_TO|ASC|
||||||TAX_TYPE|ASC|
||||||CLEARING_ZONE_ID|ASC|

---

## Table: HTS_TL

**Description:** This is the translation table for HTS table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | HTS | P | F | Y | VARCHAR (25) | Contains the unique HTS item classification number. This number is standard for the importing country. |
| 3 | IMPORT_COUNTRY_ID | P | F | Y | VARCHAR (3) | Contains the country id of the importing country. |
| 4 | EFFECT_FROM | P | F | Y | Date | Denotes the beginning of the time period that the HTS classification is valid. |
| 5 | EFFECT_TO | P | F | Y | Date | Denotes the end of the time period that the HTS classification is valid. |
| 6 | HTS_DESC |  |  | Y | VARCHAR (2000) | The HTS description of the item classification. |
| 7 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 8 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 9 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 10 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

---

## Table: HTS_TT_EXCLUSIONS

**Description:** This table contains the countries that are exempt from the tariff treatment for a given HTS classification.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | HTS | P | F | Y | VARCHAR (25) | Contains the unique HTS item classification number. This number is standard for the importing country. |
| 2 | IMPORT_COUNTRY_ID | P | F | Y | VARCHAR (3) | Contains the country id of the importing country. |
| 3 | EFFECT_FROM | P | F | Y | Date | Denotes the beginning of the time period that the HTS classification is valid. |
| 4 | EFFECT_TO | P | F | Y | Date | Denotes the end of the time period that the HTS classification is valid. |
| 5 | TARIFF_TREATMENT | P | F | Y | VARCHAR (10) | Contains the tariff treatment identification that applies to the HTS classification. |
| 6 | ORIGIN_COUNTRY_ID | P |  | Y | VARCHAR (3) | Contains the country id for the country where the item is manufactured. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_HTS_TT_EXCLUSIONS|PK||||HTS|ASC|
||||||IMPORT_COUNTRY_ID|ASC|
||||||EFFECT_FROM|ASC|
||||||EFFECT_TO|ASC|
||||||TARIFF_TREATMENT|ASC|
||||||ORIGIN_COUNTRY_ID|ASC|
|HTS_TT_EXCLUSIONS_I1|||||IMPORT_COUNTRY_ID|ASC|
|HTS_TT_EXCLUSIONS_I2|||||TARIFF_TREATMENT|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_HTS_TT_EXCL_TARIFF_TRMT|tariff_treatment = upper(tariff_treatment)|






|Type|Column / Constraint Name|Details|
|---|---|---|
||||
|Column Level|TARIFF_TREATMENT||
