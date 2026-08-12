# RMS Item Master & Core Items Datamodel - Physical Data Model Reference

## Table: BRAND

**Description:** With Cross channel integration, online order capture systems will like to display brand information of an item. This table holds all the required brands and descriptions which would be linked to the items in RMS.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | BRAND_NAME | P |  | Y | VARCHAR (30) | This column holds the Brand name. |
| 2 | BRAND_DESCRIPTION |  |  | Y | VARCHAR (120) | This column holds the description of the Brand. |
| 3 | CREATE_DATETIME |  |  | Y | Date | This column holds the record creation date. |
| 4 | LAST_UPDATE_DATETIME |  |  | Y | Date | This column holds the record updated date. |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |
| 6 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_BRAND|PK||||BRAND_NAME|ASC|

### Constraints

|Type|Column /<br>Constraint Name|Details|
|---|---|---|
|Table Level|CHK_BRAND_NAME|BRAND_NAME = upper(BRAND_NAME)<br>|
|Column Level|BRAND_NAME||

---

## Table: BRAND_TL

**Description:** This is the translation table for BRAND table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | BRAND_NAME | P | F | Y | VARCHAR (30) | This column holds the Brand name. |
| 3 | BRAND_DESCRIPTION |  |  | Y | VARCHAR (120) | This column holds the description of the Brand. |
| 4 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 6 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 7 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_BRAND_TL|PK||||LANG|ASC|
||||||BRAND_NAME|ASC|

---

## Table: ITEM_MASTER

**Description:** This table holds all the main attributes and records for all items and pack items in RMS. Additionally this table has referential integrity on itself which hold the links between grandparent, parent and child items.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM | P |  | Y | VARCHAR (25) | Unique alphanumeric value that identifies the item. |
| 2 | ITEM_NUMBER_TYPE |  |  | Y | VARCHAR (6) | Code specifying what type the item is. Valid values for this field are in the code type UPCT on the code_head and code_detail tables. |
| 3 | FORMAT_ID |  |  |  | VARCHAR (1) | This field will hold the format ID that corresponds to the items variable UPC. This value is only used for items with variable UPCs. |
| 4 | PREFIX |  |  |  | NUMERIC (2) | This column holds the prefix for variable weight UPCs. The prefix determines the format of the eventual UPC and will be used to decode variable weight UPCs that are uploaded from the POS. It is the clients responsibility to download this value to their scale systems. |
| 5 | ITEM_PARENT |  | F |  | VARCHAR (25) | Alphanumeric value that uniquely identifies the item/group at the level above the item. This value must exist as an item in another row on the item_master table. |
| 6 | ITEM_GRANDPARENT |  | F |  | VARCHAR (25) | Alphanumeric value that uniquely identifies the item/group two levels above the item. This value must exist as both an item and an item parent in another row on the item_master table. |
| 7 | PACK_IND |  |  | Y | VARCHAR (1) | Indicates if the item is a pack. A pack item is a collection of items that may be either ordered or sold as a unit. Packs require details (i.e. component items and qtys, etc.) that other items do not. This field is required by the database. |
| 8 | ITEM_LEVEL |  |  | Y | NUMERIC (1) | Number indicating which of the three levels the item resides. The item level determines if the item stands alone or if it is part of a family of related items. The item level also determines how the item may be used throughout the system. |
| 9 | TRAN_LEVEL |  |  | Y | NUMERIC (1) | Number indicating which of the three levels transactions occur for the items group. The transaction level is the level at which the items inventory is tracked in the system. The transaction level item will be counted, transferred, shipped, etc. The transaction level may be at the current item or up to 2 levels above or below the current item. Only one level of the hierarchy of an item family may contain transaction level |
| 10 | ITEM_AGGREGATE_IND |  |  | Y | VARCHAR (1) | Indicator to aggregate inventory and sales for the item. Currently, this indiactor is used by allocation and MFP to aggregate inventory for items. For staple items this indictor should be N. |
| 11 | DIFF_1 |  |  |  | VARCHAR (10) | Diff_group or diff_id that differentiates the current item from its item_parent. For an item that is a parent, this field may be either a group (i.e. Mens pant sizes) or a value (6 oz). For an item that is not a parent, this field may contain a value (34X34, Red, etc.) Valid values are found on the diff_group and diff_id tables. |
| 12 | DIFF_1_AGGREGATE_IND |  |  | Y | VARCHAR (1) | Indicator for the corresponding diff. Indicator to aggregate inventory and sales for an item at Parent/Diff level (e.g Style/Color or Style/Size ). This indicator is currently used by allocation and MFP. |
| 13 | DIFF_2 |  |  |  | VARCHAR (10) | Diff_group or diff_id that differentiates the current item from its item_parent. For an item that is a parent, this field may be either a group (i.e. Mens pant sizes) or a value (6 oz). For an item that is not a parent, this field may contain a value (34X34, Red, etc.) Valid values are found on the diff_group and diff_id tables. |
| 14 | DIFF_2_AGGREGATE_IND |  |  | Y | VARCHAR (1) | Indicator for the corresponding diff. Indicator to aggregate inventory and sales for an item at Parent/Diff level (e.g Style/Color or Style/Size ). This indicator is currently used by allocation and MFP. |
| 15 | DIFF_3 |  |  |  | VARCHAR (10) | Diff_group or diff_id that differentiates the current item from its item_parent. For an item that is a parent, this field may be either a group (i.e. Mens pant sizes) or a value (6 oz). For an item that is not a parent, this field may contain a value (34X34, Red, etc.) Valid values are found on the diff_group and diff_id tables. |
| 16 | DIFF_3_AGGREGATE_IND |  |  | Y | VARCHAR (1) | Indicator for the corresponding diff. Indicator to aggregate inventory and sales for a fashion item at Parent/Diff level (e.g Style/Color or Style/Size ). This indicator is currently used by allocation and MFP |
| 17 | DIFF_4 |  |  |  | VARCHAR (10) | Diff_group or diff_id that differentiates the current item from its item_parent. For an item that is a parent, this field may be either a group (i.e. Mens pant sizes) or a value (6 oz). For an item that is not a parent, this field may contain a value (34X34, Red, etc.) Valid values |
| 18 | DIFF_4_AGGREGATE_IND |  |  | Y | VARCHAR (1) | Indicator for the corresponding diff. Indicator to aggregate inventory and sales for an item at Parent/Diff level (e.g Style/Color or Style/Size ). This indicator is currently used by allocation and MFP. |
| 19 | DEPT |  | F | Y | NUMERIC (4) | Number identifying the department to which the item is attached. The items department will be the same as that of its parent (and, by transitivity, to that of its grandparent). Valid values for this field are located on the deps table. |
| 20 | CLASS |  | F | Y | NUMERIC (4) | Number identifying the class to which the item is attached. The items class will be the same as that of its parent (and, by transitivity, to that of its grandparent). Valid values for this field are located on the class table. |
| 21 | SUBCLASS |  | F | Y | NUMERIC (4) | Number identifying the subclass to which the item is attached. The items subclass will be the same as that of its parent (and, by transitivity, to that of its grandparent). Valid values for this field are located on the subclass table. |
| 22 | STATUS |  |  | Y | VARCHAR (1) | Status of the item. Valid values are: W = Worksheet: item setup in progress, cannot be used in system S = Submitted: item setup complete and awaiting approval, cannot be use in system A = Approved: item is approved and can now be used throughout the system |
| 23 | ITEM_DESC |  |  | Y | VARCHAR (250) | Long description of the item. This description is used through out the system to help online users identify the item. For items that have parents, this description will default to the parents description plus any differentiators. For items without parents, this description will default to null. |
| 24 | ITEM_DESC_SECONDARY |  |  |  | VARCHAR (250) | Secondary descriptions of the item. This field can only be populated when system_options.secondary_desc_ind = Y. |
| 25 | SHORT_DESC |  |  | Y | VARCHAR (120) | Shortened description of the item. This description is the default for downloading to the POS. For items that have parents, this description will default to the parents short description. For items without parents, this description will default to null. |
| 26 | DESC_UP |  |  | Y | VARCHAR (250) | All upper case description of the item (same as upper(item_desc)). This field is not displayed in the on-line item maintenance dialog, but is used in item list of value search processing through out the system. |
| 27 | PRIMARY_REF_ITEM_IND |  |  | Y | VARCHAR (1) | Indicates if the sub-transation level item is designated as the primary sub-transaction level item. For transaction level items and above the value in this field will be No. |
| 28 | COST_ZONE_GROUP_ID |  | F |  | NUMERIC (4) | Cost zone group associated with the item. This field is only required when elc_ind (landed cost indicator) is set to Y on the system_options table. |
| 29 | STANDARD_UOM |  | F | Y | VARCHAR (4) | Unit of measure in which stock of the item is tracked at a corporate level. |
| 30 | UOM_CONV_FACTOR |  |  |  | NUMERIC (20,10) | Conversion factor between an Each and the standard_uom when the standard_uom is not in the quantity class (e.g. if standard_uom = lb and 1 lb = 10 eaches, this factor will be 10). This factor will be used to convert sales and stock data when an item is retailed in eaches but does not have eaches as its standard unit of measure. |
| 31 | PACKAGE_SIZE |  |  |  | NUMERIC (12,4) | Holds the size of the product printed on any packaging (i.e. 24 ounces). This field is used for reporting purposes, as well as by Oracle Retail Price Mangement to determine same sized and different sized items. |
| 32 | PACKAGE_UOM |  | F |  | VARCHAR (4) | Holds the unit of measure associated with the package size. This field is used for reporting purposes and by Oracle Retail Price Management to determine same sized and different sized items. |
| 33 | MERCHANDISE_IND |  |  | Y | VARCHAR (1) | Indicates if the item is a merchandise item (Y, N). |
| 34 | STORE_ORD_MULT |  |  | Y | VARCHAR (1) | Merchandise shipped from the warehouses to the stores must be specified in this unit type. Valid values are: C = Cases I = Inner E = Eaches |
| 35 | FORECAST_IND |  |  | Y | VARCHAR (1) | Indicates if this item will be interfaced to an external forecasting system (Y, N). |
| 36 | ORIGINAL_RETAIL |  |  |  | NUMERIC (20,4) | The original retail price of the item per unit. This field is stored in the primary currency. |
| 37 | MFG_REC_RETAIL |  |  |  | NUMERIC (20,4) | Manufacturers recommended retail price for the item. Used for informational purposes only. This field is stored in the primary currency. |
| 38 | RETAIL_LABEL_TYPE |  |  |  | VARCHAR (6) | This field indicates any special lable type assoctiated with an item (i.e. pre-priced or cents off). This field is used for reporting purposes only. Values for this field are defined by the RTLT code on code detail. |
| 39 | RETAIL_LABEL_VALUE |  |  |  | NUMERIC (20,4) | This field represents the value associated with the retail label type. |
| 40 | HANDLING_TEMP |  |  |  | VARCHAR (6) | Holds the temperature information associated with the item. Valid values for this field are in the code type HTMP on the code_head and code_detail tables. |
| 41 | HANDLING_SENSITIVITY |  |  |  | VARCHAR (6) | Holds the sensitivity information associated with the item. Valid values for this field are in the code type HSEN on the code_head and code_detail tables. |
| 42 | CATCH_WEIGHT_IND |  |  | Y | VARCHAR (1) | Indiactes whether the item should be weighed when it arives at a location. Valid values for this field are Y and N. |
| 43 | WASTE_TYPE |  |  |  | VARCHAR (6) | Identifies the wastage type as either sales or spoilage wastage. Sales wastage occurs during processes that make an item saleable (i.e. fat is trimmed off at customer request). Spoilage wastage occurs during the products shelf life (i.e. evaporation causes the product to weigh less after a period of time). Valid values are: SP = Spoilage SL = Sales Wastage is not applicable to pack items. |
| 44 | WASTE_PCT |  |  |  | NUMERIC (12,4) | Average percent of wastage for the item over its shelf life. Used in inflating the retail price for wastage items. |
| 45 | DEFAULT_WASTE_PCT |  |  |  | NUMERIC (12,4) | Default daily wastage percent for spoilage type wastage items. This value will default to all item locations and represents the average amount of wastage that occurs on a daily basis. |
| 46 | CONST_DIMEN_IND |  |  | Y | VARCHAR (1) | Indicates that the dimensions of the product are always the same, regardless of the supplier. If this field is Y, the dimensions for all suppliers will be defaulted to the primary supplier/primary country dimensions. Editing of dimensions for the item will only be allowed for the primary supplier/primary country. |
| 47 | SIMPLE_PACK_IND |  |  | Y | VARCHAR (1) | Indicates if pack item is a simple pack or not. This field will only be available if the item is a pack item. A simple pack is an item whose components are all the same item (i.e. a six pack of cola, etc). Valid values are: Y = Yes, this item is a simple pack N = No, this item is not a simple pack |
| 48 | CONTAINS_INNER_IND |  |  | Y | VARCHAR (1) | Indicates if pack item contains inner packs. Vendor packs will never contain inner packs and this field will be defaulted to N. This field will only be available if the item is a pack item. Valid values are: Y = Yes, this pack contains inner packs N = No, this pack does not contain inner packs |
| 49 | SELLABLE_IND |  |  | Y | VARCHAR (1) | Indicates if the item may be sold. For pack items, if it is Y then the pack will have its own unique unit retail. If it is N then the pack’s unit retail is the sum of each individual items total retail within the pack. Valid values are Y or N. |
| 50 | ORDERABLE_IND |  |  | Y | VARCHAR (1) | Indicates if the item can be ordered. For pack items, if it is Y then the suppliers of the pack must supply all components in the pack. If it is N then the components may have different suppliers. Valid values are Y or N. |
| 51 | PACK_TYPE |  |  |  | VARCHAR (1) | Indicates if pack item is a vendor pack or a buyer pack. A vendor pack is a pack that the vendor or supplier recognizes and sells to the retailer. If the pack item is a vendor pack, communication with the supplier will use the vendor pack number. A buyer pack is a pack that a buyer has created for internal ease of use. If the pack item is a buyer pack, communication with the supplier will explode the pack out to its component items. This field will only be available if the item is a pack item. If the pack item is not orderable this field must be NULL. Valid values are: V = Vendor B = Buyer |
| 52 | ORDER_AS_TYPE |  |  |  | VARCHAR (1) | Indicates if pack item is receivable at the component level or at the pack level (for a buyer pack only). This field is required if pack item is an orderable buyer pack. This field must be NULL if the pack is sellable only or a vendor pack. This field will only be available if the item is a pack |
| 53 | COMMENTS |  |  |  | VARCHAR (2000) | Holds any comments associated with the item. |
| 54 | ITEM_SERVICE_LEVEL |  |  |  | VARCHAR (6) | Holds a value that restricts the type of shipment methods that RCOM can select for an item. |
| 55 | GIFT_WRAP_IND |  |  | Y | VARCHAR (1) | This field will contain a value of Y if the item is eligible to be gift wrapped. |
| 56 | SHIP_ALONE_IND |  |  | Y | VARCHAR (1) | This field will contain a value of Y if the item should be shipped to the customer is a seperate package versus being grouped together in a box. |
| 57 | CREATE_DATETIME |  |  | Y | Date | Date/time stamp of when the record was created. This date/time will be used in export processing. This value should only be populated on insert - it should never be updated. |
| 58 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | Holds the Oracle user-id of the user who most recently updated this record. This field is required by the database. |
| 59 | LAST_UPDATE_DATETIME |  |  | Y | Date | Holds the date time stamp of the most recent update by the last_update_id. This field is required by the database. |
| 60 | CHECK_UDA_IND |  |  |  | VARCHAR (1) | This field indicates whether the user has called the itemuda form. Since users may delete defauted UDAs, this will prevent these from being automatically displayed whenever the user enters the itemuda form. |
| 61 | ITEM_XFORM_IND |  |  | Y | VARCHAR (1) | This indicator will show that an item is associated an item transformation. The item will be either the sellable item or orderable item in the transformation process. |
| 62 | INVENTORY_IND |  |  | Y | VARCHAR (1) | This indicator is used to determine if an item holds inventory or not for item transformations. |
| 63 | ORDER_TYPE |  |  |  | VARCHAR (6) | This determines how catch weight items are ordered. Valid values are: F - fixed weight V - Variable weight Valid values are held on the CODE_DETAIL table with a code type = ORDT |
| 64 | SALE_TYPE |  |  |  | VARCHAR (6) | This indicates the method of how catch weight items are sold in store locations. Valid values are: V - variable weight each L - Loose weight Valid values are held on the CODE_DETAIL table with a code type = STPE |
| 65 | DEPOSIT_ITEM_TYPE |  |  |  | VARCHAR (6) | This is the deposit item component type. A NULL value in this field indicates that this item is not part of a deposit item relationship. The possible values are - E - Contents A - Container Z - Crate T - Returned Item (Empty bottle) P - Complex pack (with deposit items) The Returned item is flagged only to enable these items to be mapped to a separate GL account if required. |
| 66 | CONTAINER_ITEM |  | F |  | VARCHAR (25) | This holds the container item number for a contents item. This field is only populated and required if the DEPOSIT_ITEM_TYPE = E. |
| 67 | DEPOSIT_IN_PRICE_PER_UOM |  |  |  | VARCHAR (6) | This field indicates if the deposit amount is included in the price per UOM calculation for a contents item ticket. This value is only required if the DEPOSIT_ITEM_TYPE = E. Valid values are: I - Include deposit amount E - Exclude deposit amount |
| 68 | AIP_CASE_TYPE |  |  |  | VARCHAR (6) | Only used if AIP is integrated. Determines which case sizes to extract against an item in the AIP interface. Applicable only to non-pack orderable items. |
| 69 | CATCH_WEIGHT_TYPE |  |  |  | VARCHAR (1) | This column will hold catch weight type for a simple pack catch weight item. The value is based on the component items order_type and sale_type: 2 - order_type = Variable Weight, sale_type = Loose Weight 4 - order_type = Variable Weight, sale_type = Variable Weight Each The column will be set only at the time of Item approval. It will be used by the ReIM Invoice Matching process |
| 70 | PERISHABLE_IND |  |  | Y | VARCHAR (1) | A grocery item attribute used to indicate whether an item is perishable or not. |
| 71 | SOH_INQUIRY_AT_PACK_IND |  |  | Y | VARCHAR (1) | This indicates to show the stock on hand at pack level in down stream applications when it is called in POS from SIM. |
| 72 | NOTIONAL_PACK_IND |  |  | Y | VARCHAR (1) | This is to indicate that the pack item should post the transaction at pack level in SIM. If this indicator is checked in RMS, SIM will track pack item at the pack level. If the indicator is not checked in RMS, SIM will store inventory at the component level. |
| 73 | CATCH_WEIGHT_UOM |  | F |  | VARCHAR (4) | UOM for Catchweight Items. |
| 74 | PRODUCT_CLASSIFICATION |  |  | Y | VARCHAR (6 ) | Product classification is informational only in RMS, but is used by RWMS to determine how to pack customer orders : such as to determine products that may not be able to be packaged together. Classifications are set up as codes in RMS and should be configured as part of an implementation to include classifications that are applicable for each retailer. Examples of classifications may include fragile, toxic, heavy, etc. |
| 75 | BRAND_NAME |  | F |  | VARCHAR (30) | This field contains the brand associated to an item |
| 76 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |
| 77 | ALC_ITEM_TYPE |  |  | Y | VARCHAR (15) | This item type is used by RMS and Oracle Retail Allocation to determine the display and behavior of an item in certain function. The value in this column is determined by the way that the item is created in RMS, as follows: Non-pack items: - Reference Item: Item Level = Tran Level + 1 value will be NULL - Fashion Style: Item Level = Tran Level - 1 value will be STYLE - Fashion SKU: non-pack item, where Item Level = Tran Level and item parent is NOT NULL and item aggregate = Y value will be FASHIONSKU - Staple Item: non-pack item, where Item Level = Tran Level and item parent is NOT NULL and item aggregate = N, or non-pack item, where Item Level = Tran Level and item parent is NULL value will be ST Sellable Packs (pack = Y, sellable = Y): - Sellable Pack value will be SELLPACK Simple Non-sellable Packs (simple pack = Y, sellable = N): - Non-sellable Fashion Simple Pack: component item's parent has item aggregate = Y value will be NSFSP - Non-sellable Staple Simple Pack: component item's parent has item aggregate = N (or no parent item) value will be NSSSP |
| 78 | CURR_SELLING_UNIT_RETAIL |  |  |  | NUMERIC (20,4) | This field contains the current selling unit retail of the item. |
| 79 | CURR_SELLING_UOM |  |  |  | VARCHAR (4 ) | This field contains the current selling UOM of the item. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_ITEM_MASTER|PK||||ITEM|ASC|
|ITEM_MASTER_I1|||||ITEM_PARENT|ASC|
|ITEM_MASTER_I2|||||ITEM_GRANDPARENT|ASC|
|ITEM_MASTER_I5|||||COST_ZONE_GROUP_ID|ASC|
|ITEM_MASTER_I9|||||CATCH_WEIGHT_UOM|ASC|
|ITEM_MASTER_I7|||||PACKAGE_UOM|ASC|
|ITEM_MASTER_I8|||||CONTAINER_ITEM|ASC|
|ITEM_MASTER_I6|||||STANDARD_UOM|ASC|
|ITEM_MASTER_I12|||||ITEM_AGGREGATE_IND|ASC|
||||||DEPT|ASC|
|ITEM_MASTER_I10|||||ITEM_DESC|ASC|
|ITEM_MASTER_I13||Y||GET_ITEM_TYPE(SIMPLE_PACK_IND,PACK_IND,|||





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|||||DEPOSIT_ITEM_TYPE,ITEM_XFORM_IND,ORDERABLE_IND,DEPT)|||
|ITEM_MASTER_I14||Y||GET_PRIMARY_ITEM_SUPPLIER(ITEM)|||
|ITEM_MASTER_I15||Y||GET_ITEM_STATUS(ITEM,ITEM_PARENT,ITEM_GRANDPARENT,STATUS)|||
|ITEM_MASTER_I16||Y||GET_PRIMARY_ITEM_SUPPLIER_VPN(ITEM)|||
|ITEM_MASTER_I3|||||DEPT|ASC|
||||||CLASS|ASC|
||||||SUBCLASS|ASC|
||||||ITEM|ASC|
||||||ITEM_LEVEL|ASC|
||||||TRAN_LEVEL|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_IEM_DEPOSIT_ITEM_TYPE|DEPOSIT_ITEM_TYPE in ('E','A','Z','T','P')<br>|
||CHK_IEM_DEPOSIT_PRICE_PER_UOM|DEPOSIT_IN_PRICE_PER_UOM in ('I','E')<br>|
||CHK_IEM_INVENTORY_IND|INVENTORY_IND in ('Y','N')<br>|
||CHK_IEM_ITEM_XFORM_IND|ITEM_XFORM_IND in ('Y','N')<br>|
||CHK_IEM_ORDER_TYPE|ORDER_TYPE in ('F','V')<br>|
||CHK_IEM_PERISHABLE_IND|PERISHABLE_IND in ('Y','N')<br>|
||CHK_IEM_SALE_TYPE|SALE_TYPE in ('V','L')<br>|
||CHK_ITEM_MASTER_BANDED_ITEM_IN|banded_item_ind in ('Y','N')<br>|






|Type|Column / Constraint Name|Details|
|---|---|---|
||CHK_ITEM_MASTER_CATCH_WEIGHT|catch_weight_ind in ('Y','N')<br>|
||CHK_ITEM_MASTER_CATCH_WGT_TYP|CATCH_WEIGHT_TYPE IN ('1','2','3','4')<br>|
||CHK_ITEM_MASTER_CHECK_UDA_IND|CHECK_UDA_IND in ('Y','N')<br>|
||CHK_ITEM_MASTER_CONST_DIM_IND|const_dimen_ind in ('Y','N')<br>|
||CHK_ITEM_MASTER_CONT_INNER_IND|contains_inner_ind in ('Y','N')<br>|
||CHK_ITEM_MASTER_DESC_UP|desc_up = upper(desc_up)<br>|
||CHK_ITEM_MASTER_DIFF_1_AGGREGA|DIFF_1_AGGREGATE_IND in ('Y','N')<br>|
||CHK_ITEM_MASTER_DIFF_2_AGGREGA|DIFF_2_AGGREGATE_IND in ('Y','N')<br>|
||CHK_ITEM_MASTER_DIFF_3_AGGREGA|DIFF_3_AGGREGATE_IND in ('Y','N')<br>|
||CHK_ITEM_MASTER_DIFF_4_AGGREGA|DIFF_4_AGGREGATE_IND in ('Y','N')<br>|
||CHK_ITEM_MASTER_FORECAST_IND|forecast_ind in ('Y','N')<br>|
||CHK_ITEM_MASTER_GIFT_WRAP_IND|GIFT_WRAP_IND in ('Y', 'N')|
||CHK_ITEM_MASTER_ITEM_AGGREGATE|ITEM_AGGREGATE_IND in ('Y','N')<br>|
||CHK_ITEM_MASTER_ITEM_LEVEL|item_level in (1,2,3)<br>|
||CHK_ITEM_MASTER_MERCH_IND|merchandise_ind in ('Y','N')<br>|
||CHK_ITEM_MASTER_NOTIONAL_PC_IN|NOTIONAL_PACK_IND in ('Y','N')<br>|






|Type|Column / Constraint Name|Details|
|---|---|---|
||CHK_ITEM_MASTER_ORDERABLE_IND|orderable_ind in ('Y','N')<br>|
||CHK_ITEM_MASTER_ORDER_AS_TYPE|((orderable_ind = 'Y' and pack_type = 'B' and order_as_type is not null) or (orderable_ind = 'N' and order_as_type is null) or (sellable_ind<br>= 'Y' and order_as_type is null) or (pack_type = 'V' and order_as_type is null)) and order_as_type in ('E','P')<br>|
||CHK_ITEM_MASTER_PACKAGE_SIZE|(package_size is not NULL and package_uom is not NULL) or (package_size is NULL and package_uom is NULL)<br>|
||CHK_ITEM_MASTER_PACK_IND|pack_ind in ('Y','N')<br>|
||CHK_ITEM_MASTER_PACK_TYPE|(orderable_ind = 'N' and pack_type is null) or (orderable_ind = 'Y' and pack_type in ('V','B'))<br>|
||CHK_ITEM_MASTER_PR_REF_ITM_IND|primary_ref_item_ind in ('Y','N')<br>|
||CHK_ITEM_MASTER_SELLABLE_IND|SELLABLE_IND IN ('Y','N')<br>|
||CHK_ITEM_MASTER_SHIP_ALONE_IND|SHIP_ALONE_IND in ('Y', 'N')<br>|
||CHK_ITEM_MASTER_SIMP_PACK_IND|simple_pack_ind in ('Y','N')<br>|
||CHK_ITEM_MASTER_SOH_AT_PACK_LE|SOH_INQUIRY_AT_PACK_IND in ('Y','N')<br>|
||CHK_ITEM_MASTER_SOH_INQ|(pack_ind = 'Y' AND ((sellable_ind = 'Y' AND ((notional_pack_ind = 'N' AND SOH_INQUIRY_AT_PACK_IND IN ('Y','N')) OR<br>(notional_pack_ind = 'Y' AND SOH_INQUIRY_AT_PACK_IND= 'N'))) OR (sellable_ind = 'N' AND notional_pack_ind = 'N' AND<br>SOH_INQUIRY_AT_PACK_IND IN ('Y','N')))) OR (pack_ind = 'N' AND notional_pack_ind = 'N' AND SOH_INQUIRY_AT_PACK_IND= 'N')<br>|
||CHK_ITEM_MASTER_STORE_ORD_MULT|store_ord_mult in ('C','I','E')<br>|
||CHK_ITEM_MASTER_TRAN_LEVEL|tran_level in (1,2,3)|
||CHK_ITEM_MASTER_WASTE_NULL|(waste_type is null and waste_pct is null) or (waste_type is not null and waste_pct is not null)<br>|
||CHK_ITEM_MASTER_WASTE_TYPE|waste_type in ('SL','SP')<br>|





|Type|Column / Constraint Name|Details|
|---|---|---|
||CHK_ITEM_MASTER_STATUS|STATUS IN ('W', 'S', 'A')<br>|
|Column Level|PACK_IND||
||TRAN_LEVEL||
||STATUS||
||DESC_UP||
||MERCHANDISE_IND||
||STORE_ORD_MULT||
||FORECAST_IND||
||CATCH_WEIGHT_IND||
||WASTE_TYPE||
||CONST_DIMEN_IND||
||CONTAINS_INNER_IND||
||SELLABLE_IND||
||ORDERABLE_IND||
||GIFT_WRAP_IND||
||SHIP_ALONE_IND||
||CHECK_UDA_IND||
||INVENTORY_IND||
||ORDER_TYPE||
||SALE_TYPE||
||DEPOSIT_IN_PRICE_PER_UOM||
||CATCH_WEIGHT_TYPE||
||PERISHABLE_IND||

---

## Table: ITEM_MASTER_CFA_EXT

**Description:** This is the custom attribute extension table for the entity ITEM_MASTER.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM | P | F | Y | VARCHAR (25) | This column holds the Item this extended data is associated with. |
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
|PK_ITEM_MASTER_CFA_EXT|PK||||ITEM|ASC|
||||||GROUP_ID|ASC|

---

## Table: ITEM_MASTER_TL

**Description:** This is the translation table for ITEM_MASTER table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | ITEM | P | F | Y | VARCHAR (25) | Unique alphanumeric value that identifies the item. |
| 3 | ITEM_DESC |  |  | Y | VARCHAR (250) | Long description of the item. This description is used through out the system to help online users identify the item. For items that have parents, this description will default to the parents description plus any differentiators. For items without parents, this description will default to null. |
| 4 | ITEM_DESC_SECONDARY |  |  |  | VARCHAR (250) | Secondary descriptions of the item. This field can only be populated when system_options.secondary_desc_ind = Y. |
| 5 | SHORT_DESC |  |  | Y | VARCHAR (120) | Shortened description of the item. This description is the default for downloading to the POS. For items that have parents, this description will default to the parents short description. For items without parents, this description will default to null. |
| 6 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 7 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 8 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 9 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

---

## Table: ITEM_SEASONS

**Description:** This table will contain all seasons/phases for a given item. Any given item may have multiple seasons and/or multiple phases.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM | P | F | Y | VARCHAR (25) | Alphanumeric value that identifies either the item or item parent. |
| 2 | SEASON_ID |  | F | Y | NUMERIC (3) | The season identifier. |
| 3 | PHASE_ID |  | F | Y | NUMERIC (3) | The phase identifier. |
| 4 | ITEM_SEASON_SEQ_NO | P |  | Y | NUMERIC (4) | This field contains a sequence number that combined with the item number will make each record unique. |
| 5 | DIFF_ID |  | F |  | VARCHAR (10) | This field will hold a value for group/differentiator combination records only. |
| 6 | CREATE_DATETIME |  |  | Y | Date | Date/time stamp of when the record was created. This date/time will be used in export processing. This value should only be populated on insert - it should never be updated. |
| 7 | LAST_UPDATE_DATETIME |  |  | Y | Date | Holds the date time stamp of the most recent update by the last_update_id. This field is required by the database. |
| 8 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | Holds the Oracle user-id of the user who most recently updated this record. This field is required by the database. |
| 9 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_ITEM_SEASONS|PK||||ITEM|ASC|
||||||ITEM_SEASON_SEQ_NO|ASC|
|UK_ITEM_SEASONS|UK||||ITEM|ASC|
||||||SEASON_ID|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
||||||PHASE_ID|ASC|
||||||DIFF_ID|ASC|
|ITEM_SEASONS_I1|||||SEASON_ID|ASC|
||||||PHASE_ID|ASC|
|ITEM_SEASONS_I2|||||DIFF_ID|ASC|

---

## Table: ITEM_SUPP_COUNTRY

**Description:** This table holds all item supplier origin country relationships.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM | P | F | Y | VARCHAR (25) | Alphanumeric value that identifies the item. |
| 2 | SUPPLIER | P | F | Y | NUMERIC (10) | The unique identifier for the supplier. |
| 3 | ORIGIN_COUNTRY_ID | P | F | Y | VARCHAR (3) | The country where the item was manufactured or significantly altered. |
| 4 | UNIT_COST |  |  | Y | NUMERIC (20,4) | This field contains the current corporate unit cost for the SKU from the supplier/origin country. This field is stored in item's standard uom and in supplier currency. This value will match the cost field for the primary location on item_supp_country_loc. This field may be edited while the item is in worksheet status. If edited, the user will have the choice of changing the cost of all locations, or only the primary location. This cost is the cost that will be written to item_supp_country_loc when new locations are added to an item. |
| 5 | LEAD_TIME |  |  |  | NUMERIC (4) | This field indicates the number of days that will elapse between the date an order is written for the item and the date it is ready for shipment from the supplier. |
| 6 | PICKUP_LEAD_TIME |  |  |  | NUMERIC (4) | Indicates the number of days to ship the item from the supplier to the initial receiving location on a purchase order. |
| 7 | SUPP_PACK_SIZE |  |  | Y | NUMERIC (12,4) | This field contains the quantity that orders must be placed in multiples of for the supplier for the item. |
| 8 | INNER_PACK_SIZE |  |  | Y | NUMERIC (12,4) | This field contains the units of an item contained in an inner pack supplied by the supplier. |
| 9 | ROUND_LVL |  |  | Y | VARCHAR (6) | This column will be used to determine how order quantities will be rounded to Case, Layer and Pallet. |
| 10 | ROUND_TO_INNER_PCT |  |  | Y | NUMERIC (12,4) | This column will hold the Inner Rounding Threshold value. During rounding, this value is used to determine whether to round partial Inner quantities up or down. If the Inner-fraction in question is less than the Threshold proportion, it is rounded down; if not, it is rounded up. For instance, with an Inner size of 10 and a Threshold of 80%, Inner quantities such as 18, 29 and 8 would be rounded up to 20, 30 and 10 respectively, while quantities of 12, 27 and 35 would be rounded down to 10, 20 and 30 respectively. Quantities are never rounded down to zero; a quantity of 7, in the example above, would be rounded up to 10. This column will be maintained simply for the purpose of defaulting to the Item/Supplier/Country/Location level. |
| 11 | ROUND_TO_CASE_PCT |  |  | Y | NUMERIC (12,4) | This column will hold the Case Rounding Threshold value. During rounding, this value is used to determine whether to round partial Case quantities up or down. If the Case-fraction in question is less than the Threshold proportion, it is rounded down; if not, it is rounded up. For instance, with an Case size of 10 and a Threshold of 80%, Case quantities such as 18, 29 and 8 would be rounded up to 20, 30 and 10 respectively, while quantities of 12, 27 and 35 would be rounded down to 10, 20 and 30 respectively. Quantities are never rounded down to zero; a quantity of 7, in the example above, would be rounded up to 10. This column will be maintained simply for the purpose of defaulting to the Item/Supplier/Country/Location level |
| 12 | ROUND_TO_LAYER_PCT |  |  | Y | NUMERIC (12,4) | This column will hold the Layer Rounding Threshold value. During rounding, this value is used to determine whether to round partial Layer quantities up or down. If the Layer-fraction in question is less than the Threshold proportion, it is rounded down; if not, it is rounded up. |
| 13 | ROUND_TO_PALLET_PCT |  |  | Y | NUMERIC (12,4) | This column will hold the Pallet Rounding Threshold value. During rounding, this value is used to determine whether to round partial Pallet quantities up or down. If the Pallet -fraction in question is less than the Threshold proportion, it is rounded down; if not, it is rounded up. For instance, with an Pallet size of 10 and a Threshold of 80%, Pallet quantities such as 18, 29 and 8 would be rounded up to 20, 30 and 10 |
| 14 | MIN_ORDER_QTY |  |  |  | NUMERIC (12,4) | This field contains the minimum quantity that can be ordered at one time from the supplier for the item. |
| 15 | MAX_ORDER_QTY |  |  |  | NUMERIC (12,4) | This field contains the maximum quantity that can be ordered at one time from the supplier for the item. |
| 16 | PACKING_METHOD |  |  |  | VARCHAR (6) | This field indicates whether the packing method of the item in the container is Flat or Hanging. Values for this field are store in the PKMT code. |
| 17 | PRIMARY_SUPP_IND |  |  | Y | VARCHAR (1) | This field indicates whether this supplier is the primary supplier for the Item. Each Item can have one and only one primary supplier. This field is stored on this table for performance purposes only. Valid values are Y or N. |
| 18 | PRIMARY_COUNTRY_IND |  |  | Y | VARCHAR (1) | This field indicates whether this country is the primary country for the item/supplier. Each item/supplier combination must have one and only one primary country. Valid values are Y or N. |
| 19 | DEFAULT_UOP |  |  |  | VARCHAR (6) | Contains the default unit of purchase for the item/supplier/country. Valid values include: Standard Units of Measure C for Case P for Pallet |
| 20 | TI |  |  | Y | NUMERIC (12,4) | Number of shipping units (cases) that make up one tier of a pallet. Multiply TI x HI to get total number of units (cases) for a pallet. |
| 21 | HI |  |  | Y | NUMERIC (12,4) | Number of tiers that make up a complete pallet (height). Multiply TI x HI to get total number of units (cases) for a pallet. |
| 22 | SUPP_HIER_TYPE_1 |  | F |  | VARCHAR (6) | Identifies partner type of supplier hierarchy level 1.This field will always have the partner type S1 which indicates manufacturer. |
| 23 | SUPP_HIER_LVL_1 |  | F |  | VARCHAR (10) | Highest level of supplier hierarchy which is uder to indicate a partner, such as a manufacturer, in the supply chain that gives rebates to the retailer. This information is stored on item_supp_country for defaulting into item_supp_country_loc. |
| 24 | SUPP_HIER_TYPE_2 |  | F |  | VARCHAR (6) | Identifies partner type of supplier hierarchy level 2 . This field will always have the partner type S2 which indicates distributor. |
| 25 | SUPP_HIER_LVL_2 |  | F |  | VARCHAR (10) | Second highest level of supplier hierarchy which is uder to indicate a partner, such as a distributor in the supply chain that gives rebates to the retailer. This information is stored on item_supp_country for defaulting into item_supp_country_loc. |
| 26 | SUPP_HIER_TYPE_3 |  | F |  | VARCHAR (6) | Identifies partner type of supplier hierarchy level 3. This field will always have the partner type S3 which indicates wholesaler. |
| 27 | SUPP_HIER_LVL_3 |  | F |  | VARCHAR (10) | Third highest level of supplier hierarchy which is uder to indicate a partner, such as a wholesaler in the supply chain that gives rebates to the retailer. This information is stored on item_supp_country for defaulting into item_supp_country_loc. |
| 28 | CREATE_DATETIME |  |  | Y | Date | Date/time stamp of when the record was created. This date/time will be used in export processing. This value should only be populated on insert - it should never be updated. |
| 29 | LAST_UPDATE_DATETIME |  |  | Y | Date | Holds the date time stamp of the most recent update by the last_update_id. This field is required by the database. |
| 30 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | Holds the Oracle user-id of the user who most recently updated this record. This field is required by the database. |
| 31 | COST_UOM |  | F | Y | VARCHAR (4) | A cost UOM is held to allow costs to be managed in a separate UOM than the standard UOM. The unit cost stored in standard UOM is converted to cost UOM for display in the Item Supplier Country screen. Likewise, if the user enters or updates the unit cost via the Item Supplier Country screen, it is converted to standard UOM before being saved to the table. |
| 32 | TOLERANCE_TYPE |  |  |  | VARCHAR (6) | The unit of the tolerances for catch weight simple packs. Valid values are: A - actual P - percent |
| 33 | MAX_TOLERANCE |  |  |  | NUMERIC (12,4) | The maximum tolerance value for the catch weight simple pack. |
| 34 | MIN_TOLERANCE |  |  |  | NUMERIC (12,4) | The minimum tolerance value for a catch weight simple pack. |
| 35 | NEGOTIATED_ITEM_COST |  |  |  | NUMERIC (20,4) | This will hold the supplier negotiated item cost for the primary delivery country of the item. Once a location is associated with the item, the primary locations negotiated item cost will be stored in this field. |
| 36 | EXTENDED_BASE_COST |  |  |  | NUMERIC (20,4) | This will hold the extended base cost for the primary delivery country of the item. Once a location is associated with the item, the primary locations extended base cost will be stored in this field. Extended base cost is the cost inclusive of all the taxes that affect the WAC. In case of GTAX, Extended Base Cost = Base Cost + Non-recoverable taxes. In case of VAT, Extended Base Cost = Base Cost. |
| 37 | INCLUSIVE_COST |  |  |  | NUMERIC (20,4) | This will hold the inclusive cost for the primary delivery country of the item. Once a location is associated with the item, the primary locations inclusive cost will be stored in this field. This cost will have both the recoverable and non recoverable taxes included. In case of GTAX, Inclusive Cost = Base Cost + Non-recoverable taxes + Recoverable Taxes. In case of VAT, Inclusive Cost = Base Cost + VAT |
| 38 | BASE_COST |  |  |  | NUMERIC (20,4) | This field will hold the tax exclusive cost of the item. |
| 39 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_ITEM_SUPP_COUNTRY|PK||||ITEM|ASC|
||||||SUPPLIER|ASC|
||||||ORIGIN_COUNTRY_ID|ASC|
|ITEM_SUPP_COUNTRY_I6|||||SUPPLIER|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|ITEM_SUPP_COUNTRY_I3|||||SUPP_HIER_TYPE_2|ASC|
||||||SUPP_HIER_LVL_2|ASC|
|ITEM_SUPP_COUNTRY_I4|||||SUPP_HIER_TYPE_3|ASC|
||||||SUPP_HIER_LVL_3|ASC|
|ITEM_SUPP_COUNTRY_I1|||||ORIGIN_COUNTRY_ID|ASC|
|ITEM_SUPP_COUNTRY_I5|||||COST_UOM|ASC|
|ITEM_SUPP_COUNTRY_I2|||||SUPP_HIER_TYPE_1|ASC|
||||||SUPP_HIER_LVL_1|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_ISC_TOLERANCE_TYPE|TOLERANCE_TYPE in ('A','P')<br>|
||CHK_ITEM_SUP_COU_PRI_COUN_IND|primary_country_ind in ('Y','N')<br>|
||CHK_ITEM_SUP_COU_PRI_SUP_IND|primary_supp_ind in ('Y','N')<br>|
||CHK_ITEM_SUP_COU_ROUND_LVL|round_lvl in ('C', 'L', 'P', 'CL', 'LP', 'CLP')<br>|
|Column Level|ROUND_LVL||
||PACKING_METHOD||
||PRIMARY_SUPP_IND||
||PRIMARY_COUNTRY_IND||
||TOLERANCE_TYPE||

---

## Table: ITEM_SUPP_COUNTRY_BRACKET_COST

**Description:** This table will contain the costs at the item/supplier/country/location level for each bracket. The brackets will default in from one of the supplier levels, supplier, supplier/department, supplier/department/location, supplier/location, and costing will be created/edited/stored on this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  | F | Y | VARCHAR (25) | This field contains the unique alphanumeric value that identifies the item. |
| 2 | SUPPLIER |  | F | Y | NUMERIC (10) | This field contains the unique identifying number for a supplier within the system. |
| 3 | ORIGIN_COUNTRY_ID |  | F | Y | VARCHAR (3) | This field contains the unique identifying country abbreviation. |
| 4 | LOCATION |  |  |  | NUMERIC (10) | This field contains the number which identifies the location. Only warehouse locations have bracket costing information. In a multi-channel environment, only virtual warehouse will have bracket information at the item level. |
| 5 | BRACKET_VALUE1 |  |  | Y | NUMERIC (12,4) | This field contains the value of the primary bracket type. A specific value, -999, will be used to hold the FOB/pickup cost of the item. Not all items will have a cost associated with the FOB/pickup value, as it is not required. The values in this field are stored in the bracket UOM 1 field at the associated supplier inventory management level. |
| 6 | LOC_TYPE |  |  |  | VARCHAR (1) | This field contains the type of location in the location field. Valid values are: S = Store, W = Warehouse |
| 7 | DEFAULT_BRACKET_IND |  |  | Y | VARCHAR (1) | This field contains the value which will control which cost is the base cost for processing throughout the system. Each bracket group (either by supplier, supplier/department, supplier/department/location, supplier/location) must have one bracket defined as the default bracket. |
| 8 | UNIT_COST |  |  |  | NUMERIC (20,4) | This field contains the current unit cost for the item from the supplier/origin country/location/bracket. This field is stored in the suppliers currency. This value will match the cost field for the primary location on the item_supp_country_loc table if it is the default bracket. This field may be edited while the item is in worksheet status. |
| 9 | BRACKET_VALUE2 |  |  |  | NUMERIC (12,4) | This field contains the value of the secondary bracket type. The values in this field are stored in the bracket UOM or type 2 field at the supplier inventory management level. |
| 10 | SUP_DEPT_SEQ_NO |  |  | Y | NUMERIC (10) | This field will contain the supplier department sequence number. |
| 11 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |
| 12 | CREATE_DATETIME |  |  | Y | Date | This column holds the record creation date. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|UK_ITEM_SUPP_COUNTRY_BRAC_COST|UK||||ITEM|ASC|
||||||SUPPLIER|ASC|
||||||ORIGIN_COUNTRY_ID|ASC|
||||||LOCATION|ASC|
||||||BRACKET_VALUE1|ASC|
|ITEM_SUPP_COUNTRY_BRAC_COST_I1|||||SUPPLIER|ASC|
||||||BRACKET_VALUE1|ASC|
|ITEM_SUPP_COUNTRY_BRAC_COST_I5|||||SUP_DEPT_SEQ_NO|ASC|
|ITEM_SUPP_COUNTRY_BRAC_COST_I3|||||SUPPLIER|ASC|
||||||LOCATION|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
||||||BRACKET_VALUE1|ASC|
|ITEM_SUPP_COUNTRY_BRAC_COST_I2|||||ITEM|ASC|
||||||SUPPLIER|ASC|
||||||BRACKET_VALUE1|ASC|
|ITEM_SUPP_COUNTRY_BRAC_COST_I4|||||ITEM|ASC|
||||||SUPPLIER|ASC|
||||||LOCATION|ASC|
||||||BRACKET_VALUE1|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_ISBC_LOC_TYPE|LOC_TYPE IN ('S','W','E')<br>|
||CHK_ITEM_SUPP_CN_BR_CO_LOC_TYP|LOC_TYPE IN ('W','S') OR LOC_TYPE IS NULL<br>|
||CHK_ITEM_SUP_CN_BR_CO_DF_BK_IN|DEFAULT_BRACKET_IND IN ('Y','N')<br>|
|Column Level|LOC_TYPE||
||DEFAULT_BRACKET_IND||

---

## Table: ITEM_SUPP_COUNTRY_CFA_EXT

**Description:** This is the custom attribute extension table for the entity ITEM_SUPP_COUNTRY.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM | P | F | Y | VARCHAR (25) | This column holds the Item this extended data is associated with. |
| 2 | SUPPLIER | P | F | Y | NUMERIC (10) | This column holds the Supplier this extended data is associated with. |
| 3 | ORIGIN_COUNTRY_ID | P | F | Y | VARCHAR (3) | This column holds the Origin Country ID this extended data is associated with. |
| 4 | GROUP_ID | P |  | Y | NUMERIC (10) | This column holds the attribute group id that this extended data is associated with. The logical business meaning of the VARCHAR_, NUMBER_ and DATE_ columns on this table are determined by the metadata defined for this attribute. |
| 5 | VARCHAR2_1 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_1 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 6 | VARCHAR2_2 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_2 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 7 | VARCHAR2_3 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_3 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 8 | VARCHAR2_4 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_4 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 9 | VARCHAR2_5 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_5 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 10 | VARCHAR2_6 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_6 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 11 | VARCHAR2_7 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_7 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 12 | VARCHAR2_8 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_8 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 13 | VARCHAR2_9 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_9 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 14 | VARCHAR2_10 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_10 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 15 | NUMBER_11 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_11 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 16 | NUMBER_12 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_12 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 17 | NUMBER_13 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_13 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 18 | NUMBER_14 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_14 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 19 | NUMBER_15 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_15 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 20 | NUMBER_16 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_16 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 21 | NUMBER_17 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_17 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 22 | NUMBER_18 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_18 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 23 | NUMBER_19 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_19 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 24 | NUMBER_20 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_20 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 25 | DATE_21 |  |  |  | Date | This column holds data related to the attribute defined on the CFA_ATTRIB table that references DATE_21 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 26 | DATE_22 |  |  |  | Date | This column holds data related to the attribute defined on the CFA_ATTRIB table that references DATE_22 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 27 | DATE_23 |  |  |  | Date | This column holds data related to the attribute defined on the CFA_ATTRIB table that references DATE_23 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 28 | DATE_24 |  |  |  | Date | This column holds data related to the attribute defined on the CFA_ATTRIB table that references DATE_24 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 29 | DATE_25 |  |  |  | Date | This column holds data related to the attribute defined on the CFA_ATTRIB table that references DATE_25 in CFA_ATTRIB.STORAGE_COL_NAME. |

---

## Table: ITEM_SUPP_COUNTRY_DIM

**Description:** This table will hold dimensions of inner/case/pallet for each item/supplier/country combination.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM | P | F | Y | VARCHAR (25) | Unique alphanumeric value that identifies the item. |
| 2 | SUPPLIER | P | F | Y | NUMERIC (10) | Unique identifier for the supplier. |
| 3 | ORIGIN_COUNTRY | P | F | Y | VARCHAR (3) | The country where the item was manufactured or significantly altered. |
| 4 | DIM_OBJECT | P |  | Y | VARCHAR (6) | Specific object whose dimensions are specified in this record (e.g. case, pallet, each). Valid values for this field are in the code type DIMO on the code_head and code_detail tables. |
| 5 | PRESENTATION_METHOD |  |  |  | VARCHAR (6) | Describes the packaging (if any) being taken into consideration in the specified dimensions. Valid values for this field are in the code type PCKT on the code_head and code_detail tables. |
| 6 | LENGTH |  |  |  | NUMERIC (12,4) | Length of dim_object measured in units specified in lwh_uom. |
| 7 | WIDTH |  |  |  | NUMERIC (12,4) | Width of dim_object measured in units specified in lwh_uom. |
| 8 | HEIGHT |  |  |  | NUMERIC (12,4) | Height of dim_object measured in units specified in lwh_uom. |
| 9 | LWH_UOM |  | F |  | VARCHAR (4) | Unit of measurement for length, width, and height (e.g. inches, centimeters, feet). Valid values for this field are contained in uom field on uom_class table where uom_class field = DIMEN. |
| 10 | WEIGHT |  |  |  | NUMERIC (12,4) | Weight of dim_object measured in units specified in weight_uom. |
| 11 | NET_WEIGHT |  |  |  | NUMERIC (12,4) | Net weight of the dim_object (weight without packaging) measured in units specified in weight_uom. |
| 12 | WEIGHT_UOM |  | F |  | VARCHAR (4) | Unit of measurement for weight (e.g. pounds, kilograms). Valid values for this field are contained in uom field on uom_class table where uom_class field = MASS. |
| 13 | LIQUID_VOLUME |  |  |  | NUMERIC (12,4) | Liquid volume, or capacity, of dim_object measured in units specified in volume_uom. Liquid volumes are only convertible to other liquid volumes. |
| 14 | LIQUID_VOLUME_UOM |  | F |  | VARCHAR (4) | Unit of measurement for liquid_volume (e.g. ounces, liters). Liquid volumes are only convertible to other liquid volumes. Valid values for this field are contained in uom field on uom_class table where uom_class field = LVOL. |
| 15 | STAT_CUBE |  |  |  | NUMERIC (12,4) | Statistical value of the dim_objects dimensions to be used for loading purposes. |
| 16 | TARE_WEIGHT |  |  |  | NUMERIC (12,4) | Amount of weight to be subtracted for packaging materials. Used to calculate the true net weight of the dim_object. |
| 17 | TARE_TYPE |  |  |  | VARCHAR (6) | TARE_TYPE - Indicates if tare weight for this dim_object is wet or dry. Valid values are found on the code_detail table with the code_type TARE and include: W = Wet tare weight |
| 18 | CREATE_DATETIME |  |  | Y | Date | Date/time stamp of when the record was created. This date/time will be used in export processing. This value should only be populated on insert - it should never be updated. |
| 19 | LAST_UPDATE_DATETIME |  |  | Y | Date | Holds the date time stamp of the most recent update by the last_update_id. This field is required by the database. |
| 20 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | Holds the Oracle user-id of the user who most recently updated this record. This field is required by the database. |
| 21 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_ITEM_SUPP_COUNTRY_DIM|PK||||ITEM|ASC|
||||||SUPPLIER|ASC|
||||||ORIGIN_COUNTRY|ASC|
||||||DIM_OBJECT|ASC|
|ITEM_SUPP_COUNTRY_DIM_I8|||||WEIGHT_UOM|ASC|
|ITEM_SUPP_COUNTRY_DIM_I3|||||ORIGIN_COUNTRY|ASC|
|ITEM_SUPP_COUNTRY_DIM_I4|||||DIM_OBJECT|ASC|
|ITEM_SUPP_COUNTRY_DIM_I5|||||WEIGHT|ASC|
|ITEM_SUPP_COUNTRY_DIM_I6|||||LIQUID_VOLUME|ASC|
|ITEM_SUPP_COUNTRY_DIM_I9|||||LIQUID_VOLUME_UOM|ASC|
|ITEM_SUPP_COUNTRY_DIM_I2|||||SUPPLIER|ASC|
|ITEM_SUPP_COUNTRY_DIM_I7|||||LWH_UOM|ASC|

---

## Table: ITEM_SUPP_COUNTRY_LOC

**Description:** This table will hold one record for each location associated with a given item/supplier/country.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM | P | F | Y | VARCHAR (25) | Alphanumeric value that identifies the item. |
| 2 | SUPPLIER | P | F | Y | NUMERIC (10) | Unique identifier for the supplier. |
| 3 | ORIGIN_COUNTRY_ID | P | F | Y | VARCHAR (3) | The country where the item was manufactured or significantly altered. |
| 4 | LOC | P |  | Y | NUMERIC (10) | Store/Warehouse locations of the retailer in a country where a given supplier can supply an item. |
| 5 | LOC_TYPE |  |  | Y | VARCHAR (1) | Type of location in the location field. Valid values are: S = Store W = Warehouse |
| 6 | PRIMARY_LOC_IND |  |  | Y | VARCHAR (1) | Store/Warehouse locations of the retailer in a country where a given supplier is the primary or main supplier of an item. Each item/supplier combination must have exactly one primary location. If item is not primarily supplied by the supplier in a given location then the cost of the primary location is used for the supplier while ordering. Valid values are: Y = Yes, this is primary location for this item/supplier N = No, this is not the primary location for this item/supplier. |
| 7 | UNIT_COST |  |  | Y | NUMERIC (20,4) | The current unit cost of the item for the item/supplier/origin_country combination. This field is stored in the suppliers currency. |
| 8 | ROUND_LVL |  |  | Y | VARCHAR (6) | This column will be used to determine how order quantities will be rounded to Case, Layer and Pallet. |
| 9 | ROUND_TO_INNER_PCT |  |  | Y | NUMERIC (12,4) | This column will hold the Inner Rounding Threshold value. During rounding, this value is used to determine whether to round partial Inner quantities up or down. If the Inner-fraction in question is less than the Threshold proportion, it is rounded down; if not, it is rounded up. For instance, with an Inner size of 10 and a Threshold of 80%, Inner quantities such as 18, 29 and 8 would be rounded up to 20, 30 and 10 respectively, while quantities of 12, 27 and 35 would be rounded down to 10, 20 and 30 respectively. Quantities are never rounded down to zero; a quantity of 7, in the example above, would be rounded up to 10. |
| 10 | ROUND_TO_CASE_PCT |  |  | Y | NUMERIC (12,4) | This column will hold the Case Rounding Threshold value. During rounding, this value is used to determine whether to round partial Case quantities up or down. If the Case-fraction in question is less than the Threshold proportion, it is rounded down; if not, it is rounded up. For instance, with an Case size of 10 and a Threshold of 80%, Case quantities such as 18, 29 and 8 would be rounded up to 20, 30 and 10 respectively, while quantities of 12, 27 and 35 would be rounded down to 10, 20 and 30 respectively. Quantities are never rounded down to |
| 11 | ROUND_TO_LAYER_PCT |  |  | Y | NUMERIC (12,4) | This column will hold the Layer Rounding Threshold value. During rounding, this value is used to determine whether to round partial Layer quantities up or down. If the Layer-fraction in question is less than the Threshold proportion, it is rounded down; if not, it is rounded up. |
| 12 | ROUND_TO_PALLET_PCT |  |  | Y | NUMERIC (12,4) | This column will hold the Pallet Rounding Threshold value. During rounding, this value is used to determine whether to round partial Pallet quantities up or down. If the Pallet -fraction in question is less than the Threshold proportion, it is rounded down; if not, it is rounded up. For instance, with an Pallet size of 10 and a Threshold of 80%, Pallet quantities such as 18, 29 and 8 would be rounded up to 20, 30 and 10 respectively, while quantities of 12, 27 and 35 would be rounded down to 10, 20 and 30 respectively. Quantities are never rounded down to zero; a quantity of 7, in the example above, would be rounded up to 10. |
| 13 | SUPP_HIER_TYPE_1 |  | F |  | VARCHAR (6) | Identifies partner type of supplier hierarchy level 1.This field will always have the partner type S1 which indicates manufacturer. |
| 14 | SUPP_HIER_LVL_1 |  | F |  | VARCHAR (10) | Highest level of supplier hierarchy which is used to indicate a partner, such as a manufacturer, in the supply chain that gives rebates to the retailer. |
| 15 | SUPP_HIER_TYPE_2 |  | F |  | VARCHAR (6) | Identifies partner type of supplier hierarchy level 2 . This field will always have the partner type S2 which indicates distributor. |
| 16 | SUPP_HIER_LVL_2 |  | F |  | VARCHAR (10) | Second Highest level of supplier hierarchy which is used to indicate a partner, such as a distributor in the supply chain that gives rebates to the retailer. |
| 17 | SUPP_HIER_TYPE_3 |  | F |  | VARCHAR (6) | Identifies partner type of supplier hierarchy level 3. This field will always have the partner type S3 which indicates wholesaler. |
| 18 | SUPP_HIER_LVL_3 |  | F |  | VARCHAR (10) | Third highest level of supplier hierarchy which is used to indicate a partner, such as a wholesaler in the supply chain that gives rebates to the retailer |
| 19 | PICKUP_LEAD_TIME |  |  |  | NUMERIC (4) | Contains the time it takes to get the item from the Supplier to the Initial Receiving Location. |
| 20 | CREATE_DATETIME |  |  | Y | Date | Date/time stamp of when the record was created. This date/time will be used in export processing. This value should only be populated on insert - it should never be updated. |
| 21 | LAST_UPDATE_DATETIME |  |  | Y | Date | Holds the date time stamp of the most recent update by the last_update_id. This field is required by the database. |
| 22 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | Holds the Oracle user-id of the user who most recently updated this record. This field is required by the database. |
| 23 | NEGOTIATED_ITEM_COST |  |  |  | NUMERIC (20,4) | This will hold the supplier negotiated item cost based on the location of the item. |
| 24 | EXTENDED_BASE_COST |  |  |  | NUMERIC (20,4) | This will hold the extended base cost based on the location of the item. Extended base cost is the cost inclusive of all the taxes that affect the WAC. |
| 25 | INCLUSIVE_COST |  |  |  | NUMERIC (20,4) | This will hold the inclusive cost based on the location of the item. This cost will have both the recoverable and non recoverable taxes included. |
| 26 | BASE_COST |  |  |  | NUMERIC (20,4) | This will hold the tax exclusive cost of the item. |
| 27 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_ITEM_SUPP_COUNTRY_LOC|PK||||ITEM|ASC|
||||||SUPPLIER|ASC|
||||||ORIGIN_COUNTRY_ID|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
||||||LOC|ASC|
|ITEM_SUPP_COUNTRY_LOC_I3|||||SUPP_HIER_TYPE_2|ASC|
||||||SUPP_HIER_LVL_2|ASC|
|ITEM_SUPP_COUNTRY_LOC_I5|||||ITEM|ASC|
||||||LOC|ASC|
||||||SUPPLIER|ASC|
||||||ORIGIN_COUNTRY_ID|ASC|
||||||PRIMARY_LOC_IND|ASC|
|ITEM_SUPP_COUNTRY_LOC_I2|||||SUPP_HIER_TYPE_1|ASC|
||||||SUPP_HIER_LVL_1|ASC|
|ITEM_SUPP_COUNTRY_LOC_I1|||||ORIGIN_COUNTRY_ID|ASC|
|ITEM_SUPP_COUNTRY_LOC_I4|||||SUPP_HIER_TYPE_3|ASC|
||||||SUPP_HIER_LVL_3|ASC|

### Constraints

|Type|Column / Constraint<br>Name|Details|
|---|---|---|
|Table Level|CHK_ISCL_LOC_TYPE|LOC_TYPE in ('S', 'W','E')<br>|
||CHK_ISCL_PRI_LOC_IND|PRIMARY_LOC_IND in ('Y','N')<br>|
||CHK_ISCL_ROUND_LVL|ROUND_LVL in ('C', 'L','P','CL','LP', 'CLP')<br>|
||CHK_ISCL_SUPP_HIER_T1|SUPP_HIER_TYPE_1 = 'S1'<br>|
||CHK_ISCL_SUPP_HIER_T2|SUPP_HIER_TYPE_2 = 'S2'<br>|






|Type|Column / Constraint<br>Name|Details|Col4|
|---|---|---|---|
||CHK_ISCL_SUPP_HIER_T3|SUPP_HIER_TYPE_3 = 'S3'<br>|SUPP_HIER_TYPE_3 = 'S3'<br>|
|Column Level|LOC_TYPE|Value List<br>Value<br>Description<br>'E'<br>'S'<br> <br>'W'<br>|Value List<br>Value<br>Description<br>'E'<br>'S'<br> <br>'W'<br>|
|Column Level|LOC_TYPE|Value List|Value List|
|Column Level|LOC_TYPE|Value|Description|
|Column Level|LOC_TYPE|'E'||
|Column Level|LOC_TYPE|'S'||
|Column Level|LOC_TYPE|'W'||
||PRIMARY_LOC_IND|Value List<br>Value<br>Description<br>'N'<br> <br>'Y'<br>|Value List<br>Value<br>Description<br>'N'<br> <br>'Y'<br>|
||PRIMARY_LOC_IND|Value List|Value List|
||PRIMARY_LOC_IND|Value|Description|
||PRIMARY_LOC_IND|'N'||
||PRIMARY_LOC_IND|'Y'||
||ROUND_LVL|Value List<br>Value<br>Description<br>'C'<br> <br>'CL'<br> <br>'CLP'<br> <br>'L'<br> <br>'LP'<br> <br>'P'<br>|Value List<br>Value<br>Description<br>'C'<br> <br>'CL'<br> <br>'CLP'<br> <br>'L'<br> <br>'LP'<br> <br>'P'<br>|
||ROUND_LVL|Value List|Value List|
||ROUND_LVL|Value|Description|
||ROUND_LVL|'C'||
||ROUND_LVL|'CL'||
||ROUND_LVL|'CLP'||
||ROUND_LVL|'L'||
||ROUND_LVL|'LP'||
||ROUND_LVL|'P'||
||SUPP_HIER_TYPE_1|||
||SUPP_HIER_TYPE_2|||
||SUPP_HIER_TYPE_3|||

---

## Table: ITEM_SUPP_COUNTRY_LOC_CFA_EXT

**Description:** This is the custom attribute extension table for the entity ITEM_SUPP_COUNTRY.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM | P | F | Y | VARCHAR (25) | This column holds the Item this extended data is associated with. |
| 2 | SUPPLIER | P | F | Y | NUMERIC (10) | This column holds the Supplier this extended data is associated with. |
| 3 | ORIGIN_COUNTRY_ID | P | F | Y | VARCHAR (3) | This column holds the Origin Country ID this extended data is associated with. |
| 4 | LOC | P | F | Y | NUMERIC (10) | This column holds the Location this extended data is associated with. |
| 5 | GROUP_ID | P |  | Y | NUMERIC (10) | This column holds the attribute group id that this extended data is associated with. The logical business meaning of the VARCHAR_, NUMBER_ and DATE_ columns on this table are determined by the metadata defined for this attribute. |
| 6 | VARCHAR2_1 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_1 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 7 | VARCHAR2_2 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_2 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 8 | VARCHAR2_3 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_3 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 9 | VARCHAR2_4 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_4 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 10 | VARCHAR2_5 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_5 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 11 | VARCHAR2_6 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_6 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 12 | VARCHAR2_7 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_7 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 13 | VARCHAR2_8 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_8 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 14 | VARCHAR2_9 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_9 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 15 | VARCHAR2_10 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_10 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 16 | NUMBER_11 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_11 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 17 | NUMBER_12 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_12 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 18 | NUMBER_13 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_13 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 19 | NUMBER_14 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_14 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 20 | NUMBER_15 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_15 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 21 | NUMBER_16 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_16 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 22 | NUMBER_17 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_17 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 23 | NUMBER_18 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_18 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 24 | NUMBER_19 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_19 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 25 | NUMBER_20 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_20 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 26 | DATE_21 |  |  |  | Date | This column holds data related to the attribute defined on the CFA_ATTRIB table that references DATE_21 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 27 | DATE_22 |  |  |  | Date | This column holds data related to the attribute defined on the CFA_ATTRIB table that references DATE_22 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 28 | DATE_23 |  |  |  | Date | This column holds data related to the attribute defined on the CFA_ATTRIB table that references DATE_23 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 29 | DATE_24 |  |  |  | Date | This column holds data related to the attribute defined on the CFA_ATTRIB table that references DATE_24 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 30 | DATE_25 |  |  |  | Date | This column holds data related to the attribute defined on the CFA_ATTRIB table that references DATE_25 in CFA_ATTRIB.STORAGE_COL_NAME. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_ITEM_SUPP_CNTRY_LOC_CFA_EXT|PK||||ITEM|ASC|
||||||SUPPLIER|ASC|
||||||ORIGIN_COUNTRY_ID|ASC|
||||||LOC|ASC|
||||||GROUP_ID|ASC|

---

## Table: ITEM_SUPP_MANU_COUNTRY

**Description:** This table holds all item supplier country of manufacture relationships.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM | P | F | Y | VARCHAR (25) | Alphanumeric value that identifies the item. |
| 2 | SUPPLIER | P | F | Y | NUMERIC (10) | The unique identifier for the supplier. |
| 3 | MANU_COUNTRY_ID | P | F | Y | VARCHAR (3) | The country where the item was manufactured. |
| 4 | PRIMARY_MANU_CTRY_IND |  |  | Y | VARCHAR (1) | This field indicates whether this country is the primary country of manufacture for the item/supplier. Each item/supplier combination must have one and only one primary country of manufacture. |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |
| 6 | CREATE_DATETIME |  |  | Y | Date | This column holds the record creation date. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_ITEM_SUPP_MANU_COUNTRY|PK||||ITEM|ASC|
||||||SUPPLIER|ASC|
||||||MANU_COUNTRY_ID|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_ISMC_PRIMARY_MANU_CTRY_IND|PRIMARY_MANU_CTRY_IND in ('Y','N')<br>|
|Column Level|PRIMARY_MANU_CTRY_IND||

---

## Table: ITEM_SUPP_UOM

**Description:** This table will be used to store the conversion value of an Item/Suppliers shipping carton to item Standard UOM. Item/Suppliers shipping carton unit of measure can be defined in UOM_CLASS table under Miscellaneous class. Any UOM which does not fall into standard UOM classes (like Pack, Dimensions, Mass, Qty, Volume) should be defined as Miscellaneous.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM | P | F | Y | VARCHAR (25) | Alphanumeric value that identifies the item. |
| 2 | SUPPLIER | P | F | Y | NUMERIC (10) | The unique identifier for the supplier of the item. |
| 3 | UOM | P | F | Y | VARCHAR (4) | The unit of measure that the item is being measured in. |
| 4 | VALUE |  |  | Y | NUMERIC (20,4) | This field will store the equivalent value of the Item/Suppliers shipping carton in the associated unit of measure. |
| 5 | CREATE_DATETIME |  |  | Y | Date | Date/time stamp of when the record was created. This date/time will be used in export processing. This value should only be populated on insert - it should never be updated. |
| 6 | LAST_UPDATE_DATETIME |  |  | Y | Date | Holds the date time stamp of the most recent update by the last_update_id. This field is required by the database. |
| 7 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | Holds the Oracle user-id of the user who most recently updated this record. This field is required by the database. |
| 8 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_ITEM_SUPP_UOM|PK||||ITEM|ASC|
||||||SUPPLIER|ASC|
||||||UOM|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|ITEM_SUPP_UOM_I1|||||UOM|ASC|

---

## Table: ITEM_TICKET

**Description:** This table will hold all the valid ticket types associated with an item

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM | P | F | Y | VARCHAR (25) | Alphanumeric value that identifies the item which is associated with the ticket type. |
| 2 | TICKET_TYPE_ID | P | F | Y | VARCHAR (4) | This field contains a character string which uniquely identifies the ticket type which is associated with the item. |
| 3 | PO_PRINT_TYPE |  |  |  | VARCHAR (1) | This field indicates when the ticket type for the given item should be printed by default, upon the approval or receipt of the purchase order. Valid values are: A and R. |
| 4 | PRINT_ON_PC_IND |  |  | Y | VARCHAR (1) | This field indicates whether or not this type of ticket should be printed for this item when a permanent price change goes into effect. Valid values in this field are: Y - Yes N - No |
| 5 | TICKET_OVER_PCT |  |  |  | NUMERIC (12,4) | This field contains a percent which indicates the amount of tickets which should be printed for a given event. If the event causing tickets to be printed is approving or receiving a purchase order, then this field indicates the quantity of tickets which should be printed greater than the quantity of the purchase order. If the event causing the tickets to be printed is a permanent price change, this field would indicate the quantity of tickets which should be printed greater than the stock on hand. |
| 6 | CREATE_DATETIME |  |  | Y | Date | Date/time stamp of when the record was created. This date/time will be used in export processing. This value should only be populated on insert - it should never be updated. |
| 7 | LAST_UPDATE_DATETIME |  |  | Y | Date | Holds the date time stamp of the most recent update by the LAST_UPDATE_ID. |
| 8 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | Holds the Oracle user-id of the user who most recently updated this record. |
| 9 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_ITEM_TICKET|PK||||ITEM|ASC|
||||||TICKET_TYPE_ID|ASC|
|ITEM_TICKET_I1|||||TICKET_TYPE_ID|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_ITEM_TICKET_PO_PRINT_TYPE|PO_PRINT_TYPE IN ('A', 'R')<br>|
||CHK_ITEM_TICKET_PRINT_ON_PC|PRINT_ON_PC_IND IN ('Y', 'N')<br>|
|Column Level|PO_PRINT_TYPE||
||PRINT_ON_PC_IND||

---

## Table: SUB_ITEMS_DETAIL

**Description:** This table will now hold Substitute Item Detail info. by Location. Every record should represent a unique Item/Location combination.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  | F | Y | VARCHAR (25) | Alphanumeric identifier for the main item. This item must exist as a main sku on the sub_item_head table. |
| 2 | LOCATION |  | F | Y | NUMERIC (10) | This column will hold the Location associated with the Substitute Item record. It should be a valid Oracle Retail Location (STORE.STORE or WH.WH). It will be part of the Primary Key for the table. Will hold only virtual warehouse in a multi-channel enviroment. |
| 3 | LOC_TYPE |  |  | Y | VARCHAR (1) | This column will indicate whether the associated location is a Store (S) or a Warehouse (W). |
| 4 | SUB_ITEM |  | F | Y | VARCHAR (25) | Alphanumeric identifier for the substitute item. This item must be a valid item on the item_master table. |
| 5 | PRIMARY_REPL_PACK |  |  |  | VARCHAR (25) | This column will contain the replenishment pack, if any, that will be used to fulfill the demand of the associated item. |
| 6 | PICK_PRIORITY |  |  |  | NUMERIC (3) | Contains the pick priority for the substitute item. If there are multiple substitutre items for a main item, then the pick priority will determine the order the item is picked. this field is only required if the use_stock_ind on sub_items_head is set to Y. |
| 7 | CREATE_DATETIME |  |  | Y | Date | Date/time stamp of when the record was created. This date/time will be used in export processing. This value should only be populated on insert - it should never be updated. |
| 8 | LAST_UPDATE_DATETIME |  |  | Y | Date | Holds the date time stamp of the most recent update by the |
| 9 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | Holds the Oracle user-id of the user who most recently updated this record. This field is required by the database. |
| 10 | START_DATE |  |  | Y | Date | Indicates the date when the substitution will start for the main item. Required by AIP to model banded items for integration with RMS. |
| 11 | END_DATE |  |  | Y | Date | Indicates the date when the substitution will end for the main item. Required by AIP to model banded items for integration with RMS. |
| 12 | SUBSTITUTE_REASON |  |  |  | VARCHAR (1) | Contains the reason of substitution, valid values are P-Promotional or T-Transitional. This field is only used when integrated with AIP. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|UK_SUB_ITEMS_DETAIL|UK||||ITEM|ASC|
||||||LOCATION|ASC|
||||||SUB_ITEM|ASC|
||||||START_DATE|ASC|
||||||END_DATE|ASC|
||||||PRIMARY_REPL_PACK|ASC|
|SUB_ITEMS_DETAIL_I1|||||SUB_ITEM|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_SUB_ITEM_DETAIL_SUB_REASON|SUBSTITUTE_REASON IN ('P', 'T')<br>|
||CHK_SUB_IT_DETAIL_LOC_TYPE|LOC_TYPE in ('S','W')<br>|






|Type|Column / Constraint Name|Details|
|---|---|---|
|Column Level|LOC_TYPE||
||SUBSTITUTE_REASON||

---

## Table: SUB_ITEMS_HEAD

**Description:** This table will now hold Substitute Item Header info. by Location. Every record should represent a unique Item/Location combination.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM | P | F | Y | VARCHAR (25) | Alphanumeric identifier for the main item that will have substitute items associated with it. |
| 2 | LOCATION | P | F | Y | NUMERIC (10) | This column will hold the Location associated with the Substitute Item record. It should be a valid Oracle Retail Location (STORE.STORE or WH.WH). It will be part of the Primary Key for the table. Will only hold virtual warehouses in a multi-channel enviroment. |
| 3 | LOC_TYPE |  |  | Y | VARCHAR (1) | This column will indicate whether the associated location is a Store (S) or a Warehouse (W). |
| 4 | FILL_PRIORITY |  |  |  | VARCHAR (1) | Contains the fill priority for the main item. This field applies only to Warehouses. Valid values for this field are: M = main (ordering will exhaust main item before using the substitute item) S = substitute (ordering will exhaust substitute item before using the main item) NULL = Location is a Store |
| 5 | USE_SALES_IND |  |  | Y | VARCHAR (1) | If use_sales = Y, then substitute items will be used in calculating the maximum stock for the floating point replenishment method. If use_sales = N, then the substitute items will not be used in the calculations. |
| 6 | USE_STOCK_IND |  |  | Y | VARCHAR (1) | If this field is set to Y, then substitute items will be used in calculating the net inventory at a location when determining the locations need for the main item. As well, if set to Y, substitute items stock can be used to fulfill a locations warehouse demands for the main item. If set to N, substitute items will not be used in the calculations and will not be used to fulfill demand. |
| 7 | USE_FORECAST_SALES_IND |  |  | Y | VARCHAR (1) | If this field is set to Y, then substitute items will be used in calculating the need at a location when a forecasting replenishment method is used for the main item. If it is set to N, substitute items will not be used in the |
| 8 | CREATE_DATETIME |  |  | Y | Date | Date/time stamp of when the record was created. This date/time will be used in export processing. This value should only be populated on insert - it should never be updated. |
| 9 | LAST_UPDATE_DATETIME |  |  | Y | Date | Holds the date time stamp of the most recent update by the last_update_id. This field is required by the database. |
| 10 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | Holds the Oracle user-id of the user who most recently updated this record. This field is required by the database. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SUB_ITEMS_HEAD|PK||||ITEM|ASC|
||||||LOCATION|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_SUB_IT_HEAD_FILL_PRIORITY|(FILL_PRIORITY IN ('M','S')) OR (FILL_PRIORITY IS NULL)<br>|
||CHK_SUB_IT_HEAD_LOC_TYPE|LOC_TYPE in ('S','W')<br>|
||CHK_SUB_IT_HEAD_USE_FRCST_SALE|USE_FORECAST_SALES_IND IN ('Y','N')<br>|
||CHK_SUB_IT_HEAD_USE_SALES_IND|USE_SALES_IND IN ('Y','N')|
||CHK_SUB_IT_HEAD_USE_STOCK_IND|USE_STOCK_IND IN ('Y','N')<br>|
|Column Level|LOC_TYPE||
||FILL_PRIORITY||






|Type|Column / Constraint Name|Details|
|---|---|---|
||USE_SALES_IND||
||USE_STOCK_IND||
||USE_FORECAST_SALES_IND||

---

## Table: VAR_UPC_EAN

**Description:** This table will hold the structure of the Variable UPC/EAN codes. It will identify how to interpret the layout of a variable weight UPC code that is attached to an item when item records are downloaded to and uploaded from the POS or other sales recording devices.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | FORMAT_ID | P |  | Y | VARCHAR (1) | This column contains the unique ID that corresponds to the format string. This field is never displayed and should never be updated. |
| 2 | FORMAT_DESC |  |  | Y | VARCHAR (20) | This column contains a description of the format string. This field is required to be not NULL, but can be updated by a DBA. |
| 3 | PREFIX_LENGTH |  |  | Y | NUMERIC (1) | This column holds the length of the prefix for the given format. This field is never displayed and should never be updated. If the prefix length is 1, the prefix for all variable UPCs of this format must be 2. If the prefix length is 2, the prefix for all variable UPCs of this format must be in the range from 20-29. |
| 4 | BEGIN_ITEM_DIGIT |  |  | Y | NUMERIC (2) | This column holds the place in the UPC that the unique number identifying the item begins. |
| 5 | BEGIN_VAR_DIGIT |  |  | Y | NUMERIC (2) | This column holds the place in the UPC that the variable price begins. |
| 6 | CHECK_DIGIT |  |  | Y | NUMERIC (2) | This column holds the place in the UPC that the Price Check Digit is located. |
| 7 | DEFAULT_PREFIX |  |  |  | NUMERIC (2) | This column holds the prefix that is defaulted for this format. This column is not required and can be overridden by the user at the time of item creation. |
