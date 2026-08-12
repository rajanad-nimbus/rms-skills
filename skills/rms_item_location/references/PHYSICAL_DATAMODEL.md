# RMS Item Location Ranging & Matrix Datamodel - Physical Data Model Reference

## Table: ITEMLOC_MFQUEUE

**Description:** This is a staging table for Item Location messages. It contains snapshots of columns on the item_loc and repl_item_loc tables.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SEQ_NO | P |  | Y | NUMERIC (15) | The sequence in which the record was placed on the table. Used to order the publication of messages to the RIB. |
| 2 | ITEM |  |  |  | VARCHAR (25) | Item identifier from the item_loc table. |
| 3 | LOC |  |  |  | NUMERIC (10) | Location identifier from the item_loc table. |
| 4 | LOC_TYPE |  |  |  | VARCHAR (1) | Specifies whether the location is a store or warehouse. |
| 5 | PHYSICAL_LOC |  |  |  | NUMERIC (10) | For warehouses, this will contain the whs physical warehouse. For stores, this will contain the store. |
| 6 | LOCAL_ITEM_DESC |  |  |  | VARCHAR (250) | Snapshot of the local_item_desc column on the item_loc table. |
| 7 | LOCAL_SHORT_DESC |  |  |  | VARCHAR (120) | Snapshot of the local_short_desc column on the item_loc table. |
| 8 | STATUS |  |  |  | VARCHAR (1) | Snapshot of the status column on the item_loc table. |
| 9 | PRIMARY_SUPP |  |  |  | NUMERIC (10) | Snapshot of the primary_supp column on the item_loc table. |
| 10 | PRIMARY_CNTRY |  |  |  | VARCHAR (3) | Snapshot of the primary_cntry column on the item_loc table. |
| 11 | RECEIVE_AS_TYPE |  |  |  | VARCHAR (1) | Snapshot of the receive_as_type column on the item_loc table. |
| 12 | TAXABLE_IND |  |  |  | VARCHAR (1) | Snapshot of the taxable_ind column on the item_loc table. |
| 13 | SOURCE_METHOD |  |  |  | VARCHAR (1) | Snapshot of the source_method column on the item_loc table. |
| 14 | SOURCE_WH |  |  |  | NUMERIC (10) | Snapshot of the source_wh column on the item_loc table. |
| 15 | PRIMARY_REPL_SUPPLIER |  |  |  | NUMERIC (10) | Snapshot of the primary_repl_supplier column on the repl_item_loc table. |
| 16 | REPL_METHOD |  |  |  | VARCHAR (6) | Snapshot of the repl_method column on the repl_item_loc table. |
| 17 | REJECT_STORE_ORDER_IND |  |  |  | VARCHAR (1) | Snapshot of the reject_store_order_ind column on the repl_item_loc table. |
| 18 | NEXT_DELIVERY_DATE |  |  |  | Date | Snapshot of the next_delivery_date column on the repl_item_loc table. |
| 19 | MESSAGE_TYPE |  |  |  | VARCHAR (15) | Describes the action in RMS that is causing the message to be published to the RIB |
| 20 | THREAD_NO |  |  |  | NUMERIC (4) | The thread on which the business transaction will be published. Each business object has one and only one thread_no. For the itemloc_mfqueue table, the business object id is item. |
| 21 | FAMILY |  |  |  | VARCHAR (30) | The functional area that the transaction belongs to. |
| 22 | CUSTOM_MESSAGE_TYPE |  |  |  | VARCHAR (1) | Not used by RMS. |
| 23 | PUB_STATUS |  |  |  | VARCHAR (1) | Set to Unpublished upon insertion into the table. Will be set to Hospital if a non-fatal error is encountered during the publication process. |
| 24 | TRANSACTION_TIME_STAMP |  |  |  | Date | Time of record creation. |
| 25 | STORE_PRICE_IND |  |  |  | VARCHAR (1) | Indicates if an item at a particular store location can have the unit retail marked down by the store. |
| 26 | UNIT_RETAIL |  |  |  | NUMERIC (20,4) | Contains the unit retail price in the standard unit of measure for the item/location combination. |
| 27 | SELLING_UNIT_RETAIL |  |  |  | NUMERIC (20,4) | Contains the unit retail price in the selling unit of measure for the item/location combination. |
| 28 | SELLING_UOM |  |  |  | VARCHAR (4) | Contains the selling unit of measure for an items single-unit retail. |
| 29 | MULT_RUNS_PER_DAY_IND |  |  | Y | VARCHAR (1) | This indicates if an item can be replenished multiple times per day at the location. Default value is N |
| 30 | UIN_TYPE |  |  |  | VARCHAR (6) | This Column will contain the unique identification number (UIN) used to identify the instances of the item at the location. |
| 31 | UIN_LABEL |  |  |  | VARCHAR (6) | This column will contain the label for the UIN when displayed in SIM. |
| 32 | CAPTURE_TIME |  |  |  | VARCHAR (6) | This column will indicate when the UIN should be captured for an item during transaction processing. |
| 33 | EXT_UIN_IND |  |  | Y | VARCHAR (1) | This Yes/No indicator indicates if UIN is being generated in the external system. |
| 34 | RANGED_IND |  |  |  | VARCHAR (1) | Snapshot of the ranged_ind column on the item_loc table. |
| 35 | RETURNABLE_IND |  |  |  | VARCHAR (1) | This field will contain a value of Yes when the item can be returned to the location. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_ITEMLOC_MFQUEUE|PK||||SEQ_NO|ASC|
|ITEMLOC_MFQUEUE_U1|UN||||THREAD_NO|ASC|
||||||SEQ_NO|ASC|
|ITEMLOC_MFQUEUE_I1|||||ITEM|ASC|

---

## Table: ITEM_LOC

**Description:** This table contains one row for each item stocked at each location within the company.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM | P | F | Y | VARCHAR (25) | Unique alphanumeric value that identifies the item. |
| 2 | LOC | P |  | Y | NUMERIC (10) | Numeric identifier of the location in which the item is to be found. This field may contain a store, warehouse, or external finisher. |
| 3 | ITEM_PARENT |  | F |  | VARCHAR (25) | Alphanumeric value that uniquely identifies the item/group at the level above the item. |
| 4 | ITEM_GRANDPARENT |  | F |  | VARCHAR (25) | Alphanumeric value that uniquely identifies the item/group two levels above the item. |
| 5 | LOC_TYPE |  |  | Y | VARCHAR (1) | Type of location in the location field. Valid values are S (store), W (warehouse), and E (external finisher). |
| 6 | UNIT_RETAIL |  |  |  | NUMERIC (20,4) | Contains the unit retail price in the standard unit of measure for the item/location combination. This field is stored in the local currency. |
| 7 | REGULAR_UNIT_RETAIL |  |  |  | NUMERIC (20,4) | This field holds the unit retail in the standard unit of measure for the item/location (zone) combination. This field is stored in the local currency. |
| 8 | MULTI_UNITS |  |  |  | NUMERIC (12,4) | This field contains the multi-units for the item/location (zone) combination. |
| 9 | MULTI_UNIT_RETAIL |  |  |  | NUMERIC (20,4) | This field holds the multi-unit retail in the multi-selling unit of measure for the item/location (zone) combination. This field is stored in teh local currency. |
| 10 | MULTI_SELLING_UOM |  |  |  | VARCHAR (4) | This field holds the selling unit of measure for this item/location (zone) combinations multi-unit retail. |
| 11 | SELLING_UNIT_RETAIL |  |  |  | NUMERIC (20,4) | Contains the unit retail price in the selling unit of measure for the item/location combination. This field is stored in the local currency. |
| 12 | SELLING_UOM |  | F |  | VARCHAR (4) | Contains the selling unit of measure for an items single-unit retail. |
| 13 | PROMO_RETAIL |  |  |  | NUMERIC (20,4) | Contains the current promotional unit retail price in the standard unit of measure for the item/store combination. This field will only contain a value if the item is on promotion. This field is stored in the local currency. |
| 14 | PROMO_SELLING_RETAIL |  |  |  | NUMERIC (20,4) | Contains the current promotional unit retail price in the selling unit of measure for the item/store combination. This field will only contain a value if the item is on promotion. This field is stored in the local currency. |
| 15 | PROMO_SELLING_UOM |  |  |  | VARCHAR (4) | Contains the selling unit of measure for an items promotional single-unit retail. This field will only contain a value if the item is on promotion. |
| 16 | CLEAR_IND |  |  | Y | VARCHAR (1) | Indicates if item is on clearance at the store. Valid values are: Y = Yes, the item is on clearance N = No, the item is not on clearance |
| 17 | TAXABLE_IND |  |  | Y | VARCHAR (1) | Indicates if item is taxable at the store. Valid values are: Y = Yes, the item is taxable N = No, the item is not taxable |
| 18 | LOCAL_ITEM_DESC |  |  | Y | VARCHAR (250) | Contains the local description of the item. This field will default to the items description but will be over-ridable. This value will be downloaded to the POS. |
| 19 | LOCAL_SHORT_DESC |  |  |  | VARCHAR (120) | Contains the local short description of the item. This field will default to the items short description but will be over-ridable. This value will be downloaded to the POS. |
| 20 | TI |  |  |  | NUMERIC (12,4) | Number of shipping units (cases) that make up one tier of a pallet. Multiply TI x HI to get total number of cases for a pallet. |
| 21 | HI |  |  |  | NUMERIC (12,4) | Number of tiers that make up a complete pallet (height). Multiply TI x HI to get total number of cases for a pallet. |
| 22 | STORE_ORD_MULT |  |  | Y | VARCHAR (1) | This column contains the multiple in which the item needs to be shipped from a warehouse to the location. |
| 23 | STATUS |  |  | Y | VARCHAR (1) | Current status of item at the store. Valid values are: A = Active, item is valid and can be ordered and sold I = Inactive, item is valid but cannot be ordered or sold C = Discontinued, item is valid and sellable but no longer orderable D = Delete, item is invalid and cannot be ordered or sold |
| 24 | STATUS_UPDATE_DATE |  |  | Y | Date | Date on which the status for item at the store was most recently changed. |
| 25 | DAILY_WASTE_PCT |  |  |  | NUMERIC (12,4) | Average percentage lost from inventory on a daily basis due to natural wastage. |
| 26 | MEAS_OF_EACH |  |  |  | NUMERIC (12,4) | Size of an each in terms of the uom_of_price. For example 12 oz. Used in ticketing. |
| 27 | MEAS_OF_PRICE |  |  |  | NUMERIC (12,4) | Size to be used on the ticket in terms of the uom_of_price. For example, if the user wants the ticket to have the label print the price per ounce, this value would be 1. If the user wanted the price per 100 grams this value would be 100. Used in ticketing. |
| 28 | UOM_OF_PRICE |  |  |  | VARCHAR (4) | Unit of measure that will be used on the ticket for this item. |
| 29 | PRIMARY_VARIANT |  | F |  | VARCHAR (25) | This field is used to address sales of PLUs (i.e. above transaction level items) when inventory is tracked at a lower level (i.e. UPC). This field will only contain a value for items one level higher than the transaction level. Valid choices will be any transaction level item that is a child of this item. In order to select a transaction level item as the primary variant, the item/location relationship must exist at the transaction level. Both the transaction level item (i.e. UPC) and the higher than transcation level item (i.e. PLU) will be sent to the POS to allow the store to sell the PLU. The information sent for the PLU will be the same information sent for the Transaction level item (i.e. UPC). |
| 30 | PRIMARY_COST_PACK |  |  |  | VARCHAR (25) | This field contains an item number that is a simple pack containing the item in the item column for this record. If populated, the cost of the future cost table will be driven from the simple pack and the deals and cost changes for the simple pack. |
| 31 | PRIMARY_SUPP |  | F |  | NUMERIC (10) | Numeric identifier of the supplier who will be considered the primary supplier for the specified item/loc. The supplier/origin country combination will determine the value of the unit cost field on item_loc. If the supplier is changed and ELC = N, the unit cost field on item_loc will be updated with the new suppliers cost. |
| 32 | PRIMARY_CNTRY |  |  |  | VARCHAR (3) | Contains the identifier of the origin country which will be considered the primary country for the specified item/location. |
| 33 | RECEIVE_AS_TYPE |  |  |  | VARCHAR (1) | This column determines whether the stock on hand for a pack component item or the buyer pack itself will be updated when a buyer pack is received at a warehouse. Valid values are Each or Pack. |
| 34 | CREATE_DATETIME |  |  | Y | Date | Date/time stamp of when the record was created. This date/time will be used in export processing. This value should only be populated on insert - it should never be updated |
| 35 | LAST_UPDATE_DATETIME |  |  | Y | Date | Holds the date time stamp of the most recent update by the last_update_id. This field is required by the database. |
| 36 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | Holds the Oracle user-id of the user who most recently updated this record. This field is required by the database. |
| 37 | INBOUND_HANDLING_DAYS |  |  |  | NUMERIC (2) | This field indicates the number of inbound handling days for an item at a warehouse type location. |
| 38 | SOURCE_METHOD |  |  |  | VARCHAR (1) | This value will be used to specify how the ad-hoc PO/TSF creation process should source the item/location request. If the value is Warehouse, the process will attempt to fill the request by creating a transfer from the warehouse mentioned in the source_wh field. If this warehouse doesn't have enough inventory to fill the request, a purchase order will be created for the item/location's primary supplier. For warehouses, it is used by Oracle Retail Allocation to determine the valid sources and destinations for warehouse to warehouse allocations. |
| 39 | SOURCE_WH |  |  |  | NUMERIC (10) | This value will be used by the ad-hoc PO/Transfer creation process to determine which warehouse to fill the stores request from. It will also be used by the Allocation process to support warehouse to warehouse allocations. A value will be required in this field if the sourcing method is Warehouse. |
| 40 | STORE_PRICE_IND |  |  | Y | VARCHAR (1) | This field indicates if an item at a particular store location can have the unit retail marked down by the store. |
| 41 | RPM_IND |  |  | Y | VARCHAR (1) | This column indicates whether or not RPM has processed the item/location combination. |
| 42 | UIN_TYPE |  |  |  | VARCHAR (6) | This column will contain the unique identification number (UIN) used to identify the instances of the item at the location. |
| 43 | UIN_LABEL |  |  |  | VARCHAR (6) | This column will contain the label for the UIN when displayed in SIM. |
| 44 | CAPTURE_TIME |  |  |  | VARCHAR (6) | This column will indicate when the UIN should be captured for an item during transaction processing. |
| 45 | EXT_UIN_IND |  |  | Y | VARCHAR (1) | This Yes/No indicator indicates if UIN is being generated in the external system. |
| 46 | RANGED_IND |  |  | Y | VARCHAR (1) | This column determines if the location is ranged intentionally by the user for replenishment/selling or incidentally ranged by the RMS programs when item is not ranged to a specific location on the transaction. |
| 47 | COSTING_LOC |  |  |  | NUMERIC (10) | Numeric identifier of the costing location for the franchise store. This field may contain a store or a warehouse. |
| 48 | COSTING_LOC_TYPE |  |  |  | VARCHAR (1) | This field holds the type of costing location in the costing location field. |
| 49 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_ITEM_LOC|PK||||ITEM|ASC|
||||||LOC|ASC|
|ITEM_LOC_I6|||||SELLING_UOM|ASC|
|ITEM_LOC_I3|||||ITEM_PARENT|ASC|
|ITEM_LOC_I2|||||ITEM|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
||||||PRIMARY_SUPP|ASC|
|ITEM_LOC_I5|||||PRIMARY_VARIANT|ASC|
|ITEM_LOC_I4|||||ITEM_GRANDPARENT|ASC|
|PK_ITEM_LOC|UN||||ITEM|ASC|
||||||LOC|ASC|
|ITEM_LOC_I7|||||LOC|ASC|
||||||STATUS|ASC|
||||||RANGED_IND|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table<br>Level|CHK_ITEM_LOC_CLEAR_IND|clear_ind in ('Y','N')<br>|
||CHK_ITEM_LOC_COSTING_LOC_TYPE|COSTING_LOC_TYPE in ('S','W')<br>|
||CHK_ITEM_LOC_EXT_UIN_IND|ext_uin_ind in ('Y','N')<br>|
||CHK_ITEM_LOC_LOC_TYPE|loc_type in ('S','W','E')<br>|
||CHK_ITEM_LOC_RANGED_IND|ranged_ind in('Y','N')<br>|
||CHK_ITEM_LOC_RECEIVE_AS_TYPE|RECEIVE_AS_TYPE in ('E', 'P')<br>|
||CHK_ITEM_LOC_RPM_IND|RPM_IND in ('Y', 'N')<br>|
||CHK_ITEM_LOC_SOURCE_METHOD|SOURCE_METHOD IN ('W','S')<br>|
||CHK_ITEM_LOC_STATUS|status in ('A','I','C','D')<br>|






|Type|Column / Constraint Name|Details|Col4|
|---|---|---|---|
||CHK_ITEM_LOC_STORE_ORD_MULT|STORE_ORD_MULT IN ('E','I','C')<br>|STORE_ORD_MULT IN ('E','I','C')<br>|
||CHK_ITEM_LOC_TAXABLE_IND|taxable_ind in ('Y','N')<br>|taxable_ind in ('Y','N')<br>|
||CHK_ITL_STORE_PRICE_IND|STORE_PRICE_IND IN ('Y','N')<br>|STORE_PRICE_IND IN ('Y','N')<br>|
|Column<br>Level|LOC_TYPE|||
|Column<br>Level|LOC_TYPE|Value List|Value List|
|Column<br>Level|LOC_TYPE|Value|Description|
|Column<br>Level|LOC_TYPE|'E'||
|Column<br>Level|LOC_TYPE|'S'||
|Column<br>Level|LOC_TYPE|'W'||
||CLEAR_IND|||
||CLEAR_IND|Value List|Value List|
||CLEAR_IND|Value|Description|
||CLEAR_IND|'N'||
||CLEAR_IND|'Y'||
||TAXABLE_IND|||
||TAXABLE_IND|Value List|Value List|
||TAXABLE_IND|Value|Description|
||TAXABLE_IND|'N'||
||TAXABLE_IND|'Y'||
||STORE_ORD_MULT|||
||STORE_ORD_MULT|Value List|Value List|
||STORE_ORD_MULT|Value|Description|
||STORE_ORD_MULT|'C'||
||STORE_ORD_MULT|'E'||
||STORE_ORD_MULT|'I'||






|Type|Column / Constraint Name|Details|Col4|
|---|---|---|---|
||STATUS|||
||STATUS|Value List|Value List|
||STATUS|Value|Description|
||STATUS|'A'||
||STATUS|'C'||
||STATUS|'D'||
||STATUS|'I'||
||RECEIVE_AS_TYPE<br>|||
||RECEIVE_AS_TYPE<br>|Value List|Value List|
||RECEIVE_AS_TYPE<br>|Value|Description|
||RECEIVE_AS_TYPE<br>|'E'||
||RECEIVE_AS_TYPE<br>|'P'||
||SOURCE_METHOD|||
||SOURCE_METHOD|Value List|Value List|
||SOURCE_METHOD|Value|Description|
||SOURCE_METHOD|'S'||
||SOURCE_METHOD|'W'||
||STORE_PRICE_IND|||
||STORE_PRICE_IND|Value List|Value List|
||STORE_PRICE_IND|Value|Description|
||STORE_PRICE_IND|'N'||
||STORE_PRICE_IND|'Y'||
||RPM_IND<br>|||
||RPM_IND<br>|Value List|Value List|
||RPM_IND<br>|Value|Description|
||RPM_IND<br>|'N'||
||RPM_IND<br>|'Y'||






|Type|Column / Constraint Name|Details|Col4|
|---|---|---|---|
||EXT_UIN_IND|||
||EXT_UIN_IND|Value List|Value List|
||EXT_UIN_IND|Value|Description|
||EXT_UIN_IND|'N'||
||EXT_UIN_IND|'Y'||
||RANGED_IND|||
||COSTING_LOC_TYPE|||
||COSTING_LOC_TYPE|Value List|Value List|
||COSTING_LOC_TYPE|Value|Description|
||COSTING_LOC_TYPE|'S'||
||COSTING_LOC_TYPE|'W'||

---

## Table: ITEM_LOC_CFA_EXT

**Description:** This is the custom attribute extension table for the entity ITEM_LOC.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM | P | F | Y | VARCHAR (25) | This column holds the Item this extended data is associated with. |
| 2 | LOC | P | F | Y | NUMERIC (10) | This column holds the Location this extended data is associated with. |
| 3 | GROUP_ID | P |  | Y | NUMERIC (10) | This column holds the attribute group id that this extended data is associated with. The logical business meaning of the VARCHAR_, NUMBER_ and DATE_ columns on this table are determined by the metadata defined for this attribute. |
| 4 | VARCHAR2_1 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_1 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 5 | VARCHAR2_2 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_2 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 6 | VARCHAR2_3 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_3 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 7 | VARCHAR2_4 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_4 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 8 | VARCHAR2_5 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_5 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 9 | VARCHAR2_6 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_6 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 10 | VARCHAR2_7 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_7 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 11 | VARCHAR2_8 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_8 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 12 | VARCHAR2_9 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_9 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 13 | VARCHAR2_10 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_10 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 14 | NUMBER_11 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_11 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 15 | NUMBER_12 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_12 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 16 | NUMBER_13 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_13 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 17 | NUMBER_14 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_14 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 18 | NUMBER_15 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_15 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 19 | NUMBER_16 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_16 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 20 | NUMBER_17 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_17 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 21 | NUMBER_18 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_18 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 22 | NUMBER_19 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_19 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 23 | NUMBER_20 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_20 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 24 | DATE_21 |  |  |  | Date | This column holds data related to the attribute defined on the CFA_ATTRIB table that references DATE_21 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 25 | DATE_22 |  |  |  | Date | This column holds data related to the attribute defined on the CFA_ATTRIB table that references DATE_22 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 26 | DATE_23 |  |  |  | Date | This column holds data related to the attribute defined on the CFA_ATTRIB table that references DATE_23 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 27 | DATE_24 |  |  |  | Date | This column holds data related to the attribute defined on the CFA_ATTRIB table that references DATE_24 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 28 | DATE_25 |  |  |  | Date | This column holds data related to the attribute defined on the CFA_ATTRIB table that references DATE_25 in CFA_ATTRIB.STORAGE_COL_NAME. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_ITEM_LOC_CFA_EXT|PK||||ITEM|ASC|
||||||LOC|ASC|
||||||GROUP_ID|ASC|

---

## Table: ITEM_LOC_HIST

**Description:** This table contains one row for each item/location/week/sales type combination. Sales history, forecast and plan information about each combination may be held here.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM | P |  | Y | VARCHAR (25) | This field contains a unique alphanumeric value that identifies the item. |
| 2 | LOC | P |  | Y | NUMERIC (10) | This field contains the unique identifier for the location in which the transactions occurred. This may contain a store or a warehouse. |
| 3 | LOC_TYPE |  |  | Y | VARCHAR (1) | This field specifies the type of location in the location field. Valid values are: S = Store W = Warehouse |
| 4 | EOW_DATE | P |  | Y | Date | This field contains the end of the week date of the week for the sales total and other calculations. |
| 5 | WEEK_454 |  |  |  | NUMERIC (2) | This field contain the identifer of the week in which the transactions occurred based on the 454 calendar. |
| 6 | MONTH_454 |  |  |  | NUMERIC (2) | This field contain the identifer of the month in which the transactions occurred based on the 454 calendar. |
| 7 | YEAR_454 |  |  |  | NUMERIC (4) | This field contain the identifer of the year in which the transactions occurred based on the 454 calendar. |
| 8 | SALES_TYPE | P |  | Y | VARCHAR (1) | This field indicates the type of sale or inventory movement. Valid Values are: R = Regular Sales, P = Promotional Sales, C = Clearance Sales, I = Issues from Warehouses to Stores. |
| 9 | SALES_ISSUES |  |  |  | NUMERIC (12,4) | This fields contains the number of units sold or transferred for item/location/week/sales type combination. If the location type is a store, then this value represents sales. If the location type is a warehouse, then this value represents outbound transfer/allocation transactions to stores. |
| 10 | VALUE |  |  |  | NUMERIC (20,4) | This field contains the retail value of the sales for the item/location/week/sales type combination. This field is stored in the local currency. This field will only hold a value for stores. |
| 11 | GP |  |  |  | NUMERIC (20,4) | This field contains the total gross profit calculated for the item/location/week/sales type. This is updated for each sale that occurs during the week and is calculated as (sales retail - cost of sales). This field will only hold a value for stores. |
| 12 | STOCK |  |  |  | NUMERIC (12,4) | This field contains the stock on hand for the item/location combination at the end of the week. |
| 13 | RETAIL |  |  |  | NUMERIC (20,4) | This field contains the unit retail price of the item at the location at the end of the week. This field is stored in the local currency. |
| 14 | AV_COST |  |  |  | NUMERIC (20,4) | This field contains the average cost of the item at the location at the end of the week. This field is stored in the local currency. |
| 15 | CREATE_DATETIME |  |  | Y | Date | This field contains the date and time when the record was created. This date/time will be used in export processing. This value is populated on insert and never be updated. |
| 16 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field holds the date time stamp of the most recent update by the last_update_id. |
| 17 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field holds the Oracle user ID of the user who most recently updated this record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_ITEM_LOC_HIST|PK||||ITEM|ASC|
||||||SALES_TYPE|ASC|
||||||LOC|ASC|
||||||EOW_DATE|ASC|
|ITEM_LOC_HIST_I1|||||ITEM|ASC|
||||||EOW_DATE|ASC|
|ITEM_LOC_HIST_I2|||||LOC|ASC|
|PK_ITEM_LOC_HIST|UN||||ITEM|ASC|
||||||SALES_TYPE|ASC|
||||||LOC|ASC|
||||||EOW_DATE|ASC|

---

## Table: ITEM_LOC_HIST_MTH

**Description:** This table holds item location history by month.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  |  | Y | VARCHAR (25) | Unique alphanumerical value that identifies the item. |
| 2 | CREATE_DATETIME |  |  | Y | Date | This column contains a Date/Time stamp of when the record was created. This date/time will be used in export processing. This value should only be populated on insert - it should never be updated. |
| 3 | LAST_UPDATE_DATETIME |  |  | Y | Date | This column holds the date/time stamp of the most recent update by the last_update_id. This field is required by the database. |
| 4 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This column holds the oracle user ID of the user who most recently updated this record. This field is required by the database. |
| 5 | LOC |  |  | Y | NUMERIC (10) | Number of the location in which the item is to be found. This field may contain a store or a warehouse. |
| 6 | LOC_TYPE |  |  | Y | VARCHAR (1) | Type of location in the location field. Valid values are S = Store and W = Warehouse. |
| 7 | EOM_DATE |  |  | Y | Date | End of the month date for which the sales totals are gathered. |
| 8 | MONTH_454 |  |  | Y | NUMERIC (2) | Number of the 454 month for the sales figures. |
| 9 | YEAR_454 |  |  | Y | NUMERIC (4) | Number of the 454 year for the sales figures. |
| 10 | SALES_TYPE |  |  | Y | VARCHAR (1) | Indicates the type of sale or inventory movement. Valid values are: R = Regular sales P = Promotional sales C = Clearance sales I = Issues from warehouses to stores Regular sales, promotional sales and clearance sales can occur at stores. Issue occur only at warehouses. |
| 11 | SALES_ISSUES |  |  |  | NUMERIC (12,4) | This fields contains the number of units sold or transferred for item/location/date/sales_type combination depending on if the location type is store or warehouse, respectively. |
| 12 | VALUE |  |  |  | NUMERIC (20,4) | Retail value received on the sales for the item/location/week/sales_type combination. This field is stored in the local currency. This field will only hold a value for stores. |
| 13 | GP |  |  |  | NUMERIC (20,4) | Gross profit calculated for each sale of an item as (sales retail - cost of sales). Sales retail is the actual retail sold for this item. Cost of sales is either av_cost (weighted average cost when system_options.std_av_ind = A), or unit_cost (primary supplier cost when system_options.std_av_ind = S) on item_loc table. This field will only hold a value for stores. |
| 14 | STOCK |  |  |  | NUMERIC (12,4) | Stock on hand for the item/location combination at the end of the week. |
| 15 | RETAIL |  |  |  | NUMERIC (20,4) | Unit retail price of the item at the location at the end of the week. This field is stored in the local currency. |
| 16 | AV_COST |  |  |  | NUMERIC (20,4) | Average cost of the item at the location at the end of the week. This field is stored in the local currency. |

---

## Table: ITEM_LOC_L10N_EXT

**Description:** This is the LFAS storage table for the entity ITEM_LOC

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM | P |  | Y | VARCHAR (25 BYTE) | This field is alphanumeric value which identifies the item of the item location relationship. |
| 2 | LOCATION | P |  | Y | NUMERIC (10) | This column contains the unique numeric value that identifies the location of the item location relationship. |
| 3 | L10N_COUNTRY_ID | P | F | Y | VARCHAR (3) | This column holds the country this extended data is associated with. The logical business meaning of the VARCHAR_, NUMBER_ and DATE_ columns on this table are determined by the metadata defined for this country in its localization pack. |
| 4 | GROUP_ID | P | F | Y | NUMERIC (10) | This column holds the attribute group id that this extended data is associated with. The logical business meaning of the VARCHAR2_, NUMBER_ and DATE_ columns on this table are determined by the metadata defined for this country/attribute group in the countries localization pack. |
| 5 | VARCHAR2_1 |  |  |  | VARCHAR (250 BYTE) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references varchar2_1 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 6 | VARCHAR2_2 |  |  |  | VARCHAR (250 BYTE) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references varchar2_2 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 7 | VARCHAR2_3 |  |  |  | VARCHAR (250 BYTE) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references varchar2_3 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 8 | VARCHAR2_4 |  |  |  | VARCHAR (250 BYTE) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references varchar2_4 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 9 | VARCHAR2_5 |  |  |  | VARCHAR (250 BYTE) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references varchar2_5 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 10 | VARCHAR2_6 |  |  |  | VARCHAR (250 BYTE) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references varchar2_6 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 11 | VARCHAR2_7 |  |  |  | VARCHAR (250 BYTE) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references varchar2_7 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 12 | VARCHAR2_8 |  |  |  | VARCHAR (250 BYTE) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references varchar2_8 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 13 | VARCHAR2_9 |  |  |  | VARCHAR (250 BYTE) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references varchar2_9 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 14 | VARCHAR2_10 |  |  |  | VARCHAR (250 BYTE) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references varchar2_10 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 15 | NUMBER_11 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references number_11 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 16 | NUMBER_12 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references number_12 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 17 | NUMBER_13 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references number_13 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 18 | NUMBER_14 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references number_14 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 19 | NUMBER_15 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references number_15 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 20 | NUMBER_16 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references number_16 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 21 | NUMBER_17 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references number_17 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 22 | NUMBER_18 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references number_18 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 23 | NUMBER_19 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references number_19 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 24 | NUMBER_20 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references number_20 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 25 | DATE_21 |  |  |  | Date (7) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references date_21 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 26 | DATE_22 |  |  |  | Date (7) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references date_22 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_ITEM_LOC_L10N_EXT|PK||||ITEM|ASC|
||||||LOCATION|ASC|
||||||L10N_COUNTRY_ID|ASC|
||||||GROUP_ID|ASC|

---

## Table: ITEM_LOC_SOH

**Description:** This table contains one row of stock on hand information for each item stocked at a location within the company. This information is stored separately from other inventory buckets to avoid locking and contention issues.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM | P | F | Y | VARCHAR (25) | Unique alphanumeric value that identifies the item. |
| 2 | ITEM_PARENT |  | F |  | VARCHAR (25) | Alphanumeric value that uniquely identifies the item/group at the level above the item. |
| 3 | ITEM_GRANDPARENT |  | F |  | VARCHAR (25) | Alphanumeric value that uniquely identifies the item/group two levels above the item. |
| 4 | LOC | P | F | Y | NUMERIC (10) | Numeric identifier of the location in which the item is to be found. This field may contain a store, warehouse, or external finisher |
| 5 | LOC_TYPE |  |  | Y | VARCHAR (1) | Type of location in the location field. Valid values are S (store), W (warehouse), and E (external finisher). |
| 6 | AV_COST |  |  |  | NUMERIC (20,4) | Calculated using POs estimated landed cost during PO receiving process if elc_ind = Y. This field is stored in the local currency. Pack items will not have a average cost stored on item_loc. Stock of a pack item is valued at the component level and therefore an average cost is not applicable for pack items. |
| 7 | UNIT_COST |  |  |  | NUMERIC (20,4) | If system_options.std_av_ind = A and elc_ind = Y then this field holds the estimated landed cost when item is initially set up. It is then updated with POs estimated landed cost each time this item is received at this |
| 8 | STOCK_ON_HAND |  |  | Y | NUMERIC (12,4) | Current stock on hand for the item. |
| 9 | SOH_UPDATE_DATETIME |  |  |  | Date | Date and time of most recent update to stock_on_hand. |
| 10 | LAST_HIST_EXPORT_DATE |  |  |  | Date | This field contains most recent date up to which sales/issues have been exported to an external system for the item/store or item/warehouse combination. |
| 11 | IN_TRANSIT_QTY |  |  | Y | NUMERIC (12,4) | All quantities of an item shipped but not received on all transfers and allocations for the destination location. |
| 12 | PACK_COMP_INTRAN |  |  | Y | NUMERIC (12,4) | All quantities of an item shipped but not received on all transfers and allocations for the destination location. |
| 13 | PACK_COMP_SOH |  |  | Y | NUMERIC (12,4) | Current stock on hand for pack component item |
| 14 | TSF_RESERVED_QTY |  |  | Y | NUMERIC (12,4) | The sum of all requested quantities of an item that have not been shipped on all transfers and stand alone allocations for the source location. |
| 15 | PACK_COMP_RESV |  |  | Y | NUMERIC (12,4) | The sum of all requested quantities of a component item that have not been shipped on all transfers and stand alone allocations for the source location. |
| 16 | TSF_EXPECTED_QTY |  |  | Y | NUMERIC (12,4) | The sum of all expected quantities of an item that have not been shipped on all transfers and stand alone allocations for the destination location. |
| 17 | PACK_COMP_EXP |  |  | Y | NUMERIC (12,4) | The sum of all expected quantities of a component item that have not been shipped on all transfers and stand alone allocations for the destination location. |
| 18 | RTV_QTY |  |  | Y | NUMERIC (12,4) | All quantities approved but not shipped on all RTVs from inventory for an item/location. Will reduce stock on hand when RTV is shipped. |
| 19 | NON_SELLABLE_QTY |  |  | Y | NUMERIC (12,4) | Total non-sellable quantity for an item/location (i.e. sum of inv_status_qty.qty for an item/location across all inventory statuses). |
| 20 | CUSTOMER_RESV |  |  | Y | NUMERIC (12,4) | This will hold the number of units being reserved for customer orders. |
| 21 | CUSTOMER_BACKORDER |  |  | Y | NUMERIC (12,4) | This will hold the number of units held for customer back orders. |
| 22 | PACK_COMP_CUST_RESV |  |  | Y | NUMERIC (12,4) | This will hold the number of packs being reserved for customer orders. |
| 23 | PACK_COMP_CUST_BACK |  |  | Y | NUMERIC (12,4) | This will hold the number of packs held for customer back orders. |
| 24 | CREATE_DATETIME |  |  | Y | Date | Date/time stamp of when the record was created. This date/time will be used in export processing. This value should only be populated on insert - it should never be updated |
| 25 | LAST_UPDATE_DATETIME |  |  | Y | Date | Holds the date time stamp of the most recent update by the last_update_id. This field is required by the database. |
| 26 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | Holds the Oracle user-id of the user who most recently updated this record. This field is required by the database. |
| 27 | FIRST_RECEIVED |  |  |  | Date | Date the item was first received into the system at the location. This field is not displayed in the on-line item location maintenance dialog, but will be populated during the first receipt of the item at the location. |
| 28 | LAST_RECEIVED |  |  |  | Date | Date the item was most recently received into the system at the location. This field is not displayed in the on-line item location maintenance dialog, but will be populated each time an item is received at the location. |
| 29 | QTY_RECEIVED |  |  |  | NUMERIC (12,4) | Number of items received on the most recent received date at the location. This field is not displayed in the on-line item location maintenance dialog, but will be populated each time an item is received at the location. |
| 30 | FIRST_SOLD |  |  |  | Date | The date of the first sale of the item at this location. |
| 31 | LAST_SOLD |  |  |  | Date | The date of the most recent sale of the item at this location. |
| 32 | QTY_SOLD |  |  |  | NUMERIC (12,4) | The qty of the most recent sale of the item at this location. |
| 33 | PRIMARY_SUPP |  |  |  | NUMERIC (10) | This columns is a mirror of item_loc.primary_supp and is on this table for performance reasons. |
| 34 | PRIMARY_CNTRY |  |  |  | VARCHAR (3) | This columns is a mirror of item_loc.primary_cntry and is on this table for performance reasons. |
| 35 | AVERAGE_WEIGHT |  |  |  | NUMERIC (12,4) | A new field to hold the average simple pack weight for a catch weight simple pack. |
| 36 | FINISHER_AV_RETAIL |  |  |  | NUMERIC (20,4) | Weighted average retail of all the units of the transfer item currently at the finisher. |
| 37 | FINISHER_UNITS |  |  |  | NUMERIC (12,4) | The number of units of the adjusted (inventory adjustment/stock count) item currently at the finisher. |
| 38 | PACK_COMP_NON_SELLABLE |  |  | Y | NUMERIC (12,4) | Contains the units of a bulk sku that are part of unavailable prepacks at a location (store or warehouse). |
| 39 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_ITEM_LOC_SOH|PK||||ITEM|ASC|
||||||LOC|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|ITEM_LOC_SOH_I3|||||ITEM_PARENT|ASC|
|ITEM_LOC_SOH_I4|||||ITEM_GRANDPARENT|ASC|
|PK_ITEM_LOC_SOH|UN||||ITEM|ASC|
||||||LOC|ASC|

### Constraints

|Type|Column / Constraint Name|Details|Col4|
|---|---|---|---|
|Table Level|CHK_ITEM_LOC_INV_LOC_TYPE|LOC_TYPE in ('S','W','E')<br>|LOC_TYPE in ('S','W','E')<br>|
|Column Level|LOC_TYPE|Value List<br>Value<br>Description<br>'E'<br> <br>'S'<br>'W'<br>|Value List<br>Value<br>Description<br>'E'<br> <br>'S'<br>'W'<br>|
|Column Level|LOC_TYPE|Value List|Value List|
|Column Level|LOC_TYPE|Value|Description|
|Column Level|LOC_TYPE|'E'||
|Column Level|LOC_TYPE|'S'||
|Column Level|LOC_TYPE|'W'||

---

## Table: ITEM_LOC_SOH_EOD

**Description:** This table holds the end-of-day position of inventory buckets at the item-location intersection. The data is from the ITEM_LOC_SOH table with the auditing fields and is refreshed daily after phase 2 of the batch cycle completes and prior to phase 3 starting.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM | P |  | Y | VARCHAR (25) | Unique alphanumeric value that identifies the item. |
| 2 | LOC | P |  | Y | NUMERIC (10) | Numeric identifier of the location in which the item is to be found. This field may contain a store, warehouse, or external finisher. |
| 3 | LOC_TYPE |  |  | Y | VARCHAR (1) | Type of location in the location field. Valid values are S (store), W (warehouse), and E (external finisher). |
| 4 | ITEM_PARENT |  |  |  | VARCHAR (25) | Alphanumeric value that uniquely identifies the item/group at the level above the item. |
| 5 | ITEM_GRANDPARENT |  |  |  | VARCHAR (25) | Alphanumeric value that uniquely identifies the item/group two levels above the item. |
| 6 | AV_COST |  |  |  | NUMERIC (20,4) | Calculated using POs estimated landed cost during Purchase Order (PO) receiving process if elc_ind = y. This field is stored in the local currency. Pack items will not have an average cost stored on item_loc. The stock of a pack item is valued at the component level and therefore an average cost is not applicable for pack items. |
| 7 | UNIT_COST |  |  |  | NUMERIC (20,4) | If system_options.std_av_ind = a and elc_ind = y then this field holds the estimated landed cost when item is initially set up. It is then updated with POs estimated landed cost each time this item is received at this location. Otherwise, this field holds the primary supplier cost. This field is stored in the local currency. Pack items will not have a unit cost stored on item_loc. Stock of a pack item is valued at the component level and therefore a unit cost is not applicable for pack. |
| 8 | STOCK_ON_HAND |  |  | Y | NUMERIC (12,4) | Current stock on hand for the item. |
| 9 | PACK_COMP_SOH |  |  | Y | NUMERIC (12,4) | Current stock on hand for pack component item. |
| 10 | IN_TRANSIT_QTY |  |  | Y | NUMERIC (12,4) | All quantities of an item shipped but not received on all transfers and allocations for the destination location. |
| 11 | PACK_COMP_INTRAN |  |  | Y | NUMERIC (12,4) | All quantities of a pack component item shipped but not received on all transfers and allocations for the destination location. |
| 12 | TSF_RESERVED_QTY |  |  | Y | NUMERIC (12,4) | The sum of all requested quantities of an item that have not been shipped on all transfers and stand alone allocations for the source location. |
| 13 | PACK_COMP_RESV |  |  | Y | NUMERIC (12,4) | The sum of all requested quantities of a pack component item that have not been shipped on all transfers and stand alone allocations for the source location. |
| 14 | TSF_EXPECTED_QTY |  |  | Y | NUMERIC (12,4) | The sum of all expected quantities of an item that have not been shipped on all transfers and stand alone allocations for the destination location. |
| 15 | PACK_COMP_EXP |  |  | Y | NUMERIC (12,4) | The sum of all expected quantities of a pack component item that have not been shipped on all transfers and stand alone allocations for the destination location. |
| 16 | RTV_QTY |  |  | Y | NUMERIC (12,4) | All quantities approved but not shipped on all Return To Vendor transactions (RTV) from inventory for an item/location. Will reduce stock on hand when RTV is shipped. |
| 17 | NON_SELLABLE_QTY |  |  | Y | NUMERIC (12,4) | Total non-sellable quantity for an item/location (i.e. sum of inv_status_qty.qty for an item/location across all inventory statuses). |
| 18 | PACK_COMP_NON_SELLABLE |  |  | Y | NUMERIC (12,4) | Contains the units of a bulk SKU that are part of unavailable prepacks at a location (store or warehouse). |
| 19 | CUSTOMER_RESV |  |  | Y | NUMERIC (12,4) | This will hold the number of units being reserved for customer orders. |
| 20 | PACK_COMP_CUST_RESV |  |  | Y | NUMERIC (12,4) | This will hold the number of packs being reserved for customer orders. |
| 21 | CUSTOMER_BACKORDER |  |  | Y | NUMERIC (12,4) | This will hold the number of units held for customer back orders. |
| 22 | PACK_COMP_CUST_BACK |  |  | Y | NUMERIC (12,4) | This will hold the number of packs held for customer back orders. |
| 23 | FINISHER_UNITS |  |  |  | NUMERIC (12,4) | The number of units of the adjusted (inventory adjustment/stock count) item currently at the finisher. |
| 24 | AVERAGE_WEIGHT |  |  |  | NUMERIC (12,4) | A new field to hold the average simple pack weight for a catch weight simple pack. |
| 25 | FINISHER_AV_RETAIL |  |  |  | NUMERIC (20,4) | Weighted average retail of all the units of the transfer item currently at the finisher. |
| 26 | CREATE_DATETIME |  |  | Y | Date | Date/time stamp of when the record was created. This date/time will be used in export processing. This value should only be populated on insert - it should never be updated. |
| 27 | CREATE_ID |  |  | Y | VARCHAR (30) | Holds the Oracle user-id of the user who created this record. |
| 28 | LAST_UPDATE_DATETIME |  |  | Y | Date | Holds the date time stamp of the most recent update by the last_update_id. |
| 29 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | Holds the Oracle user-id of the user who most recently updated this record. |

---

## Table: ITEM_LOC_TRAITS

**Description:** This table contains one row of attributes for each item/location combination in the system. Rows on this table are not required. These attributes will be downloaded to the POS.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM | P | F | Y | VARCHAR (25) | Unique alphanumeric value that identifies the item. |
| 2 | LOC | P | F | Y | NUMERIC (10) | Location at which the item attribute applies. |
| 3 | LAUNCH_DATE |  |  |  | Date | Holds the date that they item should first be sold at the location. This value will be downloaded to the POS. No internal processing occurs from this field. |
| 4 | QTY_KEY_OPTIONS |  |  |  | VARCHAR (6) | Determines whether the qty key on a POS should be used for this item at the location. Valid values are in the code_type RPO. Current values include R - required, P - Prohibited, and O - Optional. Additional values can be added to the code type as needed. This value will be downloaded to the POS as needed. |
| 5 | MANUAL_PRICE_ENTRY |  |  |  | VARCHAR (6) | Determines whether the price can/should be entered manually on a POS for this item at the location. Valid values are in the code_type RPO. Current values include R - required, P - Prohibited, and O - Optional. Additional values can be added or removed as needed. This value will be downloaded to the POS. |
| 6 | DEPOSIT_CODE |  |  |  | VARCHAR (6) | Indicates whether a deposit is associated with this item at the location. Valid values are in the code_type DEPO. Additional values may be added or removed as needed. The only processing in RMS involving the deposit code is downloading it to the POS. Deposits are not subtracted from the retail of an item uploaded to RMS, etc. This kind of processing is the responsibility of the client and should occur before sales are sent to any Oracle Retail application. |
| 7 | FOOD_STAMP_IND |  |  |  | VARCHAR (1) | Indicates whether the item is approved for food stamps at the location. This value will be downloaded to the POS. |
| 8 | WIC_IND |  |  |  | VARCHAR (1) | Indicates whether the item is approved for WIC at the location. This value will be downloaded to the POS. |
| 9 | PROPORTIONAL_TARE_PCT |  |  |  | NUMERIC (12,4) | Holds the value associated of the packaging in items sold by weight at the location. The proportional tare is the proportion of the total weight of a unit of an item that is packaging (i.e. if the tare item is bulk candy, this is the proportional of the total weight of one piece of candy that is the candy wrapper). The only processing RMS does involving the proportional tare percent is downloading it to the POS. Proportional tare is not subtracted from items sold by weight when sales are uploaded to RMS, etc. This kind of processing is the responsibility of the client and should occur before sales are sent to any Oracle Retail application. |
| 10 | FIXED_TARE_VALUE |  |  |  | NUMERIC (12,4) | Holds the value associated of the packaging in items sold by weight at the location. Fixed tare is the tare of the packagine used to (i.e. if the tare item is bulk candy, this is weight of the bag and twist tie). The only processing RMS does involving the fixed tare value is downloading it to the POS. Fixed tare is not subtracted from items sold by weight when sales are uploaded to RMS, etc. This kind of processing is the responsibility of the client and should occur before sales are sent to any Oracle Retail application. |
| 11 | FIXED_TARE_UOM |  | F |  | VARCHAR (4) | Holds the unit of measure value associated with the tare value. The only processing RMS does involving the fixed tare value and UOM is downloading it to the POS. Fixed tare is not subtracted from items sold by weight when sales are uploaded to RMS, etc. This kind of processing is the responsibility of the client and should occur before sales are sent to any Oracle Retail application. |
| 12 | REWARD_ELIGIBLE_IND |  |  |  | VARCHAR (1) | Holds whether the item is legally valid for various types of bonus point/award programs at the location. This value will be downloaded to the POS. |
| 13 | NATL_BRAND_COMP_ITEM |  | F |  | VARCHAR (25) | Holds the nationally branded item to which you would like to compare the current item. This nationally branded item must exist as an item in RMS (i.e. on the item_master table). |
| 14 | RETURN_POLICY |  |  |  | VARCHAR (6) | Holds the return policy for the item at the location. Valid values for this field belong to the code_type RETP. Additional values can be added or removed from the code type as needed. This value will be downloaded to the POS. |
| 15 | STOP_SALE_IND |  |  |  | VARCHAR (1) | Indicates that sale of the item should be stopped immediately at the location (i.e. in case of recall etc). This value will be downloaded to the POS. |
| 16 | ELECT_MTK_CLUBS |  |  |  | VARCHAR (6) | Holds the code that represents the marketing clubs to which the item belongs at the location. Valid values can belong to the code_type MTKC. Additional values can be added or removed from the code type as needed. This value will be downloaded to the POS. |
| 17 | REPORT_CODE |  |  |  | VARCHAR (6) | Code to determine which reports the location should run. Valid values are defined in the code type REPC. Values may be added and removed as necessary. This field is not required. No RMS processing is based on the value in this field. It is clients responsibility to communicate this value to external systems that may need it for processing. |
| 18 | REQ_SHELF_LIFE_ON_SELECTION |  |  |  | NUMERIC (4) | Holds the required shelf life for an item on selection in days. This field is not required. No RMS processing is based on the value in this field. It is clients responsibility to communicate this value to external systems that may need it for processing. |
| 19 | REQ_SHELF_LIFE_ON_RECEIPT |  |  |  | NUMERIC (4) | Holds the required shelf life for an item on receipt in days. This field is not required. No RMS processing is based on the value in this field. It is clients responsibility to communicate this value to external systems that may need it for processing. |
| 20 | IB_SHELF_LIFE |  |  |  | NUMERIC (4) | This column will hold the Investment Buy-specific shelf life for the item/location |
| 21 | STORE_REORDERABLE_IND |  |  |  | VARCHAR (1) | Indicates whether the store may re-order the item. This field is required to be either Y - yes or N - no. The field will default to N. No RMS processing is based on the value in this field. It is clients responsibility to communicate this value to external systems that may need it for processing. |
| 22 | RACK_SIZE |  |  |  | VARCHAR (6) | Indicates the rack size that should be used for the item. This field is not required. Valid values for the field can be found and defined in the code_type RACK. No RMS processing is based on the value in this field. It is clients responsibility to communicate this value to external systems that may need it for processing. |
| 23 | FULL_PALLET_ITEM |  |  |  | VARCHAR (1) | Indicates whether a store must reorder an item in full pallets only. This field is required to be either Y - yes or N - no. The field will default to N. No RMS processing is based on the value in this field. It is clients responsibility to communicate this value to external systems that may need it for processing. |
| 24 | IN_STORE_MARKET_BASKET |  |  |  | VARCHAR (6) | Holds the in store market basket code for this item/location combination. Valid values for the field can be found in the code_type STMB. No RMS processing is based on the value in this field. It is clients responsibility to communicate this value to external systems that may need it for processing. |
| 25 | STORAGE_LOCATION |  |  |  | VARCHAR (7) | Holds the current storage location or bin number for the item at the location. No RMS processing is based on the value in this field. It is clients responsibility to communicate this value to external systems that may need it for processing. |
| 26 | ALT_STORAGE_LOCATION |  |  |  | VARCHAR (7) | Holds the preferred alternate storage location or bin number for the item at the location. No RMS processing is based on the value in this field. It is clients responsibility to communicate this value to external systems that may need it for processing. |
| 27 | RETURNABLE_IND |  |  |  | VARCHAR (1) | This field will contain a value of Yes when the item can be returned to the location |
| 28 | REFUNDABLE_IND |  |  |  | VARCHAR (1) | This field will contain a value of Yes when the item is refundable at the location. |
| 29 | BACK_ORDER_IND |  |  |  | VARCHAR (1) | This field will contain a value of Yes when the item can be back ordered to the location |
| 30 | CREATE_DATETIME |  |  | Y | Date | This field will hold the time and date stamp of record creation. |
| 31 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field holds the oracle user id of the last user to update the record. |
| 32 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field holds the time and date stamp of the last update of the record. |
| 33 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_ITEM_LOC_TRAITS|PK||||ITEM|ASC|
||||||LOC|ASC|
|ITEM_LOC_TRAITS_I2|||||FIXED_TARE_UOM|ASC|
|ITEM_LOC_TRAITS_I1|||||NATL_BRAND_COMP_ITEM|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_ITEM_LOC_TS_BACK_ORDER_IND|BACK_ORDER_IND in ('Y', 'N')<br>|
||CHK_ITEM_LOC_TS_FD_STAMP_IND|FOOD_STAMP_IND in ('Y', 'N')<br>|
||CHK_ITEM_LOC_TS_FULL_PALLET|FULL_PALLET_ITEM in ('Y', 'N')|
||CHK_ITEM_LOC_TS_IB_SHELF_LIFE|IB_SHELF_LIFE is NULL or IB_SHELF_LIFE > 0<br>|
||CHK_ITEM_LOC_TS_REFUNDABLE_IND|REFUNDABLE_IND in ('Y', 'N')<br>|
||CHK_ITEM_LOC_TS_RETURNABLE_IND|RETURNABLE_IND in ('Y', 'N')<br>|
||CHK_ITEM_LOC_TS_REW_ELIGIB_IND|REWARD_ELIGIBLE_IND in ('Y', 'N')<br>|
||CHK_ITEM_LOC_TS_STOP_SALE_IND|STOP_SALE_IND in ('Y', 'N')<br>|
||CHK_ITEM_LOC_TS_STR_REORD_IND|STORE_REORDERABLE_IND in ('Y', 'N')<br>|






|Type|Column / Constraint Name|Details|
|---|---|---|
||CHK_ITEM_LOC_TS_WIC_IND|WIC_IND in ('Y', 'N')<br>|
|Column Level|FOOD_STAMP_IND||
||WIC_IND||
||REWARD_ELIGIBLE_IND||
||STOP_SALE_IND||
||IB_SHELF_LIFE||
||STORE_REORDERABLE_IND||
||RETURNABLE_IND||
||REFUNDABLE_IND||
||BACK_ORDER_IND||
