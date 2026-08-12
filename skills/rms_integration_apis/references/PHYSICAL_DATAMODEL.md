# RMS Integration APIs & RIB Interfaces Datamodel - Physical Data Model Reference

## Table: API_ALLOC_INFO_TEMP

**Description:** This table temporarily holds allocation information to improve performance.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM | P |  | Y | VARCHAR (25) | item allocating |
| 2 | LOC | P |  | Y | NUMERIC (10) | This column contains the location that the item is being allocated to. |
| 3 | QTY |  |  |  | NUMERIC (12,4) | This column contains the the quantity of the item that is allocated to the location. |
| 4 | CURRENCY_CODE |  |  |  | VARCHAR (3) | This column identifies the location currency. |

---

## Table: API_ISCL

**Description:** This table will aid in API processing of item_supplier_country and item_supplier_country_loc records.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ISCL_ROWID |  |  |  | ROWID | Contains the rowid of the item supplier country location record |
| 2 | ITEM |  |  |  | VARCHAR (25) | Contains the item number |
| 3 | LOC |  |  |  | NUMERIC (10) | Contains the location number |
| 4 | PRIMARY_LOC_IND |  |  |  | VARCHAR (1) | Indicates if this is the primary location for the item |
| 5 | SEQ_NO |  |  |  | NUMERIC (10) | This column stores the sequence of message consumption. |

---

## Table: API_ITEM

**Description:** This table is used to store queried items instead of using the ITEM_MASTER table to join with other tables for API processing.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  |  |  | VARCHAR (25) | This column contains the alphanumeric value that identifies the item of the queried item. |
| 2 | SEQ_NO |  |  |  | NUMERIC (10) | This column stores the sequence of message consumption for the queried item. |

---

## Table: API_ITEM_LOC_TEMP

**Description:** This is a global temporary table that contains item/location information for API processing. The data in this table only exists for the duration of the session.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  |  | Y | VARCHAR (25) | This column contains the alphanumeric value that identifies the item. |
| 2 | LOC |  |  | Y | NUMERIC (10) | This column contains the location number the item is associated with. |
| 3 | UNIT_RETAIL |  |  |  | NUMERIC (20,4) | This column contains the unit retail or unit retail change for item/location combination. |
| 4 | CURRENCY_CODE |  |  |  | VARCHAR (3) | This column contains the currency code for the location. |

---

## Table: API_ITEM_TEMP

**Description:** This temporary table is used to store queried items instead of using the ITEM_MASTER table to append with other tables for API processing.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  |  |  | VARCHAR (25) | This column contains the alphanumeric value that identifies the item of the queried item. |

---

## Table: API_LOC_TEMP

**Description:** This temporary table holds all the locations that result from the organization hierarchy values sent in the API message. This table is used to append with other tables to retrieve data needed for the API.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LOC |  |  |  | NUMERIC (10) | This column contains the number that uniquely identifies the location for locations sent in the API message. |

---

## Table: API_ORIG_RETAIL_TEMP

**Description:** This is a global temporary table that stores original unit retail for item/loc. The data is deleted upon commit.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM | P |  | Y | VARCHAR (25) | This column contains the item number. |
| 2 | LOC | P |  | Y | NUMERIC (10) | This column contains the location number. |
| 3 | UNIT_RETAIL |  |  | Y | NUMERIC (20,4) | This column contains the original unit retail of the item/location. |

---

## Table: API_PC_TEMP

**Description:** This is a global temporary table. The data is deleted upon commit.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SEQ_NO |  |  |  | NUMERIC (10) | A sequence number for the records on the temporary table. |
| 2 | TRAN_TYPE |  |  |  | NUMERIC (2) | Contains a code number which indicates the type of transaction which caused the price change. |
| 3 | REASON |  |  |  | NUMERIC (6) | Holds the reason for the price change. |
| 4 | EVENT |  |  |  | VARCHAR (6) | Holds the promotion event for the price change. |
| 5 | ITEM |  |  |  | VARCHAR (25) | The item associated with the price change. |
| 6 | DEPT |  |  |  | NUMERIC (4) | Holds the department of the item on the price change. |
| 7 | CLASS |  |  |  | NUMERIC (4) | The class of the item associated with the price change. |
| 8 | SUBCLASS |  |  |  | NUMERIC (4) | The subclass of the item associated with the price change. |
| 9 | LOC |  |  |  | NUMERIC (10) | The location associated with the price change. |
| 10 | LOC_TYPE |  |  |  | VARCHAR (1) | Holds the location type of the location on the price change. |
| 11 | UNIT_COST |  |  |  | NUMERIC (20,4) | Holds the unit cost for the item-locations primary supplier and primary country. |
| 12 | CURR_UNIT_RETAIL |  |  |  | NUMERIC (20,4) | Holds the current unit retail for the item location. |
| 13 | STD_UNIT_RETAIL |  |  |  | NUMERIC (20,4) | Holds the new standard unit retail for the item location after the price change. |
| 14 | SELLING_UNIT_RETAIL |  |  |  | NUMERIC (20,4) | Holds the new selling unit retail for the item location after the price change. |
| 15 | SELLING_UOM |  |  |  | VARCHAR (4) | Holds the unit measure of the selling unit retails. |
| 16 | PROMO_RETAIL |  |  |  | NUMERIC (20,4) | Holds the promotional retail of the item location. |
| 17 | PROMO_SELLING_RETAIL |  |  |  | NUMERIC (20,4) | Holds the new promotional selling retail for the item location after the price change. |
| 18 | PROMO_SELLING_UOM |  |  |  | VARCHAR (4) | Holds the promotional selling unit of measure of the item location. |
| 19 | ACTION_DATE |  |  |  | Date | Holds the date the price change becomes effective. Default to vdate. |
| 20 | MULTI_UNITS |  |  |  | NUMERIC (12,4) | Holds the multi-units of the item location. |
| 21 | MULTI_UNIT_RETAIL |  |  |  | NUMERIC (20,4) | Holds the multi-selling retail of the item location. |
| 22 | MULTI_SELLING_UOM |  |  |  | VARCHAR (4) | Holds the multi-selling unit of measure of the item location. |
| 23 | POST_DATE |  |  |  | Date | Holds the system time the record is written. |
| 24 | PRICE_CHG_TYPE |  |  |  | VARCHAR (2) | Holds the type of price change. Valid values are: PC - permanent price change, PS - promotion start, PE - promotion end, CL - clearance, CR - clearance reset. |
| 25 | CURRENCY_CODE |  |  |  | VARCHAR (3) | Indicates the currency code of the retail values for the price change record. |
| 26 | CLEAR_IND |  |  |  | VARCHAR (1) | Indicates if the item is on clearance at the location. |
| 27 | ITEM_LOC_ROWID |  |  |  | ROWID | Holds the rowid of the item_loc. |
| 28 | PRIM_SUPP |  |  |  | NUMERIC (10) | Holds the primary supplier of the item location. |
| 29 | SUPPLIER |  |  |  | NUMERIC (10) | Holds the supplier associated with the unit cost. |
| 30 | ITEM_SOH |  |  |  | NUMERIC (12,4) | Holds the current stock level of the item at the location. |
| 31 | ON_CLEARANCE |  |  |  | VARCHAR (1) | Indicates whether the item is currently on clearance at the location. |
| 32 | CHANGE_TYPE |  |  |  | NUMERIC (1) | Contains the Price change type - by percent or by amount or fixed price |

---

## Table: API_PRICE_CHANGE_TEMP

**Description:** This global temporary table is used for storing item location information for price change API.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM | P |  | Y | VARCHAR (25) | This column contains the item number. |
| 2 | ZONE_ID | P |  | Y | NUMERIC (10) | This column contains the price zone ID. For the price change API, it is the same as location number. |
| 3 | UNIT_RETAIL |  |  |  | NUMERIC (20,4) | This column contains the items current unit retail at the location. |
| 4 | IZP_ROWID |  |  |  | ROWID | This column contains the row ID of the item_zone_price. |
| 5 | PARENT_IND |  |  |  | VARCHAR (1) | This column indicates if the item is a parent item. |

---

## Table: API_PRICE_HIST

**Description:** A table to contain price history details to aid processing updates and inserts to the price history table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM | P |  | Y | VARCHAR (25) | Uniquely identifies the item number. |
| 2 | LOC | P |  | Y | NUMERIC (10) | Uniquely identifies the location. |
| 3 | SEQ_NO | P |  | Y | NUMERIC (10) | Contains the number that uniquely identifies the transaction created by the external system. |
| 4 | LOC_TYPE |  |  |  | VARCHAR (1) | Identifies the location type |
| 5 | UNIT_COST |  |  |  | NUMERIC (20,4) | This field holds the primary supplier cost |
| 6 | UNIT_RETAIL |  |  |  | NUMERIC (20,4) | Contains the current single unit retail in the standard unit of measure. |

---

## Table: API_PRICE_HIST_TEMP

**Description:** This is a temporary table that contains price history details to aid processing updates and inserts to the price history table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM | P |  | Y | VARCHAR (25) | This column identifies the unique alphanumeric value for the transaction-level item. |
| 2 | LOC | P |  | Y | NUMERIC (10) | This column contains the number that uniquely identifies the location |
| 3 | LOC_TYPE |  |  |  | VARCHAR (1) | This column identifies the location type. |
| 4 | UNIT_COST |  |  |  | NUMERIC (20,4) | This column contains the primary supplier cost. |
| 5 | UNIT_RETAIL |  |  |  | NUMERIC (20,4) | This column contains the current single unit retail in the standard unit of measure. |

---

## Table: API_VAT_TEMP

**Description:** This is a global temporary table for storing vat_rates for an item/location. The records are deleted upon commit.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM | P |  | Y | VARCHAR (25) | This column contains the item number. |
| 2 | LOC | P |  | Y | NUMERIC (10) | This column contains the location number. |
| 3 | VAT_RATE |  |  |  | NUMERIC (20,10) | This column contains the VAT rate for the item/location. |

---

## Table: CORESVC_COSTCHG_CHUNKS

**Description:** This table is used to contain information about chunks that are used to process costchange service data.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | The process Id to which the chunk belongs. |
| 2 | CHUNK_ID | P |  | Y | NUMERIC (10) | The unique ID for each chunk. |
| 3 | COST_CHANGE_COUNT |  |  | Y | NUMERIC (10) | The count of cost-changes which are part of this chunk. Informational only. |
| 4 | STATUS |  |  | Y | VARCHAR (5) | The processing status of the chunk. |

---

## Table: CORESVC_COSTCHG_CONFIG

**Description:** This is the configuration table for cost change service. This table always contains one and only one record.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | MAX_CHUNK_SIZE |  |  | Y | NUMERIC (10) | The maximum number of cost-changes that should be processed in one chunk. |
| 2 | VARIANCE_COMPARISON_BASIS |  |  | Y | VARCHAR (1 ) | The basis by which the variance between the new and old unit cost is compared against the supplier's set limits. Valid values are Both (B) - new cost must fall within both percent and dollar variance of the old cost, Either (E) - new cost must fall within either percent or dollar variance of the old cost, Dollar (D) - new cost must fall within dollar |

---

## Table: CORESVC_COSTCHG_ERR

**Description:** This table contains errors encountered while processing cost changes through item induction module.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC | The process Id to which this error belongs. |
| 2 | ERROR_SEQ | P |  | Y | NUMERIC | Unique sequence number for each error. |
| 3 | CHUNK_ID |  |  | Y | NUMERIC | The chunk Id to which this error belongs. |
| 4 | TABLE_NAME |  |  | Y | VARCHAR (255) | The cost change service staging table-name to which the error belongs. |
| 5 | ROW_SEQ |  |  | Y | NUMERIC | The row_seq for the staging table row. Helps to locate the row that has the error. |
| 6 | COLUMN_NAME |  |  |  | VARCHAR (255) | The column key for the error. Maps to s9t_tmpl_cols_def.column_key. |
| 7 | ERROR_MSG |  |  | Y | VARCHAR (4000) | The error message. |
| 8 | ITEM |  |  |  | VARCHAR (25) | The item to which the error belongs. |
| 9 | SUPPLIER |  |  |  | NUMERIC (10) | The supplier to which error belongs. |
| 10 | COUNTRY_ID |  |  |  | VARCHAR (3) | The country to which the error belongs. |
| 11 | ERROR_TYPE |  |  |  | VARCHAR (6 ) | Represents Issue Type, describing the Issue is of the type ERROR or WARNING. |

---

## Table: CORESVC_ERROR_MAPPING

**Description:** This table contains the core and staging table names. It is used in Admin API upload error view.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TABLE_NAME |  |  |  | VARCHAR (250 ) | Contains the core table name. |
| 2 | SVC_TABLE_NAME |  |  |  | VARCHAR (250 ) | Contains the staging table name of core table. |

---

## Table: CORESVC_ITEM_CONFIG

**Description:** This is the configuration table for item induction core service. This will always contain one and only one record.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | MAX_CHUNK_SIZE |  |  | Y | NUMERIC (10) | The maximum number of items that should be processed in one chunk. |
| 2 | PROC_ERR_RETENTION_DAYS |  |  | Y | NUMERIC (5) | Number of days the errors for a process should be retained before purge. |
| 3 | CASCADE_UDA_DETAILS |  |  | Y | VARCHAR (1 ) | This field indicates whether the inserts, updates or deletes on uda details should be cascaded to the child items or not. |
| 4 | CASCADE_IUD_ITEM_SUPP_COUNTRY |  |  | Y | VARCHAR (1 ) | This field indicates whether the inserts, updates or deletes on item/supplier/country and item/supplier/country/loc details should be cascaded to the child items or not |
| 5 | CASCADE_IUD_ISC_DIMENSIONS |  |  | Y | VARCHAR (1 ) | This field indicates whether the inserts, updates or deletes on item/supplier/country/dimension details should be cascaded to the child items or not. |
| 6 | CASCADE_IUD_ISMC |  |  | Y | VARCHAR (1 ) | This field indicates whether the inserts, updates or deletes on item/supplier/manufacturing country details should be cascaded to the child items or not. |
| 7 | ISC_UPDATE_ALL_LOCS |  |  | Y | VARCHAR (1 ) | This field indicates whether the updated default location information should be cascaded to all locations for the item/supplier/country relationship or not. |
| 8 | ISC_UPDATE_ALL_CHILD_LOCS |  |  | Y | VARCHAR (1 ) | This field indicates whether the updated default locaiton ifnormation should be cascaded to all child item locations for the item/supplier/country relationship or not. |
| 9 | CASCADE_VAT_ITEM |  |  | Y | VARCHAR (1 ) | This field indicates whether the inserts or deletes of item VAT information should be cascaded to the child items or not. |
| 10 | MAX_THREADS |  |  | Y | NUMERIC (10) | This is the maximum number of threads that should be spawned for coresvc_item package. |
| 11 | WAIT_BTWN_THREADS |  |  | Y | NUMERIC (10) | This is the number of milliseconds between submission of two threads. |
| 12 | CASCADE_IIM_DETAILS |  |  | Y | VARCHAR (1 BYTE) | This field will indicate whether child(ren)/grandchild(ren) record(s) is(are) will inherit the parent/grandparent image record(s). Valid values are Y and N only. Default to N value if left blank or set as NULL. |
| 13 | MAX_ITEM_RESV_QTY |  |  |  | NUMERIC (4) | The maximum number of item numbers that can be reserved. |
| 14 | MAX_ITEM_EXPIRY_DAYS |  |  |  | NUMERIC (4) | The number of days before the reserved item number expires. |
| 15 | CASCADE_IUD_ITEM_SUPPLIER |  |  | Y | VARCHAR (1 ) | This field indicates whether the inserts, updates or deletes on item/supplier details should be cascaded to the child items or not. |
| 16 | DEFAULT_ALL_LOCS_ISCL |  |  | Y | VARCHAR (1 ) | This indicates whether all ranged locations should be defaulted to supplier/countries or not upon the uploading an Item-Supplier-Country record into RMS.If 'Y' default all locations ranged otherwise locations passed in file/xml would be defaulted. |

---

## Table: CORESVC_ITEM_ERR

**Description:** This table contains errors encountered while processing item maintenance through item induction module.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC | The process Id to which this error belongs. |
| 2 | ERROR_SEQ | P |  | Y | NUMERIC | Unique sequence number for each error. |
| 3 | CHUNK_ID |  |  | Y | NUMERIC | The chunk Id to which this error belongs. |
| 4 | TABLE_NAME |  |  | Y | VARCHAR (255) | The cost change service staging table-name to which the error belongs. |
| 5 | ROW_SEQ |  |  | Y | NUMERIC | The row_seq for the staging table row. Helps to locate the row that has the error. |
| 6 | COLUMN_NAME |  |  |  | VARCHAR (255) | The column key for the error. Maps to s9t_tmpl_cols_def.column_key. |
| 7 | ERROR_MSG |  |  | Y | VARCHAR (4000) | The error message. |
| 8 | ITEM |  |  |  | VARCHAR (25) | The item to which the error belongs. |
| 9 | SUPPLIER |  |  |  | NUMERIC (10) | The supplier to which error belongs. |
| 10 | COUNTRY_ID |  |  |  | VARCHAR (3) | The country to which the error belongs. |
| 11 | ERROR_TYPE |  |  |  | VARCHAR (6 ) | Represents Issue Type, describing the Issue is of the type ERROR or WARNING. |
| 12 | LOC |  |  |  | NUMERIC (10) | The Location to which error belongs. |

---

## Table: CORESVC_PO_CHUNKS

**Description:** This table holds the chunking information for the PO Induction tables.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC (10) | The process ID to which the chunk belongs. |
| 2 | CHUNK_ID | P |  | Y | NUMERIC (10) | The unique ID for each chunk. |
| 3 | ORDER_COUNT |  |  | Y | NUMERIC (10) | The count of order numbers which are part of this chunk. Informational only. |
| 4 | STATUS |  |  | Y | VARCHAR (5 ) | The processing status of the chunk. |

---

## Table: CORESVC_PO_ERR

**Description:** This table contains error or warning messages from PO data which were not uploaded successfully via the PO API module. It also contains the warning messages as well as PO approval errors from the induction process.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROCESS_ID | P |  | Y | NUMERIC | The process ID to which this error belongs. |
| 2 | ERROR_SEQ | P |  | Y | NUMERIC | The order by which the errors were logged. |
| 3 | CHUNK_ID |  |  | Y | NUMERIC | The chunk ID to which this error belongs. |
| 4 | TABLE_NAME |  |  | Y | VARCHAR (255 ) | The PO staging table name to which the error belongs. |
| 5 | ROW_SEQ |  |  | Y | NUMERIC | The row_seq for the staging table row. Helps to locate the row that has the error. |
| 6 | COLUMN_NAME |  |  |  | VARCHAR (255 ) | The column key for the error. Maps to s9t_tmpl_cols_def.column_key. |
| 7 | ERROR_MSG |  |  | Y | VARCHAR (4000 ) | The error or warning message. |
| 8 | ORDER_NO |  |  |  | NUMERIC (12) | The order number associated with the record containing the error or warning. |
| 9 | ITEM |  |  |  | VARCHAR (25 ) | The item associated with the record containing the error or warning. |
| 10 | SUPPLIER |  |  |  | NUMERIC (10) | The supplier number associated with the record containing the error or warning. |
| 11 | LOCATION |  |  |  | NUMERIC (10) | The location associated with the record containing the error or warning. |
| 12 | ERROR_TYPE |  |  |  | VARCHAR (6 ) | Represents Issue Type, describing the Issue is of the type ERROR or WARN |

---

## Table: DATA_EXPORT_HIST

**Description:** This table is used to track the history of full and delta export runs.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | FAMILY |  |  | Y | VARCHAR (20 ) | Contains which export is run. |
| 2 | EXPORT_TYPE |  |  | Y | VARCHAR (5 ) | Contains the type of export that was run. Valid values are â€˜fullâ€™ and â€˜deltaâ€™ Contains the type of export that was run. Valid values are 'full' and 'delta' |
| 3 | EXPORT_ID |  |  | Y | VARCHAR (30 ) | Contains the user who ran the export. |
| 4 | EXPORTED_DATETIME |  |  | Y | Date | Time of export. |

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_DATA_EXPORT_HIST_EXP_TYPE|EXPORT_TYPE IN ('FULL', 'DELTA')<br>|

---

## Table: EDI_DAILY_SALES

**Description:** This table holds daily sales information and an inventory snapshot of items used by the EDI Daily Sales and Stock on Hand Report download (EDI852) from RMS, which is transmitted to the suppliers of the items. The sales quantities in this table are regular sales of items at the location by transaction date. Records are purged from this table according to the EDI_DAILY_RPT_LAG indicator on system options.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM | P | F | Y | VARCHAR (25) | This field contains the unique identifier representing the item in the system. |
| 2 | LOC | P |  | Y | NUMERIC (10) | This field contains the unique identifier for the location where the transaction related to item has taken place. This field may contain a store or a warehouse. |
| 3 | LOC_TYPE | P |  | Y | VARCHAR (1) | This field contains the type of location in the location field. Valid values for this field are: S - Store W - Warehouse |
| 4 | TRAN_DATE | P |  | Y | Date | This field contains the transaction date for which the data applies. |
| 5 | SALES_QTY |  |  | Y | NUMERIC (12,4) | This field contains the quantity of items sold at the location for the specified date. Only stores will have sales data. |
| 6 | STOCK_ON_HAND |  |  | Y | NUMERIC (12,4) | This field contains the snapshot of stock on hand at the location for the specified date. |
| 7 | IN_TRANSIT_QTY |  |  | Y | NUMERIC (12,4) | This field contains the snapshot of stock that is in transit to this location for the specified date. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_EDI_DAILY_SALES|PK||||ITEM|ASC|
||||||LOC|ASC|
||||||LOC_TYPE|ASC|
||||||TRAN_DATE|ASC|

---

## Table: EDI_ORD_TEMP

**Description:** This table is used during the process of creating orders that are generated by a vendors replenishment system and passed to the system via EDI. The batch program EDI855 gathers information from the EDI855 file and the Oracle Retail system, and inserts rows into this table. The batch program VRPLBLD uses the information to generate Oracle Retail system orders that may be viewed using the form ORDHEAD. This table is cleared by EDI855 by deleting all rows during startup.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SUPPLIER | P |  | Y | NUMERIC (10) | Contains the number indicating which supplier has generated an order containing this SKU. |
| 2 | ITEM | P |  | Y | VARCHAR (25) | This field contains the unique number representing the item in the system that is being ordered. |
| 3 | REF_ITEM |  |  |  | VARCHAR (25) | This field contains reference item number that is being ordered by a vendor generated order. For example: UPC. |
| 4 | WH_OR_STORE_C | P |  | Y | NUMERIC (1) | Indicator used to determine if the order location is a store or warehouse. The number 1 is used to indicate a store and 0 indicates a warehouse. |
| 5 | WH_OR_STORE | P |  | Y | NUMERIC (10) | Location to which an order for the SKU is being generated. Vendor generated orders are written to this table at the physical level by ediupack. Later, vrplbld distributes these orders to the appropriate virtuals. |
| 6 | VENDOR_ORDER_NO | P |  | Y | VARCHAR (15) | The unique identifying number created by the vendor to identify the vendor generated order. |
| 7 | DEPT |  |  | Y | NUMERIC (4) | Contains the SKUs associated department number. |
| 8 | UNIT_COST |  |  | Y | NUMERIC (20,4) | Contains the order cost per unit for this SKU / location combination. This field is stored in the suppliers currency. |
| 9 | UNIT_RETAIL |  |  | Y | NUMERIC (20,4) | Contains the base unit retail for the SKU being ordered. This field is stored in the local currency. |
| 10 | ITEM_DESC |  |  | Y | VARCHAR (250) | This field contains the requested item description as sent by the supplier. |
| 11 | QTY_ORDERED |  |  | Y | NUMERIC (12,4) | Contains the number of units that will be ordered for the SKU / location combination. |
| 12 | PURCHASE_TYPE |  |  |  | VARCHAR (6) | Indicates what is included in the suppliers cost of the item on the order. Valid values include Delivered, Free on Board (FOB), or Backhaul. Valid values can be found on the codes table with a code type of PURT. |
| 13 | PICKUP_LOC |  |  |  | VARCHAR (250) | Contains the location at which the order will be picked up, if the order is a Pickup order. |
| 14 | PICKUP_DATE |  |  |  | Date | Contains the date when the order can be picked up from the Supplier. This field is only required if the Purchase Type of the order is Pickup and the status is Submitted or Approved. |
| 15 | WRITTEN_DATE |  |  | Y | Date | Contains the date when the order originated. |
| 16 | NOT_BEFORE_DATE |  |  | Y | Date | The ordered SKU will not be received before this date. |
| 17 | NOT_AFTER_DATE |  |  | Y | Date | The ordered SKU will not be received after this date. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_EDI_ORD_TEMP|PK||||SUPPLIER|ASC|
||||||ITEM|ASC|
||||||WH_OR_STORE_C|ASC|
||||||WH_OR_STORE|ASC|
||||||VENDOR_ORDER_NO|ASC|

---

## Table: EDI_SUPS_TEMP

**Description:** This is a temporary table that holds edi supplier information. It is used to improve the performance of batch edidlprd.pc.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SUPPLIER | P |  | Y | NUMERIC (10) | The supplier number. |

---

## Table: RCA_REJECT

**Description:** Staging Table RCA_TEMP that will hold RCAs coming from ReIM - it is populated from a trigger on the RCA table in ReIM.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ORDER_NO |  |  | Y | NUMERIC (12) | Field that identifies the Order Number that the cost adjustment is being made against. |
| 2 | ITEM_NO |  |  | Y | VARCHAR (25) | Item Number of item beinf received. |
| 3 | LOCATION |  |  |  | NUMERIC (10) | Field that holds the location that the cost adjustment is being made against (may not always be available). |
| 4 | REJECT_REASON |  |  | Y | VARCHAR (25) | Reason that the record has been rejected (i.e. Locaked quantities dont match). |

---

## Table: RCA_RIB_INTERFACE

**Description:** Staging Table that will hold RUA?s that will need to be picked up by the RIB interface to SIM

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SEQ_NO | P |  | Y | NUMERIC (15) | Unique Identifier of the record. |
| 2 | ORDER_NO |  |  | Y | NUMERIC (12) | Field that identifies the Order number that the unit adjustment is being made against. |
| 3 | ASN |  |  |  | VARCHAR (30) | The Advance Shipping Notice Identifier of the Shipment. |
| 4 | LOCATION |  |  | Y | NUMERIC (10) | Location that the RUA is being adjusted for. |
| 5 | LOC_TYPE |  |  | Y | VARCHAR (1) | Location Type either S or |
| 6 | ITEM |  |  | Y | VARCHAR (25) | Item that the RUA is being made for. |
| 7 | CARTON |  |  |  | VARCHAR (20) | Carton from the shipment, only populated if it available. |
| 8 | ADJ_QTY |  |  | Y | NUMERIC (12,4) | The Quantity that the adjustment is being made for. |
| 9 | PGM_NAME |  |  | Y | VARCHAR (100) | Source where the RUA came from. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_RCA_RIB_INTERFACE|PK||||SEQ_NO|ASC|

---

## Table: RTK_ERRORS

**Description:** This table contains one row for each error message used on the client side in the system. This table is populated during installation of the system and must be maintained by the database administrator.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | RTK_TYPE |  |  | Y | VARCHAR (2) | This column will represent the type of error that each key and message is describing. Valid values are BL - business logic, OR - API sequencing |
| 2 | RTK_KEY | P |  | Y | VARCHAR (25) | Contains a key that will be used to access an error message from a form. This key is used to call the message from inside the emessage or F_YES_NO message. Example: emessage(INV_SKU); |
| 3 | RTK_TEXT |  |  | Y | VARCHAR (255) | Contains the actual text of the message. This text will be written to the screen when the message box appears. |
| 4 | RTK_USER |  |  | Y | VARCHAR (30) | Contains the user name or the initials of the person who created the message. |
| 5 | RTK_APPROVED |  |  | Y | VARCHAR (1) | Indicates whether or not the message has been approved. Valid values are: Y or N. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_RTK_ERRORS|PK||||RTK_KEY|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_RTK_ERRORS_RTK_APPROVED|RTK_APPROVED IN('Y', 'N')<br>|
||CHK_RTK_ERRORS_RKT_TYPE|RTK_TYPE IN ('BL', 'LK', 'OR', 'OE','SY','FE')<br>|
|Column Level|RTK_TYPE||
||RTK_APPROVED||

---

## Table: RTK_ERRORS_TL

**Description:** This is the translation table for RTK_ERRORS table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | RTK_KEY | P | F | Y | VARCHAR (25) | Contains a key for the erorr message. |
| 3 | RTK_TEXT |  |  | Y | VARCHAR (255) | Contains the actual text of the message. |
| 4 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 6 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 7 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_RTK_ERRORS_TL|PK||||LANG|ASC|
||||||RTK_KEY|ASC|

---

## Table: RTK_ROLE_PRIVS

**Description:** This table can contain one row for each role set-up in Oracle. If a role is on this table, then the information specified on this table will be used for application security in various parts of Oracle Retail. Only the database administrator should have access to this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ROLE | P |  | Y | VARCHAR (30<br>BYTE) | This field contains the Oracle role for which the record will pertain to. |
| 2 | ORD_APPR_AMT |  |  |  | NUMERIC<br>(20,4) | This field contains the upper limit that the role is able to approve on an order. If not defined, then the role can approve any order amount. This value is expressed in primary currency. |
| 3 | CREATE_ID |  |  | Y | VARCHAR (30<br>BYTE) | This column holds the User id of the user who created the record. |
| 4 | CREATE_DATETIME |  |  | Y | Date (7) | This column holds the record creation date. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_RTK_ROLE_PRIVS|PK||||ROLE|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_RTK_ROLE_PRIVS_TSF_APPR_IN|TSF_APPR_IND IN ('Y', 'N')<br>|

---

## Table: RUA_MFQUEUE

**Description:** This table is a staging table for receiver unit adjustment (RUA) messages as they wait to be sent published to the RIB.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SEQ_NO | P |  | Y | NUMERIC (15) | This field contains the sequence in which the record was placed in the table. It is used to order the publication of messages to the RIB. |
| 2 | ORDER_NO |  |  |  | NUMERIC (12) | This field contains the unique identifier for the order against which a receiver unit adjustment was performed. |
| 3 | ASN |  |  |  | VARCHAR (30) | This field contains the advanced shipment notification number associated with the shipment for which a receiver unit adjustment was performed. |
| 4 | LOCATION |  |  |  | NUMERIC (10) | This field contains the unique identifier for the location for which the RUA is performed. The location will be a store if LOC_TYPE is S, a Warehouse if LOC_TYPE is W. |
| 5 | LOC_TYPE |  |  |  | VARCHAR (1) | This field contains the type of the location for which the RUA is performed. Possible values are The location will be a store - S, a Warehouse - W. |
| 6 | ITEM |  |  |  | VARCHAR (25) | This field contains the unique identifier for the item that the receiver unit adjustment was performed against. |
| 7 | CARTON |  |  |  | VARCHAR (20) | This field contains the unique identifier for the carton that contained the item against which the receiver unit adjustment was performed. |
| 8 | ADJ_QTY |  |  |  | NUMERIC (12,4) | This field contains the quantity of the item adjusted during receiver unit adjustment. |
| 9 | MESSAGE_TYPE |  |  | Y | VARCHAR (15) | This field describes the action in RMS that is causing the message to be published to the RIB. |
| 10 | THREAD_NO |  |  |  | NUMERIC (4) | This field contains the thread on which the business transaction will be published. Each business object has one and only one thread_no. |
| 11 | FAMILY |  |  | Y | VARCHAR (30) | This field contains the functional area that this transaction belongs to. |
| 12 | CUSTOM_MESSAGE_TYPE |  |  |  | VARCHAR (1) | Not used by RMS. |
| 13 | PUB_STATUS |  |  | Y | VARCHAR (1) | This field contains the publication status of the RUA transaction. It is set to Unpublished upon insertion into the table. Will be set to Hospital if a non-fatal error is encountered during the publication process and will be Published once it is published to RIB. |
| 14 | TRANSACTION_NUMBER |  |  |  | NUMERIC (10) | This field contains the unique identifier for the RIB transaction. |
| 15 | TRANSACTION_TIME_STAMP |  |  |  | Date | This field contains the time at which the record is created in this table. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_RUA_MFQUEUE|PK||||SEQ_NO|ASC|

---

## Table: RUA_REJECT

**Description:** This table will hold the RUA transactions which are rejected by RMS.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SHIPMENT |  |  | Y | NUMERIC (12) | This field identifies the Shipment Number in RMS system associated with the RUA. |
| 2 | ITEM_NO |  |  | Y | VARCHAR (25) | This field contains the unique identifier for the Item on the receipt. |
| 3 | CORRECTED_QTY |  |  | Y | NUMERIC (12,4) | This field contains the number of units for which the receipt was corrected. |
| 4 | REJECT_REASON |  |  | Y | VARCHAR (40) | This field contains the reason why record has been rejected (i.e. locked quantities dont match). |

---

## Table: RUA_RIB_INTERFACE

**Description:** This is a staging table that holds the RUA transactions that originated in RMS and will be sent to SIM. The records on this table indicate the adjustments that need to be picked up by the RIB interface to SIM.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SEQ_NO |  |  | Y | NUMERIC (15) | This field contains the sequence in which the record was placed in the table. It is used to order the publication of messages to the RIB. |
| 2 | ORDER_NO |  |  | Y | NUMERIC (12) | This field contains the unique identifier for the order against which a receiver unit adjustment was performed. |
| 3 | ASN |  |  |  | VARCHAR (30) | This field contains the advanced shipment notification number associated with the shipment for which a receiver unit adjustment was performed. |
| 4 | LOCATION |  |  | Y | NUMERIC (10) | This field contains the unique identifier for the location for which the RUA is performed. The location will be a store if Location type is S, a Warehouse if Location type is W. |
| 5 | LOC_TYPE |  |  | Y | VARCHAR (1) | This field contains the type of the location for which the RUA is performed. Possible values are The location will be a store - S, a Warehouse - W |
| 6 | ITEM |  |  | Y | VARCHAR (25) | This field contains the unique identifier for the item for which the RUA is being made. |
| 7 | CARTON |  |  |  | VARCHAR (20) | This field contains the unique identifier for the carton that contained the item against which the receiver unit adjustment was performed. |
| 8 | ADJ_QTY |  |  | Y | NUMERIC (12,4) | This field contains the quantity of the item adjusted during receiver unit adjustment. |
| 9 | PGM_NAME |  |  | Y | VARCHAR (100) | This field contains name of the program as a source from which the RUA came. |
