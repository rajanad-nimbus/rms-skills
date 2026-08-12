# RMS Item Packs & Complex Packs Datamodel - Physical Data Model Reference

## Table: FASHPACK_FILTER_TEMP

**Description:** This table will temporary hold information relating to the filtering of the detail block on the fashion prepack form.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SEQ_NO |  |  |  | NUMERIC (8) | This column will hold a sequence number or pack template ID by which the user would like to filter. |
| 2 | DIFF_1 |  |  |  | VARCHAR (10) | This column will hold a diff 1 by which the user would like to filter. |
| 3 | DIFF_2 |  |  |  | VARCHAR (10) | This column will hold a diff 2 by which the user would like to filter. |
| 4 | DIFF_3 |  |  |  | VARCHAR (10) | This column will hold a diff 3 by which the user would like to filter. |
| 5 | DIFF_4 |  |  |  | VARCHAR (10) | This column will hold a diff 4 by which the user would like to filter. |
| 6 | QTY |  |  |  | NUMERIC (12,4) | This column will hold a quantity by which the user would like to filter. |

---

## Table: PACKITEM

**Description:** This table contains simple pack and complex packs created in RMS along with the component items of the packs.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PACK_NO | P | F | Y | VARCHAR (25) | Alphanumeric value that uniquely identifies the pack for which details are held in this table. |
| 2 | SEQ_NO | P |  | Y | NUMERIC (4) | Contains a sequence number used to uniquely identify a row in the PACKITEM table. |
| 3 | ITEM |  | F |  | VARCHAR (25) | Alphanumeric value that identifies the component item within the pack. If pack item is created using pack template then the component items are stored in the PACKITEM_BREAKOUT table and this field is null. |
| 4 | ITEM_PARENT |  | F |  | VARCHAR (25) | This field contains the parent item (if any) associated with the component item of the pack. |
| 5 | PACK_TMPL_ID |  | F |  | NUMERIC (8) | Contains the pack template ID associated with the pack item. |
| 6 | PACK_QTY |  |  | Y | NUMERIC (12,4) | Contains the quantity of component items within the pack. If the pack item is created using a pack template then the quantity specified here is 1 and the actual component item quantities in the pack are stored in PACKITEM_BREAKOUT table. |
| 7 | CREATE_DATETIME |  |  | Y | Date | Date/time stamp of when the record was created. This date/time will be used in export processing. This value should only be populated on insert and it should never be updated. |
| 8 | LAST_UPDATE_DATETIME |  |  | Y | Date | Holds the date time stamp of the most recent update by the last_update_id. |
| 9 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | Holds the Oracle user-id of the user who most recently updated this record. |

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_PACKITEM_ITEM_PARENT_NULL|item is not NULL or item_parent is not NULL<br>|

---

## Table: PACKITEM_BREAKOUT

**Description:** This table breaks down a pack s components and their quantities to the lowest level, including the component items of any inner packs.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PACK_NO | P | F | Y | VARCHAR (25) | Contains the alphanumeric value that uniquely identifies the pack item. |
| 2 | SEQ_NO | P |  | Y | NUMERIC (4) | Contains a sequence number which, along with PACK_NO, comprises the primary key for this table. This is required as some of the columns that are used to determine a unique row, such as PACK_TMPL_ID and COMP_PACK_NO can be NULL. |
| 3 | ITEM |  | F | Y | VARCHAR (25) | Contains the unique alphanumeric value that identifies the component item within the pack. This could be a component in the pack or a component of an inner pack. |
| 4 | ITEM_PARENT |  | F |  | VARCHAR (25) | Contains the unique alphanumeric value that identifies the parent of the component item within the pack (PACKITEM_BREAKOUT.ITEM), if applicable. |
| 5 | PACK_TMPL_ID |  | F |  | NUMERIC (8) | Contains the pack template ID associated with the item parent contained within the pack item, if applicable. |
| 6 | COMP_PACK_NO |  |  |  | VARCHAR (25) | Contains the unique identifier for the pack item (inner pack) if a pack item is added to an outer pack as component item. |
| 7 | ITEM_QTY |  |  |  | NUMERIC (12,4) | If the item is in a pack that contains no inners and the item is not in an item parent/pack template, then this field contains the quantity of the item in the pack and will be equal to the PACK_ITEM_QTY. If the item is in an inner pack but the inner pack is not comprised of an item parent/pack template, then this field contains the quantity of the item in |
| 8 | ITEM_PARENT_PT_QTY |  |  |  | NUMERIC (12,4) | This field indicates the quantity of the item parent/pack template in the pack. If the COMP_PACK_NO is not NULL, then it represents the item parent/pack template quantity in the inner pack. Otherwise, it is the quantity in the outer pack. |
| 9 | COMP_PACK_QTY |  |  |  | NUMERIC (12,4) | Indicates the quantity of a component pack item within a pack. Only populated if comp_pack_no is not NULL. |
| 10 | PACK_ITEM_QTY |  |  | Y | NUMERIC (12,4) | If the item is in a pack that contains no inners and the item is not in an item parent/pack template, then this field contains the quantity of the item in the pack and will be equal to the ITEM_QTY. If the item is in an inner pack but the inner pack is not comprised of an item parent/pack template, then this field represents ITEM_QTY * COMP_PACK_QTY. If the item is in a pack which is comprised of an item parent/pack template, this field represents ITEM_QTY * ITEM_PARENT_PT_QTY, if there is no inner pack. If the item is in an inner pack which is comprised of an item parent/pack template, then this field represents ITEM_QTY * ITEM_PARENT_PT_QTY * COMP_PACK_QTY. |
| 11 | CREATE_DATETIME |  |  | Y | Date | Contains the date/time stamp of when the record was created. This date/time is used in export processing. This value is populated on insert and never updated. |
| 12 | LAST_UPDATE_DATETIME |  |  | Y | Date | Holds the date time stamp of the most recent update by the last_update_id. This field is required by the database. |
| 13 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | Holds the Oracle user-id of the user who most recently updated this record. This field is required by the database. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_PACKITEM_BREAKOUT|PK||||PACK_NO|ASC|






|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
||||||SEQ_NO|ASC|
|PACKITEM_BREAKOUT_I4|||||PACK_TMPL_ID|ASC|
|PACKITEM_BREAKOUT_I1|UN||||PACK_NO|ASC|
||||||ITEM|ASC|
||||||ITEM_PARENT|ASC|
||||||PACK_TMPL_ID|ASC|
||||||COMP_PACK_NO|ASC|
|PACKITEM_BREAKOUT_I3|||||ITEM_PARENT|ASC|
|PACKITEM_BREAKOUT_I2|||||ITEM|ASC|
|PACKITEM_BREAKOUT_I5|||||PACK_NO|ASC|
||||||PACK_ITEM_QTY|ASC|
||||||ITEM|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_PACKITEM_BKOUT_COMP_PACK|(comp_pack_qty is NULL and comp_pack_no is NULL) or (comp_pack_qty is not NULL and comp_pack_no is not NULL)<br>|
||CHK_PACKITEM_BKOUT_PARENT_PT|(item_parent is NULL and item_parent_pt_qty is NULL) or (item_parent is NOT NULL and item_parent_pt_qty is NOT NULL)<br>|

---

## Table: PACK_TMPL_DETAIL

**Description:** This table contains all the differentiator combinations and their associated quantities defined in a pack template.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PACK_TMPL_ID | P | F | Y | NUMERIC (8) | Contains the unique identifier for a pack template. |
| 2 | SEQ_NO | P |  | Y | NUMERIC (4) | This field is used to uniquely identify the record. |
| 3 | DIFF_1 |  | F | Y | VARCHAR (10) | Contains the one of the differentiator values, that can be combined with up to three other differentiator values, to make up a unique row in the pack template. At least one differentiator is required for each row. This differentiator must belong to the differentiator group specified in PACK_TMPL_HEAD.DIFF_GROUP_1. |
| 4 | DIFF_2 |  | F |  | VARCHAR (10) | Contains the optional second differentiator value that is associated with this row in the pack template. This value will be null if no DIFF_GROUP_2 has been specified for the range on PACK_TMPL_HEAD. Otherwise, this differentiator value must belong to the differentiator group specified in the PACK_TMPL_HEAD.DIFF_GROUP_2. |
| 5 | DIFF_3 |  |  |  | VARCHAR (10) | Contains the optional third differentiator value that is associated with this row in the pack template. This value will be null if no DIFF_GROUP_3 has been specified for the range on PACK_TMPL_HEAD. Otherwise, this differentiator value must belong to the differentiator group specified in the PACK_TMPL_HEAD.DIFF_GROUP_3. |
| 6 | DIFF_4 |  |  |  | VARCHAR (10) | Contains the optional fourth differentiator value that is associated with this row in the pack template. This value will be null if no DIFF_GROUP_4 has been specified for the range on PACK_TMPL_HEAD. Otherwise, this differentiator value must belong to the differentiator group specified in the PACK_TMPL_HEAD.DIFF_GROUP_4. |
| 7 | QTY |  |  |  | NUMERIC (12,4) | Contains the quantity for the differentiator combination n the pack template that, when combined with an item parent is used to create a pre-pack. |
| 8 | CREATE_DATETIME |  |  | Y | Date | Date/time stamp of when the record was created. This date/time will be |
| 9 | LAST_UPDATE_DATETIME |  |  | Y | Date | Holds the date time stamp of the most recent update by the LAST_UPDATE_ID. |
| 10 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | Holds the Oracle user-id of the user who most recently updated this record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_PACK_TMPL_DETAIL|PK||||PACK_TMPL_ID|ASC|
||||||SEQ_NO|ASC|
|PACK_TMPL_DETAIL_I3|||||DIFF_2|ASC|
|PACK_TMPL_DETAIL_I5|||||DIFF_4|ASC|
|PACK_TMPL_DETAIL_I4|||||DIFF_3|ASC|
|PACK_TMPL_DETAIL_I1|UN||||PACK_TMPL_ID|ASC|
||||||DIFF_1|ASC|
||||||DIFF_2|ASC|
||||||DIFF_3|ASC|
||||||DIFF_4|ASC|
|PACK_TMPL_DETAIL_I2|||||DIFF_1|ASC|

---

## Table: PACK_TMPL_HEAD

**Description:** This table contains all the pack templates defined within the system. A pack template is a combination of differentiators, each with a designated quantity, that can be used as a quick way to create pack items or order items by associating it with an item parent.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PACK_TMPL_ID | P |  | Y | NUMERIC (8) | This field contains the unique identification code for a pack template. |
| 2 | PACK_TMPL_DESC |  |  | Y | VARCHAR (250) | This field contains a description of the pack template. |
| 3 | DIFF_GROUP_1 |  |  | Y | VARCHAR (10) | Contains the required first differentiator group associated with the pack template. All DIFF_1 values for the pack template on PACK_TMPL_DETAIL must be a member of this differentiator group. |
| 4 | DIFF_GROUP_2 |  |  |  | VARCHAR (10) | Contains the optional second differentiator group associated with the pack template. If populated, all DIFF_2 values for the pack template on PACK_TMPL_DETAIL must be a member of this differentiator group. If this value is not populated, no detail records on PACK_TMPL_DETAIL will contain a DIFF_2 value. |
| 5 | DIFF_GROUP_3 |  |  |  | VARCHAR (10) | Contains the optional third differentiator group associated with the pack template. If populated, all DIFF_3 values for the pack template on PACK_TMPL_DETAIL must be a member of this differentiator group. If this value is not populated, no detail records on PACK_TMPL_DETAIL will contain a DIFF_3 value. |
| 6 | DIFF_GROUP_4 |  |  |  | VARCHAR (10) | Contains the optional fourth differentiator group associated with the pack template. If populated, all DIFF_4 values for the pack template on PACK_TMPL_DETAIL must be a member of this differentiator group. If this value is not populated, no detail records on PACK_TMPL_DETAIL will contain a DIFF_4 value. |
| 7 | FASH_PREPACK_IND |  |  | Y | VARCHAR (1) | Indicates if a pack template is created for fashion prepacks only, which are single use prepacks. If this is Y, then the pack template will not be |
| 8 | PACK_TYPE |  |  |  | VARCHAR (1) | This field determines whether the pack item is a vendor pack or a buyer pack. Valid values are B or V. This field will only be populated if FASH_PREPACK_IND = Y. |
| 9 | CREATE_DATETIME |  |  | Y | Date | Date/time stamp of when the record was created. This date/time will be used in export processing. This value should only be populated on insert - it should never be updated. |
| 10 | LAST_UPDATE_DATETIME |  |  | Y | Date | Holds the date time stamp of the most recent update by the LAST_UPDATE_ID. |
| 11 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | Holds the Oracle user-id of the user who most recently updated this record. |
| 12 | REC_AS_TYPE |  |  |  | VARCHAR (1) | Defines how the pack will be received at the warehouse, either as a pack or as the component items (eaches) . Valid values are E and P. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_PACK_TMPL_HEAD|PK||||PACK_TMPL_ID|ASC|
|PACK_TMPL_HEAD_I1|||||DIFF_GROUP_1|ASC|
|PACK_TMPL_HEAD_I2|||||DIFF_GROUP_2|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_PACK_TMPL_HEAD_FA_PREP_IND|fash_prepack_ind in ('Y','N')<br>|
||CHK_PACK_TMPL_HEAD_PACK_TYPE|(PACK_TYPE in ('B', 'V') AND FASH_PREPACK_IND = 'Y') OR (PACK_TYPE is NULL AND FASH_PREPACK_IND = 'N')|






|Type|Column / Constraint Name|Details|
|---|---|---|
||CHK_PACK_TMPL_HEAD_REC_AS_TYPE|rec_as_type in('P','E')<br>|
|Column Level|FASH_PREPACK_IND||
||REC_AS_TYPE||

---

## Table: PACK_TMPL_HEAD_TL

**Description:** This is the translation table for PACK_TMPL_HEAD table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | PACK_TMPL_ID | P | F | Y | NUMERIC (8) | This field contains the unique identification code for a pack template. |
| 3 | PACK_TMPL_DESC |  |  | Y | VARCHAR (250) | This field contains a description of the pack template. |
| 4 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 6 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 7 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_PACK_TMPL_HEAD_TL|PK||||LANG|ASC|
||||||PACK_TMPL_ID|ASC|

---

## Table: SIMPLE_PACK_TEMP

**Description:** This table is a temporary table that will be used to store information during the Simple Pack Setup process as well as store the simple packs associated to a component item whenever a user wishes to query this information in the Simple Pack Setup form. Since this is a temporary table and therefore will not be populated during a data conversion effort no foreign keys or check constraints need to be placed on this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PACK_NO |  |  | Y | VARCHAR (25) | Unique alphanumeric value that identifies the pack item. |
| 2 | ITEM_NUMBER_TYPE |  |  | Y | VARCHAR (6) | Code specifying what type the simple pack is (not the component item). Valid values for this field are in the code type UPCT. |
| 3 | ITEM |  | F | Y | VARCHAR (25) | Unique alphanumeric value that identifies the component item (i.e. the item in the simple pack). |
| 4 | PACK_DESC |  |  | Y | VARCHAR (250) | Long description of the pack. The description is used throughout the system to help online users identify the pack. |
| 5 | PACK_DESC_SECONDARY |  |  |  | VARCHAR (250) | Secondary description of the pack. |
| 6 | ITEM_QTY |  |  | Y | NUMERIC (12,4) | Contains the quantity of the component item in the pack. |
| 7 | PRIMARY_SUPP |  | F | Y | NUMERIC (10) | Contains the primary supplier for the pack. |
| 8 | PRIMARY_CNTRY_ID |  | F | Y | VARCHAR (3) | Contains the primary origin country of the pack. |
| 9 | UNIT_COST |  |  | Y | NUMERIC (20,4) | Contains the unit cost of the pack for the primary supplier/origin country. This cost is stored in the suppliers currency and does not include landed cost components. |
| 10 | CONST_DIMEN_IND |  |  | Y | VARCHAR (1) | Indicates if the pack will have constant dimensions across suppliers. Valid values are Y and N. |
| 11 | SELLABLE_IND |  |  | Y | VARCHAR (1) | Indicates if the pack is sellable or not. Valid values include Yes and No. |
| 12 | UNIT_RETAIL |  |  |  | NUMERIC (20,4) | Contains the base retail of the pack. This retail is stored in the primary currency and does not include VAT. |
| 13 | VPN |  |  |  | VARCHAR (30) | Contains the vendor product number for the pack for the primary supplier/origin country. |
| 14 | SUPP_LABEL |  |  |  | VARCHAR (15) | Contains the supplier label for the pack for the primary supplier/origin country. |
| 15 | SUPP_PACK_SIZE |  |  | Y | NUMERIC (12,4) | Contains the number of packs in a supplier pack size (i.e. case). The supplier pack size is the quantity that orders must be placed in multiples of for the supplier of the pack. |
| 16 | TI |  |  | Y | NUMERIC (12,4) | Contains the number of shipping units (supplier pack sizes or cases) that make up one tier of a pallet. Multiply TI x HI to get the total number of shipping units for a pallet. |
| 17 | HI |  |  | Y | NUMERIC (12,4) | Contains the number of tiers that make up a complete pallet (height). Multiply TI x HI to get the total number of shipping units for a pallet. |
| 18 | CASE_LENGTH |  |  |  | NUMERIC (12,4) | Contains the length of a case of the pack in units specified in the LWH UOM. |
| 19 | CASE_WIDTH |  |  |  | NUMERIC (12,4) | Contains the width of a case of the pack in units specified in the LWH UOM. |
| 20 | CASE_HEIGHT |  |  |  | NUMERIC (12,4) | Contains the height of a case of the pack in units specified in the LWH UOM. |
| 21 | CASE_LWH_UOM |  | F |  | VARCHAR (4) | Contains the unit of measurement for the case length, width and height (e.g. inches, centimeters, feet). Valid values for this field are contained in the UOM field on the UOM_CLASS table where the UOM_CLASS = DIMEN. |
| 22 | CASE_WEIGHT |  |  |  | NUMERIC (12,4) | Contains the weight of a case of the pack in units specified in the WEIGHT UOM. |
| 23 | CASE_NET_WEIGHT |  |  |  | NUMERIC (12,4) | Contains the net weight (i.e. weight without packaging) of a case of the pack in units specified in the WEIGHT UOM. |
| 24 | CASE_TARE_WEIGHT |  |  |  | NUMERIC (12,4) | Contains the weight to be subtracted for packaging materials of a case of the pack in units specified in the WEIGHT UOM. |
| 25 | CASE_WEIGHT_UOM |  | F |  | VARCHAR (4) | Contains the unit of measurement for the case weight, net weight and tare weight (e.g. pounds, kilograms). Valid values for this field are contained in the UOM field on the UOM_CLASS table where the UOM_CLASS = MASS. |
| 26 | CASE_LIQUID_VOLUME |  |  |  | NUMERIC (12,4) | Contains the liquid volume of a case of the pack in units specified in the LIQUID VOLUME UOM. |
| 27 | CASE_LIQUID_VOLUME_UOM |  | F |  | VARCHAR (4) | Contains the unit of measurement for the case liquid volume (e.g. fluid ounces, liters). Valid values for this field are contained in the UOM field on the UOM_CLASS table where the UOM_CLASS = LVOL. |
| 28 | CASE_TARE_TYPE |  |  |  | VARCHAR (6) | Indicates if the case tare weight is wet or dry. Valid values for this field are in the code type TARE. |
| 29 | CASE_STAT_CUBE |  |  |  | NUMERIC (12,4) | Contains the statistical value of the dimensions of a case of the pack. |
| 30 | PALLET_LENGTH |  |  |  | NUMERIC (12,4) | Contains the length of a pallet of the pack in units specified in the LWH UOM. |
| 31 | PALLET_WIDTH |  |  |  | NUMERIC (12,4) | Contains the width of a pallet of the pack in units specified in the LWH UOM. |
| 32 | PALLET_HEIGHT |  |  |  | NUMERIC (12,4) | Contains the height of a pallet of the pack in units specified in the LWH UOM. |
| 33 | PALLET_LWH_UOM |  | F |  | VARCHAR (4) | Contains the unit of measurement for the pallet length, width and height (e.g. inches, centimeters, feet). Valid values for this field are contained in the UOM field on the UOM_CLASS table where the UOM_CLASS = DIMEN. |
| 34 | PALLET_WEIGHT |  |  |  | NUMERIC (12,4) | Contains the weight of a pallet of the pack in units specified in the WEIGHT UOM. |
| 35 | PALLET_NET_WEIGHT |  |  |  | NUMERIC (12,4) | Contains the net weight (i.e. weight without packaging) of a pallet of the pack in units specified in the WEIGHT UOM. |
| 36 | PALLET_TARE_WEIGHT |  |  |  | NUMERIC (12,4) | Contains the weight to be subtracted for packaging materials of a pallet of the pack in units specified in the WEIGHT UOM. |
| 37 | PALLET_WEIGHT_UOM |  | F |  | VARCHAR (4) | Contains the unit of measurement for the pallet weight, net weight and tare weight (e.g. pounds, kilograms). Valid values for this field are contained in the UOM field on the UOM_CLASS table where the UOM_CLASS = MASS. |
| 38 | PALLET_LIQUID_VOLUME |  |  |  | NUMERIC (12,4) | Contains the liquid volume of a pallet of the pack in units specified in the LIQUID VOLUME UOM. |
| 39 | PALLET_LIQUID_VOLUME_UOM |  | F |  | VARCHAR (4) | Contains the unit of measurement for the pallet liquid volume (e.g. fluid ounces, liters). Valid values for this field are contained in the UOM field on the UOM_CLASS table where the UOM_CLASS = LVOL. |
| 40 | PALLET_TARE_TYPE |  |  |  | VARCHAR (6) | Indicates if the pallet tare weight is wet or dry. Valid values for this field are in the code type TARE. |
| 41 | PALLET_STAT_CUBE |  |  |  | NUMERIC (12,4) | Contains the statistical value of the dimensions of a pallet of the pack. |
| 42 | EXISTS_IND |  |  | Y | VARCHAR (1) | Indicates if the pack already exists on the Item Master table (i.e. has already been created). This indicator is used by the Simple Pack Setup module to determine if a pack needs to be built or already exists. Valid values are Yes and No. |
| 43 | TOLERANCE_TYPE |  |  |  | VARCHAR (6) | The unit of the tolerances for catch weight simple packs. Valid values are: A - actual P - percent. |
| 44 | MAX_TOLERANCE |  |  |  | NUMERIC (12,4) | The maximum tolerance value for the catch weight simple pack. |
| 45 | MIN_TOLERANCE |  |  |  | NUMERIC (12,4) | The minimum tolerance value for a catch weight simple pack. |
| 46 | COST_UOM |  | F | Y | VARCHAR (4) | A cost UOM is held to allow costs to be managed in a separate UOM to the standard UOM. |
| 47 | ORDER_TYPE |  |  |  | VARCHAR (6) | This determines how catch weight items are ordered. Valid values are: F - fixed weight V - Variable weight |
| 48 | SALE_TYPE |  |  |  | VARCHAR (6) | This indicates the method of how catch weight items are sold in store locations. Valid values are: V - variable weight each L - Loose weight |
| 49 | NOTIONAL_PACK_IND |  |  | Y | VARCHAR (1) | This is to indicate that the pack item should post the transaction at component level in SIM. |
| 50 | SOH_INQUIRY_AT_PACK_IND |  |  | Y | VARCHAR (1) | This indicates that the the stock on hand is shown at pack level in down stream applications when it is called in POS from SIM. |
| 51 | PRIMARY_MANU_CTRY_ID |  | F | Y | VARCHAR (3) | This column indicates the primary country of manufacture for the item and supplier. |
| 52 | DEFAULT_LOC |  |  |  | NUMERIC (10) | This will hold the default location (store or warehouse) of the delivery country attached to the item. |
| 53 | NIC_STATIC_IND |  |  | Y | VARCHAR (1) | This will indicate if the Negotiated Item Cost (NIC) of the pack item is static or not. |
| 54 | DELIVERY_COUNTRY_ID |  | F |  | VARCHAR (3) | This contains the delivery country of the item. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|SIMPLE_PACK_TEMP_I6|||||PALLET_WEIGHT_UOM|ASC|
|SIMPLE_PACK_TEMP_I4|||||CASE_LIQUID_VOLUME_UOM|ASC|
|SIMPLE_PACK_TEMP_I7|||||PALLET_LIQUID_VOLUME_UOM|ASC|
|SIMPLE_PACK_TEMP_I8|||||COST_UOM|ASC|
|SIMPLE_PACK_TEMP_I5|||||PALLET_LWH_UOM|ASC|
|SIMPLE_PACK_TEMP_I2|||||CASE_LWH_UOM|ASC|
|SIMPLE_PACK_TEMP_I3|||||CASE_WEIGHT_UOM|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|SIMPLE_PACK_TEMP_I1|||||ITEM|ASC|
||||||PRIMARY_SUPP|ASC|
||||||PRIMARY_CNTRY_ID|ASC|
||||||PRIMARY_MANU_CTRY_ID|ASC|
|SIMPLE_PACK_TEMP_I9|||||ITEM|ASC|
||||||PRIMARY_SUPP|ASC|
||||||PRIMARY_MANU_CTRY_ID|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_SIMPLE_PACK_TEMP_CONST_DIM|CONST_DIMEN_IND IN ('Y','N')<br>|
||CHK_SIMPLE_PACK_TEMP_EXIST_IND|EXISTS_IND in ('Y', 'N')<br>|
||CHK_SIMPLE_PACK_TEMP_SELL_IND|SELLABLE_IND in ('Y', 'N')<br>|
||CHK_SPP_NOTIONAL_PACK_IND|NOTIONAL_PACK_IND in ('N','Y')<br>|
||CHK_SPP_ORDER_TYPE|ORDER_TYPE in ('F','V')<br>|
||CHK_SPP_SALE_TYPE|SALE_TYPE in ('V','L')<br>|
||CHK_SPP_SOH_AT_PACK_LEVEL|SOH_INQUIRY_AT_PACK_IND in ('Y','N')<br>|
||CHK_SPP_TOLERANCE_TYPE|TOLERANCE_TYPE in ('A','P')<br>|
|Column Level|CONST_DIMEN_IND||
||SELLABLE_IND||






|Type|Column / Constraint Name|Details|
|---|---|---|
||EXISTS_IND||
||TOLERANCE_TYPE||
||ORDER_TYPE||
||SALE_TYPE||
||SOH_INQUIRY_AT_PACK_IND||
