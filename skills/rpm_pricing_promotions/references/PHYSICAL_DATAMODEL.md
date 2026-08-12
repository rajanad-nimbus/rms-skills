# RMS Pricing, Promotions & Competitor Price Datamodel - Physical Data Model Reference

## Table: COMPETITOR

**Description:** This table is used to store all competitors.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | COMPETITOR | P |  | Y | NUMERIC (10) | Contains the number to uniquely identify a competitor. |
| 2 | COMP_NAME |  |  | Y | VARCHAR (120) | Contains the name of the competitor. |
| 3 | ADDRESS_1 |  |  |  | VARCHAR (240) | Contains the address for the competitors home office. |
| 4 | ADDRESS_2 |  |  |  | VARCHAR (240) | Contains the address for the competitors home office. |
| 5 | ADDRESS_3 |  |  |  | VARCHAR (240) | Contains the address for the competitors home office. |
| 6 | CITY |  |  |  | VARCHAR (120) | Contains the city of the competitors home office. |
| 7 | STATE |  |  |  | VARCHAR (3) | Contains the state of the competitors home office. |
| 8 | COUNTRY_ID |  | F |  | VARCHAR (3) | contains the country of the competitors home office. |
| 9 | POST_CODE |  |  |  | VARCHAR (30) | Contains the postal code of the competitors home office. |
| 10 | PHONE |  |  |  | VARCHAR (20) | Contains the telephone number of the competitors home office. |
| 11 | FAX |  |  |  | VARCHAR (20) | contains the fax number of the competitors home office. |
| 12 | WEBSITE |  |  |  | VARCHAR (40) | Contains the competitors internet address. |
| 13 | JURISDICTION_CODE |  |  |  | VARCHAR (10) | Identifies the jurisdiction code for the country-state relationship. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_COMPETITOR|PK||||COMPETITOR|ASC|
|COMPETITOR_I1|||||STATE|ASC|
|COMPETITOR_I2|||||COUNTRY_ID|ASC|

---

## Table: COMP_ITEM_ELC_TEMP

**Description:** Temporary table for the component items of a pack item.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ORDER_NO |  |  |  | NUMERIC (12) | Contains the number that uniquely identifies an order within the system. |
| 2 | PACK_ITEM |  |  |  | VARCHAR (25) | Alphanumeric values that uniquely identifies the pack |
| 3 | ITEM |  |  |  | VARCHAR (25) | Alphanumeric values that identifies the item within the pack |
| 4 | LOCATION |  |  |  | NUMERIC (10) | Number of the location in which the item is to be found. This field may contain a store or a warehouse. |
| 5 | LANDED_COST |  |  |  | NUMERIC (20,4) | This is the total cost of the item after order have been received. |

---

## Table: COMP_LIST_TEMP

**Description:** This is a temporary table for the creation of competitive shopping lists.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM_LIST | P |  | Y | NUMERIC (8) | Contains the item list number for which shopping needs to be done. |
| 2 | COMPETITOR | P |  | Y | NUMERIC (10) | Contains the competitor number. |
| 3 | COMP_STORE | P |  | Y | NUMERIC (10) | Contains the competitor store number. |
| 4 | SHOPPER | P |  | Y | NUMERIC (4) | Contains shopper number which will be doing the shopping. |
| 5 | SHOP_DATE | P |  | Y | Date | Contains the date which the shopping should occur. |

---

## Table: COMP_PRICE_HIST

**Description:** This table holds competitor price information at the item/competitor/competitor store/day level.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  |  | Y | VARCHAR (25) | This field identifies the unique alphanumeric value for the transaction level item that was competitively shopped. |
| 2 | REF_ITEM |  |  |  | VARCHAR (25) | This field contains the reference item (e.g. UPC, PLU, etc.) for the item that was competitively shopped. |
| 3 | COMP_STORE |  |  | Y | NUMERIC (10) | Contains the number to uniquely identify a competitors store. |
| 4 | REC_DATE |  |  | Y | Date | The date that the items price was recorded at the competitors store. |
| 5 | COMP_RETAIL |  |  | Y | NUMERIC (20,4) | The retail price at the competitors store. |
| 6 | COMP_RETAIL_TYPE |  |  | Y | VARCHAR (6) | Contains the price type which was recorded. Valid values are: R = regular P = promotional C = clearance |
| 7 | MULTI_UNITS |  |  |  | NUMERIC (12,4) | Contains the total quantity for multi unit pricing (e.g. 2 for, 3 for) |
| 8 | MULTI_UNIT_RETAIL |  |  |  | NUMERIC (20,4) | Contains the total price for multi unit pricing (e.g. 2 for $10) |
| 9 | PROM_START_DATE |  |  |  | Date | Contains the effective start date of the competitors promotional price. |
| 10 | PROM_END_DATE |  |  |  | Date | Contains the effective end date of the competitors promotional price. |
| 11 | OFFER_TYPE |  |  |  | VARCHAR (6) | This field identifies the offer type of the competitors regular (e.g. pre-priced) or promotional retail (e.g. bonus card). Valid values are stored on the codes table with a code type of OFTP. |
| 12 | POST_DATE |  |  | Y | Date | Date record posted |
| 13 | RPM_PULL |  |  | Y | VARCHAR (1) | This column indicates whether RPM has pulled the comp price history. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|UK_COMP_PRICE_HIST|UK||||ITEM|ASC|
||||||REF_ITEM|ASC|
||||||COMP_STORE|ASC|
||||||REC_DATE|ASC|
|COMP_PRICE_HIST_I1|||||COMP_STORE|ASC|
|COMP_PRICE_HIST_I2|||||REF_ITEM|ASC|

---

## Table: COMP_SHOPPER

**Description:** This table holds the competitive shoppers in the system.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SHOPPER | P |  | Y | NUMERIC (4) | Contains the number to uniquely identify a shopper. |
| 2 | SHOPPER_NAME |  |  | Y | VARCHAR (120) | Contains the name of the shopper. |
| 3 | SHOPPER_PHONE |  |  |  | VARCHAR (20) | Contains the telephone number of the shopper. |
| 4 | SHOPPER_FAX |  |  |  | VARCHAR (20) | Contains the fax number of the shopper. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_COMP_SHOPPER|PK||||SHOPPER|ASC|

---

## Table: COMP_SHOP_LIST

**Description:** This table holds competitor shopping lists at the item/competitor/competitor store/day level. This table will be downloaded to a PDA.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SHOPPER |  | F | Y | NUMERIC (4) | Contains the shopper number to which the competitive shopping list is assigned. |
| 2 | SHOP_DATE |  |  | Y | Date | Contains the date that the competitive shopping should be performed. |
| 3 | ITEM |  | F |  | VARCHAR (25) | This field identifies the unique alphanumeric value for the transaction level item that was competitively shopped. |
| 4 | ITEM_DESC |  |  |  | VARCHAR (250) | Contains the description of the SKU. |
| 5 | REF_ITEM |  | F |  | VARCHAR (25) | This field contains the reference item (e.g. UPC, PLU, etc.) for the item that was competitively shopped. |
| 6 | COMPETITOR |  | F | Y | NUMERIC (10) | Contains the number to uniquely identify a competitor. |
| 7 | COMP_NAME |  |  |  | VARCHAR (120) | Contains the description of the competitor. |
| 8 | COMP_STORE |  | F | Y | NUMERIC (10) | Contains the number to uniquely identify a competitors store. |
| 9 | COMP_STORE_NAME |  |  |  | VARCHAR (150) | Contains the description of the competitive store. |
| 10 | REC_DATE |  |  |  | Date | The date that the items price was recorded at the competitors store. |
| 11 | COMP_RETAIL |  |  |  | NUMERIC (20,4) | The retail price at the competitors store. |
| 12 | COMP_RETAIL_TYPE |  |  |  | VARCHAR (6) | Contains the price type which was recorded. Valid values are: R = regular, P = promotional, C = clearance |
| 13 | MULTI_UNITS |  |  |  | NUMERIC (12,4) | Contains the total quantity for multi unit pricing (e.g. 2 for, 3 for ). |
| 14 | MULTI_UNIT_RETAIL |  |  |  | NUMERIC (20,4) | Contains the price for multi unit pricing (e.g. 2 for $10) |
| 15 | PROM_START_DATE |  |  |  | Date | Contains the effective start date of the competitors price. |
| 16 | PROM_END_DATE |  |  |  | Date | Contains the effective end date of the competitors price. |
| 17 | OFFER_TYPE |  |  |  | VARCHAR (6) | This field identifies the offer type of the competitors regular (e.g. pre-priced) or promotional retail (e.g. bonus card). Valid values are stored on the codes table with a code type of OFTP. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|UK_COMP_SHOP_LIST|UK||||SHOPPER|ASC|
||||||SHOP_DATE|ASC|
||||||ITEM|ASC|
||||||REF_ITEM|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
||||||COMP_STORE|ASC|
|COMP_SHOP_LIST_I1|||||COMPETITOR|ASC|
|COMP_SHOP_LIST_I3|||||ITEM|ASC|
|COMP_SHOP_LIST_I2|||||COMP_STORE|ASC|
|COMP_SHOP_LIST_I4|||||REF_ITEM|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_COMP_SHOP_LIST_C_RET_TYPE|comp_retail_type in ('R','P','C', NULL)<br>|
||CHK_COMP_SHOP_LIST_PROM_DATES|(comp_retail_type != 'P' AND prom_start_date is NULL AND prom_end_date is NULL) OR (comp_retail_type = 'P')<br>|

---

## Table: COMP_SHOP_LIST_TEMP

**Description:** This temporary table holds competitor shopping lists at the item/competitor/competitor store/day level.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SHOPPER |  |  | Y | NUMERIC (4) | Contains the shopper number to which the competitive shopping list is assigned. |
| 2 | SHOP_DATE |  |  | Y | Date | Contains the date that the competitive shopping should be performed. |
| 3 | ITEM |  |  |  | VARCHAR (25) | This field identifies the unique alphanumeric value for the transaction level item that was competitively shopped. |
| 4 | ITEM_DESC |  |  |  | VARCHAR (250) | Contains the description of the item. |
| 5 | REF_ITEM |  |  |  | VARCHAR (25) | This field contains the reference item (e.g. UPC, PLU, etc.) for the item that was competitively shopped. |
| 6 | COMPETITOR |  |  | Y | NUMERIC (10) | Contains the number to uniquely identify a competitor. |
| 7 | COMP_NAME |  |  |  | VARCHAR (120) | Contains the description of the competitor. |
| 8 | COMP_STORE |  |  | Y | NUMERIC (10) | Contains the number to uniquely identify a competitors store. |
| 9 | COMP_STORE_NAME |  |  |  | VARCHAR (150) | Contains the description of the competitive store. |
| 10 | REC_DATE |  |  |  | Date | The date that the items price was recorded at the competitors store. |
| 11 | COMP_RETAIL |  |  |  | NUMERIC (20,4) | The retail price at the competitors store. |
| 12 | COMP_RETAIL_TYPE |  |  |  | VARCHAR (6) | Contains the price type which was recorded. Valid values are: R = regular, P = promotional, C = clearance |
| 13 | MULTI_UNITS |  |  |  | NUMERIC (12,4) | Contains the total quantity for multi unit pricing (e.g. 2 for, 3 for ). |
| 14 | MULTI_UNIT_RETAIL |  |  |  | NUMERIC (20,4) | Contains the price for multi unit pricing (e.g. 2 for $10) |
| 15 | PROM_START_DATE |  |  |  | Date | Contains the effective start date of the competitors price. |
| 16 | PROM_END_DATE |  |  |  | Date | Contains the effective end date of the competitors price. |
| 17 | OFFER_TYPE |  |  |  | VARCHAR (6) | This field identifies the offer type of the competitors regular (e.g. pre-priced) or promotional retail (e.g. bonus card). Valid values are stored on the codes table with a code type of OFTP. |

---

## Table: COMP_STORE

**Description:** This table holds competitor store information.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | STORE | P |  | Y | NUMERIC (10) | Contains the number to uniquely identify a competitors store |
| 2 | COMPETITOR |  | F | Y | NUMERIC (10) | Contains the number to uniquely identify a competitor. |
| 3 | STORE_NAME |  |  | Y | VARCHAR (150) | Contains the name of the competitors store. |
| 4 | ADDRESS_1 |  |  |  | VARCHAR (240) | Contains the address for the competitors store. |
| 5 | ADDRESS_2 |  |  |  | VARCHAR (240) | Contains the address for the competitors store. |
| 6 | ADDRESS_3 |  |  |  | VARCHAR (240) | Contains the address for the competitors store. |
| 7 | CITY |  |  |  | VARCHAR (120) | Contains the city of the competitors store. |
| 8 | STATE |  |  |  | VARCHAR (3) | Contains the state of the competitors store. |
| 9 | COUNTRY_ID |  | F |  | VARCHAR (3) | Contains the country of the competitors store. |
| 10 | POST_CODE |  |  |  | VARCHAR (30) | Contains the postal code of the competitors store. |
| 11 | PHONE |  |  |  | VARCHAR (20) | Contains the telephone number of the competitors store. |
| 12 | FAX |  |  |  | VARCHAR (20) | Contains the fax number of the competitors store. |
| 13 | STORE_FORMAT |  |  |  | NUMERIC (4) | Contains a code describing the format of the competitor store. |
| 14 | CURRENCY_CODE |  |  | Y | VARCHAR (3) | Contains the currency which the store operates in. |
| 15 | TOTAL_SQUARE_FEET |  |  |  | NUMERIC (8) | Contains the size of the competitor store. |
| 16 | SELLING_SQUARE_FEET |  |  |  | NUMERIC (8) | Contains the size of the selling area in the competitor store. |
| 17 | OPEN_DATE |  |  |  | Date | Contains the opening date of the competitor store. |
| 18 | CLOSE_DATE |  |  |  | Date | Contains the closing date of the competitor store. |
| 19 | ESTIMATED_VOLUME |  |  |  | NUMERIC (20,4) | This field holds the estimated yearly volume for a given competitors store. |
| 20 | JURISDICTION_CODE |  |  |  | VARCHAR (10) | Identifies the jurisdiction code for the country-state relationship. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_COMP_STORE|PK||||STORE|ASC|






|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|COMP_STORE_I1|||||STATE|ASC|
|COMP_STORE_I2|||||COUNTRY_ID|ASC|
|COMP_STORE_I3|||||COMPETITOR|ASC|

---

## Table: COMP_STORE_LINK

**Description:** This table holds the association of Merchandising stores to competitor stores.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | STORE | P | F | Y | NUMERIC (10) | Contains the number to uniquely identify a Merchandising store. |
| 2 | COMP_STORE | P | F | Y | NUMERIC (10) | Contains the number to uniquely identify the competitors store. |
| 3 | TARGET_COMP_IND |  |  | Y | VARCHAR (1) | This field identifies the target competitor of a retailers store. This competitors retail will be used along with the primary store within a zone when calculating a recommended retail in Price Management. |
| 4 | RANK |  |  |  | NUMERIC (2) | This field captures the rank of each competitor store when compared to the other stores. |
| 5 | DISTANCE |  |  |  | NUMERIC (4) | This field captures the distance between the retailers store and the competitors store. |
| 6 | UOM |  |  |  | VARCHAR (6) | This field captures the unit of measure the distance is captured in. Valid values are stored on the codes table with a code type of MIKI. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_COMP_STORE_LINK|PK||||STORE|ASC|
||||||COMP_STORE|ASC|
|COMP_STORE_LINK_I1|||||COMP_STORE|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_COMP_STORE_LINK_TAR_COM_IN|TARGET_COMP_IND IN ('Y', 'N')<br>|
|Column Level|TARGET_COMP_IND||

---

## Table: EMER_PRICE_HIST

**Description:** This table will hold all the emergency price changes.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TRAN_TYPE |  |  |  | NUMERIC (2) | Contains a code number which indicates the type of transaction which caused the price change. Valid values are: 0 = New item added 2 = Unit cost was changed 4 = Single unit retail was changed 8 = Single unit retail was changed in Clearance 9 = Single unit retail was changed in Promotion 10 = Multi-unit retail was changed 11 = Single unit retail and Multi-unit retail were changed 99 = Item was deleted from file. |
| 2 | ITEM |  |  |  | VARCHAR (25) | This field identifies the unique alphanumeric value for the transaction level item. |
| 3 | LOC |  |  |  | NUMERIC (10) | Contains the number that uniquely identifies the location. |
| 4 | LOC_TYPE |  |  |  | VARCHAR (1) | Identifies the location as a Store or a Warehouse. |
| 5 | UNIT_RETAIL |  |  |  | NUMERIC (20,4) | Contains the current single unit retail in the standard unit of measure. If the record is being written as a result of a change in the single unit retail, then this field contains the new single unit retail. This field is stored in the local currency. |
| 6 | ACTION_DATE |  |  |  | Date | Contains the date on which the price change went effect. |

---

## Table: PCCEXT_C_CLEAR

**Description:** Temporary table used by prepost and pccext

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | CLEARANCE |  |  | Y | NUMERIC (8) | Contains the number which uniquely identifies the clearance event. |
| 2 | REASON |  |  | Y | NUMERIC (2) | Contains the reason code which identifies the reason for the clearance event. The code number is decoded on the mkd_reason table. |
| 3 | STATUS |  |  | Y | VARCHAR (1) | Contains the status of the clearance event. |
| 4 | ITEM |  |  | Y | VARCHAR (25) | Contains the Stock Keeping Unit affected by the clearance event. |
| 5 | CLEAR_SUSP_DETAIL_UNIT_RETAIL |  |  | Y | NUMERIC (20,4) | Contains the clearance unit retail price. This field is stored in the local currency. |
| 6 | SELLING_UOM |  |  | Y | VARCHAR (4) | This field contains the selling unit of measure for an items single-unit retail. |
| 7 | STANDARD_UOM |  |  | Y | VARCHAR (4) | Unit of measure in which stock of the item is tracked at a corporate level. |
| 8 | ACTIVE_DATE |  |  |  | VARCHAR (8) | Contains the date on which the markdown became active in the clearance event. |
| 9 | CURRENCY_CODE |  |  | Y | VARCHAR (3) | This field contains the currency code for the price zone. |
| 10 | PACK_IND |  |  | Y | VARCHAR (1) | Indicates if the item is a pack. |
| 11 | STORE_CLEARANCE_ITEM |  |  |  | VARCHAR (108) | A concatenated field of store, clearance, and item. |
| 12 | STORE |  |  | Y | NUMERIC (10) | Contains the store number which uniquely identifies the store. |

---

## Table: PRICE_BATCH_TRAN

**Description:** The table contains transactions for price changes created when a store is moved from one zone to another. The price changes will be done during the batch processing.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ZONE_GROUP_ID |  |  | Y | NUMERIC (4) | Contains the zone group in which the store is changing zones. |
| 2 | STORE |  |  | Y | NUMERIC (10) | Contains the number of the store which is changing zones. |
| 3 | TRAN_TYPE |  |  | Y | VARCHAR (1) | Contains a code to identify the reason for the price change. Currently, records on this table are only used when a store moves from one zone to another. The valid value is S. |
| 4 | OLD_ZONE_ID |  |  | Y | NUMERIC (10) | Contains the old zone number of which the store was a member. |
| 5 | ZONE_CHANGE |  |  | Y | NUMERIC (8) | Represents a unique zone change number for each store zone change. |
| 6 | EFFECTIVE_DATE |  |  | Y | Date | Indicates the date at which the price zone change will go into effect. |
| 7 | NEW_ZONE_ID |  |  | Y | NUMERIC (10) | Indicates the new zone that a store will move to as part of the zone change. |
| 8 | NEW_PRIMARY_STORE |  |  |  | NUMERIC (10) | This field identifies the new primary store within a zone when the zones current primary store changes zones. |

---

## Table: PRICE_HIST

**Description:** This table contains a history of all price changes that have ever been applied within the system. History is kept on this table forever by SKU/store combination.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TRAN_TYPE |  |  | Y | NUMERIC (2) | Contains a code number which indicates the type of transaction which caused the price change. Valid values are: 0 = New item added 2 = Unit cost was change 4 = Single unit retail was changed 8 = Single unit retail was changed in Clearance 9 = Single unit retail was changed in Promotion 10 = Multi-unit retail was changed 11 = Single unit retail and Multi-unit retail were changed 99 = Item was deleted from file |
| 2 | REASON |  |  |  | NUMERIC (6) | Contains the reason for the price change. If the record is written as a result of the creation of a new item, then the reason code is zero. Otherwise, the values come from the mkd_reason table and are the same as the reason code used on the price change event. |
| 3 | EVENT |  |  |  | VARCHAR (6) | This field contains the promotional event for which the price of the SKU is being affected. |
| 4 | ITEM |  |  | Y | VARCHAR (25) | This field identifies the unique alphanumeric value for the transaction level item. |
| 5 | LOC |  |  | Y | NUMERIC (10) | Contains the number that uniquely identifies the location. |
| 6 | LOC_TYPE |  |  |  | VARCHAR (1) | Identifies the location as a Store or a Warehouse. |
| 7 | UNIT_COST |  |  |  | NUMERIC (20,4) | This field holds the primary supplier cost, i.e. a record is written to this table when the primary supplier cost is changed. |
| 8 | UNIT_RETAIL |  |  |  | NUMERIC (20,4) | Contains the current single unit retail in the standard unit of measure. If the record is being written as a result of a change in the single unit retail, then this field contains the new single unit retail. This field is stored in the local currency. |
| 9 | SELLING_UNIT_RETAIL |  |  |  | NUMERIC (20,4) | Contains the current single unit retail in the selling unit of measure. If the record is being written as a result of a change in the single unit retail, then this field contains the new single unit retail. This field is stored in the local currency. |
| 10 | SELLING_UOM |  |  |  | VARCHAR (4) | Contains the selling unit of measure for an items single-unit retail. |
| 11 | ACTION_DATE |  |  | Y | Date | Contains the date on which the price change went effect. |
| 12 | MULTI_UNITS |  |  |  | NUMERIC (12,4) | Contains the current multi-units. If the record is being written as a result of a change in the multi-unit retail, then this field contains the new multi-units. |
| 13 | MULTI_UNIT_RETAIL |  |  |  | NUMERIC (20,4) | Contains the current multi-unit retail in the selling unit of measure. If the record is being written as a result of a change in the multi-unit retail, then this field contains the new multi-unit retail. This field is stored in the local currency. |
| 14 | MULTI_SELLING_UOM |  |  |  | VARCHAR (4) | Contains the selling unit of measure for an items multi-unit retail. |
| 15 | POST_DATE |  |  |  | Date | The POST_DATE column will store that date that a record is inserted or updated in the PRICE_HIST table. |
| 16 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |
| 17 | CREATE_DATETIME |  |  | Y | Date | This column holds the record creation date. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PRICE_HIST_I1|||||ITEM|ASC|
||||||LOC|ASC|
||||||ACTION_DATE|ASC|
||||||TRAN_TYPE|ASC|
||||||UNIT_RETAIL|ASC|
|PRICE_HIST_I2|||||POST_DATE|ASC|
|PRICE_HIST_I3|||||ACTION_DATE|ASC|

---

## Table: TICKET_REQUEST

**Description:** This table will be used to communicate to the batch program which prints tickets. This table is used to communicate the types of tickets which need to be printed and the items and locations which need tickets. After the appropriate ticket files have been written by the program, all records on this table will be deleted.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  | F | Y | VARCHAR (25) | Alphanumeric value that identifies the item for which tickets have been requested. |
| 2 | TICKET_TYPE_ID |  | F | Y | VARCHAR (4) | This field contains a character string which uniquely identifies the type of ticket which should be printed for the item. |
| 3 | QTY |  |  | Y | NUMERIC (12,4) | This field contains the number of tickets which should be printed for the item/ticket type/location. |
| 4 | LOC_TYPE |  |  | Y | VARCHAR (1) | This field indicates the type of location which has requested tickets. Valid values for this field are: W (for warehouse) and S (for store). |
| 5 | LOCATION |  |  | Y | NUMERIC (10) | This field contains the number of the location which has requested tickets. |
| 6 | UNIT_RETAIL |  |  |  | NUMERIC (20,4) | This field contains the unit retail for the item at the indicated location. This field should only be populated when the ticket request is being made based on a permanent price change. |
| 7 | MULTI_UNITS |  |  |  | NUMERIC (12,4) | This field contains the multi-unit parts of the multi-unit retail for the item at the indicated location. This field should only be populated when the ticket request is being made on a permanent price change. |
| 8 | MULTI_UNIT_RETAIL |  |  |  | NUMERIC (20,4) | This field contains the multi-unit retail for the item at the indicated location. This field should only be populated when the ticket request is being made on a permanent price change. |
| 9 | COUNTRY_OF_ORIGIN |  |  |  | VARCHAR (3) | This field contains the country in which the item originated. If tickets are not being printed because of a purchase order, then this value will be defaulted from the most recent purchase order. |
| 10 | ORDER_NO |  |  |  | NUMERIC (12) | This field contains the order number for which the ticket/label is requested. |
| 11 | PRINT_ONLINE_IND |  |  | Y | VARCHAR (1) | This field contains an indicator, which identifies whether tickets should be printed on the fly or as part of the batch cycle. If PRINT_ONLINE_IND = Y, records will be processed immediately. If PRINT_ONLINE_IND = N, records will be processed during the batch cycle. |
| 12 | CREATE_DATETIME |  |  | Y | Date | Date/time stamp of when the record was created. This date/time will be used in export processing. This value should only be populated on insert - it should never be updated. |
| 13 | LAST_UPDATE_DATETIME |  |  | Y | Date | Holds the date time stamp of the most recent update by the last_update_id. This field is required by the database. |
| 14 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | Holds the Oracle user-id of the user who most recently updated this record. This field is required by the database. |
| 15 | PRICE_CHANGE_EFF_DATE |  |  |  | Date | This column will be populated by a price change ticket API if tickets are to be printed on price change. This column will hold the effective date for the price change. |
| 16 | PRICE_CHANGE_ID |  |  |  | NUMERIC (15) | This column will be populated by a price change ticket API if tickets are to be printed on price change. This column will hold the ID of the price change. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|TICKET_REQUEST_I1|||||ITEM|ASC|
||||||TICKET_TYPE_ID|ASC|
|TICKET_REQUEST_I2|||||TICKET_TYPE_ID|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_TICKET_REQ_PRINT_ONLIN_IND|print_online_ind in ('Y','N')<br>|
|Column Level|PRINT_ONLINE_IND||

---

## Table: TICKET_TYPE_DETAIL

**Description:** This field contains one row for each item which will be on the ticket (i.e. SKU number, UPC, retail price).

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TICKET_TYPE_ID | P | F | Y | VARCHAR (4) | This field contains a character string which uniquely identifies the ticket type and ties it to the appropriate TICKET_TYPE_HEAD record. |
| 2 | SEQ_NO | P |  | Y | NUMERIC (4) | This field contains a number which along with the TICKET_TYPE_ID will make up the primary key for this table. A sequence number is required on this table because TICKET_TYPE_ID, TICKET_ITEM_ID, and UDA_ID, the fields that make a row unique, can have NULL values in both TICKET_ITEM_ID and UDA_ID. A unique index has been placed on these three items. |
| 3 | TICKET_ITEM_ID |  |  |  | VARCHAR (4) | This field contains a character string which uniquely identifies an attribute which will appear on a ticket or label such as retail price or price per unit of measure. Valid values for this field will come from the CODE_DETAIL table with CODE_TYPE = TCKT. |
| 4 | UDA_ID |  | F |  | NUMERIC (5) | This field contains a number which uniquely defines a user-defined attribute which is to be printed on this ticket type. Valid values for this field come from the UDA table. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_TICKET_TYPE_DETAIL|PK||||TICKET_TYPE_ID|ASC|
||||||SEQ_NO|ASC|
|TICKET_TYPE_DETAIL_I1|UN||||TICKET_TYPE_ID|ASC|
||||||TICKET_ITEM_ID|ASC|
||||||UDA_ID|ASC|
|TICKET_TYPE_DETAIL_I2|||||UDA_ID|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_TICKET_TYPE_DETAIL_ITEM_ID|TICKET_ITEM_ID<br>IN ('ITEM', 'ITDS', 'ITSD', 'VAR', 'DIF1', 'DIF2', 'DIF3','DIF4',<br>'WGHT', 'DEPT', 'CLSS', 'SBCL', 'RTPC', 'SRTP', 'MUPC', 'SUPR', 'SUP1'<br>, 'SUP2', 'SUP3','SUP4','STRE', 'WHSE', 'COOG', 'UOM', 'ITPR', 'IPDS'<br>, 'EURO','NETV','DPST','DTOT')<br>|






|Type|Column / Constraint Name|Details|
|---|---|---|
|Column Level|TICKET_ITEM_ID||

---

## Table: TICKET_TYPE_HEAD

**Description:** This table will contain one row for each ticket type that exists in the system.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TICKET_TYPE_ID | P |  | Y | VARCHAR (4) | This field contains a character string which uniquely identifies the ticket or label type. |
| 2 | TICKET_TYPE_DESC |  |  | Y | VARCHAR (120) | This field contains a description of the ticket or label type. |
| 3 | SEL_IND |  |  | Y | VARCHAR (1) | Indicates if the ticket type is a shelf edge label. |
| 4 | FILTER_ORG_ID |  |  |  | NUMERIC (10) | The ID of the Organizational Hierarchy that the Ticket Type is assigned to. This field will be used to control the Ticket Types a user can see in the Ticket Type LOV when the link between the user and the Organizational Hierarchy has been established. |
| 5 | FILTER_MERCH_ID |  |  |  | NUMERIC (4) | The ID of the Merchandise Hierarchy that the Ticket Type is assigned to. This field will be used to control the Ticket Types a user can see in the Ticket Type LOV when the link between the user and the Merchandise Hierarchy has been established. |
| 6 | FILTER_MERCH_ID_CLASS |  |  |  | NUMERIC (4) | The class ID of the merchandise hierarchy that the ticket type is assigned to. |
| 7 | FILTER_MERCH_ID_SUBCLASS |  |  |  | NUMERIC (4) | The sublass ID of the merchandise hierarchy that the ticket type is assigned to. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_TICKET_TYPE_HEAD|PK||||TICKET_TYPE_ID|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_TICKET_TYPE_HEAD_SEL_IND|(SEL_IND in ('Y', 'N'))<br>|
|Column Level|SEL_IND||

---

## Table: TICKET_TYPE_HEAD_TL

**Description:** This is the translation table for TICKET_TYPE_HEAD table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | TICKET_TYPE_ID | P | F | Y | VARCHAR (4) | This field contains a character string which uniquely identifies the ticket or label type. |
| 3 | TICKET_TYPE_DESC |  |  | Y | VARCHAR (120) | This field contains a description of the ticket or label type. |
| 4 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 6 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 7 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_TICKET_TYPE_HEAD_TL|PK||||LANG|ASC|
||||||TICKET_TYPE_ID|ASC|
